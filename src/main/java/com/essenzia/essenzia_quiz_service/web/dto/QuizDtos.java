package com.essenzia.essenzia_quiz_service.web.dto;

import java.time.Instant;
import java.util.List;

public class QuizDtos {

    // GET /quiz/questions
    public record QuestionOption(Long id, String text) {
    }

    public record QuestionItem(Long id, Integer position, String text, List<QuestionOption> options) {
    }

    public record QuestionList(List<QuestionItem> items) {
    }

    // GET /quiz/tiebreakers
    public record TiebreakerOption(Long id, String text) {
    }

    public record TiebreakerItem(Long id, String text, List<TiebreakerOption> options) {
    }

    public record TiebreakerList(String[] pair, List<TiebreakerItem> items) {
    }

    // POST /quiz/attempts
    public record StartAttemptRequest(Long userId) {
    }

    public record StartAttemptResponse(Long attemptId, Long userId, Instant startedAt) {
    }

    // POST /quiz/attempts/{id}/answers
    public record AnswerItem(Long questionId, Long optionId) {
    }

    public record SubmitAnswersRequest(List<AnswerItem> answers) {
    }

    public record NextQuestion(Long id, String text, List<TiebreakerOption> options) {
    }

    public record SubmitAnswersResponse(Long attemptId, Integer saved, NextQuestion nextQuestion) {
    }

    // GET /quiz/attempts/{id}
    public record AttemptAnswer(Long questionId, Long optionId) {
    }

    public record AttemptScore(String archetype, float score) {
    }

    public record AttemptResult(String archetype, String type) {
    }

    public record AttemptDetails(Long attemptId, Long userId, Instant startedAt, Instant completedAt,
                                 List<AttemptAnswer> answers, List<AttemptScore> scores, List<AttemptResult> result) {
    }

}
