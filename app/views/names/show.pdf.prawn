images="#{RAILS_ROOT}/public/assets/avatar/#{@name.id}/small/#{@name.photo_file_name}"

if @name.photo_file_name.nil?
	puts ""
else
	puts pdf.image(images, {:at => [390,678], :width => 150})
end

logoros="#{RAILS_ROOT}/public/images/logoros.png"
pdf.image(logoros, {:at => [280,750], :width => 75})

pdf.text  "ROS - Sezione Anticrimine di Brescia", :size => 15, :style => :italic

pdf.move_down(25)

			
pdf.table [	["Cognome e nome",    @name.cognome_nome,  	],
         	["Luogo di nascita",  @name.luogo_nascita, 	],
        	["Data di nascita",		@name.data_nascita,	],
         	[ "Residenza",    		@name.residenza,  	],     
	        [ "Via/piazza",    		@name.via,         	],     
	        [ "Codice fiscale",    	@name.cod_fiscale,  ],     
	        [ "Domicilio",    		@name.domicilio,   	],     
	        [ "Cittadinanza",    	@name.cittadinanza,	],     
	        [ "Professione",   		@name.professione,	],     
	        [ "Soprannome",    		@name.soprannome,  	],     
	        [ "Alias	", 			@name.alias,        ],        
	        [ "Ambito Crim.",   	if @ambit.nil?
											puts ""
										else
											@ambit.ambito_criminale
										end,           					 ],     
	         [ "Associazione Crim.",   	if @association.nil?
											puts ""
										else
											@association.associazione_criminale
										end,             				 ],     
	         [ "Area",  	if @area.nil?
											puts ""
										else
											@area.area_criminale
										end             				]], 

    		:font_size  => 10, 
    		:horizontal_padding => 10,
    		:vertical_padding   => 3,
    		:border_width       => 1,
			#:border_style => :underline_header,
			:row_colors => ["FFFFFF","DDDDDD"],
    		:position  => :left,
    		#:headers => ['Date', 'Employee', 'Hours'],
			#:header_color => 'f07878',
    		:align  => { 2 => :center},
    		:align_headers  => :center,
			:column_width => 200,
			:width => 350,
			:column_widths => { 0 => 100, 1 => 280 },
			:cell_style => {:max_weight => 150}
	
	
	pdf.move_down(10)
	
	@unions.each do |union|
			if union.nil?
				puts""
			else
				
				pdf.text "Associazioni: #{union.denominazione}", :style => :italic
			end
		end
		
	pdf.move_down(10)
	
	pdf.text "Note : #{@name.note_generali}",  :style => :italic
                            
  











