require "serverspec"

# Set backend type
set :backend, :exec

describe 'opencart archive download' do

    opencart_zip = '/tmp/opencart.zip'

    describe file(opencart_zip) do
        it { should exist }
        it { should be_mode 640 }
        it { should be_owned_by 'www-data' }
        it { should be_grouped_into 'www-data' }
    end
end

describe 'opencart custom archive download' do

    opencart_zip = '/tmp/opencart_sitenameB.com.zip'

    describe file(opencart_zip) do
        it { should exist }
        it { should be_mode 640 }
        it { should be_owned_by 'www-data' }
        it { should be_grouped_into 'www-data' }
    end
end