package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.QuizResult;
import com.essenzia.essenzia_quiz_service.domain.model.QuizResultId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizResultRepository extends JpaRepository<QuizResult, QuizResultId> {
    List<QuizResult> findByAttemptId(Long attemptId);
}
