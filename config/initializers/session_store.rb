# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rwp_session',
  :secret      => '9ff1ac0024367195cbd3551c88b3e26b6dfb093b7c1b4b5326ae18ee5cf8e3c8f011c73912141325a0748dacdfd5cd2f7c9cd9b20dc0d3353012562f120618a8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
