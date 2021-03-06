<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller 
{
	// 存储Model对象
	protected $User;

	public function _initialize()
	{
		$this->User = D('user');
		$this->Log = D('Log');
	}

	// 加载登录页及登录处理
    public function index()
    {
    	if(IS_POST)
    	{
	    	$verifyCode = I('post.code');
			
			// 对数据去空白处理
			$verifyCode = trim($verifyCode);

	    	//验证输入的验证码
	    	if(empty($verifyCode)){
	    		$map = "验证码不能为空！";
	    		$this->assign("map",$map);
	    		$this->display();
	    		exit();
	    	}
	    	$verify = new \Think\Verify();    
			$bool = $verify->check($verifyCode);
			if(!$bool){
				$map = "验证码错误！";
				$this->assign("map",$map);
				$this->display();
				exit();
			}

			$userName = I('post.username');
	    	// 对数据去空白处理
	    	$userName = trim($userName);
	    	if(empty($userName)){
	    		$map = '账号不能为空！';
	    		$this->assign("map",$map);
	    		$this->display();
	    		exit();
	    	}
			$bool = $this->User->existUserName($userName);
	    	if(!$bool)
	    	{
	    		$map = '用户名不存在！';
	    		$this->assign("map",$map);
	    		$this->display();
	    		exit();
	    	}

	    	$userPwd = I('post.password');
	    	// 对数据去空白处理
			$userPwd = trim($userPwd);
			if(empty($userPwd))
			{
				$map = "密码不能为空！";
				$this->assign("map",$map);
				$this->display();
				exit();
			}

			// 判断密码是否正确
			$bool = $this->User->isTruePassword($userName,$userPwd);
    		if(!$bool)
    		{
    			$map = "密码错误！";
    			$this->assign("map",$map);
    			$this->display();
    			exit();
    		}

    		// 判断用户被允许登录
    		$bool = $this->User->userStatus($userName,$userPwd);
    		if(!$bool)
    		{
    			$map = '该账号禁止登录！';
    			$this->assign("map",$bool);
    			$this->display();
    			exit();
    		}

    		// 判断用户是否已登录
    		// $bool = $this->User->isOnline($userName,$userPwd);
    		// if(!$bool)
    		// {
     	// 		$map = '该账号已登录！';
    		// 	$this->assign("map",$map);
    		// 	$this->display();
    		// 	exit();   			
    		// }

    		// $aff = $this->User->changeOnlineStatus($userName,$userPwd);
    		// if(!$aff)
    		// {
    		// 	$map = "更改用户在线状态失败！";
    		// 	$this->assign("map",$map);
    		// 	$this->display();
    		// 	exit();  			
    		// }

    		$data['logintime'] = time();
    		$data['ip'] = getIP();
    		$data['content'] = '登陆成功';
    		$data['visitor'] = $userName;
    		$aff = $this->Log->addLog($data);
    		if(!$aff)
    		{
 				$map = "日志添加失败！";
    			$this->assign("map",$map);
    			$this->display();
    			exit();   			
    		}
    		session("mt_username",$userName);
    		$this->redirect("Index/index");
    	}
        $this->display();
    }

    // 验证码
    public function showCode()
    {
    	$config = array(    
		        'fontSize'    =>    20,    // 验证码字体大小    
		    	'length'      =>    4,     // 验证码位数    
		        'useNoise'    =>    false, // 关闭验证码杂点
		      	'imageW'      =>    140,
		       	'imageH'      =>    40,
	         	'fontttf' 	  => 	'5.ttf' 
	        	);
	    $V = new \Think\Verify($config);
		$V->entry();
    }
}