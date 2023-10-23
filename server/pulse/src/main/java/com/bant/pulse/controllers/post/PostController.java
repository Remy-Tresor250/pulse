package com.bant.pulse.controllers.post;

import com.bant.pulse.model.post.Post;
import com.bant.pulse.service.post.PostService;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/v1/posts")
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;

    private static final String SUCCESS = "Successful operation!";
    private static final String FAILURE = "Operation Failed";

    @GetMapping("/all")
    public ResponseEntity<Map<String, Object>> getAllPosts() {
        try {
            List<Post> posts = postService.getAllPosts();
            return ResponseEntity.status(HttpStatus.OK).body(
                    new HashMap<>(){{
                        put("message", SUCCESS);
                        put("data", posts);
                    }}
            );
        } catch (Exception error) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", FAILURE));
        }
    }


    @GetMapping(path = "/user/{id}")
    public ResponseEntity<Map<String, Object>> getUserPosts(@PathVariable(name = "id") UUID userId) {
        try{
            List<Post> userPosts = postService.getUserPosts(userId);
            return ResponseEntity.status(HttpStatus.OK).body(
                    new HashMap<>(){{
                        put("message", SUCCESS);
                        put("data", userPosts);
                    }}
            );
        }catch (Exception error) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("message", FAILURE));
        }
    }

    @PostMapping("/new-post/user/{id}")
    public ResponseEntity<Map<String, String>> createPost(
            @PathVariable(name = "id") UUID userId,
            @ModelAttribute CreatePostRequest request,
            @RequestParam("file") MultipartFile file
    ) throws Exception {
        try{
            return ResponseEntity.status(HttpStatus.CREATED).body(postService.createPost(
                    request,
                    file,
                    userId
            ));
        }catch (Exception error) {
            throw new  Exception(error);
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("message", FAILURE));
        }
    }

}
