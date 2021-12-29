# EPU_Emerging
R codes and input files of Master in Economics Thesis.

Once the folder is downloaded, the R code "Execute.R" call the other codes and generate all the graphs (It takes some time...). There were a trade-off between automatization and tractability in the codes, and consequently a mixed-approach was followed: for each model there is a separate file (In "3. Analysis" folder), but all call the same auxiliary functions ("Auxiliary" file). Due to changes in IMF API and database, the original automated downloading don´t work at full anymore, but the file is kept as a check ("0_Original_Download.R"); all the inputs needed are in the Inputs file.

The *Online Appendix* is the PDF file, named "Online_Appendix_All_IRFs". Status: incomplete, Latex compilator gets some errors in file uploading for Greece and setting lag in the four countries (As December, 29). Estimated fix: December, 30
