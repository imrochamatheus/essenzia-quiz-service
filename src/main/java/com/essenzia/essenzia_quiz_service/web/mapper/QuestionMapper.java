package com.essenzia.essenzia_quiz_service.web.mapper;

import com.essenzia.essenzia_quiz_service.domain.model.Option;
import com.essenzia.essenzia_quiz_service.domain.model.Question;
import com.essenzia.essenzia_quiz_service.web.dto.QuizDtos;
import org.mapstruct.Context;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;
import java.util.Map;

@Mapper(componentModel = "spring")
public interface QuestionMapper {
    default String pick(Map<String, String> i18n, String locale) {
        return i18n == null
                ? null
                : i18n.getOrDefault(locale, i18n.values().stream().findFirst().orElse(""));
    }

    @Mapping(target = "text", expression = "java( pick(q.getTextI18n(), locale) )")
    @Mapping(target = "options", expression = "java( mapOptions(q.getId(), optionsByQuestion.get(q.getId()), locale) )")
    QuizDtos.QuestionItem toItem(Question q, @Context String locale, @Context Map<Long, List<Option>> optionsByQuestion);

    default List<QuizDtos.QuestionOption> mapOptions(Long qid, List<Option> opts, String locale) {
        if (opts == null) {
            return List.of();
        }

        return opts.stream()
                .map(o -> new QuizDtos.QuestionOption(o.getId(), pick(o.getTextI18n(), locale)))
                .toList();
    }

}
