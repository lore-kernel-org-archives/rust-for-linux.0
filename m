Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012005.outbound.protection.outlook.com [40.107.200.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F313328640B
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776355412; cv=fail; b=u/rA+RHVgf3M+uiz6BbfVm9OX+BZidS2uMCd1QoAJSgI9Le/uLFaI/Fx0nZ4Nmfbshd9HPGstcH01sLJ6Y6cC5YNsDqH3j6gyqqdV4NgaFwFNM028z3sHmTsbXYXaBbNGXaAtACOd53sprKNeuojdgDiWMBleLSjFXOa5w1qk+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776355412; c=relaxed/simple;
	bh=tLfSqH8Ra72xEF0pNG6e16hCZL40JhJFgyXugRB+bTk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V1H3l5qCsAOOa341WA6OK55VI6TJFXnURn+UoJsxAdeqIkiudtwSLNhYHYW3UhpKLUekem8v/4+cU9oT4gjHrgWueiIZFAcA7jEB+bwTd2ymvUb5lSMBEHX/t1hDSy6hjVeaTb59pN+4/ZXSMQP/Kp16HTgWsh6iHK0Rb+ZnqSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VRCVBvX4; arc=fail smtp.client-ip=40.107.200.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VRCVBvX4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeaBqtOdGbY9IwH5xOc5PPEIwh6PDs2jZ5Bj11HHqDkiDpE/HKIkFgUsE7UGsnSz20yJRZDPzC+A21tNMuVhnDQT4Bet+8YEGIFOSMfxppT0N0r/ZvurEq8DCvnRVfVI5QSHNaIVz2rofyJ0xGYPL3bqqiNOa/hwT352T80YGam8HX5TItxbWRHDtvfkPXUdAbby19yZd3izINw8ZljBGESYl0V+Pk+WBhJ9uWcOlTjUcZLSU/Mv+iBYXAO8xtgePwzRFd7iKtg3XTgjQlnBgxWh/yiFx59I2d9CLukBwWZjwDSqamse3T1LXytQkIp872UDD2IRMKfjAE6JCb2pMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLfSqH8Ra72xEF0pNG6e16hCZL40JhJFgyXugRB+bTk=;
 b=XSJNEaHsr/j88/gPnU0fRpWO00r48AaacjeH7jW8T1JqNeJWqdKw5MfC1Q87cSObo+NG5JNoj6yIFwPbGfG73yveMOgbe4ahFWcaeY9PwKU1tZDAne9PXt83vQ70G71Utfeo098HFVhGI+s2h6w9NBmHQvtDtwnAiDw7ZBUI8QU0ib4GamGIcqmdZgFoTxNRqhwIMmFO2dltxoJsqL1gWUgiVk8DQh+nvGMDYBF9wSryPpkIJbLalcK54KMLs8oAOakmoHvJajXiXJgQn69+067sTT+bGStYzKxS0odTY46I8YzFp0EvNNFJEIxBDeNXFrxDM03nQ6MC5DzyWlYkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLfSqH8Ra72xEF0pNG6e16hCZL40JhJFgyXugRB+bTk=;
 b=VRCVBvX4nLaVnw4LgrCtdvACInO68fQWdb6wkUjjRNZ12pgIYSdY/bAV4CoVj041mO/aOlqM50bT3SHDeBZ60BWomevndw7KeIDFKIFi0qxMknHSsk+A0BDXMoWHxuePsZxtkJbz/w8IPgj30Ug+2CDezvngtEtMR8+3bTEzrn+zNBx30QHi2JakHl9ynueE5v2RM4FaqkxarZytiD6Yc2wqYqfIED5HqNgxndQ/FC247Xu4DWNggLpJr3LW7A+usQtEZN72t0hfy/czApSOVFYy6K9cZo2HMOkH5iPPQQDY+0YyH9mrRgSnwHm+sH6LlIj1f3DvZMpyVfmw2tVqOQ==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SA3PR12MB7805.namprd12.prod.outlook.com (2603:10b6:806:319::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 16:03:27 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 16:03:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
Thread-Topic: [PATCH v3 5/6] gpu: nova-core: skip the IFR header if present
Thread-Index: AQHczTe5I0g8juY/GEWUzXwMUrKuDrXg5CsAgAAA0gCAAAJ9gIAAAFaAgADy3gA=
Date: Thu, 16 Apr 2026 16:03:26 +0000
Message-ID: <1dfabd4281e04d9d3027787eef388bb811ee5d56.camel@nvidia.com>
References: <20260416002619.900779-1-ttabi@nvidia.com>
	 <20260416002619.900779-6-ttabi@nvidia.com>
	 <9dccf93a-8eab-40dd-b865-368e818ce105@nvidia.com>
	 <7a84c308eac2534123534977260c383272dfabae.camel@nvidia.com>
	 <279e47ee-ba52-4793-be86-ef24520c235e@nvidia.com>
	 <5dc896f1-fa0f-4ed3-9744-420aa35368b1@nvidia.com>
In-Reply-To: <5dc896f1-fa0f-4ed3-9744-420aa35368b1@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SA3PR12MB7805:EE_
x-ms-office365-filtering-correlation-id: 5deea7b8-36da-4a3e-6afe-08de9bd1b1ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 3jcGKMB6fIve06kXafrRGTaD29FWBPbAuZCXKwioWJwmnxiSXgBzKk5p2NKgaXIzZe2GBBgtVesFk+xXRBgCh8SG98IGRR/uqtokMDVMMGOO69JTcKMljkXSoUupYRgrDKnDAuCPFiT5Jp652M60XOQThtQsFoQeqMDsQu7ZdGh2sfQUp+jCLOx6JfA7nTv0vEK4cLXa5ELaBMPaQLaAicFAB9vhbOoQUrBnlbJXNQ53Hid8UBCrd8JhjWP0sBFSkwXejTgp0sSzjUyGw8UDiwi7gr86ymWaSiuPzJ49anxQTYu2H8MKcS/+/Mp185XJwFpUCEOeFwubgyZYcq9R0L25z586PbMTzktKH/A2ZxOdhaPxZKDMReIjvTuuXEnTjGn/NloHdSW9hqWdLcfkOF6Gt2uskve3a3ezPUdiseDZaDvXRmoRapj+CHuxK44GvYkO5S/l5O6FJ+z4uBudUlgBZBNyXCDtp51vvpWYlFUjUsDOWEBACtHLUCorUSpTC/H3flVqW/0EBou148PMQ7SEqPuOpQSFVR7dLN5nt70oDi4BL7B3R+rKOTKWBPlzfwiys3/0zaMU1KxZ+XOTTQdWB8nMoxcD4KmT2x9ncKcedaVAfBGyANxhyy0PPPot4tVBUwDHonbRkWjI4/Z+QIefCA/R6Tup8VXiBFGathhuc6BQyEk30S6eu9ghC6F+KZIHDLYe9dKwW7Y7uz7BkWsD4GhQLWKogfDRj1jF7f3Yf7ttme9+C26VClQYBlbGkcd5HwZ7eHObpBnwDoHbWZP50alzmVrsX7r0gHkWO6w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1JwVFBwbGJ2QU4rb0l2V2NGclBTcUUxVDZoMU5hYmZIZ0RuQW1MRVlKUTdU?=
 =?utf-8?B?cjhjaWgreVE5R2JBS1NFU010M0FmL2J3eFVSc0g2R21SV2FJbEFhQzZhR3ZD?=
 =?utf-8?B?c2lnMnhickhyTVN3K2lwUXVla20rN2Nkay9Rd0xvYXZ6enJBbG5ONDh6ZkFH?=
 =?utf-8?B?enZaOFBEbzlxUjdLWjFIL1VoN0dldkVGVkorOVJoWFMvQ2pvL200ZFNkOUtn?=
 =?utf-8?B?bGQ4MHBjNmRJeVRoVUxvRVpoN2FoajBVdVA1dFkvZVFxRFZ3SGlDTUZWRmJR?=
 =?utf-8?B?YW9Sd1V1MlcxMnhHZnFwa29OSnE4YVRNUWRhaTJyaDlsRVhzbWN0akI1MVZ3?=
 =?utf-8?B?Nkp2RCtDcFc3UG5Ia1A3RmpsOGJxL3dob3JyTW5vQzlPSXdrc1Y4bkNGUElP?=
 =?utf-8?B?WFdpNlc4TllYMnRoVDc4SnpBWUYwblNkNExFcENHazV1R0REN2RNUXRNNEJa?=
 =?utf-8?B?UXRocHNkeWE4TmFCSjNpb1ZyaTFXTkt3RkNiUlVXWHlTNGpvWTJxOWN3WkdO?=
 =?utf-8?B?eFo4QWxkSHFsZlFLYTF3TmhFYTJtRUVGaVNSc3hnZFhWMXI0empML1J2c0Q3?=
 =?utf-8?B?MmlmU0hrNmVHWlhwQ0NwQ28vSVV4OGRwU1ZZenQyR3BTRStUVVpDYVc4eS8v?=
 =?utf-8?B?OEpHLzNXRTc1RUwzRzBUK1JuYk1ldzhGcVhCVHI3Z2R0NkF4ZE13MzREaHBK?=
 =?utf-8?B?TjFSUGs5K2VqTXhuNzl3Wmh2RDR0M3VBQ2pLUWNqQUZmbWJWbDBjcjRROUxK?=
 =?utf-8?B?Wm9lZk9CY3pYb0hnM3hnUFVub2I3dFB6VjR3QlVkOGpYeVJEcVdKeXpDcWY0?=
 =?utf-8?B?R0c4b25acnpBK0VVZEVKdDVvMnBYbEhXZ3UrUWdEUmVOUGFrZzJ5S3RvU25j?=
 =?utf-8?B?U2RsYmFQcGRWR3BDS1RqWEhVekVlenBZRytsMHp0bmJzKyszalUrek1WcktB?=
 =?utf-8?B?d0xkOENoWFVXU3VnVXJVeXE5WXVHeW5LTGw2R2JNT1RTekpBb0k0K24rZjJS?=
 =?utf-8?B?VytmUW5Zb3Fwc3dic2ZwUWo2eCtZbXUzNjhxMzJwSS9xeUd3RzVlNnZSVXdP?=
 =?utf-8?B?VE5hRzhic1JHcHpBRzU1OWJzV3YrSVM2THN0MXRNekYvU3FjcE1GR1pzMDJs?=
 =?utf-8?B?YWhNdFl3Si9MSi9qb0VVeFpKYkVLenZsbWh1TTQzQ0NtUGFsOHhDWXZNODNh?=
 =?utf-8?B?eHg5ZGhLVFdvNXhtZGVReEF6T2RMaWNFZFNCWkc2MTFPNHQrT0VWUmxnMDNk?=
 =?utf-8?B?UlF3SEZFa2pRYStmTW1TdDNMUk94RmhmV1dZQ2wzV1lkY1ZNczdoOVptVGdG?=
 =?utf-8?B?N0MybHd5Qm1HOVE0NjExc2hpTW1EOGxQT0NHSS9TN0dmZVdqNld3NDRiWkx6?=
 =?utf-8?B?aFZhWFYyREhhanZhVmFQOUplQnhCcUFJV1ArNWtTWU5zYmJ5N2QzQ0RYMjV6?=
 =?utf-8?B?a1pIOU1QZHFnamc0YXRpdytRS3ZFM01qQjVMQ0d1a2ZCZ2hna0ZTZys0NkJP?=
 =?utf-8?B?NEx1ZjE4UmMrS2M4VFMvdk1kUzM0M3d0Y2JpMVlPdkRjaHpRZm5sSnN0VjY1?=
 =?utf-8?B?SWxVcFBvOFg3VnhlMG9nNVZzeEpLZmhraU82MC9BYmhYbTRhRUlsUFN5aVAr?=
 =?utf-8?B?M3ZVaHEyb1VHMlA2VmFIZXMvNjJrRjQ2UU1OUnY2RFBiaTA1Vzhkc1RNWXps?=
 =?utf-8?B?cmJBQUwwQTNuc1ZEMXlieXpubHRqUTVUdW01aVFzU3JHMGQ1RVVrL0dkUkJP?=
 =?utf-8?B?Q0ExY3lFbXM2cjhyVjFCMEU5YXMxc0R0dU8xUlF5dFIyaU90eHIyTzVUQWJR?=
 =?utf-8?B?SWJLc1ZPL29IZW5DRkZUWVNrbEdDdHg3U2RpVVkrcURodUtNTCt5WnVkeFcv?=
 =?utf-8?B?T3ZnYlo0Vjh3UnRFelduck90Z21nMktydnFIem90dWtJTTl4NWF2NDNKNW9h?=
 =?utf-8?B?K2RiQ01LMjhZdTQvditkcThrWWdIYllJb3A3VGRaOGhGOFdwS0FBOEdXQWxS?=
 =?utf-8?B?R2FMMHVuUmtNdHFyUUhtWDhvcVBGbVpxQTFWMFR6MG81MTd3Vy83NlR6ZXZ3?=
 =?utf-8?B?VDhmOFhWV2xwOWQ5TzRqQk9yT2VJY0lLTHROeHNVY2hFODYxWnNwN0xRWi84?=
 =?utf-8?B?NjZKS1BKaWxIa3A0bGUvSFIzdFFmTG9Qd0p1T1FqaFVkb09hRDVTM0ROWDkv?=
 =?utf-8?B?aTN4UUVPUlMzaDUyWWR2WGtyMm1NWmMwTW9FSG94RVVSYlM1QU5kbXBBdXJS?=
 =?utf-8?B?VDBSRHVWNWJaZlRtbkVHem1oRGxKUmVvYUpLcUJjblovamNodTY5b2swWXpw?=
 =?utf-8?B?NW5pZ1AyNlpENVNxbEw4eTlnYVRoV08xTXJpazhJbzFWTXJHTmRKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2E9E3CBA262864E9CCE8A24074FFD88@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deea7b8-36da-4a3e-6afe-08de9bd1b1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 16:03:26.8556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2cmgQgzQtRtODCF2pOhv3atxyCaEUZ/7CQ2a5jl2QTAQKBEO0BVROBT1+K4QGqYWXwxrfBKXqZI4yZw2gZLs9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7805

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE4OjM0IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gPiA+ID4gK8KgwqDCoCBpZiBzaWduYXR1cmUgPT0gTlZfUEJVU19JRlJfRk1UX0ZJWEVEMF9T
SUdOQVRVUkVfVkFMVUUgew0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgZml4ZWQxID0g
YmFyMC5yZWFkKGdhMTAwOjpOVl9QQlVTX0lGUl9GTVRfRklYRUQxKTsNCj4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIG1hdGNoIGZpeGVkMS52ZXJzaW9uKCkgew0KPiA+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIE5vdGU6IFdlIGRvIG5vdCBhY3R1YWxseSBl
eHBlY3QgdG8gc2VlIHYxIG9yIHYyIG9uIHRoZXNlIEdQVXMNCj4gPiA+ID4gDQo+ID4gPiA+IFRo
ZW4gd2h5IGV2ZW4gbWF0Y2ggZm9yIGl0PyBObyBuZWVkIHRvICJzdXBwb3J0IiBIVyBvciBGVyB0
aGF0IGRvZXNuJ3QsDQo+ID4gPiA+IGFuZCB3b24ndCBldmVyIGV4aXN0LCByaWdodD8NCj4gPiA+
IA0KPiA+ID4gQXMgSSB0cmllZCB0byBleHBsYWluIGxhc3QgdGltZSwgSSdtIG5vdCAxMDAlIHN1
cmUgdGhhdCB3ZSdsbCBuZXZlciBzZWUgaXQuwqAgSXQncyBqdXN0IGENCj4gPiA+IGZvb3Rub3Rl
LCBiYXNlZCBvbiBteSBleGFtaW5hdGlvbiBvZiB2YXJpb3VzIGRvY3VtZW50cyBvbiB0aGUgSUZS
LsKgIA0KPiA+IA0KPiA+IEkgbWlzc2VkIHRoYXQsIHNvcnJ5LiBMZXQncyBlaXRoZXIgZGVsZXRl
IHRoZSBjb21tZW50LCBvciBlbHNlIHdhdGVyDQo+ID4gaXQgZG93biB0by4uLndlbGwsIEkgZG9u
J3Qga25vdyB3aGF0LiBQcm9iYWJseSBiZXN0IHRvIHNpbXBseSBkZWxldGUgDQo+ID4gaXQsIG90
aGVyd2lzZSBzb21lb25lIHdpbGwgd2FudCB0byBkZWxldGUgdGhlIGNvZGUuDQo+ID4gDQo+ID4g
RWl0aGVyIHlvdSB0aGluayB0aGF0IHRoZXJlIGlzICpzb21lKiBjaGFuY2UgdGhhdCB0aGlzIGNv
ZGUgaXMgbm90DQo+ID4gcGVybWEtZGVhZCwgb3IgeW91IGRvbid0LiBBbmQgaXQgc291bmRzIGxp
a2UgdGhlIGxhdHRlci4NCj4gPiANCj4gDQo+IC4uLnVtbW0sIGxldCBtZSByZXZlcnNlIHRoZSBw
b2xhcml0eSBvZiB0aGF0IGxhc3Qgc2VudGVuY2UuIDopDQoNCldlbGwsIHlvdSdyZSB0aGUgc2Vj
b25kIHBlcnNvbiB3aG8gYXBwYXJlbnRseSBoYXMgYSBkaWZmZXJlbnQgZGVmaW5pdGlvbiBvZiAi
ZXhwZWN0IiB0aGFuIEkgZG8sDQpzbyBJIHdpbGwgcmVtb3ZlIHRoZSBjb21tZW50Lg0KDQpPciBB
bGV4IGNhbiByZW1vdmUgaXQgaWYgd2Ugd2FudHMsIGlmIGhlIHB1bGxzIGluIHYzIG90aGVyd2lz
ZS4NCg==
