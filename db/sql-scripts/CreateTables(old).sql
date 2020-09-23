-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2020 at 07:30 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iagrinet`
--

-- --------------------------------------------------------

--
-- Table structure for table `base_usuarios`
--

CREATE TABLE `base_usuarios` (
  `nIdUsuario` int(11) NOT NULL COMMENT 'llave',
  `cDid` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'id identificador de uPort para poder identificar al usuario',
  `nTipo` tinyint(4) NOT NULL COMMENT 'tipo de usuario  1=Productor-Comercializador 2=Distribuidor-Comprador',
  `cEmpresa` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre completo de la empresa del usuario',
  `nTipoEmpresa` tinyint(4) NOT NULL COMMENT 'Empresa si es nacional o internacional  valores  1=Nacional 2=Internacional',
  `cRegistroIdentificador` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Si la empresa es nacional deberá solicitar el RFC con el formato RFC para captura actual en México. Si la empresa es internacional deberá solicitar captura de Taxid que son formato de USA',
  `cMarcaComercial` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'nombre de la marca comercial',
  `cEmail` varchar(150) COLLATE latin1_general_ci NOT NULL COMMENT 'correo electrónico del usuario',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla principal de usuarios, posterior a identificación en blockchain';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariosanexos`
--

CREATE TABLE `base_usuariosanexos` (
  `nIdUsuarioAnexo` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `cNombreDirectorEmpresa` varchar(200) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'nombre correspondiente al director general de la empresa',
  `cEmailDirectorEmpresa` varchar(150) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'dato de correo electrónico correspondiente al Director General de la empresa',
  `cTelefonoDirectorEmpresa` varchar(50) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'dato del número de teléfono correspondiente al director general de la empresa',
  `nIDAniosEnCargoDirectorEmpresa` int(11) DEFAULT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_AniosEmpresa'' correspondiente al director general de la empresa',
  `nIDTiempoOperacionEmpresa` int(11) DEFAULT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_TiempoOperacionEmpresa'' para la carga de datos de productor/comercializador y comprador/Distribuidor',
  `nIDCantidadEmpleadosFijo` int(11) DEFAULT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_CantidadEmpleadosFijosEmpresa'' para la carga de datos de productor/comercializador y comprador/Distribuidor',
  `nIDCantidadEmpleadosEventuales` int(11) DEFAULT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_CantidadEmpleadosFijosEmpresa'' para la carga de datos de solamente productor/comercializador',
  `cDireccionSucursalMatriz` varchar(500) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'campo que guarda la dirección completa de la matriz de la empresa para la carga de datos de productor/comercializador y comprador/Distribuidor',
  `cDireccionSucursal` varchar(500) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'campo que guarda la dirección completa de la sucursal de la empresa para la carga de datos de productor/comercializador y comprador/Distribuidor',
  `cTelefonoOficinaMatriz` varchar(50) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'dato del número de teléfono correspondiente a Oficina Matriz para la carga de datos de productor/comercializador y comprador/Distribuidor',
  `bTienePaginaWebEmpresa` tinyint(4) DEFAULT NULL COMMENT 'dato que indica si la empresa tiene una página web para la carga de datos de productor/comercializador y comprador/Distribuidor  valores 1 0',
  `cURLPaginaWebEmpresa` varchar(500) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'url de la página web de la empresa para la carga de datos de productor/comercializador y comprador/Distribuidor',
  `bExportaProductos` tinyint(4) DEFAULT NULL COMMENT 'dato que indica si el usuario de tipo productor exporta sus productos  valores 1 0',
  `bTieneCertificaciones` tinyint(4) DEFAULT NULL COMMENT 'dato que indica si el usuario sean de tipo productor o compradores tiene algun tipo de certificaciones  valores 1 0',
  `bTieneLineaCredito` tinyint(4) DEFAULT NULL COMMENT 'dato que indica si el usuario de tipo productor tiene alguna línea de crédito  valores 1 0',
  `bFormaParteOrganizaciones` tinyint(4) NOT NULL COMMENT 'dato que indica si el usuario de tipo productor forma parte de alguna asociación u organización  valores 1 0',
  `bTieneCreditoVigente` tinyint(4) DEFAULT NULL COMMENT 'dato que indica si el usuario de tipo Comprador tiene algún crédito vigente  valores 1 0',
  `bOtorgaCreditoClientes` tinyint(4) DEFAULT NULL COMMENT 'dato que indica si el usuario de tipo Comprador tiene otorga crédito a sus cliente   valores 1 0',
  `nIDTiempoPago` int(11) DEFAULT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_TiemposPago'' para la carga de datos de solamente comprador/distribuidor',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de datos para complementar datos de usuario para tener un compendio de datos y de registro comun mas completo';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariosanexoscomprador`
--

CREATE TABLE `base_usuariosanexoscomprador` (
  `nAnexoUsuario` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL,
  `nVentasAnualesAproximadas` decimal(18,2) NOT NULL COMMENT 'datos de la cantidad aproximada de ventas que realiza el comprador en unidad de medida toneladas',
  `nIDEstatusBuroCredito` int(11) NOT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_EstatusBuroCredito''',
  `cNombreArchivo` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre del archivo subido del estado de comprador en el buró de crédito',
  `aArchivo` mediumblob NOT NULL COMMENT 'campo para guardar en formato binario el archivo de estado de buró de crédito indicado para un usuario comprador',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de datos para registrar información adicional del Comprador';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariosarchivosanexos`
--

CREATE TABLE `base_usuariosarchivosanexos` (
  `nIdUsuarioAnexo` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `nTipo` tinyint(4) NOT NULL COMMENT 'valor que indica el tipo de archivo binario guardado 1=Archivo CSF 2=Logo Empresa/Marca',
  `aArchivo` mediumblob NOT NULL COMMENT 'columna para guardar en formato binario o base 64 el archivo binario relacionado al campo de nTipo',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de datos binarios (imagenes, archivos) para complementar datos de usuario para tener un compendio de datos mas completo';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuarioscertificaciones`
--

CREATE TABLE `base_usuarioscertificaciones` (
  `nCertificacionUsuario` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `cDescripcionCertificacion` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'campo para guardar la descripción de la certificación',
  `cReferenciaCertificado` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'campo que guarda el número o referencia del certificado  ',
  `cNombreArchivo` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre del archivo subido',
  `aArchivo` mediumblob NOT NULL COMMENT 'campo para guardar en formato binario el archivo de certificación indicado para un usuario comprador',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla relación de certificaciones de usuarios tipo comprador';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariosdatoscontactos`
--

CREATE TABLE `base_usuariosdatoscontactos` (
  `nContactoUsuario` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `cNombreContacto` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción del nombre del contacto del usuario',
  `cEmail` varchar(150) COLLATE latin1_general_ci NOT NULL COMMENT 'dato de correo electrónico correspondiente al contacto',
  `cTelefono` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'dato del número de teléfono correspondiente al contacto',
  `cPuesto` varchar(100) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción del puesto del contacto',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla detalle de contactos del usuario';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariosestadoscuenta`
--

CREATE TABLE `base_usuariosestadoscuenta` (
  `nEstadoCuenta` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `cDescripcionArchivo` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'Descripción de nombre de archivo o referencia del estado de cuenta que se indicó por parte de usuario',
  `cReferenciaEstadoCuenta` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'referencia de número de estado de cuenta para el archivo',
  `aArchivo` mediumblob NOT NULL COMMENT 'archivo del estado de cuenta en formato binario',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla registro para guardar archivos de estados de cuenta de usuario de tipo Productor o comprador';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariosinformacioncrediticia`
--

CREATE TABLE `base_usuariosinformacioncrediticia` (
  `nInformacionCrediticia` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `nIDBanca` int(11) NOT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_Banca'' ',
  `nIDRangoLineaCredito` int(11) NOT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_RangoLineasCredito''  ',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla registro para guardar datos de información crediticia de usuarios de tipo Productor y Comprador ';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariosorganizaciones`
--

CREATE TABLE `base_usuariosorganizaciones` (
  `nOrganizacion` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `nIDTipoOrganizacion` int(11) NOT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_TiposOrganizaciones'' ',
  `nIDTiempoPertenenciaOrganizacion` int(11) NOT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_TiposOrganizaciones'' ',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla registro de la relación de organizaciones a la que puede pertenecer el usuario de tipo productor';

-- --------------------------------------------------------

--
-- Table structure for table `base_usuariossocios`
--

CREATE TABLE `base_usuariossocios` (
  `nSocio` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id de usuario al que pertenece el registro',
  `cNombreSocio` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'nombre correspondiente al socio',
  `cEmailSocio` varchar(150) COLLATE latin1_general_ci NOT NULL COMMENT 'dato de correo electrónico correspondiente al socio',
  `cTelefonoSocio` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'dato del número de teléfono correspondiente al socio',
  `nIDCargoSocio` int(11) NOT NULL COMMENT 'id que guarda el valor relacionado al tipos datos ''CNF_CargosSocios'' correspondiente al socio dentro de la empresa a la que corresponde',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla detalle de contactos del usuario de tipo productor';

-- --------------------------------------------------------

--
-- Table structure for table `cnf_configuracioncorreo`
--

CREATE TABLE `cnf_configuracioncorreo` (
  `nConfiguracion` int(11) NOT NULL COMMENT 'llave',
  `cCorreoEmisor` varchar(100) COLLATE latin1_general_ci NOT NULL COMMENT 'email de quien envía',
  `cNombreAMostrarMensaje` varchar(150) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción de quien  envía',
  `cPasswordEmisor` varchar(100) COLLATE latin1_general_ci NOT NULL COMMENT 'contraseña encriptada',
  `cSMTP` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'servidor de la cuenta de correo',
  `nPuerto` int(11) NOT NULL COMMENT 'puerto de envio del correo',
  `nTimeOutms` int(11) NOT NULL COMMENT 'time out en milisegundos',
  `bEnableSsl` tinyint(4) NOT NULL COMMENT 'si maneja ssl en cuenta de envío',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla para registrar datos de la cuenta de correo para enviar desde sistema';

-- --------------------------------------------------------

--
-- Table structure for table `cnf_plantillascorreo`
--

CREATE TABLE `cnf_plantillascorreo` (
  `nPlantilla` int(11) NOT NULL COMMENT 'llave',
  `cContexto` varchar(6) COLLATE latin1_general_ci NOT NULL COMMENT 'contexto al que puede pertenecer el registro  ejem  ENVIO REGISTR',
  `nTipoPlantilla` tinyint(4) NOT NULL COMMENT 'tipo de plantilla  valores  1=Avisos a usuario de alta',
  `cNombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'nombre de la plantilla',
  `cDescripcion` varchar(5000) COLLATE latin1_general_ci NOT NULL COMMENT 'descripcion mas específica de la plantilla',
  `cTituloCorreo` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'título que recibiría el correo puede contener formato para sustituir  Ejem  {{Sistema}} Contacto  Donde {{Sistema}}  se podria sustitur por uno definido en aplicación',
  `cFormatoCorreo` varchar(5000) COLLATE latin1_general_ci NOT NULL COMMENT 'rmato con estilo html que puede tener el correo, opcional',
  `cTagObligatorios` varchar(500) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'tags que pueden llevar para sustituir contenido  ejem {{cNombres}},{{cMensaje}},{{cPassword}}',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla para tener plantillas para el envío de correo para estandarizar los correos';

-- --------------------------------------------------------

--
-- Table structure for table `conf_parametrosadministrados`
--

CREATE TABLE `conf_parametrosadministrados` (
  `cContexto` varchar(30) COLLATE latin1_general_ci NOT NULL COMMENT 'abreviatura de un módulo al que se pudiera asociar el parámetro',
  `cParametroAdministrado` varchar(100) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción del párámetro que se desea identificar',
  `nTipo` smallint(6) NOT NULL COMMENT 'indicador para tipo de valor  valores 1=Número 2=Caracteres',
  `cDescripcion` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción del parámetro para conocer su uso',
  `cValor` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'valor del parámetro que dependiendo del campo nTipo seria considerado como número o caracteres'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de parámetros para valores que no se desea queden en código de aplicaciones';

-- --------------------------------------------------------

--
-- Table structure for table `conf_tiposdatos`
--

CREATE TABLE `conf_tiposdatos` (
  `nTipoDato` int(11) NOT NULL COMMENT 'llave',
  `cLlave` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'nombre de la "tabla" o identificador para los datos ',
  `cValor` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'sería el equivalente del campo de la llave para describirlo',
  `nValor` int(11) NOT NULL COMMENT 'valor correspondiente al cValor considerado como el identificador del dato'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Tabla auxiliar de configuración para catálogos genéricos que no requieren tabla propia';

--
-- Dumping data for table `conf_tiposdatos`
--

INSERT INTO `conf_tiposdatos` (`nTipoDato`, `cLlave`, `cValor`, `nValor`) VALUES
(1, 'CNF_AniosEmpresa', 'menos de 3', 1),
(2, 'CNF_AniosEmpresa', 'entre 3 y 15', 2),
(3, 'CNF_AniosEmpresa', 'Más de 15 años', 3),
(4, 'CNF_CargosSocios', 'Presidente del consejo', 1),
(5, 'CNF_CargosSocios', 'Tesorero', 2),
(6, 'CNF_CargosSocios', 'Consejero', 3),
(7, 'CNF_CargosSocios', 'Sin cargo', 4),
(8, 'CNF_EstatusBuroCredito', 'bueno', 1),
(9, 'CNF_EstatusBuroCredito', 'malo', 2),
(10, 'CNF_SectoresProducto', 'Hortofrutícola', 1),
(11, 'CNF_SectoresProducto', 'Pecuario', 2),
(12, 'CNF_SectoresProducto', 'Granos y Leguminosas', 3),
(13, 'CNF_SectoresProducto', 'Procesados', 4),
(14, 'CNF_TiemposPago', 'menos de 15 días', 1),
(15, 'CNF_TiemposPago', 'de 15 a 30 días', 2),
(16, 'CNF_TiemposPago', 'de 30 a 45 días', 3),
(17, 'CNF_TiemposPago', 'de 45 a 90 días', 4),
(18, 'CNF_TiemposPago', 'más de 90 días', 5),
(19, 'CNF_TiempoOperacionEmpresa', 'menos de 5 años', 1),
(20, 'CNF_TiempoOperacionEmpresa', 'entre 6 y 20 años', 2),
(21, 'CNF_TiempoOperacionEmpresa', 'entre 21 y 40 años', 3),
(22, 'CNF_TiempoOperacionEmpresa', 'más de 41 años', 4),
(23, 'CNF_TiposProduccionProducto', 'Campo abierto', 1),
(24, 'CNF_TiposProduccionProducto', 'Invernadero', 2),
(25, 'CNF_TiposProduccionProducto', 'Malla sombra', 3),
(26, 'CNF_TiposProduccionProducto', 'Cría', 4),
(27, 'CNF_TiposProduccionProducto', 'Pastoreo', 5),
(28, 'CNF_CantidadEmpleadosFijosEmpresa', 'Menos de 50', 1),
(29, 'CNF_CantidadEmpleadosFijosEmpresa', '51-100', 2),
(30, 'CNF_CantidadEmpleadosFijosEmpresa', '101-250', 3),
(31, 'CNF_CantidadEmpleadosFijosEmpresa', 'Más de 250', 4),
(32, 'CNF_PaisesExportacion', 'Estados Unidos', 1),
(33, 'CNF_PaisesExportacion', 'Canadá', 2),
(34, 'CNF_PaisesExportacion', 'Europa', 3),
(35, 'CNF_PaisesExportacion', 'América Latina', 4),
(36, 'CNF_PaisesExportacion', 'Japón', 5),
(37, 'CNF_PaisesExportacion', 'China', 6),
(38, 'CNF_PaisesExportacion', 'Otro', 7),
(39, 'CNF_CantidadEmpleadosEventualesEmpresa', 'Menos de 50', 1),
(40, 'CNF_CantidadEmpleadosEventualesEmpresa', '51-100', 2),
(41, 'CNF_CantidadEmpleadosEventualesEmpresa', '101-250', 3),
(42, 'CNF_CantidadEmpleadosEventualesEmpresa', 'Más de 250', 4),
(43, 'CNF_TiempoExportando', 'Menos de 5 años', 1),
(44, 'CNF_TiempoExportando', 'entre 6 y 15años', 2),
(45, 'CNF_TiempoExportando', 'Más de 15 años', 3),
(46, 'CNF_TiposCertificaciones', 'Calidad', 1),
(47, 'CNF_TiposCertificaciones', 'Inocuidad', 2),
(48, 'CNF_TiposCertificaciones', 'Orgánica', 3),
(49, 'CNF_TiposCertificaciones', 'Comercio Justo', 4),
(50, 'CNF_TiposCertificaciones', 'Responsabilidad social', 5),
(51, 'CNF_TiposCertificaciones', 'Ambiental', 6),
(52, 'CNF_TiposCertificaciones', 'Religiosa', 7),
(53, 'CNF_TiposCertificaciones', 'Otro', 8),
(54, 'CNF_TiposOrganizaciones', 'Nacional', 1),
(55, 'CNF_TiposOrganizaciones', 'Estatal', 2),
(56, 'CNF_TiposOrganizaciones', 'Local', 3),
(57, 'CNF_Banca', 'Banca de desarrollo', 1),
(58, 'CNF_Banca', 'Banca privada', 2),
(59, 'CNF_Banca', 'Otras instituciones', 3),
(60, 'CNF_TiempoPertenenciaOrganizacion', 'Menos de 5 años', 1),
(61, 'CNF_TiempoPertenenciaOrganizacion', 'Entre 6 y 15 años', 2),
(62, 'CNF_TiempoPertenenciaOrganizacion', 'Más de 15 años', 3),
(63, 'CNF_RangoLineasCredito', 'Menos 5mdp', 1),
(64, 'CNF_RangoLineasCredito', '5-10 mdp', 2),
(65, 'CNF_RangoLineasCredito', '10 a 25 mdp', 3),
(66, 'CNF_RangoLineasCredito', 'Mas de 25mdp', 4),
(67, 'CNF_TiposProduccionProducto', 'Engorda', 6),
(68, 'CNF_TiposProduccionProducto', 'Proceso', 7),
(69, 'CNF_TiposProduccionProducto', 'Deshuese', 8),
(70, 'CNF_TiposProduccionProducto', 'Otro', 9);

-- --------------------------------------------------------

--
-- Table structure for table `ctl_certificacionesproductos`
--

CREATE TABLE `ctl_certificacionesproductos` (
  `nCertificacionProducto` int(11) NOT NULL COMMENT 'llave',
  `nIDTipoCertificacion` int(11) NOT NULL COMMENT 'valor de id de tipo de Certificación del tipos datos ''CNF_TiposCertificaciones''',
  `cDescripcion` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'Descripción de la certificación',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de catálogo de certificaciones para productos';

--
-- Dumping data for table `ctl_certificacionesproductos`
--

INSERT INTO `ctl_certificacionesproductos` (`nCertificacionProducto`, `nIDTipoCertificacion`, `cDescripcion`, `bActivo`, `cUsuario_Registro`, `dFecha_Registro`, `cUsuario_UltimaModificacion`, `dFecha_UltimaModificacion`, `cUsuario_Eliminacion`, `dFecha_Eliminacion`) VALUES
(1, 1, 'NOMs', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(2, 1, 'BPM', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(3, 2, 'SENASICA', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(4, 2, 'GlobalGAP', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(5, 2, 'PrimusGFS', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(6, 2, 'BRC', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(7, 2, 'SQF IFS', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(8, 3, 'SAGARPA', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(9, 3, 'USDA Organic', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(10, 3, 'JAS', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(11, 3, 'GlobalGAP', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(12, 3, 'UE', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(13, 3, 'IFOAM ORGANICS', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(14, 4, 'Fair Trade', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(15, 5, 'ERS', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(16, 5, 'Fair Trade', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(17, 5, 'SMETA', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(18, 6, 'Rainforest Alliance', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(19, 6, 'Global EPD', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(20, 6, 'ISO 14001', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(21, 6, 'EMAS', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(22, 6, 'ISO 14064', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(23, 6, 'Residuo cero', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(24, 7, 'Halal', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(25, 7, 'Kosher', 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ctl_productos`
--

CREATE TABLE `ctl_productos` (
  `nProducto` int(11) NOT NULL COMMENT 'llave',
  `cClave` varchar(15) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'clave del producto, opcional en caso de no tener',
  `cDescripcion` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'nombre del producto',
  `nIDSector` int(11) NOT NULL COMMENT 'valor de id de un sector del tipos datos ''CNF_SectoresProducto''',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla catálogo de productos';

--
-- Dumping data for table `ctl_productos`
--

INSERT INTO `ctl_productos` (`nProducto`, `cClave`, `cDescripcion`, `nIDSector`, `bActivo`, `cUsuario_Registro`, `dFecha_Registro`, `cUsuario_UltimaModificacion`, `dFecha_UltimaModificacion`, `cUsuario_Eliminacion`, `dFecha_Eliminacion`) VALUES
(1, NULL, 'Aceituna', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(2, NULL, 'Acelga', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(3, NULL, 'Achiote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(4, NULL, 'Agapando', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(5, NULL, 'Agave', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(6, NULL, 'Aguacate', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(7, NULL, 'Ajo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(8, NULL, 'Ajonjolí', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(9, NULL, 'Albahaca', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(10, NULL, 'Albricia', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(11, NULL, 'Alcachofa', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(12, NULL, 'Alfalfa', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(13, NULL, 'Algarrobo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(14, NULL, 'Alpiste', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(15, NULL, 'Amaranto', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(16, NULL, 'Anís', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(17, NULL, 'Apio', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(18, NULL, 'Arrayán', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(19, NULL, 'Arándano', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(20, NULL, 'Baby back', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(21, NULL, 'Bangaña', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(22, NULL, 'Berenjena', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(23, NULL, 'Betabel', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(24, NULL, 'Brócoli', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(25, NULL, 'Cacahuate', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(26, NULL, 'Cacao', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(27, NULL, 'Café', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(28, NULL, 'Caimito', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(29, NULL, 'Calabacita', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(30, NULL, 'Calabaza', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(31, NULL, 'Camote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(32, NULL, 'Capulín', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(33, NULL, 'Carambolo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(34, NULL, 'Caña de azúcar', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(35, NULL, 'Cebolla', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(36, NULL, 'Cebollín chino', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(37, NULL, 'Cereza', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(38, NULL, 'Chabacano', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(39, NULL, 'Chay', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(40, NULL, 'Chayote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(41, NULL, 'Chía', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(42, NULL, 'Chícharo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(43, NULL, 'Chilacayote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(44, NULL, 'Chile seco', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(45, NULL, 'Chile verde', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(46, NULL, 'Chirimoya', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(47, NULL, 'Chives', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(48, NULL, 'Cilantro', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(49, NULL, 'Ciruela', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(50, NULL, 'Coco', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(51, NULL, 'Col', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(52, NULL, 'Coliflor', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(53, NULL, 'Comino', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(54, NULL, 'Copra', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(55, NULL, 'Coquia', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(56, NULL, 'Dátil', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(57, NULL, 'Durazno', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(58, NULL, 'Ejote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(59, NULL, 'Epazote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(60, NULL, 'Espárrago', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(61, NULL, 'Especias y medicinales', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(62, NULL, 'Espinaca', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(63, NULL, 'Frambuesa', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(64, NULL, 'Fresa', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(65, NULL, 'Gai lan', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(66, NULL, 'Garbanzo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(67, NULL, 'Granada', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(68, NULL, 'Guaje', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(69, NULL, 'Guamúchil', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(70, NULL, 'Guanábana', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(71, NULL, 'Guayaba', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(72, NULL, 'Haba grano', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(73, NULL, 'Henequén', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(74, NULL, 'Hierbabuena', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(75, NULL, 'Higo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(76, NULL, 'Higuerilla', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(77, NULL, 'Hongos, setas y champiñones', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(78, NULL, 'Huauzontle', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(79, NULL, 'Jaca (jackfruit)', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(80, NULL, 'Jamaica', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(81, NULL, 'Jatropha', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(82, NULL, 'Jenjibre', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(83, NULL, 'Jícama', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(84, NULL, 'Kale', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(85, NULL, 'Kohlrabi', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(86, NULL, 'Lechuga', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(87, NULL, 'Lima', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(88, NULL, 'Limón', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(89, NULL, 'Litchi', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(90, NULL, 'Macadamia', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(91, NULL, 'Maguey', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(92, NULL, 'Malanga', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(93, NULL, 'Mamey', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(94, NULL, 'Mandarina', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(95, NULL, 'Mango', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(96, NULL, 'Mangostán', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(97, NULL, 'Manzana', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(98, NULL, 'Manzanilla', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(99, NULL, 'Maracuyá', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(100, NULL, 'Marañón', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(101, NULL, 'Melón', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(102, NULL, 'Membrillo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(103, NULL, 'Menta', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(104, NULL, 'Mijo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(105, NULL, 'Moringa', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(106, NULL, 'Nabo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(107, NULL, 'Nanche', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(108, NULL, 'Napa', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(109, NULL, 'Naranja', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(110, NULL, 'Níspero', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(111, NULL, 'Noni', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(112, NULL, 'Nopal forrajero', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(113, NULL, 'Nopalitos', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(114, NULL, 'Nuez', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(115, NULL, 'Okra', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(116, NULL, 'Orégano', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(117, NULL, 'Papa', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(118, NULL, 'Pápalo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(119, NULL, 'Papaya', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(120, NULL, 'Pepino', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(121, NULL, 'Pera', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(122, NULL, 'Perejil', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(123, NULL, 'Perón', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(124, NULL, 'Persimonio', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(125, NULL, 'Pimienta', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(126, NULL, 'Pipicha', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(127, NULL, 'Pistache', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(128, NULL, 'Pitahaya', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(129, NULL, 'Piña', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(130, NULL, 'Piñón', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(131, NULL, 'Plátano', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(132, NULL, 'Poro', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(133, NULL, 'Quelite', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(134, NULL, 'Rábano', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(135, NULL, 'Rambután', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(136, NULL, 'Rapini', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(137, NULL, 'Romerito', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(138, NULL, 'Romero', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(139, NULL, 'Sábila', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(140, NULL, 'Salvia', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(141, NULL, 'Sandía', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(142, NULL, 'Saramuyo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(143, NULL, 'Shangai-bock-choy', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(144, NULL, 'Shop suey', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(145, NULL, 'Statice', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(146, NULL, 'Stevia', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(147, NULL, 'Tabaco', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(148, NULL, 'Tamarindo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(149, NULL, 'Tangelo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(150, NULL, 'Tangerina', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(151, NULL, 'Tarragón', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(152, NULL, 'Té limón', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(153, NULL, 'Tejocote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(154, NULL, 'Tomate rojo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(155, NULL, 'Tomate verde', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(156, NULL, 'Tomillo', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(157, NULL, 'Toronja', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(158, NULL, 'Tuna', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(159, NULL, 'Uva', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(160, NULL, 'Vainilla', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(161, NULL, 'Verdolaga', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(162, NULL, 'Viveros', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(163, NULL, 'Yu-choy', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(164, NULL, 'Yuca alimenticia', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(165, NULL, 'Zanahoria', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(166, NULL, 'Zapote', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(167, NULL, 'Zapupe', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(168, NULL, 'Zarzamora', 1, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(169, NULL, 'Bovino', 2, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(170, NULL, 'Porcino', 2, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(171, NULL, 'Ovino', 2, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(172, NULL, 'Caprino', 2, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(173, NULL, 'Ave', 2, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(174, NULL, 'Guajolote', 2, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(175, NULL, 'Abeja', 2, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(176, NULL, 'Arroz', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(177, NULL, 'Arvejón', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(178, NULL, 'Avena', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(179, NULL, 'Canola', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(180, NULL, 'Cártamo', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(181, NULL, 'Cebada ', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(182, NULL, 'Centeno grano', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(183, NULL, 'Frijol', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(184, NULL, 'Lenteja', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(185, NULL, 'Linaza', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(186, NULL, 'Maíz', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(187, NULL, 'Sorgo', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(188, NULL, 'Soya', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL),
(189, NULL, 'Trigo', 3, 1, 'adsum', '2020-08-19 17:26:53', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ctl_relacionsectortipoproduccion`
--

CREATE TABLE `ctl_relacionsectortipoproduccion` (
  `nSectorTipoProduccion` int(11) NOT NULL COMMENT 'llave',
  `nIDSector` int(11) NOT NULL COMMENT 'valor de id de un sector del tipos datos ''CNF_SectoresProducto''',
  `nIDTipoProduccion` int(11) NOT NULL COMMENT 'valor de id de un sector del tipos datos ''CNF_TiposProduccionProducto''',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla relación de tipos de producción que se indican por sector';

--
-- Dumping data for table `ctl_relacionsectortipoproduccion`
--

INSERT INTO `ctl_relacionsectortipoproduccion` (`nSectorTipoProduccion`, `nIDSector`, `nIDTipoProduccion`, `bActivo`, `cUsuario_Registro`, `dFecha_Registro`, `cUsuario_UltimaModificacion`, `dFecha_UltimaModificacion`, `cUsuario_Eliminacion`, `dFecha_Eliminacion`) VALUES
(11, 1, 1, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(12, 1, 2, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(13, 1, 3, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(14, 2, 4, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(15, 2, 5, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(16, 2, 6, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(17, 2, 7, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(18, 2, 8, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(19, 2, 9, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL),
(20, 3, 1, 1, 'adsum', '2020-08-20 10:07:35', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ctl_tiposmembresias`
--

CREATE TABLE `ctl_tiposmembresias` (
  `nTipoMembresia` int(11) NOT NULL COMMENT 'llave',
  `cDescripcion` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción del tipo de membresía',
  `nTipoPeriodo` tinyint(4) NOT NULL COMMENT 'tipos de periodo que abarca la membresía  1= Mensual 2=Trimestral 3=Semestral 4=Anual 5=Semanal',
  `cMoneda` varchar(5) COLLATE latin1_general_ci NOT NULL COMMENT 'abreviatura de la moneda, valor determinado acorde a ISO 4217 para todas las divisas del mundo  ejem  MXN',
  `nImporteMembresia` decimal(18,2) NOT NULL COMMENT 'importe a cubrir para realizar el pago de la membresia',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla catálogo de tipos de membresias';

--
-- Dumping data for table `ctl_tiposmembresias`
--

INSERT INTO `ctl_tiposmembresias` (`nTipoMembresia`, `cDescripcion`, `nTipoPeriodo`, `cMoneda`, `nImporteMembresia`, `bActivo`, `cUsuario_Registro`, `dFecha_Registro`, `cUsuario_UltimaModificacion`, `dFecha_UltimaModificacion`, `cUsuario_Eliminacion`, `dFecha_Eliminacion`) VALUES
(1, 'BASICA', 4, 'MXN', '399.00', 1, 'adsum', '2020-08-07 09:28:09', NULL, NULL, NULL, NULL),
(2, 'PREMIUM', 4, 'MXN', '990.00', 1, 'adsum', '2020-08-07 09:28:09', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ctl_variedadesproducto`
--

CREATE TABLE `ctl_variedadesproducto` (
  `nVariedadProducto` int(11) NOT NULL COMMENT 'llave',
  `cClave` varchar(50) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'código en caso de tener relacionada uno la variedad',
  `cDescripcion` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción de la variedad',
  `nProducto` int(11) NOT NULL COMMENT 'id del producto al que pertenece el registro',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de variedades de productos';

--
-- Dumping data for table `ctl_variedadesproducto`
--

INSERT INTO `ctl_variedadesproducto` (`nVariedadProducto`, `cClave`, `cDescripcion`, `nProducto`, `bActivo`, `cUsuario_Registro`, `dFecha_Registro`, `cUsuario_UltimaModificacion`, `dFecha_UltimaModificacion`, `cUsuario_Eliminacion`, `dFecha_Eliminacion`) VALUES
(1, NULL, 'Aceituna', 1, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(2, NULL, ' manzanilla', 1, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(3, NULL, ' missión', 1, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(4, NULL, 'negra', 1, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(5, NULL, 'Acelga', 2, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(6, NULL, 'exportación', 2, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(7, NULL, 's/clasificar', 2, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(8, NULL, 'Achiote', 3, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(9, NULL, 's/clasificar', 3, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(10, NULL, 'Agapando gruesa', 4, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(11, NULL, 'Agapando gruesa s/clasificar', 4, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(12, NULL, 'Agave bacanora', 5, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(13, NULL, 'Agave mezcalero', 5, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(14, NULL, 'Agave tequilero', 5, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(15, NULL, 'Aguacate criollo', 6, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(16, NULL, 'Aguacate fuerte', 6, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(17, NULL, 'Aguacate hass', 6, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(18, NULL, 'Aguacate hass malla sombra', 6, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(19, NULL, 'Aguacate hass orgánico', 6, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(20, NULL, 'Aguacate s/clasificar', 6, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(21, NULL, 'Ajo blanco', 7, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(22, NULL, 'Ajo blanco orgánico', 7, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(23, NULL, 'Ajo criollo', 7, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(24, NULL, 'Ajo morado', 7, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(25, NULL, 'Ajonjolí s/clasificar', 8, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(26, NULL, 'Albahaca exportación', 9, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(27, NULL, 'Albahaca invernadero', 9, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(28, NULL, 'Albahaca invernadero exportación', 9, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(29, NULL, 'Albahaca orgánico', 9, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(30, NULL, 'Albahaca s/clasificar', 9, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(31, NULL, 'Albricia s/clasificar', 10, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(32, NULL, 'Alcachofa macro túnel', 11, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(33, NULL, 'Alcachofa s/clasificar', 11, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(34, NULL, 'Alfalfa achicalada s/clasificar', 12, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(35, NULL, 'Alfalfa achicalada', 12, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(36, NULL, 'Alfalfa verde', 12, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(37, NULL, 'Alfalfa verde s/clasificar', 12, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(38, NULL, 'Algarrobo', 13, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(39, NULL, 'Algarrobo s/clasificar', 13, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(40, NULL, 'Alpiste', 14, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(41, NULL, 'Alpiste s/clasificar', 14, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(42, NULL, 'Alpiste ornamental (manojo)', 14, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(43, NULL, 'Alpiste ornamental (manojo) s/clasificar', 14, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(44, NULL, 'Alpiste verde', 14, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(45, NULL, 'Alpiste verde s/clasificar', 14, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(46, NULL, 'Amaranto', 15, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(47, NULL, 'Amaranto s/clasificar', 15, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(48, NULL, 'Anís', 16, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(49, NULL, 'Anís s/clasificar', 16, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(50, NULL, 'Apio', 17, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(51, NULL, 'Apio exportación', 17, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(52, NULL, 'Apio malla sombra', 17, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(53, NULL, 'Apio orgánico', 17, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(54, NULL, 'Apio s/clasificar', 17, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(55, NULL, 'Arrayán', 18, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(56, NULL, 'Arrayán s/clasificar', 18, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(57, NULL, 'Arándano', 19, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(58, NULL, 'Arándano azul (blueberry)', 19, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(59, NULL, 'Arándano azul (blueberry) macro túnel', 19, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(60, NULL, 'Arándano azul (blueberry) macro túnel orgánico', 19, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(61, NULL, 'Arándano azul (blueberry) malla sombra', 19, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(62, NULL, 'Arándano azul (blueberry) orgánico', 19, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(63, NULL, 'Arándano moras', 19, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(64, NULL, 'Baby back choi', 20, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(65, NULL, 'Baby back choi s/clasificar', 20, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(66, NULL, 'Bangaña', 21, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(67, NULL, 'Bangaña s/clasificar', 21, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(68, NULL, 'Berenjena', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(69, NULL, 'Berenjena exportación', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(70, NULL, 'Berenjena invernadero', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(71, NULL, 'Berenjena macro túnel', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(72, NULL, 'Berenjena malla sombra', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(73, NULL, 'Berenjena orgánico', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(74, NULL, 'Berenjena orgánico exportación', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(75, NULL, 'Berenjena s/clasificar', 22, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(76, NULL, 'Betabel', 23, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(77, NULL, 'Betabel exportación', 23, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(78, NULL, 'Betabel orgánico', 23, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(79, NULL, 'Betabel s/clasificar', 23, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(80, NULL, 'Brócoli', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(81, NULL, 'Brócoli broccolette orgánico', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(82, NULL, 'Brócoli broccolette orgánico exportación', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(83, NULL, 'Brócoli chino', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(84, NULL, 'Brócoli exportación', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(85, NULL, 'Brócoli invernadero', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(86, NULL, 'Brócoli malla sombra', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(87, NULL, 'Brócoli orgánico', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(88, NULL, 'Brócoli orgánico exportación', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(89, NULL, 'Brócoli s/clasificar', 24, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(90, NULL, 'Cacahuate', 25, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(91, NULL, 'Cacahuate s/clasificar', 25, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(92, NULL, 'Cacao', 26, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(93, NULL, 'Cacao orgánico', 26, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(94, NULL, 'Cacao s/clasificar', 26, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(95, NULL, 'Café cereza', 27, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(96, NULL, 'Café cereza arábiga orgánico', 27, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(97, NULL, 'Café cereza orgánico', 27, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(98, NULL, 'Café cereza robusta', 27, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(99, NULL, 'Café cereza s/clasificar', 27, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(100, NULL, 'Caimito', 28, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(101, NULL, 'Caimito s/clasificar', 28, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(102, NULL, 'Calabacita', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(103, NULL, 'Calabacita criolla', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(104, NULL, 'Calabacita italiana (zucchini)', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(105, NULL, 'Calabacita italiana (zucchini) exportación', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(106, NULL, 'Calabacita italiana (zucchini) invernadero', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(107, NULL, 'Calabacita italiana (zucchini) invernadero exportación', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(108, NULL, 'Calabacita italiana (zucchini) malla sombra', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(109, NULL, 'Calabacita italiana (zucchini) orgánico', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(110, NULL, 'Calabacita italiana (zucchini) orgánico exportación', 29, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(111, NULL, 'Calabaza', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(112, NULL, 'Calabaza butter (buchona)', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(113, NULL, 'Calabaza butter (buchona) exportación', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(114, NULL, 'Calabaza butter (buchona) orgánico exportación', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(115, NULL, 'Calabaza criolla', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(116, NULL, 'Calabaza de castilla', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(117, NULL, 'Calabaza de castilla exportación', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(118, NULL, 'Calabaza kabocha', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(119, NULL, 'Calabaza kabocha exportación', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(120, NULL, 'Calabaza kabocha orgánico exportación', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(121, NULL, 'Calabaza spaguetti', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(122, NULL, 'Calabaza spaguetti exportación', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(123, NULL, 'Calabaza spaguetti orgánico exportación', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(124, NULL, 'Calabaza semilla o chihua', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(125, NULL, 'Calabaza semilla o chihua s/clasificar', 30, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(126, NULL, 'Camote', 31, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(127, NULL, 'Camote s/clasificar', 31, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(128, NULL, 'Capulín', 32, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(129, NULL, 'Capulín s/clasificar', 32, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(130, NULL, 'Carambolo', 33, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(131, NULL, 'Carambolo s/clasificar', 33, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(132, NULL, 'Caña de azúcar', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(133, NULL, 'Caña de azúcar industrial', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(134, NULL, 'Caña de azúcar industrial orgánico', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(135, NULL, 'Caña de azúcar forrajera', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(136, NULL, 'Caña de azúcar forrajera s/clasificar', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(137, NULL, 'Caña de azúcar fruta', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(138, NULL, 'Caña de azúcar fruta s/clasificar', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(139, NULL, 'Caña de azúcar piloncillo', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(140, NULL, 'Caña de azúcar piloncillo orgánico', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(141, NULL, 'Caña de azúcar piloncillo s/clasificar', 34, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(142, NULL, 'Cebolla', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(143, NULL, 'Cebolla amarilla', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(144, NULL, 'Cebolla amarilla exportación', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(145, NULL, 'Cebolla blanca', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(146, NULL, 'Cebolla blanca exportación', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(147, NULL, 'Cebolla blanca invernadero', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(148, NULL, 'Cebolla blanca malla sombra', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(149, NULL, 'Cebolla cambray', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(150, NULL, 'Cebolla morada', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(151, NULL, 'Cebolla morada exportación', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(152, NULL, 'Cebolla morada macro túnel', 35, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(153, NULL, 'Cebollín chino', 36, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(154, NULL, 'Cebollín exportación', 36, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(155, NULL, 'Cebollín orgánico exportación', 36, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(156, NULL, 'Cebollín s/clasificar', 36, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(157, NULL, 'Cereza', 37, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(158, NULL, 'Cereza guinda', 37, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(159, NULL, 'Chabacano', 38, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(160, NULL, 'Chabacano s/clasificar', 38, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(161, NULL, 'Chay', 39, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(162, NULL, 'Chay orgánico', 39, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(163, NULL, 'Chayote', 40, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(164, NULL, 'Chayote s/clasificar', 40, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(165, NULL, 'Chía', 41, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(166, NULL, 'Chía s/clasificar', 41, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(167, NULL, 'Chícharo', 42, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(168, NULL, 'Chícharo exportación', 42, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(169, NULL, 'Chícharo malla sombra', 42, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(170, NULL, 'Chícharo orgánico', 42, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(171, NULL, 'Chícharo s/clasificar', 42, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(172, NULL, 'Chícharo macro túnel', 42, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(173, NULL, 'Chilacayote', 43, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(174, NULL, 'Chilacayote s/clasificar', 43, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(175, NULL, 'Chile seco', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(176, NULL, 'Chile seco ancho', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(177, NULL, 'Chile seco colorado', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(178, NULL, 'Chile seco costeño', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(179, NULL, 'Chile seco de árbol (cola de rata)', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(180, NULL, 'Chile seco guajillo', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(181, NULL, 'Chile seco mirasol', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(182, NULL, 'Chile seco mulato', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(183, NULL, 'Chile seco pasilla', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(184, NULL, 'Chile seco puya', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(185, NULL, 'Chile seco tabaquero', 44, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(186, NULL, 'Chile verde', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(187, NULL, 'Chile verde anaheim', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(188, NULL, 'Chile verde anaheim invernadero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(189, NULL, 'Chile verde anaheim malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(190, NULL, 'Chile verde banana', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(191, NULL, 'Chile verde caloro', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(192, NULL, 'Chile verde caloro malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(193, NULL, 'Chile verde cayene', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(194, NULL, 'Chile verde cayene malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(195, NULL, 'Chile verde chilaca', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(196, NULL, 'Chile verde chilaca malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(197, NULL, 'Chile verde chiltepín', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(198, NULL, 'Chile verde costeño', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(199, NULL, 'Chile verde cristal', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(200, NULL, 'Chile verde de agua', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(201, NULL, 'Chile verde de árbol (cola de rata)', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(202, NULL, 'Chile verde guajillo', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(203, NULL, 'Chile verde habanero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(204, NULL, 'Chile verde habanero invernadero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(205, NULL, 'Chile verde habanero malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(206, NULL, 'Chile verde hungaro (x-cat-ik)', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(207, NULL, 'Chile verde hungaro (x-cat-ik) macro túnel', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(208, NULL, 'Chile verde hungaro (x-cat-ik) malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(209, NULL, 'Chile verde jalapeño', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(210, NULL, 'Chile verde jalapeño exportación', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(211, NULL, 'Chile verde jalapeño invernadero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(212, NULL, 'Chile verde jalapeño macro túnel', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(213, NULL, 'Chile verde jalapeño malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(214, NULL, 'Chile verde jalapeño orgánico', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(215, NULL, 'Chile verde manzano', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(216, NULL, 'Chile verde manzano invernadero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(217, NULL, 'Chile verde mirasol', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(218, NULL, 'Chile verde morrón (bell pepper)', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(219, NULL, 'Chile verde morrón (bell pepper) exportación', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(220, NULL, 'Chile verde morrón (bell pepper) invernadero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(221, NULL, 'Chile verde morrón (bell pepper) invernadero exportación', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(222, NULL, 'Chile verde morrón (bell pepper) malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(223, NULL, 'Chile verde morrón (bell pepper) malla sombra exportación', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(224, NULL, 'Chile verde morrón (bell pepper) orgánico', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(225, NULL, 'Chile verde paprika', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(226, NULL, 'Chile verde perón', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(227, NULL, 'Chile verde piquín', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(228, NULL, 'Chile verde poblano', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(229, NULL, 'Chile verde poblano invernadero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(230, NULL, 'Chile verde poblano macro túnel', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(231, NULL, 'Chile verde poblano malla sombra', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(232, NULL, 'Chile verde puya', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(233, NULL, 'Chile verde regional', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(234, NULL, 'Chile verde serrano', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(235, NULL, 'Chile verde serrano exportación', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(236, NULL, 'Chile verde serrano invernadero', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(237, NULL, 'Chile verde serrano orgánico', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(238, NULL, 'Chile verde soledad', 45, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(239, NULL, 'Chirimoya', 46, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(240, NULL, 'Chirimoya s/clasificar', 46, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(241, NULL, 'Chives', 47, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(242, NULL, 'Chives invernadero', 47, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(243, NULL, 'Chives orgánico', 47, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(244, NULL, 'Cilantro', 48, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(245, NULL, 'Cilantro exportación', 48, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(246, NULL, 'Cilantro malla sombra', 48, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(247, NULL, 'Cilantro orgánico', 48, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(248, NULL, 'Cilantro s/clasificar', 48, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(249, NULL, 'Ciruela', 49, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(250, NULL, 'Ciruela de almendra', 49, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(251, NULL, 'Ciruela del país', 49, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(252, NULL, 'Ciruela del país orgánico', 49, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(253, NULL, 'Ciruela española', 49, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(254, NULL, 'Coco fruta', 50, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(255, NULL, 'Coco fruta s/clasificar', 50, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(256, NULL, 'Col (repollo)', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(257, NULL, 'Col (repollo) blanca', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(258, NULL, 'Col (repollo) blanca invernadero', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(259, NULL, 'Col (repollo) morada', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(260, NULL, 'Col (repollo) morada orgánico', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(261, NULL, 'Col de bruselas', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(262, NULL, 'Col de bruselas exportación', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(263, NULL, 'Col de bruselas orgánico', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(264, NULL, 'Col de bruselas s/clasificar', 51, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(265, NULL, 'Coliflor', 52, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(266, NULL, 'Coliflor exportación', 52, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(267, NULL, 'Coliflor malla sombra', 52, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(268, NULL, 'Coliflor s/clasificar', 52, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(269, NULL, 'Comino', 53, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(270, NULL, 'Comino s/clasificar', 53, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(271, NULL, 'Copra', 54, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(272, NULL, 'Copra orgánico', 54, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(273, NULL, 'Copra s/clasificar', 54, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(274, NULL, 'Coquia', 55, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(275, NULL, 'Coquia s/clasificar', 55, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(276, NULL, 'Dátil', 56, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(277, NULL, 'Dátil exportación', 56, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(278, NULL, 'Dátil s/clasificar', 56, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(279, NULL, 'Durazno', 57, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(280, NULL, 'Durazno arkansas', 57, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(281, NULL, 'Durazno criollo', 57, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(282, NULL, 'Durazno diamante', 57, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(283, NULL, 'Durazno escarcha', 57, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(284, NULL, 'Durazno oro', 57, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(285, NULL, 'Durazno s/clasificar', 57, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(286, NULL, 'Ejote', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(287, NULL, 'Ejote exportación', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(288, NULL, 'Ejote malla sombra', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(289, NULL, 'Ejote orgánico', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(290, NULL, 'Ejote s/clasificar', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(291, NULL, 'Elote', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(292, NULL, 'Elote amarillo', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(293, NULL, 'Elote s/clasificar', 58, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(294, NULL, 'Epazote', 59, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(295, NULL, 'Epazote invernadero', 59, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(296, NULL, 'Epazote s/clasificar', 59, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(297, NULL, 'Espárrago', 60, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(298, NULL, 'Espárrago exportación', 60, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(299, NULL, 'Espárrago orgánico', 60, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(300, NULL, 'Espárrago s/clasificar', 60, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(301, NULL, 'Especias y medicinales', 61, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(302, NULL, 'Especias y medicinales invernadero', 61, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(303, NULL, 'Especias y medicinales invernadero orgánico', 61, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(304, NULL, 'Especias y medicinales s/clasificar', 61, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(305, NULL, 'Espinaca', 62, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(306, NULL, 'Espinaca exportación', 62, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(307, NULL, 'Espinaca orgánico', 62, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(308, NULL, 'Espinaca s/clasificar', 62, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(309, NULL, 'Frambuesa', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(310, NULL, 'Frambuesa exportación', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(311, NULL, 'Frambuesa invernadero', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(312, NULL, 'Frambuesa macro túnel', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(313, NULL, 'Frambuesa macro túnel orgánico', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(314, NULL, 'Frambuesa malla sombra', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(315, NULL, 'Frambuesa orgánico', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(316, NULL, 'Frambuesa orgánico exportación', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(317, NULL, 'Frambuesa s/clasificar', 63, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(318, NULL, 'Fresa', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(319, NULL, 'Fresa exportación', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(320, NULL, 'Fresa invernadero', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(321, NULL, 'Fresa macro túnel', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(322, NULL, 'Fresa malla sombra', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(323, NULL, 'Fresa malla sombra exportación', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(324, NULL, 'Fresa orgánico', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(325, NULL, 'Fresa orgánico exportación', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(326, NULL, 'Fresa s/clasificar', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(327, NULL, 'Fresa (planta)', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(328, NULL, 'Fresa (planta) s/clasificar', 64, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(329, NULL, 'Gai lan (kay laan)', 65, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(330, NULL, 'Gai lan (kay laan) s/clasificar', 65, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(331, NULL, 'Garbanzo forrajero', 66, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(332, NULL, 'Garbanzo forrajero s/clasificar', 66, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(333, NULL, 'Garbanzo grano', 66, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(334, NULL, 'Garbanzo grano blanco', 66, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(335, NULL, 'Garbanzo grano blanco exportación', 66, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(336, NULL, 'Garbanzo porquero', 66, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(337, NULL, 'Garbanzo porquero s/clasificar', 66, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(338, NULL, 'Granada', 67, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(339, NULL, 'Granada china', 67, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(340, NULL, 'Granada roja', 67, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(341, NULL, 'Granada roja exportación', 67, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(342, NULL, 'Guaje', 68, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(343, NULL, 'Guaje s/clasificar', 68, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(344, NULL, 'Guamúchil', 69, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(345, NULL, 'Guamúchil s/clasificar', 69, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(346, NULL, 'Guanábana', 70, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(347, NULL, 'Guanábana s/clasificar', 70, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(348, NULL, 'Guayaba', 71, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(349, NULL, 'Guayaba china', 71, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(350, NULL, 'Guayaba criolla', 71, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(351, NULL, 'Guayaba media china', 71, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(352, NULL, 'Guayaba media china exportación', 71, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(353, NULL, 'Haba grano', 72, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(354, NULL, 'Haba grano s/clasificar', 72, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(355, NULL, 'Haba verde', 72, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(356, NULL, 'Haba verde s/clasificar', 72, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(357, NULL, 'Henequén', 73, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(358, NULL, 'Henequén s/clasificar', 73, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(359, NULL, 'Henequén verde', 73, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(360, NULL, 'Hierbabuena', 74, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(361, NULL, 'Hierbabuena s/clasificar', 74, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(362, NULL, 'Higo', 75, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(363, NULL, 'Higo blanco', 75, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(364, NULL, 'Higo negro', 75, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(365, NULL, 'Higuerilla', 76, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(366, NULL, 'Higuerilla s/clasificar', 76, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(367, NULL, 'Hongos, setas y champiñones', 77, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(368, NULL, 'Hongos champiñones invernadero', 77, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(369, NULL, 'Hongos champiñones invernadero exportación', 77, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(370, NULL, 'Hongos setas invernadero', 77, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(371, NULL, 'Hongos setas invernadero orgánico', 77, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(372, NULL, 'Huauzontle', 78, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(373, NULL, 'Huauzontle s/clasificar', 78, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(374, NULL, 'Jaca (jackfruit)', 79, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(375, NULL, 'Jaca (jackfruit) s/clasificar', 79, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(376, NULL, 'Jamaica', 80, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(377, NULL, 'Jamaica orgánico', 80, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(378, NULL, 'Jamaica s/clasificar', 80, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(379, NULL, 'Jatropha', 81, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(380, NULL, 'Jatropha s/clasificar', 81, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(381, NULL, 'Jenjibre', 82, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(382, NULL, 'Jenjibre s/clasificar', 82, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(383, NULL, 'Jícama', 83, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(384, NULL, 'Jícama s/clasificar', 83, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(385, NULL, 'Kale', 84, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(386, NULL, 'Kale exportación', 84, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(387, NULL, 'Kale s/clasificar', 84, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(388, NULL, 'Kohlrabi', 85, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(389, NULL, 'Kohlrabi s/clasificar', 85, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(390, NULL, 'Lechuga', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(391, NULL, 'Lechuga baby', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(392, NULL, 'Lechuga baby leaf orgánico', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(393, NULL, 'Lechuga escarola', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(394, NULL, 'Lechuga orejona', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(395, NULL, 'Lechuga romana', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(396, NULL, 'Lechuga romana invernadero', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(397, NULL, 'Lechuga romana invernadero orgánico', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(398, NULL, 'Lechuga romana malla sombra', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(399, NULL, 'Lechuga romana orgánico', 86, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(400, NULL, 'Lima', 87, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(401, NULL, 'Lima s/clasificar', 87, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(402, NULL, 'Limón', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(403, NULL, 'Limón agrio (mexicano)', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(404, NULL, 'Limón agrio (mexicano) orgánico', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(405, NULL, 'Limón italiano', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(406, NULL, 'Limón italiano orgánico', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(407, NULL, 'Limón persa', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(408, NULL, 'Limón persa exportación', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(409, NULL, 'Limón persa orgánico', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(410, NULL, 'Limón real', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(411, NULL, 'Limón real s/clasificar', 88, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(412, NULL, 'Litchi', 89, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(413, NULL, 'Litchi orgánico', 89, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(414, NULL, 'Litchi s/clasificar', 89, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(415, NULL, 'Macadamia', 90, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(416, NULL, 'Macadamia s/clasificar', 90, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(417, NULL, 'Maguey', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(418, NULL, 'Maguey penca', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(419, NULL, 'Maguey forrajero', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(420, NULL, 'Maguey forrajero s/clasificar', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(421, NULL, 'Maguey mixiotero', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(422, NULL, 'Maguey mixiotero s/clasificar', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(423, NULL, 'Maguey pulquero (miles de lts.)', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(424, NULL, 'Maguey pulquero (miles de lts.) aguamiel', 91, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(425, NULL, 'Malanga', 92, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(426, NULL, 'Malanga s/clasificar', 92, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(427, NULL, 'Mamey', 93, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(428, NULL, 'Mamey s/clasificar', 93, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(429, NULL, 'Mandarina', 94, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(430, NULL, 'Mandarina criolla', 94, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(431, NULL, 'Mandarina dancy', 94, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(432, NULL, 'Mandarina fairchild', 94, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(433, NULL, 'Mandarina fremont', 94, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(434, NULL, 'Mandarina murcot', 94, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(435, NULL, 'Mango', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(436, NULL, 'Mango ataulfo', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(437, NULL, 'Mango ataulfo orgánico', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(438, NULL, 'Mango criollo', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(439, NULL, 'Mango diplomático', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(440, NULL, 'Mango haden', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(441, NULL, 'Mango haden orgánico', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(442, NULL, 'Mango keitt', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(443, NULL, 'Mango keitt orgánico', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(444, NULL, 'Mango kent', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(445, NULL, 'Mango kent orgánico', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(446, NULL, 'Mango manila', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(447, NULL, 'Mango manililla', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(448, NULL, 'Mango obo', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(449, NULL, 'Mango oro', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(450, NULL, 'Mango paraíso (petacón)', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(451, NULL, 'Mango tommy atkins', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(452, NULL, 'Mango tommy atkins orgánico', 95, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(453, NULL, 'Mangostán', 96, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(454, NULL, 'Mangostán s/clasificar', 96, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(455, NULL, 'Manzana', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(456, NULL, 'Manzana anna', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(457, NULL, 'Manzana criolla', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(458, NULL, 'Manzana gala', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(459, NULL, 'Manzana golden delicious', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(460, NULL, 'Manzana golden delicious malla sombra', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(461, NULL, 'Manzana golden delicious orgánico', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(462, NULL, 'Manzana red chief', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(463, NULL, 'Manzana red delicious', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(464, NULL, 'Manzana red delicious malla sombra', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(465, NULL, 'Manzana rome beauty', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(466, NULL, 'Manzana starking', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(467, NULL, 'Manzana starking delicious', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(468, NULL, 'Manzana top red', 97, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(469, NULL, 'Manzanilla', 98, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(470, NULL, 'Manzanilla s/clasificar', 98, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(471, NULL, 'Maracuyá', 99, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(472, NULL, 'Maracuyá s/clasificar', 99, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(473, NULL, 'Marañón', 100, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(474, NULL, 'Marañón orgánico', 100, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(475, NULL, 'Marañón s/clasificar', 100, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(476, NULL, 'Melón', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(477, NULL, 'Melón cantaloupe', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(478, NULL, 'Melón cantaloupe exportación', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(479, NULL, 'Melón cantaloupe orgánico exportación', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(480, NULL, 'Melón valenciano (honey dew)', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(481, NULL, 'Melón valenciano (honey dew) exportación', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(482, NULL, 'Melón valenciano (honey dew) malla sombra', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(483, NULL, 'Melón valenciano (honey dew) orgánico exportación', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(484, NULL, 'Melón amargo', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(485, NULL, 'Melón amargo s/clasificar', 101, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(486, NULL, 'Membrillo', 102, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(487, NULL, 'Membrillo s/clasificar', 102, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(488, NULL, 'Menta', 103, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(489, NULL, 'Menta invernadero', 103, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(490, NULL, 'Menta orgánico', 103, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(491, NULL, 'Menta s/clasificar', 103, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(492, NULL, 'Mijo', 104, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(493, NULL, 'Mijo s/clasificar', 104, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(494, NULL, 'Moringa', 105, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(495, NULL, 'Moringa orgánico', 105, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(496, NULL, 'Moringa s/clasificar', 105, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(497, NULL, 'Nabo', 106, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(498, NULL, 'Nabo s/clasificar', 106, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(499, NULL, 'Nabo forrajero', 106, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(500, NULL, 'Nabo forrajero s/clasificar', 106, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(501, NULL, 'Nanche', 107, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(502, NULL, 'Nanche s/clasificar', 107, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(503, NULL, 'Napa', 108, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(504, NULL, 'Napa s/clasificar', 108, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(505, NULL, 'Naranja', 109, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(506, NULL, 'Naranja agria (washington navel)', 109, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(507, NULL, 'Naranja criolla', 109, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(508, NULL, 'Naranja hamlin', 109, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(509, NULL, 'Naranja marrs', 109, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(510, NULL, 'Naranja valencia', 109, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL);
INSERT INTO `ctl_variedadesproducto` (`nVariedadProducto`, `cClave`, `cDescripcion`, `nProducto`, `bActivo`, `cUsuario_Registro`, `dFecha_Registro`, `cUsuario_UltimaModificacion`, `dFecha_UltimaModificacion`, `cUsuario_Eliminacion`, `dFecha_Eliminacion`) VALUES
(511, NULL, 'Níspero', 110, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(512, NULL, 'Níspero s/clasificar', 110, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(513, NULL, 'Noni', 111, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(514, NULL, 'Noni s/clasificar', 111, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(515, NULL, 'Nopal forrajero', 112, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(516, NULL, 'Nopal forrajero s/clasificar', 112, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(517, NULL, 'Nopalitos', 113, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(518, NULL, 'Nopalitos invernadero', 113, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(519, NULL, 'Nopalitos macro túnel', 113, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(520, NULL, 'Nopalitos orgánico', 113, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(521, NULL, 'Nopalitos s/clasificar', 113, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(522, NULL, 'Nuez', 114, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(523, NULL, 'Nuez criolla', 114, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(524, NULL, 'Nuez de castilla s/clasificar', 114, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(525, NULL, 'Nuez encarcelada (pecanera)', 114, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(526, NULL, 'Okra (angú o gombo)', 115, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(527, NULL, 'Okra (angú o gombo) exportación', 115, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(528, NULL, 'Okra (angú o gombo) s/clasificar', 115, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(529, NULL, 'Orégano', 116, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(530, NULL, 'Orégano invernadero', 116, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(531, NULL, 'Orégano orgánico', 116, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(532, NULL, 'Orégano s/clasificar', 116, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(533, NULL, 'Papa', 117, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(534, NULL, 'Papa alpha (blanca)', 117, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(535, NULL, 'Papa criolla', 117, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(536, NULL, 'Papa fianna (blanca)', 117, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(537, NULL, 'Pápalo', 118, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(538, NULL, 'Pápalo s/clasificar', 118, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(539, NULL, 'Papaya', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(540, NULL, 'Papaya amarilla', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(541, NULL, 'Papaya criolla', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(542, NULL, 'Papaya hawaiana', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(543, NULL, 'Papaya maradol', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(544, NULL, 'Papaya maradol invernadero', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(545, NULL, 'Papaya maradol orgánico', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(546, NULL, 'Papaya roja', 119, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(547, NULL, 'Pepino americano chino', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(548, NULL, 'Pepino americano chino exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(549, NULL, 'Pepino americano chino invernadero', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(550, NULL, 'Pepino americano chino invernadero orgánico', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(551, NULL, 'Pepino americano chino macro túnel', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(552, NULL, 'Pepino americano chino malla sombra', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(553, NULL, 'Pepino americano chino malla sombra exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(554, NULL, 'Pepino americano macro túnel orgánico', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(555, NULL, 'Pepino americano malla sombra orgánico exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(556, NULL, 'Pepino blanco', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(557, NULL, 'Pepino blanco invernadero', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(558, NULL, 'Pepino europeo', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(559, NULL, 'Pepino europeo invernadero', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(560, NULL, 'Pepino europeo invernadero exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(561, NULL, 'Pepino europeo malla sombra', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(562, NULL, 'Pepino europeo malla sombra exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(563, NULL, 'Pepino persa invernadero', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(564, NULL, 'Pepino persa invernadero exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(565, NULL, 'Pepino persa malla sombra', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(566, NULL, 'Pepino persa malla sombra exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(567, NULL, 'Pepino pickle', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(568, NULL, 'Pepino pickle exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(569, NULL, 'Pepino pickle invernadero', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(570, NULL, 'Pepino pickle malla sombra', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(571, NULL, 'Pepino pickle malla sombra exportación', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(572, NULL, 'Pepino pickle orgánico', 120, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(573, NULL, 'Pera', 121, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(574, NULL, 'Pera orgánico', 121, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(575, NULL, 'Pera s/clasificar', 121, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(576, NULL, 'Perejil', 122, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(577, NULL, 'Perejil exportación', 122, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(578, NULL, 'Perejil s/clasificar', 122, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(579, NULL, 'Perón', 123, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(580, NULL, 'Perón s/clasificar', 123, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(581, NULL, 'Persimonio', 124, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(582, NULL, 'Persimonio s/clasificar', 124, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(583, NULL, 'Pimienta', 125, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(584, NULL, 'Pimienta s/clasificar', 125, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(585, NULL, 'Pimienta verde', 125, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(586, NULL, 'Pipicha', 126, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(587, NULL, 'Pipicha s/clasificar', 126, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(588, NULL, 'Pistache', 127, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(589, NULL, 'Pistache s/clasificar', 127, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(590, NULL, 'Pitahaya', 128, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(591, NULL, 'Pitahaya s/clasificar', 128, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(592, NULL, 'Pitaya', 128, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(593, NULL, 'Pitaya criolla', 128, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(594, NULL, 'Pitaya de mayo', 128, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(595, NULL, 'Pitaya s/clasificar', 128, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(596, NULL, 'Piña', 129, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(597, NULL, 'Piña cayena lisa', 129, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(598, NULL, 'Piña criolla', 129, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(599, NULL, 'Piña esmeralda', 129, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(600, NULL, 'Piña md2 hibrido', 129, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(601, NULL, 'Piñón', 130, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(602, NULL, 'Piñón s/clasificar', 130, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(603, NULL, 'Plátano', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(604, NULL, 'Plátano criollo', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(605, NULL, 'Plátano dominico', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(606, NULL, 'Plátano enano gigante', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(607, NULL, 'Plátano enano gigante orgánico', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(608, NULL, 'Plátano macho', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(609, NULL, 'Plátano manzano', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(610, NULL, 'Plátano morado', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(611, NULL, 'Plátano pera', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(612, NULL, 'Plátano tabasco', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(613, NULL, 'Plátano thai', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(614, NULL, 'Plátano valery', 131, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(615, NULL, 'Poro (leek)', 132, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(616, NULL, 'Poro (leek) exportación', 132, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(617, NULL, 'Poro (leek) s/clasificar', 132, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(618, NULL, 'Quelite', 133, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(619, NULL, 'Quelite s/clasificar', 133, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(620, NULL, 'Rábano', 134, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(621, NULL, 'Rabanito', 134, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(622, NULL, 'Rabanito exportación', 134, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(623, NULL, 'Rabanito orgánico', 134, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(624, NULL, 'Rábano s/clasificar', 134, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(625, NULL, 'Rambután', 135, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(626, NULL, 'Rambután exportación', 135, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(627, NULL, 'Rambután orgánico', 135, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(628, NULL, 'Rambután s/clasificar', 135, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(629, NULL, 'Rapini', 136, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(630, NULL, 'Rapini s/clasificar', 136, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(631, NULL, 'Romerito', 137, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(632, NULL, 'Romerito s/clasificar', 137, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(633, NULL, 'Romero', 138, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(634, NULL, 'Romero orgánico', 138, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(635, NULL, 'Romero s/clasificar', 138, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(636, NULL, 'Sábila', 139, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(637, NULL, 'Sábila orgánico', 139, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(638, NULL, 'Sábila s/clasificar', 139, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(639, NULL, 'Salvia', 140, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(640, NULL, 'Salvia orgánico', 140, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(641, NULL, 'Salvia s/clasificar', 140, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(642, NULL, 'Sandía', 141, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(643, NULL, 'Sandía cambray (sangría)', 141, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(644, NULL, 'Sandía cambray (sangría) exportación', 141, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(645, NULL, 'Sandía cambray (sangría) orgánico exportación', 141, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(646, NULL, 'Sandía charleston (gray)', 141, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(647, NULL, 'Sandía verde (jubilie)', 141, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(648, NULL, 'Saramuyo', 142, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(649, NULL, 'Saramuyo s/clasificar', 142, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(650, NULL, 'Shangai-bock-choy', 143, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(651, NULL, 'Shangai-bock-choy s/clasificar', 143, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(652, NULL, 'Shop suey', 144, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(653, NULL, 'Shop suey s/clasificar', 144, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(654, NULL, 'Statice', 145, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(655, NULL, 'Statice s/clasificar', 145, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(656, NULL, 'Statice (manojo)', 145, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(657, NULL, 'Statice (manojo) s/clasificar', 145, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(658, NULL, 'Stevia', 146, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(659, NULL, 'Stevia s/clasificar', 146, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(660, NULL, 'Tabaco', 147, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(661, NULL, 'Tabaco s/clasificar', 147, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(662, NULL, 'Tamarindo', 148, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(663, NULL, 'Tamarindo s/clasificar', 148, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(664, NULL, 'Tangelo', 149, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(665, NULL, 'Tangelo s/clasificar', 149, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(666, NULL, 'Tangerina', 150, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(667, NULL, 'Tangerina s/clasificar', 150, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(668, NULL, 'Tarragón', 151, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(669, NULL, 'Tarragón invernadero', 151, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(670, NULL, 'Tarragón orgánico', 151, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(671, NULL, 'Té limón', 152, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(672, NULL, 'Té limón orgánico', 152, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(673, NULL, 'Té limón s/clasificar', 152, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(674, NULL, 'Tejocote', 153, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(675, NULL, 'Tejocote s/clasificar', 153, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(676, NULL, 'Tomate rojo (jitomate)', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(677, NULL, 'Tomate rojo (jitomate) bola', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(678, NULL, 'Tomate rojo (jitomate) bola exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(679, NULL, 'Tomate rojo (jitomate) bola invernadero', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(680, NULL, 'Tomate rojo (jitomate) bola invernadero exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(681, NULL, 'Tomate rojo (jitomate) bola invernadero orgánico exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(682, NULL, 'Tomate rojo (jitomate) bola malla sombra', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(683, NULL, 'Tomate rojo (jitomate) bola malla sombra exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(684, NULL, 'Tomate rojo (jitomate) bola orgánico', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(685, NULL, 'Tomate rojo (jitomate) cherry', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(686, NULL, 'Tomate rojo (jitomate) cherry exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(687, NULL, 'Tomate rojo (jitomate) cherry invernadero', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(688, NULL, 'Tomate rojo (jitomate) cherry invernadero exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(689, NULL, 'Tomate rojo (jitomate) cherry malla sombra', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(690, NULL, 'Tomate rojo (jitomate) cherry orgánico', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(691, NULL, 'Tomate rojo (jitomate) saladette', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(692, NULL, 'Tomate rojo (jitomate) saladette exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(693, NULL, 'Tomate rojo (jitomate) saladette invernadero', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(694, NULL, 'Tomate rojo (jitomate) saladette invernadero exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(695, NULL, 'Tomate rojo (jitomate) saladette invernadero orgánico', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(696, NULL, 'Tomate rojo (jitomate) saladette macro túnel', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(697, NULL, 'Tomate rojo (jitomate) saladette malla sombra', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(698, NULL, 'Tomate rojo (jitomate) saladette malla sombra exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(699, NULL, 'Tomate rojo (jitomate) saladette orgánico', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(700, NULL, 'Tomate rojo (jitomate) saladette rio grande', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(701, NULL, 'Tomate rojo (jitomate) saladette rio grande invernadero', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(702, NULL, 'Tomate rojo (jitomate) saladette roma', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(703, NULL, 'Tomate rojo (jitomate) saladette roma malla sombra exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(704, NULL, 'Tomate rojo (jitomate) uva invernadero', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(705, NULL, 'Tomate rojo (jitomate) uva invernadero exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(706, NULL, 'Tomate rojo (jitomate) uva malla sombra', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(707, NULL, 'Tomate rojo (jitomate) uva malla sombra exportación', 154, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(708, NULL, 'Tomate verde', 155, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(709, NULL, 'Tomate verde invernadero', 155, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(710, NULL, 'Tomate verde macro túnel', 155, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(711, NULL, 'Tomate verde orgánico', 155, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(712, NULL, 'Tomate verde s/clasificar', 155, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(713, NULL, 'Tomillo', 156, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(714, NULL, 'Tomillo orgánico', 156, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(715, NULL, 'Tomillo s/clasificar', 156, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(716, NULL, 'Toronja (pomelo)', 157, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(717, NULL, 'Toronja (pomelo) criolla', 157, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(718, NULL, 'Toronja (pomelo) doble roja', 157, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(719, NULL, 'Toronja (pomelo) marsh', 157, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(720, NULL, 'Toronja (pomelo) red blush', 157, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(721, NULL, 'Toronja (pomelo) ruby red', 157, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(722, NULL, 'Tuna', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(723, NULL, 'Tuna alfajayucan', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(724, NULL, 'Tuna amarilla', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(725, NULL, 'Tuna blanca burrón', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(726, NULL, 'Tuna blanca cristalina', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(727, NULL, 'Tuna criolla', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(728, NULL, 'Tuna pico chulo', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(729, NULL, 'Tuna roja', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(730, NULL, 'Tuna xoconoxtle', 158, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(731, NULL, 'Uva', 159, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(732, NULL, 'Uva fruta', 159, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(733, NULL, 'Uva fruta malla sombra', 159, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(734, NULL, 'Uva industrial', 159, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(735, NULL, 'Uva industrial orgánico', 159, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(736, NULL, 'Uva pasa', 159, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(737, NULL, 'Vainilla', 160, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(738, NULL, 'Vainilla verde', 160, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(739, NULL, 'Verdolaga', 161, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(740, NULL, 'Verdolaga s/clasificar', 161, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(741, NULL, 'Viveros de durazno (planta)', 162, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(742, NULL, 'Viveros de durazno (planta) s/clasificar', 162, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(743, NULL, 'Viveros de manzana (planta)', 162, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(744, NULL, 'Viveros de manzana (planta) s/clasificar', 162, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(745, NULL, 'Viveros de nuez (planta)', 162, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(746, NULL, 'Viveros de nuez (planta) s/clasificar', 162, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(747, NULL, 'Yu-choy', 163, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(748, NULL, 'Yu-choy s/clasificar', 163, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(749, NULL, 'Yuca alimenticia', 164, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(750, NULL, 'Yuca alimenticia s/clasificar', 164, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(751, NULL, 'Zanahoria', 165, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(752, NULL, 'Zanahoria baby', 165, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(753, NULL, 'Zanahoria emperador', 165, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(754, NULL, 'Zanahoria nantes', 165, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(755, NULL, 'Zapote', 166, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(756, NULL, 'Zapote blanco', 166, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(757, NULL, 'Zapote chico (chico zapote)', 166, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(758, NULL, 'Zapote negro', 166, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(759, NULL, 'Zapote chiclero', 166, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(760, NULL, 'Zapote chiclero s/clasificar', 166, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(761, NULL, 'Zapupe', 167, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(762, NULL, 'Zapupe s/clasificar', 167, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(763, NULL, 'Zarzamora', 168, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(764, NULL, 'Zarzamora exportación', 168, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(765, NULL, 'Zarzamora macro túnel', 168, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(766, NULL, 'Zarzamora malla sombra', 168, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(767, NULL, 'Zarzamora malla sombra exportación', 168, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(768, NULL, 'Zarzamora orgánico', 168, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(769, NULL, 'Zarzamora s/clasificar', 168, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(770, NULL, 'Bovino-Carne', 169, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(771, NULL, 'Bovino-Leche', 169, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(772, NULL, 'Porcino-Carne', 170, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(773, NULL, 'Ovino-Carne', 171, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(774, NULL, 'Caprino-Carne', 172, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(775, NULL, 'Caprino-Leche', 172, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(776, NULL, 'Ave-Carne', 173, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(777, NULL, 'Guajolote-Carne', 174, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(778, NULL, 'Ave-Huevo plato', 173, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(779, NULL, 'Abeja-Miel', 175, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(780, NULL, 'Arroz palay', 176, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(781, NULL, 'Arroz palay aztecas', 176, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(782, NULL, 'Arroz palay grueso milagro filipino', 176, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(783, NULL, 'Arroz palay grueso milagro filipino orgánico', 176, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(784, NULL, 'Arroz palay tipo morelos', 176, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(785, NULL, 'Arvejón', 177, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(786, NULL, 'Arvejón s/clasificar', 177, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(787, NULL, 'Avena forrajera en verde', 178, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(788, NULL, 'Avena forrajera en verde invernadero', 178, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(789, NULL, 'Avena forrajera en verde malla sombra', 178, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(790, NULL, 'Avena forrajera en verde orgánico', 178, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(791, NULL, 'Avena forrajera en verde s/clasificar', 178, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(792, NULL, 'Avena grano', 178, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(793, NULL, 'Avena grano s/clasificar', 178, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(794, NULL, 'Canola', 179, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(795, NULL, 'Canola s/clasificar', 179, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(796, NULL, 'Canola forrajera', 179, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(797, NULL, 'Canola forrajera s/clasificar', 179, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(798, NULL, 'Cártamo', 180, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(799, NULL, 'Cártamo orgánico', 180, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(800, NULL, 'Cártamo s/clasificar', 180, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(801, NULL, 'Cártamo forrajero en verde', 180, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(802, NULL, 'Cártamo forrajero en verde s/clasificar', 180, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(803, NULL, 'Cebada forrajera en verde', 181, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(804, NULL, 'Cebada forrajera en verde s/clasificar', 181, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(805, NULL, 'Cebada grano', 181, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(806, NULL, 'Cebada grano s/clasificar', 181, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(807, NULL, 'Centeno grano', 182, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(808, NULL, 'Centeno grano s/clasificar', 182, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(809, NULL, 'Frijol', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(810, NULL, 'Frijol alubia', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(811, NULL, 'Frijol ayocote', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(812, NULL, 'Frijol azufrado', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(813, NULL, 'Frijol bayo', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(814, NULL, 'Frijol bayo berrendo', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(815, NULL, 'Frijol cacahuate', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(816, NULL, 'Frijol canario', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(817, NULL, 'Frijol flor de junio', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(818, NULL, 'Frijol flor de mayo', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(819, NULL, 'Frijol garbancillo', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(820, NULL, 'Frijol marcela', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(821, NULL, 'Frijol mayocoba', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(822, NULL, 'Frijol negro jamapa', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(823, NULL, 'Frijol negro querétaro', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(824, NULL, 'Frijol negro san luis', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(825, NULL, 'Frijol negro veracruz', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(826, NULL, 'Frijol negro zacatecas', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(827, NULL, 'Frijol ojo de cabra', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(828, NULL, 'Frijol otros claros', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(829, NULL, 'Frijol otros de color', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(830, NULL, 'Frijol otros negros', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(831, NULL, 'Frijol peruano', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(832, NULL, 'Frijol pinto americano', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(833, NULL, 'Frijol pinto nacional', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(834, NULL, 'Frijol pinto saltillo', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(835, NULL, 'Frijol forrajero', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(836, NULL, 'Frijol forrajero', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(837, NULL, 'Frijol x pelón', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(838, NULL, 'Frijol x pelón s/clasificar', 183, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(839, NULL, 'Lenteja', 184, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(840, NULL, 'Lenteja s/clasificar', 184, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(841, NULL, 'Linaza', 185, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(842, NULL, 'Linaza s/clasificar', 185, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(843, NULL, 'Maíz forrajero en verde', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(844, NULL, 'Maíz forrajero en verde s/clasificar', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(845, NULL, 'Maíz grano', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(846, NULL, 'Maíz grano amarillo', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(847, NULL, 'Maíz grano azul', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(848, NULL, 'Maíz grano blanco', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(849, NULL, 'Maíz grano de color', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(850, NULL, 'Maíz grano pozolero', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(851, NULL, 'Maíz palomero', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(852, NULL, 'Maíz palomero s/clasificar', 186, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(853, NULL, 'Sorgo escobero', 187, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(854, NULL, 'Sorgo escobero s/clasificar', 187, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(855, NULL, 'Sorgo escobero verde', 187, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(856, NULL, 'Sorgo forrajero en verde', 187, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(857, NULL, 'Sorgo forrajero en verde s/clasificar', 187, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(858, NULL, 'Sorgo grano', 187, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(859, NULL, 'Sorgo grano s/clasificar', 187, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(860, NULL, 'Soya', 188, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(861, NULL, 'Soya s/clasificar', 188, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(862, NULL, 'Trigo forrajero verde', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(863, NULL, 'Trigo forrajero verde s/clasificar', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(864, NULL, 'Trigo grano', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(865, NULL, 'Trigo grano corto y tenaz', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(866, NULL, 'Trigo grano cristalino', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(867, NULL, 'Trigo grano fuerte', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(868, NULL, 'Trigo grano medio fuerte', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(869, NULL, 'Trigo grano suave', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(870, NULL, 'Trigo ornamental', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL),
(871, NULL, 'Trigo ornamental (manojo) s/clasificar', 189, 1, 'adsum', '2020-08-20 09:12:08', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `nLog` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) DEFAULT NULL COMMENT 'id de usuario relacionado al registro en caso de ser una acción especifica por un usuario',
  `nTipoAccion` tinyint(4) NOT NULL COMMENT 'acción relacionada al registro  1=Acceso 2=Pago Membresia',
  `cLog` varchar(8000) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'mensaje del log de acceso',
  `dFecha_Registro` datetime NOT NULL COMMENT 'fecha y hora del registro del log'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de log de Registros de transacciones';

-- --------------------------------------------------------

--
-- Table structure for table `reg_bitacorapagosmembresia`
--

CREATE TABLE `reg_bitacorapagosmembresia` (
  `nPago` int(11) NOT NULL COMMENT 'llave',
  `nMembresia` int(11) NOT NULL COMMENT 'id de membresia al que pertenece el pago',
  `nCantidad` int(11) NOT NULL COMMENT 'campo que indicaría la cantidad de periodos a pagar de un determinado tipo de membresia',
  `cMoneda` varchar(5) COLLATE latin1_general_ci NOT NULL COMMENT 'abreviatura de la moneda, valor determinado acorde a ISO 4217 para todas las divisas del mundo  ejem  MXN',
  `nImporte` decimal(18,2) NOT NULL COMMENT 'importe a pagar ',
  `nTipoCambio` decimal(18,2) NOT NULL COMMENT 'tipo de cambio relacionado al importe',
  `cIDCargo` varchar(100) COLLATE latin1_general_ci NOT NULL COMMENT 'id del cargo generado contenido en el JSON de la orden',
  `jOrden` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'campo en formato JSON con el que se realizó la petición, omitir la parte de datos de tarjeta con valores vacios' CHECK (json_valid(`jOrden`)),
  `bAplicado` tinyint(4) NOT NULL COMMENT 'campo que indica que el registro fue o no rechazado  valores 1=Aplicado 0=Rechazado',
  `bModo` tinyint(4) NOT NULL COMMENT 'indicador de si el cargo fue realizado en modo prueba o modo productivo  valores 0= Modo prueba 1=Modo Productivo',
  `cError` varchar(5000) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'en caso de error, guardar mensaje ocurrido',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla bitácora de pagos de membresias';

-- --------------------------------------------------------

--
-- Table structure for table `reg_membresias`
--

CREATE TABLE `reg_membresias` (
  `nMembresia` int(11) NOT NULL COMMENT 'llave',
  `nTipoMembresia` int(11) DEFAULT NULL COMMENT 'id del tipo de membresia que le corresponde',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id del usuario al que pertenece la membresia',
  `nFechaVigencia` int(11) NOT NULL COMMENT 'numero que representa a la vigencia de la membresia, seria un valor que represente la fecha en formato ISO  AAAAMMDDD  Ejemplo  20200508',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla registro de membresias de usuarios';

-- --------------------------------------------------------

--
-- Table structure for table `reg_productoscomprador`
--

CREATE TABLE `reg_productoscomprador` (
  `nProductoComprador` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id del usuario tipo productor al que pertene el registro',
  `nVariedadProducto` int(11) NOT NULL COMMENT 'id de la variedad del producto',
  `nProducto` int(11) NOT NULL COMMENT 'folio del producto relacionado al comprador',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de productos relacionados a los compradores y Distribuidores';

-- --------------------------------------------------------

--
-- Table structure for table `reg_productoscompradorimagenes`
--

CREATE TABLE `reg_productoscompradorimagenes` (
  `nImagenProducto` int(11) NOT NULL COMMENT 'llave',
  `nProductoComprador` int(11) NOT NULL COMMENT 'id del producto del comprador al que pertenecen la imagen',
  `aImagen` mediumblob NOT NULL COMMENT 'valor binario base 64 de la imagen guardada',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de imagenes de los productos de  los compradores y distribuidores';

-- --------------------------------------------------------

--
-- Table structure for table `reg_productosproductor`
--

CREATE TABLE `reg_productosproductor` (
  `nProductoProductor` int(11) NOT NULL COMMENT 'llave',
  `nIdUsuario` int(11) NOT NULL COMMENT 'id del usuario tipo productor al que pertene el registro',
  `nIDTipoProduccion` int(11) DEFAULT NULL COMMENT 'valor de id de un sector del tipos datos ''CNF_TiposProduccionProducto'', ira en vacio si sector de producto es procesado',
  `nVariedadProducto` int(11) NOT NULL COMMENT 'id de la variedad del producto',
  `nProducto` int(11) NOT NULL COMMENT 'folio del producto relacionado al productor',
  `cCalidad` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción de la calidad del producto indicado por el productor',
  `cCalibre` varchar(200) COLLATE latin1_general_ci NOT NULL COMMENT 'descripción del calibre del producto indicado por el productor',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de productos relacionados a los productores y comercializadores';

-- --------------------------------------------------------

--
-- Table structure for table `reg_productosproductorcertificaciones`
--

CREATE TABLE `reg_productosproductorcertificaciones` (
  `nCertificacion` int(11) NOT NULL COMMENT 'llave',
  `nProductoProductor` int(11) NOT NULL COMMENT 'id del producto de productor',
  `nCertificacionProducto` int(11) NOT NULL COMMENT 'id de la certificación que se asociará al producto del productor',
  `cCertificacion` varchar(500) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'en caso que campo de certificacion de producto sea Otros, este campo será guardado con los datos de texto abierto que indicó el productor',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de registro de certificaciones de productos de los productores';

-- --------------------------------------------------------

--
-- Table structure for table `reg_productosproductorcertificacionesarchivos`
--

CREATE TABLE `reg_productosproductorcertificacionesarchivos` (
  `nArchivoCertificacionProducto` int(11) NOT NULL COMMENT 'llave',
  `nCertificacion` int(11) NOT NULL COMMENT 'id de certifcación a la que pertenece el registro',
  `cReferenciaCertificado` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'campo que guarda el número o referencia del certificado',
  `cNombreArchivo` varchar(500) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre del archivo subido',
  `aArchivo` mediumblob NOT NULL COMMENT 'campo para guardar en formato binario el archivo de certificación indicado para un producto',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de archivos de certificaciones de los productos de los productores';

-- --------------------------------------------------------

--
-- Table structure for table `reg_productosproductorexportaciones`
--

CREATE TABLE `reg_productosproductorexportaciones` (
  `nProductoExportacion` int(11) NOT NULL COMMENT 'llave',
  `nProductoProductor` int(11) NOT NULL COMMENT 'producto de productor al que pertenece el registro',
  `nIDPaisExporta` int(11) NOT NULL COMMENT 'valor de id de un país al que se exporta el producto del tipos datos ''CNF_PaisesExportacion''',
  `nIDTiempoExportando` int(11) NOT NULL COMMENT 'valor de id del tiempo que se lleva exportando el producto del tipos datos ''CNF_TiempoExportando''',
  `nPorcentajeExportacion` decimal(18,2) NOT NULL COMMENT 'valor del porcentaje que exporta el productor del producto indicado del total de su producción',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de registros de los productos que el productor exporta';

-- --------------------------------------------------------

--
-- Table structure for table `reg_productosproductorimagenes`
--

CREATE TABLE `reg_productosproductorimagenes` (
  `nImagenProducto` int(11) NOT NULL COMMENT 'llave',
  `nProductoProductor` int(11) NOT NULL COMMENT 'id del producto del productor al que pertenecen la imagen',
  `aImagen` mediumblob NOT NULL COMMENT 'valor binario base 64 de la imagen guardada',
  `bActivo` tinyint(4) NOT NULL,
  `cUsuario_Registro` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `dFecha_Registro` datetime NOT NULL,
  `cUsuario_UltimaModificacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_UltimaModificacion` datetime DEFAULT NULL,
  `cUsuario_Eliminacion` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dFecha_Eliminacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='tabla de imagenes de los productos de  los productores y comercializadores';

-- --------------------------------------------------------

--
-- Table structure for table `variedadesproductos`
--

CREATE TABLE `variedadesproductos` (
  `Producto` text COLLATE latin1_general_ci DEFAULT NULL,
  `Variedad` text COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `base_usuarios`
--
ALTER TABLE `base_usuarios`
  ADD PRIMARY KEY (`nIdUsuario`);

--
-- Indexes for table `base_usuariosanexos`
--
ALTER TABLE `base_usuariosanexos`
  ADD PRIMARY KEY (`nIdUsuarioAnexo`),
  ADD KEY `FK_Base_UsuariosAnexos_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuariosanexoscomprador`
--
ALTER TABLE `base_usuariosanexoscomprador`
  ADD PRIMARY KEY (`nAnexoUsuario`),
  ADD KEY `FK_Base_UsuariosAnexosComprador_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuariosarchivosanexos`
--
ALTER TABLE `base_usuariosarchivosanexos`
  ADD PRIMARY KEY (`nIdUsuarioAnexo`),
  ADD KEY `FK_Base_UsuariosArchivosAnexos_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuarioscertificaciones`
--
ALTER TABLE `base_usuarioscertificaciones`
  ADD PRIMARY KEY (`nCertificacionUsuario`),
  ADD KEY `FK_Base_UsuariosCertificaciones_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuariosdatoscontactos`
--
ALTER TABLE `base_usuariosdatoscontactos`
  ADD PRIMARY KEY (`nContactoUsuario`),
  ADD KEY `FK_Base_UsuariosDatosContactos_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuariosestadoscuenta`
--
ALTER TABLE `base_usuariosestadoscuenta`
  ADD PRIMARY KEY (`nEstadoCuenta`),
  ADD KEY `FK_Base_UsuariosEstadosCuenta_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuariosinformacioncrediticia`
--
ALTER TABLE `base_usuariosinformacioncrediticia`
  ADD PRIMARY KEY (`nInformacionCrediticia`),
  ADD KEY `FK_Base_UsuariosInformacionCrediticia_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuariosorganizaciones`
--
ALTER TABLE `base_usuariosorganizaciones`
  ADD PRIMARY KEY (`nOrganizacion`),
  ADD KEY `FK_Base_UsuariosOrganizaciones_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `base_usuariossocios`
--
ALTER TABLE `base_usuariossocios`
  ADD PRIMARY KEY (`nSocio`),
  ADD KEY `FK_Base_UsuariosSocios_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `cnf_configuracioncorreo`
--
ALTER TABLE `cnf_configuracioncorreo`
  ADD PRIMARY KEY (`nConfiguracion`);

--
-- Indexes for table `cnf_plantillascorreo`
--
ALTER TABLE `cnf_plantillascorreo`
  ADD PRIMARY KEY (`nPlantilla`);

--
-- Indexes for table `conf_parametrosadministrados`
--
ALTER TABLE `conf_parametrosadministrados`
  ADD PRIMARY KEY (`cContexto`,`cParametroAdministrado`);

--
-- Indexes for table `conf_tiposdatos`
--
ALTER TABLE `conf_tiposdatos`
  ADD PRIMARY KEY (`nTipoDato`);

--
-- Indexes for table `ctl_certificacionesproductos`
--
ALTER TABLE `ctl_certificacionesproductos`
  ADD PRIMARY KEY (`nCertificacionProducto`);

--
-- Indexes for table `ctl_productos`
--
ALTER TABLE `ctl_productos`
  ADD PRIMARY KEY (`nProducto`);

--
-- Indexes for table `ctl_relacionsectortipoproduccion`
--
ALTER TABLE `ctl_relacionsectortipoproduccion`
  ADD PRIMARY KEY (`nSectorTipoProduccion`);

--
-- Indexes for table `ctl_tiposmembresias`
--
ALTER TABLE `ctl_tiposmembresias`
  ADD PRIMARY KEY (`nTipoMembresia`);

--
-- Indexes for table `ctl_variedadesproducto`
--
ALTER TABLE `ctl_variedadesproducto`
  ADD PRIMARY KEY (`nVariedadProducto`),
  ADD KEY `FK_CTL_VariedadesProducto_CTL_Productos` (`nProducto`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`nLog`),
  ADD KEY `FK_Logs_Base_Usuarios` (`nIdUsuario`);

--
-- Indexes for table `reg_bitacorapagosmembresia`
--
ALTER TABLE `reg_bitacorapagosmembresia`
  ADD PRIMARY KEY (`nPago`),
  ADD KEY `FK_REG_BitacoraPagosMembresia_REG_Membresias` (`nMembresia`);

--
-- Indexes for table `reg_membresias`
--
ALTER TABLE `reg_membresias`
  ADD PRIMARY KEY (`nMembresia`),
  ADD KEY `FK_REG_Membresias_Base_Usuarios` (`nIdUsuario`),
  ADD KEY `FK_REG_Membresias_CTL_TiposMembresias` (`nTipoMembresia`);

--
-- Indexes for table `reg_productoscomprador`
--
ALTER TABLE `reg_productoscomprador`
  ADD PRIMARY KEY (`nProductoComprador`),
  ADD KEY `FK_REG_ProductosComprador_Base_Usuarios` (`nIdUsuario`),
  ADD KEY `FK_REG_ProductosComprador_CTL_Productos` (`nProducto`),
  ADD KEY `FK_REG_ProductosComprador_CTL_VariedadesProducto` (`nVariedadProducto`);

--
-- Indexes for table `reg_productoscompradorimagenes`
--
ALTER TABLE `reg_productoscompradorimagenes`
  ADD PRIMARY KEY (`nImagenProducto`),
  ADD KEY `FK_REG_ProductosCompradorImagenes_REG_ProductosComprador` (`nProductoComprador`);

--
-- Indexes for table `reg_productosproductor`
--
ALTER TABLE `reg_productosproductor`
  ADD PRIMARY KEY (`nProductoProductor`),
  ADD KEY `FK_REG_ProductosProductor_Base_Usuarios` (`nIdUsuario`),
  ADD KEY `FK_REG_ProductosProductor_CTL_Productos` (`nProducto`),
  ADD KEY `FK_REG_ProductosProductor_CTL_VariedadesProducto` (`nVariedadProducto`);

--
-- Indexes for table `reg_productosproductorcertificaciones`
--
ALTER TABLE `reg_productosproductorcertificaciones`
  ADD PRIMARY KEY (`nCertificacion`),
  ADD KEY `FK_REG_ProdsProductorCert_CTL_CertificacionesProds` (`nCertificacionProducto`),
  ADD KEY `FK_REG_ProdsProductorCertificaciones_REG_ProdsProductor` (`nProductoProductor`);

--
-- Indexes for table `reg_productosproductorcertificacionesarchivos`
--
ALTER TABLE `reg_productosproductorcertificacionesarchivos`
  ADD PRIMARY KEY (`nArchivoCertificacionProducto`),
  ADD KEY `FK_REG_ProdsProductorCert_REG_ProdsProductorCert` (`nCertificacion`);

--
-- Indexes for table `reg_productosproductorexportaciones`
--
ALTER TABLE `reg_productosproductorexportaciones`
  ADD PRIMARY KEY (`nProductoExportacion`),
  ADD KEY `FK_REG_ProductosProductorExportaciones_REG_ProductosProductor` (`nProductoProductor`);

--
-- Indexes for table `reg_productosproductorimagenes`
--
ALTER TABLE `reg_productosproductorimagenes`
  ADD PRIMARY KEY (`nImagenProducto`),
  ADD KEY `FK_REG_ProductosProductorImagenes_REG_ProductosProductor` (`nProductoProductor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `base_usuarios`
--
ALTER TABLE `base_usuarios`
  MODIFY `nIdUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariosanexos`
--
ALTER TABLE `base_usuariosanexos`
  MODIFY `nIdUsuarioAnexo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariosanexoscomprador`
--
ALTER TABLE `base_usuariosanexoscomprador`
  MODIFY `nAnexoUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariosarchivosanexos`
--
ALTER TABLE `base_usuariosarchivosanexos`
  MODIFY `nIdUsuarioAnexo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuarioscertificaciones`
--
ALTER TABLE `base_usuarioscertificaciones`
  MODIFY `nCertificacionUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariosdatoscontactos`
--
ALTER TABLE `base_usuariosdatoscontactos`
  MODIFY `nContactoUsuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariosestadoscuenta`
--
ALTER TABLE `base_usuariosestadoscuenta`
  MODIFY `nEstadoCuenta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariosinformacioncrediticia`
--
ALTER TABLE `base_usuariosinformacioncrediticia`
  MODIFY `nInformacionCrediticia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariosorganizaciones`
--
ALTER TABLE `base_usuariosorganizaciones`
  MODIFY `nOrganizacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `base_usuariossocios`
--
ALTER TABLE `base_usuariossocios`
  MODIFY `nSocio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `cnf_configuracioncorreo`
--
ALTER TABLE `cnf_configuracioncorreo`
  MODIFY `nConfiguracion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `cnf_plantillascorreo`
--
ALTER TABLE `cnf_plantillascorreo`
  MODIFY `nPlantilla` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `conf_tiposdatos`
--
ALTER TABLE `conf_tiposdatos`
  MODIFY `nTipoDato` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave', AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `ctl_certificacionesproductos`
--
ALTER TABLE `ctl_certificacionesproductos`
  MODIFY `nCertificacionProducto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ctl_productos`
--
ALTER TABLE `ctl_productos`
  MODIFY `nProducto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave', AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `ctl_relacionsectortipoproduccion`
--
ALTER TABLE `ctl_relacionsectortipoproduccion`
  MODIFY `nSectorTipoProduccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ctl_tiposmembresias`
--
ALTER TABLE `ctl_tiposmembresias`
  MODIFY `nTipoMembresia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ctl_variedadesproducto`
--
ALTER TABLE `ctl_variedadesproducto`
  MODIFY `nVariedadProducto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave', AUTO_INCREMENT=872;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `nLog` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_bitacorapagosmembresia`
--
ALTER TABLE `reg_bitacorapagosmembresia`
  MODIFY `nPago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_membresias`
--
ALTER TABLE `reg_membresias`
  MODIFY `nMembresia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_productoscomprador`
--
ALTER TABLE `reg_productoscomprador`
  MODIFY `nProductoComprador` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_productoscompradorimagenes`
--
ALTER TABLE `reg_productoscompradorimagenes`
  MODIFY `nImagenProducto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_productosproductor`
--
ALTER TABLE `reg_productosproductor`
  MODIFY `nProductoProductor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_productosproductorcertificaciones`
--
ALTER TABLE `reg_productosproductorcertificaciones`
  MODIFY `nCertificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_productosproductorcertificacionesarchivos`
--
ALTER TABLE `reg_productosproductorcertificacionesarchivos`
  MODIFY `nArchivoCertificacionProducto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_productosproductorexportaciones`
--
ALTER TABLE `reg_productosproductorexportaciones`
  MODIFY `nProductoExportacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- AUTO_INCREMENT for table `reg_productosproductorimagenes`
--
ALTER TABLE `reg_productosproductorimagenes`
  MODIFY `nImagenProducto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `base_usuariosanexos`
--
ALTER TABLE `base_usuariosanexos`
  ADD CONSTRAINT `FK_Base_UsuariosAnexos_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuariosanexoscomprador`
--
ALTER TABLE `base_usuariosanexoscomprador`
  ADD CONSTRAINT `FK_Base_UsuariosAnexosComprador_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuariosarchivosanexos`
--
ALTER TABLE `base_usuariosarchivosanexos`
  ADD CONSTRAINT `FK_Base_UsuariosArchivosAnexos_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuarioscertificaciones`
--
ALTER TABLE `base_usuarioscertificaciones`
  ADD CONSTRAINT `FK_Base_UsuariosCertificaciones_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuariosdatoscontactos`
--
ALTER TABLE `base_usuariosdatoscontactos`
  ADD CONSTRAINT `FK_Base_UsuariosDatosContactos_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuariosestadoscuenta`
--
ALTER TABLE `base_usuariosestadoscuenta`
  ADD CONSTRAINT `FK_Base_UsuariosEstadosCuenta_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuariosinformacioncrediticia`
--
ALTER TABLE `base_usuariosinformacioncrediticia`
  ADD CONSTRAINT `FK_Base_UsuariosInformacionCrediticia_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuariosorganizaciones`
--
ALTER TABLE `base_usuariosorganizaciones`
  ADD CONSTRAINT `FK_Base_UsuariosOrganizaciones_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `base_usuariossocios`
--
ALTER TABLE `base_usuariossocios`
  ADD CONSTRAINT `FK_Base_UsuariosSocios_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ctl_variedadesproducto`
--
ALTER TABLE `ctl_variedadesproducto`
  ADD CONSTRAINT `FK_CTL_VariedadesProducto_CTL_Productos` FOREIGN KEY (`nProducto`) REFERENCES `ctl_productos` (`nProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `FK_Logs_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_bitacorapagosmembresia`
--
ALTER TABLE `reg_bitacorapagosmembresia`
  ADD CONSTRAINT `FK_REG_BitacoraPagosMembresia_REG_Membresias` FOREIGN KEY (`nMembresia`) REFERENCES `reg_membresias` (`nMembresia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_membresias`
--
ALTER TABLE `reg_membresias`
  ADD CONSTRAINT `FK_REG_Membresias_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_REG_Membresias_CTL_TiposMembresias` FOREIGN KEY (`nTipoMembresia`) REFERENCES `ctl_tiposmembresias` (`nTipoMembresia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_productoscomprador`
--
ALTER TABLE `reg_productoscomprador`
  ADD CONSTRAINT `FK_REG_ProductosComprador_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_REG_ProductosComprador_CTL_Productos` FOREIGN KEY (`nProducto`) REFERENCES `ctl_productos` (`nProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_REG_ProductosComprador_CTL_VariedadesProducto` FOREIGN KEY (`nVariedadProducto`) REFERENCES `ctl_variedadesproducto` (`nVariedadProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_productoscompradorimagenes`
--
ALTER TABLE `reg_productoscompradorimagenes`
  ADD CONSTRAINT `FK_REG_ProductosCompradorImagenes_REG_ProductosComprador` FOREIGN KEY (`nProductoComprador`) REFERENCES `reg_productoscomprador` (`nProductoComprador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_productosproductor`
--
ALTER TABLE `reg_productosproductor`
  ADD CONSTRAINT `FK_REG_ProductosProductor_Base_Usuarios` FOREIGN KEY (`nIdUsuario`) REFERENCES `base_usuarios` (`nIdUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_REG_ProductosProductor_CTL_Productos` FOREIGN KEY (`nProducto`) REFERENCES `ctl_productos` (`nProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_REG_ProductosProductor_CTL_VariedadesProducto` FOREIGN KEY (`nVariedadProducto`) REFERENCES `ctl_variedadesproducto` (`nVariedadProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_productosproductorcertificaciones`
--
ALTER TABLE `reg_productosproductorcertificaciones`
  ADD CONSTRAINT `FK_REG_ProdsProductorCert_CTL_CertificacionesProds` FOREIGN KEY (`nCertificacionProducto`) REFERENCES `ctl_certificacionesproductos` (`nCertificacionProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_REG_ProdsProductorCertificaciones_REG_ProdsProductor` FOREIGN KEY (`nProductoProductor`) REFERENCES `reg_productosproductor` (`nProductoProductor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_productosproductorcertificacionesarchivos`
--
ALTER TABLE `reg_productosproductorcertificacionesarchivos`
  ADD CONSTRAINT `FK_REG_ProdsProductorCert_REG_ProdsProductorCert` FOREIGN KEY (`nCertificacion`) REFERENCES `reg_productosproductorcertificaciones` (`nCertificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_productosproductorexportaciones`
--
ALTER TABLE `reg_productosproductorexportaciones`
  ADD CONSTRAINT `FK_REG_ProductosProductorExportaciones_REG_ProductosProductor` FOREIGN KEY (`nProductoProductor`) REFERENCES `reg_productosproductor` (`nProductoProductor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reg_productosproductorimagenes`
--
ALTER TABLE `reg_productosproductorimagenes`
  ADD CONSTRAINT `FK_REG_ProductosProductorImagenes_REG_ProductosProductor` FOREIGN KEY (`nProductoProductor`) REFERENCES `reg_productosproductor` (`nProductoProductor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
