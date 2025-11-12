package com.essenzia.essenzia_quiz_service.web.controller;

import com.essenzia.essenzia_quiz_service.service.ArchetypeService;
import com.essenzia.essenzia_quiz_service.web.dto.ArchetypeDtos.ArchetypeList;
import com.essenzia.essenzia_quiz_service.web.mapper.ArchetypeMapper;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Tag(name = "Archetypes")
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/archetypes")
public class ArchetypeController {

    private final ArchetypeService service;
    private final ArchetypeMapper mapper;

    @Operation(summary = "Lista arquétipos", description = "Retorna lista de archétipos filtrados por active")
    @GetMapping
    public ResponseEntity<ArchetypeList> list(
            @Parameter(description = "Filtra por status ativo")
            @RequestParam(required = false) Boolean active,
            @RequestHeader(name = "Accept-Language", required = false) String locale
    ) {
        String loc = Optional.ofNullable(locale).orElse("pt");
        var items = service.list(active).stream()
                .map(archetype -> mapper.toItem(archetype, loc)).toList();

        return ResponseEntity.ok(new ArchetypeList(items));
    }

}
