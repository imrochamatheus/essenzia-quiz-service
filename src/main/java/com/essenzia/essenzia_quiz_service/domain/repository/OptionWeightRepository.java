package com.essenzia.essenzia_quiz_service.domain.repository;

import com.essenzia.essenzia_quiz_service.domain.model.OptionWeight;
import com.essenzia.essenzia_quiz_service.domain.model.OptionWeightId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OptionWeightRepository extends JpaRepository<OptionWeight, OptionWeightId> {
    List<OptionWeight> findByOptionId(Long optionId);
}
