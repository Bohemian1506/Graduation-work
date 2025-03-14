import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["source"]


  copy(event) {
    // コピー処理を実装
    console.log("コピーメソッドが呼び出されました")

    // 実際のコピー処理を追加
    const text = this.sourceTarget.value

    if (!text) {
      console.error("コピーするテキストが空です")
      return
    }

    navigator.clipboard.writeText(text).then(() => {
      console.log('テキストがクリップボードにコピーされました')
    }).catch(err => {
      console.error('コピーに失敗しました', err)
    })
  }
}
