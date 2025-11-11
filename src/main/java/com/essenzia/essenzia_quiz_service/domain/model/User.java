package com.essenzia.essenzia_quiz_service.domain.model;

import com.essenzia.essenzia_quiz_service.domain.enums.YesNoMaybe;
import com.essenzia.essenzia_quiz_service.domain.enums.converter.YesNoMaybeConverter;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String name;

    @Column(nullable = false)
    private Integer age;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "gender")
    private Gender gender;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "pronoum")
    private Pronoun pronoum;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "maritalStatus")
    private MaritalStatus maritalStatus;

    private String city;
    private String state;
    private String country;

    @Column(nullable = false, unique = true, length = 150)
    private String email;

    @Column(nullable = false)
    private String phone;

    @Column(columnDefinition = "text")
    private String bio;

    private Boolean hasKids;

    @Enumerated(EnumType.STRING)
    private YesNoMaybe childrenPreference;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "religion")
    private Religion religion;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "commitmentLevel")
    private CommitmentLevel commitmentLevel;

    @Enumerated(EnumType.STRING)
    private YesNoMaybe longDistanceRelationship;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lifestyle")
    private Lifestyle lifestyle;

    @Column(unique = true, length = 11)
    private String cpf;

    private Integer profileCompleteness = 0;

}
