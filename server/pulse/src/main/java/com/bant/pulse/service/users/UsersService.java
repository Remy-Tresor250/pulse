package com.bant.pulse.service.users;

import com.bant.pulse.controllers.users.UpdateUserRequest;
import com.bant.pulse.model.user.User;
import com.bant.pulse.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class UsersService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public Map<String, Object> getAllUsers() {
        final List<User> users =  userRepository.findAll();
        return new HashMap<>(){{
            put("message", "Successful operation!");
            put("data", users);
        }};
    }

    public Map<String, String> deleteUser(UUID userId) {

        userRepository.deleteById(userId);

        return  Map.of("message", "Successful operation");

    }

    @Transactional
    public Map<String, String> updateUser(UUID userId, UpdateUserRequest request) {
        final User user = userRepository.findById(userId).orElseThrow(
                () -> new UsernameNotFoundException("user with id " + userId + " is not found!")
        );

        if(request.getFirstName() != null && !Objects.equals(request.getFirstName(), user.getFirstName())) {
            user.setFirstName(request.getFirstName());
        }

        if(request.getLastName() != null && !Objects.equals(request.getLastName(), user.getLastName())) {
            user.setLastName(request.getLastName());
        }

        if(request.getEmail() != null && !Objects.equals(request.getEmail(), user.getEmail())) {
            user.setEmail(request.getEmail());
        }

        if(request.getPhone() != null && !Objects.equals(request.getPhone(), user.getPhone())) {
            user.setPhone(request.getPhone());
        }

        if(request.getLocation() != null && !Objects.equals(request.getLocation(), user.getLocation())) {
            user.setLocation(request.getLocation());
        }

        if(request.getPassword() != null && !passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            user.setFirstName(request.getFirstName());
        }

        return Map.of("message", "Successful Operation");

    }

}
