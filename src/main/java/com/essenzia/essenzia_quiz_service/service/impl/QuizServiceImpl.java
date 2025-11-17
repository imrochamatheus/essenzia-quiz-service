package com.essenzia.essenzia_quiz_service.service.impl;

import com.essenzia.essenzia_quiz_service.domain.model.Option;
import com.essenzia.essenzia_quiz_service.domain.model.OptionWeight;
import com.essenzia.essenzia_quiz_service.domain.model.Question;
import com.essenzia.essenzia_quiz_service.domain.model.QuizAttempt;
import com.essenzia.essenzia_quiz_service.domain.repository.*;
import com.essenzia.essenzia_quiz_service.service.QuizService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class QuizServiceImpl implements QuizService {

    private final QuestionRepository questionRepository;
    private final OptionRepository optionRepository;
    private final TiebreakerPairRepository pairRepository;
    private final ArchetypeRepository archetypeRepository;
    private final OptionWeightRepository weightRepository;
    private final QuizAttemptRepository attemptRepository;
    private final QuizAnswerRepository answerRepository;
    private final QuizScoreRepository scoreRepository;
    private final UserRepository userRepository;


    @Override
    public List<Question> getOriginalQuestons() {
        return questionRepository.findByIsTiebreakerFalseOrderByPositionAsc();
    }

    @Override
    public Map<Long, List<Option>> loadOptionsByQuestion(List<Question> questions) {
        Map<Long, List<Option>> map = new HashMap<>();

        questions.forEach(question -> {
            map.put(question.getId(), optionRepository.findByQuestionId(question.getId()));
        });

        return map;
    }

    @Override
    public List<Question> getTiebreakersForPair(String codeA, String codeB) {
        String a = codeA.compareTo(codeB) < 0 ? codeA : codeB;
        String b = codeA.compareTo(codeB) < 0 ? codeB : codeA;

        var pair = pairRepository.findByArchetypeCodes(a, b).orElseThrow();

        return questionRepository
                .findByIsTiebreakerTrueAndTiebreakerPairIdOrderByIdAsc(pair.getId());
    }

    @Override
    @Transactional
    public QuizAttempt startAttempt(Long userId) {
        var user = userRepository.findById(userId).orElseThrow();
        var attempt = QuizAttempt.builder()
                .user(user)
                .startedAt(Instant.now())
                .build();

        return attemptRepository.save(attempt);
    }

    @Override
    public SubmitResult submitAnswers(Long attemptId, List<AnswerPair> answers) {
        return null;
    }

    @Override
    public NextQuestion findNextOriginalQuestion(Long attemptId) {
        return null;
    }

    @Override
    public void computeScoresAndResult(QuizAttempt attempt) {

    }
}
