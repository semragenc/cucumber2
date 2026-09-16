// ***********************************************************
// This example support/e2e.js is processed and
// loaded automatically before your test files.
//
// This is a great place to put global configuration and
// behavior that modifies Cypress.
//
// You can change the location of this file or turn off
// automatically serving support files with the
// 'supportFile' configuration option.
//
// You can read more here:
// https://on.cypress.io/configuration
// ***********************************************************

// Import commands.js using ES2015 syntax:
import './commands';

// Alternatively you can use CommonJS syntax:
// require('./commands')

// Global configuration

Cypress.on('uncaught:exception', (err, runnable) => {
  // Bazı üçüncü parti hataları görmezden gel
  if (err.message.includes('Script error')) {
    return false;
  }

  if (err.message.includes('Non-Error promise rejection captured')) {
    return false;
  }

  if (err.message.includes('solveSimpleChallenge is not defined')) {
    return false;
  }

  if (err.message.includes('Cannot read properties of undefined')) {
    return false;
  }

  if (err.message.includes('ResizeObserver loop limit exceeded')) {
    return false;
  }

  // Google bot koruması ile ilgili hatalar
  if (
    err.message.includes('challenge') ||
    err.message.includes('captcha')
  ) {
    return false;
  }

  // Diğer hatalar için test başarısız olsun
  return true;
});

// Test başlamadan önce çalışacak hook
beforeEach(() => {
  // Viewport boyutunu ayarla
  cy.viewport(1280, 720);

  // Console log'ları temizle
  cy.window().then((win) => {
    win.console.clear();
  });
});

// Test bittikten sonra çalışacak hook
afterEach(() => {
  // Test başarısız olursa ekran görüntüsü al
  cy.screenshot({ capture: 'fullPage' });
});