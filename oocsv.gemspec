Gem::Specification.new do |s|
  s.authors = ['Eli Foster']
  s.name = 'oocsv'
  s.summary = 'A very dynamic object-oriented approach to CSV reading and writing.'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.description = 'A very dynamic object-oriented approach to CSV reading and writing. Unlike the stdlib csv library, this does not handle files. Use the various I/O libraries for that. This gem only handles reading and writing CSV strings. It adds a new struct, CSVEntry, that dynamically has its instance attribute accessor methods created and initialized. '
  s.email = 'elifosterwy@gmail.com'
  s.homepage = 'https://github.com/elifoster/oocsv-rb'
  s.metadata = {
    'issue_tracker' => 'https://github.com/elifoster/oocsv-rb/issues'
  }
  s.files = []
end 
