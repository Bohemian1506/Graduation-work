class EventSearchService
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
    params[:q] && params[:q][:title_cont].present?
  end

	# 検索ワードを受け取る
  def keyword
    params[:q][:title_cont]
  end

	# 受け取った検索ワードが各フィールドにないか検索し”or”で結合する
  def perform_keyword_search
    Event.ransack(
      title_cont: keyword,
      store_name_cont: keyword,
      location_cont: keyword,
      notes_cont: keyword,
      m: "or"
    )
  end

  def perform_regular_search
    Event.ransack(params[:q])
  end
end