package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Long> {
    List<Question> findByIsTiebreakerFalseOrderByPositionAsc();
    List<Question> findByIsTiebreakerTrueAndTiebreakerPairIdOrderByIdAsc(Long pairId);
}
