require 'rspec'
require_relative '../../lib/loader'
require_relative '../../lib/roles'
require_relative '../../lib/environments'
require_relative '../../lib/databag'


describe 'loading git diff --name-status SHA1 SHA2' do

  changeset = <<-EOF
D\troles/foo.rb
A\tenvironments/bar.json
A\tdata_bags/bing/baz.json
EOF

  it 'breaks the changes out into actions and files' do
    expect(KnifeThrower.loader(changeset)).to be_a(Array)
    expect(KnifeThrower.loader(changeset)).to include('roles/foo.rb' => 'D')
    expect(KnifeThrower.loader(changeset)).to include('environments/bar.json' => 'A')
  end

  it 'matches the changes with their classes' do

  end

end