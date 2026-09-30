# Scilab DSP Lab Report

This directory contains the LaTeX source code and the extracted images for the Digital Signal Processing (DSP) lab report simulating Lab 1 and Lab 2 exercises in Scilab.

## Directory Structure
- `report.tex`: The main LaTeX source file for the report.
- `header.sty`: The LaTeX style file defining custom formatting, colors, headers, and custom environments (like `resultbox`).
- `images/`: Contains common graphical elements like the university logo (`hcmut.png`) used in the headers.
- `extracted_images/`: Contains the plots and Scilab console outputs generated from the lab exercises.

## Compilation Instructions

To compile the `report.tex` file into a PDF, it is highly recommended to use **`latexmk`** via Strawberry Perl (if on Windows) to automatically handle multiple build passes for the table of contents, figures, and references.

### Prerequisites
1. A TeX distribution (e.g., MiKTeX or TeX Live) installed and added to your system PATH.
2. Strawberry Perl (for Windows users) to run `latexmk`.

### Build Command
Open your terminal or command prompt in this `Scilab_lab` directory and run the following command:

```bash
latexmk -pdf -interaction=nonstopmode report.tex
```

- `-pdf`: Instructs `latexmk` to generate a PDF file.
- `-interaction=nonstopmode`: Ensures the compilation doesn't pause for user input if it encounters minor warnings.

### Cleaning Up Auxiliary Files
LaTeX generates numerous auxiliary files (`.aux`, `.log`, `.out`, `.fls`, `.fdb_latexmk`, etc.) during compilation. To clean up your directory after a successful build, you can run:

```bash
latexmk -c
```
This will remove the temporary auxiliary files but leave the generated `report.pdf` intact.

## Editing the Report
If you want to modify the explanations or update the student details:
1. Open `report.tex` in your preferred text editor (e.g., VS Code).
2. Edit the Student Name and ID sections near the top under `\begin{center}`.
3. Replace the images in the `extracted_images/` folder or adjust the `\includegraphics` paths if you generate new Scilab outputs.
4. Save and recompile using the instructions above.
