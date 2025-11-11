package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.QuizAttempt;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizAttemptRepository extends JpaRepository<QuizAttempt, Long> {}
