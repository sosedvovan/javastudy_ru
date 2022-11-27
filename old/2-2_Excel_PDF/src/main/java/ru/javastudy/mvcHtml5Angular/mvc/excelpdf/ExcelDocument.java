package ru.javastudy.mvcHtml5Angular.mvc.excelpdf;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * создания excel  документов
 *
 * Рассмотрим как можно загрузить файл в приложении Spring MVC.
 * Также рассмотрим создание .xls и .pdf документов с помощью Spring MVC
 * Рассмотреть каким образом можно загружать на сервер различные файлы в приложении на основе Spring MVC.
 * Изучить применение библиотек Apache POI и iText для создания документов Microsoft и PDF соответственно
 *
 * Для этой задачи были добавлены java классы для загрузки файла (FileUploadController),
 * создания excel и pdf документов (ExcelDocument, PDFDocument), класс-модель (Cat) и контроллер,
 * который будет обрабатывать запросы с jsp страницы (ExcelPDFController).
 *
 * Для отображения результата используется представление /file/file.jsp.
 *
 * Дополнительно, начиная с этой части, будет использоваться шаблоны для формирования jsp страниц,
 * чтобы не дублировать повторяющиеся части страницы (здесь header и footer вынесены в шаблон).
 */
public class ExcelDocument extends AbstractExcelView {


    @Override
    protected void buildExcelDocument(
            Map<String, Object> model,
            HSSFWorkbook workbook,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        //New Excel sheet
        HSSFSheet excelSheet = workbook.createSheet("Simple excel example");
        //Excel file name change
        response.setHeader("Content-Disposition", "attachment; filename=excelDocument.xls");

        Font font = workbook.createFont();
        font.setFontName("Arial");
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.WHITE.index);

        //Create Style for header
        CellStyle styleHeader = workbook.createCellStyle();
        styleHeader.setFillForegroundColor(HSSFColor.BLUE.index);
        styleHeader.setFillPattern(CellStyle.SOLID_FOREGROUND);
        styleHeader.setFont(font);

        //Set excel header
        setExcelHeader(excelSheet, styleHeader);

        //Get data from model
        List<Cat> cats = (List<Cat>) model.get("modelObject");
        int rowCount = 1;
        for (Cat cat : cats) {
            HSSFRow row = excelSheet.createRow(rowCount++);
            row.createCell(0).setCellValue(cat.getName());
            row.createCell(1).setCellValue(cat.getWeight());
            row.createCell(2).setCellValue(cat.getColor());
        }

    }
    public void setExcelHeader(HSSFSheet excelSheet, CellStyle styleHeader) {
        //set Excel Header names
        HSSFRow header = excelSheet.createRow(0);
        header.createCell(0).setCellValue("Name");
        header.getCell(0).setCellStyle(styleHeader);
        header.createCell(1).setCellValue("Wieght");
        header.getCell(1).setCellStyle(styleHeader);
        header.createCell(2).setCellValue("Color");
        header.getCell(2).setCellStyle(styleHeader);
    }
}
