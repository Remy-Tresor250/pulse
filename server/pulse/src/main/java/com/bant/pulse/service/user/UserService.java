package com.bant.pulse.service.user;

import com.bant.pulse.controllers.auth.AuthenticateRequest;
import com.bant.pulse.controllers.auth.RegisterRequest;
import com.bant.pulse.modal.user.User;
import com.bant.pulse.modal.user.UserRepository;
import com.bant.pulse.service.jwt.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
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
    private final AuthenticationManager authenticationManager;

    public Map<String, String> createUser(RegisterRequest user){
        User newUser = User.builder()
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .email(user.getEmail())
                .phone(user.getPhone())
                .location(user.getLocation())
                .password(passwordEncoder.encode(user.getPassword()))
                .build();
        userRepository.save(newUser);
        return new HashMap<>(){{
            put("message", "Successful Operation!");
        }};
    }

    public Map<String, String> authenticate (AuthenticateRequest requestData) {
        final String username = requestData.getUsername();
        final String password = requestData.getPassword();

        try{
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            username,
                            password
                    )
            );

            final User user = userRepository.findByPhone(username).orElseGet(
                    () -> userRepository.findByEmail(username).orElseThrow(
                            () -> new UsernameNotFoundException("Incorrect email or password!")
                    )
            );

            if(passwordEncoder.matches(password, user.getPassword())) {
                final String token = jwtService.generateUserToken(user);

                return Map.of("token", token);
            } else {
                throw new UsernameNotFoundException("Incorrect email or password!");
            }
        }catch (AuthenticationException error) {
            throw new BadCredentialsException("Incorrect email or password!", error);
        }
    }

}
