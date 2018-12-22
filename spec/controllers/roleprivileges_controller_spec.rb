require 'rails_helper'

RSpec.describe RoleprivilegesController, type: :controller do

  describe 'POST create' do

    context 'with valid attributes' do

      before(:each) do
        @role = FactoryBot.create(:role)
        @priv1 = FactoryBot.create(:privilege)
        @priv2 = FactoryBot.create(:privilege)
      end

      let(:valid_attributes) do
        {
          idRole: @role.id,
          privilege: [@priv1, @priv2]
        }
      end

      before(:each) do
        post(
          :create,
          params: valid_attributes
        )
      end

      it 'creates a new record' do
        expect(assigns(:rolePrivilege)).to be_persisted
      end

      it 'saves an instance of role and assigns to role variable' do
        expect(assigns(:rolePrivilege)).to be_a(Roleprivilege)
      end

      it 'saves the given values' do
        # compare if the record saved is the same that valid attributes
        expect(assigns(:rolePrivilege).role_id).to eq(valid_attributes[:idRole])
      end

      it 'returns an http success code' do
        expect(response).to have_http_status(302)
      end

      it 'must display a success message' do
        expect(flash[:success]).to match("Privilegio(s) añadidos!")
        expect(flash[:success]).to be_present
      end
    end

  end

  describe "DELETE destroy" do

    before(:each) do
      @role_privilege = FactoryBot.create(:roleprivilege)
    end

    context 'when user has permissions' do

      it "destroys the requested user" do
        expect do
          delete :destroy, params: {:idRole => @role_privilege.role_id, :idPrivilege => @role_privilege.privilege_id}
        end.to change(Roleprivilege, :count).by(-1)
      end

      it "must not redirect to the users index" do
        delete :destroy, params: {:idRole => @role_privilege.role_id, :idPrivilege => @role_privilege.privilege_id}
        expect(response).not_to redirect_to(roles_url)
      end

      it 'must not display a success message' do
        delete :destroy, params: {:idRole => @role_privilege.role_id, :idPrivilege => @role_privilege.privilege_id}
        expect(flash[:success]).not_to be_present
      end
    end

    context 'when user has not permissions' do
      it 'show unauthorized message'
    end
  end
end
