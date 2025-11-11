package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.QuizScore;
import com.essenzia.essenzia_quiz_service.domain.model.QuizScoreId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizScoreRepository extends JpaRepository<QuizScore, QuizScoreId> {
    List<QuizScore> findByAttemptId(Long attemptId);
}
