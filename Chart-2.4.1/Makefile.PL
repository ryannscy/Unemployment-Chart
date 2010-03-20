use ExtUtils::MakeMaker;

#  make the samples directory
mkdir ('samples', 00755);

#  write the makefile
WriteMakefile ( 'NAME' => 'Chart',
		'PREREQ_PM' => { 'GD' => 1.2 },
		'dist' => { 'COMPRESS' => 'gzip', 'SUFFIX' => 'gz' },
		'VERSION' => '2.4.1' )
