@login
Feature: Login Testleri
    #eğer en başta yani givendaki adımlar ortak ise Backgrounda alırız.

  Background:
    Given Kullanici "https://www.edu.goit.global/account/login" urline gider

  @tc01 @login @smoke @regression
  Scenario: TC01 Gecerli Kullanici bilgileri ile login olabilme
    Given Kullanici urle gider
    When Kullanici gecerli bir email girer
    When Kullanici gecerli bir password gider
    When Kullanici login butonuna tiklar
    Then Kullanici basarili sekilde login oldugunu dogrular

  @tc02
  Scenario: TC02 Gecerli Kullanici bilgileri ile login olabilme - parametreli
        #Given Kullanici "https://www.edu.goit.global/account/login" urline gider
    When Kullanici email alanina "user888@gmail.com" emailini girer
    When Kullanici password alanina "1234567890" sifresini girer
    When Kullanici login butonuna tiklar
    Then Kullanici basarili sekilde login oldugunu dogrular

  @tc03
  Scenario: TC03 Gecersiz Kullanici bilgileri ile login olamama
        #Given Kullanici "https://www.edu.goit.global/account/login" urline gider
    When Kullanici email alanina "invalidmail@gmail.com" emailini girer
    When Kullanici password alanina "1234567890" sifresini girer
    When Kullanici login butonuna tiklar
    Then Kullanici basarili sekilde login oldugunu dogrular
        #npx cypress run --expose tags="@tc03" --headed --browser chrome yalnızca o tage ait testi çalıştırır. 

  @tc04
  Scenario: TC04 Gecersiz password bilgileri ile login olamama
        #Given Kullanici "https://www.edu.goit.global/account/login" urline gider
    When Kullanici email alanina "user888@gmail.com" emailini girer
    When Kullanici password alanina "1234567890123456" sifresini girer
    When Kullanici login butonuna tiklar
    Then Kullanici basarili sekilde login oldugunu dogrular

  @tc05
  Scenario: TC05 Gecersiz formatta mail ile login olabilme
        #Given Kullanici "https://www.edu.goit.global/account/login" urline gider
    When Kullanici email alanina "user888@gmail" emailini girer
    When Kullanici password alanina "1234567890" sifresini girer
    When Kullanici login butonuna tiklar
    Then Kullanici basarili sekilde login oldugunu dogrular

  @tc06
  Scenario Outline: TC<num> <segment> kullanicisinin login oldugunun dogrulanmasi
    When Kullanici email alanina "<email>" emailini girer
    When Kullanici password alanina "<sifre>" sifresini girer
    When Kullanici login butonuna tiklar
    Then Kullanici basarili sekilde login oldugunu dogrular

    Examples:
      | num |  | email             | sifre      | segment |
      |  06 |  | user888@gmail.com | 1234567890 | Regular |
      |  07 |  | user888@gmail.com | 1234567890 | Premium |
      |  08 |  | user888@gmail.com | 1234567890 | Classic |
      |  09 |  | user888@gmail.com | 1234567890 | Classic |
      |  10 |  | user888@gmail.com | 1234567890 | Classic |
      |  11 |  | user888@gmail.com | 1234567890 | Classic |
      #kaç satır varsa o kadar test koşturulur.
