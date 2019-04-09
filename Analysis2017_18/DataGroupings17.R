## Post and  Groupings for 2017 
##Group 1 - Perceptual Computational Ability  and Post (Ability Scale)


PerCompAbilSc_Pre <- select(Pre17, 
                               NEW_DevWorkflw,
                               Navterm,
                               AmazonE2,
                               InstallMothur,
                               ExecRScript,
                               ChooseEcoStat,
                               InstallAmazonE2,
                               AssembleMeta,
                               RunBLAST,
                               NEW_DataNCBI) 

PerCompAbilSc_Post <- select(Post17, 
                                NEW_DevWorkflw,
                                Navterm,
                                AmazonE2,
                                InstallMothur,
                                ExecRScript,
                                ChooseEcoStat,
                                InstallAmazonE2,
                                AssembleMeta,
                                RunBLAST,
                                NEW_DataNCBI) 

#Group 2 - Computational Understanding Scale  and Post  (Agree Scale)

CompUndSc_Pre  <- select(Pre17, 
                            UnderstandCD,
                            IlluminaData,
                            SumSequence,
                            RunR,
                            TwoMicrobial,
                            CDpkg,
                            StructureOTU,
                            KnowKMER,
                            KnowContig,
                            KnowEC2,
                            NEW_withinsample,
                            KnowMetadata,
                            KnowShotgun,
                            NEW_Mapreads)  

CompUndSc_Post  <- select(Post17, 
                             UnderstandCD,
                             IlluminaData,
                             SumSequence,
                             RunR,
                             TwoMicrobial,
                             CDpkg,
                             StructureOTU,
                             KnowKMER,
                             KnowContig,
                             KnowEC2,
                             NEW_withinsample,
                             KnowMetadata,
                             KnowShotgun,
                             NEW_Mapreads)

#Group 3 - Coding Ability Scale  and post in two chunks (Agree Scale)

###THESE NEED TO BE MATCHED WITH 2018 Data groupings
CodeAbilSc1_Pre <- select(Pre17,
                          ExecuteAmplicon,
                          InformedAmpliconMothur,
                          LimitationsMetagenomic,
                          UnderstandKmer,
                          QualShotgun,
                          RpgkAnalyzeData,
                          MoveDataIntoR,
                          MoveFilesTerminal,
                          EvalRawSequence,
                          SearchPublicDatasets,
                          CannotShotgunWOHelp,
                          NEW_Mapreads,
                          NEW_StepsSeq) 
                            
CodeAbilSc2_Pre <- select(Pre17,
                          KnowShotgun,
                          ExecuteShotgun,
                          CannotAmpliconWOHelp,
                          CanCompleteLotofTime,
                          CanCompleteMentor,
                          CanOvercomeifStuck,
                          CannotWOHelp,
                          MinimizeLimitationsSequencing,
                          UnderstandTechLimitations,
                          NEW_RemoteTMUX,
                          NEW_Vizseq) 
CodeAbilSc1_Post <- select(Post17,                            
                           ExecuteAmplicon,
                           InformedAmpliconMothur,
                           LimitationsMetagenomic,
                           UnderstandKmer,
                           QualShotgun,
                           RpgkAnalyzeData,
                           MoveDataIntoR,
                           MoveFilesTerminal,
                           EvalRawSequence,
                           SearchPublicDatasets,
                           CannotShotgunWOHelp,
                           NEW_Mapreads,
                           NEW_StepsSeq) 



CodeAbilSc2_Post <- select(Post17,
                           KnowShotgun,
                           ExecuteShotgun,
                           CannotAmpliconWOHelp,
                           CanCompleteLotofTime,
                           CanCompleteMentor,
                           CanOvercomeifStuck,
                           CannotWOHelp,
                           MinimizeLimitationsSequencing,
                           UnderstandTechLimitations,
                           NEW_RemoteTMUX,
                           NEW_Vizseq) 

## 3B Total Coding Ability in one single Scale (Agree Scale )
#CodeAbilSc_TOT_ <- select(17,
#                                ExecuteShotgun,
#                                ExecuteAmplicon,
#                                InformedAmpliconMothur,
#                                LimitationsMetagenomic,
#                                AdvantageDisadvMetagemonic,
#                                UnderstandKmer,
#                                QualShotgun,
#                                NEW_StepsSeq,
#                                RpgkAnalyzeData,
#                                MoveDataIntoR,
#                                MoveFilesTerminal,
#                                EvalRawSequence,
#                                NEW_RemoteTMUX,
#                                NEW_Vizseq,
#                                SearchPublicDatasets,
#                                CannotShotgunWOHelp,
#                                CannotAmpliconWOHelp,
#                                CanCompleteLotofTime,
#                                CanCompleteMentor,
#                                CanOvercomeifStuck,
#                                CannotWOHelp,
#                                MinimizeLimitationsSequencing,
#                                UnderstandTechLimitations) 

#CodeAbilSc_TOT_Post <- select(Post17,
#                                 ExecuteShotgun,
#                                 ExecuteAmplicon,
#                                 InformedAmpliconMothur,
#                                 LimitationsMetagenomic,
#                                 AdvantageDisadvMetagemonic,
#                                 UnderstandKmer,
#                                 QualShotgun,
#                                 NEW_StepsSeq,
#                                 RpgkAnalyzeData,
#                                 MoveDataIntoR,
#                                 MoveFilesTerminal,
#                                 EvalRawSequence,
#                                 NEW_RemoteTMUX,
#                                 NEW_Vizseq,
#                                 SearchPublicDatasets,
#                                 CannotShotgunWOHelp,
#                                 CannotAmpliconWOHelp,
#                                 CanCompleteLotofTime,
#                                 CanCompleteMentor,
#                                 CanOvercomeifStuck,
#                                 CannotWOHelp,
#                                 MinimizeLimitationsSequencing,
#                                 UnderstandTechLimitations) #



# Group 4 - Comfort Computational Tasks -  and post (Comfort Scale)
ComfCompTask_Pre <- select(Pre17, 
                              NavUnix,
                              MakeE2Key,
                              SumInfoSequenceFiles,
                              CalcOTU,
                              TrimSeqErrors,
                              AssembleMetagenome,
                              DiffDataModels,
                              TestHypotheses,
                              IDPublicSequenceData)


ComfCompTask_Post <- select(Post17, 
                               NavUnix,
                               MakeE2Key,
                               SumInfoSequenceFiles,
                               CalcOTU,
                               TrimSeqErrors,
                               AssembleMetagenome,
                               DiffDataModels,
                               TestHypotheses,
                               IDPublicSequenceData)


# Group 5 - Overall Rating Scale - Post (Good Scale)

Rating_Post <- select(Post17, 
                        NEW_RateIntroComp,
                        NEW_RateIntroShell,
                        NEW_RateEC2,
                        NEW_RateBlast,
                        NEW_RateDataviz,
                        NEW_RateShotgun,
                        NEW_RateTmux,
                        NEW_RateDiv,
                        NEW_RateEco,
                        NEW_RateAmplicon, 
                      OverallWorkshop, 
                      OverallSpeaker)

Rating_Post2 <- select(Post17, 
                       MetNeed, LearnedHoped, Recommend)