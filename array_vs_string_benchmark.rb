require 'benchmark'

Benchmark.bmbm do |x|
  x.report('<< :') do
    s = ""
    10000000.times { s << "something "  }
  end
  x.report('[].join') do
    a = []
    10000000.times { a << "something "  }
    a.join
  end
end
