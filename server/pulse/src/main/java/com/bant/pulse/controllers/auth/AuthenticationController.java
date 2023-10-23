package com.bant.pulse.controllers.auth;

import com.bant.pulse.service.user.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final UserService userService;

    @PostMapping("/sign-up")
    public ResponseEntity<Map<String, String>> createUser ( @RequestBody RegisterRequest user) {
        try{
            return ResponseEntity.status(HttpStatus.CREATED).body(userService.createUser(user));
        } catch (Exception error) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new HashMap<>(){{
                put("message", "Operation failed!");
            }});
        }
    }

    @PostMapping("/sign-in")
    public ResponseEntity<Map<String, String>> authenticate (@RequestBody AuthenticateRequest requestData) {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(userService.authenticate(requestData));
        } catch (Exception error) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", "Incorrect email or password"));
        }
    }

}
