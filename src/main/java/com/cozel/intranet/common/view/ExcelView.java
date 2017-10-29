package com.cozel.intranet.common.view;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ExcelView extends AbstractExcelView {
	@Override
	protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook hssfWorkbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		@SuppressWarnings("unchecked")
        List<Map<String, Object>> getWorkReportList = (List<Map<String, Object>>) model.get("getWorkReportList");

        HSSFSheet sheet = hssfWorkbook.createSheet("업무현황 리포트");
        sheet.setDefaultColumnWidth(20);
        
        this.setHeader(sheet, this.getHeaderStyle(hssfWorkbook));
        this.setRows(sheet, this.getRowStyle(hssfWorkbook), getWorkReportList);
        this.setFileName(request, response);
	}
	
    private CellStyle getHeaderStyle(HSSFWorkbook hssfWorkbook) {
        CellStyle cellStyle = hssfWorkbook.createCellStyle();
        Font font = hssfWorkbook.createFont();
        font.setFontName("Arial");
        cellStyle.setFillForegroundColor(HSSFColor.BLACK.index);
        cellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.WHITE.index);
        cellStyle.setFont(font);
        return cellStyle;
    }
    
    private void setHeader(HSSFSheet sheet, CellStyle cellStyle) {
        HSSFRow header = sheet.createRow(0);

        Cell countCell = header.createCell(0);
        countCell.setCellValue("No");
        countCell.setCellStyle(cellStyle);

        Cell comNm = header.createCell(1);
        comNm.setCellValue("고객사");
        comNm.setCellStyle(cellStyle);
        
        Cell posNm = header.createCell(2);
        posNm.setCellValue("포지션");
        posNm.setCellStyle(cellStyle);
        
        Cell usrNm = header.createCell(3);
        usrNm.setCellValue("후보자");
        usrNm.setCellStyle(cellStyle);
        
        Cell regDate = header.createCell(4);
        regDate.setCellValue("일자");
        regDate.setCellStyle(cellStyle);
        
        Cell stateNm = header.createCell(5);
        stateNm.setCellValue("진행");
        stateNm.setCellStyle(cellStyle);
    }
    
    private CellStyle getRowStyle(HSSFWorkbook hssfWorkbook) {
        CellStyle cellStyle = hssfWorkbook.createCellStyle();
        Font font = hssfWorkbook.createFont();
        font.setFontName("Arial");
        cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
        return cellStyle;
    }
    
    private void setRows(HSSFSheet sheet, CellStyle style, List<Map<String, Object>> getAllStatus) {
        int rowCount = 1;

        if (getAllStatus != null) {
            for (Map<String, Object> map : getAllStatus) {
                HSSFRow row = sheet.createRow(rowCount);

                Cell countCell = row.createCell(0);
                countCell.setCellStyle(style);
                countCell.setCellValue(rowCount);

                Cell comNm = row.createCell(1);
                comNm.setCellValue((String) map.get("COM_NM"));

                Cell posNm = row.createCell(2);
                posNm.setCellValue((String) map.get("POS_NM"));
                
                Cell usrNm = row.createCell(3);
                usrNm.setCellValue((String) map.get("USR_NM"));
                
                Cell regDate = row.createCell(4);
                regDate.setCellValue((String) map.get("REG_DATE"));
                
                Cell stateNm = row.createCell(5);
                stateNm.setCellValue((String) map.get("STATE_NM"));
                
                rowCount++;
            }
            
            HSSFRow row = sheet.createRow(rowCount+1);
            row.setHeight((short) 5000);
            sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), (short) row.getRowNum(), 0, (short) 5));

        }
    }

    private void setFileName(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String userAgent = request.getHeader("User-Agent");
        String fileName = "업무현황 리포트.xls";

        if (userAgent.indexOf("MSIE") > -1) {
            fileName = URLEncoder.encode(fileName, "UTF-8");
        } else {
        	fileName = URLEncoder.encode(fileName, "UTF-8");
        }

        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
    }
}
