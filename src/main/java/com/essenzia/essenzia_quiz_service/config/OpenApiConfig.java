package com.essenzia.essenzia_quiz_service.config;

import io.swagger.v3.oas.models.info.Info;
import org.springdoc.core.models.GroupedOpenApi;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public GroupedOpenApi publicApi() {
        return GroupedOpenApi.builder()
                .group("v1")
                .packagesToScan("com.essenzia.essenzia_quiz_service.web.controller")
                .addOpenApiCustomizer(openApi -> openApi.setInfo(
                        new Info()
                                .title("Essenzia Quiz Api")
                                .version("v1")
                                .description("API para")
                ))
                .build();
    }
}
