package com.essenzia.essenzia_quiz_service.domain.model;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class OptionWeightId implements Serializable {

    private Long option;
    private Long archetype;

}
