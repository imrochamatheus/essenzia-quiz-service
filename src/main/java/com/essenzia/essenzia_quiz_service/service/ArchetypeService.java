package com.essenzia.essenzia_quiz_service.service;

import com.essenzia.essenzia_quiz_service.domain.model.Archetype;

import java.util.List;
import java.util.Optional;

public interface ArchetypeService {
    List<Archetype> list(Boolean active);
    Optional<Archetype> byCode(String code);
}
