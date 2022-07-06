/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws;

import bkap.demo.utils.ConnectBD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author LuongHoang
 */
@WebService(serviceName = "PaymentWebservice")
public class PaymentWebservice {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "checkOrder")
    public String checkOrder(@WebParam(name = "merchantName") String merchantName, @WebParam(name = "accNo") String accNo, @WebParam(name = "accName") String accName, @WebParam(name = "playmentAmount") float playmentAmount) {
        Connection conn = null;
        CallableStatement calla;
        String resultSet = "";

        try {
            conn = ConnectBD.openConnect();
            calla = conn.prepareCall("{ call CheckOrder(?,?,?,?,?,?)}");
            calla.setString(1, merchantName);
            calla.setString(2, accNo);
            calla.setString(3, accName);
            calla.setFloat(4, playmentAmount);
            calla.registerOutParameter(5, Types.CHAR);
            calla.registerOutParameter(6, Types.INTEGER);
            calla.executeUpdate();
            String returnCode = calla.getString(5);
            int transachtionId = calla.getInt(6);
            resultSet = returnCode + "#" + transachtionId;

        } catch (SQLException ex) {
            Logger.getLogger(PaymentWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultSet;
    }

    /**
     * Web service operation
     * @param transachtionId
     * @param merchantName
     * @return 
     */
    @WebMethod(operationName = "finishOrder")
    public String finishOrder(@WebParam(name = "transachtionId") int transachtionId, @WebParam(name = "merchantName") String merchantName) {
        Connection conn = null;
        CallableStatement calla = null;
        String returnSet = "";
        try {

            conn = ConnectBD.openConnect();
            calla = conn.prepareCall("{call FinishOrder(?,?,?)}");
            calla.setInt(1, transachtionId);
            calla.setString(2, merchantName);
            calla.registerOutParameter(3, Types.CHAR);
            calla.executeUpdate();
            returnSet = calla.getString(3);
        } catch (SQLException ex) {
            Logger.getLogger(PaymentWebservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return returnSet;
    }
}
