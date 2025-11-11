package com.essenzia.essenzia_quiz_service.domain.model;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class QuizAnswerId implements Serializable {

    private Long attempt;
    private Long option;

}
