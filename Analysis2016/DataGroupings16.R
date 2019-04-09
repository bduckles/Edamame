

##Group 1 - Perceptual Computational Ability Pre and Post With Additions to the Scale (ADD) 
#PerCompAbilSc_Post <- select(Post16, 
#                                    Navterm, PythonScript, AmazonE2, 
#                                    InstallMothur, ExecRScript) 

#PerCompAbilSc_Post_ADD <- select(Post16, 
#                                        RunQIIME, ChooseEcoStat, 
#                                        InstallAmazonE2, AssembleMeta, 
#                                        UseGithub, RunBLAST, UseMGRAST, 
#                                        UseAPI) 

#PerCompAbilSc_Pre <- select(Pre16, 
#                            Navterm, PythonScript, AmazonE2, 
#                            InstallMothur, ExecRScript) 

#PerCompAbilSc_Pre_ADD <- select(Pre16, 
#                                RunQIIME, ChooseEcoStat, 
#                                InstallAmazonE2, AssembleMeta, 
#                                UseGithub, RunBLAST, UseMGRAST, 
#                                UseAPI) 

AllPost_PerCompAbilSc <- select(Post16, 
                                Navterm, PythonScript, AmazonE2, 
                                InstallMothur, ExecRScript, RunQIIME, ChooseEcoStat, 
                                InstallAmazonE2, AssembleMeta, 
                                UseGithub, RunBLAST, UseMGRAST, 
                                UseAPI) 

AllPre_PerCompAbilSc <- select(Pre16, 
                               Navterm, PythonScript, AmazonE2, 
                               InstallMothur, ExecRScript, RunQIIME, ChooseEcoStat, 
                               InstallAmazonE2, AssembleMeta, 
                               UseGithub, RunBLAST, UseMGRAST, 
                               UseAPI) 


#Group 2 - Computational Understanding Scale Pre and Post with ADDs to group. 
#CompUndSc_Post <- select(Post16, 
#                             IlluminaData, SumSequence, RunR, QIIMEvsMothur, 
#                             TwoMicrobial, CDpkg, StructureOTU, KnowKMER, 
#                             KnowWithinsample, KnowMetadata) 

#CompUndSc_Post_ADD <- select(Post16, 
#                                 KnowContig, KnowEC2, UnderstandCD, UnderstandPY)

#CompUndSc_Pre <- select(Pre16, 
#                        IlluminaData, SumSequence, RunR, QIIMEvsMothur, 
#                        TwoMicrobial, CDpkg, StructureOTU, KnowKMER, 
#                        KnowWithinsample, KnowMetadata) 

#CompUndSc_Pre_ADD <- select(Pre16, 
#                            KnowContig, KnowEC2, UnderstandCD, UnderstandPY)

AllPost_CompUndSc  <- select(Post16, 
                            IlluminaData, SumSequence, RunR, QIIMEvsMothur, 
                            TwoMicrobial, CDpkg, StructureOTU, KnowKMER, 
                            KnowWithinsample, KnowMetadata, KnowContig, KnowEC2, 
                            UnderstandCD, UnderstandPY) 

AllPre_CompUndSc  <- select(Pre16, 
                            IlluminaData, SumSequence, RunR, QIIMEvsMothur, 
                            TwoMicrobial, CDpkg, StructureOTU, KnowKMER, 
                            KnowWithinsample, KnowMetadata, KnowContig, KnowEC2, 
                            UnderstandCD, UnderstandPY) 

#Group 3 - Coding Ability Scale Pre and post with ADD
#CodeAbilitySc_Post <- select(Post16,
#                               KnowMetagenomeBin, ExecuteAmplicon, InformedAmpliconQiime, 
#                               InformedAmpliconMothur, DiffAssembledMetagenomic, 
#                               LimitationsMetagenomic, UnderstandKmer, QualShotgun, 
#                               MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, 
#                               SearchPublicDatasets) 

#CodeAbilHelp_Post <- select(Post16, 
#                                 CannotShotgunWOHelp, CannotAmpliconWOHelp, 
#                                 CanCompleteLotofTime, CanOvercomeifStuck, CannotWOHelp) 
                               
#CodeAbilSc_Post_ADD <- select(Post16,
#                                   KnowShotgun, KnowHPCC, KnowMetavsAssem, ExecuteShotgun, 
#                                   AdvantageDisadvMetagemonic, MinimizeLimitationsSequencing, 
#                                   UnderstandTechLimitations, UnderstandMGRAST, UseGit) 

#CodeAbilSc_Pre <- select(Pre16,
#                         KnowMetagenomeBin, ExecuteAmplicon, InformedAmpliconQiime, 
#                         InformedAmpliconMothur, DiffAssembledMetagenomic, 
#                         LimitationsMetagenomic, UnderstandKmer, QualShotgun, 
#                         MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, 
#                         SearchPublicDatasets) 

#CodeAbilHelp_Pre <- select(Pre16, 
#                           CannotShotgunWOHelp, CannotAmpliconWOHelp, 
#                           CanCompleteLotofTime, CanOvercomeifStuck, CannotWOHelp) 

#CodeAbilSc_Pre_ADD <- select(Pre16,
#                             KnowShotgun, KnowHPCC, KnowMetavsAssem, ExecuteShotgun, 
#                             AdvantageDisadvMetagemonic, MinimizeLimitationsSequencing, 
#                             UnderstandTechLimitations, UnderstandMGRAST, UseGit) 

AllPost_CodeAbilSc1 <- select(Post16,
                          KnowMetagenomeBin, ExecuteAmplicon, InformedAmpliconQiime, 
                          InformedAmpliconMothur, DiffAssembledMetagenomic, 
                          LimitationsMetagenomic, UnderstandKmer, QualShotgun, 
                          MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, 
                          SearchPublicDatasets, CannotShotgunWOHelp) 

AllPost_CodeAbilSc2 <- select(Post16,
                             CannotAmpliconWOHelp, 
                              CanCompleteLotofTime, CanOvercomeifStuck, CannotWOHelp, KnowShotgun, 
                              KnowHPCC, KnowMetavsAssem, ExecuteShotgun, 
                              AdvantageDisadvMetagemonic, MinimizeLimitationsSequencing, 
                              UnderstandTechLimitations, UnderstandMGRAST, UseGit) 


AllPre_CodeAbilSc1 <- select(Pre16,
                            KnowMetagenomeBin, ExecuteAmplicon, InformedAmpliconQiime, 
                            InformedAmpliconMothur, DiffAssembledMetagenomic, 
                            LimitationsMetagenomic, UnderstandKmer, QualShotgun, 
                            MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, 
                            SearchPublicDatasets, CannotShotgunWOHelp) 
                            
AllPre_CodeAbilSc2 <- select(Pre16,                            
                            CannotAmpliconWOHelp, 
                            CanCompleteLotofTime, CanOvercomeifStuck, CannotWOHelp, KnowShotgun, 
                            KnowHPCC, KnowMetavsAssem, ExecuteShotgun, 
                            AdvantageDisadvMetagemonic, MinimizeLimitationsSequencing, 
                            UnderstandTechLimitations, UnderstandMGRAST, UseGit) 

#########
AllPost_CodeAbilSc_TOT <- select(Post16,
                              KnowMetagenomeBin, ExecuteAmplicon, InformedAmpliconQiime, 
                              InformedAmpliconMothur, DiffAssembledMetagenomic, 
                              LimitationsMetagenomic, UnderstandKmer, QualShotgun, 
                              MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, 
                              SearchPublicDatasets, CannotShotgunWOHelp, 
                              CannotAmpliconWOHelp, CanCompleteLotofTime, 
                              CanOvercomeifStuck, CannotWOHelp, KnowShotgun, 
                              KnowHPCC, KnowMetavsAssem, ExecuteShotgun, 
                              AdvantageDisadvMetagemonic, MinimizeLimitationsSequencing, 
                              UnderstandTechLimitations, UnderstandMGRAST, UseGit) 


AllPre_CodeAbilSc_TOT <- select(Pre16,
                                KnowMetagenomeBin, ExecuteAmplicon, InformedAmpliconQiime, 
                                InformedAmpliconMothur, DiffAssembledMetagenomic, 
                                LimitationsMetagenomic, UnderstandKmer, QualShotgun, 
                                MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, 
                                SearchPublicDatasets, CannotShotgunWOHelp, 
                                CannotAmpliconWOHelp, CanCompleteLotofTime, 
                                CanOvercomeifStuck, CannotWOHelp, KnowShotgun, 
                                KnowHPCC, KnowMetavsAssem, ExecuteShotgun, 
                                AdvantageDisadvMetagemonic, MinimizeLimitationsSequencing, 
                                UnderstandTechLimitations, UnderstandMGRAST, UseGit) 




# Group 4 - Comfort Computational Tasks - Pre and post with Adds 
#ComfCompTask_Post <- select(Post16, 
#                                NavUnix, MakeE2Key, InstallAuxSoftware, UseFastQC, 
#                                SumInfoSequenceFiles, TrimSeqErrors, AssembleMetagenome, 
#                                DiffDataModels, TestHypotheses, IDPublicSequenceData)

#ComfCompTask_Post_ADD <- select(Post16, 
#                                CalcOTU, BinMetagenome, ObtainSeqfromMGRAST)

#ComfCompTask_Pre <- select(Pre16, 
#                           NavUnix, MakeE2Key, InstallAuxSoftware, UseFastQC, 
#                           SumInfoSequenceFiles, TrimSeqErrors, AssembleMetagenome, 
#                           DiffDataModels, TestHypotheses, IDPublicSequenceData)
#ComfCompTask_Pre_ADD <- select(Pre16, 
#                               CalcOTU, BinMetagenome, ObtainSeqfromMGRAST)

AllPost_ComfCompTask <- select(Post16, 
                              NavUnix, MakeE2Key, InstallAuxSoftware, UseFastQC, SumInfoSequenceFiles, 
                              TrimSeqErrors, AssembleMetagenome, DiffDataModels, TestHypotheses, IDPublicSequenceData,
                              CalcOTU, BinMetagenome, ObtainSeqfromMGRAST)
AllPre_ComfCompTask <- select(Pre16, 
                              NavUnix, MakeE2Key, InstallAuxSoftware, UseFastQC,SumInfoSequenceFiles, 
                              TrimSeqErrors, AssembleMetagenome, DiffDataModels, TestHypotheses, IDPublicSequenceData,
                              CalcOTU, BinMetagenome, ObtainSeqfromMGRAST)