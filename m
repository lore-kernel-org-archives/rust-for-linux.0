Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775631A2643
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988354; cv=fail; b=IfVhXkrgrPVIuZwO+4lpxCzPoc3aod5Cl7crAleH+u66zgygwQ8xwTDTfACAD+Cp1BKMgAX/XSxUBDXNS6nZL0cghDSRvKLUFZ88uExzzG92KDZuBUMDP+aR9W0L21p8dqsT/AOUJ+ZY+ukBRayUyi9942jwRuAwoi9QB6ibNro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988354; c=relaxed/simple;
	bh=KHzFjoR8s4aJgZDUceIHGdUvQmLSXusVTOh/6nWJw1g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cJl4rNC0+oDsFI3QyROX7VHb9l0yHGFvtyB26QNtZ/VK+vCd5KGv1qk/ED5Yra5JIS2I1n7Sb3HjFWC0o9ZFaA5mM6prfve1pPQXuZH9NadbX70Y/q4GYupKctAXJEwIwSdXl0GuIO1PHVRazfGdtZydoyPsOC7XIQaA/bfHdys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Oh8LBkSP; arc=fail smtp.client-ip=40.107.244.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Oh8LBkSP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM5BgGQyifzHb2+g7M7SZiRdGPIErPiPqC1r8dpdLtY83ALvRwCEnzDRHZs1fYVXIIxcUrETDi2G6Ft5OUYc87Co0sVWCbb/QP9Ub9hQpoM8qvXfpeJxf6g4d/v4kgp/DU7HlhHADlRFeIyRssQmMIx15eb6iqjXjXj6DqxHbVxuq7XC7DOtW7Btj8BZnCSb/rEWscoQxP1yBdD0zh95N+xccjUnl0O3PX3VDrZ62eAMZoMZYTrqvWHopyaUOPMMjGXiL7aroVzp2VSHwga9fd4bkKzbZaEeknRcZv+OPmZ5v9jw4IMye1a4GxqRxQ0hXZ1xs7VfEA8OKJWSkBKa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHzFjoR8s4aJgZDUceIHGdUvQmLSXusVTOh/6nWJw1g=;
 b=MHi3kVQ78LwYLwjEjB0adJ0Vgd3fNniEDrH9UulpSuoazHrJBNPD/HorInQdqqJqPnyEKay4x8g8o7+iownj6emxG2t4mmZEsGRe9oDuVwfwvYOwaZgYmHv5Jbpt3BGbSiR+n2bWcNo0Kdp+dFmvKwjJu/PbC9uhKhld/CHQyydYS+3cGU9gVPN2qcSHyH0mJ87iFySDKExsSFeQg2368szTjW9O7yfjdSi8T8jv9wdT/sGhb7ArdpDyWYMutc1/hnsuBUE9Nr1akYsmbmJqR4M1v+hLAweD8787YHrWnEMxYTRvJbF0XeW1Jx+cGApc+kpZqjhWpnBVhMfWh+4IyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHzFjoR8s4aJgZDUceIHGdUvQmLSXusVTOh/6nWJw1g=;
 b=Oh8LBkSPrCz0dYrySEWfu0n5H/eYuoChhZM3RX5dQZjBKCY9cAuHsZHuzv5ef56WygKgdvI2Hl0szl7gd3ScVKNJAUWwmWWNC36tV/sXI1f5HoZG3IUsOXf6tX4lsS0aav+drr7ev39+tP5gKKKdMgP9+d3iR9J4J/Mi8gcdhGFkiipyhMUMLMJ4CTFoKUgEsFC8yqeogqrRHw1SsLM8cEQAYbW6xOA66TIkv7dma3oq8ZTp50T1Y7iLRt3dUpI4HywxTAmP+ZX2632MFD2gjKYG5vf2eHiN/RkTxVOGBEFmotNleVRE+eQEgeI494syVpk0FqqjyNYG315LGFIEsA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH2PR12MB9520.namprd12.prod.outlook.com (2603:10b6:610:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 22:05:49 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 22:05:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "lossin@kernel.org" <lossin@kernel.org>, "miguel.ojeda.sandonis@gmail.com"
	<miguel.ojeda.sandonis@gmail.com>
CC: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Topic: [PATCH] rust: introduce sfile macro for easier code tracing
Thread-Index: AQHb0Mn7MGE1brglZEyKYzrCM8w6zLPqDQoAgAe4WoCAAD5FgIAAAhUA
Date: Tue, 3 Jun 2025 22:05:49 +0000
Message-ID: <5cbe30e8f1219dd67fd4de9a1156adc054db4779.camel@nvidia.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
	 <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
	 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
	 <DAD8GTNP7E50.3CEF051DAP051@kernel.org>
In-Reply-To: <DAD8GTNP7E50.3CEF051DAP051@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH2PR12MB9520:EE_
x-ms-office365-filtering-correlation-id: 8c6b0516-b8d2-41f4-6c11-08dda2eacc9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDFHaDB5cDkxL3RXVVl3Y0xNWTJWR2E0cGh6SlVqTnZ1RFMxelZqSkNGOW1m?=
 =?utf-8?B?MFpmcGxEUnNiMFp0RlRpYW1NTnVndS9HZDZadnhuZ0RXd216VUJOQlVJVmh3?=
 =?utf-8?B?YlVWS3l5OUc0OW90KzlzR256UE0yR0FIV2FITm1OYS95UUdMSUpkOFNVODZu?=
 =?utf-8?B?T0pHNVl2SUxXVlJMZS83RmUwNmpvRFFQeGhySWovdzNWWmlEYnowSXdvcy9u?=
 =?utf-8?B?YU84Y3lreDhwT2F5cTZ3bDhCOG85VEt2VDBMd2dNS0U1TFdCZXo2LzNxQjJ2?=
 =?utf-8?B?QVpPSTVHeGMvRUxNV3NmWmw0dFQ5ZFgyTXEvWHdYOUl4b2JBMlBabjR4ZlpY?=
 =?utf-8?B?MWJQVCsvM2Q0WU0wMXM3WmhrK0tMdUZ6UDNWRlpXNTVHakpCcWgyZS9aZGpO?=
 =?utf-8?B?QWpGMkswOGZLeGxtWUhlRVI4bTB5VUFKMHE1ZG5JR1VSaWs4MUI5NmJNYkhx?=
 =?utf-8?B?T2R4dTRkMnkzbDdXd1AraXVFYkRBOVdTSkhOb2p6UTlYem1pLzUzOGlKdmVw?=
 =?utf-8?B?eU1jK0tXZ1JDTDI0aUFibG9IMlVBbHVPWUZmejRmcm5vdXp6ZnRORDlmK0Rh?=
 =?utf-8?B?UythTGZ3cHBPcnEvZDFaam1KUjFHSE9OREpoTDlocCtqckhtc2ZYNWhjdG0r?=
 =?utf-8?B?d0ZCeVNPNk5OdG55SWozUU9NRit2dnNSN2hIaCt6eFFpZWxqdkt3T2grOVZI?=
 =?utf-8?B?Q08zVmJWYnpYWXlNeElaRXU2c29NYytBZE1IQmtSMVNKVTB6YU85bTNLbVB6?=
 =?utf-8?B?U1NCc3VOb3k3Y0tRUmpTNXJLNDZlcDd5OStkNkltSWJYbHpYUWFlZW8yUlVX?=
 =?utf-8?B?S3dkUThFSGVVdzdSSkxDSUdkeHJ2a25sckxRaytQdXF3QzQ2QXdtaFpZaXVW?=
 =?utf-8?B?QnZ4N3NZNW05d1pVTEdtRHp4cXBhT0EzQ3Y0OThnNUF0NDM0R1RMRDhWelhV?=
 =?utf-8?B?bkhtQTBqYjNhWktGMVhQNVpiTDdoZWpqV0drZVdNMXdpcUNkbUlWd1RzbFh0?=
 =?utf-8?B?aW5CMmJSUlVVZjVtazVnMnh2RGRmZFVNVWxxZ01mRnQ0eVFIK2pJb2dUNzRo?=
 =?utf-8?B?Q1FwVVlKVVpkejB3bEtHVXB1U0lhaEZRMEpWMFBBM3BEdWFCTHRNREI3cVho?=
 =?utf-8?B?UDNpQWRBZk5JcE9ML1IyVXovd09mejd5QUVFOHdZNyttQ1NQMklRVGRiV1dD?=
 =?utf-8?B?THFVbWdCL2VMNmFBNVF1RVBZZTVLV3VKZ2pLbHJvRnVDOFlQOE53bXRzU28v?=
 =?utf-8?B?U3hZcDl4NUNtSjF6azN5R2FBblYzeksxQ3pHNXBOTXBsTHpMdk80NTVlSmFm?=
 =?utf-8?B?N2drUUUxdlNlSDdtc0pxU1BMQjNTVFpEeFI1aUxua29PaUVIOCtBZklYdk02?=
 =?utf-8?B?aFpHT0xOL2MyM0JQaDFkMG10bVJnR2xhTHlMMU8vK3ZnUlZmejB4cHQzL1lG?=
 =?utf-8?B?NTd0UCtEVlNqVWRKZ084V2NKOXNiUjJJU0d3YzQvUjNNZEpxYzFBL3dJNER5?=
 =?utf-8?B?VWV0cmQ1OERqQkwvWDRBQzlkSXJBTHpxTFZVa3JGWDdsN2R5c1U4MWhsQmRL?=
 =?utf-8?B?eTZQY1ZudjE5dWRYVWdDanRCSGVRcmxrWjJTejQxcnN4L1BXSEdiV2dLN1FG?=
 =?utf-8?B?Qi9Pc3l6a0ZENGZPZlVlSUpMVHQ2Y1ZDajM4Y21XLytJbzFiQlNIeGdXTE15?=
 =?utf-8?B?Tm5mWWNzbGRiSXBYZ3kwV2hQUjR5bGtlRXluU1djU096aExsRGswYTd4NFFo?=
 =?utf-8?B?UmluUS9KYWJ0TVRLSjlxRVNwV0NYc1lCektXWFplazF4dHRJenllYUpWcmJ1?=
 =?utf-8?B?Tlh1Tm94UDljQ0FkV0FQMysyaWx6Rk83WDlHNVMzZmV2M2p6em5kb1ExT0Yr?=
 =?utf-8?B?cFZMdE5vUkZHNUptaVQwY0l1RU9McTRVN0w3RnBCQm56TTJNSVhPTjNDeFJC?=
 =?utf-8?B?Ynl0Rk44Vk00N2pvN1BIaHdaMkJXcW15SVRBQzgvckhZQ0lndzQ0NnRqNFht?=
 =?utf-8?Q?Lq+UkyI/gt8ponbgKwToAiwCX0q9LU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dm1BVnhZajBuREgrQjE3dnFzdnFFVGhUNk44MUJ3Lzh2QldVcnExRlZKSnBs?=
 =?utf-8?B?akRwZGdIbW1ZblVSMWR0ellER3drSWlsaWtDakxSLzE3eHdrdlR1amhETGpI?=
 =?utf-8?B?OW9rY3R5OCtVRFhYS1RDN0lweDNKaFMrOUpwZzV1bEtBOFdIaGNqeHR0SUZ6?=
 =?utf-8?B?a3Q3K0c1QVgxUGZGbU8zN0x1WXpra3dwZTBZZ09Qb2c4WkZRbXd1N0N6RDFi?=
 =?utf-8?B?TkVoajJQOWR0OVpab3VuSDJZWXZTOCsvRCt3WnVEaDdQT1FqSnNwTC82a2JH?=
 =?utf-8?B?b2ZuS2crWXBwbVZUakxoZmlyTWJzL1Z2RjIzZmxQb2wrN2hJMUNWbTVSTnBw?=
 =?utf-8?B?Si95NTN6MDVZTW1BbWtUUmtTUzJlOTBzYTVVbDFrQWNQRUZ0ZGo5N2JUdGF0?=
 =?utf-8?B?bDFrKzYyYlk1WWhIa2k3Y3BGaWdUWXI4SlhVc2JBZE5WZklDc2d0cmNFaEJU?=
 =?utf-8?B?eVBHbFNsVzlLMSthUC9KZzVzVm8raXBZa0lZQ2FXWWlueVZvZ25OWWovdEJo?=
 =?utf-8?B?SVYzR1VQYW1tTUtSa051Z3VodCsrVXVVT21SQWFzK1VkbHowd2NJUGFGTEtk?=
 =?utf-8?B?aUNlVmdrY0p4VGF3ZmlPQlVxZUhOOHdteUExTFBORlYwdU82OGFOVFNFOUdz?=
 =?utf-8?B?Q2V2Mlgra2pBdDZjMjZYUkZIZDcyOEZhTnFCWXlaS1FrRFV0ZzZWeE8vbDRj?=
 =?utf-8?B?elVyQmJjMGI0NnMydjJPT0RxeTVQWnl6Rm5tY01aL2FUaUU2ZWowKzhKVTRs?=
 =?utf-8?B?U2M3OHVvMWtmT1gySnRVYmNISmphMW5wT2RBbjQxZlRtWWhKTUZZWWFwQllx?=
 =?utf-8?B?N25YeTBvS3FxbmNwemtieGpQNmRUN1MvT2k3U1dEZWwvdlpkZHdkM29iTGxN?=
 =?utf-8?B?MmZLSlV3bEEzNFBwdkFJUm5scXViWXVUYjhCYXhxWWNTOXJUZU5LUWxGRWJw?=
 =?utf-8?B?akxIK1V4MUhDUEJiSzJrWUhTS3Y2WElHWnk1aTBGZElZckdMSEJsdjk5UCtS?=
 =?utf-8?B?ZUVGQ2VuOXk0ek10VUdLc0srNWtJRjdwdytDZWxkVVgvdkduYVQ4K1pYSVNw?=
 =?utf-8?B?MW41cUsxVzBRd3JGVkhacG03Q3Q5eDFuRlVDTDVhc0NobHc3OFk0eFcrbXRn?=
 =?utf-8?B?NjYrZ3o0WDg5UmJsN3FXcTQ4RWRnV0Yxc0xyd05vM1JWZ2M2dVV5bjZSTTVr?=
 =?utf-8?B?cmx5TUROcFAxaVhaYXI2TWphNHpsSEs0dkpYQlpNdU1jMTVGY3lFVnVuTzl6?=
 =?utf-8?B?NFhHaFhmOHJ4NHlTZ1R3QitkZ0RTUjhSbThsZWhQazFPenE4QU9HU2l4T0pt?=
 =?utf-8?B?WFpUN1BaNFQxNTB2R1Y3RithZlRLMEs5ZUdJdko5aXVyWE42NTRiSlppZTZh?=
 =?utf-8?B?aGUwcTNkak9NWXk3U3FhQyt3NnpWRVlBMnl6M1UxS1FXUCtWY0gwclY3b01H?=
 =?utf-8?B?dzJ5M2R3VVJhWFRxNmFMTnQyMTBoajFmR1V0VS9kNXZXTktxV0ZrTWVjSGhL?=
 =?utf-8?B?WjFzTHdJTVpFVGJxc2RXQ25HNGVRbVhoOXE1anJneFR5L01qUmhvMG5oWGJE?=
 =?utf-8?B?WFdaeTRxbXNXUGg0QngwcHl5TVdVWitGeW1DdHFiV1pqRGlJNS9QUng1ZTN3?=
 =?utf-8?B?VXJER2IyYVM4M09WZDZiRW1abkNlb3BocGV3cnAzaE5IaEJ1cWhweE8zenRZ?=
 =?utf-8?B?dHczUEtnUGxjTGJTSzlDYjhWUWtaNDZXMlgxVjlxQVdvMkFPVUVBU3hRbjJU?=
 =?utf-8?B?dHRWMU9LU3BDNzBQamo4RXF4MURzdXhXSkRzaGNDc2ZTbWphVGVGQVdHU25W?=
 =?utf-8?B?NmxVT3VwSzdpRFhON2lpaG9oVy9TM2xMempUNGhZMzFGUGxpMWdvV3JHby9P?=
 =?utf-8?B?UHdTUitheElJNGM1RUMxcmdXeTJhbTFXUGp6Z1FWRVlmZmJoYitFM25lYnZx?=
 =?utf-8?B?bUp4dkVOV3dUR2Y3MFlpeW42QjZQREE5QVVwS0JYRFFQdkxyOEhaYnJ4b21M?=
 =?utf-8?B?ODdXczZhSFB4OHZteURtMXdNS0kwZ1p3VDA1VmRncEZSQnR2ZnpIRDJYdnFk?=
 =?utf-8?B?dzdFeGZZRmJxaUFiSGduSnJDZEFzMzJBeXh5b2NTK081eUtpYVcvcGhBU1ox?=
 =?utf-8?Q?4fIWK7/7WeJW71s/u1socCGDd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B2B3713482A70428C49CF3C881C7CDD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6b0516-b8d2-41f4-6c11-08dda2eacc9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 22:05:49.4987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5sUgMTG20MZJFKKR0dBEOX0Fn/nQEEKXYfw4pF0987zt6aL1zmnhRfnUUN3gJu4VGbhTDXCI4dNz2TRttEvI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9520

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDIzOjU4ICswMjAwLCBCZW5ubyBMb3NzaW4gd3JvdGU6DQo+
IEl0IHN0aWxsIGdlbmVyYXRlcyBzb3VyY2UgY29kZSB0aGF0IHRoZSBjb21waWxlciBoYXMgdG8g
Y2hlY2sgYW5kDQo+IHJlbW92ZS4gU28gaXQnbGwgcHJvYmFibHkgYmUgZmFzdGVyIGluIHRoZSBs
b25nIHRlcm0gaWYgd2UgbW92ZSB0aGUNCj4gZnVuY3Rpb25zIG91dHNpZGUgKGFuZCB0aHVzIG9u
bHkgZGVmaW5lIHRoZW0gb25jZSkuDQoNCkJ1dCB3b24ndCB0aGF0IGNhdXNlIHRoZSBmdW5jdGlv
bnMgdG8gYWx3YXlzIGJlIGNvbXBpbGVkIGFuZCBleGlzdCBpbiB0aGUga2VybmVsLCBldmVuIGlm
IHNmaWxlISgpDQppcyBuZXZlciB1c2VkPw0KDQo=
