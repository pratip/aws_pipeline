<?php

namespace Drupal\d10_core\Controller;

use Drupal\Core\Controller\ControllerBase;

/**
 * The custom controller to play with Drupal.
 */
class D10CoreController extends ControllerBase {

  /**
   * A standard markup returning route callback.
   */
  public function playWithMe() {
    return [
      '#markup' => 'Are you here to play with me?',
    ];
  }

}
