<?php

namespace rest\controllers;
 
use yii\rest\ActiveController;
 
class UsersController extends ActiveController
{
    public $modelClass = 'common\models\Users';
}