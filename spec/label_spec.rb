require_relative '../lib/label'

describe Label do
  before :each do
    @label = Label.new('Microverse', 'purple')
  end

  describe '#new' do
    it 'creates a new instance of the label class' do
      expect(@label).to be_instance_of(Label)
    end
  end

  describe '#add_item' do
    it 'exists' do
      expect(@label).to respond_to(:add_item)
    end
  end
end
