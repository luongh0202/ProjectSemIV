/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.controller;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

/**
 *
 * @author LuongHoang
 */
public class RevenueReportController extends AbstractController {

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String output = ServletRequestUtils.getStringParameter(request, "output");
        //dummy data
        Map<String, String> revenueData = new HashMap<String, String>();
        revenueData.put("1/20/2010", "$100,000");
        revenueData.put("1/21/2010", "$200,000");
        revenueData.put("1/22/2010", "$300,000");
        revenueData.put("1/23/2010", "$400,000");
        revenueData.put("1/24/2010", "$500,000");

        if (output == null || "".equals(output)) {
            //return normal view
            return new ModelAndView("PdfView", "revenueData", revenueData);

        } else if ("PDF".equals(output.toUpperCase())) {
            //return excel view
            return new ModelAndView("PdfRevenueSummary", "revenueData", revenueData);

        } else {
            //return normal view
            return new ModelAndView("PdfView", "revenueData", revenueData);

        }
    }

}
