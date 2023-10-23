package com.bant.pulse.service.jwt;

import com.bant.pulse.model.user.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
@RequiredArgsConstructor
public class JwtService {

    @Value("${jwt.private_key}")
    private String JWT_PRIVATE_KEY;

    public Key getSignInKey () {
        byte[] keyBytes = Decoders.BASE64.decode(JWT_PRIVATE_KEY);
        return Keys.hmacShaKeyFor(keyBytes);
    }

    public Claims extractAllClaims(String token) {
        return Jwts
                .parserBuilder()
                .setSigningKey(getSignInKey())
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    public <T> T extractClaims(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    public String extractUserEmail(String token) {
        return extractClaims(token, Claims::getSubject);
    }

    private String generateToken(Map<String, Object> claims, User user) {
        return Jwts
                .builder()
                .setClaims(claims)
                .setSubject(user.getUsername())
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 24))
                .signWith(getSignInKey(), SignatureAlgorithm.HS256)
                .compact();
    }

    public   String generateUserToken(User user) {
        return generateToken(new HashMap<>() {{
            put("firstName", user.getFirstName());
            put("lastName", user.getLastName());
            put("email", user.getEmail());
            put("location", user.getLocation());
            put("profile", user.getProfile());
            put("id", user.getId());
        }}, user);
    }

    public boolean isValidToken(String token, UserDetails userDetails) {
        final String userEmail = extractUserEmail(token);
        return (userEmail.equals(userDetails.getUsername()) && !isTokenExpired(token));
    }

    public boolean isTokenExpired(String token){
        final Date expiration = extractClaims(token, Claims::getExpiration);
        return expiration.before(new Date());
    }

}
