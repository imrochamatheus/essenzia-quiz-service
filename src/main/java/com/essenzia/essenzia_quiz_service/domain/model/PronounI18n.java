package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "pronoun_i18n")
public class PronounI18n {

    @EmbeddedId
    private PronounI18nId id;

    @MapsId("pronounId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pronoun_id", nullable = false)
    private Pronoun pronoun;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}