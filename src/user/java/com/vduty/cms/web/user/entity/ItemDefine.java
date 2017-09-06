package com.vduty.cms.web.user.entity;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name = "Item_main")
public class ItemDefine {

	public ItemDefine() {

	}
	
	/**
	 * "id":"0",
				"itemId":"0",
				"fieldName":"",
			"fieldMeaning" : name,
			"dataType" : type,
			"unit" : unit
	 * @param itemId
	 * @param name
	 * @param type
	 * @param unit
	 * @param fieldMeaning
	 */

//	public ItemDefine(int itemId, String name, int type, String unit, String fieldMeaning) {
//		this.fieldName = name;
//		this.dataType = type;
//		this.unit = unit;
//		this.fieldMeaning = fieldMeaning;
//		this.itemId = itemId;
//	}

	int itemId;

	@Column(name = "item_id")
	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	int id;

	@Column(name = "id")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String fieldName;

	@Column(name = "field_name")
	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	@Column(name = "unit")
	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	private String fieldMeaning;

	@Column(name = "field_meaning")
	public String getFieldMeaning() {
		return fieldMeaning;
	}

	public void setFieldMeaning(String fieldMeaning) {
		this.fieldMeaning = fieldMeaning;
	}

	private String unit;
	private int dataType;

	@Column(name = "data_type")
	public int getDataType() {
		return dataType;
	}

	public void setDataType(int dataType) {
		this.dataType = dataType;
	}

}
