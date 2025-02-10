# Karate Test Automation Framework

This project contains automated API tests using the Karate framework. It includes both example tests (using JSONPlaceholder API) and tests for the Spring AI User Management API.

## Project Structure 
```
karate-master/
├── src/
│   └── test/
│       └── java/
│           ├── examples/                 # Example tests using JSONPlaceholder API
│           │   └── users/
│           │       ├── UsersRunner.java
│           │       └── users.feature
│           ├── usermanager/             # Spring AI API tests
│           │   └── users/
│           │       ├── SpringAiUsersRunner.java
│           │       └── users.feature
│           ├── karate-config.js         # Karate configuration file
│           ├── logback-test.xml         # Logging configuration
│           └── TestSuite.java           # Main test suite runner
└── pom.xml
```

## Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- Running instance of Spring AI Demo application on `localhost:8080`

## Running Tests

### Run All Tests 
```bash
mvn test
```

### Run Specific Test Suites
1. Run only Example tests:
```bash
mvn test -Dtest=examples.users.UsersRunner
```

2. Run only Spring AI tests:
```bash
mvn test -Dtest=usermanager.users.SpringAiUsersRunner
```

3. Run complete test suite:
```bash
mvn test -Dtest=TestSuite
```

## Test Reports

After running the tests, you can find the reports in:
1. Summary HTML report: `target/karate-reports/karate-summary.html`
2. Detailed HTML reports: `target/cucumber-html-reports/overview-features.html`

## Configuration

### Environment Configuration
The environment configuration is managed in `karate-config.js`:
- Default environment is 'dev'
- You can change the environment using: `mvn test -Dkarate.env=e2e`

### Logging Configuration
Logging is configured in `logback-test.xml`:
- Console output
- File output in `target/karate.log`

## Test Features

### Example Tests (JSONPlaceholder API)
- Get all users
- Get user by ID
- Create new user
- Basic response validation

### Spring AI Tests (User Management API)
- Get users with pagination
- Create new user
- Get user by ID
- Response schema validation
- Error handling

## Adding New Tests

1. Create a new feature file in the appropriate package:
```gherkin
Feature: New API Test

Scenario: Test new endpoint
    Given url baseUrl
    And path 'your-endpoint'
    When method get
    Then status 200
```

2. Create a corresponding runner class:
```java
package your.package;

import com.intuit.karate.junit5.Karate;

class NewFeatureRunner {
    @Karate.Test
    Karate testFeature() {
        return Karate.run("your-feature").relativeTo(getClass());
    }
}
```

## Best Practices

1. Use Background section for common setup
2. Generate unique test data using JavaScript functions
3. Validate response schemas
4. Use meaningful scenario names
5. Add appropriate assertions
6. Keep features focused and maintainable

## Troubleshooting

1. Connection Issues:
   - Verify the application is running
   - Check the base URL in the feature file
   - Verify network connectivity

2. Test Failures:
   - Check the detailed HTML reports
   - Review the karate.log file
   - Verify the API response matches expectations

## Contributing

1. Create a feature branch
2. Add your tests
3. Verify all tests pass
4. Submit a pull request

## Resources

- [Karate Framework Documentation](https://github.com/karatelabs/karate)
- [Karate IDE Support](https://github.com/karatelabs/karate/wiki/IDE-Support)
- [Cucumber Reporting](https://github.com/damianszczepanik/cucumber-reporting)