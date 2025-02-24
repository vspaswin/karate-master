package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ExamplesTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:examples")
                .systemProperty("karate.env", System.getProperty("karate.env", "dev"))
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
