-- Gerado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   em:        2025-11-04 20:36:16 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



DROP TABLE TB_CAR_ALERTA_SISTEMA CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_ANOTACAO_MANUAL CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_CONSULTA CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_CUIDADOR CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_ESPECIALIDADE CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_INTERACAO_AUTOMATIZADA CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_LOG_AUDITORIA CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_METRIC_ABSENT CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_PACIENTE CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_PACIENTE_CUIDADOR CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_PROFISSIONAL_SAUDE CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_UPLOAD_LOG CASCADE CONSTRAINTS 
;

DROP TABLE TB_CAR_USUARIO CASCADE CONSTRAINTS 
;

DROP SEQUENCE TB_CAR_ALERTA_SISTEMA_id_alerta_SEQ 
;

DROP SEQUENCE TB_CAR_ANOTACAO_MANUAL_id_anotacao_SEQ 
;

DROP SEQUENCE TB_CAR_CONSULTA_id_consulta_SEQ 
;

DROP SEQUENCE TB_CAR_CUIDADOR_id_cuidador_SEQ 
;

DROP SEQUENCE TB_CAR_INTERACAO_AUTOMATIZADA_id_interacao_SEQ 
;

DROP SEQUENCE TB_CAR_LOG_AUDITORIA_id_log_SEQ 
;

DROP SEQUENCE TB_CAR_PACIENTE_id_paciente_SEQ 
;

DROP SEQUENCE TB_CAR_PROFISSIONAL_SAUDE_id_profissional_SEQ 
;

DROP SEQUENCE TB_CAR_UPLOAD_LOG_id_upload_SEQ 
;

DROP SEQUENCE TB_CAR_USUARIO_id_usuario_SEQ 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE SEQUENCE TB_CAR_ALERTA_SISTEMA_id_alerta_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_ANOTACAO_MANUAL_id_anotacao_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_CONSULTA_id_consulta_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_CUIDADOR_id_cuidador_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_INTERACAO_AUTOMATIZADA_id_interacao_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_LOG_AUDITORIA_id_log_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_PACIENTE_id_paciente_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_PROFISSIONAL_SAUDE_id_profissional_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_UPLOAD_LOG_id_upload_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE SEQUENCE TB_CAR_USUARIO_id_usuario_SEQ 
    START WITH 1 
    NOCACHE 
    ORDER 
;

CREATE TABLE TB_CAR_ALERTA_SISTEMA 
    ( 
     id_alerta                   INTEGER  NOT NULL , 
     id_consulta                 INTEGER , 
     id_paciente                 INTEGER  NOT NULL , 
     id_cuidador                 INTEGER , 
     id_interacao                INTEGER , 
     tipo_alerta                 VARCHAR2 (100) , 
     data_hora_alerta            TIMESTAMP , 
     status_alerta               VARCHAR2 (50) , 
     prioridade_alerta           VARCHAR2 (50) , 
     detalhes_contribuicao_risco VARCHAR2 (255) , 
     acao_tomada                 VARCHAR2 (4000) , 
     data_hora_Acao              TIMESTAMP , 
     dt_criacao                  TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_ALERTA_SISTEMA 
    ADD CONSTRAINT ID_LEMBRETE_PK PRIMARY KEY ( id_alerta ) ;

CREATE TABLE TB_CAR_ANOTACAO_MANUAL 
    ( 
     id_anotacao        INTEGER  NOT NULL , 
     id_paciente        INTEGER  NOT NULL , 
     id_usuario         INTEGER  NOT NULL , 
     conteudo_anotacao  VARCHAR2 (255) , 
     data_hora_anotacao TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_ANOTACAO_MANUAL 
    ADD CONSTRAINT TB_CAR_ANOTACAO_MANUAL_PK PRIMARY KEY ( id_anotacao ) ;

CREATE TABLE TB_CAR_CONSULTA 
    ( 
     id_consulta          INTEGER  NOT NULL , 
     id_paciente          INTEGER  NOT NULL , 
     id_profissional      INTEGER  NOT NULL , 
     id_especialidade     INTEGER  NOT NULL , 
     id_upload            INTEGER  NOT NULL , 
     data_agenda          DATE , 
     link_acesso          VARCHAR2 (500) , 
     codigo_acesso        VARCHAR2 (50) , 
     obs_agendamento      VARCHAR2 (4000) , 
     status_consulta      VARCHAR2 (50) , 
     modalidade_realizada VARCHAR2 (50) , 
     data_registro_status TIMESTAMP , 
     dt_criacao           TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_CONSULTA 
    ADD CONSTRAINT CK_CONSULTA_STATUS 
    CHECK (status_consulta IN ('AGENDADA', 'CANCELADA', 'PACIENTE NAO COMPARECEU', 'REALIZADA')) 
;

ALTER TABLE TB_CAR_CONSULTA 
    ADD CONSTRAINT ID_CONSULTA_PK PRIMARY KEY ( id_consulta ) ;

CREATE TABLE TB_CAR_CUIDADOR 
    ( 
     id_cuidador       INTEGER  NOT NULL , 
     nome_cuidador     VARCHAR2 (100) , 
     telefone_cuidador VARCHAR2 (50) , 
     dt_criacao        TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_CUIDADOR 
    ADD CONSTRAINT ID_CUIDADOR_PK PRIMARY KEY ( id_cuidador ) ;

ALTER TABLE TB_CAR_CUIDADOR 
    ADD CONSTRAINT UK_CUIDADOR_TELEFONE UNIQUE ( telefone_cuidador ) ;

CREATE TABLE TB_CAR_ESPECIALIDADE 
    ( 
     id_especialidade   INTEGER  NOT NULL , 
     nome_especialidade VARCHAR2 (50) 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_ESPECIALIDADE 
    ADD CONSTRAINT TB_CAR_ESPECIALIDADE_PK PRIMARY KEY ( id_especialidade ) ;

CREATE TABLE TB_CAR_INTERACAO_AUTOMATIZADA 
    ( 
     id_interacao        INTEGER  NOT NULL , 
     id_consulta         INTEGER  NOT NULL , 
     id_paciente         INTEGER  NOT NULL , 
     tipo_interacao      VARCHAR2 (100) , 
     receptor_tipo       VARCHAR2 (50) , 
     status_interacao    VARCHAR2 (50) , 
     detalhes_interacao  VARCHAR2 (255) , 
     data_hora_interacao TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_INTERACAO_AUTOMATIZADA 
    ADD CONSTRAINT ID_INTERACAO_PK PRIMARY KEY ( id_interacao ) ;

CREATE TABLE TB_CAR_LOG_AUDITORIA 
    ( 
     id_log           INTEGER  NOT NULL , 
     data_hora_evento TIMESTAMP  NOT NULL , 
     tipo_evento      VARCHAR2 (100) , 
     detalhes_evento  VARCHAR2 (255) , 
     dt_criacao       TIMESTAMP , 
     id_usuario       INTEGER  NOT NULL , 
     id_consulta      INTEGER , 
     id_paciente      INTEGER , 
     id_interacao     INTEGER , 
     id_alerta        INTEGER 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_LOG_AUDITORIA 
    ADD CONSTRAINT TB_LOG_AUDITORIA_PK PRIMARY KEY ( id_log ) ;

CREATE TABLE TB_CAR_METRIC_ABSENT 
    ( 
     id_metrica                   INTEGER  NOT NULL , 
     mes_ano                      VARCHAR2 (11) , 
     percentual_absenteismo_geral NUMBER (5,2) , 
     total_consultas_agendadas    INTEGER , 
     total_faltas                 INTEGER , 
     meta_absenteismo             NUMBER (5,2) , 
     fonte_dado                   VARCHAR2 (50) , 
     dt_criacao                   TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_METRIC_ABSENT 
    ADD CONSTRAINT ID_METRICA_PK PRIMARY KEY ( id_metrica ) ;

CREATE TABLE TB_CAR_PACIENTE 
    ( 
     id_paciente                   INTEGER  NOT NULL , 
     nome_paciente                 VARCHAR2 (100) , 
     celular_paciente              VARCHAR2 (50) , 
     data_nascimento_paciente      DATE , 
     score_risco_absenteismo       INTEGER , 
     semana_tratamento_atual       INTEGER , 
     data_inicio_tratamento        DATE , 
     historico_faltas_consecutivas INTEGER , 
     data_ultima_atualizacao       TIMESTAMP , 
     bairro_paciente               VARCHAR2 (100) , 
     dt_criacao                    TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_PACIENTE 
    ADD CONSTRAINT ID_PACIENTE_PK PRIMARY KEY ( id_paciente ) ;

CREATE TABLE TB_CAR_PACIENTE_CUIDADOR 
    ( 
     tipo_relacao    VARCHAR2 (50) , 
     data_associacao TIMESTAMP , 
     id_cuidador     INTEGER  NOT NULL , 
     id_paciente     INTEGER  NOT NULL 
    ) 
    LOGGING 
;

CREATE TABLE TB_CAR_PROFISSIONAL_SAUDE 
    ( 
     id_profissional   INTEGER  NOT NULL , 
     nome_profissional VARCHAR2 (100) , 
     dt_criacao        TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_PROFISSIONAL_SAUDE 
    ADD CONSTRAINT ID_PROFISSIONAL_SAUDE_PK PRIMARY KEY ( id_profissional ) ;

CREATE TABLE TB_CAR_UPLOAD_LOG 
    ( 
     id_upload                 INTEGER  NOT NULL , 
     id_usuario                INTEGER  NOT NULL , 
     data_hora_upload          TIMESTAMP , 
     nome_arquivo              VARCHAR2 (255) , 
     status_upload             VARCHAR2 (50) , 
     num_registros_processados INTEGER , 
     num_registros_com_erro    INTEGER , 
     detalhes_erros            VARCHAR2 (255) , 
     dt_criacao                TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_UPLOAD_LOG 
    ADD CONSTRAINT ID_UPLOAD_LOG_PK PRIMARY KEY ( id_upload ) ;

CREATE TABLE TB_CAR_USUARIO 
    ( 
     id_usuario             INTEGER  NOT NULL , 
     nome_usuario           VARCHAR2 (100) , 
     emai_usuario           VARCHAR2 (255) , 
     senha_usuario          VARCHAR2 (100) , 
     papel_usuario          VARCHAR2 (50) , 
     data_ultimo_login      TIMESTAMP , 
     status_disponibilidade VARCHAR2 (50) , 
     dt_criacao             TIMESTAMP 
    ) 
    LOGGING 
;

ALTER TABLE TB_CAR_USUARIO 
    ADD CONSTRAINT ID_USUARIO_PK PRIMARY KEY ( id_usuario ) ;

ALTER TABLE TB_CAR_ALERTA_SISTEMA 
    ADD CONSTRAINT TB_CAR_ALT_SIST_ID_CONSULTA_FK FOREIGN KEY 
    ( 
     id_consulta
    ) 
    REFERENCES TB_CAR_CONSULTA 
    ( 
     id_consulta
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_ALERTA_SISTEMA 
    ADD CONSTRAINT TB_CAR_ALT_SIST_ID_CUIDADOR_FK FOREIGN KEY 
    ( 
     id_cuidador
    ) 
    REFERENCES TB_CAR_CUIDADOR 
    ( 
     id_cuidador
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_ALERTA_SISTEMA 
    ADD CONSTRAINT TB_CAR_ALT_SIST_ID_INTERACA_FK FOREIGN KEY 
    ( 
     id_interacao
    ) 
    REFERENCES TB_CAR_INTERACAO_AUTOMATIZADA 
    ( 
     id_interacao
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_ALERTA_SISTEMA 
    ADD CONSTRAINT TB_CAR_ALT_SIST_ID_PACIENTE_FK FOREIGN KEY 
    ( 
     id_paciente
    ) 
    REFERENCES TB_CAR_PACIENTE 
    ( 
     id_paciente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_ANOTACAO_MANUAL 
    ADD CONSTRAINT TB_CAR_ANOT_MAN_ID_PACIENTE_FK FOREIGN KEY 
    ( 
     id_paciente
    ) 
    REFERENCES TB_CAR_PACIENTE 
    ( 
     id_paciente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_ANOTACAO_MANUAL 
    ADD CONSTRAINT TB_CAR_ANOT_MAN_ID_USUARIO_FK FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES TB_CAR_USUARIO 
    ( 
     id_usuario
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_PACIENTE_CUIDADOR 
    ADD CONSTRAINT TB_CAR_PAC_CUI_ID_CUIDADOR_FK FOREIGN KEY 
    ( 
     id_cuidador
    ) 
    REFERENCES TB_CAR_CUIDADOR 
    ( 
     id_cuidador
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_PACIENTE_CUIDADOR 
    ADD CONSTRAINT TB_CAR_PAC_CUI_ID_PACIENTE_FK FOREIGN KEY 
    ( 
     id_paciente
    ) 
    REFERENCES TB_CAR_PACIENTE 
    ( 
     id_paciente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_CONSULTA 
    ADD CONSTRAINT TB_CONSULTA_ID_ESPECIALIDAD_FK FOREIGN KEY 
    ( 
     id_especialidade
    ) 
    REFERENCES TB_CAR_ESPECIALIDADE 
    ( 
     id_especialidade
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_CONSULTA 
    ADD CONSTRAINT TB_CONSULTA_ID_PACIENTE_FK FOREIGN KEY 
    ( 
     id_paciente
    ) 
    REFERENCES TB_CAR_PACIENTE 
    ( 
     id_paciente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_CONSULTA 
    ADD CONSTRAINT TB_CONSULTA_ID_PROF_SAUDE_FK FOREIGN KEY 
    ( 
     id_profissional
    ) 
    REFERENCES TB_CAR_PROFISSIONAL_SAUDE 
    ( 
     id_profissional
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_CONSULTA 
    ADD CONSTRAINT TB_CONSULTA_ID_UPLOAD_LOG_FK FOREIGN KEY 
    ( 
     id_upload
    ) 
    REFERENCES TB_CAR_UPLOAD_LOG 
    ( 
     id_upload
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_INTERACAO_AUTOMATIZADA 
    ADD CONSTRAINT TB_INTE_AUTOM_ID_CONSULTA_FK FOREIGN KEY 
    ( 
     id_consulta
    ) 
    REFERENCES TB_CAR_CONSULTA 
    ( 
     id_consulta
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_INTERACAO_AUTOMATIZADA 
    ADD CONSTRAINT TB_INTE_AUTOM_ID_PACIENTE_FK FOREIGN KEY 
    ( 
     id_paciente
    ) 
    REFERENCES TB_CAR_PACIENTE 
    ( 
     id_paciente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_LOG_AUDITORIA 
    ADD CONSTRAINT TB_LOG_AUDIT_ID_ALERTA_FK FOREIGN KEY 
    ( 
     id_alerta
    ) 
    REFERENCES TB_CAR_ALERTA_SISTEMA 
    ( 
     id_alerta
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_LOG_AUDITORIA 
    ADD CONSTRAINT TB_LOG_AUDIT_ID_CONSULTA_FK FOREIGN KEY 
    ( 
     id_consulta
    ) 
    REFERENCES TB_CAR_CONSULTA 
    ( 
     id_consulta
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_LOG_AUDITORIA 
    ADD CONSTRAINT TB_LOG_AUDIT_ID_INTERACAO_FK FOREIGN KEY 
    ( 
     id_interacao
    ) 
    REFERENCES TB_CAR_INTERACAO_AUTOMATIZADA 
    ( 
     id_interacao
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_LOG_AUDITORIA 
    ADD CONSTRAINT TB_LOG_AUDIT_ID_PACIENTE_FK FOREIGN KEY 
    ( 
     id_paciente
    ) 
    REFERENCES TB_CAR_PACIENTE 
    ( 
     id_paciente
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_LOG_AUDITORIA 
    ADD CONSTRAINT TB_LOG_AUDIT_ID_USUARIO_FK FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES TB_CAR_USUARIO 
    ( 
     id_usuario
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE TB_CAR_UPLOAD_LOG 
    ADD CONSTRAINT TB_UPLOAD_LOG_TB_USUARIO_FK FOREIGN KEY 
    ( 
     id_usuario
    ) 
    REFERENCES TB_CAR_USUARIO 
    ( 
     id_usuario
    ) 
    NOT DEFERRABLE 
;

CREATE OR REPLACE TRIGGER TB_CAR_ALERTA_SISTEMA_id_alerta_TRG 
BEFORE INSERT ON TB_CAR_ALERTA_SISTEMA 
FOR EACH ROW 
WHEN (NEW.id_alerta IS NULL) 
BEGIN 
    :NEW.id_alerta := TB_CAR_ALERTA_SISTEMA_id_alerta_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_ANOTACAO_MANUAL_id_anotacao_TRG 
BEFORE INSERT ON TB_CAR_ANOTACAO_MANUAL 
FOR EACH ROW 
WHEN (NEW.id_anotacao IS NULL) 
BEGIN 
    :NEW.id_anotacao := TB_CAR_ANOTACAO_MANUAL_id_anotacao_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_CONSULTA_id_consulta_TRG 
BEFORE INSERT ON TB_CAR_CONSULTA 
FOR EACH ROW 
WHEN (NEW.id_consulta IS NULL) 
BEGIN 
    :NEW.id_consulta := TB_CAR_CONSULTA_id_consulta_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_CUIDADOR_id_cuidador_TRG 
BEFORE INSERT ON TB_CAR_CUIDADOR 
FOR EACH ROW 
WHEN (NEW.id_cuidador IS NULL) 
BEGIN 
    :NEW.id_cuidador := TB_CAR_CUIDADOR_id_cuidador_SEQ.NEXTVAL; 
END;
/

CREATE SEQUENCE TB_CAR_ESPECIALIDADE_id_especialidade_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER TB_CAR_ESPECIALIDADE_id_especialidade_TRG 
BEFORE INSERT ON TB_CAR_ESPECIALIDADE 
FOR EACH ROW 
WHEN (NEW.id_especialidade IS NULL) 
BEGIN 
    :NEW.id_especialidade := TB_CAR_ESPECIALIDADE_id_especialidade_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_INTERACAO_AUTOMATIZADA_id_interacao_TRG 
BEFORE INSERT ON TB_CAR_INTERACAO_AUTOMATIZADA 
FOR EACH ROW 
WHEN (NEW.id_interacao IS NULL) 
BEGIN 
    :NEW.id_interacao := TB_CAR_INTERACAO_AUTOMATIZADA_id_interacao_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_LOG_AUDITORIA_id_log_TRG 
BEFORE INSERT ON TB_CAR_LOG_AUDITORIA 
FOR EACH ROW 
WHEN (NEW.id_log IS NULL) 
BEGIN 
    :NEW.id_log := TB_CAR_LOG_AUDITORIA_id_log_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_PACIENTE_id_paciente_TRG 
BEFORE INSERT ON TB_CAR_PACIENTE 
FOR EACH ROW 
WHEN (NEW.id_paciente IS NULL) 
BEGIN 
    :NEW.id_paciente := TB_CAR_PACIENTE_id_paciente_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_PROFISSIONAL_SAUDE_id_profissional_TRG 
BEFORE INSERT ON TB_CAR_PROFISSIONAL_SAUDE 
FOR EACH ROW 
WHEN (NEW.id_profissional IS NULL) 
BEGIN 
    :NEW.id_profissional := TB_CAR_PROFISSIONAL_SAUDE_id_profissional_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_UPLOAD_LOG_id_upload_TRG 
BEFORE INSERT ON TB_CAR_UPLOAD_LOG 
FOR EACH ROW 
WHEN (NEW.id_upload IS NULL) 
BEGIN 
    :NEW.id_upload := TB_CAR_UPLOAD_LOG_id_upload_SEQ.NEXTVAL; 
END;
/

CREATE OR REPLACE TRIGGER TB_CAR_USUARIO_id_usuario_TRG 
BEFORE INSERT ON TB_CAR_USUARIO 
FOR EACH ROW 
WHEN (NEW.id_usuario IS NULL) 
BEGIN 
    :NEW.id_usuario := TB_CAR_USUARIO_id_usuario_SEQ.NEXTVAL; 
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          11
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         11
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0