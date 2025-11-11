package com.essenzia.essenzia_quiz_service.domain.model;

import com.vladmihalcea.hibernate.type.json.JsonType;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Type;

import java.util.Map;

@Getter
@Setter
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "archetype")
public class Archetype {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 100)
    private String code;

    @Column(nullable = false, length = 50)
    private String emoji;

    @Type(JsonType.class)
    @Column(name = "name_i10n", columnDefinition = "jsonb", nullable = false)
    private Map<String, String> nameI18n;

    @Type(JsonType.class)
    @Column(name = "dominant_i18n", columnDefinition = "jsonb")
    private Map<String, String> dominantI18n;

    @Type(JsonType.class)
    @Column(name = "complementary_i18n", columnDefinition = "jsonb")
    private Map<String, String> complementaryI18n;

    @Column(nullable = false)
    private Boolean active = Boolean.TRUE;

}
