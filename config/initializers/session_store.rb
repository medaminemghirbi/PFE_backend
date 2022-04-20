Rails.application.config.session_store :cookie_store, key: '_authentication_app', 
:expire_after => 2.minutes , domain: 'your-production-app-here.com'

