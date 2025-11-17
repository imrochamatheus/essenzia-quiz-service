package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "marital_status_i18n")
public class MaritalStatusI18n {

    @EmbeddedId
    private MaritalStatusI18nId id;

    @MapsId("maritalStatusId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "marital_status_id", nullable = false)
    private MaritalStatus maritalStatus;

    @Column(name = "name", nullable = false, length = 100)
    private String name;

}