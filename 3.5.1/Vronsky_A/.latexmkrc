# Custom PDF name
$pdf_file = 'Vronsky_A';

# Enable PDF mode
$pdf_mode = 1;

# Directories for output files
$out_dir = '../pdf';  # Directory for the PDF file
$aux_dir = './aux';   # Directory for auxiliary files

# Function to ensure directories exist
sub ensure_dir {
    my $dir = shift;
    mkdir $dir unless -d $dir;
}
ensure_dir($out_dir);
ensure_dir($aux_dir);

# Set the output directories for auxiliary files
$latex = "pdflatex -interaction=nonstopmode -output-directory=$aux_dir -jobname=$pdf_file";

# PDF viewer command (adjust as necessary for your OS)
$pdf_previewer = "start";  # For Windows
#$pdf_previewer = "open";   # For macOS
#$pdf_previewer = "xdg-open"; # For Linux

# Override the default output name for PDF
sub latexmk_pdf_file {
    return "$out_dir/$pdf_file";  # Return the full path with the custom name
}

# Override the main output file name for latexmk
sub latexmk_main_file {
    return 'Vronsky_A';  # Set the base name for the output file
}
