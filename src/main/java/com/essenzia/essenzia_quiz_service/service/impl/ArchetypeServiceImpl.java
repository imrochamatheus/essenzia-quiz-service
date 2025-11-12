package com.essenzia.essenzia_quiz_service.service.impl;

import com.essenzia.essenzia_quiz_service.domain.model.Archetype;
import com.essenzia.essenzia_quiz_service.domain.repository.ArchetypeRepository;
import com.essenzia.essenzia_quiz_service.service.ArchetypeService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ArchetypeServiceImpl implements ArchetypeService {

    private final ArchetypeRepository repo;

    @Override
    public List<Archetype> list(Boolean active) {
        if (active == null) {
            return repo.findAll();
        }

        return repo.findByActive(active);
    }

    @Override
    public Optional<Archetype> byCode(String code) {
        return repo.findByCode(code);
    }
}
