{
  "ignored_warnings": [
    {
      "warning_type": "Dynamic Render Path",
      "warning_code": 15,
      "fingerprint": "b10b3aae448330e02f291c2fb29dc9bf6775499194f1581f15ec5220e1c528ad",
      "check_name": "Render",
      "message": "Render path contains parameter value",
      "file": "app/views/events/index.html.erb",
      "line": 16,
      "link": "https://brakemanscanner.org/docs/warning_types/dynamic_render_path/",
      "code": "render(action => EventSearchService.new(params).result.page(sanitize_page_param(params[:page])), {})",
      "render_path": [
        {
          "type": "controller",
          "class": "EventsController",
          "method": "index",
          "line": 13,
          "file": "app/controllers/events_controller.rb",
          "rendered": {
            "name": "events/index",
            "file": "app/views/events/index.html.erb"
          }
        }
      ],
      "location": {
        "type": "template",
        "template": "events/index"
      },
      "user_input": "params[:page]",
      "confidence": "Weak",
      "cwe_id": [
        22
      ],
      "note": "偽陽性: sanitize_page_param メソッドによりページネーションパラメータは安全に処理されており、セキュリティ上の問題はありません。"
    }
  ],
  "brakeman_version": "7.0.2"
}
