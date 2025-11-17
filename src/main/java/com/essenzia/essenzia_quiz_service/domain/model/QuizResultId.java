package com.essenzia.essenzia_quiz_service.domain.model;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class QuizResultId implements Serializable {

    private Long attempt;
    private Long archetype;

}
