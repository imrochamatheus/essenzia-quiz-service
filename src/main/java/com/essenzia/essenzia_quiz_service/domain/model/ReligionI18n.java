package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "religion_i18n")
public class ReligionI18n {

    @EmbeddedId
    private ReligionI18nId id;

    @MapsId("religionId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "religion_id", nullable = false)
    private Religion religion;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}