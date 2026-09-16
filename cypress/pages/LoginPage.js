class LoginPage {

url = "https://www.edu.goit.global/account/login";
email = '#user_email';
password = '#user_password';
loginButton = '.next-1iphug5';
forgetPassword = '.next-1f1fv1i > .next-1qrvie4';

//urle giden method.
urlGit(){
    cy.visit(this.url);
}
emailGonder(mail){
    cy.get(this.email).type(mail);
}
passwordGonder(pass){
    cy.get(this.password).type(pass);
}
buttonTiklama() {
    cy.contains('button', /^Log in$/)
      .should('be.visible')
      .click();
}
}
export default new LoginPage();