package com.bant.pulse.service.user;

import com.bant.pulse.controllers.auth.AuthenticateRequest;
import com.bant.pulse.controllers.auth.RegisterRequest;
import com.bant.pulse.modal.user.User;
import com.bant.pulse.modal.user.UserRepository;
import com.bant.pulse.service.jwt.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;

    public String createUser(RegisterRequest user){
        User newUser = User.builder()
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .phone(user.getPhone())
                .location(user.getLocation())
                .password(passwordEncoder.encode(user.getPassword()))
                .build();
        userRepository.save(newUser);
        return "Successful operation!";
    }

    public Map<String, String> authenticate (AuthenticateRequest requestData) {
        final String username = requestData.getUsername();
        final String password = requestData.getPassword();

        final User user = userRepository.findByPhone(username).orElseGet(
                () -> userRepository.findByEmail(username).orElseThrow(
                        () -> new UsernameNotFoundException("Username with " + username + " is not found!")
                )
        );

        final String token = jwtService.generateUserToken(user);

        return new HashMap<>(){{
            put("token", token);
        }};
    }

}
