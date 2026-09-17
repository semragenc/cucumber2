@search
Feature: Search and purchase test

  Background:
    Given Kullanici "https://www.kitapyurdu.com/" urline gider

  @ky1 @login
  Scenario: KY1 Kullanici gecerli bilgiler ile login olur/onkusul
    When Kullanici giris yap butonuna tiklar
    And Kullanici gecerli bir email girer
    And Kullanici gecerli bir password girer
    And Kullanici login butonuna tiklar
    Then Kullanici basarili sekilde login oldugunu dogrular

  @ky2
  Scenario: KY2 Kullanici urun aramasi yapar
    When Kullanici search input alanina tiklar
    And Kullanici gecerli bir arama degeri girer
    And Kullanici arama butonuna tiklar
    Then Kullanici aramasi ile eslesen urunler listelenir

  @ky3
  Scenario: KY3 Kullanici almak istedigi urunu sepete ekler
    Given Kullanici arama sonuclarini goruntulemektedir
    When Kullanici almak istedigi urun ustune tıklar
    And Kullanici urun detay sayfasini goruntuler
    And Kullanici sepete ekle butonuna tiklar
    Then Kullanici basarili sekilde urunu sepete ekledigine dair notification alir
    #Bu 2 senaryo da olabilir ...ayrıntıları görüntüler, ...bildirim alır.

  @ky4
  Scenario: KY4 Kullanici sepeti onaylar
    Given Kullnaici hesabina giris yapmistir
    And Kullanicinin sepetinde en az bir urun bulunmaktadir
    When Kullanici sepetim butonuna tiklar
    And Kullanici kullanici sepete git butonuna tiklar
    And Kullanici satin al butonuna tiklar
    Then Kullanici teslimat secenekleri sayfasini goruntuler

  @ky5
  Scenario: KY5 Kullanici teslimat icin secimlerini yapar
    Given Kullnaici hesabina giris yapmistir
    And Kullanicinin sepetinde satin alinabilir bir urun bulunmaktadir
    And Kullanici teslimat secenekleri sayfasindadir
    When Kullanici teslimat secenegi secer
    And Kullanici kayitli teslimat adresi secer
    And Kullanici kargo sirketini secer
    And Kullanici devat et butonuna tiklar
    Then Kullanici teslimat secimlerini tamamlar
    #   Kullanıcının eğer kayıtlı adresi yoksa bunun içinde senaryo oluşturulmalıdır;
    #   Kayıtlı adres var → mevcut adresi seç
    #   Kayıtlı adres yok → yeni adres oluştur  

  @ky6 @ky6
  Scenario Outline: KY6 Kullanici farkli odeme yontemleri ile odeme yapar
    Given Kullanici hesabina giris yapmistir
    And Kullanici odeme sayfasindadir
    And Kullanici teslimat bilgilerini tamamlamistir
    When Kullanici "<odemeYontemi>" odeme secenegini secer
    And Kullanici odeme icin gerekli bilgileri girer
    And Kullanici sozlesmeleri onaylar
    And Kullanici siparisi onayla butonuna tiklar
    Then Kullanici siparisinin basarili olusturuldugu dogrulanir

    Examples:
      | odemeYontemi                 |
      | Kart                         |
      | BKM Ekspres                  |
      | Havale                       |
      | Vodafone Pay Faturaya Yansit |
    #Kullanıcı ödeme seçeneklerinin her biri için seneryo oluşturulabilir:
    # Kart ile, BKM Ekspres ile, Havale ile, Vodafone Pay Faturaya Yansıt ile
