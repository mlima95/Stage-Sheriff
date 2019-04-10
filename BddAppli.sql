drop database if exists baseAppli;
create database baseAppli;
use baseAppli;

/* §§ création des tables §§ */

/* client */

create table client
	(idClient int(7) NOT NULL AUTO_INCREMENT,
	nom varchar(20) not null,
	prenom varchar (20),
	telephone int(10) not null,
	mail varchar(320)
idAdresse int(7));

/* type Assurance */

create table typeAssurance
	(idAssurance int(7) NOT NULL AUTO_INCREMENT,
	libelle varchar(20));

/* compte */

create table compte
	(idCompte int(7) NOT NULL AUTO_INCREMENT,
	login varchar(15),
	password varchar(20) );

/* image */

create table image
	(idImage int(7) NOT NULL AUTO_INCREMENT,
	libelle varchar(20),
	url text,
	idClient int(7),
	idAssurance int(7) ,
	idCarteGrise int(7) ,
	idPermis int(7));


/* tarif */

create table tarif
	(id_tarif int(7) NOT NULL AUTO_INCREMENT
libelle char (20),
	prix int not null);

create table tarif_assurance(
fk_id_tarif,
fk_typeassurance);


/* carteBancaire */

create table carteBancaire
	(numeroCarte int(32) not null,
	cryptogramme smallint(3) not null,
	dateExpiration date not null);





/* carteGrise */

create table carteGrise
	(idCarteGrise int(7) NOT NULL AUTO_INCREMENT,
	nom varchar(20),
	adresse varchar(140),
	plaqueImmatriculation char(6), 
	finitionVehicule varchar(20),
	modeleVehicule varchar(20),
	chevauxFiscaux varchar(20));


/* permis */
create table permis
	(idPermis int(7) NOT NULL AUTO_INCREMENT,
	dateNaissance date not null,
	datePermis date not null,
	typePermis varchar(20));



/*adresse */
create table adresse
(idAdresse int(7) NOT NULL AUTO_INCREMENT,
rue varchar (40),
ville varchar(50),
code_postal int (5));



/* clés primaires */ 

alter table client
add constraint pk_client primary key (idClient);

alter table typeAssurance
add constraint pk_TypeAssurance primary key (idAssurance);

alter table image
add constraint pk_image primary key (idImage);




alter table compte
add constraint pk_compte primary key (idCompte);

alter table carteGrise
add constraint pk_carteGrise primary key (idCarteGrise);

alter table permis
add constraint pk_permis primary key (idPermis);



/* clé étrangères */

alter table image
add constraint fk_image_client foreign key (idClient) references client (idClient);

alter table image
add constraint fk_image_Assurance foreign key (idAssurance) references typeAssurance(idAssurance);

alter table image
add constraint fk_image_carteGrise foreign key (idCarteGrise) references carteGrise (idCarteGrise);

alter table image
add constraint fk_image_permis foreign key (idPermis) references permis (idPermis);

alter table client
add constraint fk_client_adresse foreign key (idAdresse) references adresse (idAdresse);



describe client;
describe typeAssurance;
describe compte;
describe image;
describe tarif;
describe carteBancaire;



