module BanktoolsBR
  module Banks
    module BB
      class Account < BanktoolsBR::Banks::Account
        private

        # Sets the bank account length.
        #
        # @!visibility private
        # @return [Integer] the maximum bank account length
        def bank_account_length
          9
        end

        # Calculates the correct verification digit for account using mod 11
        #
        # @!visibility private
        # @return [String] the verification digit
        def correct_verification_digit
          digit_calculator = BanktoolsBR::Banks::DigitCalculator.new(bank_account_without_digit, [9, 8, 7, 6, 5, 4, 3, 2])
          digit = digit_calculator.mod(11)

          return 'X' if 10 == digit
          return '0' if 11 == digit

          digit.to_s
        end
      end
    end
  end
end
