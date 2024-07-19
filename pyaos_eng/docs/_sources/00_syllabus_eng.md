# Syllabus

## Python for Atmosphere and Ocean Science (PyAOS)  
**Wayne Yuan-Huai Tsai, School of Meteorology,**   
**University of Oklahoma, Norman, OK, U.S.A.**  
**Time:** 2022/1/18, 25 (Tue.)   
**Place:** Rm. C309

### Course Objectives
1. Participants can understand the fundamental methods and functions in PyAOS libraries.  
2. Participants can be familiar with reading netCDF files, analysis and plotting methods using xarray. 
3. Participants can apply PyAOS libraries to climate analysis and atmospheric studies. 

### Course Outline
PyAOS is a suite of high-level Python libraries developed to meet the needs of atmospheric and oceanic scientists. These libraries are designed to analyze and visualize high-dimensional data with easy steps. The workshop introduces how to read netCDF files, analyze data, and plot results using PyAOS libraries especially xarray with detailed explanations and hands-on practice on various examples and exercises. Most of all, the course materials and examples are based on real-world data and the frequently-used methods of climate analysis strategies (e.g., climatology and anomaly fields, and some simple statistics). The participants will be familiar with the PyAOS tools and eventually apply them to further studies. 

The tentative schedule and outline are as follows:

**2022/1/18 (Tue.) 15:30-17:20**

1. Introduction: environment setup / What is PyAOS / The procedures and strategies in climate studies (15 mins).
2. Reading NetCDF files (25 mins).
3. xarray Plotting (I): plot the monthly mean OLR in December 2017 (40 mins).
4. datetime object and datetime conditional control (10 mins).
5. Manually creation of DataArray. *(If time permitted)*
6. Calculate monthly climatology and anomaly (30 mins).

**2022/1/25 (Tue.) 10:20-12:10**

7. Advanced calculations and analysis methods: regridding, correlation coefficients, vorticity, divergence. (30 mins).
8. xarray plotting (II): 1-D data (15 mins).
9. xarray plotting (III): n-D data - global map, maps with various projection methods, Hovmöller diagrams, contour plots, quiver plots, streamline, FacetGrid objects, etc. (50 mins)。

**Other Topics on PyAOS (TBD)**

10.  `pandas` and `seaborn`: visualization of statistical results.
11.  Climate Data Operator (CDO).
12.  Large Datasets Processing.

### Evaluation 
Two assignments (upload the results and the code to Google Classroom).

### References
* Handout：https://wyhtsai.github.io/pyaos_eng/docs/index.html.  
* PyAOS official website：https://pyaos.github.io. 
* xarray official website：https://xarray.pydata.org/en/stable/.
* pandas official website：https://pandas.pydata.org.
* cartopy official website：https://scitools.org.uk/cartopy/docs/latest/.
* Dask official website：https://dask.org。
* Esmaili, R. B., 2021: Earth Observation using Python: A Practical Programming Guide. American Geophysical Union, 304 p.p., ISBN: 978-1-119-60688-8. 

### Prerequisite
* The tutorial will be based on a Linux or a MacOS system. Please set up the Python environment (See the unit "Python Environment Setup") and practice on the remote Linux server or on your personal Mac. 
* Please download sample data files from Google Drive beforehand: https://drive.google.com/drive/folders/1UgiGbOVEf2Ba9771nbmr1sc6eXhbnijaQSGMuxLiW7vy5LCogqce52Sl-CTjPgmUUmOAcSIY?usp=sharing. 

**Acknowledgement:** The logo of the PyAOS workshop was designed and provided by Mr. Sianyun Wang.