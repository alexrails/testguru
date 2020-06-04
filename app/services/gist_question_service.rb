class GistQuestionService

  def initialize(question, client: github_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def github_client
    Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  end

  def gist_params
    {
      description: I18n.t('services.gist_params.description', title: @test.title ),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    @content = [@question.body]
    @content += @question.answers.pluck(:body)
    @content.join("\n")
  end

end
