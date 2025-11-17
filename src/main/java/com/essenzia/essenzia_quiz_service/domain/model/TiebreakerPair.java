package com.essenzia.essenzia_quiz_service.domain.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tiebreaker_pair")
public class TiebreakerPair {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "archetype_a_id", nullable = false)
    private Archetype archetypeA;

    @ManyToOne
    @JoinColumn(name = "archetype_b_id", nullable = false)
    private Archetype archetypeB;
}
