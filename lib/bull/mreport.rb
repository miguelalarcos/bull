require 'liquid'

module MReport
  def reports
    MReport.reports
  end

  def self.load_reports path
    @reports = {}
    #Dir.glob(File.join('..', '..', '**', 'reports' , '*.html')).each do |file|
    Dir.glob(File.join(path, '**', 'reports' , '*.html')).each do |file|
      puts "load file #{file}"
      html = File.read(file)
      @reports[File.basename(file, '.html')] = Liquid::Template.parse(html)
    end
    puts 'reports loaded'
    @reports
  end

  def self.reports
    return @reports if !@reports.nil?
    load_reports
  end
end

#MReport.load_reports