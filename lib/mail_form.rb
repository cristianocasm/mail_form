module MailForm
  # we could've used require "mail_form/base",
  # but we can lazy load constants with autoload.
  # Thus it will be loaded when first referenced
  autoload :Base, "mail_form/base"
end
