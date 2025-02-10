package usermanager.users;

import com.intuit.karate.junit5.Karate;

class SpringAiUsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }
} 