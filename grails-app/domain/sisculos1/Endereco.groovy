package sisculos1
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.soap.*;

import org.w3c.dom.*;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

class Endereco {
	
	String bairro
	String cidade
	String complemento
	String endereco
	String uf
	String cep
		
		public Endereco(String cep) {
			super();
			this.cep = cep;
		}
	
		/*O método consultaCEP retorna um vetor de String com 8 posições onde cada uma
		 *delas guarda os dados enviados pelo webService dos correios na seguinte ordem:
		 *Bairro, Cep, Cidade, Complemento1, Complemento2, Endereço, ID, UF.
		 */
		public String[] consultaCEP() throws Exception{
	
			// Criação da conexão SOAP,
			SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
			SOAPConnection soapConnection = soapConnectionFactory.createConnection();
	
			//Criação de uma Mensagem SOAP
			MessageFactory messageFactory = MessageFactory.newInstance();
			SOAPMessage soapMessage = messageFactory.createMessage();
			SOAPPart soapPart = soapMessage.getSOAPPart();
	
			// Criação do conteúdo da mensagem SOAP de acordo com o formato dos Correios
			SOAPEnvelope envelope = soapPart.getEnvelope();
			envelope.addNamespaceDeclaration("cli", "http://cliente.bean.master.sigep.bsb.correios.com.br/");
			SOAPBody soapBody = envelope.getBody();
			SOAPElement soapBodyElem = soapBody.addChildElement("consultaCEP", "cli");
			SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("cep");
			soapBodyElem1.addTextNode(cep);
	
			//Faz a requisição HTTP com a SOAPAction
			MimeHeaders headers = soapMessage.getMimeHeaders();
			headers.addHeader("SOAPAction","");
	
	
			// Envia a requisição ao WebSevice e armazena o retono em soapResponse
			String url = "https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl";
			SOAPMessage soapResponse = soapConnection.call(soapMessage, url);
	
			//Fecha a conexão SOAP
			soapConnection.close();
	
			//Transforma a menssagem do formato SOAPMessage para InputSource
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			soapResponse.writeTo(baos);
			InputSource inputSource = new InputSource(new StringReader(new String(baos.toByteArray())));
	
			//Transforma o InputSurce para um documento DOM que interpreta xml
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(inputSource);
	
			//Recupera o Elemento com os dados do Endereço
			Element  elementoCabecalho = doc.getDocumentElement();
			NodeList elementoBody = elementoCabecalho.getElementsByTagName("soap:Body");
			Node elementoNs2= elementoBody.item(0).getFirstChild();
			Node elementoReturn = elementoNs2.getFirstChild();
			NodeList dadosDoEndereco = elementoReturn.getChildNodes();
	
			//Gera o vetor de String a partir dos dados enviados pelo webService
			String[] retorno= new String[8];
			for (int i=0; i<dadosDoEndereco.getLength(); i++){
				retorno[i] = dadosDoEndereco.item(i).getTextContent();
			}
	
			//Retorna o vetor gerado
			return retorno;
		}
}
