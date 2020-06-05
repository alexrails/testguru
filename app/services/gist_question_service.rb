class GistQuestionService

  def initialize(question, client: github_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    Result.new(response)
  end

  def success?
    @client.last_response.status == 201
  end

  def gist_url
    @client.last_response.data[:html_url]
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

class Result

  def initialize(gist)
    @gist = gist
  end

end
