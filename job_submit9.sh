#!/bin/bash
#submits a single job to lxbatch queue, should be run by job_looper.sh
#set CMSSW_PROJECT_SRC="CMSSW_7_2_0_pre4/src/Ntuple/Ntuplizer"
#CMSSW_PROJECT_SRC="CMSSW_6_2_0_SLHC17/src/Ntuple/Ntuplizer"
#CMSSW_PROJECT_SRC="/afs/cern.ch/user/m/muell149/work/CMSSW_7_6_3/src/ttH-13TeVMultiLeptons/TemplateMakers/test"
#CMSSW_PROJECT_SRC="/afs/cern.ch/user/m/muell149/work/CMSSW_7_6_3/src/ttH-13TeVMultiLeptons/TemplateMakers/test/comparison_bdt_hiMatch_unweightedBkg"
CMSSW_PROJECT_SRC="/afs/cern.ch/user/m/muell149/work/CMSSW_7_6_3/src/ttH-13TeVMultiLeptons/TemplateMakers/test/reco_bdt"
#CMSSW_PROJECT_SRC="/afs/cern.ch/user/m/muell149/work/CMSSW_7_6_3/src/ttH-13TeVMultiLeptons/TemplateMakers/test/comparison_bdt_hiMatch_weightedBkgSq"
#CMSSW_PROJECT_SRC="/afs/cern.ch/user/m/muell149/work/CMSSW_7_6_3/src"

cd $CMSSW_PROJECT_SRC
eval `scramv1 runtime -sh`
pwd
#echo "working!!"
root -l -q evaluateRecoBdt.C+\(\""$1"\","$2","$3"\)

