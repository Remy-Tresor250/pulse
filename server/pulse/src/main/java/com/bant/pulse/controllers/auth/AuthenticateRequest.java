package com.bant.pulse.controllers.auth;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticateRequest {

    @NonNull
    private String username; // may be email or phone

    @NonNull
    private String password;

}
