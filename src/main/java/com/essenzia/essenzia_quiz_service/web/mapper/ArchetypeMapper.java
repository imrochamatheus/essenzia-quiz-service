package com.essenzia.essenzia_quiz_service.web.mapper;

import com.essenzia.essenzia_quiz_service.domain.model.Archetype;
import com.essenzia.essenzia_quiz_service.web.dto.ArchetypeDtos.ArchetypeItem;
import org.mapstruct.Context;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ArchetypeMapper {

    @Mapping(target = "shortDesc", expression = "java( model.getDominantI18n() != null ? model.getDominantI18n().getOrDefault(locale, null) : null )")
    @Mapping(target = "longDesc", expression = "java( model.getComplementaryI18n() != null ? model.getComplementaryI18n().getOrDefault(locale, null) : null )")
    @Mapping(target = "name", expression = "java( model.getNameI18n() != null ? model.getNameI18n().getOrDefault(locale, model.getCode()) : model.getCode() )")
    ArchetypeItem toItem(Archetype model, @Context String locale);

}
