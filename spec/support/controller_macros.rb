module ControllerMacros
    def sign_in_user(user)
      allow(controller).to receive(:sign_in)
      allow(controller).to receive(:current_user).and_return(user)
    end
  end