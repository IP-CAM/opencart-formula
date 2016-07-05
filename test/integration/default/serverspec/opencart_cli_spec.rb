require "serverspec"

# Set backend type
set :backend, :exec

describe 'opencart cli tool' do

    ocok = '/usr/local/bin/ocok'

    describe file(ocok) do
        it { should exist }
        it { should be_mode 740 }
        it { should be_owned_by 'www-data' }
        it { should be_grouped_into 'www-data' }
    end
end