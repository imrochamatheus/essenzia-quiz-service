package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(QuizAnswerId.class)
@Table(name = "quiz_answer")
public class QuizAnswer {

    @Id
    @ManyToOne
    @JoinColumn(name = "quiz_attempt_id")
    private QuizAttempt attempt;

    @Id
    @ManyToOne
    @JoinColumn(name = "option_id")
    private Option option;

}
