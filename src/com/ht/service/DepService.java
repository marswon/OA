package com.ht.service;

import java.util.List;

import com.ht.bean.Dep;
import com.ht.bean.Dstatus;
import com.ht.bean.User;
import com.ht.common.Pager;
import com.ht.dao.BaseDao;

public interface DepService extends BaseDao<Dep, Integer> {
	
	public Pager<Dep> queryByName(Pager<Dep> pager,String name);
	
	public List<Dstatus> queryDstatus();
	
	public Pager<Dep> queryAlln(Pager<Dep> pager);
	
	public Dep addn(Dep d);
	
	public void addUser(User user);

	public Pager<Dep> bmQuery(Pager<Dep> pager, String czbmyg);

	public Pager<Dep> NameQuery(Pager<Dep> pager, String czygxm);

}
