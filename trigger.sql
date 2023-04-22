CREATE TRIGGER ajout_auto_compte_en_versement AFTER INSERT ON app_versement FOR EACH ROW 
update app_client set solde = solde + NEW.montant where num_compte=NEW.num_compte_id;

CREATE TRIGGER delete_auto_compte_en_versement AFTER delete ON app_versement FOR EACH ROW 
update app_client set solde = solde - OLD.montant where num_compte=OLD.num_compte_id;

CREATE TRIGGER update_auto_compte_en_versement AFTER update ON app_versement FOR EACH ROW 
update app_client set solde = solde + abs(OLD.montant-NEW.montant) where num_compte=OLD.num_compte_id;

SHOW TRIGGERS;

select app_client.solde-app_versement.montant FROM app_client join app_versement
on app_versement.num_compte_id=app_client.num_compte ;

CREATE TRIGGER trigger_audit_operation1 AFTER INSERT ON 
app_versement  FOR EACH ROW  
insert into app_auditoperation values 
('operation','0',NOW(),NEW.num_cheque,NEW.num_compte_id,'test','23','root') 


CREATE TRIGGER `trigger_audit_versement_sup` AFTER DELETE ON `app_versement` FOR EACH ROW BEGIN
	insert into app_auditversement VALUES ("suppression",NOW(),OLD.num_vers,OLD.num_compte_id,"test",OLD.montant,0,"root");
END

CREATE TRIGGER `trigger_audit_versement_mod` AFTER UPDATE ON `app_versement` FOR EACH ROW BEGIN
	insert into app_auditversement VALUES ("0","modification",NOW(),OLD.num_vers,OLD.num_compte_id,"test",OLD.montant,NEW.montant,"root");
END

INSERT INTO app_client VALUES ("8","test",(SELECT montant FROM app_versement WHERE num_vers=58702))
