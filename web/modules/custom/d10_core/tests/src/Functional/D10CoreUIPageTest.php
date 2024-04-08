<?php

namespace Drupal\Tests\d10_core\Functional;

use Drupal\Tests\BrowserTestBase;

/**
 * Tests sample custom pages built from d10_core module.
 */
class D10CoreUIPageTest extends BrowserTestBase {

  /**
   * Modules to enable.
   *
   * @var array
   */
  protected static $modules = ['node', 'd10_core'];

  /**
   * Theme to enable.
   *
   * @var string
   */
  protected $defaultTheme = 'stark';

  /**
   * Test whether the route "d10_core.play_page" contains specific text.
   */
  public function testPageText() {
    // Request for the specified route using url path.
    $this->drupalGet('/play-with-me');

    // Assert the page returned a 200 response.
    $this->assertSession()->statusCodeEquals(200);

    // Assert if the page contains a particular text.
    $this->assertSession()->pageTextContains('Are you here to play with me');
  }

}
