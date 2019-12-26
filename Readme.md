Program for output of a given word in the format of values from the periodic Table Mendelleev (light version)
If symbol from word not found, symbol change to 'X'

Pre-launch actions:

- ```clone git@github.com:Vito300187/Word_Mendeleev_style.git```
- ```bundle``` 

Run programme command ```WORD='any_word' TYPE='symbol' ruby mendeleev_style.rb```


For example, input ```WORD='ruby' TYPE='symbol' ruby mendeleev_style.rb``` => ```RuBY```, where Ru- 'Rubidium', B- 'Boron' Y- 'Yttrium' elements


By default, the output values get string for all element, but if you need get list with all data elements given word, 
give in comand line env TYPE='none', you will get list of hashes elements.
 
For example, ```input WORD='ruby' TYPE='none' ruby mendeleev_style.rb``` get => 

- {"name"=>"Ruthenium", "appearance"=>"silvery white metallic", "atomic_mass"=>101.072, "boil"=>4423, "category"=>"transition metal", "color"=>nil, "density"=>12.45, "discovered_by"=>"Karl Ernst Claus", "melt"=>2607, "molar_heat"=>24.06, "named_by"=>nil, "number"=>44, "period"=>5, "phase"=>"Solid", "source"=>"https://en.wikipedia.org/wiki/Ruthenium", "spectral_img"=>nil, "summary"=>"Ruthenium is a chemical element with symbol Ru and atomic number 44. It is a rare transition metal belonging to the platinum group of the periodic table. Like the other metals of the platinum group, ruthenium is inert to most other chemicals.", "symbol"=>"Ru", "xpos"=>8, "ypos"=>5, "shells"=>[2, 8, 18, 15, 1], "electron_configuration"=>"1s2 2s2 2p6 3s2 3p6 3d10 4s2 4p6 4d7 5s1", "electron_affinity"=>100.96, "electronegativity_pauling"=>2.2, "ionization_energies"=>[710.2, 1620, 2747]}
- {"name"=>"Boron", "appearance"=>"black-brown", "atomic_mass"=>10.81, "boil"=>4200, "category"=>"metalloid", "color"=>nil, "density"=>2.08, "discovered_by"=>"Joseph Louis Gay-Lussac", "melt"=>2349, "molar_heat"=>11.087, "named_by"=>nil, "number"=>5, "period"=>2, "phase"=>"Solid", "source"=>"https://en.wikipedia.org/wiki/Boron", "spectral_img"=>nil, "summary"=>"Boron is a metalloid chemical element with symbol B and atomic number 5. Produced entirely by cosmic ray spallation and supernovae and not by stellar nucleosynthesis, it is a low-abundance element in both the Solar system and the Earth's crust. Boron is concentrated on Earth by the water-solubility of its more common naturally occurring compounds, the borate minerals.", "symbol"=>"B", "xpos"=>13, "ypos"=>2, "shells"=>[2, 3], "electron_configuration"=>"1s2 2s2 2p1", "electron_affinity"=>26.989, "electronegativity_pauling"=>2.04, "ionization_energies"=>[800.6, 2427.1, 3659.7, 25025.8, 32826.7]}
- {"name"=>"Yttrium", "appearance"=>"silvery white", "atomic_mass"=>88.905842, "boil"=>3203, "category"=>"transition metal", "color"=>nil, "density"=>4.472, "discovered_by"=>"Johan Gadolin", "melt"=>1799, "molar_heat"=>26.53, "named_by"=>nil, "number"=>39, "period"=>5, "phase"=>"Solid", "source"=>"https://en.wikipedia.org/wiki/Yttrium", "spectral_img"=>nil, "summary"=>"Yttrium is a chemical element with symbol Y and atomic number 39. It is a silvery-metallic transition metal chemically similar to the lanthanides and it has often been classified as a \"rare earth element\". Yttrium is almost always found combined with the lanthanides in rare earth minerals and is never found in nature as a free element.", "symbol"=>"Y", "xpos"=>3, "ypos"=>5, "shells"=>[2, 8, 18, 9, 2], "electron_configuration"=>"1s2 2s2 2p6 3s2 3p6 3d10 4s2 4p6 4d1 5s2", "electron_affinity"=>29.6, "electronegativity_pauling"=>1.22, "ionization_energies"=>[600, 1180, 1980, 5847, 7430, 8970, 11190, 12450, 14110, 18400, 19900, 36090]}


