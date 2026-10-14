// Runs the additional-exercise scripts and exports all figures to ../figures
// (console output is also saved to ../figures/console_output.txt)
base   = get_absolute_file_path("export_figures.sce");
figdir = base + "../figures/";
deletefile(figdir + "console_output.txt");
diary(figdir + "console_output.txt");

exec(base + "ex2_2_lab3.sce", -1);
xs2png(f22, figdir + "ex2_2.png");

exec(base + "ex2_4_lab3.sce", -1);
xs2png(f24, figdir + "ex2_4.png");

exec(base + "ex2_6_lab3.sce", -1);
xs2png(f261, figdir + "ex2_6_sys1.png");
xs2png(f262, figdir + "ex2_6_sys2.png");
xs2png(f263, figdir + "ex2_6_sys3.png");

diary(0);
