<?php

namespace rest\controllers;

use yii\rest\ActiveController;

class UserController extends ActiveController
{
    public $modelClass = 'rest\models\Users';
}