function fn() {
  var urlValue = '';

  if (karate.env == 'prod') {
    urlValue = 'https://reqres.in/api/';
  } else if (karate.env == 'stage') {
    urlValue = 'https://staging.api.qlu.ai/';
  } else {
    urlValue = 'https://restful-booker.herokuapp.com'; // Varsayılan değer
  }

  var config = {
    apienv: karate.env,
    apiBaseURL: urlValue // Hata buradaydı, apiBaseURL eklenmeli
  };

  karate.log('Config:', config); // Debug için log ekleyelim

  return config;
}
