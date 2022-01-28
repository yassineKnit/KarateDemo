function fn() {
    var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }

    var config = {
        env: env,
        myVarName: 'hello karate',
        baseUrl: 'https://gorest.co.in',
        tokenID: '5b62f89b0056585969f112bc3d07f726481559fab42599241dcab33d2b9f6d2e'
    }

    if (env == 'dev') {
// customize
// e.g. config.foo = 'bar';
    } else if (env == 'e2e') {
// customize
    }
    return config;
}