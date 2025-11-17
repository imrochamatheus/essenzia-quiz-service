package com.essenzia.essenzia_quiz_service.domain.model;

import com.vladmihalcea.hibernate.type.json.JsonType;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Type;

import java.util.Map;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "question")
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Integer position;

    @Type(JsonType.class)
    @Column(name = "text_i18n", columnDefinition = "jsonb", nullable = false)
    private Map<String, String> textI18n;

    private Boolean isTiebreaker = Boolean.FALSE;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tiebreaker_pair_id")
    private TiebreakerPair tiebreakerPair;

}
