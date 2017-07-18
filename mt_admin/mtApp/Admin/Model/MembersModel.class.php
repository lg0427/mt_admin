<?php
namespace Admin\Model;
use Think\Model;
class MembersModel extends Model
{
	public function getMenbersList()
	{
		$field = array("auto_id","wx_nickname","wx_openid","wx_city","subscribe_time","recent_time","members_status");
		$list = $this->field($field)->where("members_status != -99")->select();
		return $list;
	}

	public function getOneMemberInfo($id)
	{
		$field = array("wx_nickname","wx_headimgurl","wx_sex","wx_city","subscribe_time","res1");
		$where['wx_openid'] = $id;
		$list = $this->field($field)->where($where)->find();
		$res = M("members_sex")->field("sex_name")->where("sex_code=".$list['wx_sex'])->find();
		$list['wx_sex'] = $res['sex_name'];
		return $list;
	}

	public function editMemberInfo($id)
	{
		$field = array("wx_nickname","wx_headimgurl","wx_sex","wx_city","subscribe_time","res1");
		$where['auto_id'] = $id;
		$list = $this->field($field)->where($where)->find();
		return $list;
	}

	// 编辑会员信息
	public function saveMember($id,$data)
	{
		$where['auto_id'] = $id;
		$aff = $this->where($where)->save($data);
		return $aff;
	}

	// 删除会员
	public function deleteMember($id)
	{
		$where['auto_id'] = $id;
		$data['members_status'] = -99;
		$data['delete_time'] = time();
		$aff = $this->where($where)->save($data);
		return $aff;
	}

	public function changeMemberStatus($id)
	{
		$where['auto_id'] = $id;
		$status = $this->field("members_status")->where($where)->find();
		if($status['members_status'] == 1){
			$data['members_status'] = -1;
		}elseif($status['members_status'] == -1){
			$data['members_status'] = 1;
		}elseif($status['members_status'] == -99){
			$data['members_status'] = -1;
			$data['restore_time'] = time();
		}
		$aff = $this->where($where)->save($data);
		return $aff;
	}

	// 获取被删除的会员列表
	public function getDeletedMembers()
	{
		$where['members_status'] = -99;
		$field = array("auto_id","wx_nickname","wx_openid","wx_city","subscribe_time","members_status");
		$list = $this->field($field)->where($where)->select();
		return $list;
	}

	public function searchAllMembers($data)
	{
		// $where['members_status'] = -99;
		$where = $data['_string'].' AND members_status = -99';
		$field = array("auto_id","wx_nickname","wx_openid","wx_city","subscribe_time","members_status");
		$list = $this->field($field)->where($where)->select();
		// dump($where);
		return $list;
	}
}