module BanktoolsBR
  class Account
    # Construct Account object
    #
    # @param [String] bank code according to BC
    # @param [String] bank agency number
    # @param [String] bank account number + verification digit
    # @return the object
    def initialize(bank_code, bank_agency, bank_account)
      @bank_code = bank_code
      @bank_agency = bank_agency
      @bank_account = bank_account
    end

    # Validates account verification digit based on bank code.
    #
    # @return [true, false]
    # @raise [BanktoolsBR::UnsupportedBank] if bank code is not supported.
    def valid?
      case @bank_code
      when '001'
        BanktoolsBR::Banks::BB::Account.new(@bank_agency, @bank_account).valid?
      when '033'
        BanktoolsBR::Banks::Santander::Account.new(@bank_agency, @bank_account).valid?
      when '041'
        BanktoolsBR::Banks::Banrisul::Account.new(@bank_agency, @bank_account).valid?
      when '104'
        BanktoolsBR::Banks::CaixaEconomica::Account.new(@bank_agency, @bank_account).valid?
      when '237'
        BanktoolsBR::Banks::Bradesco::Account.new(@bank_agency, @bank_account).valid?
      when '341'
        BanktoolsBR::Banks::Itau::Account.new(@bank_agency, @bank_account).valid?
      when '399'
        BanktoolsBR::Banks::HSBC::Account.new(@bank_agency, @bank_account).valid?
      when '745'
        BanktoolsBR::Banks::Citybank::Account.new(@bank_agency, @bank_account).valid?
      else
        raise BanktoolsBR::UnsupportedBank, "Bank: #{@bank_code} is not supported."
      end
    end
  end
end
