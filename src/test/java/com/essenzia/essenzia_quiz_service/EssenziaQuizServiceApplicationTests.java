package com.essenzia.essenzia_quiz_service;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;

@Import(TestcontainersConfiguration.class)
@SpringBootTest
class EssenziaQuizServiceApplicationTests {

	@Test
	void contextLoads() {
	}

}
