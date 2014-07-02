require 'rails_helper'

feature 'User creates a player' do
  scenario 'successfully' do
    visit root_path #this is part of the setup in this scenario

    #must use the exact same case of the letters you'll see in the test and on the page
    click_link 'Add Player' #if using an image, use its title attribute
    fill_in 'Name', with: 'Mike' #textual free form text fill in fields only. The first arg is the label (Name in this case)
    select 'Wizard', from: 'Job' #this is the opposite order from fill_in
    #choose 'Wizard' (if using a radio button)
    #check 'Wizard' (for checkboxes)
    fill_in 'Health', with: '60'
    fill_in 'Magic', with: '140'

    save_and_open_page
    click_button 'Create Player'
    #click_on is agnostic to whether it's a link or a button

    expect(page).to have_content 'Mike'
    expect(page).to have_content 'Wizard'
    expect(page).to have_content '60'
    expect(page).to have_content '140'

    #level of specificity is unnecessary unless you think you're doing to screw something up to this granularity level
    # within('.player', text: 'Mike') do
    #   expect(page).to have_css '.name', text: 'Mike'
    #   expect(page).to have_css '.name', text: 'Wizard'
    #   expect(page).to have_css '.name', text: '60'
    #   expect(page).to have_css '.name', text: '140'
    # end

  end
end
