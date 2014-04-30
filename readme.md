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
* 在 AppManager 產生兩種藥資料的方法，一種是同步，一種非同步。
* ListViewController.m import AppManager，





