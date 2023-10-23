package com.bant.pulse.repository;

import com.bant.pulse.model.post.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository("posts")
public interface PostRepository extends JpaRepository<Post, UUID> {
}
