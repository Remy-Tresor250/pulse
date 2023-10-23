package com.bant.pulse.config;

import com.cloudinary.Cloudinary;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class CloudinaryConfig {

    @Value("${cloudinary.cloud_name}")
    private String CLOUD_NAME;

    @Value("${cloudinary.api_key}")
    private String API_KEY;

    @Value("${cloudinary.api_secret}")
    private String API_SECRET;

    @Bean
    public Cloudinary cloudinary() {

        final Map<String, String> config = new HashMap<>(){{
            put("cloud_name", CLOUD_NAME);
            put("api_key", API_KEY);
            put("api_secret", API_SECRET);
        }};

        return new Cloudinary(config);

    }

}
