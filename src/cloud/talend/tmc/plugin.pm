#
# Copyright 2023 Centreon (http://www.centreon.com/)
#
# Centreon is a full-fledged industry-strength solution that meets
# the needs in IT infrastructure and application monitoring for
# service performance.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package cloud::talend::tmc::plugin;

use strict;
use warnings;
use base qw(centreon::plugins::script_custom);

sub new {
    my ($class, %options) = @_;
    my $self = $class->SUPER::new(package => __PACKAGE__, %options);
    bless $self, $class;

    $self->{modes} = {
        'cache'               => 'cloud::talend::tmc::mode::cache',
        'list-environments'   => 'cloud::talend::tmc::mode::listenvironments',
        'list-plans'          => 'cloud::talend::tmc::mode::listplans',
        'list-remote-engines' => 'cloud::talend::tmc::mode::listremoteengines',
        'list-tasks'          => 'cloud::talend::tmc::mode::listtasks',
        'plans'               => 'cloud::talend::tmc::mode::plans',
        'remote-engines'      => 'cloud::talend::tmc::mode::remoteengines',
        'tasks'               => 'cloud::talend::tmc::mode::tasks'
    };

    $self->{custom_modes}->{api} = 'cloud::talend::tmc::custom::api';
    return $self;
}

1;

__END__

=head1 PLUGIN DESCRIPTION

Check Talend Cloud Management Console using API.

=cut
