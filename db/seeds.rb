# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Medicaldevice.create!([
	{   
		pmak_number: "P790002",
		applicant:"EBI, LLC",
		street1:"399 JEFFERSON ROAD",
		street2:"NA",	
		city:"PARSIPPANY",
		state:"NJ",
		zip:7054,
		generic_name:"BONE GROWTH STIMULATOR",
		trade_name:"BIOMET BHS-MINI",
		product_code:"LOF",
		advisory_committee:"PM",
		description: "NEW CRIMPING EQUIPMENT AND CRIMP CONNECTOR FOR THE BONE HEALING TREATMENT COILS."
	}, 	

	{ 
		pmak_number:"P040033",
		applicant:"SMITH&NEPHEW ORTHOPAEDICS",
		street1:"1450 BROOKS ROAD",
		street2:	"NA",
		city: "MEMPHIS",
		state: "TN",
		zip:38116,
		generic_name: "TOTAL HIP RESURFACING PROSTHESIS, METAL-ON-METAL",
		trade_name:"BIRMINGHAM HIP RESURFACING (BHR) SYSTEM",
		product_code:"NXT",
		advisory_committee:"OR",
		description:"APPROVAL FOR A CHANGE TO NEW TESTING EQUIPMENT USED FOR MEASURING SURFACE FINISH, TAPE ANGLE, AND DIAMETER FOR THE R3 METAL LINERS."
	},	

	{
		pmak_number: "P050016",
		applicant:"CORIN U.S.A.",
		street1: "10500 UNIVERSITY CENTER DR." ,
		street2: "SUITE 190",
		city:"TAMPA",
		state:"FL",
		zip:33612,
		generic_name:"METAL-ON-METAL HIP RESURFACING SYSTEM",
		trade_name:"CORMET HIP RESURFACING SYSTEM",
		product_code:"NXT",
		advisory_committee:"OR",
		description:"APPROVAL FOR A CHANGE TO THE METHOD OF STERILIZATION OF THE INDIVIDUALLY PACKAGED FLUTED GUIDE WIRE AND REVISIONS TO THE PACKAGE LABELING."
	},	

	{
		pmak_number:"P000007",
		applicant:"EDWARDS LIFESCIENCES, LLC.",
		street1:"ONE EDWARDS WAY",
		street2:"NA",
		city:"IRVINE",
		state:"CA",
		zip:92614,
		generic_name:"REPLACEMENT HEART VALVE",
		trade_name:"EDWARDS PRIMA PLUS STENTLESS BIOPROSTHESIS",
		product_code:"DYE",
		advisory_committee:"CV",
		description:"ADDITION OF A SUPPLIER FOR PORCINE TISSUE."
	},		

	{
		pmak_number:"P030009",
		applicant:"MEDTRONIC IRELAND",
		street1:"PARKMORE BUSINESS PARK WEST",
		street2:"NA",
		city:"GALWAY",
		state:"NA",
		zip:"NA",	
		generic_name:"CARDIOVASCULAR STENT",
		trade_name:"DRIVER RAPID EXCHANGE (RX) CORONARY STENT SYSTEM",
		product_code:"MAF",
		advisory_committee:"CV",
		description:"CHANGE OF MARKER BAND MANUFACTURING SPECIFICATIONS."
	},

	{
		pmak_number:"P070008",
		applicant:"BIOTRONIK, INC.",
		street1:"6024 JEAN ROAD",
		street2:"NA",
		city:"LAKE OSWEGO",
		state:"OR",
		zip:97035,
		generic_name:"NA",
		trade_name:"STRATOS LV (T) PULSE GENERATOR",
		product_code:"NKE",
		advisory_committee:"CV",
		description:"CHANGE IN THE COMPONENT SUPPLIER FOR THE BATTERY CATHODE."

	},		

	{
		pmak_number:"P870056",
		applicant:"EDWARDS LIFESCIENCES, LLC.",
		street1:"ONE EDWARDS WAY",
		street2:"NA",
		city:"IRVINE",
		state:"CA",
		zip:92614,
		generic_name:"BIOPROSTHETIC VALVED CONDUIT",
		trade_name:"CAEPENTIER EDWARDS PORCINE BIOPROSTHESIS & CARPENTIER-EDWARDS BIOPROSTHETIC VALVED CONDUIT",
		product_code:"DYE",
		advisory_committee:"CV",
		description:"ADDITION OF A SUPPLIER FOR PORCINE TISSUE."

	},		

	{
		pmak_number:"P950037",
		applicant:"BIOTRONIK, INC.",
		street1:"6024 JEAN ROAD",
		street2:"NA",
		city:"LAKE OSWEGO",
		state:"OR",
		zip:97035,
		generic_name:"IMPLANTABLE PACEMAKER PULSE GENERATOR,PACEMAKER PROGRAMMER",
		trade_name:"CYLOS/PROTOS/AXIOS/PHILOS II & PHILOS/PHILOS DR-T PULSE GENERATORS",
		product_code:"NVZ",
		advisory_committee:"CV",
		description:"CHANGE IN THE COMPONENT SUPPLIER FOR THE BATTERY CATHODE."

	},		

	{
		pmak_number:"P000015",
		applicant:"COCHLEAR AMERICAS",
		street1:"400 INVERNESS DRIVE SOUTH",
		street2:"SUITE 400",
		city:"ENGLEWOOD",
		state:"CO",
		zip:80112,
		generic_name:"AUDITORY BRAINSTEM IMPLANT",
		trade_name:"NUCLEUS 24 AUDITORY BRAINSTEM IMPLANT SYSTEM",
		product_code:"MCM",
		advisory_committee:"EN",
		description:"APPROVAL FOR USE OF CUSTOM SOUND 2.0 AND THE FREEDOM SOUND PROCESSOR IN RECIPIENTS OF THE NUCLEUS AUDITORY BRAINSTEM IMPLANT."

	},		

	{
		pmak_number:"P010007",
		applicant:"SIEMENS MEDICAL SOLUTIONS DIAGNOSTICS",
		street1:"5700 WEST 96TH ST.",
		street2:"NA",
		city:"LOS ANGELES",
		state:"CA",
		zip:90045,
		generic_name:"NA",
		trade_name:"IMMULITE 2500 AFP, MODEL L5KAP",
		product_code:"LOK",
		advisory_committee:"IM",
		description:"FOR IN VITRO DIAGNOSTIC USE WITH THE IMMULITE 2500 ANALYZERS FOR THE QUANTITATIVE MEASUREMENT OF ALPHA-FETOPROTEIN (AFP) IN EITHER OF TWO CONTEXTS (1) SERIAL MEASUREMENTS IN HUMAN SERUM TO AID IN THE MANAGEMENT OF PATIENTS WITH NONSEMINOMATOUS TESTICULAR CANCER; OR (2) MEASUREMENTS IN MATERNAL SERUM AND AMNIOTIC FLUID DURING GESTATIONAL WEEKS 15 THROUGH 20 USED IN CONJUNCTION WITH ULTRASONOGRAPHY OR AMNIOGRAPHY, TO AID IN DETECTION OF FETAL OPEN NEURAL TUBE DEFECTS."
	},

	{
		pmak_number:"P020025",
		applicant:"BOSTON SCIENTIFIC",
		street1:"2710 ORCHARD PKWY.",
		street2:"NA",
		city:"SAN JOSE",
		state:"CA",
		zip:95134,
		generic_name:"RADIOFREQUENCY GENERATOR/CARDIAC ABLATION CATHETER",
		trade_name:"EPT-1000 CARDIAC ABLATION SYSTEM",
		product_code:"OAD",
		advisory_committee:"CV",
		description:"APPROVAL FOR A STERILIZATION FACILITY LOCATED AT COSMED OF RHODE ISLAND, INC., COVENTRY, RHODE ISLAND."

	},		


	{
		pmak_number:"P930027",
		applicant:"DIAGNOSTIC PRODUCTS CORP.",
		street1:"5700 WEST 96TH ST.",
		street2:"NA",
		city:"LOS ANGELES",
		state:"CA",
		zip:90045,
		generic_name:"PSA TEST KIT",
		trade_name:"IMMULITE 2500 PSA, IMMULITE 2500 THIRD GENERATION PSA",
		product_code:"LTJ",
		advisory_committee:"IM",
		description:"THE IMMULITE 2500 PSA AND IMMUITE 2500 THIRD GENERATION PSA ASSAYS ARE FOR IN VITRO DIAGNOSTIC USE WITH THE IMMULITE 2500 ANALYZER FOR THE QUANTITATIVE MEASUREMENT OF PROSTATE-SPECIFIC ANTIGEN (PSA) IN HUMAN SERUM, AS AN AID IN THE DETECTION OF PROSTATE CANCER WHEN USED IN CONJUNCTION WITH DIGITAL RECTAL EXAMINATION (DRE) IN MEN AGED 50 YEARS OR OLDER.  EACH ASSAY IS FURTHER INDICATED AS AN ADJUNCTIVE TEST TO AID IN THE MANAGEMENT OF PROSTATE CANCER PATIENTS."

	},	

	{
		pmak_number:"P980003",
		applicant:"BOSTON SCIENTIFIC CORP.",
		street1:"2710 ORCHARD PKWY.",
		street2:"NA",
		city:"SAN JOSE",
		state:"CA",
		zip:95134,
		generic_name:"	RF ABLATION SYSTEM",
		trade_name:"CHILLI COOLED ABLATION SYSTEM",
		product_code:"LPB",
		advisory_committee:"CV",
		description:"APPROVAL FOR A STERILIZATION FACILITY LOCATED AT COSMED OF RHODE ISLAND, INC., COVENTRY, RHODE ISLAND."

	}

])