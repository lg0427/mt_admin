<?php
namespace Admin\Model;
use Think\Model;
class UserModel extends Model
{
	// 获取用户列表
	public function getUserlist()
	{
		$arr = array('id','username','telephone','email','grade','status','addtime');
		$userList = $this->field($arr)->select();
		return $userList;
	}

	// 单独获取一个用户的信息
	public function getOneuserinfo($data)
	{
		$arr = array('id','username','password','telephone','email','grade','des');
		$adminList = $this->field($arr)->where($data)->find();
		$adminList['password'] = substr($adminList['password'],0,8);
		return $adminList;
	}

	// 添加用户
	public function addUser($data)
	{
		return $this->add($data) ? true : false;
	}

	// 删除用户
	public function deleteUser($data)
	{
		$aff = $this->where($data)->delete();
		return $aff;
	}

	// 修改用户
	public function saveUser($id,$data)
	{
		$aff = $this->where('id='.$id)->save($data);
		return $aff;
	}

	// 修改用户状态
	public function upStatus($id)
	{
		$res = $this->field('status')->where('id='.$id)->find();
		if($res['status'] == 1){
			$data['status'] = -99;
		}else{
			$data['status'] = 1;
		}
		$aff = $this->where('id='.$id)->save($data);
		return $aff;
	}
	// 验证密码是否改动
	public function checkPassword($id,$password)
	{
		$pass = $this->field("password")->where("id=".$id)->find();
		$pass1 = substr($pass['password'],0,8);
		return $pass1 == $password ? $pass['password'] : false;
	}

	// 登录验证用户名是否存在
	public function existUserName($username)
	{
		$data['username'] = $username;
		$count = $this->where($data)->count("id");
		return $count == 1 ? true : false;
	}

	// 登录验证用户密码是否正确
	public function isTruePassword($username,$userpassword)
	{
		$data['username'] = $username;
		$password = $this->field("password")->where($data)->find();
		$data['password'] = md5($userpassword);
		$count = $this->where($data)->count("id");
		if($data['password'] == $password['password'] && $count ==1)
		{
			return true;
		}else{
			return false;
		}
	}

	// 登录验证用户的状态
	public function userStatus($username,$userpassword)
	{
		$data['username'] = $username;
		$data['password'] = md5($userpassword);
		$status = $this->field("status")->where($data)->find();
		return $status['status'] == 1 ? true : false;
	}

	// 登录验证用户是否在线
	public function isOnline($username,$userpassword)
	{
		$data['username'] = $username;
		$data['password'] = md5($userpassword);
		$status = $this->field("online")->where($data)->find();
		if($status['online'] == -1)
		{
			return true;
		}else{
			return false;
		}
	}

	public function getUserbaseinfo($username,$userpassword)
	{
		$data['username'] = $username;
		$data['password'] = md5($userpassword);
		$userinfo = $this->field("grade")->where($data)->find();
		return $userinfo;
	}

	// 改变用户在线状态
	public function changeOnlineStatus($username)
	{
		$data['username'] = $username;
		$onlineStatus = $this->field("online")->where($data)->find();
		if($onlineStatus['online'] == -1){
			$map['online'] = 1;
			$aff = $this->where($data)->save($map);
			return $aff;
		}else{
			$map['online'] = -1;
			$aff = $this->where($data)->save($map);
			return $aff;
		}
	}

	// 获取登录用户等级
	public function getGrade($username)
	{
		$data['username'] = $username;
		$gradeID = $this->field("grade")->where($data)->find();
		if(!$gradeID['grade'])
		{
			return false;
		}
		$grade = M("grade")->field("grade")->where("id=".$gradeID['grade'])->find();
		return $grade['grade'] ? $grade['grade'] : false;
	}
}