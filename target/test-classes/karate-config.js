function() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'test';
  }

    if (env == 'test') {
      testEnvUrl = 'https://gorest.co.in//public/v2/users/',
      tokenID = 'b313fe34e13def7856abc1b50c872a50260c0f3f0bcd568f9ca728ca2cd62b92'
    } else if (env == 'dev') {
      testEnvUrl = 'http://www.mydevurl.com'
    }

  var config = {
    env: env,
	myBaseUrl: testEnvUrl
  }
  //karate.configure('ssl', true);
  //karate.configure('proxy', 'http://127.0.0.1:8080');
  //karate.configure('ssl', 'TLSv1.2');
  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 120000)
  return config;
}
