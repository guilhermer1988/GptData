-- PAPERLESS_DEV.dbo.ActionType definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.ActionType;

CREATE TABLE ActionType (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Name varchar(250)  NULL,
	Description varchar(250)  NULL,
	ActionType int NOT NULL,
	CONSTRAINT PK_ActionType PRIMARY KEY (Id)
);


-- PAPERLESS_DEV.dbo.Form definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.Form;

CREATE TABLE Form (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Name varchar(250)  NULL,
	Description varchar(250)  NULL,
	Rejection bit NOT NULL,
	CreatorName varchar(250)  NULL,
	UpdaterName varchar(250)  NULL,
	AnswerTableName varchar(250)  NULL,
	Uuid varchar(250)  NULL,
	CreatorCompanyNumber bigint NOT NULL,
	CreatorRegister bigint NOT NULL,
	CreatorSap bigint NOT NULL,
	UpdaterCompanyNumber bigint NOT NULL,
	UpdaterRegister bigint NOT NULL,
	UpdaterSap bigint NOT NULL,
	CONSTRAINT PK_Form PRIMARY KEY (Id)
);


-- PAPERLESS_DEV.dbo.[Grupo] definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.[Grupo];

CREATE TABLE Grupo (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Name varchar(250)  NULL,
	Icon varchar(40)  NULL,
	Active bit NOT NULL,
	Mnemonic varchar(10) NULL,
	ResponsibleArea varchar(250)  NULL,
	CompanyNumber bigint NOT NULL,
	CONSTRAINT PK_Grupo PRIMARY KEY (Id)
);


-- PAPERLESS_DEV.dbo.HistoricReport definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.HistoricReport;

CREATE TABLE HistoricReport (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	CreatedBy varchar(250)  NULL,
	Email varchar(250)  NULL,
	ReportType int NOT NULL,
	Sended bit NOT NULL,
	CONSTRAINT PK_HistoricReport PRIMARY KEY (Id)
);


-- PAPERLESS_DEV.dbo.StepStageDesign definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.StepStageDesign;

CREATE TABLE StepStageDesign (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	ProcessId bigint NOT NULL,
	WorkflowId bigint NULL,
	UserName varchar(250)  NULL,
	Version varchar(250)  NULL,
	DateStage DATETIME NULL,
	DesignJson VARCHAR(2000), 
	ActionTypeStageDesign int NULL,
	CONSTRAINT PK_StepStageDesign PRIMARY KEY (Id)
);


-- PAPERLESS_DEV.dbo.FormDesign definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.FormDesign;

CREATE TABLE FormDesign (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Design VARCHAR(2000), 
	FormId bigint NOT NULL,
	CONSTRAINT PK_FormDesign PRIMARY KEY (Id),
	CONSTRAINT FK_FormDesign_Form_FormId FOREIGN KEY (FormId) REFERENCES Form(Id) ON DELETE CASCADE
);


-- PAPERLESS_DEV.dbo.GrupoAudience definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.GrupoAudience;

CREATE TABLE GrupoAudience (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	AudienceId int NOT NULL,
	Name varchar(250)  NULL,
	GrupoId bigint NOT NULL,
	CONSTRAINT PK_GrupoAudience PRIMARY KEY (Id),
	CONSTRAINT FK_GrupoAudience_Grupo_GrupoId FOREIGN KEY (GrupoId) REFERENCES Grupo(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.GrupoFilter definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.GrupoFilter;

CREATE TABLE GrupoFilter (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	KeyValue varchar(250)  NULL,
	Value varchar(250)  NULL,
	Name varchar(250)  NULL,
	GrupoId bigint NOT NULL,
	CONSTRAINT PK_GrupoFilter PRIMARY KEY (Id),
	CONSTRAINT FK_GrupoFilter_Grupo_GrupoId FOREIGN KEY (GrupoId) REFERENCES Grupo(Id) ON DELETE CASCADE
);
 

-- PAPERLESS_DEV.dbo.GrupoProtocolSequence definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.GrupoProtocolSequence;

CREATE TABLE GrupoProtocolSequence (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Mnemonic varchar(10)  NULL,
	Sequence int NOT NULL,
	GrupoId bigint NOT NULL,
	CONSTRAINT PK_GrupoProtocolSequence PRIMARY KEY (Id),
	CONSTRAINT FK_GrupoProtocolSequence_Grupo_GrupoId FOREIGN KEY (GrupoId) REFERENCES Grupo(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.Process definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.Process;

CREATE TABLE Process (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Name varchar(250)  NULL,
	Description varchar(250)  NULL,
	Icon varchar(40)  NULL,
	State int NOT NULL,
	AllowSimultaneous bit NOT NULL,
	PublicationDate DATETIME NOT NULL,
	DueDate DATETIME NULL,
	Active bit NOT NULL,
	ApprovedDate DATETIME NULL,
	GrupoId bigint NOT NULL,
	UpdaterName varchar(250)  NULL,
	ApproverName varchar(250)  NULL,
	CreatorName varchar(250)  NULL,
	ApproverCompanyNumber bigint NULL,
	ApproverRegister bigint NULL,
	ApproverSap bigint NULL,
	CreatorCompanyNumber bigint NOT NULL,
	CreatorRegister bigint NOT NULL,
	CreatorSap bigint NOT NULL,
	UpdaterCompanyNumber bigint NOT NULL,
	UpdaterRegister bigint NOT NULL,
	UpdaterSap bigint NOT NULL,
	OriginProcessId bigint NOT NULL,
	EmailPublicationPending bit NOT NULL,
	CONSTRAINT PK_Process PRIMARY KEY (Id),
	CONSTRAINT FK_Process_Grupo_GrupoId FOREIGN KEY (GrupoId) REFERENCES Grupo(Id)
);
 

-- PAPERLESS_DEV.dbo.ProcessAudience definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.ProcessAudience;

CREATE TABLE ProcessAudience (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	AudienceId int NOT NULL,
	Name varchar(250)  NULL,
	ProcessId bigint NOT NULL,
	CONSTRAINT PK_ProcessAudience PRIMARY KEY (Id),
	CONSTRAINT FK_ProcessAudience_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.ProcessAudiencePermission definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.ProcessAudiencePermission;

CREATE TABLE ProcessAudiencePermission (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	AudienceId int NOT NULL,
	Name varchar(250)  NULL,
	ProcessId bigint NOT NULL,
	CONSTRAINT PK_ProcessAudiencePermission PRIMARY KEY (Id),
	CONSTRAINT FK_ProcessAudiencePermission_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.ProcessFilter definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.ProcessFilter;

CREATE TABLE ProcessFilter (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	KeyValue varchar(250)  NULL,
	Value varchar(250)  NULL,
	ProcessId bigint NOT NULL,
	Name varchar(250)  NULL,
	CONSTRAINT PK_ProcessFilter PRIMARY KEY (Id),
	CONSTRAINT FK_ProcessFilter_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.ProcessFilterPermission definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.ProcessFilterPermission;

CREATE TABLE ProcessFilterPermission (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	KeyValue varchar(250)  NULL,
	Value varchar(250)  NULL,
	Name varchar(250)  NULL,
	ProcessId bigint NOT NULL,
	CONSTRAINT PK_ProcessFilterPermission PRIMARY KEY (Id),
	CONSTRAINT FK_ProcessFilterPermission_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.ProcessFormJoin definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.ProcessFormJoin;

CREATE TABLE ProcessFormJoin (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	ProcessId bigint NOT NULL,
	FormId bigint NOT NULL,
	CONSTRAINT PK_ProcessFormJoin PRIMARY KEY (Id),
	CONSTRAINT FK_ProcessFormJoin_Form_FormId FOREIGN KEY (FormId) REFERENCES Form(Id) ON DELETE CASCADE,
	CONSTRAINT FK_ProcessFormJoin_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.ProcessHistory definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.ProcessHistory;

CREATE TABLE ProcessHistory (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	ProcessId bigint NOT NULL,
	ProcessState int NOT NULL,
	HistoryAction int NOT NULL,
	Message varchar(250)  NULL,
	UserName varchar(250)  NULL,
	UserCompanyNumber bigint NOT NULL,
	UserRegister bigint NOT NULL,
	UserSap bigint NOT NULL,
	CONSTRAINT PK_ProcessHistory PRIMARY KEY (Id),
	CONSTRAINT FK_ProcessHistory_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.UserProcess definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.UserProcess;

CREATE TABLE UserProcess (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	RequesterSap bigint NOT NULL,
	RequesterRegister bigint NOT NULL,
	RequesterCompanyNumber bigint NOT NULL,
	RequesterName varchar(250)  NULL,
	Protocol varchar(50)  NULL,
	ProcessId bigint NOT NULL,
	UserProcessState int DEFAULT 0 NOT NULL,
	PersonalArea varchar(250)  NULL,
	CONSTRAINT PK_UserProcess PRIMARY KEY (Id),
	CONSTRAINT FK_UserProcess_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id)
);

-- PAPERLESS_DEV.dbo.UserProcessObservation definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.UserProcessObservation;

CREATE TABLE UserProcessObservation (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	UserSap bigint NOT NULL,
	UserRegister bigint NOT NULL,
	UserCompanyNumber bigint NOT NULL,
	UserName varchar(250)  NULL,
	Observation varchar(350)  NULL,
	UserProcessId bigint NOT NULL,
	CONSTRAINT PK_UserProcessObservation PRIMARY KEY (Id),
	CONSTRAINT FK_UserProcessObservation_UserProcess_UserProcessId FOREIGN KEY (UserProcessId) REFERENCES UserProcess(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.Workflow definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.Workflow;

CREATE TABLE Workflow (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	ProcessId bigint NOT NULL,
	CreatedBy varchar(250)  NULL,
	UpdatedBy varchar(250)  NULL,
	CONSTRAINT PK_Workflow PRIMARY KEY (Id),
	CONSTRAINT FK_Workflow_Process_ProcessId FOREIGN KEY (ProcessId) REFERENCES Process(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.WorkflowMessage definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.WorkflowMessage;

CREATE TABLE WorkflowMessage (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	WorkflowId bigint NOT NULL,
	EmailActionAdvance bit NOT NULL,
	EmailActionRegression bit NOT NULL,
	EmailApprovalDue bit NOT NULL,
	EmailApprovalPending bit NOT NULL,
	EmailCancellation bit NOT NULL,
	EmailPublicationPending bit NOT NULL,
	PushActionAdvance bit NOT NULL,
	PushActionRegression bit NOT NULL,
	PushApprovalDue bit NOT NULL,
	PushApprovalPending bit NOT NULL,
	PushCancellation bit NOT NULL,
	PushPublicationNew bit NOT NULL,
	CONSTRAINT PK_WorkflowMessage PRIMARY KEY (Id),
	CONSTRAINT FK_WorkflowMessage_Workflow_WorkflowId FOREIGN KEY (WorkflowId) REFERENCES Workflow(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.Step definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.Step;

CREATE TABLE Step (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Name varchar(250)  NULL,
	OrderSequence int NOT NULL,
	WorkflowId bigint NOT NULL,
	CreatedBy varchar(250)  NULL,
	UpdatedBy varchar(250)  NULL,
	StepType int DEFAULT 0 NOT NULL,
	CONSTRAINT PK_Step PRIMARY KEY (Id),
	CONSTRAINT FK_Step_Workflow_WorkflowId FOREIGN KEY (WorkflowId) REFERENCES Workflow(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.StepMessage definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.StepMessage;

CREATE TABLE StepMessage (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	PushPublicationNew bit NOT NULL,
	PushActionAdvance bit NOT NULL,
	PushActionRegression bit NOT NULL,
	PushApprovalPending bit NOT NULL,
	PushApprovalDue bit NOT NULL,
	PushCancellation bit NOT NULL,
	EmailActionAdvance bit NOT NULL,
	EmailActionRegression bit NOT NULL,
	EmailApprovalPending bit NOT NULL,
	EmailApprovalDue bit NOT NULL,
	EmailCancellation bit NOT NULL,
	StepId bigint NOT NULL,
	CONSTRAINT PK_StepMessage PRIMARY KEY (Id),
	CONSTRAINT FK_StepMessage_Step_StepId FOREIGN KEY (StepId) REFERENCES Step(Id)
);
-- PAPERLESS_DEV.dbo.StepRegister definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.StepRegister;

CREATE TABLE StepRegister (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	OrderSequence int NOT NULL,
	StepId bigint NOT NULL,
	FormId bigint NOT NULL,
	CanDownloadForm bit NOT NULL,
	CONSTRAINT PK_StepRegister PRIMARY KEY (Id),
	CONSTRAINT FK_StepRegister_Form_FormId FOREIGN KEY (FormId) REFERENCES Form(Id) ON DELETE CASCADE,
	CONSTRAINT FK_StepRegister_Step_StepId FOREIGN KEY (StepId) REFERENCES Step(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.StepRegisterAction definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.StepRegisterAction;

CREATE TABLE StepRegisterAction (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	ApprovalType int NULL,
	TimeLimit int NULL,
	StepRegisterId bigint NOT NULL,
	ActionTypeId bigint NOT NULL,
	StepRegisterRedirectId bigint NULL,
	CanReturn bit NULL,
	CONSTRAINT PK_StepRegisterAction PRIMARY KEY (Id),
	CONSTRAINT FK_StepRegisterAction_ActionType_ActionTypeId FOREIGN KEY (ActionTypeId) REFERENCES ActionType(Id),
	CONSTRAINT FK_StepRegisterAction_StepRegister_StepRegisterId FOREIGN KEY (StepRegisterId) REFERENCES StepRegister(Id) ON DELETE CASCADE,
	CONSTRAINT FK_StepRegisterAction_StepRegister_StepRegisterRedirectId FOREIGN KEY (StepRegisterRedirectId) REFERENCES StepRegister(Id)
);
-- PAPERLESS_DEV.dbo.StepRegisterAudience definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.StepRegisterAudience;

CREATE TABLE StepRegisterAudience (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	AudienceId int NOT NULL,
	Name varchar(250)  NULL,
	StepRegisterId bigint NOT NULL,
	CONSTRAINT PK_StepRegisterAudience PRIMARY KEY (Id),
	CONSTRAINT FK_StepRegisterAudience_StepRegister_StepRegisterId FOREIGN KEY (StepRegisterId) REFERENCES StepRegister(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.StepRegisterDesign definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.StepRegisterDesign;

CREATE TABLE StepRegisterDesign (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	Design varchar(2000)  NULL,
	StepRegisterId bigint NOT NULL,
	CONSTRAINT PK_StepRegisterDesign PRIMARY KEY (Id),
	CONSTRAINT FK_StepRegisterDesign_StepRegister_StepRegisterId FOREIGN KEY (StepRegisterId) REFERENCES StepRegister(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.StepRegisterFilter definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.StepRegisterFilter;

CREATE TABLE StepRegisterFilter (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	KeyValue varchar(250)  NULL,
	Value varchar(250)  NULL,
	StepRegisterId bigint NOT NULL,
	Name varchar(250)  NULL,
	CONSTRAINT PK_StepRegisterFilter PRIMARY KEY (Id),
	CONSTRAINT FK_StepRegisterFilter_StepRegister_StepRegisterId FOREIGN KEY (StepRegisterId) REFERENCES StepRegister(Id) ON DELETE CASCADE
);

-- PAPERLESS_DEV.dbo.UserProcessAction definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.UserProcessAction;

CREATE TABLE UserProcessAction (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	StepId bigint NOT NULL,
	StepRegisterId bigint NOT NULL,
	FormId bigint NOT NULL,
	Action int NULL,
	UserSap bigint NULL,
	UserRegister bigint NULL,
	UserCompanyNumber bigint NULL,
	UserName varchar(250)  NULL,
	UserIp varchar(20)  NULL,
	UserNetworkLogin varchar(250)  NULL,
	UserFrontEndApp int NULL,
	NextUserProcessActionId bigint NULL,
	UserProcessId bigint NOT NULL,
	ReturnedUserCompanyNumber bigint NULL,
	ReturnedUserRegister bigint NULL,
	ReturnedUserSap bigint NULL,
	IsReturned bit NOT NULL,
	Motive varchar(350)  NULL,
	Hash varchar(250)  NULL,
	CONSTRAINT PK_UserProcessAction PRIMARY KEY (Id),
	CONSTRAINT FK_UserProcessAction_Form_FormId FOREIGN KEY (FormId) REFERENCES Form(Id),
	CONSTRAINT FK_UserProcessAction_StepRegister_StepRegisterId FOREIGN KEY (StepRegisterId) REFERENCES StepRegister(Id),
	CONSTRAINT FK_UserProcessAction_Step_StepId FOREIGN KEY (StepId) REFERENCES Step(Id),
	CONSTRAINT FK_UserProcessAction_UserProcessAction_NextUserProcessActionId FOREIGN KEY (NextUserProcessActionId) REFERENCES UserProcessAction(Id),
	CONSTRAINT FK_UserProcessAction_UserProcess_UserProcessId FOREIGN KEY (UserProcessId) REFERENCES UserProcess(Id) ON DELETE CASCADE
);
-- PAPERLESS_DEV.dbo.UserProcessActionApproval definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.UserProcessActionApproval;

CREATE TABLE UserProcessActionApproval (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	FormId bigint NOT NULL,
	StepRegisterId bigint NOT NULL,
	UserProcessId bigint NOT NULL,
	UserProcessActionId bigint NOT NULL,
	ApproverCompanyNumber bigint NOT NULL,
	ApproverIp varchar(250)  NULL,
	ApproverName varchar(250)  NULL,
	ApproverNetworkLogin varchar(250)  NULL,
	ApproverRegister bigint NOT NULL,
	ApproverSap bigint NOT NULL,
	Motive varchar(350)  NULL,
	StepId bigint NOT NULL,
	TypeApproval int DEFAULT 0 NOT NULL,
	Observation varchar(350)  NULL,
	Hash varchar(250)  NULL,
	CONSTRAINT PK_UserProcessActionApproval PRIMARY KEY (Id),
	CONSTRAINT FK_UserProcessActionApproval_Form_FormId FOREIGN KEY (FormId) REFERENCES Form(Id),
	CONSTRAINT FK_UserProcessActionApproval_StepRegister_StepRegisterId FOREIGN KEY (StepRegisterId) REFERENCES StepRegister(Id),
	CONSTRAINT FK_UserProcessActionApproval_Step_StepId FOREIGN KEY (StepId) REFERENCES Step(Id),
	CONSTRAINT FK_UserProcessActionAp_UserProcessAction_UserProcessActionId FOREIGN KEY (UserProcessActionId) REFERENCES UserProcessAction(Id),
	CONSTRAINT FK_UserProcessActionApproval_UserProcess_UserProcessId FOREIGN KEY (UserProcessId) REFERENCES UserProcess(Id)
);
-- PAPERLESS_DEV.dbo.UserProcessFormAnswer definition

-- Drop table

-- DROP TABLE PAPERLESS_DEV.dbo.UserProcessFormAnswer;

CREATE TABLE UserProcessFormAnswer (
	Id bigint auto_increment NOT NULL,
	CreateAt DATETIME NOT NULL,
	UpdateAt DATETIME NOT NULL,
	FormTableName varchar(250)  NULL,
	DataIdInTable bigint NOT NULL,
	FormId bigint NOT NULL,
	StepRegisterId bigint NOT NULL,
	UserProcessId bigint NOT NULL,
	UserProcessActionId bigint NOT NULL,
	UserProcessActionApprovalId bigint NULL,
	StepId bigint NOT NULL,
	jsonTableData varchar(2000)  NULL,
	CONSTRAINT PK_UserProcessFormAnswer PRIMARY KEY (Id),
	CONSTRAINT FK_UserProcessFormAnswer_Form_FormId FOREIGN KEY (FormId) REFERENCES Form(Id),
	CONSTRAINT FK_UserProcessFormAnswer_StepRegister_StepRegisterId FOREIGN KEY (StepRegisterId) REFERENCES StepRegister(Id),
	CONSTRAINT FK_UserProcessFormAnswer_Step_StepId FOREIGN KEY (StepId) REFERENCES Step(Id),
	CONSTRAINT FK_UserProcessFormAnswer_UserProcessActionAp_UserProcessAcApId FOREIGN KEY (UserProcessActionApprovalId) REFERENCES UserProcessActionApproval(Id),
	CONSTRAINT FK_UserProcessFormAnswer_UserProcessAction_UserProcessActionId FOREIGN KEY (UserProcessActionId) REFERENCES UserProcessAction(Id) ON DELETE CASCADE,
	CONSTRAINT FK_UserProcessFormAnswer_UserProcess_UserProcessId FOREIGN KEY (UserProcessId) REFERENCES UserProcess(Id)
);