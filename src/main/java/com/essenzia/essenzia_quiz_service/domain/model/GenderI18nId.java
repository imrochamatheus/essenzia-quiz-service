package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.Embeddable;
import lombok.*;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class GenderI18nId implements Serializable {

    private Long genderId;
    private String locale;

}
