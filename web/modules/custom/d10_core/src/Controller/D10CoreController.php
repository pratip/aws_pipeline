<?php

namespace Drupal\d10_core\Controller;

use Drupal\Core\Controller\ControllerBase;

class D10CoreController extends ControllerBase {

  public function playWithMe() {
    return [
      '#markup' => 'Are you here to play with me?'
    ];
  }

}
