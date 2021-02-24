package HMS.utils;

import java.io.IOException;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

public class Mac {
    private static final int TIMEOUT = 3000;
    private static final String[] VIRTUAL_ADAPTER_NAMES = { "VirtualBox", "Hyper-V" };

    private static boolean isRelevant(NetworkInterface networkInterface) throws IOException {
        if (!networkInterface.isUp()) {
            return false;
        }
        if (networkInterface.isVirtual()) {
            return false;
        }
        if (networkInterface.isLoopback()) {
            return false;
        }
        String name = networkInterface.getDisplayName();
        for (String vName : VIRTUAL_ADAPTER_NAMES) {
            if (name.contains(vName)) {
                return false;
            }
        }
        return true;
    }

    private static boolean isIpv4Address(String address) {
        return address.matches("[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}");
    }

    public static byte[] printInfoForInterface(NetworkInterface networkInterface) throws IOException {
        System.out
                .println("Interface: \t" + networkInterface.getDisplayName() + " (" + networkInterface.getName() + ")");

        Enumeration<InetAddress> addresses = networkInterface.getInetAddresses();
        String mac ="";
        while (addresses.hasMoreElements()) {
            String address = addresses.nextElement().getHostAddress();
            if (isIpv4Address(address)) {
                if (InetAddress.getByName(address).isReachable(TIMEOUT)) {
                    System.out.println("IP address: \t" + address);

                    mac  = printMac(networkInterface.getHardwareAddress());
                }
            }
        }
        return mac.getBytes();
    }

    public static String  printMac(byte[] mac) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < mac.length; i++) {
            sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "" : ""));
        }
        System.out.println("MAC: \t\t" + sb.toString().toLowerCase());
        return sb.toString().toLowerCase();
    }

    public static void main(String args[]) throws IOException {
        System.out.println("HostName: \t" + InetAddress.getLocalHost().getHostName());
        System.out.println("------------------------------------------\n");

        System.out.println("MAC RETURN " + getMac());
    }
    
    public static byte[]  getMac() {
    	Enumeration<NetworkInterface> interfaces = null;
    	byte[] mac = null;
		try {
			interfaces = NetworkInterface.getNetworkInterfaces();
		} catch (SocketException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        while (interfaces.hasMoreElements()) {
            try {
                NetworkInterface networkInterface = interfaces.nextElement();
                if (isRelevant(networkInterface)) {
                    mac = printInfoForInterface(networkInterface);
                }
            } catch (IOException e) {
                System.err.println("An error occured.");
                e.printStackTrace(System.err);
            }
        }
        return mac;
    }
}
