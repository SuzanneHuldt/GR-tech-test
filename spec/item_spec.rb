require './lib/item.rb'

describe Item do
  context '#converting to string' do
    it 'interpolates item information into a string' do
      expect(subject.to_s).to be_instance_of(String)
    end
  end
end
