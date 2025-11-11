package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.Archetype;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ArchetypeRepository extends JpaRepository<Archetype, Long> {
    Optional<Archetype> findByCode(String code);
    List<Archetype> findByActive(Boolean active);
}
