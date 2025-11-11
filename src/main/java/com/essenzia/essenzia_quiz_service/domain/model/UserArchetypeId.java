package com.essenzia.essenzia_quiz_service.domain.model;

import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class UserArchetypeId implements Serializable {
    private Long user;
    private String archetype;
}
