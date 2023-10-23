package com.bant.pulse.controllers.auth;

import lombok.*;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequest {

    @NonNull
    private String firstName;

    @NonNull
    private String lastName;

    @NonNull
    private String email;

    @NonNull
    private String location;

    @NonNull
    private String phone;

    @NonNull
    private String password;

    @NonNull
    private String profile;

}
