require 'telegram/bot'

token = '5015073491:AAHlhCgOKLKAJtlM-44F94azuGM6PEtP5OI'

Telegram::Bot::Client.run(token) do |bot|
  bot.api.deleteWebhook

  bot.listen do |update|
    # Check if the update is a message
    if update.is_a?(Telegram::Bot::Types::Message) && update.text
      case update.text
      when '/start'
        bot.api.send_message(chat_id: update.chat.id, text: "Hello, #{update.from.first_name}!")
      else
        puts "Received: #{update.text} from #{update.from.first_name}"

        if update.text.include?('buy') || update.text.include?('btc')
            bot.api.send_message(chat_id: update.chat.id, text: "ted jdu koupit bitcoin")
        end

      end
    elsif update.is_a?(Telegram::Bot::Types::ChatMemberUpdated)
      puts "ChatMemberUpdated event detected"
    end
  end
end
