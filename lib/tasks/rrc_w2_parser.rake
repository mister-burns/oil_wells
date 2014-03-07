task :parse_and_save_w2_rrc_form => :environment do

  require 'pdf-reader'
  require 'open-uri'

  file = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=94168"
  io = open(file)
  reader = PDF::Reader.new(io)
  reader.pages.each do |page|
    page.raw_content
  end


  #receiver = PDF::Reader::RegisterReceiver.new
  ##filename = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=94168"
  #filename = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=96943"
  #io = open(filename)
  #
  #PDF::Reader.open(io) do |reader|
  #  reader.pages.each do |page|
  #    page.walk(receiver)
  #    @count = 0
  #    receiver.callbacks.each do |cb|
  #      puts cb.inspect
  #      #if cb[:name].to_s == 'move_text_position' or cb[:name].to_s == 'show_text'
  #      #  @count = @count + 1
  #      #  puts "#{@count}. #{cb[:args]}"
  #      #  puts cb
  #      #  if @count == 42
  #      #    tracking_number = cb[:args].first.to_s
  #      #    @well = Well.find_or_create_by(:tracking_number => tracking_number)
  #      #    puts @well.tracking_number
  #      #  end
  #      #
  #      #  if @count == 93
  #      #    oil_24_hour = cb[:args].first.to_f
  #      #    @well.oil_24_hour = oil_24_hour
  #      #  end
  #      #
  #      #  if @count == 94
  #      #    gas_24_hour = cb[:args].first.to_f
  #      #    @well.gas_24_hour = gas_24_hour
  #      #  end
  #      #
  #      #  if @count == 95
  #      #    water_24_hour = cb[:args].first.to_f
  #      #    @well.water_24_hour = water_24_hour
  #      #  end
  #      #
  #      #  if @count == 315
  #      #    @well.save
  #      #  end
  #      #
  #      #end
  #    end
  #  end
  #end
end


task :parse_and_save_w2_rrc_form_v2 => :environment do
 # Extract text from a PDF file
 # This scraper uses the pdf-reader gem.
 # Documentation is at https://github.com/yob/pdf-reader#readme
 # If you have problems you can ask for help at http://groups.google.com/group/pdf-reader
  require 'pdf-reader'
  require 'open-uri'

  ##########  This section contains the callback code that processes the PDF file contents  ######
  class PageTextReceiver
    attr_accessor :content, :page_counter
    def initialize
      @content = []
      @page_counter = 0
    end
    # Called when page parsing starts
    def begin_page(arg = nil)
      @page_counter += 1
      @content << ""
    end
    # record text that is drawn on the page
    def show_text(string, *params)
      @content.last << string
    end
    # there's a few text callbacks, so make sure we process them all
    alias :super_show_text :show_text
    alias :move_to_next_line_and_show_text :show_text
    alias :set_spacing_next_line_show_text :show_text
    # this final text callback takes slightly different arguments
    #def show_text_with_positioning(*params)
      #params = params.first
      #params.each { |str| show_text(str) if str.kind_of?(String)}
    #end
  end
  ################  End of TextReceiver #############################

  filename = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=94168"
  io = open(filename)

  #######  Instantiate the receiver and the reader
  receiver = PageTextReceiver.new
  pdf_reader = PDF::Reader.new
  #######  Now you just need to make the call to parse...
  pdf_reader.parse(io, receiver)
  #######  ...and do whatever you want with the text.
  #######  This just outputs it.
  @count = 0
  receiver.content.each do |r|
    puts @count
    #puts @count + "." + " "
    puts r.strip + " "
  end

end

task :parse_and_save_w2_rrc_form_v3 => :environment do

  require 'pdf-reader'
  require 'open-uri'

  receiver = PDF::Reader::RegisterReceiver.new
  filename = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=94168"
  #filename = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=96943"
  io = open(filename)

  PDF::Reader.open(io) do |reader|
    reader.pages.each do |page|
      page.walk(receiver)
      @count = 0
      receiver.callbacks.each do |cb|

        puts cb
      end
    end
  end
end


task :origami_rrc_pdf_parse => :environment do

  require 'origami'
  require 'open-uri'

  url = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=94168"
  #filename = "http://webapps.rrc.state.tx.us/CMPL/viewPdfReportFormAction.do?method=cmplW2FormPdf&packetSummaryId=96943"
  #file = open(url)
  file = open("/Users/jgoldstein/Desktop/viewPdfReportFormAction-26.do.pdf")
  pdf = Origami::PDF.read file
  page = pdf.pages.first
  #puts page.Contents
  puts pdf

end