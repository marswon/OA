package com.ht.dao;

import java.util.List;

import com.ht.bean.Money;
import com.ht.bean.Tuition;

public interface MoneyDao extends BaseDao<Money, Integer> {
	public List<Tuition> queryAllTuition();
	
	public void updateTuition(Tuition t);
}
