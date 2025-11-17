package com.essenzia.essenzia_quiz_service.service;

import com.essenzia.essenzia_quiz_service.domain.model.Option;
import com.essenzia.essenzia_quiz_service.domain.model.Question;
import com.essenzia.essenzia_quiz_service.domain.model.QuizAttempt;

import java.util.List;
import java.util.Map;

public interface QuizService {

    public record AnswerPair(Long questionId, Long optionId) {
    }

    public record NextQuestion(Question question, List<Option> options) {
    }

    public record SubmitResult(int saved, NextQuestion next) {
    }


    List<Question> getOriginalQuestons();

    Map<Long, List<Option>> loadOptionsByQuestion(List<Question> questions);

    List<Question> getTiebreakersForPair(String codeA, String codeB);

    QuizAttempt startAttempt(Long userId);

    SubmitResult submitAnswers(Long attemptId, List<AnswerPair> answers);

    NextQuestion findNextOriginalQuestion(Long attemptId);

    void computeScoresAndResult(QuizAttempt attempt);

}
