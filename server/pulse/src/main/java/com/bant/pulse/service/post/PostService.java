package com.bant.pulse.service.post;

import com.bant.pulse.modal.post.Post;
import com.bant.pulse.modal.post.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class PostService {

    private final PostRepository postRepository;

    public List<Post> getAllPosts () {
        return postRepository.findAll();
    }

}
