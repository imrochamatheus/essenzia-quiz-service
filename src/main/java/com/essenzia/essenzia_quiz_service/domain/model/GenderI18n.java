package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "gender_i18n")
public class GenderI18n {

    @EmbeddedId
    private GenderI18nId id;

    @MapsId("genderId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gender_id", nullable = false)
    private Gender gender;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}
