require_relative 'neural_network.rb'

def generate_xor
  inputs = [rand(2), rand(2)]
  correct = [inputs[0] ^ inputs[1]]

  return inputs, correct
end

network = Network.new(3, 2, 3, 1)

times_trained = 0
times_correct = 0
while times_correct < 50
  inputs, correct = generate_xor
  network.train(inputs, correct)

  puts "Input: " + inputs.to_s
  puts "Correct Output: " + correct[0].to_s
  puts "Network Output: " + network.outputs[0].round.to_s
  puts "Error: " + network.global_error.to_s

  if network.outputs[0].round == correct[0]
    if network.global_error < 0.01
      times_correct += 1
    else
      times_correct = 0
    end
  end

  times_trained += 1
end

puts "Training complete"
puts "It took " + times_trained.to_s + " pulses"