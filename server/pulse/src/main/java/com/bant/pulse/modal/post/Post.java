package com.bant.pulse.modal.post;

import com.bant.pulse.modal.likes.Like;
import com.bant.pulse.modal.user.User;
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
    private User userId;

    private String postDescription;
    private String picturePath;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(
            name = "post_likes",
            referencedColumnName = "id"
    )
    private List<Like> likes;
}
