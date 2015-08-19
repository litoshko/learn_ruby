def measure(runs=1,&block)
	start = Time.now
	runs.times{yield}
	(Time.now - start)/runs
end