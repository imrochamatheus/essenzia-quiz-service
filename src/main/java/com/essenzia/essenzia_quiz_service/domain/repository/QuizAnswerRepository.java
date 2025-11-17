package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.QuizAnswer;
import com.essenzia.essenzia_quiz_service.domain.model.QuizAnswerId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizAnswerRepository extends JpaRepository<QuizAnswer, QuizAnswerId> {
    List<QuizAnswer> findByAttemptId(Long attemptId);
}