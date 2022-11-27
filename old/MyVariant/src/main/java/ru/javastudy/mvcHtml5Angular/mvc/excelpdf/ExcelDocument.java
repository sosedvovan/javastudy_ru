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
 * Created for JavaStudy.ru on 23.02.2016.
 * Создание PDF, Excel документов
 * Для работы с документами от майкрософт (xls, doc..) мы используем библиотеку от Apache.
 * Для работы с PDF документами будет использоваться библиотека iText.
 *
 * Хочу отметить, что iText использует встроенный в spring класс org.springframework.web.servlet.view.document.AbstractPdfView,
 * но есть более современная библиотека для работы с PDF — iTextPDF 5.5.1 (она не поддерживает библиотеки из этого примера).
 * Работа с iTextPDF 5.5.1 показана в похожей статье Spring Web Flow — создание PDF и Excel документов.
 * Нам понадобится создать два класса, в которых будет генерироваться соответствующий документ, а так же контроллер,
 * который будет обрабатывать запросы от клиента. Дополнительно был создан класс-заглушка Cat чисто для формирования таблиц.
 * Описывать подробно классы не буду, т.к. все названия методов и переменных показывают их назначение (pdfHeader, addCell и т.п.).
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
