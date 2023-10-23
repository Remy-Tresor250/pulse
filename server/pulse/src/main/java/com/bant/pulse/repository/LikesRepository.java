package com.bant.pulse.repository;

import com.bant.pulse.model.likes.Like;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository("likes")
public interface LikesRepository extends JpaRepository<Like, UUID> {
}
