class Api
    
    BASE_URL = 'http://www.dnd5eapi.co/api/skills/'

    def self.get_skills
        res = RestClient.get(BASE_URL)
        data = JSON.parse(res.body)
        data['results'].each do |skill|
            name =  skill['name']
            DndSkills.new(name)
        end
    end

    def self.get_skills_details(name)
        selected_skill = DndSkills.find_by_name(name)
        res = RestClient.get("#{BASE_URL}#{name.downcase.gsub(" ", "-")}")
        data = JSON.parse(res.body)
        details = data['desc']
        selected_skill.update(details)
    end
end