# 教學綱要（中文）

## Python在大氣和海洋科學上的應用 
**國立台灣大學大氣科學系 蔡元懷**  
**時間** 2022/1/18, 25 (Tue.)   
**地點** 台大大氣C309教室

### 教學目標
1. 認識以xarray為主的PyAOS工具的基本指令。
2. 熟練用xarray套件讀取netCDF檔案、分析資料及繪圖。 
3. 將PyAOS套件應用至氣象資料分析及研究工作。

### 教學內容
PyAOS (Python for Atmosphere and Ocean Science) 是一套高階的Python程式套件集，針對大氣和海洋科學的需求而發展出的，用以方便使用者分析netCDF檔案 (或多維度資料)，產出分析結果。本工作坊將以氣候分析方法為導向，介紹如何以PyAOS的套件讀取資料檔、分析資料 (計算氣候平均、距平、統計計算)、繪製結果，特以xarray為主軸，採取講解和實作並重，希望工作坊後能夠容易地使用PyAOS套件工具，最後能應用在研究工作上。
預定的單元如下 (得依實際情況彈性調整之)：

**2022/1/18 (Tue.) 15:30-17:20**

1. 導論：環境設置與檢查 / 什麼是PyAOS？/ 氣候分析的分析流程。 
2. 利用xarray讀取NetCDF資料。(25 mins).
3. xarray繪圖 (I)：繪製2017/12月區域平均OLR。(35 mins).
4. `datetime`物件與時間條件控制。 (10 mins).
5. 手動創建DataArray。
6. 計算氣候場與距平值－月氣候場與距平值 (30 mins). 

**2022/1/25 (Tue.) 10:20-12:10**

1. 計算氣候場與距平值－日氣候場與距平值  (15 mins).
2. 進階運算和統計方法：利用xarray做網格內插、平均與滑動平均、相關係數；利用SciPy/MetPy做進階氣象計算：渦度、散度、流函數和速度位 (30 mins).
3.  xarray繪圖 (II)：1D資料繪圖 (15 mins).
4.  xarray繪圖 (III)：2D資料繪圖——全球地圖 / 其他投影 / Hovmöller Diagram / 疊圖 / 繪製風場和流線場 / 多格子圖 (50 mins)。

**Other Topics on PyAOS (TBD)**

1.  `pandas`和`seaborn`：統計圖表繪製。
2.  Climate Data Operator (CDO)。
3.  優化作業流程：Dask。

### 評量方法
請完成指定習題 (共2次)，將結果的圖以及程式碼上傳到Google Classroom網站。  

### 參考書目及網站
* 課程講義：http://homepage.ntu.edu.tw/~wyhtsai/. 
* PyAOS官方網站：https://pyaos.github.io. 
* xarray官方網站：https://xarray.pydata.org/en/stable/.
* pandas官方網站：https://pandas.pydata.org.
* cartopy官方網站：https://scitools.org.uk/cartopy/docs/latest/.
* Dask官方網站：https://dask.org。
* Esmaili, R. B., 2021: Earth Observation using Python: A Practical Programming Guide. American Geophysical Union, 304 p.p., ISBN: 978-1-119-60688-8. 

### 事前預備
* 請自備電腦！
* 如果使用LCCS實驗室主機，請使用ssh://140.112.67.64預設的conda環境Mt。本工作坊會使用到的資料放在/data3/USERS/waynetsai/pyaos_wks_samples/。若使用自己的筆電運算，請從Google drive下載範例資料檔：https://drive.google.com/drive/folders/1UgiGbOVEf2Ba9771nbmr1sc6eXhbnijaQSGMuxLiW7vy5LCogqce52Sl-CTjPgmUUmOAcSIY?usp=sharing. 
* 如果在自己的筆電進行運算，請按照「[電腦環境設置與Python安裝](http://homepage.ntu.edu.tw/~wyhtsai/00_setup.html)」單元設置Python運算環境。
* 如果對Python的基本指令不熟悉，建議先閱讀 https://kopu.chat/2017/01/18/一小時python入門-part-1/。(非必需) 


**Acknowledgement:** The logo of the PyAOS workshop was designed and provided by Mr. Sianyun Wang.