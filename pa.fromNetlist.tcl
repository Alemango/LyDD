
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name prac6JJAE -dir "/home/ise/Desktop/prac5JJAE/prac6JJAE/planAhead_run_3" -part xc6slx9csg225-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/Desktop/prac5JJAE/prac6JJAE/Principal.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/Desktop/prac5JJAE/prac6JJAE} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Principal.ucf" [current_fileset -constrset]
add_files [list {Principal.ucf}] -fileset [get_property constrset [current_run]]
link_design
