xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8" 
xml.Workbook({
  'xmlns'      => "urn:schemas-microsoft-com:office:spreadsheet", 
  'xmlns:o'    => "urn:schemas-microsoft-com:office:office",
  'xmlns:x'    => "urn:schemas-microsoft-com:office:excel",    
  'xmlns:html' => "http://www.w3.org/TR/REC-html40",
  'xmlns:ss'   => "urn:schemas-microsoft-com:office:spreadsheet" 
  }) do

  xml.Worksheet 'ss:Name' => 'RWP Registered Users' do
    xml.Table do

      # Header
      xml.Row do
          xml.Cell { xml.Data 'ID', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Surname', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'First Name', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Company', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Date Joined', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Phone', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Number of Logins', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Email', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Country', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Postcode', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Address1', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Address2', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'City', 'ss:Type' => 'String' }
          
          
      end

      # Rows
      for user in @users
        xml.Row do
            xml.Cell { xml.Data user.id, 'ss:Type' => 'Number' }
            xml.Cell { xml.Data user.surname, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.first_name, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.company_name, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.created_at, 'ss:Type' => 'DateTime' }
            xml.Cell { xml.Data user.phone, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.number_of_logins, 'ss:Type' => 'Number' }
            xml.Cell { xml.Data user.email, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.country, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.postcode, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.address1, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.address2, 'ss:Type' => 'String' }
            xml.Cell { xml.Data user.city, 'ss:Type' => 'String' }
        end
      end

    end
  end
end