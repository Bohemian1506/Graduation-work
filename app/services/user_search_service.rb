class UserSearchService
  attr_reader :params

  # 空のハッシュを作成し、引数がない（not nil）場合でもエラーにならないようにする。
  def initialize(params = {})
    @params = params
  end

  def search
    if keyword_search?
      perform_keyword_search
    else
      perform_regular_search
    end
  end

  def result
    search.result(distinct: true)
  end

  private

  def keyword_search?
    params[:q] && params[:q][:username_cont].present?
  end

  def keyword
    params[:q][:username_cont]
  end

  def perform_keyword_search
    User.ransack(
      username_cont: keyword,
      email_cont: keyword,
      m: "or"
    )
  end

  def perform_regular_search
    User.ransack(params[:q])
  end
end