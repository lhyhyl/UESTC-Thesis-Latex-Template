$pdf_mode = 1;
$xelatex = "xelatex --shell-escape  %O %S";
$pdflatex = "xelatex --shell-escape  %O %S";
$bibtex_use = 2;
$preview_mode = 1;
$pdf_previewer = "";

add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q $_[0]";
  }
  else {
    system "makeglossaries $_[0]";
  };
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdv';