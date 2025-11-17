package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(OptionWeightId.class)
@Table(name = "option_weight")
public class OptionWeight {

    @Id
    @ManyToOne
    @JoinColumn(name = "option_id")
    private Option option;

    @Id
    @ManyToOne
    @JoinColumn(name = "archetype_id")
    private Archetype archetype;

    @Column(name = "weight", nullable = false)
    private Float weight;

}
