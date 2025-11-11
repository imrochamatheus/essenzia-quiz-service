package com.essenzia.essenzia_quiz_service.domain.model;

import com.essenzia.essenzia_quiz_service.domain.enums.ArchetypeType;
import com.essenzia.essenzia_quiz_service.domain.enums.Source;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@IdClass(UserArchetype.class)
@Table(name = "user_archetype")
public class UserArchetype {

    @Id
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Id
    @ManyToOne
    @JoinColumn(name = "archetype_code", referencedColumnName = "code")
    private Archetype archetype;

    @Enumerated(EnumType.STRING)
    private ArchetypeType archetypeType;

    @Enumerated(EnumType.STRING)
    private Source source;

}
