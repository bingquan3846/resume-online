module.exports = function(config) {
  config.set({
    frameworks: ['jasmine'],

    files: [
      'app/js/libs/jquery/*.js',
      'app/coffee/*.js',
      'app/test/*.js'
    ],

    browsers: process.env.TRAVIS ? ['Firefox'] : ['Chrome'],

    autoWatch: true
  });
};
