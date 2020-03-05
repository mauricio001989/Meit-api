shared_context 'logger user' do
  before do
    request.headers.merge!(
      'Authorization': "Bearer #{Knock::AuthToken.new(payload: { sub: user.id }).token}"
    )
  end
end
