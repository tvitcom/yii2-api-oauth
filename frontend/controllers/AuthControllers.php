<?php
namespace frontend\controllers;
use frontend\components\FrontendController;

class AuthController extends FrontendController
{
  private $client_id = 'client_id '; // Client ID
  private $client_secret = 'client_secret'; // Client secret
  private $redirect_uri = 'http://host.ru/auth/success'; // Redirect URIs
  private $url_auth = 'https://accounts.google.com/o/oauth2/auth';
  private $url_token = 'https://accounts.google.com/o/oauth2/token';

  public function actionIndex()
  {
    $params = [
      'redirect_uri'  => $this->redirect_uri,
      'response_type' => 'code',
      'client_id'     => $this->client_id,
      'scope'         => 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/drive'

    ];

    echo $link = '<p><a href="' . $this->url_auth . '?' . urldecode(http_build_query($params)) . '">Аутентификация через Google</a></p>';
  }

  public function actionSuccess()
  {
    $code = \Yii::$app->request->get('code');

    $params = [
      'client_id'     => $this->client_id,
      'client_secret' => $this->client_secret,
      'redirect_uri'  => $this->redirect_uri,
      'grant_type'    => 'authorization_code',
      'code'          => $code
    ];

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $this->url_token);
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, urldecode(http_build_query($params)));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    $result = curl_exec($curl);
    curl_close($curl);
    $tokenInfo = json_decode($result, true);

    if (isset($tokenInfo['access_token'])) {
      $params['access_token'] = $tokenInfo['access_token'];

      $userInfo = json_decode(file_get_contents('https://www.googleapis.com/oauth2/v1/userinfo' . '?' . urldecode(http_build_query($params))), true);

    }

    if (isset($userInfo['id'])) {
      echo "Социальный ID пользователя: " . $userInfo['id'] . '<br />';
      echo "Имя пользователя: " . $userInfo['name'] . '<br />';
      echo "Email: " . $userInfo['email'] . '<br />';
      echo "Ссылка на профиль пользователя: " . $userInfo['link'] . '<br />';
      echo "Пол пользователя: " . $userInfo['gender'] . '<br />';
      echo '<img src="' . $userInfo['picture'] . '" />'; echo "<br />";
    }

  }

}