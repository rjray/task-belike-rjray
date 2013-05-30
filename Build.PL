###############################################################################
#
#   Module::Build file for Task::BeLike::RJRAY
#
###############################################################################

use 5.008;
use strict;
use warnings;

use Module::Build;

my $class = Module::Build->subclass(
    class => 'Task::BeLike::RJRAY::Builder',
    code => q|
        sub ACTION_dist
        {
            my $self = shift;

            # Create the text README
            $self->do_system('textile2x',
                             qw(--format plaintext
                                --input README.textile
                                --output README));

            $self->SUPER::ACTION_manifest();
            $self->SUPER::ACTION_dist();
        }
|);

my $builder = $class->new(
    module_name        => 'Task::BeLike::RJRAY',
    license            => 'perl',
    dist_author        => 'Randy J. Ray <rjray@blackperl.com>',
    dist_abstract      => q(RJRAY's favorite modules),
    dist_version       => '0.001',
    build_requires     =>
    {
        'Module::Build' => '0.28',
        'Test::More'    => '0.80',
    },
    requires           =>
    {
        'perl'       => '5.008008',
    },
    add_to_cleanup     => [ qw(README
                               MANIFEST
                               MANIFEST.bak
                               META.yml
                               META.json
                               Makefile.PL) ],
    meta_merge         =>
    {
        resources =>
        {
            homepage   => 'http://search.cpan.org/dist/Task-BeLike-RJRAY',
            bugtracker => 'http://rt.cpan.org/Public/Dist/Display.html?Name=Task-BeLike-RJRAY',
            repository => 'http://github.com/rjray/task-belike-rjray',
        }
    },
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();

exit 0;
