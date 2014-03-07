task :selenium_w2_rrc_form => :environment do
  require "selenium-webdriver"

  #initialize a selenium receiver
  #driver = Selenium::WebDriver.for :phantomjs
  driver = Selenium::WebDriver.for :firefox
  driver.navigate.to "http://webapps.rrc.state.tx.us/CMPL/publicSearchAction.do?"

  #set dates for well search
  begin_date = 2.days.ago.strftime("%m/%d/%Y")
  end_date = Date.today.strftime("%m/%d/%Y")

  #insert dates into search boxes
  driver.find_element(:name, 'searchArgs.fromSubmitDtArgHndlr.inputValue').send_key(begin_date)
  driver.find_element(:name, 'searchArgs.toSubmitDtArgHndlr.inputValue').send_key(end_date)

  button_xpath = '//input[@type="button" and @value="Search"]' #use xpath to define location of submit button
  button = driver.find_element(:xpath, button_xpath)
  button.click()

  drop_down_xpath = '//select[@name="pager.pageSize"]'
  body_xpath = '/html/body'
  drop_down = driver.find_element(:xpath, drop_down_xpath)
  drop_down.send_key("View All") #page didn't refresh
  driver.find_element(:xpath, body_xpath).click()

  #driver.find_element(:class, 'DataGrid')


  table_xpath = '//*[@class="DataGrid"]/tbody/tr'
  rows = driver.find_elements(:xpath, table_xpath)

  rows.each do |row|
    cells = row.find_elements(:tag_name, 'td')

    if cells[0].present?
      #puts cells[0].text.strip.to_i
      @well = Well.find_or_create_by(:tracking_number => cells[0].text.strip.to_i)
      #puts @well.tracking_number
    end

      if @well.present?
        if cells[1].present?
          @well.status = cells[1].text.strip
          @well.save
        end

        if cells[2].present?
          @well.packet_type = cells[2].text.strip
          @well.save
        end

        if cells[3].present?
          number = ("42" << cells[3].text.strip).gsub("-","").to_i #all texas well api numbers start with 42
          @well.api_number = number
          @well.save
        end

        if cells[4].present?
          @well.drilling_permit_number = cells[4].text.strip.to_i
          @well.save
        end

        if cells[5].present?
          @well.well_number = cells[5].text.strip
          @well.save
        end

        if cells[6].present?
          @well.submit_date = Date.strptime(cells[6].text.strip, "%m/%d/%Y")
          @well.save
        end

        if cells[8].present?
          @operator = Operator.find_or_create_by(:name => cells[8].text.strip)
          @operator.operator_wells.create(well_id: @well.id)
        end

        if cells[7].present?
          #puts @operator
          #puts cells[7].text.strip.to_i
          @operator.operator_number = cells[7].text.strip.to_i
          @operator.save
        end

        if cells[10].present?
          #puts @operator.name
          #puts @well.tracking_number
          #puts cells[10].text.strip
          @lease = Lease.find_or_create_by(:name => cells[10].text.strip)
          @lease.lease_operators.create(operator_id: @operator.id)
          @lease.lease_wells.create(well_id: @well.id)
        end

        if cells[9].present?
          puts @lease.name
          puts cells[9].text.strip.to_i
          @lease.lease_number = cells[9].text.strip.to_i
          @lease.save
        end


      end
  end


end
