
use warnings;
use Test::More;

my $tests = [
        # CRITICAL TESTS
	{ 'plugin' => './t/bin/critical_die_in_script.pl',  text => 'died and Nagios can detect me', ecode => 2},
	{ 'plugin' => './t/bin/critical_croak_in_script.pl', text => 'croaked and Nagios can detect me', ecode => 2},
	{ 'plugin' => './t/bin/critical_confess_in_script.pl', text => 'confessed and Nagios can detect me', ecode =>2 },
	{ 'plugin' => './t/bin/critical_die_in_module.pl', text => 'died and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/critical_croak_in_module.pl', text => 'croaked and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/critical_confess_in_module.pl', text => 'confessed and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/critical_die_in_extmodule.pl', text => 'died and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/critical_croak_in_extmodule.pl', text => 'croaked and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/critical_confess_in_extmodule.pl', text => 'confessed and Nagios can detect me', ecode => 2 },

	# Explicitly declared CRITICAL TESTS
	{ 'plugin' => './t/bin/explicit_crit_die_in_script.pl',  text => 'died and Nagios can detect me', ecode => 2},
	{ 'plugin' => './t/bin/explicit_crit_croak_in_script.pl', text => 'croaked and Nagios can detect me', ecode => 2},
	{ 'plugin' => './t/bin/explicit_crit_confess_in_script.pl', text => 'confessed and Nagios can detect me', ecode =>2 },
	{ 'plugin' => './t/bin/explicit_crit_die_in_module.pl', text => 'died and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/explicit_crit_croak_in_module.pl', text => 'croaked and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/explicit_crit_confess_in_module.pl', text => 'confessed and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/explicit_crit_die_in_extmodule.pl', text => 'died and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/explicit_crit_croak_in_extmodule.pl', text => 'croaked and Nagios can detect me', ecode => 2 },
	{ 'plugin' => './t/bin/explicit_crit_confess_in_extmodule.pl', text => 'confessed and Nagios can detect me', ecode => 2 },

	# WARNING TESTS
	{ 'plugin' => './t/bin/warning_die_in_script.pl',  text => 'died and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_croak_in_script.pl', text => 'croaked and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_confess_in_script.pl', text => 'confessed and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_die_in_module.pl', text => 'died and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_croak_in_module.pl', text => 'croaked and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_confess_in_module.pl', text => 'confessed and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_die_in_extmodule.pl', text => 'died and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_croak_in_extmodule.pl', text => 'croaked and Nagios can detect me', ecode => 1 },
	{ 'plugin' => './t/bin/warning_confess_in_extmodule.pl', text => 'confessed and Nagios can detect me', ecode => 1 },

	# OK TESTS
	{ 'plugin' => './t/bin/ok_die_in_script.pl',  text => 'died and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_croak_in_script.pl', text => 'croaked and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_confess_in_script.pl', text => 'confessed and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_die_in_module.pl', text => 'died and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_croak_in_module.pl', text => 'croaked and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_confess_in_module.pl', text => 'confessed and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_die_in_extmodule.pl', text => 'died and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_croak_in_extmodule.pl', text => 'croaked and Nagios can detect me', ecode => 0 },
	{ 'plugin' => './t/bin/ok_confess_in_extmodule.pl', text => 'confessed and Nagios can detect me', ecode => 0 },

	# UNKNOWN TESTS
	{ 'plugin' => './t/bin/unknown_die_in_script.pl',  text => 'died and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_croak_in_script.pl', text => 'croaked and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_confess_in_script.pl', text => 'confessed and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_die_in_module.pl', text => 'died and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_croak_in_module.pl', text => 'croaked and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_confess_in_module.pl', text => 'confessed and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_die_in_extmodule.pl', text => 'died and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_croak_in_extmodule.pl', text => 'croaked and Nagios can detect me', ecode => 3 },
	{ 'plugin' => './t/bin/unknown_confess_in_extmodule.pl', text => 'confessed and Nagios can detect me', ecode => 3 },

	#Misuse of the module
	{ 'plugin' => './t/bin/misuse.pl', text => 'Nagios::Plugin::DieNicely doesn\'t know how to exit NOTANAGIOSSTATE', ecode => 2 },
];

plan tests => (scalar(@$tests) * 2);

my $perl = $^X;

foreach my $test (@$tests) {
    my ($rc, $out) = run_plugin($test->{'plugin'});
    cmp_ok($rc, '==', $test->{'ecode'}, "Exit code $test->{'ecode'} for $test->{'plugin'}");
    like($out, qr/$test->{'text'}/, "Expected output for $test->{'plugin'}");
}

sub run_plugin {
    my ($plugin) = @_;
    my $output = `$perl -I blib/lib -I t/lib $plugin 2>/dev/null`;
    chomp $output;
    my $rc = $? >> 8;
    return ( $rc, $output );
}