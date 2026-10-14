# Digital Signal Processing (DSP) - Scilab Labs

This repository contains the LaTeX source code, Scilab scripts, and graphical results for the Digital Signal Processing (DSP - Course CO2036) laboratory exercises at Ho Chi Minh City University of Technology (HCMUT).

## Repository Structure

```
signal_scilab/
├── Lab1_Lab2/
│   ├── report.tex          # LaTeX source for Lab 1 & Lab 2 report
│   ├── report.pdf          # Compiled 15-page PDF report
│   ├── header.sty          # Formatting and styles
│   ├── images/             # Common logos (hcmut.png)
│   ├── extracted_images/   # Screenshots and output plots for Labs 1 & 2
│   └── *.sci               # Scilab source scripts for Labs 1 & 2
│
└── Lab3/
    ├── report.tex          # LaTeX source for Lab 3 report
    ├── report.pdf          # Compiled 31-page PDF report
    ├── header.sty          # Formatting and styles
    ├── images/             # Common logos (hcmut.png)
    ├── figures/            # Screenshots and output plots for Lab 3
    └── src/                # Scilab script functions and testing scripts
        ├── advance_lab3.sci    # Exercise 2: advance operation
        ├── add_lap3.sci        # Exercise 4: addition of signals
        ├── convolution_lap3.sci# Exercise 6: convolution
        ├── ex2_2_lab3.sce      # Additional Exercise 2.2
        ├── ex2_4_lab3.sce      # Additional Exercise 2.4
        ├── ex2_6_lab3.sce      # Additional Exercise 2.6
        └── export_figures.sce  # Batch execution & figure export script
```

## Compilation Instructions

Both reports can be compiled using `latexmk` via Strawberry Perl (or `pdflatex`):

```bash
cd Lab1_Lab2
latexmk -pdf -interaction=nonstopmode report.tex

cd ../Lab3
latexmk -pdf -interaction=nonstopmode report.tex
```
