require 'rails_helper' #loads up the rails app
#rails_helper will automatically load all of the tests
#if you're not testing rails then don't require this because things will run faster

feature 'top level feature- User views players' do
  #feature + scenario = full sentence
  scenario 'on the front page' do
    players = create_list(:player, 3)

    visit root_path # 'visit' is a Capybara method! #visit is the equivalent of the user typing the url into the address bar NOT navigating links that redirect thru the site

    #Capybara will take a snapshot and open it in a real browser
    #This is a debugging tool, like binding.pry so remove before shipping
    save_and_open_page

    players.each do |p|
      #.player is a css selector named .player
      within('.player', text: p.name) do #within block matches the elemen and the options that you give it
        #Capybara method- returns an rspec representation of the fake browser
        #have content will only look at the text on the page- not the styling. it searches for the string that we give it
        expect(page).to have_content p.job
        expect(page).to have_content p.health
        expect(page).to have_content p.magic

        #this could make debugging more explicit- but you cant have factory making random values
        # expect(page).to have_content 'Wizard'
        # expect(page).to have_content 50
        # expect(page).to have_content 100
        #page is the part of the page within the given element
      end
    end
  end

  scenario 'in alphabetical order' do
    create(:player, name: 'Lorelei')
    create(:player, name: 'Elina')
    create(:player, name: 'Fawna')

    visit root_path

    expect(page).to have_content(/Elina.*Fawna.*Lorelei/)
  end
end
