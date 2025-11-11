package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "commitment_level_i18n")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommitmentLevelI18n {

    @EmbeddedId
    private CommitmentLevelI18nId id;

    @MapsId("commitmentLevelId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "commitment_level_id", nullable = false)
    private CommitmentLevel commitmentLevel;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}
