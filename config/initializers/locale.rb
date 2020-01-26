# Where the I18n library should search for translation files,
# including sub-folders
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

# Whitelist locales available for the application
I18n.available_locales = ['pt-BR']

# Set default locale to brazilian portuguese
I18n.default_locale = 'pt-BR'
