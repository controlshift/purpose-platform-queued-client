module PurposePlatformQueuedClient
  class Action < Base
    # guard: Bot prevention! You must pass a blank string for this field
    # hp_enabled: Bot prevention! You must pass a checked checkbox for this field. Note the checkbox should be hidden from the user.
    # hp_disabled: Bot prevention! You must not pass this field, or pass an unchecked checkbox, which should be hidden from the user.
    # member[first_name]: (String) The first name (or full name) of the user. Since many forms don't collect last name as a separate field, you can put the whole thing in this one.
    # member[last_name]: (String) Last name of user
    # member[email]: (String) Email address
    # member[street_address]: (String) Street address of user
    # member[postcode]: (String) Zip / Post code of user
    # member[country]: (String, limit 2 characters) Two character ISO code for country.
    # tag: (String) The slug name (eg. "save-the-whales') for the campaign.
    # org: (String) MUST BE "fftf"

    def default_params
      {
        guard: '',
        hp_enabled: '1',
        hp_disabled: '0'
      }
    end

    def base_path
    	'action'
    end

    def create(params)
      params = params.merge(default_params)
      super(params)
    end
  end
end