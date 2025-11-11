package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.TiebreakerPair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TiebreakerPairRepository extends JpaRepository<TiebreakerPair, Long> {
    @Query("select tp from TiebreakerPair tp where tp.archetypeA.code = :codeA and tp.archetypeB.code = :codeB")
    Optional<TiebreakerPair> findByArchetypeCodes(String codeA, String codeB);
}
