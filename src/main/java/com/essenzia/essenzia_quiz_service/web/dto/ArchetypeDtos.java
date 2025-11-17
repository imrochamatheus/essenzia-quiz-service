package com.essenzia.essenzia_quiz_service.web.dto;

import io.swagger.v3.oas.annotations.media.Schema;

import java.util.List;

public class ArchetypeDtos {

    public record ArchetypeItem(
            Long id,
            String code,
            String emoji,
            String name,
            String shortDesc,
            String longDesc,
            boolean active) {
    }

    public record ArchetypeList(List<ArchetypeItem> items) {
    }

}
