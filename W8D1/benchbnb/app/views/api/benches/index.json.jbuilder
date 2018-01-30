@benches.each do |bench|
  json.set! bench.id do
    json.partial! '/api/benches/benches', bench: bench
  end
end
