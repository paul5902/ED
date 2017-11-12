drop table LIGNE_FACTURE cascade constraints;
drop table FACTURE cascade constraints;
drop table CLIENT cascade constraints;
drop table PRIX_DATE cascade constraints;
drop table PRODUIT cascade constraints;
drop sequence client_seq;
drop sequence produit_seq;

create sequence client_seq start with 1 INCREMENT BY 1 NOMAXVALUE;
create table CLIENT( 
  num number, 
  nom varchar2(20), 
  prenom varchar2(20), 
  adresse varchar2(300), 
  date_nais date, 
  sexe varchar2(5) check (sexe in ('homme','femme')), 
  constraint PK_CLIENT primary key (num) 
);


create sequence produit_seq start with 1 INCREMENT BY 1 NOMAXVALUE; 
create table PRODUIT (
  num number, 
  designation varchar(300), 
  stock number, 
  constraint PK_PRODUIT primary key (num)
); 

create table PRIX_DATE (
  num number, 
  produit number, 
  date_du_prix date, 
  prix number, 
  remise number, 
  constraint PK_PRIX primary key (num),
  constraint FK_PRODUIT foreign key (produit) references PRODUIT(num)
); 


create table FACTURE ( 
  num number, 
  client number, 
  constraint PK_FACTURE primary key (num), 
  date_etabli date, 
  constraint FK_FACTURE_CLIENT foreign key (client) references CLIENT(num) 
);

create table LIGNE_FACTURE (
  facture number, 
  produit number, 
  qte number, 
  id_prix number, 
  constraint FK_LIGNE_FACT_FACTURE foreign key (facture) references FACTURE(num), 
  constraint FK_LIGNE_FACT_PRODUIT foreign key (produit) references PRODUIT(num),
  constraint FK_PRODUIT_PRIX foreign key (id_prix) references PRIX_DATE(num), 
  constraint PK_LIGNE_FACT primary key (facture, produit) 
);

INSERT INTO CLIENT VALUES(client_seq.nextval,'Futterkiste','Alfreds','Obere Str. 57,12209,Berlin,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'Trujillo','Ana','Avda. de la Constitucin 2222,5021,Mexico D.F.,Mexique',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'Moreno Taqueria','Antonio','Mataderos  2312,5023,Mexico D.F.,Mexique',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'Herkku','Wartian','120 Hanover Sq.,WA1 1DP,London,Royaume-Uni',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'Carnes','Hanari','Berguvswegen  8,S-958 22,Lulea,Suède',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'Hilarion','Abastos','Forsterstr. 57,68306,Mannheim,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'SAYAVONG','Henriette','24 place Kléber,67000,Strasbourg,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'Zajazd','Wolski','Araquil 67,28023,Madrid,Espagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'NAIMI','Chantal','12 rue des Bouchers,13008,Marseille,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MARTIN','Jacqueline','23 Tsawassen Blvd.,T2F 8M4,Tsawassen,Canada',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BIDAULT','Marie-Reine','B s Beverages,EC2 5NT,London,Royaume-Uni',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'Kala','William','Cerrito 333,1010,Buenos Aires,Argentine',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'PESNOT','Laurent','Sierras de Granada 9993,5022,Mexico D.F.,Mexique',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'CAPRON','Claude','Hauptstr. 29,3012,Bern,Suisse',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'VIDON','William','Av. dos Luseadas 23,05432-043,Sao Paulo,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BERDUGO','Tom','Berkeley Gardens12  Brewery ,WX1 6LT,London,Royaume-Uni',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'ROTENBERG','Michel','Walserweg 21,52066,Aachen,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'ZANOTI','Monique','67 rue des Cinquante Otages,44000,Nantes,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'GARCIA','Ghyslaine','35 King George,WX3 6FW,London,Royaume-Uni',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'VIAND','Monique','Kirchgasse 6,8010,Graz,Autriche',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'CHEHMAT','Jocelyne','Rua Oras 92,05442-030,Sao Paulo,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BENSIMON','Elisabeth','Moralzarzal 86,28034,Madrid,Espagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'DUPRÉ','Sophie','184 chaussée de Tournai,59000,Lille,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'DURAND-RENIER','Brad','Okergatan 24,S844 67,Bracke,Suède',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MERCIER','Evelyne','Berliner Platz 43,80805,Munchen,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BARNAUD','Janine','54 rue Royale,44000,Nantes,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'SARFATI','Pascal','Via Monte Bianco 34,10100,Torino,Italie',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'AMELLAL','Henri','Jardim das rosas n. 32,1675,Lisboa,Portugal',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'SACCHET','Sophia','Rambla de Cataluna 23,8022,Barcelona,Espagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BOUZCKAR','Ghislaine','Romero 33,41101,Sevilla,Espagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'VINET','Delia','Av. Brasil 442,SP,Campinas,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'CRIÉ','Michel','2732 Baker Blvd.,OR,Eugene,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'HERSELIN','Brigitte','5 Ave. Los Palos Grandes,DF,Caracas,Venezuela',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'CARRERA','Victor','Rua do Pavo 67,05454-876,Rio de Janeiro,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'LOUAPRE','Louisette','Carrera 22 con Ave. Carlos Soublette #8-35,5022,San Cristobal,Venezuela',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'LAUB','Nicole','City Center Plaza516 Main St.,97827,Elgin,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'ZAOUI','Liliane','8 Johnstown Road,Co. Cork,Cork,Irlande',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'AMARA','Nicolas','Garden HouseCrowther Way,Isle of Wight,Cowes,Royaume-Uni',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'FERNANDEZ','Suzanne','Maubelstr. 90,14776,Brandenburg,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'SURENA','Adrienne','67 avenue de l''Europe,78000,Versailles,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MIANET','Georges','1 rue Alsace-Lorraine,31000,Toulouse,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'FAURE','Simone','1900 Oak St.,BC,Vancouver,Canada',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MARTIN','Franz','12 Orchestra Terrace,WA,Walla Walla,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'CHHUOR','Anne-Marie','Magazinweg 7,60528,Frankfurt a.M. ,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'TAIEB','Mickael','87 Polk St.Suite 5,CA,San Francisco,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'HERMANT','Jean-Pierre','Carrera 52 con Ave. Bolevar #65-98 Llano Largo,Lara,Barquisimeto,Venezuela',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'RIEGERT','Raymonde','Ave. 5 de Mayo Porlamar,Nueva Esparta,I. de Margarita,Venezuela',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'LE LOCH','Nicole','89 Chiaroscuro Rd.,OR,Portland,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'DUROC','Annie','Via Ludovico il Moro 22,24100,Bergamo,Italie',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'GUILLE','Jean','Rue Joseph-Bens 532,B-1180,Bruxelles,Belgique',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BLANC','Giséle','43 rue St. Laurent,Québec,Montréal,Canada',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'LEBAS','Eliane','Heerstr. 22,4179,Leipzig,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'THOQUENNE','Lydia','South House300 Queensbridge,SW7 1RZ,London,Royaume-Uni',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'POTRIQUET','Claudette','Ing. Gustavo Moncada 8585Piso 20-A,1010,Buenos Aires,Argentine',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'RIESI','François','2743 Bering St.,AK,Anchorage,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'STOEFFLER','James','Mehrheimerstr. 369,50739,Koln,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'D''HÉROUVILLE','Yolande','265 boulevard Charonne,75012,Paris,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'FAVRE','Dany','Calle Dr. Jorge Cash 321,5033,Mexico D.F.,Mexique',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'SCHUSTER','Bernadette','Geislweg 14,5020,Salzburg,Autriche',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BERTOLO','Claudie','Estrada da savade n. 58,1756,Lisboa,Portugal',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'FAUQUIER','Mireille','Rua da Panificadora 12,RJ,Rio de Janeiro,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'ABENHAÏM','Myriam','Alameda dos Canarios 891,SP,Sao Paulo,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MERLAUD','Jacqueline','Taucherstraue 10,1307,Cunewalde,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'FEDON','Marie-Claude','Av. del Libertador 900,1010,Buenos Aires,Argentine',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'RODIER','Régis','2817 Milton Dr.,NM,Albuquerque,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BLANCHOT','Guy','Strada Provinciale 124,42100,Reggio Emilia,Italie',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'TARDIF','Marie-Paule','Av. Copacabana 267,RJ,Rio de Janeiro,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'DEAUCOURT','Christine','Grenzacherweg 237,1203,Genève,Suisse',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'RAMOND','Vincent','Gran Vua 1,28001,Madrid,Espagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'POISSON','Daniel','Erling Skakkes gate 78,4110,Stavern,Norvège',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'HEURAUX','Catherine','187 Suffolk Ln.,ID,Boise,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'LE BARBANCHON','Jeanine','90 Wadhurst Rd.,OX15 4NB,London,Royaume-Uni',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'ZENOU','Robert','Vinbatet 34,1734,Kobenhavn,Danemark',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'DEFRANCE','Françoise','25 rue Lauriston,75016,Paris,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'GUELT','Monique','P.O. Box 555,WY,Lander,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'LE PREVOST','Giséle','Boulevard Tirou 255,B-6000,Charleroi,Belgique',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MARTIN','France','89 Jefferson WaySuite 2,OR,Portland,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'PUAULT','Sylvanna','55 Grizzly Peak Rd.,MT,Butte,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'REBY-FAYARD','Luc','Luisenstr. 48,44087,Munster,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'GHIBAUDO','Nicole','Avda. Azteca 123,5033,Mexico D.F.,Mexique',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'SENG','Sophia','Av. Ines de Castro 414,SP,Sao Paulo,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'CAILLOT','Jocelyne','722 DaVinci Blvd.,WA,Kirkland,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'RAGEUL','Marielle','Smagslget 45,8200,Arhus,Danemark',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'SINSEAU','Annie','2 rue du Commerce,69004,Lyon,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'FRENOIS','Giséle','59 rue de l''Abbaye,51100,Reims,France',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'KAC','Christine','Adenauerallee 900,70563,Stuttgart,Allemagne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MARINIER','Christiane','Torikatu 38,90110,Oulu,Finlande',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MONTFORT','Huong','Rua do Mercado 12,SP,Resende,Brésil',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'MIANET','Sophia','305 - 14th Ave. S.Suite 3B,WA,Seattle,Etats-Unis',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'femme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BINET','Emmanuel','Keskuskatu 45,21240,Helsinki,Finlande',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
INSERT INTO CLIENT VALUES(client_seq.nextval,'BENSIMHON','Pascal','ul. Filtrowa 68,01-012,Warszawa,Pologne',	TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2433283,2433283+40*364)),'J')	,'homme');
Commit ;


INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Chai.Boissons.Thé',			703	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Chang.Boissons.Thé',			989	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Aniseed Syrup.Condiments',			702	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Chef Anton s Cajun Seasoning.Condiments',			772	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Chef Anton s Gumbo Mix.Condiments',			727	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Grandma s Boysenberry Spread.Condiments',			577	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Uncle Bob s Organic Dried Pears.Produits secs',			782	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Northwoods Cranberry Sauce.Condiments',			817	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Mishi Kobe Niku.Produits laitiers',			802	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Ikura.Viandes',			841	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Queso Cabrales.Pâtes et céréales',			503	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Queso Manchego La Pastora.Pâtes et céréales',			812	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Konbu.Viandes',			678	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Tofu.Produits secs',			874	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Genen Shouyu.Condiments',			886	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Pavlova.Desserts',			901	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Alice Mutton.Produits laitiers',			880	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Carnarvon Tigers.Viandes',			673	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Teatime Chocolate Biscuits.Desserts.Biscuits',			523	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Sir Rodney s Marmalade.Desserts.Confiture',			590	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Sir Rodney s Scones.Desserts',			778	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Gustaf s Knackebrod.Poissons et fruits de mer',			967	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Tunnbrod.Poissons et fruits de mer',			713	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Guarana Fantastica.Boissons.Jus',			723	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'NuNuCa Nuss-Nougat-Creme.Desserts.Creme',			988	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Gumbar Gummibarchen.Desserts.Biscuits',			649	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Schoggi Schokolade.Desserts.Chocolat',			561	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Rossle Sauerkraut.Produits secs',			514	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Thuringer Rostbratwurst.Produits laitiers',			743	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Nord-Ost Matjeshering.Viandes',			791	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Gorgonzola Telino.Pâtes et céréales.Fromage',			871	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Mascarpone Fabioli.Pâtes et céréales.Fromage',			519	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Geitost.Pâtes et céréales.Fromage',			727	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Sasquatch Ale.Boissons.Vins',			745	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Steeleye Stout.Boissons.Vins',			553	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Inlagd Sill.Viandes',			872	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Gravad lax.Viandes',			784	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Côte de Blaye.Boissons.Vins',			648	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Chartreuse verte.Boissons.Vins',			786	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Boston Crab Meat.Viandes',			954	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Jack s New England Clam Chowder.Viandes',			926	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Singaporean Hokkien Fried Mee.Poissons et fruits de mer',			632	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Ipoh Coffee.Boissons.Café',			873	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Gula Malacca.Condiments',			541	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Rogede sild.Viandes',			843	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Spegesild.Viandes',			599	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Zaanse koeken.Desserts.Creme',			505	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Chocolade.Desserts.Chocolat',			647	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Maxilaku.Desserts.Creme',			591	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Valkoinen suklaa.Desserts.Creme',			678	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Manjimup Dried Apples.Produits secs',			647	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Filo Mix.Poissons et fruits de mer',			571	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Perth Pasties.Produits laitiers',			787	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Tourtière.Produits laitiers',			682	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Pâté chinois.Produits laitiers',			604	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Gnocchi di nonna Alice.Poissons et fruits de mer',			890	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Ravioli Angelo.Poissons et fruits de mer',			654	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Escargots de Bourgogne.Viandes',			505	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Raclette Courdavault.Pâtes et céréales.Fromage',			978	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Camembert Pierrot.Pâtes et céréales.Fromage',			526	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Sirop d''érable.Condiments',			868	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Tarte au sucre.Desserts.Biscuits',			831	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Vegie-spread.Condiments',			562	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Wimmers gute Semmelknodel.Poissons et fruits de mer',			971	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Louisiana Fiery Hot Pepper Sauce.Condiments',			764	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Louisiana Hot Spiced Okra.Condiments',			643	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Laughing Lumberjack Lager.Boissons',			770	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Scottish Longbreads.Desserts.Creme',			822	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Gudbrandsdalsost.Pâtes et céréales',			505	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Outback Lager.Boissons',			555	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Flotemysost.Pâtes et céréales',			950	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Mozzarella di Giovanni.Pâtes et céréales.Fromage',			741	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Rod Kaviar.Viandes',			578	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Longlife Tofu.Produits secs',			735	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Rhonbrau Klosterbier.Boissons.Vins',			787	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Lakkalikoori.Boissons',			805	);
INSERT INTO PRODUIT VALUES(produit_seq.nextval,'Original Frankfurter grune Sosse.Condiments',			575	);
Commit ;

-- creation de la facture 1
insert into FACTURE(num,client,date_etabli) values (1,18,'2/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (1,40,'2/1/2015',4.01,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (1,40,1,1);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (2,69,'2/1/2015',6.51,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (1,69,2,2);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (3,3,'2/1/2015',4.57,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (1,3,1,3);
-- creation de la facture 2
insert into FACTURE(num,client,date_etabli) values (2,80,'3/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (4,25,'3/1/2015',7.34,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (2,25,1,4);
-- creation de la facture 3
insert into FACTURE(num,client,date_etabli) values (3,12,'4/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (5,54,'4/1/2015',2.83,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (3,54,1,5);
-- creation de la facture 4
insert into FACTURE(num,client,date_etabli) values (4,10,'4/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (6,35,'4/1/2015',2.93,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (4,35,1,6);
-- creation de la facture 5
insert into FACTURE(num,client,date_etabli) values (5,78,'4/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (7,15,'4/1/2015',2.57,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (5,15,2,7);
-- creation de la facture 6
insert into FACTURE(num,client,date_etabli) values (6,2,'5/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (8,66,'5/1/2015',5.19,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (6,66,2,8);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (9,4,'5/1/2015',3.95,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (6,4,1,9);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (10,78,'5/1/2015',7.22,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (6,78,2,10);
-- creation de la facture 7
insert into FACTURE(num,client,date_etabli) values (7,29,'6/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (11,28,'6/1/2015',7.75,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (7,28,2,11);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (12,58,'6/1/2015',9.14,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (7,58,2,12);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (13,60,'6/1/2015',9.98,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (7,60,1,13);
-- creation de la facture 8
insert into FACTURE(num,client,date_etabli) values (8,33,'6/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (14,14,'6/1/2015',6.79,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (8,14,1,14);
-- creation de la facture 9
insert into FACTURE(num,client,date_etabli) values (9,31,'7/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (15,67,'7/1/2015',7.74,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (9,67,1,15);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (16,15,'7/1/2015',9.65,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (9,15,2,16);
-- creation de la facture 10
insert into FACTURE(num,client,date_etabli) values (10,45,'9/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (17,46,'9/1/2015',4.88,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (10,46,2,17);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (18,70,'9/1/2015',4.76,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (10,70,1,18);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (19,63,'9/1/2015',6.92,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (10,63,1,19);
-- creation de la facture 11
insert into FACTURE(num,client,date_etabli) values (11,62,'10/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (20,73,'10/1/2015',8.2,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (11,73,2,20);
-- creation de la facture 12
insert into FACTURE(num,client,date_etabli) values (12,60,'10/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (21,62,'10/1/2015',3.54,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (12,62,2,21);
-- creation de la facture 13
insert into FACTURE(num,client,date_etabli) values (13,36,'11/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (22,64,'11/1/2015',1.97,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (13,64,2,22);
-- creation de la facture 14
insert into FACTURE(num,client,date_etabli) values (14,46,'13/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (23,71,'13/1/2015',8.36,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (14,71,2,23);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (24,5,'13/1/2015',9.56,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (14,5,2,24);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (25,26,'13/1/2015',1.36,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (14,26,2,25);
-- creation de la facture 15
insert into FACTURE(num,client,date_etabli) values (15,32,'13/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (26,62,'13/1/2015',1.04,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (15,62,2,26);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (27,17,'13/1/2015',9.5,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (15,17,2,27);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (28,64,'13/1/2015',9.86,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (15,64,2,28);
-- creation de la facture 16
insert into FACTURE(num,client,date_etabli) values (16,39,'14/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (29,63,'14/1/2015',3.82,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (16,63,2,29);
-- creation de la facture 17
insert into FACTURE(num,client,date_etabli) values (17,5,'14/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (30,65,'14/1/2015',9.31,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (17,65,2,30);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (31,6,'14/1/2015',9.51,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (17,6,2,31);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (32,57,'14/1/2015',8.39,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (17,57,2,32);
-- creation de la facture 18
insert into FACTURE(num,client,date_etabli) values (18,10,'14/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (33,8,'14/1/2015',8.81,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (18,8,1,33);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (34,2,'14/1/2015',5.45,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (18,2,2,34);
-- creation de la facture 19
insert into FACTURE(num,client,date_etabli) values (19,84,'15/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (35,11,'15/1/2015',4.4,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (19,11,2,35);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (36,4,'15/1/2015',1.5,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (19,4,1,36);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (37,49,'15/1/2015',6.19,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (19,49,1,37);
-- creation de la facture 20
insert into FACTURE(num,client,date_etabli) values (20,63,'17/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (38,44,'17/1/2015',4.84,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (20,44,2,38);
-- creation de la facture 21
insert into FACTURE(num,client,date_etabli) values (21,37,'17/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (39,57,'17/1/2015',5.32,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (21,57,1,39);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (40,9,'17/1/2015',9.85,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (21,9,2,40);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (41,11,'17/1/2015',8.86,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (21,11,1,41);
-- creation de la facture 22
insert into FACTURE(num,client,date_etabli) values (22,28,'18/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (42,39,'18/1/2015',1.24,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (22,39,2,42);
-- creation de la facture 23
insert into FACTURE(num,client,date_etabli) values (23,72,'20/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (43,56,'20/1/2015',1.84,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (23,56,2,43);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (44,35,'20/1/2015',2.77,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (23,35,2,44);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (45,7,'20/1/2015',9.59,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (23,7,2,45);
-- creation de la facture 24
insert into FACTURE(num,client,date_etabli) values (24,18,'22/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (46,43,'22/1/2015',6.09,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (24,43,2,46);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (47,36,'22/1/2015',1.94,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (24,36,2,47);
-- creation de la facture 25
insert into FACTURE(num,client,date_etabli) values (25,36,'24/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (48,12,'24/1/2015',2.69,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (25,12,2,48);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (49,44,'24/1/2015',8.59,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (25,44,2,49);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (50,18,'24/1/2015',9.49,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (25,18,1,50);
-- creation de la facture 26
insert into FACTURE(num,client,date_etabli) values (26,68,'24/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (51,25,'24/1/2015',4.67,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (26,25,1,51);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (52,30,'24/1/2015',8.11,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (26,30,1,52);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (53,64,'24/1/2015',5.2,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (26,64,1,53);
-- creation de la facture 27
insert into FACTURE(num,client,date_etabli) values (27,46,'25/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (54,54,'25/1/2015',3.17,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (27,54,2,54);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (55,22,'25/1/2015',6.48,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (27,22,2,55);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (56,62,'25/1/2015',8.18,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (27,62,2,56);
-- creation de la facture 28
insert into FACTURE(num,client,date_etabli) values (28,18,'27/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (57,76,'27/1/2015',5.7,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (28,76,2,57);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (58,41,'27/1/2015',7.6,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (28,41,2,58);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (59,54,'27/1/2015',6.72,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (28,54,1,59);
-- creation de la facture 29
insert into FACTURE(num,client,date_etabli) values (29,19,'28/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (60,64,'28/1/2015',7.47,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (29,64,1,60);
-- creation de la facture 30
insert into FACTURE(num,client,date_etabli) values (30,70,'28/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (61,19,'28/1/2015',5.94,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (30,19,1,61);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (62,53,'28/1/2015',8.33,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (30,53,2,62);
-- creation de la facture 31
insert into FACTURE(num,client,date_etabli) values (31,54,'28/1/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (63,59,'28/1/2015',6.34,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (31,59,2,63);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (64,76,'28/1/2015',4.32,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (31,76,2,64);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (65,17,'28/1/2015',8.14,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (31,17,1,65);
-- creation de la facture 32
insert into FACTURE(num,client,date_etabli) values (32,88,'1/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (66,43,'1/2/2015',5.07,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (32,43,2,66);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (67,3,'1/2/2015',2.34,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (32,3,2,67);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (68,14,'1/2/2015',7.37,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (32,14,1,68);
-- creation de la facture 33
insert into FACTURE(num,client,date_etabli) values (33,46,'2/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (69,74,'2/2/2015',2.43,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (33,74,1,69);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (70,77,'2/2/2015',7.25,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (33,77,2,70);
-- creation de la facture 34
insert into FACTURE(num,client,date_etabli) values (34,66,'3/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (71,30,'3/2/2015',6.94,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (34,30,1,71);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (72,68,'3/2/2015',5.27,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (34,68,1,72);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (73,41,'3/2/2015',7.6,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (34,41,2,73);
-- creation de la facture 35
insert into FACTURE(num,client,date_etabli) values (35,35,'4/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (74,25,'4/2/2015',8.05,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (35,25,1,74);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (75,73,'4/2/2015',2.6,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (35,73,2,75);
-- creation de la facture 36
insert into FACTURE(num,client,date_etabli) values (36,23,'5/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (76,32,'5/2/2015',4.18,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (36,32,1,76);
-- creation de la facture 37
insert into FACTURE(num,client,date_etabli) values (37,41,'7/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (77,9,'7/2/2015',3.5,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (37,9,2,77);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (78,57,'7/2/2015',2.32,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (37,57,1,78);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (79,47,'7/2/2015',7.16,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (37,47,2,79);
-- creation de la facture 38
insert into FACTURE(num,client,date_etabli) values (38,44,'9/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (80,45,'9/2/2015',3.18,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (38,45,2,80);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (81,23,'9/2/2015',9.9,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (38,23,1,81);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (82,77,'9/2/2015',7.05,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (38,77,2,82);
-- creation de la facture 39
insert into FACTURE(num,client,date_etabli) values (39,49,'9/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (83,26,'9/2/2015',8.48,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (39,26,2,83);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (84,21,'9/2/2015',9.4,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (39,21,2,84);
-- creation de la facture 40
insert into FACTURE(num,client,date_etabli) values (40,8,'10/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (85,13,'10/2/2015',3.92,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (40,13,1,85);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (86,59,'10/2/2015',1.88,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (40,59,2,86);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (87,30,'10/2/2015',8.72,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (40,30,2,87);
-- creation de la facture 41
insert into FACTURE(num,client,date_etabli) values (41,88,'11/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (88,66,'11/2/2015',8.01,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (41,66,1,88);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (89,70,'11/2/2015',5.12,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (41,70,2,89);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (90,23,'11/2/2015',7.85,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (41,23,2,90);
-- creation de la facture 42
insert into FACTURE(num,client,date_etabli) values (42,30,'11/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (91,50,'11/2/2015',1.29,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (42,50,1,91);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (92,34,'11/2/2015',2.6,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (42,34,2,92);
-- creation de la facture 43
insert into FACTURE(num,client,date_etabli) values (43,46,'11/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (93,61,'11/2/2015',2.5,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (43,61,1,93);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (94,29,'11/2/2015',5.33,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (43,29,1,94);
-- creation de la facture 44
insert into FACTURE(num,client,date_etabli) values (44,59,'13/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (95,50,'13/2/2015',2.83,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (44,50,2,95);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (96,74,'13/2/2015',4.53,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (44,74,2,96);
-- creation de la facture 45
insert into FACTURE(num,client,date_etabli) values (45,45,'15/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (97,2,'15/2/2015',8.88,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (45,2,1,97);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (98,52,'15/2/2015',3.36,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (45,52,2,98);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (99,75,'15/2/2015',7.27,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (45,75,1,99);
-- creation de la facture 46
insert into FACTURE(num,client,date_etabli) values (46,70,'15/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (100,33,'15/2/2015',3.72,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (46,33,2,100);
-- creation de la facture 47
insert into FACTURE(num,client,date_etabli) values (47,38,'16/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (101,27,'16/2/2015',6.58,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (47,27,1,101);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (102,25,'16/2/2015',1.27,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (47,25,2,102);
-- creation de la facture 48
insert into FACTURE(num,client,date_etabli) values (48,4,'17/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (103,46,'17/2/2015',7.73,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (48,46,1,103);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (104,64,'17/2/2015',4.84,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (48,64,2,104);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (105,69,'17/2/2015',2.14,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (48,69,1,105);
-- creation de la facture 49
insert into FACTURE(num,client,date_etabli) values (49,63,'19/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (106,46,'19/2/2015',7.69,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (49,46,2,106);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (107,10,'19/2/2015',4.57,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (49,10,1,107);
-- creation de la facture 50
insert into FACTURE(num,client,date_etabli) values (50,82,'20/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (108,37,'20/2/2015',6.66,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (50,37,2,108);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (109,20,'20/2/2015',1.52,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (50,20,1,109);
-- creation de la facture 51
insert into FACTURE(num,client,date_etabli) values (51,35,'21/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (110,47,'21/2/2015',7.17,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (51,47,1,110);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (111,17,'21/2/2015',3.25,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (51,17,1,111);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (112,5,'21/2/2015',8.08,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (51,5,2,112);
-- creation de la facture 52
insert into FACTURE(num,client,date_etabli) values (52,35,'23/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (113,23,'23/2/2015',8.92,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (52,23,2,113);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (114,63,'23/2/2015',2.39,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (52,63,1,114);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (115,24,'23/2/2015',4.94,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (52,24,1,115);
-- creation de la facture 53
insert into FACTURE(num,client,date_etabli) values (53,16,'24/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (116,30,'24/2/2015',6.73,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (53,30,2,116);
-- creation de la facture 54
insert into FACTURE(num,client,date_etabli) values (54,43,'24/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (117,32,'24/2/2015',1.39,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (54,32,2,117);
-- creation de la facture 55
insert into FACTURE(num,client,date_etabli) values (55,10,'24/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (118,24,'24/2/2015',4.71,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (55,24,1,118);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (119,3,'24/2/2015',2.34,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (55,3,1,119);
-- creation de la facture 56
insert into FACTURE(num,client,date_etabli) values (56,90,'25/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (120,4,'25/2/2015',3.83,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (56,4,2,120);
-- creation de la facture 57
insert into FACTURE(num,client,date_etabli) values (57,52,'25/2/2015');
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (57,4,1,120);
-- creation de la facture 58
insert into FACTURE(num,client,date_etabli) values (58,92,'26/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (121,63,'26/2/2015',3.7,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (58,63,1,121);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (122,48,'26/2/2015',3.16,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (58,48,1,122);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (123,72,'26/2/2015',2.04,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (58,72,2,123);
-- creation de la facture 59
insert into FACTURE(num,client,date_etabli) values (59,24,'26/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (124,25,'26/2/2015',1.19,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (59,25,2,124);
-- creation de la facture 60
insert into FACTURE(num,client,date_etabli) values (60,21,'27/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (125,8,'27/2/2015',9.12,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (60,8,2,125);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (126,6,'27/2/2015',6.65,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (60,6,2,126);
-- creation de la facture 61
insert into FACTURE(num,client,date_etabli) values (61,38,'28/2/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (127,41,'28/2/2015',7.25,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (61,41,2,127);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (128,48,'28/2/2015',4.36,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (61,48,2,128);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (129,29,'28/2/2015',4.04,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (61,29,1,129);
-- creation de la facture 62
insert into FACTURE(num,client,date_etabli) values (62,32,'2/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (130,77,'2/3/2015',5.76,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (62,77,2,130);
-- creation de la facture 63
insert into FACTURE(num,client,date_etabli) values (63,83,'2/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (131,10,'2/3/2015',2.81,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (63,10,2,131);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (132,19,'2/3/2015',4.64,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (63,19,1,132);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (133,45,'2/3/2015',8.84,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (63,45,2,133);
-- creation de la facture 64
insert into FACTURE(num,client,date_etabli) values (64,13,'4/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (134,25,'4/3/2015',6.81,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (64,25,1,134);
-- creation de la facture 65
insert into FACTURE(num,client,date_etabli) values (65,12,'5/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (135,48,'5/3/2015',4.38,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (65,48,2,135);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (136,74,'5/3/2015',1.77,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (65,74,2,136);
-- creation de la facture 66
insert into FACTURE(num,client,date_etabli) values (66,42,'6/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (137,25,'6/3/2015',2.65,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (66,25,2,137);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (138,33,'6/3/2015',5.95,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (66,33,1,138);
-- creation de la facture 67
insert into FACTURE(num,client,date_etabli) values (67,29,'7/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (139,57,'7/3/2015',6.59,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (67,57,1,139);
-- creation de la facture 68
insert into FACTURE(num,client,date_etabli) values (68,88,'7/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (140,45,'7/3/2015',1.49,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (68,45,1,140);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (141,4,'7/3/2015',7.98,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (68,4,1,141);
-- creation de la facture 69
insert into FACTURE(num,client,date_etabli) values (69,51,'8/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (142,13,'8/3/2015',9.57,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (69,13,2,142);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (143,15,'8/3/2015',7.94,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (69,15,2,143);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (144,46,'8/3/2015',9.37,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (69,46,2,144);
-- creation de la facture 70
insert into FACTURE(num,client,date_etabli) values (70,55,'10/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (145,59,'10/3/2015',5.33,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (70,59,1,145);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (146,4,'10/3/2015',1.57,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (70,4,1,146);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (147,27,'10/3/2015',5.12,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (70,27,1,147);
-- creation de la facture 71
insert into FACTURE(num,client,date_etabli) values (71,56,'12/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (148,30,'12/3/2015',2.86,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (71,30,1,148);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (149,75,'12/3/2015',8.67,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (71,75,2,149);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (150,53,'12/3/2015',1.17,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (71,53,2,150);
-- creation de la facture 72
insert into FACTURE(num,client,date_etabli) values (72,82,'12/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (151,3,'12/3/2015',8.64,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (72,3,1,151);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (152,6,'12/3/2015',4.47,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (72,6,2,152);
-- creation de la facture 73
insert into FACTURE(num,client,date_etabli) values (73,30,'14/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (153,2,'14/3/2015',6.31,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (73,2,1,153);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (154,49,'14/3/2015',5.74,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (73,49,2,154);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (155,36,'14/3/2015',5.14,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (73,36,2,155);
-- creation de la facture 74
insert into FACTURE(num,client,date_etabli) values (74,51,'16/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (156,7,'16/3/2015',3.23,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (74,7,2,156);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (157,52,'16/3/2015',2.58,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (74,52,2,157);
-- creation de la facture 75
insert into FACTURE(num,client,date_etabli) values (75,45,'17/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (158,47,'17/3/2015',2.1,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (75,47,1,158);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (159,66,'17/3/2015',5.84,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (75,66,2,159);
-- creation de la facture 76
insert into FACTURE(num,client,date_etabli) values (76,10,'17/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (160,54,'17/3/2015',9.37,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (76,54,2,160);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (161,12,'17/3/2015',1.89,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (76,12,1,161);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (162,32,'17/3/2015',4.53,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (76,32,1,162);
-- creation de la facture 77
insert into FACTURE(num,client,date_etabli) values (77,87,'18/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (163,60,'18/3/2015',4.47,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (77,60,1,163);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (164,46,'18/3/2015',2.76,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (77,46,2,164);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (165,20,'18/3/2015',3.66,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (77,20,1,165);
-- creation de la facture 78
insert into FACTURE(num,client,date_etabli) values (78,9,'19/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (166,37,'19/3/2015',7.94,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (78,37,1,166);
-- creation de la facture 79
insert into FACTURE(num,client,date_etabli) values (79,46,'19/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (167,34,'19/3/2015',4.22,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (79,34,1,167);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (168,51,'19/3/2015',8.46,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (79,51,1,168);
-- creation de la facture 80
insert into FACTURE(num,client,date_etabli) values (80,40,'21/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (169,29,'21/3/2015',6.38,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (80,29,1,169);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (170,50,'21/3/2015',9.81,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (80,50,1,170);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (171,48,'21/3/2015',7.07,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (80,48,2,171);
-- creation de la facture 81
insert into FACTURE(num,client,date_etabli) values (81,86,'23/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (172,51,'23/3/2015',3.44,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (81,51,1,172);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (173,15,'23/3/2015',5.87,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (81,15,2,173);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (174,66,'23/3/2015',9.57,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (81,66,2,174);
-- creation de la facture 82
insert into FACTURE(num,client,date_etabli) values (82,54,'25/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (175,67,'25/3/2015',3.78,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (82,67,1,175);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (176,37,'25/3/2015',6.01,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (82,37,2,176);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (177,34,'25/3/2015',5.63,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (82,34,2,177);
-- creation de la facture 83
insert into FACTURE(num,client,date_etabli) values (83,48,'27/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (178,27,'27/3/2015',7.61,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (83,27,1,178);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (179,21,'27/3/2015',5.42,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (83,21,1,179);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (180,3,'27/3/2015',4.59,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (83,3,1,180);
-- creation de la facture 84
insert into FACTURE(num,client,date_etabli) values (84,10,'27/3/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (181,76,'27/3/2015',4.92,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (84,76,2,181);
-- creation de la facture 85
insert into FACTURE(num,client,date_etabli) values (85,81,'1/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (182,39,'1/4/2015',6.99,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (85,39,2,182);
-- creation de la facture 86
insert into FACTURE(num,client,date_etabli) values (86,15,'3/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (183,41,'3/4/2015',8.19,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (86,41,2,183);
-- creation de la facture 87
insert into FACTURE(num,client,date_etabli) values (87,41,'4/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (184,4,'4/4/2015',3.62,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (87,4,1,184);
-- creation de la facture 88
insert into FACTURE(num,client,date_etabli) values (88,45,'4/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (185,8,'4/4/2015',5.9,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (88,8,1,185);
-- creation de la facture 89
insert into FACTURE(num,client,date_etabli) values (89,81,'6/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (186,28,'6/4/2015',2.41,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (89,28,2,186);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (187,7,'6/4/2015',2.0,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (89,7,2,187);
-- creation de la facture 90
insert into FACTURE(num,client,date_etabli) values (90,76,'7/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (188,66,'7/4/2015',5.61,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (90,66,2,188);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (189,12,'7/4/2015',4.01,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (90,12,2,189);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (190,30,'7/4/2015',6.08,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (90,30,2,190);
-- creation de la facture 91
insert into FACTURE(num,client,date_etabli) values (91,51,'7/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (191,68,'7/4/2015',1.84,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (91,68,2,191);
-- creation de la facture 92
insert into FACTURE(num,client,date_etabli) values (92,20,'8/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (192,49,'8/4/2015',5.08,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (92,49,1,192);
-- creation de la facture 93
insert into FACTURE(num,client,date_etabli) values (93,11,'8/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (193,35,'8/4/2015',3.87,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (93,35,1,193);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (194,14,'8/4/2015',4.89,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (93,14,2,194);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (195,23,'8/4/2015',6.55,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (93,23,2,195);
-- creation de la facture 94
insert into FACTURE(num,client,date_etabli) values (94,40,'9/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (196,34,'9/4/2015',7.38,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (94,34,2,196);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (197,50,'9/4/2015',7.94,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (94,50,1,197);
-- creation de la facture 95
insert into FACTURE(num,client,date_etabli) values (95,22,'10/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (198,5,'10/4/2015',8.76,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (95,5,2,198);
-- creation de la facture 96
insert into FACTURE(num,client,date_etabli) values (96,40,'11/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (199,71,'11/4/2015',8.92,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (96,71,1,199);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (200,46,'11/4/2015',9.35,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (96,46,2,200);
-- creation de la facture 97
insert into FACTURE(num,client,date_etabli) values (97,2,'11/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (201,54,'11/4/2015',2.96,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (97,54,2,201);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (202,45,'11/4/2015',6.05,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (97,45,2,202);
-- creation de la facture 98
insert into FACTURE(num,client,date_etabli) values (98,20,'12/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (203,2,'12/4/2015',6.22,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (98,2,2,203);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (204,64,'12/4/2015',5.14,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (98,64,1,204);
-- creation de la facture 99
insert into FACTURE(num,client,date_etabli) values (99,26,'14/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (205,47,'14/4/2015',9.16,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (99,47,2,205);
-- creation de la facture 100
insert into FACTURE(num,client,date_etabli) values (100,58,'14/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (206,60,'14/4/2015',9.92,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (100,60,2,206);
-- creation de la facture 101
insert into FACTURE(num,client,date_etabli) values (101,37,'15/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (207,77,'15/4/2015',3.69,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (101,77,1,207);
-- creation de la facture 102
insert into FACTURE(num,client,date_etabli) values (102,81,'17/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (208,40,'17/4/2015',5.98,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (102,40,1,208);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (209,70,'17/4/2015',3.64,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (102,70,1,209);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (210,19,'17/4/2015',1.01,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (102,19,1,210);
-- creation de la facture 103
insert into FACTURE(num,client,date_etabli) values (103,62,'17/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (211,23,'17/4/2015',1.17,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (103,23,2,211);
-- creation de la facture 104
insert into FACTURE(num,client,date_etabli) values (104,85,'18/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (212,7,'18/4/2015',3.55,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (104,7,1,212);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (213,6,'18/4/2015',2.38,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (104,6,2,213);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (214,11,'18/4/2015',5.91,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (104,11,2,214);
-- creation de la facture 105
insert into FACTURE(num,client,date_etabli) values (105,83,'19/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (215,4,'19/4/2015',5.38,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (105,4,2,215);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (216,78,'19/4/2015',9.04,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (105,78,2,216);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (217,40,'19/4/2015',8.27,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (105,40,1,217);
-- creation de la facture 106
insert into FACTURE(num,client,date_etabli) values (106,54,'19/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (218,21,'19/4/2015',4.23,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (106,21,1,218);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (219,41,'19/4/2015',2.97,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (106,41,1,219);
-- creation de la facture 107
insert into FACTURE(num,client,date_etabli) values (107,45,'20/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (220,31,'20/4/2015',4.24,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (107,31,2,220);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (221,51,'20/4/2015',6.74,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (107,51,2,221);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (222,68,'20/4/2015',9.0,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (107,68,2,222);
-- creation de la facture 108
insert into FACTURE(num,client,date_etabli) values (108,49,'22/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (223,17,'22/4/2015',9.64,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (108,17,1,223);
-- creation de la facture 109
insert into FACTURE(num,client,date_etabli) values (109,75,'22/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (224,23,'22/4/2015',7.46,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (109,23,1,224);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (225,21,'22/4/2015',6.62,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (109,21,1,225);
-- creation de la facture 110
insert into FACTURE(num,client,date_etabli) values (110,92,'22/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (226,67,'22/4/2015',7.21,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (110,67,2,226);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (227,54,'22/4/2015',9.47,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (110,54,2,227);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (110,17,1,223);
-- creation de la facture 111
insert into FACTURE(num,client,date_etabli) values (111,27,'23/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (228,54,'23/4/2015',2.56,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (111,54,1,228);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (229,45,'23/4/2015',1.03,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (111,45,1,229);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (230,39,'23/4/2015',5.93,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (111,39,2,230);
-- creation de la facture 112
insert into FACTURE(num,client,date_etabli) values (112,21,'23/4/2015');
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (112,45,2,229);
-- creation de la facture 113
insert into FACTURE(num,client,date_etabli) values (113,28,'23/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (231,22,'23/4/2015',9.19,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (113,22,1,231);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (232,35,'23/4/2015',8.78,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (113,35,1,232);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (233,14,'23/4/2015',1.84,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (113,14,1,233);
-- creation de la facture 114
insert into FACTURE(num,client,date_etabli) values (114,4,'24/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (234,48,'24/4/2015',9.23,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (114,48,1,234);
-- creation de la facture 115
insert into FACTURE(num,client,date_etabli) values (115,89,'26/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (235,31,'26/4/2015',7.42,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (115,31,2,235);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (236,72,'26/4/2015',7.31,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (115,72,1,236);
-- creation de la facture 116
insert into FACTURE(num,client,date_etabli) values (116,55,'28/4/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (237,50,'28/4/2015',2.11,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (116,50,2,237);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (238,13,'28/4/2015',9.69,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (116,13,2,238);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (239,76,'28/4/2015',5.49,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (116,76,2,239);
-- creation de la facture 117
insert into FACTURE(num,client,date_etabli) values (117,15,'2/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (240,26,'2/5/2015',8.45,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (117,26,1,240);
-- creation de la facture 118
insert into FACTURE(num,client,date_etabli) values (118,89,'3/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (241,65,'3/5/2015',1.16,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (118,65,2,241);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (242,18,'3/5/2015',9.36,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (118,18,1,242);
-- creation de la facture 119
insert into FACTURE(num,client,date_etabli) values (119,75,'3/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (243,39,'3/5/2015',5.97,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (119,39,1,243);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (244,53,'3/5/2015',3.61,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (119,53,1,244);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (245,12,'3/5/2015',5.89,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (119,12,1,245);
-- creation de la facture 120
insert into FACTURE(num,client,date_etabli) values (120,81,'3/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (246,69,'3/5/2015',8.61,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (120,69,1,246);
-- creation de la facture 121
insert into FACTURE(num,client,date_etabli) values (121,74,'5/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (247,49,'5/5/2015',7.92,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (121,49,1,247);
-- creation de la facture 122
insert into FACTURE(num,client,date_etabli) values (122,59,'6/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (248,27,'6/5/2015',3.41,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (122,27,2,248);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (249,45,'6/5/2015',3.7,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (122,45,1,249);
-- creation de la facture 123
insert into FACTURE(num,client,date_etabli) values (123,6,'7/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (250,33,'7/5/2015',8.1,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (123,33,2,250);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (251,57,'7/5/2015',7.98,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (123,57,2,251);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (252,52,'7/5/2015',8.3,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (123,52,1,252);
-- creation de la facture 124
insert into FACTURE(num,client,date_etabli) values (124,21,'7/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (253,73,'7/5/2015',9.1,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (124,73,2,253);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (254,54,'7/5/2015',1.43,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (124,54,1,254);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (255,68,'7/5/2015',8.11,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (124,68,1,255);
-- creation de la facture 125
insert into FACTURE(num,client,date_etabli) values (125,71,'8/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (256,27,'8/5/2015',1.11,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (125,27,2,256);
-- creation de la facture 126
insert into FACTURE(num,client,date_etabli) values (126,11,'8/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (257,7,'8/5/2015',9.79,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (126,7,1,257);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (258,53,'8/5/2015',9.02,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (126,53,1,258);
-- creation de la facture 127
insert into FACTURE(num,client,date_etabli) values (127,64,'9/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (259,77,'9/5/2015',5.05,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (127,77,2,259);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (260,22,'9/5/2015',8.16,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (127,22,2,260);
-- creation de la facture 128
insert into FACTURE(num,client,date_etabli) values (128,30,'11/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (261,42,'11/5/2015',9.52,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (128,42,1,261);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (262,59,'11/5/2015',8.88,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (128,59,1,262);
-- creation de la facture 129
insert into FACTURE(num,client,date_etabli) values (129,35,'11/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (263,14,'11/5/2015',5.14,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (129,14,1,263);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (264,16,'11/5/2015',2.16,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (129,16,1,264);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (265,71,'11/5/2015',4.27,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (129,71,2,265);
-- creation de la facture 130
insert into FACTURE(num,client,date_etabli) values (130,2,'13/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (266,36,'13/5/2015',4.45,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (130,36,2,266);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (267,5,'13/5/2015',9.77,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (130,5,1,267);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (268,57,'13/5/2015',1.13,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (130,57,1,268);
-- creation de la facture 131
insert into FACTURE(num,client,date_etabli) values (131,55,'13/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (269,4,'13/5/2015',2.52,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (131,4,2,269);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (270,10,'13/5/2015',1.55,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (131,10,2,270);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (271,35,'13/5/2015',8.62,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (131,35,1,271);
-- creation de la facture 132
insert into FACTURE(num,client,date_etabli) values (132,35,'14/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (272,6,'14/5/2015',4.24,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (132,6,2,272);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (273,9,'14/5/2015',7.73,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (132,9,2,273);
-- creation de la facture 133
insert into FACTURE(num,client,date_etabli) values (133,38,'14/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (274,50,'14/5/2015',7.98,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (133,50,2,274);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (275,14,'14/5/2015',3.68,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (133,14,2,275);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (276,5,'14/5/2015',1.82,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (133,5,1,276);
-- creation de la facture 134
insert into FACTURE(num,client,date_etabli) values (134,47,'16/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (277,17,'16/5/2015',9.47,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (134,17,1,277);
-- creation de la facture 135
insert into FACTURE(num,client,date_etabli) values (135,87,'17/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (278,16,'17/5/2015',8.79,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (135,16,2,278);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (279,48,'17/5/2015',2.91,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (135,48,1,279);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (280,42,'17/5/2015',6.16,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (135,42,2,280);
-- creation de la facture 136
insert into FACTURE(num,client,date_etabli) values (136,19,'18/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (281,15,'18/5/2015',3.31,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (136,15,2,281);
-- creation de la facture 137
insert into FACTURE(num,client,date_etabli) values (137,59,'19/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (282,52,'19/5/2015',1.53,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (137,52,2,282);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (283,25,'19/5/2015',9.12,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (137,25,2,283);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (284,77,'19/5/2015',7.44,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (137,77,1,284);
-- creation de la facture 138
insert into FACTURE(num,client,date_etabli) values (138,48,'21/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (285,71,'21/5/2015',1.12,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (138,71,1,285);
-- creation de la facture 139
insert into FACTURE(num,client,date_etabli) values (139,88,'23/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (286,77,'23/5/2015',5.19,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (139,77,1,286);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (287,76,'23/5/2015',6.13,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (139,76,2,287);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (288,56,'23/5/2015',7.53,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (139,56,2,288);
-- creation de la facture 140
insert into FACTURE(num,client,date_etabli) values (140,33,'24/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (289,57,'24/5/2015',5.36,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (140,57,2,289);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (290,41,'24/5/2015',2.4,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (140,41,1,290);
-- creation de la facture 141
insert into FACTURE(num,client,date_etabli) values (141,20,'24/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (291,32,'24/5/2015',7.9,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (141,32,1,291);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (292,5,'24/5/2015',3.85,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (141,5,1,292);
-- creation de la facture 142
insert into FACTURE(num,client,date_etabli) values (142,26,'24/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (293,67,'24/5/2015',6.63,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (142,67,1,293);
-- creation de la facture 143
insert into FACTURE(num,client,date_etabli) values (143,6,'25/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (294,14,'25/5/2015',1.75,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (143,14,1,294);
-- creation de la facture 144
insert into FACTURE(num,client,date_etabli) values (144,28,'27/5/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (295,78,'27/5/2015',2.79,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (144,78,1,295);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (296,15,'27/5/2015',5.03,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (144,15,2,296);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (297,3,'27/5/2015',9.89,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (144,3,2,297);
-- creation de la facture 145
insert into FACTURE(num,client,date_etabli) values (145,91,'1/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (298,76,'1/6/2015',3.54,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (145,76,2,298);
-- creation de la facture 146
insert into FACTURE(num,client,date_etabli) values (146,80,'2/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (299,40,'2/6/2015',7.06,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (146,40,2,299);
-- creation de la facture 147
insert into FACTURE(num,client,date_etabli) values (147,40,'4/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (300,8,'4/6/2015',3.58,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (147,8,2,300);
-- creation de la facture 148
insert into FACTURE(num,client,date_etabli) values (148,24,'6/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (301,28,'6/6/2015',7.32,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (148,28,1,301);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (302,7,'6/6/2015',1.92,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (148,7,2,302);
-- creation de la facture 149
insert into FACTURE(num,client,date_etabli) values (149,90,'7/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (303,67,'7/6/2015',5.68,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (149,67,1,303);
-- creation de la facture 150
insert into FACTURE(num,client,date_etabli) values (150,21,'9/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (304,3,'9/6/2015',3.31,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (150,3,1,304);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (305,13,'9/6/2015',9.07,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (150,13,2,305);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (306,60,'9/6/2015',9.15,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (150,60,2,306);
-- creation de la facture 151
insert into FACTURE(num,client,date_etabli) values (151,39,'9/6/2015');
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (151,3,1,304);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (307,30,'9/6/2015',3.02,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (151,30,1,307);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (308,62,'9/6/2015',4.1,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (151,62,1,308);
-- creation de la facture 152
insert into FACTURE(num,client,date_etabli) values (152,83,'9/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (309,14,'9/6/2015',3.9,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (152,14,2,309);
-- creation de la facture 153
insert into FACTURE(num,client,date_etabli) values (153,52,'11/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (310,33,'11/6/2015',5.23,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (153,33,2,310);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (311,30,'11/6/2015',8.06,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (153,30,2,311);
-- creation de la facture 154
insert into FACTURE(num,client,date_etabli) values (154,33,'12/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (312,20,'12/6/2015',7.25,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (154,20,2,312);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (313,41,'12/6/2015',3.9,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (154,41,1,313);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (314,78,'12/6/2015',3.39,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (154,78,1,314);
-- creation de la facture 155
insert into FACTURE(num,client,date_etabli) values (155,8,'13/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (315,45,'13/6/2015',4.49,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (155,45,1,315);
-- creation de la facture 156
insert into FACTURE(num,client,date_etabli) values (156,36,'15/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (316,11,'15/6/2015',7.72,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (156,11,2,316);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (317,34,'15/6/2015',4.29,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (156,34,1,317);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (318,36,'15/6/2015',5.23,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (156,36,2,318);
-- creation de la facture 157
insert into FACTURE(num,client,date_etabli) values (157,76,'16/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (319,11,'16/6/2015',1.7,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (157,11,1,319);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (320,51,'16/6/2015',1.54,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (157,51,2,320);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (321,2,'16/6/2015',1.25,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (157,2,2,321);
-- creation de la facture 158
insert into FACTURE(num,client,date_etabli) values (158,11,'18/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (322,25,'18/6/2015',9.87,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (158,25,2,322);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (323,29,'18/6/2015',2.83,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (158,29,2,323);
-- creation de la facture 159
insert into FACTURE(num,client,date_etabli) values (159,25,'20/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (324,75,'20/6/2015',3.32,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (159,75,2,324);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (325,37,'20/6/2015',6.95,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (159,37,1,325);
-- creation de la facture 160
insert into FACTURE(num,client,date_etabli) values (160,52,'22/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (326,8,'22/6/2015',7.9,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (160,8,1,326);
-- creation de la facture 161
insert into FACTURE(num,client,date_etabli) values (161,22,'23/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (327,44,'23/6/2015',2.17,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (161,44,1,327);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (328,2,'23/6/2015',4.88,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (161,2,1,328);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (329,30,'23/6/2015',5.78,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (161,30,1,329);
-- creation de la facture 162
insert into FACTURE(num,client,date_etabli) values (162,70,'24/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (330,59,'24/6/2015',5.58,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (162,59,2,330);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (331,78,'24/6/2015',6.44,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (162,78,2,331);
-- creation de la facture 163
insert into FACTURE(num,client,date_etabli) values (163,58,'24/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (332,41,'24/6/2015',8.87,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (163,41,1,332);
-- creation de la facture 164
insert into FACTURE(num,client,date_etabli) values (164,68,'25/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (333,60,'25/6/2015',7.0,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (164,60,2,333);
-- creation de la facture 165
insert into FACTURE(num,client,date_etabli) values (165,32,'27/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (334,73,'27/6/2015',6.44,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (165,73,2,334);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (335,34,'27/6/2015',9.78,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (165,34,2,335);
-- creation de la facture 166
insert into FACTURE(num,client,date_etabli) values (166,67,'27/6/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (336,5,'27/6/2015',4.38,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (166,5,1,336);
-- creation de la facture 167
insert into FACTURE(num,client,date_etabli) values (167,63,'1/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (337,22,'1/7/2015',8.35,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (167,22,1,337);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (338,24,'1/7/2015',4.58,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (167,24,2,338);
-- creation de la facture 168
insert into FACTURE(num,client,date_etabli) values (168,58,'2/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (339,30,'2/7/2015',6.49,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (168,30,1,339);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (340,24,'2/7/2015',6.21,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (168,24,1,340);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (341,25,'2/7/2015',2.13,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (168,25,1,341);
-- creation de la facture 169
insert into FACTURE(num,client,date_etabli) values (169,10,'2/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (342,41,'2/7/2015',2.39,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (169,41,1,342);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (343,58,'2/7/2015',5.36,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (169,58,2,343);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (344,22,'2/7/2015',3.95,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (169,22,1,344);
-- creation de la facture 170
insert into FACTURE(num,client,date_etabli) values (170,92,'2/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (345,46,'2/7/2015',9.8,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (170,46,2,345);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (346,73,'2/7/2015',1.72,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (170,73,1,346);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (347,18,'2/7/2015',5.44,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (170,18,1,347);
-- creation de la facture 171
insert into FACTURE(num,client,date_etabli) values (171,88,'3/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (348,59,'3/7/2015',9.08,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (171,59,2,348);
-- creation de la facture 172
insert into FACTURE(num,client,date_etabli) values (172,62,'5/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (349,40,'5/7/2015',6.89,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (172,40,1,349);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (350,28,'5/7/2015',3.9,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (172,28,1,350);
-- creation de la facture 173
insert into FACTURE(num,client,date_etabli) values (173,58,'6/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (351,27,'6/7/2015',6.92,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (173,27,1,351);
-- creation de la facture 174
insert into FACTURE(num,client,date_etabli) values (174,27,'7/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (352,68,'7/7/2015',3.71,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (174,68,2,352);
-- creation de la facture 175
insert into FACTURE(num,client,date_etabli) values (175,81,'9/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (353,23,'9/7/2015',9.82,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (175,23,1,353);
-- creation de la facture 176
insert into FACTURE(num,client,date_etabli) values (176,30,'9/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (354,36,'9/7/2015',8.31,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (176,36,1,354);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (355,55,'9/7/2015',9.4,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (176,55,2,355);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (356,10,'9/7/2015',2.45,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (176,10,2,356);
-- creation de la facture 177
insert into FACTURE(num,client,date_etabli) values (177,85,'11/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (357,74,'11/7/2015',2.2,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (177,74,2,357);
-- creation de la facture 178
insert into FACTURE(num,client,date_etabli) values (178,55,'11/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (358,19,'11/7/2015',5.65,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (178,19,1,358);
-- creation de la facture 179
insert into FACTURE(num,client,date_etabli) values (179,15,'13/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (359,42,'13/7/2015',3.15,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (179,42,2,359);
-- creation de la facture 180
insert into FACTURE(num,client,date_etabli) values (180,47,'13/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (360,25,'13/7/2015',1.91,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (180,25,1,360);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (361,23,'13/7/2015',9.96,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (180,23,2,361);
-- creation de la facture 181
insert into FACTURE(num,client,date_etabli) values (181,22,'13/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (362,40,'13/7/2015',2.22,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (181,40,1,362);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (363,70,'13/7/2015',3.66,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (181,70,1,363);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (364,31,'13/7/2015',9.1,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (181,31,2,364);
-- creation de la facture 182
insert into FACTURE(num,client,date_etabli) values (182,74,'14/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (365,62,'14/7/2015',3.37,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (182,62,1,365);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (366,30,'14/7/2015',7.91,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (182,30,1,366);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (367,7,'14/7/2015',9.69,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (182,7,1,367);
-- creation de la facture 183
insert into FACTURE(num,client,date_etabli) values (183,57,'14/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (368,36,'14/7/2015',7.31,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (183,36,2,368);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (369,38,'14/7/2015',4.04,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (183,38,1,369);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (370,18,'14/7/2015',4.97,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (183,18,2,370);
-- creation de la facture 184
insert into FACTURE(num,client,date_etabli) values (184,81,'16/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (371,25,'16/7/2015',1.29,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (184,25,1,371);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (372,35,'16/7/2015',4.45,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (184,35,1,372);
-- creation de la facture 185
insert into FACTURE(num,client,date_etabli) values (185,51,'16/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (373,52,'16/7/2015',9.54,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (185,52,1,373);
-- creation de la facture 186
insert into FACTURE(num,client,date_etabli) values (186,63,'17/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (374,41,'17/7/2015',9.34,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (186,41,1,374);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (375,7,'17/7/2015',5.95,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (186,7,1,375);
-- creation de la facture 187
insert into FACTURE(num,client,date_etabli) values (187,46,'17/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (376,70,'17/7/2015',4.16,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (187,70,2,376);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (377,62,'17/7/2015',1.06,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (187,62,1,377);
-- creation de la facture 188
insert into FACTURE(num,client,date_etabli) values (188,85,'17/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (378,40,'17/7/2015',3.85,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (188,40,2,378);
-- creation de la facture 189
insert into FACTURE(num,client,date_etabli) values (189,38,'17/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (379,38,'17/7/2015',7.27,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (189,38,2,379);
-- creation de la facture 190
insert into FACTURE(num,client,date_etabli) values (190,19,'17/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (380,74,'17/7/2015',2.26,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (190,74,2,380);
-- creation de la facture 191
insert into FACTURE(num,client,date_etabli) values (191,82,'18/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (381,20,'18/7/2015',2.8,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (191,20,2,381);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (382,4,'18/7/2015',9.75,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (191,4,2,382);
-- creation de la facture 192
insert into FACTURE(num,client,date_etabli) values (192,36,'19/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (383,52,'19/7/2015',8.03,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (192,52,1,383);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (384,28,'19/7/2015',8.94,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (192,28,2,384);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (385,60,'19/7/2015',9.06,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (192,60,1,385);
-- creation de la facture 193
insert into FACTURE(num,client,date_etabli) values (193,13,'21/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (386,34,'21/7/2015',2.54,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (193,34,1,386);
-- creation de la facture 194
insert into FACTURE(num,client,date_etabli) values (194,46,'22/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (387,45,'22/7/2015',1.07,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (194,45,1,387);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (388,78,'22/7/2015',3.04,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (194,78,1,388);
-- creation de la facture 195
insert into FACTURE(num,client,date_etabli) values (195,37,'22/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (389,16,'22/7/2015',2.97,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (195,16,2,389);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (390,5,'22/7/2015',4.51,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (195,5,2,390);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (391,33,'22/7/2015',5.02,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (195,33,2,391);
-- creation de la facture 196
insert into FACTURE(num,client,date_etabli) values (196,7,'23/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (392,41,'23/7/2015',8.41,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (196,41,2,392);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (393,10,'23/7/2015',2.66,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (196,10,2,393);
-- creation de la facture 197
insert into FACTURE(num,client,date_etabli) values (197,22,'24/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (394,50,'24/7/2015',3.96,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (197,50,2,394);
-- creation de la facture 198
insert into FACTURE(num,client,date_etabli) values (198,4,'24/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (395,77,'24/7/2015',7.59,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (198,77,2,395);
-- creation de la facture 199
insert into FACTURE(num,client,date_etabli) values (199,12,'26/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (396,75,'26/7/2015',1.22,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (199,75,1,396);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (397,53,'26/7/2015',7.87,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (199,53,1,397);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (398,27,'26/7/2015',8.29,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (199,27,2,398);
-- creation de la facture 200
insert into FACTURE(num,client,date_etabli) values (200,50,'27/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (399,43,'27/7/2015',8.76,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (200,43,1,399);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (400,30,'27/7/2015',5.44,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (200,30,2,400);
-- creation de la facture 201
insert into FACTURE(num,client,date_etabli) values (201,37,'28/7/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (401,66,'28/7/2015',7.23,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (201,66,1,401);
-- creation de la facture 202
insert into FACTURE(num,client,date_etabli) values (202,46,'2/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (402,40,'2/8/2015',3.1,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (202,40,1,402);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (403,72,'2/8/2015',3.71,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (202,72,2,403);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (404,48,'2/8/2015',1.76,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (202,48,1,404);
-- creation de la facture 203
insert into FACTURE(num,client,date_etabli) values (203,51,'3/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (405,46,'3/8/2015',4.17,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (203,46,2,405);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (406,12,'3/8/2015',5.13,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (203,12,1,406);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (407,57,'3/8/2015',4.1,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (203,57,2,407);
-- creation de la facture 204
insert into FACTURE(num,client,date_etabli) values (204,54,'3/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (408,32,'3/8/2015',7.32,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (204,32,1,408);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (409,5,'3/8/2015',3.4,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (204,5,1,409);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (410,11,'3/8/2015',7.97,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (204,11,1,410);
-- creation de la facture 205
insert into FACTURE(num,client,date_etabli) values (205,73,'4/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (411,11,'4/8/2015',3.13,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (205,11,1,411);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (412,58,'4/8/2015',3.08,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (205,58,1,412);
-- creation de la facture 206
insert into FACTURE(num,client,date_etabli) values (206,79,'4/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (413,10,'4/8/2015',4.7,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (206,10,1,413);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (414,57,'4/8/2015',9.2,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (206,57,1,414);
-- creation de la facture 207
insert into FACTURE(num,client,date_etabli) values (207,31,'6/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (415,43,'6/8/2015',3.07,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (207,43,1,415);
-- creation de la facture 208
insert into FACTURE(num,client,date_etabli) values (208,41,'7/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (416,54,'7/8/2015',8.64,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (208,54,2,416);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (417,3,'7/8/2015',8.97,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (208,3,1,417);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (418,38,'7/8/2015',5.92,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (208,38,1,418);
-- creation de la facture 209
insert into FACTURE(num,client,date_etabli) values (209,89,'8/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (419,15,'8/8/2015',2.02,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (209,15,2,419);
-- creation de la facture 210
insert into FACTURE(num,client,date_etabli) values (210,10,'8/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (420,24,'8/8/2015',4.64,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (210,24,1,420);
-- creation de la facture 211
insert into FACTURE(num,client,date_etabli) values (211,24,'9/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (421,62,'9/8/2015',1.95,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (211,62,1,421);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (422,24,'9/8/2015',8.78,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (211,24,2,422);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (423,69,'9/8/2015',1.59,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (211,69,2,423);
-- creation de la facture 212
insert into FACTURE(num,client,date_etabli) values (212,13,'11/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (424,41,'11/8/2015',9.76,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (212,41,2,424);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (425,64,'11/8/2015',7.99,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (212,64,1,425);
-- creation de la facture 213
insert into FACTURE(num,client,date_etabli) values (213,70,'13/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (426,78,'13/8/2015',1.45,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (213,78,1,426);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (427,29,'13/8/2015',6.4,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (213,29,1,427);
-- creation de la facture 214
insert into FACTURE(num,client,date_etabli) values (214,32,'14/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (428,55,'14/8/2015',7.28,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (214,55,1,428);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (429,49,'14/8/2015',5.47,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (214,49,1,429);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (430,78,'14/8/2015',9.11,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (214,78,1,430);
-- creation de la facture 215
insert into FACTURE(num,client,date_etabli) values (215,59,'14/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (431,26,'14/8/2015',4.45,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (215,26,1,431);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (432,52,'14/8/2015',7.06,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (215,52,2,432);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (433,73,'14/8/2015',7.44,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (215,73,1,433);
-- creation de la facture 216
insert into FACTURE(num,client,date_etabli) values (216,34,'15/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (434,4,'15/8/2015',3.32,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (216,4,2,434);
-- creation de la facture 217
insert into FACTURE(num,client,date_etabli) values (217,80,'16/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (435,73,'16/8/2015',7.77,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (217,73,2,435);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (436,71,'16/8/2015',1.93,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (217,71,2,436);
-- creation de la facture 218
insert into FACTURE(num,client,date_etabli) values (218,64,'17/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (437,14,'17/8/2015',7.84,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (218,14,1,437);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (438,43,'17/8/2015',5.55,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (218,43,2,438);
-- creation de la facture 219
insert into FACTURE(num,client,date_etabli) values (219,77,'17/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (439,64,'17/8/2015',7.78,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (219,64,1,439);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (440,54,'17/8/2015',6.09,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (219,54,2,440);
-- creation de la facture 220
insert into FACTURE(num,client,date_etabli) values (220,87,'17/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (441,63,'17/8/2015',1.19,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (220,63,2,441);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (442,30,'17/8/2015',4.5,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (220,30,2,442);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (443,8,'17/8/2015',6.32,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (220,8,1,443);
-- creation de la facture 221
insert into FACTURE(num,client,date_etabli) values (221,56,'19/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (444,75,'19/8/2015',7.37,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (221,75,2,444);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (445,34,'19/8/2015',2.28,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (221,34,2,445);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (446,43,'19/8/2015',3.62,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (221,43,2,446);
-- creation de la facture 222
insert into FACTURE(num,client,date_etabli) values (222,87,'19/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (447,12,'19/8/2015',1.97,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (222,12,2,447);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (448,28,'19/8/2015',5.85,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (222,28,2,448);
-- creation de la facture 223
insert into FACTURE(num,client,date_etabli) values (223,40,'21/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (449,44,'21/8/2015',7.17,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (223,44,2,449);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (450,20,'21/8/2015',3.11,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (223,20,1,450);
-- creation de la facture 224
insert into FACTURE(num,client,date_etabli) values (224,58,'21/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (451,2,'21/8/2015',5.76,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (224,2,2,451);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (452,30,'21/8/2015',7.31,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (224,30,1,452);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (453,15,'21/8/2015',4.77,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (224,15,1,453);
-- creation de la facture 225
insert into FACTURE(num,client,date_etabli) values (225,43,'23/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (454,26,'23/8/2015',7.68,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (225,26,1,454);
-- creation de la facture 226
insert into FACTURE(num,client,date_etabli) values (226,66,'24/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (455,27,'24/8/2015',8.15,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (226,27,2,455);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (456,11,'24/8/2015',5.21,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (226,11,2,456);
-- creation de la facture 227
insert into FACTURE(num,client,date_etabli) values (227,92,'25/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (457,30,'25/8/2015',4.93,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (227,30,1,457);
-- creation de la facture 228
insert into FACTURE(num,client,date_etabli) values (228,30,'26/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (458,66,'26/8/2015',2.68,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (228,66,2,458);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (459,53,'26/8/2015',8.21,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (228,53,1,459);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (460,18,'26/8/2015',9.13,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (228,18,2,460);
-- creation de la facture 229
insert into FACTURE(num,client,date_etabli) values (229,6,'26/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (461,12,'26/8/2015',9.29,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (229,12,2,461);
-- creation de la facture 230
insert into FACTURE(num,client,date_etabli) values (230,21,'28/8/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (462,28,'28/8/2015',2.77,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (230,28,1,462);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (463,51,'28/8/2015',5.26,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (230,51,1,463);
-- creation de la facture 231
insert into FACTURE(num,client,date_etabli) values (231,17,'2/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (464,33,'2/9/2015',2.95,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (231,33,1,464);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (465,66,'2/9/2015',6.54,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (231,66,2,465);
-- creation de la facture 232
insert into FACTURE(num,client,date_etabli) values (232,60,'4/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (466,60,'4/9/2015',1.54,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (232,60,2,466);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (467,10,'4/9/2015',5.83,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (232,10,1,467);
-- creation de la facture 233
insert into FACTURE(num,client,date_etabli) values (233,61,'6/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (468,21,'6/9/2015',2.75,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (233,21,1,468);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (469,5,'6/9/2015',4.91,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (233,5,2,469);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (470,39,'6/9/2015',3.31,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (233,39,2,470);
-- creation de la facture 234
insert into FACTURE(num,client,date_etabli) values (234,39,'7/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (471,77,'7/9/2015',4.16,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (234,77,1,471);
-- creation de la facture 235
insert into FACTURE(num,client,date_etabli) values (235,46,'9/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (472,9,'9/9/2015',8.48,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (235,9,1,472);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (473,77,'9/9/2015',8.31,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (235,77,2,473);
-- creation de la facture 236
insert into FACTURE(num,client,date_etabli) values (236,43,'10/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (474,5,'10/9/2015',9.32,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (236,5,2,474);
-- creation de la facture 237
insert into FACTURE(num,client,date_etabli) values (237,29,'11/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (475,59,'11/9/2015',8.22,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (237,59,1,475);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (476,32,'11/9/2015',1.28,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (237,32,2,476);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (477,45,'11/9/2015',8.26,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (237,45,2,477);
-- creation de la facture 238
insert into FACTURE(num,client,date_etabli) values (238,55,'13/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (478,45,'13/9/2015',1.83,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (238,45,1,478);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (479,46,'13/9/2015',7.06,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (238,46,2,479);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (480,51,'13/9/2015',8.7,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (238,51,2,480);
-- creation de la facture 239
insert into FACTURE(num,client,date_etabli) values (239,73,'14/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (481,14,'14/9/2015',8.06,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (239,14,2,481);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (482,12,'14/9/2015',3.31,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (239,12,2,482);
-- creation de la facture 240
insert into FACTURE(num,client,date_etabli) values (240,8,'14/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (483,41,'14/9/2015',9.12,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (240,41,1,483);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (484,66,'14/9/2015',4.37,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (240,66,2,484);
-- creation de la facture 241
insert into FACTURE(num,client,date_etabli) values (241,92,'14/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (485,50,'14/9/2015',4.3,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (241,50,1,485);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (486,35,'14/9/2015',5.48,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (241,35,1,486);
-- creation de la facture 242
insert into FACTURE(num,client,date_etabli) values (242,36,'16/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (487,43,'16/9/2015',5.86,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (242,43,2,487);
-- creation de la facture 243
insert into FACTURE(num,client,date_etabli) values (243,28,'18/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (488,40,'18/9/2015',5.86,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (243,40,1,488);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (489,36,'18/9/2015',5.27,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (243,36,1,489);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (490,30,'18/9/2015',2.32,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (243,30,1,490);
-- creation de la facture 244
insert into FACTURE(num,client,date_etabli) values (244,9,'20/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (491,54,'20/9/2015',3.84,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (244,54,2,491);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (492,64,'20/9/2015',2.81,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (244,64,1,492);
-- creation de la facture 245
insert into FACTURE(num,client,date_etabli) values (245,46,'21/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (493,40,'21/9/2015',9.56,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (245,40,2,493);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (494,76,'21/9/2015',4.03,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (245,76,1,494);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (495,43,'21/9/2015',6.15,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (245,43,1,495);
-- creation de la facture 246
insert into FACTURE(num,client,date_etabli) values (246,86,'22/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (496,44,'22/9/2015',3.94,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (246,44,2,496);
-- creation de la facture 247
insert into FACTURE(num,client,date_etabli) values (247,64,'22/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (497,45,'22/9/2015',9.34,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (247,45,1,497);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (498,38,'22/9/2015',9.92,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (247,38,2,498);
-- creation de la facture 248
insert into FACTURE(num,client,date_etabli) values (248,18,'22/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (499,65,'22/9/2015',7.11,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (248,65,1,499);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (500,49,'22/9/2015',4.79,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (248,49,2,500);
-- creation de la facture 249
insert into FACTURE(num,client,date_etabli) values (249,51,'23/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (501,53,'23/9/2015',2.11,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (249,53,1,501);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (502,24,'23/9/2015',6.12,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (249,24,1,502);
-- creation de la facture 250
insert into FACTURE(num,client,date_etabli) values (250,16,'23/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (503,18,'23/9/2015',1.21,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (250,18,1,503);
-- creation de la facture 251
insert into FACTURE(num,client,date_etabli) values (251,40,'24/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (504,64,'24/9/2015',7.9,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (251,64,1,504);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (505,11,'24/9/2015',7.25,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (251,11,2,505);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (506,21,'24/9/2015',3.03,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (251,21,1,506);
-- creation de la facture 252
insert into FACTURE(num,client,date_etabli) values (252,43,'25/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (507,52,'25/9/2015',4.65,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (252,52,2,507);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (508,33,'25/9/2015',8.1,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (252,33,1,508);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (509,54,'25/9/2015',4.5,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (252,54,1,509);
-- creation de la facture 253
insert into FACTURE(num,client,date_etabli) values (253,3,'25/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (510,11,'25/9/2015',2.74,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (253,11,2,510);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (511,60,'25/9/2015',1.05,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (253,60,1,511);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (512,6,'25/9/2015',1.39,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (253,6,2,512);
-- creation de la facture 254
insert into FACTURE(num,client,date_etabli) values (254,46,'25/9/2015');
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (254,6,2,512);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (513,70,'25/9/2015',9.99,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (254,70,1,513);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (514,77,'25/9/2015',5.62,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (254,77,1,514);
-- creation de la facture 255
insert into FACTURE(num,client,date_etabli) values (255,71,'25/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (515,3,'25/9/2015',8.75,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (255,3,2,515);
-- creation de la facture 256
insert into FACTURE(num,client,date_etabli) values (256,31,'25/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (516,68,'25/9/2015',4.76,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (256,68,1,516);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (517,8,'25/9/2015',1.17,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (256,8,2,517);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (518,28,'25/9/2015',4.41,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (256,28,1,518);
-- creation de la facture 257
insert into FACTURE(num,client,date_etabli) values (257,86,'27/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (519,76,'27/9/2015',9.91,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (257,76,2,519);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (520,75,'27/9/2015',4.08,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (257,75,1,520);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (521,31,'27/9/2015',1.82,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (257,31,2,521);
-- creation de la facture 258
insert into FACTURE(num,client,date_etabli) values (258,2,'28/9/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (522,31,'28/9/2015',8.65,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (258,31,2,522);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (523,66,'28/9/2015',2.22,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (258,66,1,523);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (524,30,'28/9/2015',9.43,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (258,30,2,524);
-- creation de la facture 259
insert into FACTURE(num,client,date_etabli) values (259,21,'1/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (525,47,'1/10/2015',2.97,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (259,47,2,525);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (526,8,'1/10/2015',1.93,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (259,8,1,526);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (527,76,'1/10/2015',9.83,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (259,76,1,527);
-- creation de la facture 260
insert into FACTURE(num,client,date_etabli) values (260,26,'2/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (528,44,'2/10/2015',2.66,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (260,44,2,528);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (529,15,'2/10/2015',9.87,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (260,15,1,529);
-- creation de la facture 261
insert into FACTURE(num,client,date_etabli) values (261,79,'4/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (530,78,'4/10/2015',4.88,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (261,78,1,530);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (531,55,'4/10/2015',2.43,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (261,55,1,531);
-- creation de la facture 262
insert into FACTURE(num,client,date_etabli) values (262,83,'5/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (532,17,'5/10/2015',2.4,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (262,17,2,532);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (533,8,'5/10/2015',3.45,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (262,8,1,533);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (534,30,'5/10/2015',2.62,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (262,30,2,534);
-- creation de la facture 263
insert into FACTURE(num,client,date_etabli) values (263,66,'5/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (535,51,'5/10/2015',6.14,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (263,51,2,535);
-- creation de la facture 264
insert into FACTURE(num,client,date_etabli) values (264,86,'5/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (536,21,'5/10/2015',9.98,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (264,21,2,536);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (537,41,'5/10/2015',4.58,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (264,41,2,537);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (538,74,'5/10/2015',6.64,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (264,74,1,538);
-- creation de la facture 265
insert into FACTURE(num,client,date_etabli) values (265,36,'7/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (539,60,'7/10/2015',8.28,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (265,60,1,539);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (540,36,'7/10/2015',8.02,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (265,36,1,540);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (541,62,'7/10/2015',4.12,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (265,62,2,541);
-- creation de la facture 266
insert into FACTURE(num,client,date_etabli) values (266,55,'9/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (542,67,'9/10/2015',8.64,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (266,67,2,542);
-- creation de la facture 267
insert into FACTURE(num,client,date_etabli) values (267,9,'9/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (543,46,'9/10/2015',6.71,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (267,46,2,543);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (544,34,'9/10/2015',8.07,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (267,34,1,544);
-- creation de la facture 268
insert into FACTURE(num,client,date_etabli) values (268,39,'10/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (545,10,'10/10/2015',6.75,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (268,10,2,545);
-- creation de la facture 269
insert into FACTURE(num,client,date_etabli) values (269,14,'12/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (546,41,'12/10/2015',8.12,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (269,41,1,546);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (547,35,'12/10/2015',9.72,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (269,35,1,547);
-- creation de la facture 270
insert into FACTURE(num,client,date_etabli) values (270,69,'12/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (548,68,'12/10/2015',8.33,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (270,68,1,548);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (549,71,'12/10/2015',9.06,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (270,71,2,549);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (550,74,'12/10/2015',7.08,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (270,74,1,550);
-- creation de la facture 271
insert into FACTURE(num,client,date_etabli) values (271,8,'12/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (551,50,'12/10/2015',2.72,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (271,50,2,551);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (552,15,'12/10/2015',4.2,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (271,15,2,552);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (553,28,'12/10/2015',7.76,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (271,28,1,553);
-- creation de la facture 272
insert into FACTURE(num,client,date_etabli) values (272,15,'12/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (554,64,'12/10/2015',8.03,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (272,64,1,554);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (272,15,2,552);
-- creation de la facture 273
insert into FACTURE(num,client,date_etabli) values (273,74,'14/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (555,75,'14/10/2015',8.77,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (273,75,2,555);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (556,66,'14/10/2015',2.42,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (273,66,1,556);
-- creation de la facture 274
insert into FACTURE(num,client,date_etabli) values (274,34,'14/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (557,47,'14/10/2015',4.51,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (274,47,2,557);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (558,67,'14/10/2015',6.1,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (274,67,2,558);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (559,77,'14/10/2015',5.12,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (274,77,2,559);
-- creation de la facture 275
insert into FACTURE(num,client,date_etabli) values (275,14,'14/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (560,76,'14/10/2015',4.6,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (275,76,1,560);
-- creation de la facture 276
insert into FACTURE(num,client,date_etabli) values (276,19,'15/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (561,62,'15/10/2015',8.44,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (276,62,1,561);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (562,12,'15/10/2015',8.71,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (276,12,1,562);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (563,59,'15/10/2015',8.75,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (276,59,2,563);
-- creation de la facture 277
insert into FACTURE(num,client,date_etabli) values (277,53,'17/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (564,48,'17/10/2015',4.3,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (277,48,1,564);
-- creation de la facture 278
insert into FACTURE(num,client,date_etabli) values (278,58,'19/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (565,9,'19/10/2015',9.67,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (278,9,2,565);
-- creation de la facture 279
insert into FACTURE(num,client,date_etabli) values (279,54,'19/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (566,26,'19/10/2015',7.1,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (279,26,2,566);
-- creation de la facture 280
insert into FACTURE(num,client,date_etabli) values (280,91,'19/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (567,4,'19/10/2015',9.43,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (280,4,1,567);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (568,20,'19/10/2015',2.28,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (280,20,2,568);
-- creation de la facture 281
insert into FACTURE(num,client,date_etabli) values (281,2,'20/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (569,8,'20/10/2015',1.91,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (281,8,1,569);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (570,34,'20/10/2015',4.15,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (281,34,2,570);
-- creation de la facture 282
insert into FACTURE(num,client,date_etabli) values (282,22,'22/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (571,45,'22/10/2015',6.96,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (282,45,1,571);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (572,25,'22/10/2015',6.52,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (282,25,2,572);
-- creation de la facture 283
insert into FACTURE(num,client,date_etabli) values (283,63,'24/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (573,22,'24/10/2015',6.53,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (283,22,1,573);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (574,20,'24/10/2015',2.99,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (283,20,1,574);
-- creation de la facture 284
insert into FACTURE(num,client,date_etabli) values (284,27,'26/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (575,44,'26/10/2015',5.07,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (284,44,1,575);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (576,78,'26/10/2015',8.71,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (284,78,1,576);
-- creation de la facture 285
insert into FACTURE(num,client,date_etabli) values (285,14,'26/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (577,60,'26/10/2015',8.02,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (285,60,1,577);
-- creation de la facture 286
insert into FACTURE(num,client,date_etabli) values (286,32,'28/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (578,10,'28/10/2015',1.77,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (286,10,2,578);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (579,36,'28/10/2015',5.5,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (286,36,1,579);
-- creation de la facture 287
insert into FACTURE(num,client,date_etabli) values (287,87,'28/10/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (580,59,'28/10/2015',7.33,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (287,59,2,580);
-- creation de la facture 288
insert into FACTURE(num,client,date_etabli) values (288,3,'1/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (581,62,'1/11/2015',4.58,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (288,62,1,581);
-- creation de la facture 289
insert into FACTURE(num,client,date_etabli) values (289,14,'1/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (582,10,'1/11/2015',2.14,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (289,10,2,582);
-- creation de la facture 290
insert into FACTURE(num,client,date_etabli) values (290,39,'2/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (583,38,'2/11/2015',8.16,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (290,38,2,583);
-- creation de la facture 291
insert into FACTURE(num,client,date_etabli) values (291,74,'4/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (584,77,'4/11/2015',6.93,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (291,77,2,584);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (585,53,'4/11/2015',2.24,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (291,53,1,585);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (586,5,'4/11/2015',1.99,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (291,5,2,586);
-- creation de la facture 292
insert into FACTURE(num,client,date_etabli) values (292,11,'4/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (587,66,'4/11/2015',9.47,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (292,66,2,587);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (588,31,'4/11/2015',2.5,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (292,31,1,588);
-- creation de la facture 293
insert into FACTURE(num,client,date_etabli) values (293,4,'6/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (589,18,'6/11/2015',7.44,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (293,18,1,589);
-- creation de la facture 294
insert into FACTURE(num,client,date_etabli) values (294,86,'8/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (590,51,'8/11/2015',9.68,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (294,51,2,590);
-- creation de la facture 295
insert into FACTURE(num,client,date_etabli) values (295,82,'10/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (591,17,'10/11/2015',3.7,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (295,17,1,591);
-- creation de la facture 296
insert into FACTURE(num,client,date_etabli) values (296,42,'11/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (592,66,'11/11/2015',8.57,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (296,66,1,592);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (593,73,'11/11/2015',6.48,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (296,73,1,593);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (594,23,'11/11/2015',6.32,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (296,23,2,594);
-- creation de la facture 297
insert into FACTURE(num,client,date_etabli) values (297,57,'12/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (595,50,'12/11/2015',9.93,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (297,50,1,595);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (596,33,'12/11/2015',5.77,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (297,33,2,596);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (597,8,'12/11/2015',7.91,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (297,8,2,597);
-- creation de la facture 298
insert into FACTURE(num,client,date_etabli) values (298,80,'12/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (598,68,'12/11/2015',3.29,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (298,68,1,598);
-- creation de la facture 299
insert into FACTURE(num,client,date_etabli) values (299,91,'14/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (599,46,'14/11/2015',3.13,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (299,46,1,599);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (600,3,'14/11/2015',7.01,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (299,3,2,600);
-- creation de la facture 300
insert into FACTURE(num,client,date_etabli) values (300,84,'16/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (601,27,'16/11/2015',9.52,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (300,27,1,601);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (602,37,'16/11/2015',4.3,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (300,37,1,602);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (603,14,'16/11/2015',3.42,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (300,14,1,603);
-- creation de la facture 301
insert into FACTURE(num,client,date_etabli) values (301,22,'16/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (604,8,'16/11/2015',8.7,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (301,8,1,604);
-- creation de la facture 302
insert into FACTURE(num,client,date_etabli) values (302,72,'18/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (605,76,'18/11/2015',3.75,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (302,76,2,605);
-- creation de la facture 303
insert into FACTURE(num,client,date_etabli) values (303,3,'19/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (606,34,'19/11/2015',1.46,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (303,34,2,606);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (607,53,'19/11/2015',7.33,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (303,53,2,607);
-- creation de la facture 304
insert into FACTURE(num,client,date_etabli) values (304,66,'20/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (608,5,'20/11/2015',6.77,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (304,5,2,608);
-- creation de la facture 305
insert into FACTURE(num,client,date_etabli) values (305,82,'21/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (609,10,'21/11/2015',7.6,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (305,10,2,609);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (610,78,'21/11/2015',1.36,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (305,78,1,610);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (611,73,'21/11/2015',8.39,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (305,73,2,611);
-- creation de la facture 306
insert into FACTURE(num,client,date_etabli) values (306,18,'22/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (612,77,'22/11/2015',5.93,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (306,77,1,612);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (613,22,'22/11/2015',7.35,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (306,22,1,613);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (614,57,'22/11/2015',6.04,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (306,57,1,614);
-- creation de la facture 307
insert into FACTURE(num,client,date_etabli) values (307,76,'22/11/2015');
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (307,22,2,613);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (615,78,'22/11/2015',7.74,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (307,78,1,615);
-- creation de la facture 308
insert into FACTURE(num,client,date_etabli) values (308,33,'24/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (616,39,'24/11/2015',9.29,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (308,39,2,616);
-- creation de la facture 309
insert into FACTURE(num,client,date_etabli) values (309,45,'24/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (617,58,'24/11/2015',2.59,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (309,58,1,617);
-- creation de la facture 310
insert into FACTURE(num,client,date_etabli) values (310,19,'25/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (618,15,'25/11/2015',9.73,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (310,15,1,618);
-- creation de la facture 311
insert into FACTURE(num,client,date_etabli) values (311,4,'25/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (619,41,'25/11/2015',5.85,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (311,41,2,619);
-- creation de la facture 312
insert into FACTURE(num,client,date_etabli) values (312,43,'27/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (620,56,'27/11/2015',1.67,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (312,56,1,620);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (621,43,'27/11/2015',1.49,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (312,43,1,621);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (622,46,'27/11/2015',1.12,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (312,46,2,622);
-- creation de la facture 313
insert into FACTURE(num,client,date_etabli) values (313,75,'28/11/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (623,57,'28/11/2015',7.15,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (313,57,1,623);
-- creation de la facture 314
insert into FACTURE(num,client,date_etabli) values (314,73,'1/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (624,40,'1/12/2015',5.49,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (314,40,2,624);
-- creation de la facture 315
insert into FACTURE(num,client,date_etabli) values (315,22,'2/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (625,62,'2/12/2015',8.59,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (315,62,1,625);
-- creation de la facture 316
insert into FACTURE(num,client,date_etabli) values (316,45,'2/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (626,71,'2/12/2015',3.27,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (316,71,1,626);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (627,78,'2/12/2015',5.75,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (316,78,2,627);
-- creation de la facture 317
insert into FACTURE(num,client,date_etabli) values (317,38,'4/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (628,56,'4/12/2015',4.38,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (317,56,1,628);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (629,61,'4/12/2015',4.42,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (317,61,2,629);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (630,60,'4/12/2015',2.59,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (317,60,2,630);
-- creation de la facture 318
insert into FACTURE(num,client,date_etabli) values (318,31,'6/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (631,55,'6/12/2015',8.03,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (318,55,1,631);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (632,4,'6/12/2015',6.91,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (318,4,1,632);
-- creation de la facture 319
insert into FACTURE(num,client,date_etabli) values (319,74,'6/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (633,73,'6/12/2015',6.27,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (319,73,1,633);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (634,17,'6/12/2015',5.64,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (319,17,2,634);
-- creation de la facture 320
insert into FACTURE(num,client,date_etabli) values (320,44,'8/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (635,76,'8/12/2015',9.29,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (320,76,2,635);
-- creation de la facture 321
insert into FACTURE(num,client,date_etabli) values (321,50,'8/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (636,20,'8/12/2015',2.72,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (321,20,1,636);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (637,29,'8/12/2015',5.9,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (321,29,2,637);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (638,43,'8/12/2015',6.47,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (321,43,1,638);
-- creation de la facture 322
insert into FACTURE(num,client,date_etabli) values (322,11,'9/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (639,53,'9/12/2015',9.48,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (322,53,2,639);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (640,7,'9/12/2015',4.78,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (322,7,1,640);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (641,36,'9/12/2015',1.92,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (322,36,1,641);
-- creation de la facture 323
insert into FACTURE(num,client,date_etabli) values (323,67,'9/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (642,26,'9/12/2015',7.38,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (323,26,2,642);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (643,62,'9/12/2015',2.1,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (323,62,1,643);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (644,3,'9/12/2015',6.3,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (323,3,1,644);
-- creation de la facture 324
insert into FACTURE(num,client,date_etabli) values (324,64,'9/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (645,47,'9/12/2015',1.73,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (324,47,1,645);
-- creation de la facture 325
insert into FACTURE(num,client,date_etabli) values (325,44,'11/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (646,55,'11/12/2015',3.13,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (325,55,1,646);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (647,51,'11/12/2015',2.79,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (325,51,2,647);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (648,49,'11/12/2015',5.72,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (325,49,1,648);
-- creation de la facture 326
insert into FACTURE(num,client,date_etabli) values (326,29,'11/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (649,50,'11/12/2015',9.06,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (326,50,2,649);
-- creation de la facture 327
insert into FACTURE(num,client,date_etabli) values (327,33,'11/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (650,31,'11/12/2015',5.26,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (327,31,1,650);
-- creation de la facture 328
insert into FACTURE(num,client,date_etabli) values (328,28,'12/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (651,66,'12/12/2015',1.68,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (328,66,1,651);
-- creation de la facture 329
insert into FACTURE(num,client,date_etabli) values (329,66,'14/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (652,74,'14/12/2015',1.01,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (329,74,1,652);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (653,5,'14/12/2015',3.24,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (329,5,1,653);
-- creation de la facture 330
insert into FACTURE(num,client,date_etabli) values (330,61,'16/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (654,8,'16/12/2015',2.81,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (330,8,1,654);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (655,36,'16/12/2015',3.93,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (330,36,2,655);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (656,48,'16/12/2015',1.17,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (330,48,2,656);
-- creation de la facture 331
insert into FACTURE(num,client,date_etabli) values (331,87,'16/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (657,69,'16/12/2015',8.92,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (331,69,1,657);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (658,19,'16/12/2015',4.69,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (331,19,1,658);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (331,8,2,654);
-- creation de la facture 332
insert into FACTURE(num,client,date_etabli) values (332,33,'16/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (659,67,'16/12/2015',7.45,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (332,67,2,659);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (332,8,1,654);
-- creation de la facture 333
insert into FACTURE(num,client,date_etabli) values (333,9,'18/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (660,18,'18/12/2015',4.53,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (333,18,1,660);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (661,31,'18/12/2015',7.89,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (333,31,1,661);
-- creation de la facture 334
insert into FACTURE(num,client,date_etabli) values (334,23,'19/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (662,65,'19/12/2015',7.22,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (334,65,1,662);
-- creation de la facture 335
insert into FACTURE(num,client,date_etabli) values (335,56,'20/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (663,11,'20/12/2015',4.43,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (335,11,2,663);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (664,13,'20/12/2015',4.03,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (335,13,1,664);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (665,54,'20/12/2015',4.28,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (335,54,1,665);
-- creation de la facture 336
insert into FACTURE(num,client,date_etabli) values (336,28,'21/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (666,59,'21/12/2015',2.9,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (336,59,2,666);
-- creation de la facture 337
insert into FACTURE(num,client,date_etabli) values (337,25,'22/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (667,43,'22/12/2015',1.88,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (337,43,2,667);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (668,74,'22/12/2015',2.11,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (337,74,1,668);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (669,53,'22/12/2015',9.22,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (337,53,1,669);
-- creation de la facture 338
insert into FACTURE(num,client,date_etabli) values (338,5,'22/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (670,61,'22/12/2015',5.9,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (338,61,2,670);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (671,49,'22/12/2015',6.51,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (338,49,1,671);
-- creation de la facture 339
insert into FACTURE(num,client,date_etabli) values (339,69,'22/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (672,77,'22/12/2015',5.32,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (339,77,2,672);
-- creation de la facture 340
insert into FACTURE(num,client,date_etabli) values (340,67,'23/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (673,21,'23/12/2015',2.24,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (340,21,2,673);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (674,60,'23/12/2015',9.99,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (340,60,2,674);
-- creation de la facture 341
insert into FACTURE(num,client,date_etabli) values (341,13,'25/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (675,62,'25/12/2015',6.59,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (341,62,2,675);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (676,75,'25/12/2015',8.6,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (341,75,1,676);
-- creation de la facture 342
insert into FACTURE(num,client,date_etabli) values (342,18,'26/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (677,72,'26/12/2015',4.96,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (342,72,1,677);
-- creation de la facture 343
insert into FACTURE(num,client,date_etabli) values (343,6,'27/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (678,23,'27/12/2015',7.34,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (343,23,2,678);
-- creation de la facture 344
insert into FACTURE(num,client,date_etabli) values (344,17,'28/12/2015');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (679,13,'28/12/2015',1.37,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (344,13,2,679);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (680,57,'28/12/2015',5.24,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (344,57,2,680);
-- creation de la facture 345
insert into FACTURE(num,client,date_etabli) values (345,27,'1/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (681,52,'1/1/2016',5.97,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (345,52,2,681);
-- creation de la facture 346
insert into FACTURE(num,client,date_etabli) values (346,29,'2/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (682,64,'2/1/2016',1.72,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (346,64,1,682);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (683,45,'2/1/2016',4.71,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (346,45,1,683);
-- creation de la facture 347
insert into FACTURE(num,client,date_etabli) values (347,27,'3/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (684,58,'3/1/2016',5.23,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (347,58,1,684);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (685,7,'3/1/2016',7.26,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (347,7,2,685);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (686,77,'3/1/2016',4.95,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (347,77,2,686);
-- creation de la facture 348
insert into FACTURE(num,client,date_etabli) values (348,24,'3/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (687,27,'3/1/2016',7.18,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (348,27,2,687);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (688,12,'3/1/2016',4.68,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (348,12,2,688);
-- creation de la facture 349
insert into FACTURE(num,client,date_etabli) values (349,75,'3/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (689,43,'3/1/2016',8.25,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (349,43,1,689);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (690,14,'3/1/2016',7.29,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (349,14,1,690);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (691,62,'3/1/2016',3.64,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (349,62,1,691);
-- creation de la facture 350
insert into FACTURE(num,client,date_etabli) values (350,56,'4/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (692,19,'4/1/2016',5.62,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (350,19,2,692);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (693,37,'4/1/2016',7.75,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (350,37,2,693);
-- creation de la facture 351
insert into FACTURE(num,client,date_etabli) values (351,51,'4/1/2016');
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (351,37,2,693);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (694,35,'4/1/2016',6.99,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (351,35,2,694);
-- creation de la facture 352
insert into FACTURE(num,client,date_etabli) values (352,78,'5/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (695,76,'5/1/2016',6.34,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (352,76,1,695);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (696,50,'5/1/2016',1.38,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (352,50,1,696);
-- creation de la facture 353
insert into FACTURE(num,client,date_etabli) values (353,28,'5/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (697,41,'5/1/2016',8.31,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (353,41,1,697);
-- creation de la facture 354
insert into FACTURE(num,client,date_etabli) values (354,29,'6/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (698,76,'6/1/2016',4.67,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (354,76,2,698);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (699,47,'6/1/2016',9.48,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (354,47,1,699);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (700,70,'6/1/2016',1.71,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (354,70,1,700);
-- creation de la facture 355
insert into FACTURE(num,client,date_etabli) values (355,77,'7/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (701,5,'7/1/2016',6.58,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (355,5,1,701);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (702,8,'7/1/2016',7.77,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (355,8,1,702);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (703,77,'7/1/2016',1.46,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (355,77,1,703);
-- creation de la facture 356
insert into FACTURE(num,client,date_etabli) values (356,82,'7/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (704,50,'7/1/2016',1.86,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (356,50,2,704);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (705,36,'7/1/2016',5.99,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (356,36,1,705);
-- creation de la facture 357
insert into FACTURE(num,client,date_etabli) values (357,32,'9/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (706,25,'9/1/2016',5.31,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (357,25,2,706);
-- creation de la facture 358
insert into FACTURE(num,client,date_etabli) values (358,8,'9/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (707,76,'9/1/2016',5.86,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (358,76,1,707);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (708,40,'9/1/2016',7.82,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (358,40,1,708);
-- creation de la facture 359
insert into FACTURE(num,client,date_etabli) values (359,63,'11/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (709,76,'11/1/2016',4.51,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (359,76,1,709);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (710,11,'11/1/2016',4.98,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (359,11,1,710);
-- creation de la facture 360
insert into FACTURE(num,client,date_etabli) values (360,40,'13/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (711,2,'13/1/2016',8.96,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (360,2,2,711);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (712,66,'13/1/2016',3.88,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (360,66,1,712);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (713,22,'13/1/2016',9.01,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (360,22,1,713);
-- creation de la facture 361
insert into FACTURE(num,client,date_etabli) values (361,90,'15/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (714,18,'15/1/2016',3.2,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (361,18,2,714);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (715,70,'15/1/2016',9.38,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (361,70,2,715);
-- creation de la facture 362
insert into FACTURE(num,client,date_etabli) values (362,45,'15/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (716,41,'15/1/2016',2.61,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (362,41,1,716);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (717,24,'15/1/2016',2.85,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (362,24,2,717);
-- creation de la facture 363
insert into FACTURE(num,client,date_etabli) values (363,58,'17/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (718,73,'17/1/2016',2.91,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (363,73,2,718);
-- creation de la facture 364
insert into FACTURE(num,client,date_etabli) values (364,14,'18/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (719,43,'18/1/2016',4.34,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (364,43,2,719);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (720,37,'18/1/2016',3.17,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (364,37,1,720);
-- creation de la facture 365
insert into FACTURE(num,client,date_etabli) values (365,39,'20/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (721,74,'20/1/2016',2.79,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (365,74,2,721);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (722,70,'20/1/2016',7.43,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (365,70,2,722);
-- creation de la facture 366
insert into FACTURE(num,client,date_etabli) values (366,82,'20/1/2016');
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (366,70,2,722);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (723,13,'20/1/2016',1.17,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (366,13,2,723);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (724,49,'20/1/2016',2.71,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (366,49,2,724);
-- creation de la facture 367
insert into FACTURE(num,client,date_etabli) values (367,25,'20/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (725,40,'20/1/2016',1.93,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (367,40,1,725);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (726,51,'20/1/2016',1.22,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (367,51,2,726);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (727,25,'20/1/2016',6.93,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (367,25,2,727);
-- creation de la facture 368
insert into FACTURE(num,client,date_etabli) values (368,32,'22/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (728,52,'22/1/2016',2.44,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (368,52,1,728);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (729,24,'22/1/2016',6.51,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (368,24,2,729);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (730,63,'22/1/2016',7.71,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (368,63,2,730);
-- creation de la facture 369
insert into FACTURE(num,client,date_etabli) values (369,29,'22/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (731,59,'22/1/2016',9.87,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (369,59,1,731);
-- creation de la facture 370
insert into FACTURE(num,client,date_etabli) values (370,52,'24/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (732,31,'24/1/2016',8.15,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (370,31,2,732);
-- creation de la facture 371
insert into FACTURE(num,client,date_etabli) values (371,61,'25/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (733,3,'25/1/2016',5.92,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (371,3,1,733);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (734,20,'25/1/2016',1.54,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (371,20,1,734);
-- creation de la facture 372
insert into FACTURE(num,client,date_etabli) values (372,72,'25/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (735,45,'25/1/2016',7.14,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (372,45,1,735);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (736,54,'25/1/2016',9.74,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (372,54,2,736);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (737,71,'25/1/2016',8.95,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (372,71,2,737);
-- creation de la facture 373
insert into FACTURE(num,client,date_etabli) values (373,30,'27/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (738,7,'27/1/2016',7.55,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (373,7,1,738);
-- creation de la facture 374
insert into FACTURE(num,client,date_etabli) values (374,42,'28/1/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (739,59,'28/1/2016',9.17,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (374,59,1,739);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (740,44,'28/1/2016',2.26,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (374,44,2,740);
-- creation de la facture 375
insert into FACTURE(num,client,date_etabli) values (375,32,'2/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (741,30,'2/2/2016',2.48,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (375,30,1,741);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (742,76,'2/2/2016',2.38,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (375,76,1,742);
-- creation de la facture 376
insert into FACTURE(num,client,date_etabli) values (376,33,'3/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (743,13,'3/2/2016',8.81,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (376,13,1,743);
-- creation de la facture 377
insert into FACTURE(num,client,date_etabli) values (377,24,'4/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (744,11,'4/2/2016',3.5,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (377,11,2,744);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (745,58,'4/2/2016',2.67,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (377,58,2,745);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (746,54,'4/2/2016',2.98,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (377,54,1,746);
-- creation de la facture 378
insert into FACTURE(num,client,date_etabli) values (378,34,'5/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (747,49,'5/2/2016',4.82,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (378,49,2,747);
-- creation de la facture 379
insert into FACTURE(num,client,date_etabli) values (379,24,'7/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (748,78,'7/2/2016',9.16,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (379,78,2,748);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (749,3,'7/2/2016',2.34,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (379,3,2,749);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (750,2,'7/2/2016',3.92,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (379,2,2,750);
-- creation de la facture 380
insert into FACTURE(num,client,date_etabli) values (380,65,'8/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (751,23,'8/2/2016',7.34,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (380,23,2,751);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (752,11,'8/2/2016',6.43,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (380,11,1,752);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (753,25,'8/2/2016',8.31,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (380,25,2,753);
-- creation de la facture 381
insert into FACTURE(num,client,date_etabli) values (381,80,'9/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (754,5,'9/2/2016',3.78,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (381,5,1,754);
-- creation de la facture 382
insert into FACTURE(num,client,date_etabli) values (382,91,'11/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (755,37,'11/2/2016',5.79,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (382,37,2,755);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (756,32,'11/2/2016',3.12,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (382,32,1,756);
-- creation de la facture 383
insert into FACTURE(num,client,date_etabli) values (383,18,'11/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (757,28,'11/2/2016',3.88,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (383,28,2,757);
-- creation de la facture 384
insert into FACTURE(num,client,date_etabli) values (384,82,'12/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (758,24,'12/2/2016',7.68,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (384,24,1,758);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (759,7,'12/2/2016',9.23,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (384,7,1,759);
-- creation de la facture 385
insert into FACTURE(num,client,date_etabli) values (385,75,'12/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (760,17,'12/2/2016',9.56,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (385,17,2,760);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (761,67,'12/2/2016',4.42,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (385,67,2,761);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (762,18,'12/2/2016',5.1,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (385,18,1,762);
-- creation de la facture 386
insert into FACTURE(num,client,date_etabli) values (386,57,'13/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (763,13,'13/2/2016',9.16,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (386,13,1,763);
-- creation de la facture 387
insert into FACTURE(num,client,date_etabli) values (387,25,'14/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (764,32,'14/2/2016',1.32,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (387,32,1,764);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (765,73,'14/2/2016',7.33,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (387,73,2,765);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (766,55,'14/2/2016',8.02,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (387,55,1,766);
-- creation de la facture 388
insert into FACTURE(num,client,date_etabli) values (388,70,'16/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (767,48,'16/2/2016',6.32,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (388,48,1,767);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (768,65,'16/2/2016',1.15,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (388,65,1,768);
-- creation de la facture 389
insert into FACTURE(num,client,date_etabli) values (389,82,'18/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (769,51,'18/2/2016',5.7,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (389,51,1,769);
-- creation de la facture 390
insert into FACTURE(num,client,date_etabli) values (390,27,'20/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (770,50,'20/2/2016',7.92,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (390,50,2,770);
-- creation de la facture 391
insert into FACTURE(num,client,date_etabli) values (391,88,'21/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (771,10,'21/2/2016',1.41,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (391,10,2,771);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (772,8,'21/2/2016',7.49,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (391,8,2,772);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (773,24,'21/2/2016',5.6,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (391,24,1,773);
-- creation de la facture 392
insert into FACTURE(num,client,date_etabli) values (392,44,'23/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (774,16,'23/2/2016',8.57,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (392,16,1,774);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (775,60,'23/2/2016',1.34,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (392,60,2,775);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (776,2,'23/2/2016',5.18,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (392,2,1,776);
-- creation de la facture 393
insert into FACTURE(num,client,date_etabli) values (393,6,'23/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (777,5,'23/2/2016',6.74,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (393,5,2,777);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (778,31,'23/2/2016',7.08,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (393,31,1,778);
-- creation de la facture 394
insert into FACTURE(num,client,date_etabli) values (394,62,'24/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (779,14,'24/2/2016',8.59,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (394,14,2,779);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (780,24,'24/2/2016',7.3,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (394,24,1,780);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (781,13,'24/2/2016',7.75,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (394,13,1,781);
-- creation de la facture 395
insert into FACTURE(num,client,date_etabli) values (395,78,'24/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (782,42,'24/2/2016',3.93,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (395,42,1,782);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (783,6,'24/2/2016',8.63,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (395,6,2,783);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (784,20,'24/2/2016',4.93,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (395,20,2,784);
-- creation de la facture 396
insert into FACTURE(num,client,date_etabli) values (396,87,'25/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (785,16,'25/2/2016',7.74,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (396,16,1,785);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (786,47,'25/2/2016',2.95,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (396,47,1,786);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (787,23,'25/2/2016',4.98,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (396,23,2,787);
-- creation de la facture 397
insert into FACTURE(num,client,date_etabli) values (397,29,'26/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (788,30,'26/2/2016',6.02,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (397,30,2,788);
-- creation de la facture 398
insert into FACTURE(num,client,date_etabli) values (398,3,'26/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (789,33,'26/2/2016',4.87,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (398,33,1,789);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (790,67,'26/2/2016',6.0,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (398,67,2,790);
-- creation de la facture 399
insert into FACTURE(num,client,date_etabli) values (399,85,'28/2/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (791,27,'28/2/2016',9.25,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (399,27,2,791);
-- creation de la facture 400
insert into FACTURE(num,client,date_etabli) values (400,68,'2/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (792,74,'2/3/2016',5.83,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (400,74,2,792);
-- creation de la facture 401
insert into FACTURE(num,client,date_etabli) values (401,26,'4/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (793,26,'4/3/2016',9.08,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (401,26,2,793);
-- creation de la facture 402
insert into FACTURE(num,client,date_etabli) values (402,10,'5/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (794,36,'5/3/2016',2.77,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (402,36,2,794);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (795,60,'5/3/2016',8.81,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (402,60,2,795);
-- creation de la facture 403
insert into FACTURE(num,client,date_etabli) values (403,52,'7/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (796,75,'7/3/2016',7.69,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (403,75,1,796);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (797,27,'7/3/2016',5.88,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (403,27,1,797);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (798,60,'7/3/2016',6.71,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (403,60,1,798);
-- creation de la facture 404
insert into FACTURE(num,client,date_etabli) values (404,63,'7/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (799,39,'7/3/2016',1.88,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (404,39,2,799);
-- creation de la facture 405
insert into FACTURE(num,client,date_etabli) values (405,13,'9/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (800,62,'9/3/2016',4.75,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (405,62,1,800);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (801,33,'9/3/2016',9.28,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (405,33,1,801);
-- creation de la facture 406
insert into FACTURE(num,client,date_etabli) values (406,76,'9/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (802,2,'9/3/2016',1.74,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (406,2,2,802);
-- creation de la facture 407
insert into FACTURE(num,client,date_etabli) values (407,9,'11/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (803,11,'11/3/2016',5.73,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (407,11,2,803);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (804,35,'11/3/2016',4.14,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (407,35,1,804);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (805,29,'11/3/2016',9.03,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (407,29,1,805);
-- creation de la facture 408
insert into FACTURE(num,client,date_etabli) values (408,30,'11/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (806,49,'11/3/2016',8.59,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (408,49,1,806);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (807,45,'11/3/2016',7.79,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (408,45,2,807);
-- creation de la facture 409
insert into FACTURE(num,client,date_etabli) values (409,46,'11/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (808,71,'11/3/2016',3.92,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (409,71,2,808);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (809,33,'11/3/2016',4.88,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (409,33,2,809);
-- creation de la facture 410
insert into FACTURE(num,client,date_etabli) values (410,4,'12/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (810,45,'12/3/2016',3.29,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (410,45,2,810);
-- creation de la facture 411
insert into FACTURE(num,client,date_etabli) values (411,53,'14/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (811,41,'14/3/2016',7.99,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (411,41,1,811);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (812,53,'14/3/2016',7.18,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (411,53,2,812);
-- creation de la facture 412
insert into FACTURE(num,client,date_etabli) values (412,83,'16/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (813,38,'16/3/2016',9.09,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (412,38,1,813);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (814,36,'16/3/2016',3.46,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (412,36,2,814);
-- creation de la facture 413
insert into FACTURE(num,client,date_etabli) values (413,35,'16/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (815,57,'16/3/2016',3.79,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (413,57,2,815);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (816,10,'16/3/2016',2.2,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (413,10,2,816);
-- creation de la facture 414
insert into FACTURE(num,client,date_etabli) values (414,4,'16/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (817,7,'16/3/2016',3.2,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (414,7,2,817);
-- creation de la facture 415
insert into FACTURE(num,client,date_etabli) values (415,89,'16/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (818,45,'16/3/2016',2.2,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (415,45,2,818);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (415,36,2,814);
-- creation de la facture 416
insert into FACTURE(num,client,date_etabli) values (416,68,'16/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (819,68,'16/3/2016',8.67,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (416,68,2,819);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (416,10,2,816);
-- creation de la facture 417
insert into FACTURE(num,client,date_etabli) values (417,80,'16/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (820,47,'16/3/2016',8.48,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (417,47,1,820);
-- creation de la facture 418
insert into FACTURE(num,client,date_etabli) values (418,70,'17/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (821,19,'17/3/2016',1.68,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (418,19,2,821);
-- creation de la facture 419
insert into FACTURE(num,client,date_etabli) values (419,54,'19/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (822,64,'19/3/2016',5.49,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (419,64,2,822);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (823,3,'19/3/2016',8.04,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (419,3,1,823);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (824,13,'19/3/2016',3.24,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (419,13,2,824);
-- creation de la facture 420
insert into FACTURE(num,client,date_etabli) values (420,6,'20/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (825,70,'20/3/2016',7.16,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (420,70,2,825);
-- creation de la facture 421
insert into FACTURE(num,client,date_etabli) values (421,12,'22/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (826,54,'22/3/2016',3.06,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (421,54,2,826);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (827,58,'22/3/2016',7.49,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (421,58,1,827);
-- creation de la facture 422
insert into FACTURE(num,client,date_etabli) values (422,16,'23/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (828,39,'23/3/2016',4.94,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (422,39,2,828);
-- creation de la facture 423
insert into FACTURE(num,client,date_etabli) values (423,20,'24/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (829,76,'24/3/2016',2.57,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (423,76,2,829);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (830,5,'24/3/2016',8.38,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (423,5,2,830);
-- creation de la facture 424
insert into FACTURE(num,client,date_etabli) values (424,21,'24/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (831,16,'24/3/2016',5.22,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (424,16,1,831);
-- creation de la facture 425
insert into FACTURE(num,client,date_etabli) values (425,77,'25/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (832,53,'25/3/2016',1.04,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (425,53,1,832);
-- creation de la facture 426
insert into FACTURE(num,client,date_etabli) values (426,26,'26/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (833,46,'26/3/2016',2.11,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (426,46,1,833);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (834,30,'26/3/2016',1.46,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (426,30,2,834);
-- creation de la facture 427
insert into FACTURE(num,client,date_etabli) values (427,89,'26/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (835,74,'26/3/2016',8.16,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (427,74,1,835);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (836,71,'26/3/2016',8.18,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (427,71,1,836);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (837,41,'26/3/2016',9.74,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (427,41,2,837);
-- creation de la facture 428
insert into FACTURE(num,client,date_etabli) values (428,68,'28/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (838,20,'28/3/2016',8.25,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (428,20,1,838);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (839,34,'28/3/2016',9.22,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (428,34,1,839);
-- creation de la facture 429
insert into FACTURE(num,client,date_etabli) values (429,6,'28/3/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (840,37,'28/3/2016',8.21,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (429,37,1,840);
-- creation de la facture 430
insert into FACTURE(num,client,date_etabli) values (430,52,'2/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (841,7,'2/4/2016',8.64,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (430,7,1,841);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (842,24,'2/4/2016',3.04,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (430,24,2,842);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (843,78,'2/4/2016',2.39,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (430,78,1,843);
-- creation de la facture 431
insert into FACTURE(num,client,date_etabli) values (431,76,'3/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (844,12,'3/4/2016',2.99,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (431,12,2,844);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (845,32,'3/4/2016',7.44,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (431,32,1,845);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (846,65,'3/4/2016',3.34,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (431,65,2,846);
-- creation de la facture 432
insert into FACTURE(num,client,date_etabli) values (432,13,'5/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (847,69,'5/4/2016',2.6,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (432,69,2,847);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (848,51,'5/4/2016',8.3,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (432,51,1,848);
-- creation de la facture 433
insert into FACTURE(num,client,date_etabli) values (433,61,'7/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (849,7,'7/4/2016',5.25,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (433,7,2,849);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (850,14,'7/4/2016',9.37,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (433,14,1,850);
-- creation de la facture 434
insert into FACTURE(num,client,date_etabli) values (434,11,'7/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (851,53,'7/4/2016',6.3,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (434,53,1,851);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (852,18,'7/4/2016',5.49,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (434,18,2,852);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (853,61,'7/4/2016',9.6,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (434,61,2,853);
-- creation de la facture 435
insert into FACTURE(num,client,date_etabli) values (435,70,'8/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (854,41,'8/4/2016',3.82,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (435,41,1,854);
-- creation de la facture 436
insert into FACTURE(num,client,date_etabli) values (436,6,'8/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (855,32,'8/4/2016',3.17,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (436,32,1,855);
-- creation de la facture 437
insert into FACTURE(num,client,date_etabli) values (437,77,'8/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (856,5,'8/4/2016',2.8,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (437,5,2,856);
-- creation de la facture 438
insert into FACTURE(num,client,date_etabli) values (438,16,'10/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (857,66,'10/4/2016',8.83,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (438,66,2,857);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (858,35,'10/4/2016',3.04,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (438,35,1,858);
-- creation de la facture 439
insert into FACTURE(num,client,date_etabli) values (439,32,'12/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (859,52,'12/4/2016',4.54,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (439,52,2,859);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (860,25,'12/4/2016',3.58,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (439,25,1,860);
-- creation de la facture 440
insert into FACTURE(num,client,date_etabli) values (440,27,'13/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (861,18,'13/4/2016',6.14,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (440,18,1,861);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (862,53,'13/4/2016',1.13,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (440,53,2,862);
-- creation de la facture 441
insert into FACTURE(num,client,date_etabli) values (441,5,'13/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (863,54,'13/4/2016',1.19,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (441,54,2,863);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (864,28,'13/4/2016',9.36,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (441,28,2,864);
-- creation de la facture 442
insert into FACTURE(num,client,date_etabli) values (442,75,'13/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (865,29,'13/4/2016',8.42,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (442,29,1,865);
-- creation de la facture 443
insert into FACTURE(num,client,date_etabli) values (443,11,'15/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (866,31,'15/4/2016',2.72,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (443,31,2,866);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (867,54,'15/4/2016',9.33,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (443,54,2,867);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (868,16,'15/4/2016',6.73,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (443,16,1,868);
-- creation de la facture 444
insert into FACTURE(num,client,date_etabli) values (444,83,'16/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (869,58,'16/4/2016',4.5,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (444,58,1,869);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (870,16,'16/4/2016',9.01,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (444,16,2,870);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (871,61,'16/4/2016',4.76,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (444,61,1,871);
-- creation de la facture 445
insert into FACTURE(num,client,date_etabli) values (445,85,'17/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (872,33,'17/4/2016',3.21,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (445,33,2,872);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (873,4,'17/4/2016',2.5,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (445,4,2,873);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (874,55,'17/4/2016',2.63,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (445,55,2,874);
-- creation de la facture 446
insert into FACTURE(num,client,date_etabli) values (446,44,'19/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (875,26,'19/4/2016',8.56,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (446,26,1,875);
-- creation de la facture 447
insert into FACTURE(num,client,date_etabli) values (447,15,'19/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (876,67,'19/4/2016',6.86,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (447,67,2,876);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (877,50,'19/4/2016',2.38,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (447,50,1,877);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (878,41,'19/4/2016',1.41,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (447,41,2,878);
-- creation de la facture 448
insert into FACTURE(num,client,date_etabli) values (448,9,'21/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (879,58,'21/4/2016',3.51,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (448,58,2,879);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (880,4,'21/4/2016',9.36,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (448,4,1,880);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (881,64,'21/4/2016',3.22,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (448,64,1,881);
-- creation de la facture 449
insert into FACTURE(num,client,date_etabli) values (449,36,'22/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (882,55,'22/4/2016',1.99,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (449,55,2,882);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (883,9,'22/4/2016',3.86,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (449,9,1,883);
-- creation de la facture 450
insert into FACTURE(num,client,date_etabli) values (450,62,'23/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (884,65,'23/4/2016',7.33,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (450,65,2,884);
-- creation de la facture 451
insert into FACTURE(num,client,date_etabli) values (451,47,'24/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (885,39,'24/4/2016',4.29,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (451,39,2,885);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (886,7,'24/4/2016',2.93,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (451,7,1,886);
-- creation de la facture 452
insert into FACTURE(num,client,date_etabli) values (452,48,'25/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (887,24,'25/4/2016',9.17,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (452,24,2,887);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (888,34,'25/4/2016',5.35,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (452,34,2,888);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (889,7,'25/4/2016',3.64,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (452,7,2,889);
-- creation de la facture 453
insert into FACTURE(num,client,date_etabli) values (453,57,'27/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (890,33,'27/4/2016',9.19,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (453,33,2,890);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (891,5,'27/4/2016',4.41,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (453,5,1,891);
-- creation de la facture 454
insert into FACTURE(num,client,date_etabli) values (454,53,'27/4/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (892,15,'27/4/2016',5.81,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (454,15,2,892);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (893,77,'27/4/2016',2.93,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (454,77,2,893);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (894,25,'27/4/2016',5.04,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (454,25,1,894);
-- creation de la facture 455
insert into FACTURE(num,client,date_etabli) values (455,62,'1/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (895,66,'1/5/2016',6.09,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (455,66,2,895);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (896,57,'1/5/2016',1.47,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (455,57,2,896);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (897,20,'1/5/2016',4.05,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (455,20,2,897);
-- creation de la facture 456
insert into FACTURE(num,client,date_etabli) values (456,72,'3/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (898,31,'3/5/2016',7.41,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (456,31,2,898);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (899,55,'3/5/2016',8.71,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (456,55,2,899);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (900,53,'3/5/2016',3.62,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (456,53,1,900);
-- creation de la facture 457
insert into FACTURE(num,client,date_etabli) values (457,72,'5/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (901,45,'5/5/2016',5.71,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (457,45,2,901);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (902,47,'5/5/2016',3.65,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (457,47,1,902);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (903,54,'5/5/2016',5.9,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (457,54,2,903);
-- creation de la facture 458
insert into FACTURE(num,client,date_etabli) values (458,64,'7/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (904,64,'7/5/2016',5.2,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (458,64,2,904);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (905,62,'7/5/2016',8.98,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (458,62,2,905);
-- creation de la facture 459
insert into FACTURE(num,client,date_etabli) values (459,92,'7/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (906,7,'7/5/2016',2.71,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (459,7,1,906);
-- creation de la facture 460
insert into FACTURE(num,client,date_etabli) values (460,75,'8/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (907,28,'8/5/2016',6.62,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (460,28,2,907);
-- creation de la facture 461
insert into FACTURE(num,client,date_etabli) values (461,86,'9/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (908,69,'9/5/2016',8.64,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (461,69,1,908);
-- creation de la facture 462
insert into FACTURE(num,client,date_etabli) values (462,37,'9/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (909,48,'9/5/2016',7.3,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (462,48,2,909);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (910,43,'9/5/2016',4.74,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (462,43,2,910);
-- creation de la facture 463
insert into FACTURE(num,client,date_etabli) values (463,54,'11/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (911,45,'11/5/2016',7.26,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (463,45,1,911);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (912,12,'11/5/2016',7.05,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (463,12,1,912);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (913,17,'11/5/2016',1.03,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (463,17,1,913);
-- creation de la facture 464
insert into FACTURE(num,client,date_etabli) values (464,38,'13/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (914,39,'13/5/2016',3.31,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (464,39,2,914);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (915,24,'13/5/2016',8.88,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (464,24,2,915);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (916,54,'13/5/2016',3.44,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (464,54,2,916);
-- creation de la facture 465
insert into FACTURE(num,client,date_etabli) values (465,71,'13/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (917,37,'13/5/2016',6.77,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (465,37,2,917);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (918,15,'13/5/2016',6.56,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (465,15,1,918);
-- creation de la facture 466
insert into FACTURE(num,client,date_etabli) values (466,2,'13/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (919,56,'13/5/2016',1.07,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (466,56,2,919);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (920,27,'13/5/2016',8.81,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (466,27,1,920);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (466,15,2,918);
-- creation de la facture 467
insert into FACTURE(num,client,date_etabli) values (467,54,'14/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (921,75,'14/5/2016',7.48,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (467,75,2,921);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (922,38,'14/5/2016',6.97,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (467,38,2,922);
-- creation de la facture 468
insert into FACTURE(num,client,date_etabli) values (468,31,'14/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (923,67,'14/5/2016',4.08,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (468,67,2,923);
-- creation de la facture 469
insert into FACTURE(num,client,date_etabli) values (469,67,'16/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (924,50,'16/5/2016',3.24,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (469,50,1,924);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (925,25,'16/5/2016',8.56,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (469,25,1,925);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (926,5,'16/5/2016',3.51,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (469,5,2,926);
-- creation de la facture 470
insert into FACTURE(num,client,date_etabli) values (470,91,'17/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (927,37,'17/5/2016',6.66,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (470,37,1,927);
-- creation de la facture 471
insert into FACTURE(num,client,date_etabli) values (471,39,'17/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (928,8,'17/5/2016',2.55,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (471,8,1,928);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (929,18,'17/5/2016',7.81,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (471,18,1,929);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (930,66,'17/5/2016',3.74,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (471,66,2,930);
-- creation de la facture 472
insert into FACTURE(num,client,date_etabli) values (472,22,'19/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (931,60,'19/5/2016',2.73,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (472,60,2,931);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (932,36,'19/5/2016',3.89,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (472,36,1,932);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (933,45,'19/5/2016',1.11,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (472,45,1,933);
-- creation de la facture 473
insert into FACTURE(num,client,date_etabli) values (473,69,'19/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (934,37,'19/5/2016',7.92,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (473,37,1,934);
-- creation de la facture 474
insert into FACTURE(num,client,date_etabli) values (474,62,'20/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (935,6,'20/5/2016',1.78,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (474,6,1,935);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (936,39,'20/5/2016',9.66,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (474,39,1,936);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (937,62,'20/5/2016',8.55,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (474,62,1,937);
-- creation de la facture 475
insert into FACTURE(num,client,date_etabli) values (475,7,'20/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (938,31,'20/5/2016',7.8,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (475,31,1,938);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (939,53,'20/5/2016',7.2,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (475,53,1,939);
-- creation de la facture 476
insert into FACTURE(num,client,date_etabli) values (476,73,'22/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (940,72,'22/5/2016',6.09,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (476,72,1,940);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (941,76,'22/5/2016',8.85,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (476,76,2,941);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (942,52,'22/5/2016',3.53,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (476,52,2,942);
-- creation de la facture 477
insert into FACTURE(num,client,date_etabli) values (477,53,'23/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (943,43,'23/5/2016',5.0,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (477,43,1,943);
-- creation de la facture 478
insert into FACTURE(num,client,date_etabli) values (478,71,'25/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (944,36,'25/5/2016',1.84,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (478,36,2,944);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (945,50,'25/5/2016',6.62,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (478,50,1,945);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (946,2,'25/5/2016',7.66,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (478,2,2,946);
-- creation de la facture 479
insert into FACTURE(num,client,date_etabli) values (479,27,'27/5/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (947,7,'27/5/2016',9.1,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (479,7,1,947);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (948,3,'27/5/2016',8.68,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (479,3,2,948);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (949,4,'27/5/2016',9.53,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (479,4,1,949);
-- creation de la facture 480
insert into FACTURE(num,client,date_etabli) values (480,76,'1/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (950,7,'1/6/2016',8.67,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (480,7,2,950);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (951,64,'1/6/2016',6.31,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (480,64,2,951);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (952,76,'1/6/2016',6.37,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (480,76,2,952);
-- creation de la facture 481
insert into FACTURE(num,client,date_etabli) values (481,8,'3/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (953,16,'3/6/2016',7.77,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (481,16,2,953);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (954,14,'3/6/2016',8.6,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (481,14,2,954);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (955,29,'3/6/2016',2.44,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (481,29,2,955);
-- creation de la facture 482
insert into FACTURE(num,client,date_etabli) values (482,70,'4/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (956,38,'4/6/2016',2.36,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (482,38,2,956);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (957,36,'4/6/2016',5.65,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (482,36,1,957);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (958,52,'4/6/2016',7.14,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (482,52,2,958);
-- creation de la facture 483
insert into FACTURE(num,client,date_etabli) values (483,15,'5/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (959,34,'5/6/2016',9.79,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (483,34,1,959);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (960,43,'5/6/2016',7.57,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (483,43,2,960);
-- creation de la facture 484
insert into FACTURE(num,client,date_etabli) values (484,12,'6/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (961,11,'6/6/2016',3.55,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (484,11,2,961);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (962,73,'6/6/2016',5.0,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (484,73,2,962);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (963,62,'6/6/2016',2.32,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (484,62,1,963);
-- creation de la facture 485
insert into FACTURE(num,client,date_etabli) values (485,52,'6/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (964,52,'6/6/2016',4.27,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (485,52,2,964);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (965,61,'6/6/2016',7.68,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (485,61,1,965);
-- creation de la facture 486
insert into FACTURE(num,client,date_etabli) values (486,38,'7/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (966,74,'7/6/2016',5.4,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (486,74,1,966);
-- creation de la facture 487
insert into FACTURE(num,client,date_etabli) values (487,67,'9/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (967,17,'9/6/2016',4.34,10);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (487,17,1,967);
-- creation de la facture 488
insert into FACTURE(num,client,date_etabli) values (488,89,'11/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (968,30,'11/6/2016',5.13,0);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (488,30,1,968);
-- creation de la facture 489
insert into FACTURE(num,client,date_etabli) values (489,49,'12/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (969,53,'12/6/2016',8.93,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (489,53,1,969);
-- creation de la facture 490
insert into FACTURE(num,client,date_etabli) values (490,66,'14/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (970,48,'14/6/2016',3.65,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (490,48,2,970);
-- creation de la facture 491
insert into FACTURE(num,client,date_etabli) values (491,32,'16/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (971,73,'16/6/2016',4.82,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (491,73,1,971);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (972,21,'16/6/2016',3.95,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (491,21,1,972);
-- creation de la facture 492
insert into FACTURE(num,client,date_etabli) values (492,3,'16/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (973,49,'16/6/2016',1.39,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (492,49,1,973);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (974,22,'16/6/2016',7.06,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (492,22,1,974);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (975,57,'16/6/2016',7.01,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (492,57,2,975);
-- creation de la facture 493
insert into FACTURE(num,client,date_etabli) values (493,46,'18/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (976,47,'18/6/2016',9.86,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (493,47,1,976);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (977,53,'18/6/2016',8.46,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (493,53,2,977);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (978,18,'18/6/2016',5.19,30);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (493,18,1,978);
-- creation de la facture 494
insert into FACTURE(num,client,date_etabli) values (494,54,'19/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (979,35,'19/6/2016',2.03,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (494,35,2,979);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (980,4,'19/6/2016',5.79,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (494,4,2,980);
-- creation de la facture 495
insert into FACTURE(num,client,date_etabli) values (495,59,'19/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (981,14,'19/6/2016',1.64,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (495,14,1,981);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (982,12,'19/6/2016',7.75,20);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (495,12,2,982);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (983,40,'19/6/2016',6.94,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (495,40,2,983);
-- creation de la facture 496
insert into FACTURE(num,client,date_etabli) values (496,44,'20/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (984,23,'20/6/2016',8.18,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (496,23,1,984);
-- creation de la facture 497
insert into FACTURE(num,client,date_etabli) values (497,74,'21/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (985,45,'21/6/2016',9.57,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (497,45,2,985);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (986,28,'21/6/2016',1.61,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (497,28,2,986);
-- creation de la facture 498
insert into FACTURE(num,client,date_etabli) values (498,9,'21/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (987,6,'21/6/2016',6.12,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (498,6,2,987);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (988,21,'21/6/2016',6.99,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (498,21,1,988);
-- creation de la facture 499
insert into FACTURE(num,client,date_etabli) values (499,47,'22/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (989,36,'22/6/2016',1.24,50);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (499,36,1,989);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (990,52,'22/6/2016',8.31,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (499,52,1,990);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (991,77,'22/6/2016',7.93,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (499,77,1,991);
-- creation de la facture 500
insert into FACTURE(num,client,date_etabli) values (500,65,'24/6/2016');
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (992,40,'24/6/2016',9.72,40);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (500,40,1,992);
insert into PRIX_DATE(num,produit,date_du_prix,prix,remise) values (993,33,'24/6/2016',3.72,60);
insert into LIGNE_FACTURE(facture,produit,qte,id_prix) values (500,33,2,993);
commit ;