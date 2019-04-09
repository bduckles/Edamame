#Rename

names(Join_PerCompAbilSc) <- c( 
                           Navterm =    "Level of ability: Navigating Terminal", 
                           PythonScript =    "Level of ability: Executing Python Scripts", 
                           AmazonE2 =    "Level of ability: Using Amazon EC2",
                           InstallMothur =   "Level of ability: Installing and Running Mothur", 
                           ExecRScript =    "Level of ability: Running QIIME", 
                           RunQIIME =    "Level of ability : Executing R Script", 
                           ChooseEcoStat =    "Level of ability: Choosing Ecological Statistics", 
                           InstallAmazonE2 =    "Level of ability: Installing Software on Amazon E2 Image", 
                           AssembleMeta =    "Level of ability: Assembling Metagenomes and Determining Quality", 
                           UseGithub =   "Level of ability: Using GitHub", 
                           RunBLAST =   "Level of ability: Running a Local BLAST", 
                           UseMGRAST =   "Level of ability: Using MG-RAST", 
                           UseAPI =   "Level of ability: Using API to obtain sequences from MG-RAST",
                           Group = "Group")

names(Join_CompUndSc) <- c( 
                     UnderstandCD = "I understand what CD means", 
                     UnderstandPY = "I understand what '.py' means",
                     IlluminaData = "I know how to assess the quality of Illumina Data", 
                     SumSequence = "I know the computational commands to summarize sequencing data", 
                     RunR = "I know how to run R.", 
                     QIIMEvsMothur = "I know the main differences in analyses offered by QIIME and Mothur", 
                     TwoMicrobial = "I can name at least two differentmicrobial metagenomic databases", 
                     CDpkg = "I know what a CD Package is", 
                     StructureOTU = "I understand the structure of an OTU table", 
                     KnowKMER = "I know what a K-MER is",
                     KnowWithinsample = "I know the difference between within sample and comparative diversity", 
                     KnowMetadata = "I know how to use metadata to guide community analyses", 
                     KnowContig = "I know what a contig is", 
                     KnowEC2 = "I know how to start an EC2 instance", 
                     Group = "Group")
                     

names(Join_CodeAbilSc1) <- c(
                       KnowMetagenomeBin = "I know how to perform metagenomic binning", 
                       ExecuteAmplicon = "I can independently execute the steps of  microbial AMPLICON metagenomic analysis", 
                       InformedAmpliconQiime = "I can make informed choices for analysis parameters for AMPLICON analysis in QIIME", 
                       InformedAmpliconMothur = "I can make informed choices for analysis parameters for AMPLICON analysis in mothur", 
                       DiffAssembledMetagenomic = "I understand the differences between unassembled and assembled shotgun metagenomic data.", 
                       LimitationsMetagenomic = "I understand the limitations of unassembled and assembled shotgun metagenomic data", 
                       UnderstandKmer = "I understand what a k-mer is", 
                       QualShotgun = "I can determine the quality of a shotgun metagenome assembly", 
                       MoveDataIntoR = "I can move data from at least one other program into R", 
                       MoveFilesTerminal = "I can find and move files on a computer using terminal", 
                       EvalRawSequence = "I can evaluate the quality of raw sequencing data", 
                       SearchPublicDatasets = "I can search for public datasets relevant to my own project", 
                       CannotShotgunWOHelp = "I CANNOT process and quality control shotgun metagenome unless someone helps", 
                       Group = "Group") 


names(Join_CodeAbilSc2) <- c( 
                       CannotAmpliconWOHelp = "I CANNOT process and quality control amplicon metagenome unless someone helps", 
                      CanCompleteLotofTime = "I can complete an analysis project if I have a lot of time", 
                      CanOvercomeifStuck = "I can find ways of overcoming the problem if I get stuck", 
                      CannotWOHelp = "I CANNOT complete a data analysis project unless I can call someone for help", 
                      KnowShotgun = "I know how to assemble shotgun metagenomic data" , 
                      KnowHPCC = "I know what an HPCC is" , 
                      KnowMetavsAssem = "I know the difference between metagenome assembly and targeted gene assembly", 
                      ExecuteShotgun = "I can independently execute the steps of microbial SHOTGUN metagenomic analysis" , 
                      MinimizeLimitationsSequencing = "I understand how to design an experiment that minimizes limitations of sequencing methods", 
                      AdvantageDisadvMetagemonic = "I understand the advantage and limitation of metagenome binning", 
                      UnderstandTechLimitations = "I understand the technical limitations of metagenomic data", 
                      UnderstandMGRAST = "I understand the adavantage and limitation of MG-RAST", 
                      UseGit = "I can use basic Git commands:  push, pull, status, add, commit", 
                      Group = "Group")

names(Join_ComfCompTask) <- c(
                       NavUnix = "Level of comfort: Navigating around a Unix file", 
                       MakeE2Key = "Level of comfort: Making and using a 'key' for secure EC2 connection", 
                       InstallAuxSoftware= "Level of comfort: Installing axillary software on Amazon EC2", 
                       UseFastQC= "Level of comfort: Using FastQC to assess the overall quality of raw data",
                       SumInfoSequenceFiles= "Level of comfort: Obtain summary information about sequence files (fasta, fna, fastq)", 
                       TrimSeqErrors= "Level of comfort: Calculating resemblance matrices from an OTU table", 
                       AssembleMetagenome= "Level of comfort: Assembling a metagenome", 
                       DiffDataModels= "Level of comfort: Differentiating data modes in R", 
                       TestHypotheses= "Level of comfort: Testing hypotheses about differences in community structure", 
                       IDPublicSequenceData= "Level of comfort: Identifying Public Sequence Data",
                       CalcOTU= "Level of comfort: Identifying features of public sequence databases useful to your research", 
                       BinMetagenome= "Level of comfort: Binning a metagenome", 
                       ObtainSeqfromMGRAST= "Level of comfort: Directly obtain metagenome sequences from MG-RAST using API", 
                       Group = "Group")
