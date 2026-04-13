Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE2F242D6A
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Apr 2026 19:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776109795; cv=fail; b=bcyu8jSxBNsxw2csViNq+02bnf9QrYZe1oifCavFgj1ediP2xD1yJ8QobEBJ7khaKMhJLhzLa9KNgBKkYvZubTLRs89yYg+y+k5tTSqNSuQsLsdFH0OWSSlDsCJPhTFQIUuRR03HXWDQVbGG/gj5Y+9ta0bnda7id5hTjeRaQ2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776109795; c=relaxed/simple;
	bh=8ldCfE12PfF+J6pbc+J4RY6X1qdE6SoAR8HVUaThm1A=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qBuvxRBBXWmp6BtIDZhK8tpvUV2pXAOxF300g/9wCI78XM2/LZO7aEORpHfR9f41QjPGQYy1ygLw9bo4gOJ6uUfUjHOV/yUzKDtIfGyN2iIkh9+E8ZzqjcqStmmviwtIzVWMFkovrOP4F9Rwr30hgjpAVw1I4f5rlwPzTykguCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kvpbpxkO; arc=fail smtp.client-ip=52.101.48.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kvpbpxkO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfCFlWRUMdPZgU5yuaojOGZDoMDXsUh9I4itMvbyTYAgWAUYThix1242jZFEQmN2pijTXLbrIBtJx41eoYDHBekypsLdc0d2zMEr8r9vuWG1Y2sXaa0qwOaX24YJSbauzyiEjgc25NxeF2cV8+QICxXu0h1LTAVJ9HJzS4neGCPlxHbOho4Tx9qwlseMEsa+KEGrFF/AcgAP3AFu7PL/6MZru0ZT1VGVgR/vv8Lpg6w46h9W6Sn8fPEyLUjbI7UDoYB0MDq/6AXjjnnFiVL5P/AZYrbxiIre/qJBSVtOwRODKM1XAbcyvJ2uhCOcFjcM0ov/93a01vVkv69nRGw02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ldCfE12PfF+J6pbc+J4RY6X1qdE6SoAR8HVUaThm1A=;
 b=q+V2HOypBthO9f4lfh9rnHco171yfyr/qHAtLukmtpm3pQJIe5vZQe+wtPSl+vq4PSr0B8z5iIfazc0m++GJImc2dAAtu82Qejngo7c5BCOAfNE3IdSpct5daETkie6ocQoUVWnoyT4/dchQZpQ4I9JNdWDDsthUleB81XZfxNwAAnFVVfB6+bLWJfZnig6gXaFIHxGpATfMNT/LM+Hv1WtTdQUpWpUNOJrTeA4VvmjJ45ytw8hCxaf1K/91VXNrz7pqmqIZsLubA9OmF6ANO1vHKI6Lug3q5EOQ8yGOv2akHRL/B9a3fcr4MtfFy6SP+4177xnWw2v2lb5vOnrilA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ldCfE12PfF+J6pbc+J4RY6X1qdE6SoAR8HVUaThm1A=;
 b=kvpbpxkOLdmTagFX2CuUnfWj9dte795Q2m/YWsCk2fKJxZQjUa9vnuyKlJQFUxTLqwU9oTnMA6t9NTvs2/Z4t5iJo1YMPoT7uec/BlQHZM4G+G3aEMY7cfyNTu9wwuoaTtKwhciYpF1IXGM78SF/uh3HBM9/W9uqE64UWepKc1UDO1G/VxpdY1NX6xHuo9fbqRVGCzMThoBF1aMVjXvxgb8pJ+Qc4nQSekNu0TNCkuyqnj8j66E6V4ND52+VMP1gisNdsjpMSagDREBP5dc5109Fc7ufy7veDVjkWaORb8ZfkGARMDXCJ9oM9mnthjtag9KFjF8yMBDTKqOWMe/VOQ==
Received: from DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) by
 MW4PR12MB7032.namprd12.prod.outlook.com (2603:10b6:303:1e9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 19:49:51 +0000
Received: from DS7PR12MB8420.namprd12.prod.outlook.com
 ([fe80::b9d4:6de4:f1ea:88b2]) by DS7PR12MB8420.namprd12.prod.outlook.com
 ([fe80::b9d4:6de4:f1ea:88b2%6]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 19:49:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually exists
Thread-Topic: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually exists
Thread-Index: AQHcySnnvwyzZYVrtUS7y+nCSnycsrXcZxAAgAED+4A=
Date: Mon, 13 Apr 2026 19:49:51 +0000
Message-ID: <befb74f0523b01622fef9f18691b97481c5875f4.camel@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
	 <20260410203722.1586938-4-ttabi@nvidia.com>
	 <DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com>
In-Reply-To: <DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB8420:EE_|MW4PR12MB7032:EE_
x-ms-office365-filtering-correlation-id: 8d3c0b34-4821-4728-a06b-08de9995d3a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 mOKiKtrKtUVZSDkVLeh5H4NyGa5700+PRQUwKwPxGS7xdQZWL992w4CDsjmHxPNq4SuwwI9XRBlsNfM7imcpmOiLNqQva3GbQh29cvLogzgMns09lE9CDU1sV24WuWTxBci3UzfouxSEZLPxeYy701mTMWlm5MY+AZeSbqbv4NoKZZoL94TeJi66x1bxWw/eWKByO+EdWetuVyMsJjhUZqI0nXWmuT8Qc+38Z6zrd06w15VSufQxol/gyiix3ZjaVFagqES9h1cy+TDqKRk4BbswlxuVR6L5Po7dpEYtCWIkQaV1sGR11Z30DLvxG0iZuAeZC0LwIYJKcMMfcI8lf5JvQjL21P21diemifSBOutuD9GuAZZFiHGsjPe6UJWBl1QrWXCA4nDCQ5mff+jTb/MelEOCaaV6JONHyMrCqgL+ynMq0u2kmx8Lp/VTM2UAwVkoLQqxqpGIKJB/8bhYEQ6t3sdlOrzu+nCu9aM4jMFZWHp0ZwMF7KB5vXb6PnLpP8rZdHwlxGPOg4nutac66RVO9hFxgZQOwFmi3Mj348aydNinz5IzOTon/xBuK8Mte56RJHz/rhQwB0fYsyMQrPH33UZ+H9Xb4psaS3FMOWiVDLbkXmGv7u9WQbcfI7LgGd1tZ0FLYmz8HPJAbMtKGQ2LAXn1xpmuAZ/zIGDnWoDhZxd9ywUg77c68rGxBbDM2oyA16lzCo5z4ZjpgmNuiaZC08/h60ruCvyo8iEvPMEAW7DsUgny8grAfbNxm+LE2NIdRodKaKIK09HK+gsUBVscPFurB6fv67ZcTnDk+ao=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8420.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGpteHY0cUt2ZU5veWhTSTZsQjhpWFNoUHZvTWhtb1RkQ2Nod0NzRnFEcThC?=
 =?utf-8?B?cHZGSzk1dlZYa0xiZ1pOYzBjZEw0THZTMzJ5UlVSZ3JzbWdDOVNpSmpUU00w?=
 =?utf-8?B?QjEyN3NabXRXemlNRng0TlY5Qmh5aW1qcThENmZsbW0xTFFWWno1dVdCcnVH?=
 =?utf-8?B?aHNCSE95Z3VHbWVFL3l5Y21mb3NaaFFBV0ZMSjAvdVF5YW11L29XRENwZDNC?=
 =?utf-8?B?QUZzTmlQMkJEaWhaWXd5cS8wMVcwWW1KRitseEhDYkgyVnhGbTY4ci83eUZU?=
 =?utf-8?B?ditBV1VRemVKMnhUY0ZqdmxJTUgzbUlGZ0NHSEswVjhoS2UyTEJmR3RVdm9G?=
 =?utf-8?B?Mk5ZakNmVjdNQStMS1BNS0R5QzV6UDZjQzc3QXFDZlc0N2E4SjQrV09TcC9Z?=
 =?utf-8?B?a2JsTHFIby9YZ3hTSFNZSVB1cjZ3N0tKK3ByTCtiR0VVYXZIRmRqTEx6VjJo?=
 =?utf-8?B?Q2NsT2YvZFZSRzB5b0Rlc1lIZXdIcDFFaGpmM212YUNBc3VJRk4vT3dPNkxQ?=
 =?utf-8?B?OGt0aTZLSHpOYTg3YTl0MGl3UVY2KzBzalNPMjJQS0RNSzdPL3Zjb05qeTZF?=
 =?utf-8?B?OUVjN0RUV2VLRnFwRDJMWHIvaWVnTnpINE1wUDIxYitoUGlQazJYajZsUTNC?=
 =?utf-8?B?bHcvOUpsMk5VQTdxU2k2RkkyZ3JETFU2c3k4WmkvQWNZYzdmcGJvaytmUUEx?=
 =?utf-8?B?SHZyVGNuV2ljQ1phelRYSno5TnRyNGloVzNabHZvcDloclBzTmg1RU52Zlda?=
 =?utf-8?B?a3BBdTkxNlY3dm0yNjlLOUZxUkE0V09TRVdROHRQejgydGdoVis4bXVtazFx?=
 =?utf-8?B?TllQOEtYaHFzOWVqNUNHb3JNMWMrRWFEbFBpQWhjOHhhVExFYXdHdkxhU3I2?=
 =?utf-8?B?MHdqRUhUTmRwYWkwSXVMSEMvTE1QazM2aDh2ZDdONU5CRWhxeHF1dmtONWF6?=
 =?utf-8?B?Z0NaSTlUMjdDRTNHdTRVTFQ2a21sZnhxbmpFSjEwS2d5ZFJWb0poV1JqK1ln?=
 =?utf-8?B?S0I5WlRQYjBGUzRDN21UcWNGNmpSVDhXQVZoRnBYUEtON0RVQ3RXSzdvSHZB?=
 =?utf-8?B?WjFwVWh2SnpoSGplbm9SRUswNjB5T0krMmlyZlJwK29zWFlRZTloTzR6ZUNn?=
 =?utf-8?B?Y09NUXkyKzAzWU5WTVhqcHIrVzZTRndPK3NGY1hlTWtRbFpsa24rUFFzVzhp?=
 =?utf-8?B?YWh1Smp2ZWNRSHFuT2dvcmdsNjhWV2FUSExiWDVEM082bFY1K0lHNmUyQkZM?=
 =?utf-8?B?bmtEOC9uUkZpdExRcERoTzgwZkxJSU5xTDk5MGZQNFNudTJNZml2QVpsNjVN?=
 =?utf-8?B?UFRRVzhMRFhwQU5haS9GTGF4THR1L0NWN3NkZlpYNWZWeTlxL1FYQW1FdHc0?=
 =?utf-8?B?azJ3Y2gwNmdpNWl2c2lRVWk1NmVGakh6ZkRzcCsrYlZPc0ZwSWoyeEx5eUNu?=
 =?utf-8?B?RXRUa2JwaVpObndJWFBZbHgxYXEwYUVVd1NuSk5yVmtya1BRV1ZqMjEzSktP?=
 =?utf-8?B?Ymlxa0pSbWxHY3N0Tk10UDBzNjN4a3htMU1GaUZ0d0N1ZlNLRStOZGFTWlN3?=
 =?utf-8?B?T0IrcVViZmducFdONHJIRW9hditMMFl4dTUxMjUxZ2VudURUcFNQQytUUGpq?=
 =?utf-8?B?ZjZWNkVrS0cvdy9yK09ITjg5NnZEV0lXVGFjSHRZb3lvZGFMaEVveGRuWUdh?=
 =?utf-8?B?aXc4dm1Qa2pwdzVlVnVVMlNZanRTRzhVaVNaSTFKMkRhZzlCTUMzOGxYN1k2?=
 =?utf-8?B?dngrdlBzN2JPOW4xNWptbUpFWkQ0N0dtalFBVkF0ZFVKMUpuZGJCNG9oVUQw?=
 =?utf-8?B?OWhIVmRXZUF1NlpjblN4bWJyMURidnhPaWVPS2EvSmVGQUlxYkx3bzlHTU1J?=
 =?utf-8?B?REVQclRUcnVHQlM1Y2luNVg0QTBuZ0k5QzA2L1RlY1FyZm93c3hSOURJN1R2?=
 =?utf-8?B?anA0R0pYNU8vOGtDWHFLKzN3NWxWdmZidVZ3Y0toTElXWGtWaFFlbkJSV3hx?=
 =?utf-8?B?blVLK21RMVRheHFKQ0V6ZjFTU2U2OGxDOG5YT1lZL0lXUE1kQlVoZTFXUHJL?=
 =?utf-8?B?cndUVW56V3ZMZHFvcDJ1S0dOd1J6b0JvRkllK29VWDVjMmIyZ0QzOFB4TjE5?=
 =?utf-8?B?a0R1c3lESkkrTGpXM0h1bms2Wk54VFRYODV4SEM3N1ZHa1dWd01hNnBMYlZV?=
 =?utf-8?B?U3NLR1V4YzhGcEcxZ2MrZEF4TUs3NmVjN0RyWGdVcElKZUlHVWJLMUpIMlVQ?=
 =?utf-8?B?M2V5ZHVBaG1kOGpja2NOSGhPTFpZbnlqUU10R1cxRjFYOTVBUUg5c3hSOTcv?=
 =?utf-8?B?Mndya3ZMSVoxdkcwUEpBb1h4SWxmc0kwaTNqSFl1bEZ0Y2p6cTJjUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAD606CFB24C4A4381DE405C55D43074@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3c0b34-4821-4728-a06b-08de9995d3a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 19:49:51.2900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xf7EI2vhkqgVKB2tur2IcReWGTQtV/kS6CfrAMJvanrKy901wqfqLrpk6ovK5ZqAOSEWShW+DSEV8yBr+zMRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7032

T24gTW9uLCAyMDI2LTA0LTEzIGF0IDEzOjE5ICswOTAwLCBFbGlvdCBDb3VydG5leSB3cm90ZToN
Cj4gPiAtwqDCoMKgwqDCoMKgwqAgU2VsZjo6cnVuX2Z3c2VjX2ZydHMoZGV2LCBjaGlwc2V0LCBn
c3BfZmFsY29uLCBiYXIsICZiaW9zLCAmZmJfbGF5b3V0KT87DQo+ID4gK8KgwqDCoMKgwqDCoMKg
IC8vIE9ubHkgYm9vdCBGUlRTIGlmIGl0IGFjdHVhbGx5IGV4aXN0cy4NCj4gPiArwqDCoMKgwqDC
oMKgwqAgaWYgIWZiX2xheW91dC5mcnRzLmlzX2VtcHR5KCkgew0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFNlbGY6OnJ1bl9md3NlY19mcnRzKGRldiwgY2hpcHNldCwgZ3NwX2ZhbGNvbiwg
YmFyLCAmYmlvcywgJmZiX2xheW91dCk/Ow0KPiA+ICvCoMKgwqDCoMKgwqDCoCB9DQo+ID4gwqAg
DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBib290ZXJfbG9hZGVyID0gQm9vdGVyRmlybXdh
cmU6Om5ldygNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXYsDQo+IA0KPiBJZiBG
UlRTIGlzIG9wdGlvbmFsLCBXRFlUIGFib3V0IG1ha2luZyBmYl9sYXlvdXQuZnJ0cyBhbiBPcHRp
b248RmJSYW5nZT4NCj4gYW5kIGhhdmluZyB0aGUgZnJ0c19zaXplIGhhbCBtZXRob2QgcmV0dXJu
IE9wdGlvbjxOb25aZXJvVXNpemU+IGZvcg0KPiBleGFtcGxlPyBJIHRoaW5rIGl0IHdpbGwgbWFr
ZSBpdCBjbGVhcmVyIGluIG90aGVyIGxvY2F0aW9ucyB0aGF0IHVzZQ0KPiBGUlRTIHRoYXQgaXQg
cG9zc2libHkgbWlnaHQgbm90IGV4aXN0Lg0KDQpZZWFoLCBJIGxpa2UgdGhhdC4NCg==
