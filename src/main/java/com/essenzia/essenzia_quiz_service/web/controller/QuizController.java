package com.essenzia.essenzia_quiz_service.web.controller;

import com.essenzia.essenzia_quiz_service.domain.model.Option;
import com.essenzia.essenzia_quiz_service.domain.model.Question;
import com.essenzia.essenzia_quiz_service.service.QuizService;
import com.essenzia.essenzia_quiz_service.web.dto.QuizDtos;
import com.essenzia.essenzia_quiz_service.web.mapper.QuestionMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Tag(name = "Quiz")
@RestController
@RequestMapping("/api/v1/quiz")
@RequiredArgsConstructor
public class QuizController {

    private final QuizService quizService;
    private final QuestionMapper questionMapper;

    @Operation(summary = "Perguntas originais", description = "Retorna a lista de perguntas sem pesos")
    @GetMapping("/questions")
    public ResponseEntity<QuizDtos.QuestionList> getQuestions(@RequestHeader(name = "Accept-Language", required = false) String locale) {
        String loc = Optional.ofNullable(locale).orElse("pt");
        List<Question> questions = quizService.getOriginalQuestons();
        Map<Long, List<Option>> optsByQuestion = quizService.loadOptionsByQuestion(questions);

        List<QuizDtos.QuestionItem> items = questions.stream()
                .map(question -> questionMapper.toItem(question, loc, optsByQuestion))
                .toList();

        return ResponseEntity.ok(new QuizDtos.QuestionList(items));
    }

    @Operation(summary = "Perguntas de desempate", description = "Retorna perguntas de desempate para um par de arquétipos (codeA,codeB)")
    @GetMapping("/tiebreakers")
    public ResponseEntity<QuizDtos.TiebreakerList> getTiebreakers(
            @Parameter(description = "Par de códigos, ex: magnetic,intense") @RequestParam("pair") String pair,
            @RequestHeader(name = "Accept-Language", required = false) String locale
    ) {
        String loc = Optional.ofNullable(locale).orElse("pt");
        String[] codes = pair.split(",");

        var list = quizService.getTiebreakersForPair(codes[0], codes[1]);
        var items = list.stream().map(question ->
                        new QuizDtos.TiebreakerItem(question.getId(),
                                questionMapper.pick(question.getTextI18n(), loc),
                                quizService.loadOptionsByQuestion(List.of(question)).get(question.getId()).stream()
                                .map(o -> new QuizDtos.TiebreakerOption(o.getId(), questionMapper.pick(o.getTextI18n(), loc)))
                                .toList()))
                .toList();

        return ResponseEntity.ok(new QuizDtos.TiebreakerList(new String[]{codes[0], codes[1]}, items));
    }

    @Operation(summary = "Inicia tentativa de quiz")
    @PostMapping("/attempts")
    public ResponseEntity<QuizDtos.StartAttemptResponse> start(@Valid @RequestBody QuizDtos.StartAttemptRequest req) {
        var attempt = quizService.startAttempt(req.userId());

        return ResponseEntity.status(201).body(
                new QuizDtos.StartAttemptResponse(attempt.getId(),
                attempt.getUser().getId(),
                attempt.getStartedAt()));
    }


}