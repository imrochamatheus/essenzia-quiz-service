package com.essenzia.essenzia_quiz_service.domain.model;

import com.essenzia.essenzia_quiz_service.domain.enums.ArchetypeType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(QuizResultId.class)
@Table(name = "quiz_result")
public class QuizResult {

    @Id
    @ManyToOne
    @JoinColumn(name = "quiz_attempt_id")
    private QuizAttempt attempt;

    @Id
    @ManyToOne
    @JoinColumn(name = "archetype_id")
    private Archetype archetype;

    @Enumerated(EnumType.STRING)
    private ArchetypeType archetypeType;

}
