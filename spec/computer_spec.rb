require 'computer'

describe Computer do
  it "plays a shape" do
    expect(subject).to respond_to(:play)
  end

  it "chooses a winner" do
    subject.play(:scissors)
    expect(subject.result_against(:rock)).to eq :lose
  end

  it "knows rock beats scissors" do
    subject.play(:rock)
    expect(subject.result_against(:scissors)).to eq :win
  end

  it "knows rock draws with rock" do
    subject.play(:rock)
    expect(subject.result_against(:rock)).to eq :draw
  end

  it "knows rock loses to paper" do
    subject.play(:rock)
    expect(subject.result_against(:paper)).to eq :lose
  end

  it "knows paper loses to scissors" do
    subject.play(:paper)
    expect(subject.result_against(:scissors)).to eq :lose
  end

  it "knows paper beats rock" do
    subject.play(:paper)
    expect(subject.result_against(:rock)).to eq :win
  end

  it "knows paper draws with paper" do
    subject.play(:paper)
    expect(subject.result_against(:paper)).to eq :draw
  end

  it "knows scissors draws with scissors" do
    subject.play(:scissors)
    expect(subject.result_against(:scissors)).to eq :draw
  end

  it "knows scissors loses to rock" do
    subject.play(:scissors)
    expect(subject.result_against(:rock)).to eq :lose
  end

  it "knows scissors beats paper" do
    subject.play(:scissors)
    expect(subject.result_against(:paper)).to eq :win
  end

  it "raises an error if choice is not in the game rules" do
    expect{ subject.result_against(:foo) }.to raise_error
  end

  it "plays a random shape" do
    subject.play
    expect([:rock, :paper, :scissors]).to include(subject.shape)
  end
end