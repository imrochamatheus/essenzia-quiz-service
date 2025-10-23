package com.essenzia.essenzia_quiz_service;

import org.springframework.boot.SpringApplication;

public class TestEssenziaQuizServiceApplication {

	public static void main(String[] args) {
		SpringApplication.from(EssenziaQuizServiceApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
