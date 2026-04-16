Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470D1BD9D0
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776302649; cv=fail; b=t1IgDE6ysQFjFSH+BzRt5Y1brIrf4NmN3os+xTZqhpdIeH+dde4bkkNzWdzUoX5ZfdITM5OBTTvTLilX+drBB/yZqFBce+b420VpJHpogNL75jo4VsaNc79twP/zLexB8/9vOn90f7fWCJXJ4Al5X2qjRH9NGkv7/W6uM0THTuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776302649; c=relaxed/simple;
	bh=0WkCW93BIAvplA2iOY8wKpLi6SPIb0/iRZASzpxV3aM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KWlb+OhEZht0l8qdqUpsfVxMQzCagNsKhAUiFbwV6d0pVDDgkXSmwRblO+0sOUWIZKGK9q5qEBBBRvCfkWlFdR0tjpUwYa+caAs5g4zGzAYeLanzTdnboXrYTDODurYFwVyIUwcM0BiMfAf/aEPAaJq0S6MplD85l6mU3T4EvmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U6dPfvEb; arc=fail smtp.client-ip=52.101.46.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U6dPfvEb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xe+iOn9hTaDhSOTjl4eub+FmmykvL35LKnPbQtrhRgEFLRQ89ajUDMyYpR9MOZ0OZGTqqxlCzVWC1ltp+Fz/wGS5oI4OYI6U0yf7jpIPfUphFk6TPM5J6W/KnWkAHLBT25/rhP3yWpwJ419DYIb0XuG5n84QESL0IEzUaxZgvscACTB531shL97CVAIcx1FSwZRQPFFVl9x0AGD42++Mz/bnrBSpLfKp0GD8+BSGE8mQLsdUPsdqilEm/oyioSh1qBd7SIABmgzr0PAHtUGZtbQDmNrVsK63wldOEvZQsuP7cQiVtgvs2bUQ9SMt6x7TiOwsfXncthmCfgQuEXL/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WkCW93BIAvplA2iOY8wKpLi6SPIb0/iRZASzpxV3aM=;
 b=Xd1dJ9fd+hWHKse4EAXQ8eSTjaYIytHUaJ/wikcWlitESwx7abKMZGfNUysPxfIrBgRniIUn/TnA4cM7keVuLDoWCDPKAsk563qBRlgPx9yhaoxLt0fIU1Zn9J8mKwwHY251UBgmUlcScpQiWSJN6pKxbHSW949Byi1XeLVpY6h2lGDXFaUearl+9WRHx3sAL1bC3dNJ6mb/TIwasYLLnmWfTds/1EgSW3MXGsKS/QhgV7w1V1+WZWpQQm3H0L70nHGgAXCiuUMojeRJm/ZhvaL82L1p7Ib7zy/SRRJdJXi5cCnZrsZo25E9gr7zlZuzrnIzjx1DODyJgM/u7VKbIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WkCW93BIAvplA2iOY8wKpLi6SPIb0/iRZASzpxV3aM=;
 b=U6dPfvEbiLvwtRBO5TTzXB4Z2UqVHUxPRzGdeYezwNzZXuXxKkIUp6E/SuZnAJ82djW4xC9ohkl79rbX+K926auTXDAttGPUpjWIgR30fsq/9oWbRfsrjngo/IZ/lKwZo2u66/OgK5/9rMZK8QKwc+nqQ1wKxKAxlvR+2m/5bml7Wf4DcRm0uqpTNOxfDhyotazz8EgWeGPUZeYUlL55tKQT1RBq4Lk87uDFgc1sPWw6yL0ACzLcyvnINip4TJbgby64x/yUB1F8MJwvJYjr3NEXDKuaN2MAtHLg1lwJemh6T9dnyn6SLH5THvCa3VxApgdpwJJaWNqrYMRE3XgvkQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 01:24:05 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 01:24:05 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
Thread-Topic: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
Thread-Index: AQHczTe5I0g8juY/GEWUzXwMUrKuDrXg5CsAgAAA0gA=
Date: Thu, 16 Apr 2026 01:24:05 +0000
Message-ID: <7a84c308eac2534123534977260c383272dfabae.camel@nvidia.com>
References: <20260416002619.900779-1-ttabi@nvidia.com>
	 <20260416002619.900779-6-ttabi@nvidia.com>
	 <9dccf93a-8eab-40dd-b865-368e818ce105@nvidia.com>
In-Reply-To: <9dccf93a-8eab-40dd-b865-368e818ce105@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|IA1PR12MB6283:EE_
x-ms-office365-filtering-correlation-id: ddab5d77-d361-4ae4-b151-08de9b56d994
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 Rh2uXgxBwGLPhEbW/gucnIgxXPp5cU8+G3qRBbrV4HGkojw9mU6ixRhrmQhtKpNaCmbXQh4iLs9hrdJLz0uQgyGGgWk18vfMyth/MuApf+iwkx0ho+O/2+E9pTiCS+yZ7kxouqNZ0d0t3PHQPkA4SwBJFmLUsoKKseiAGavTRVFL/taAW/ZeE01GcXmaQoi0nErvtZgERgJVoKaK5WshMth/+AZvtQF7lQ8rU+bwwj66FoOxcBLOAeZSkV3zdiKgWe1IdctaDdf2kqxJJTjln4Yk9tBFhgH0q3lbO8+8fxK/WQ3zwc9lAn5op0m8w/d/X9Kqt/AoljEunJ1c0zhCL5x2fy9+aX51jqrRN3fySQhSoJwZx8Lnzv32jGsBY5JRsTHhHUkO7+vL/uqMlvRdqk8YVUHr0EdbFRhVaFNSyz49tWiRNaB70bNWKOPL/4OYFvMytAz/7Wxy333t3DBRNyyk6KzgvOinuegnvla4XRASRytSxMuzyfNtMSi4z2h+rjSOzigP4yW3Qyql7uD2ny0xGKoEqB4+29dIshTh213NEFEm/qKXYP4/ulxNhRrBXukUYNoQ6TKtmJm/JL9aZGCXiaUaWOGFAeCKyQk3N5wQFTT9v5DdxWLqLGjBjNtagwJB/6rhHl2Wcd7pI5jRXm5GMkx9te4E8CpYndRJhEGE4xgOuBJD8XKIxdNaXBsIVmbZJY7Ek03fQAGnMpQuHk1OaJJbbk6CNw38+nnGYv3YrOgd5ZoUCVVtnG4w3r0p2n1NI6ah3Gr2MNGdGzRmkP/VR7xyxOR2BnVqVV8Fvb4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGVMNXp4b2lxY1Qrc0dTNlFoTFRrZjlJdHJ1SGdhVzdjTHpieDFqZk9zdU1C?=
 =?utf-8?B?Y3BybFRYZ1NmT1V5Mk1WWFBnMmJSTnBJKzd3emt5ZCtRaHBheWh2V0dtZ0ZL?=
 =?utf-8?B?TXVpSXpMcFRrTElScTFNVWhNQ0tudXpnRlBWcVBMYWRFUzBUa1lrQVkzSU1h?=
 =?utf-8?B?eVNPc1NpWEUvNUhtMFRJYnBsM202ejhudVZZdTNkb2c3N1hyRkRhb21aNXFo?=
 =?utf-8?B?ZEFlV0tCYU5aWjQrNGp3dEFKNmM1V2owTGN0cis5aGEvVzg4MWtqR1JJejlM?=
 =?utf-8?B?T2lOci9ra2x3Y1F1OG1DRDA5SXBJZzdzdFRFK2dxWWxoOXlTajNIYnVwbmJ0?=
 =?utf-8?B?czZzSXJvM3haaTJpTEZCMkNBVWxGMDJLT2lsSGl4L29sNHVRTmJhdTgzbTBY?=
 =?utf-8?B?TmNpVTRCNHhiblZiM0xEOVlKWVd4QitmOHR5ekNwYzk5azhPeWpnQk0zdjJj?=
 =?utf-8?B?WERXcFVpa1FrbzFTRlc3bFNWa1dkMCtaOHFsakVoaUhRekxqRzNxcWxLZi9x?=
 =?utf-8?B?b1hRdmNYeUhsOUo5aFVQM2w5Y2k1SjlBeFBqcDRvU3U0WmlLTmtJOGZhY0VJ?=
 =?utf-8?B?c1JjWVdmbVBxZ3o2Sk9aOWtJMThnaEdnaTJDTnVnTUdOcm9WMnJtL1VRRGw3?=
 =?utf-8?B?REtVMnBlTG5kWjkrc2R6N1JVYU9XeFdHNVdCRHRURUJmTkNNckJaMGx3Yk5h?=
 =?utf-8?B?c21YWTJTRWRmdmxtRmZ4TXVmaUd1eVdoWVFiajdPLzV3OHhTNUMzRy9IRlZM?=
 =?utf-8?B?V2JWbEIyd0VyU0VLZ29mVXJEQTQ1L3drWFVNT0Y3b3hqZFpReVBxeU4wU0x1?=
 =?utf-8?B?RTRIQ3Rld0JIdWl4NEdNSU9sZmFnUTljMmp4eVJyNGEzdlBpMGVvS1U5NzJq?=
 =?utf-8?B?MEdQbGdaRkVmNjBjNUV1ZFFwN2NtRFFJNWQwTjR3ZHhIYTZ1T3FtbEpGUksx?=
 =?utf-8?B?UmpLS1dySGN5QnB2aDBkTnQwWTJ4Y2NOcEsvaG9Za1BVMkIvellwd2ZzQjV1?=
 =?utf-8?B?MHcvUDlCVEROMXZaVG51VDNQU0c2OWVyNmFOeWFvbDM3L1d6ZzNxZjhNUERq?=
 =?utf-8?B?VThiS1lEVndPbGdQMHgwODVyd0lwb3AzQnhSUy9pWE81bUdmUUZ2OUJSNkkz?=
 =?utf-8?B?SHU5b3p5SC95MTVzdHZHRnNwbXFPUUdBUy9UUFg0SEJ4NFgxd2sxV0hCeSt0?=
 =?utf-8?B?dmh3U1V3VVJwZ1FNTlVDZzgzcHdGR29ORSt5Q3ArZmRRVWVPVjc4MlFjNGpU?=
 =?utf-8?B?NEdOS2E3bjV3WW9iV1VqZ1NJbUZmSDYxaVhaYktxNTcyc2xoeTBidjI0T1c1?=
 =?utf-8?B?anN2dVorR2pKb1BETWNlMG9EMVZTaFVtU0kxMnJ1cDdUNlp5NDdMTDkzWXVl?=
 =?utf-8?B?M1VXNG5Mei9HeGlLdEQxdHZMTzgxcGFtOXBVWEwzWjN5aXdIL0htOXZZSE1y?=
 =?utf-8?B?RkFEQVowYlFJOHdSOXFlSE0zSHZCMzVFMzJnMlJXb25hZHZnRFJsb205Qzhl?=
 =?utf-8?B?dkY2Z3lzR1VYV2lQUVV0ZjgrMjhxTTZnSENTb1F0MWhTQS9CRUhSY2ovNkMy?=
 =?utf-8?B?a2pyOXdLbDBoOC9LclNabGJ5aTZGSmZYZHJ1TlM1ei84STRKOVZETk9tY0Rq?=
 =?utf-8?B?L0QvTTFKQmF5elUxN1hEbmF3S011eGFxS2NXUzJhMEFWcnhvOUJrYlVxTlFa?=
 =?utf-8?B?YUVDbHQ3WERnMmZWUjRIVmJiU0phSUxWWEFpS3l3VlgxK3BEQUpmd0cvRHR2?=
 =?utf-8?B?c3loTllodG55WEVzZUdlMjJIdmJUWVVFMERZTnVjSEQ1WnpFUEJlTmhxM0tZ?=
 =?utf-8?B?T3Z2Q1h6VFZHMURuT1ZLQmtua24zRXRXUTlnYzNIMStHSXpQeExqMnh6eW8w?=
 =?utf-8?B?dGh0cmJaamg4dXh5MFlzSmF6OW9yamlQY1I2M1FGcUhkdldMZDNCRElKQlFr?=
 =?utf-8?B?T3ZubWZrOFQ3eE9zbm04T2ZzaGt0T0RaRC9rQ290N2JvWEdWa3d2Ykw5clhH?=
 =?utf-8?B?TzFueXVucFVuc0Nxd2tKcm4xa0kwRlRGZU9RdWRIRjU1VDM0WlhFR1h6S1Fq?=
 =?utf-8?B?N2xSaEMwWmNzalBMTklmcWkyM29LL0MyQmZ6MHpqVm5XR05rVW5BOTlyMmxN?=
 =?utf-8?B?M0JsZVdsNHM1ZkxCZXFNc0d3bW5YMEE5WWtkSnNmcmZvK2dSdjlvcG9PNUQ1?=
 =?utf-8?B?MDd6QmlwRmpCQk94VFhuYzJjL042bDBuQkVieEJoV0M4Y2NVdDJRSEdQaFZ4?=
 =?utf-8?B?d1JaTW14dTI5Z1REZDlaV3IvUTlqU0p0QVJMZFdHUFhFOVdDZ1JmYVV3QTkv?=
 =?utf-8?B?RUtnUEkwTWthNFNnUlErTjJXNnVMVEdVSVBqVWxFajN4TDNrOERqQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2678A7B79695E44E89061DC3504D84BA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddab5d77-d361-4ae4-b151-08de9b56d994
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 01:24:05.2553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bp6xKDMsbpx3bYKh0G2jT9QQXikSB8VtC17Ve0HL0e3mVltfNtlRlRG1q1dFoqaYvNrVDEmqdEWq/zrvOL2elQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE4OjIxIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE9uIDQvMTUvMjYgNToyNiBQTSwgVGltdXIgVGFiaSB3cm90ZToNCj4gLi4uDQo+ID4gK2ZuIGN1
cnJlbnRfb2Zmc2V0KGRldjogJmRldmljZTo6RGV2aWNlLCBiYXIwOiAmQmFyMCkgLT4gUmVzdWx0
PHVzaXplPiB7DQo+ID4gK8KgwqDCoCBsZXQgc2lnbmF0dXJlID0gYmFyMC5yZWFkKGdhMTAwOjpO
Vl9QQlVTX0lGUl9GTVRfRklYRUQwKS5zaWduYXR1cmUoKTsNCj4gPiArDQo+ID4gK8KgwqDCoCBp
ZiBzaWduYXR1cmUgPT0gTlZfUEJVU19JRlJfRk1UX0ZJWEVEMF9TSUdOQVRVUkVfVkFMVUUgew0K
PiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgZml4ZWQxID0gYmFyMC5yZWFkKGdhMTAwOjpOVl9QQlVT
X0lGUl9GTVRfRklYRUQxKTsNCj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgIG1hdGNoIGZpeGVk
MS52ZXJzaW9uKCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIE5vdGU6IFdlIGRv
IG5vdCBhY3R1YWxseSBleHBlY3QgdG8gc2VlIHYxIG9yIHYyIG9uIHRoZXNlIEdQVXMNCj4gDQo+
IFRoZW4gd2h5IGV2ZW4gbWF0Y2ggZm9yIGl0PyBObyBuZWVkIHRvICJzdXBwb3J0IiBIVyBvciBG
VyB0aGF0IGRvZXNuJ3QsDQo+IGFuZCB3b24ndCBldmVyIGV4aXN0LCByaWdodD8NCg0KQXMgSSB0
cmllZCB0byBleHBsYWluIGxhc3QgdGltZSwgSSdtIG5vdCAxMDAlIHN1cmUgdGhhdCB3ZSdsbCBu
ZXZlciBzZWUgaXQuICBJdCdzIGp1c3QgYQ0KZm9vdG5vdGUsIGJhc2VkIG9uIG15IGV4YW1pbmF0
aW9uIG9mIHZhcmlvdXMgZG9jdW1lbnRzIG9uIHRoZSBJRlIuICANCg==
