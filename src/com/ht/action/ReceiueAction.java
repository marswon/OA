package com.ht.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.ht.bean.Dep;
import com.ht.bean.Receiue;
import com.ht.bean.Work;
import com.ht.common.Combox;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.service.ReceiueService;
import com.ht.service.WorkService;
import com.opensymphony.xwork2.ActionSupport;

public class ReceiueAction extends ActionSupport{
	
	private static final long serialVersionUID = 7920437671868838164L;

	private ControllerResult result;
	private ReceiueService receiueService;
	private WorkService workService;
	private Pager<Receiue> pager;
	private Receiue receiue;
	private List<Receiue> rows;
	private long total;
	private int page;
	private List<Dep> dep;
	private List<Work> work;
	

	public List<Work> getWork() {
		return work;
	}

	public void setWork(List<Work> work) {
		this.work = work;
	}

	public List<Dep> getDep() {
		return dep;
	}

	public void setDep(List<Dep> dep) {
		this.dep = dep;
	}

	public void setWorkService(WorkService workService) {
		this.workService = workService;
	}

	public void setReceiueService(ReceiueService receiueService) {
		this.receiueService = receiueService;
	}
	
	public Receiue getReceiue() {
		return receiue;
	}
	public void setReceiue(Receiue receiue) {
		this.receiue = receiue;
	}

	public long getTotal() {
		return total;
	}
	
	public List<Receiue> getRows() {
		return rows;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public ControllerResult getResult() {
		return result;
	}

	public String all(){
		return "all";
	}
	
	
	public String tjls() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		dep = receiueService.queryDeps();
		List<Combox> list  = new ArrayList<>();
		for (Dep dep : dep) {
			int eid = dep.getEid();
			String ename = dep.getEname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(eid));
			combox.setName(ename);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "tjls";
	}
	
	public String tjls2() throws IOException{
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpServletResponse resp = ServletActionContext.getResponse();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/json");
		PrintWriter out=resp.getWriter();
		work = receiueService.queryWorks();
		List<Combox> list  = new ArrayList<>();
		for (Work work : work) {
			int wid = work.getWid();
			String wname = work.getWname();
			Combox combox = new Combox();
			combox.setId(String.valueOf(wid));
			combox.setName(wname);
			list.add(combox);
		}
		out.write(JSON.toJSONString(list));
		out.close();
		return "all";
	}
	
	public String add(){
		Work work = new Work();
		work.setWid(receiue.getUwork());
		receiue.setWork(work);
		receiue.setRestore("借");
		work = workService.queryById(work.getWid());
		int w = work.getWcount();
		int re = Integer.valueOf(receiue.getUcount());
		if(w>=re){
			Receiue r = receiueService.add(receiue);
			int a = w-re;
			work.setWcount(a);
			work.setWid(receiue.getUwork());
			workService.update(work);
			if(r!=null){
				result = ControllerResult.getSuccessRequest("添加成功 ");
			}
		}else{
			result = ControllerResult.getFailResult("没有那么多数量了");
		}
		return SUCCESS;
	}
	
	public String delete(){
		receiueService.delete(receiue);
		result = ControllerResult.getSuccessRequest("删除成功");
		return SUCCESS;
	}
	public String count1(){
		 int count =  Integer.valueOf(ServletActionContext.getRequest().getParameter("ucount1"));
		 if(count > 0){
			HttpServletRequest req = ServletActionContext.getRequest();
			HttpSession session  = req.getSession();
			session.setAttribute("counts", count);
		 }
		 return SUCCESS;
	}
	public String update(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session  = req.getSession();	
		int ucounts = Integer.valueOf(session.getAttribute("counts").toString());
		Work work = new Work();
		work.setWid(receiue.getUwork());
		receiue.setWork(work);
		work = workService.queryById(work.getWid());
		int wcount = work.getWcount();
		int ucount2  = Integer.valueOf(receiue.getUcount());
		if(ucount2>ucounts){
			int c = wcount - ucount2;
			work.setWcount(c);
			if(c>=1){
				workService.update(work);
			}else{
				result = ControllerResult.getFailResult("没有那么多数量了");
				return SUCCESS;
			}
		}else if(ucount2<ucounts){
			int c = wcount + (ucounts-ucount2);
			work.setWcount(c);
			workService.update(work);
		}
		Dep dep2 = new Dep();
		dep2.setEid(receiue.getDep().getEid());
		receiue.setDep(dep2);
		Receiue r = receiueService.update(receiue);
		if(r!=null){
			result = ControllerResult.getSuccessRequest("修改成功");
		}
		return SUCCESS;
	}
	
	public String queryAll(){
		pager = new Pager<>();
		pager.setPageNo(page);
		int pageSize = Integer.valueOf(ServletActionContext.getRequest().getParameter("rows"));
		pager.setPageSize(pageSize);
		pager = receiueService.queryAll(pager);		
		for(Receiue r : pager.getRows()){
			Work w = r.getWork();
			Dep dep = r.getDep();
			if(w != null && dep != null){
				r.setUwork(w.getWid());
				r.setEid(dep.getEid());
			}
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return SUCCESS;
	}
	
	public String guihuan(){
		int wid = receiue.getUwork();
		receiue = receiueService.queryById(receiue.getUid());
		int ucount = Integer.valueOf(receiue.getUcount());
		Work work = new Work();
		work.setWid(wid);
		work = workService.queryById(work.getWid());
		int wcount = work.getWcount();
		int a = ucount + wcount;
		work.setWcount(a);
		receiue.setWork(work);
		workService.update(work);
		receiue.setRestore("还");
		receiueService.update(receiue);
		result = ControllerResult.getSuccessRequest("归还成功");
		return SUCCESS;
	}
	
}
