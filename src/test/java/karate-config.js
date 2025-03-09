function fn() {
  var env = karate.env; // get system property 'karate.env'
  if (!env) {
    env = 'dev'; // default to 'dev' if not passed
  }

  var config = {
    environment: env
  };

  // Using the same base URL for all environments for JSONPlaceholder example
  var baseURL = 'https://jsonplaceholder.typicode.com';

  if (env == 'dev') {
    config.apiUrl = baseURL;
  } else if (env == 'test') {
    config.apiUrl = baseURL;
  } else if (env == 'prod') {
    config.apiUrl = baseURL;
  }
  // In a real-world scenario, these URLs would be different

  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}