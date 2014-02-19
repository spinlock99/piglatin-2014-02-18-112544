require 'spec_helper'
require 'piglatin'

describe PigLatin do
  describe "#new" do
    subject { PigLatin.new('hello world') }
    it "should instantiate" do
      expect { subject }.to_not raise_exception
    end
  end

  describe ".translate" do
    let(:pig_latin) { PigLatin.new(phrase) }
    subject { pig_latin.translate }

    context 'empty phrase' do
      let(:phrase) { "" }
      it { should eq(nil) }
    end

    context 'words that start with vowels' do
      let(:phrase) { 'ask' }
      it { should eq('askay') }

      context 'and end with a vowel' do
        let(:phrase) { 'apple' }
        it { should eq('appleyay') }
      end

      context 'and end in y' do
        let(:phrase) { 'any' }
        it { should eq('anynay') }
      end
    end

    context 'words that start with consonants' do
      let(:phrase) { 'hello' }
      it { should eq('ellohay') }
    end
    context 'multiple consonants' do
      let(:phrase) { 'known' }
      it { should eq('ownknay') }
    end

    context 'multiple words' do
      let(:phrase) { 'hello world' }
      it { should eq('ellohay orldway') }
    end

    context 'hyphenated words' do
      let(:phrase) { 'well-being' }
      it { should eq('ellway-eingbay') }
    end

    context 'capital letters' do
      context 'Bill' do
        let(:phrase) { 'Bill' }
        it { should eq('Illbay') }
      end
      context 'Andrew' do
        let(:phrase) { 'Andrew' }
        it { should eq('Andreway') }
      end
    end

    context 'punctuation' do
      let(:phrase) { 'Three things: one, two, three.' }
      it { should eq('Eethray ingsthay: oneyay, otway, eethray.') }
    end
  end
end
