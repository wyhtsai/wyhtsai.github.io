# 教學綱要（中文）

## Python在大氣和海洋科學上的應用 
**國立台灣大學大氣科學系 蔡元懷**  

### 教學目標
1. 認識以xarray為主的PyAOS工具的基本指令。
2. 熟練用xarray套件讀取netCDF檔案、分析資料及繪圖。 
3. 將PyAOS套件應用至氣象資料分析及研究工作。

### 教學內容
PyAOS (Python for Atmosphere and Ocean Science) 是一套高階的Python程式套件集，針對大氣和海洋科學的需求而發展出的，用以方便使用者分析netCDF檔案 (或多維度資料)，產出分析結果。本工作坊將以氣候分析方法為導向，介紹如何以PyAOS的套件讀取資料檔、分析資料 (計算氣候平均、距平、統計計算)、繪製結果，特以xarray為主軸，採取講解和實作並重，希望工作坊後能夠容易地使用PyAOS套件工具，最後能應用在研究工作上。
預定的單元如下 (得依實際情況彈性調整之)：

**xarray基本原理與操作**

1. 導論：環境設置與檢查 / 什麼是PyAOS？/ 氣候分析的分析流程。 
2. NetCDF資料格式簡介/大氣與海洋科學資料從哪裡來？利用xarray讀取NetCDF資料。
3. xarray繪圖 (I)：繪製2017/12月區域平均OLR、將DataArray儲存為netCDF檔案。
4. `datetime`物件與時間條件控制。
5. 手動創建DataArray。

**氣候分析方法基礎**

6. 計算氣候場與距平值。
7. 進階運算和統計方法：利用xarray做網格內插、平均與滑動平均、相關係數；利用SciPy/MetPy做進階氣象計算：渦度、散度、流函數和速度位 。

**xarray繪圖**

8.  xarray繪圖 (II)：1D資料繪圖 (20 mins).  
9.  xarray繪圖 (III)：2D資料繪圖——全球地圖 / 其他投影 / Hovmöller Diagram / 疊圖 / 繪製風場和流線場 / 多格子圖 (60 mins)。
10.  `pandas`和`seaborn`：統計圖表繪製。(如果有時間的話)

**其他重要議題**

11.  Climate Data Operator (CDO)。
12.  大型資料處理。

### 評量方法
請完成指定習題 (共1次)，將結果的圖以及程式碼上傳到Moodle學習平台。  

### 參考書目及網站
* 課程講義：https://wyhtsai.github.io/pyaos-wks/docs/index.html. 
* PyAOS官方網站：https://pyaos.github.io. 
* xarray官方網站：https://xarray.pydata.org/en/stable/.
* pandas官方網站：https://pandas.pydata.org.
* seaborn官方網站：https://seaborn.pydata.org/index.html.
* Dask官方網站：https://dask.org。
* Abernathey, R., K. Key, T. Crone, and J Busecke, 2021: An Introduction to Earth and Environmental Data Science. https://earth-env-data-science.github.io/intro.html 
* Esmaili, R. B., 2021: Earth Observation using Python: A Practical Programming Guide. American Geophysical Union, 304 p.p., ISBN: 978-1-119-60688-8. 
* Lin, J. W., H. Aizenman, E. M. C. Espinel, K. Gunnerson, J. Liu, 2022: An Introduction to Python Programming for Scientists and Engineers. Cambridge University Press, 766 p.p. doi: [10.1017/9781108571531](https://doi.org/10.1017/9781108571531).

### 事前預備
* 請自備電腦！
* 請從Google drive下載範例資料檔：https://drive.google.com/drive/folders/1AN1rceRcSnkaLynABpmTkIHUANGE5sTe?usp=share_link. 
* 請於課堂開始前，按照「[電腦環境設置與Python安裝](http://homepage.ntu.edu.tw/~wyhtsai/00_setup.html)」單元設置Python運算環境。
* 如果對Python的基本指令不熟悉，建議先閱讀 https://kopu.chat/2017/01/18/一小時python入門-part-1/。(非必需) 


**Acknowledgement:** The logo of the PyAOS workshop was designed and provided by Mr. Sianyun Wang.