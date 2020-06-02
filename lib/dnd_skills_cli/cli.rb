class Cli

    def run
        welcome
        Api.get_skills
        main
    end

    def welcome
        puts 'Welcome to the D&D 5e Skill Selector CLI!'
    end

    def main
        print_all
        print_selection_prompt
        index = valid_index?(prompt_selection)
        updated_skill = get_skills_details(index)
        print_details(updated_skill)
        print_continue
        continue?(prompt_selection)
    end

    def print_all
        DndSkills.all.each_with_index {|s, index| puts "#{index +=1}. #{s.name}"}
    end

    def print_selection_prompt
        puts 'Please enter a skill to learn more about it.'
    end

    def prompt_selection
        gets.chomp
    end

    def valid_index?(index)
        index = index.to_i
        if index < 1 || index > DndSkills.all.size
            print_error
            main
        end
        index
    end

    def print_error
        puts 'Response is not valid. Please try again.'
    end

    def get_skills_details(index)
        name = DndSkills.all[index -=1].name
        selected_skill = DndSkills.find_by_name(name)
        Api.get_skills_details(name) unless selected_skill.has_details?
        selected_skill
    end

    def print_details(skill)
        puts 'Name: ' + skill.name
        puts 'Details: ' + skill.details.join 
    end

    def print_continue
        puts 'Do you want to explore another skill? (y/n)'
    end

    def continue?(response)
        if response == 'y' 
            main
        else
            print_goodbye
            exit
        end
    end

    def print_goodbye
        puts "Thanks for visiting the D&D 5e Skill Selector!"
    end

end
