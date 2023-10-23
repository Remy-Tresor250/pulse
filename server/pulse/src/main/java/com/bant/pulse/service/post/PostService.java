package com.bant.pulse.service.post;

import com.bant.pulse.controllers.post.CreatePostRequest;
import com.bant.pulse.model.post.Post;
import com.bant.pulse.repository.PostRepository;
import com.bant.pulse.model.user.User;
import com.bant.pulse.repository.UserRepository;
import com.bant.pulse.utils.storage.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class PostService {

    private final PostRepository postRepository;
    private final UserRepository userRepository;
    private final FileStorageService fileStorageService;

    public List<Post> getAllPosts () {
        return postRepository.findAll();
    }

    public List<Post> getUserPosts (UUID userId) {
        List<UUID> userIdList = List.of(userId);
        return postRepository.findAllById(userIdList);
    }

    public Map<String, String> createPost (CreatePostRequest request, MultipartFile file, UUID userId) throws IOException {
        final String description = request.getDescription();

        final User user = userRepository.findById(userId).orElseThrow(
                () -> new UsernameNotFoundException("No user with that id: " + userId)
        );

        final String fileName = fileStorageService.uploadImage(file);

        final Post newPost = Post.builder()
                .postDescription(description)
                .picturePath(fileName)
                .user(user)
                .build();

        postRepository.save(newPost);

        return Map.of("message", "Successful operation!");
    }

}
