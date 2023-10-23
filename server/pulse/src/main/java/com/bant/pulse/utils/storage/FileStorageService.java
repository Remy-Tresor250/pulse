package com.bant.pulse.utils.storage;

import com.cloudinary.Cloudinary;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileStorageService {

    private final Cloudinary cloudinary;

    public String uploadImage(MultipartFile file) throws IOException {
        try{

            return cloudinary.uploader()
                    .upload(file.getBytes(), Map.of(
                            "public_id", UUID.randomUUID().toString()
                    ))
                    .get("url")
                    .toString();

        }catch (Exception error) {
            throw new IOException(error);
        }
    }

}
