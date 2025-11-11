package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(QuizScoreId.class)
@Table(name = "quiz_score")
public class QuizScore {

    @Id
    @ManyToOne
    @JoinColumn(name = "quiz_attempt_id")
    private QuizAttempt attempt;

    @Id
    @ManyToOne
    @JoinColumn(name = "archetype_id")
    private Archetype archetype;

    @Column(name = "score_value", nullable = false)
    private Float scoreValue;

}
