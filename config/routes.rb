Rails.application.routes.draw do
  root 'questions#index'
  resources 'users'
  resources 'sessions'

  resources 'questions' do
    resources 'answers'
    resources 'comments'
    resources 'votes'
  end

  resources 'answers' do
    resources 'comments'
    resources 'votes'
  end

  resources 'comments' do
    resources 'votes'
  end
end
