package com.bant.pulse.controllers.post;

import com.bant.pulse.modal.post.Post;
import com.bant.pulse.service.post.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("api/v1/posts")
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;

    @GetMapping("/all")
    public ResponseEntity<List<Post>> getAllPosts() throws Exception{
        try{
            return ResponseEntity.status(HttpStatus.OK).body(postService.getAllPosts());
        }catch (Exception error) {
            throw new Exception(error);
        }
    }

}
