package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "lifestyle_i18n")
public class LifestyleI18n {

    @EmbeddedId
    private LifestyleI18nId id;

    @MapsId("lifestyleId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lifestyle_id", nullable = false)
    private Lifestyle lifestyle;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}
