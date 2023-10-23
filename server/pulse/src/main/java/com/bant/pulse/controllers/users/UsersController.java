package com.bant.pulse.controllers.users;

import com.bant.pulse.service.users.UsersService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
public class UsersController {

    private final UsersService usersService;

    @GetMapping("/all")
    public ResponseEntity<Map<String, Object>> getAllUsers() {
        try {
            return ResponseEntity.status(HttpStatus.OK).body(usersService.getAllUsers());
        }catch (Exception error) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", "Operation failed!"));
        }
    }

    @DeleteMapping(path = "/delete/user/{id}")
    public ResponseEntity<Map<String, String>> deleteUser(@PathVariable(name = "id") UUID userId) {
        try{
            return ResponseEntity.status(HttpStatus.OK).body(usersService.deleteUser(userId));
        } catch (Exception error) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", "Operation failed"));
        }
    }

    @PatchMapping(path = "/update/user/{id}")
    public ResponseEntity<Map<String, String>> updateUser(@PathVariable(name = "id") UUID userId, @RequestBody UpdateUserRequest request) {
        try{
            return ResponseEntity.status(HttpStatus.OK).body(usersService.updateUser(userId, request));
        } catch (Exception error) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", "Operation failed!"));
        }
    }

}
