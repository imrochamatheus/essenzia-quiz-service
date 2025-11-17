package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "sexual_orientation_i18n")
public class SexualOrientationI18n {

    @EmbeddedId
    private SexualOrientationI18nId id;

    @MapsId("sexualOrientationId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sexual_orientation_id", nullable = false)
    private SexualOrientation sexualOrientation;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}
