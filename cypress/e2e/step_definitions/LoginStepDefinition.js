import {Given, When, Then} from '@badeball/cypress-cucumber-preprocessor';
import loginPage from '../../pages/loginPage';
Given('Kullanici urle gider', () => {
  loginPage.urlGit()
});
When('Kullanici gecerli bir email girer', () => {
  loginPage.emailGonder('user888@gmail.com')
});
When('Kullanici gecerli bir password gider', () => {
  loginPage.passwordGonder('1234567890')
});
When('Kullanici login butonuna tiklar', () => {
  loginPage.buttonTiklama();
});
Then('Kullanici basarili sekilde login oldugunu dogrular', () => {
  
//Seneryo 2

});
//urle git
Given('Kullanici {string} urline gider', (url) => {
cy.visit(url);
});
//emil gir
When('Kullanici email alanina {string} emailini girer', (email) => {
  loginPage.emailGonder(email);
});
//Şifre gir
When('Kullanici password alanina {string} sifresini girer', (password) => {
  loginPage.passwordGonder(password);
});