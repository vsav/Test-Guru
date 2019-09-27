class GistQuestionService
  def initialize(question)
    @question = question
    @test = @question.test
    @client = set_http_client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def set_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
