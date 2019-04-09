#Rename 2018 

names(J_PerCompAbilSc) <- c( 
  NEW_DevWorkflw = "Developing a Computing Workflow",
  Navterm =    "Level of ability: Navigating Terminal", 
  AmazonE2 =    "Level of ability: Using Amazon EC2",
  InstallMothur =   "Level of ability: Installing and Running Mothur", 
  ExecRScript =    "Level of ability: Executing R Script", 
  ChooseEcoStat =    "Level of ability: Choosing Ecological Statistics", 
  InstallAmazonE2 =    "Level of ability: Installing Software on Amazon E2 Image", 
  AssembleMeta =    "Level of ability: Assembling Metagenomes and Determining Quality", 
  RunBLAST =   "Level of ability: Running a Local BLAST", 
  NEW_DataNCBI = "Retrieving Data from NCBI",
  Group = "Group")

names(J_CompUndSc) <- c( 
  UnderstandCD = "I understand what CD means", 
  IlluminaData = "I know how to assess the quality of Illumina Data", 
  SumSequence = "I know the computational commands to summarize sequencing data", 
  RunR = "I know how to run R.", 
  TwoMicrobial = "I can name at least two differentmicrobial metagenomic databases", 
  CDpkg = "I know what a CD Package is", 
  StructureOTU = "I understand the structure of an OTU table", 
  KnowKMER = "I know what a K-MER is",
  KnowContig = "I know what a contig is", 
  KnowEC2 = "I know how to start an EC2 instance", 
  NEW_withinsample = "I know the difference between within-sample (alpha) and comparative (beta) diversity", 
  KnowMetadata = "I know how to use metadata to guide community analyses", 
  Group = "Group")


names(J_CodeAbilSc1) <- c(
  ExecuteAmplicon = "I can independently execute the steps of  microbial AMPLICON metagenomic analysis", 
  InformedAmpliconMothur = "I can make informed choices for analysis parameters for AMPLICON analysis in mothur", 
  DiffAssembledMetagenomic = "I understand the differences between unassembled and assembled shotgun metagenomic data",
  LimitationsMetagenomic = "I understand the limitations of unassembled and assembled shotgun metagenomic data", 
  UnderstandKmer = "I understand what a k-mer is", 
  QualShotgun = "I can determine the quality of a shotgun metagenome assembly", 
  RpkgAnalyzeData = "I can use an R package to analyze data",
  MoveDataIntoR = "I can move data from at least one other program into R", 
  MoveFilesTerminal = "I can find and move files on a computer using terminal", 
  EvalRawSequence = "I can evaluate the quality of raw sequencing data", 
  SearchPublicDatasets = "I can search for public datasets relevant to my own project", 
  CannotShotgunWOHelp = "I CANNOT process and quality control shotgun metagenome unless someone helps", 
  NEW_Mapreads = "I know how to map reads in metagenome analysis", 
  NEW_StepsSeq = "I can think through the steps of a sequencing analysis from start to finish", 
  Group = "Group") 

names(J_CodeAbilSc2) <- c(
  KnowShotgun = "I know how to assemble shotgun metagenomic data",
  ExecuteShotgun = "I can independently execute the steps of microbial SHOTGUN metagenomic analysis",
  CannotAmpliconWOHelp = "I CANNOT process and quality control amplicon metagenome unless someone helps", 
  CanCompleteLotofTime = "I can complete an analysis project if I have a lot of time",
  CanCompleteMentor = "I can complete an analysis project if I have just the help of my research mentor for assistance.",
  CanOvercomeifStuck = "I can find ways of overcoming the problem if I get stuck", 
  CannotWOHelp = "I CANNOT complete a data analysis project unless I can call someone for help", 
  MinimizeLimitationsSequencing = "I understand how to design an experiment that minimizes limitations inherent to sequencing.", 
  UnderstandTechLImintations = "I understand the technical limitations of metagenome data.",
  NEW_RemoteTMUX = "I can start a remote session using tmux", 
  NEW_Vizseq = "I cna visualize microbial sequencing data in R",
  Group = "Group") 


names(J_ComfCompTask) <- c(
  NavUnix = "Level of comfort: Navigating around a Unix file", 
  MakeE2Key = "Level of comfort: Making and using a 'key' for secure EC2 connection", 
  SumInfoSequenceFiles= "Level of comfort: Obtain summary information about sequence files (fasta, fna, fastq)", 
  CalcOTU= "Level of comfort: Calculating resemblance matrices from an OTU table", 
  TrimSeqErrors= "Level of comfort: Trimming errors from sequences by IDing low coverage kmers",   
  AssembleMetagenome= "Level of comfort: Assembling a metagenome", 
  DiffDataModels= "Level of comfort: Differentiating data modes in R", 
  TestHypotheses= "Level of comfort: Testing hypotheses about differences in community structure", 
  IDPublicSequenceData= "Level of comfort: Identifying features of public sequence data", 
  Group = "Group")

names(Rating_Post) <- c( 
  NEW_RateIntroComp = "Introduction to computing",
  NEW_RateIntroShell = "Introduction to the Shell",
  NEW_RateEC2 = "EC2 Usage",
  NEW_RateBlast = "Local BLAST",
  NEW_RateDataviz = "Data Visualization",
  NEW_RateShotgun = "shotgun metagenomic analysis",
  NEW_RateTmux = "Remote sessions with tmux",
  NEW_RateDiv = "Diversity conceptual framework",
  NEW_RateEco = "Ecological analysis in R",
  NEW_RateAmplicon = "Amplicon analysis in mothur")
