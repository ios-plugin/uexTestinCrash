##uexTestinCrash 插件接口文档
2015-04-22 初稿 by:刘康立


###1.init(param)//初始化
	
	var param{
		appKey;//应用的AppKey
		channel;//应用的渠道号
	}

	注：如果在项目中还引用了友盟、Takingdata 等同类产品，需要将它们的错误分析收集的功能取消。
	
###2.setUserInfo(param)//设置用户名
	var param{
		username;//用户名
	}
	
	注：如不设置，平台将默认显示为“匿名用户”。
	
###3.leaveBreadcrumb(param)//上传面包屑
	var param{
		breadcrumb;//面包屑字符串
	}