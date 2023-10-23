package com.bant.pulse.controllers.users;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UpdateUserRequest {

    private String firstName;
    private String lastName;
    private String location;
    private String phone;
    private String email;
    private String password;

}
