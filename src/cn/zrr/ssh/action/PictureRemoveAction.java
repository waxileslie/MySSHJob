package cn.zrr.ssh.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import cn.zrr.ssh.model.PictureModel;
import cn.zrr.ssh.service.IPictureService;

public class PictureRemoveAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	private IPictureService pictureService = null;

	@Autowired
	public void setPictureService(IPictureService pictureService) {
		this.pictureService = pictureService;
	}

	private PictureModel pictureModel = null;

	public PictureModel getPictureModel() {
		return pictureModel;
	}

	public void setPictureModel(PictureModel pictureModel) {
		this.pictureModel = pictureModel;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		pictureService.removePicture(pictureModel.getNumber());
		System.out.println("图片已删除");
		return super.execute();
	}
}
