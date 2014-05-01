#蚊子館地圖 App 
###g0v 7th Hackton

* Jason Ling 和 Ｗin Wu 幫忙產出 iphone app 


##進度log
###3/27
* 待補

###4/30
* 安裝 CocoaPods 並且使用 AFNetworking
* 在 ListViewController 加入 tableView，並且在 xib 拖曳 TableView 到 Files owner，產生 delegate
* 把 tableview 拖到 .m，產生 `@property (weak, nonatomic) IBOutlet UITableView *locationTableView`
* 把一切檔案搬移到正確的目錄下
* 產生 assets 與 manager 資料夾，並且 add Files...，manager 資料夾通常用來放後端的 class，asset 資料夾則是放靜態檔案，像 data.json 或是圖片。
* 在 ListViewController.h 增加 tableView 會用到的兩個協議。
* 在 ListViewController.m 增加假 array，並且實作 numberOfRowsInSection, cellForRowAtIndexPath 把資料塞到 tabelcell。
* 學會使用 `#pragma mark - 標記名稱`
* 建立 AppManager class，作為 api manager，要資料的方法之後都透過 AppManager。
* 在 AppManager 產生兩種要資料的方法，一種是同步，一種非同步。
* ListViewController.m import AppManager，

* 參考
	* http://www.raywenderlich.com/46988/ios-design-patterns
	* http://www.raywenderlich.com/59255/afnetworking-2-0-tutorial
	* http://popcornylu.blogspot.tw/2011/08/objective-c-block.html
	* http://stackoverflow.com/questions/12693197/dispatch-get-global-queue-vs-dispatch-get-main-queue
	* http://pro.ctlok.com/2010/07/objective-c-singleton-pattern.html

* 在 AppManager 寫 getJsonItems，要 local 的假資料
* 在 AppManager 寫 getItemsAsync，注意前景與背景的資料處理，前景關於 view 的 render，背景為非同步要資料。
* 修正 tableview 的高度，tabbar = yes, view 設定 constrain。`self.edgesForExtendedLayout=UIRectEdgeNone;`。
	
	
	



