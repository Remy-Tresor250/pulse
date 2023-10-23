package com.bant.pulse.model.post;

import com.bant.pulse.model.likes.Like;
import com.bant.pulse.model.user.User;
import jakarta.persistence.*;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Transactional
@Table(
        name = "pulse_posts"
)
public class Post {

    @Id
    @GeneratedValue(
            strategy = GenerationType.UUID
    )
    private UUID id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "user_id",
            nullable = false
    )
    private User user;

    private String postDescription;
    private String picturePath;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "post_likes",
            referencedColumnName = "id"
    )
    private List<Like> likes;
}
