def check_if_user_gave_input
    abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
    return folder_name = ARGV.first
end

def create_folder(name)
    Dir.mkdir(name)

    system("cd #{name}")

    file = File.open("#{name}/Gemfile", "a")
    file.puts("source 'https://rubygems.org'\nruby '2.7.4'\ngem 'rubocop', '~> 0.57.2'\ngem 'rspec'\ngem 'pry'\ngem 'nokogiri'\ngem 'launchy'")
    file.close
    system("bundle install")

    

    system("cd #{name}; git init")



    file = File.open("#{name}/.gitignore", "a")
    file.puts("'.env'")
    file.close



    Dir.mkdir("#{name}/lib")



    system("cd #{name}; rspec --init")



    file = File.open("#{name}/Readme.mb", "a")
    file.puts("Ceci est un programme Ruby")
    file.close
end


def perform
    create_folder(get_folder_name)
    check_if_user_gave_input
end

perform