#Store the enbiornment vairables on the Rails.configuration object
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key: ENV['STRIP_SECRET_KEY']
}

#Set put app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]