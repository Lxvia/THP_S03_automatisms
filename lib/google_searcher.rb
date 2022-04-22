require 'launchy'

def check_if_user_gave_input
    abort("Merci d'entrer une recherche.") if ARGV.empty?
end

def get_research_url
    return research = "https://www.google.com/search?q="+ARGV.join("+")
end

def open_url(url)
    Launchy.open(url)
end

def perform
    check_if_user_gave_input
    open_url(get_research_url)
end

perform