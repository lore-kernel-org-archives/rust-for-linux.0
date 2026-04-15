Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812F62C1595
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271407; cv=fail; b=bJ5n5QKJ49/2A5R706AYt8sKblFE8S80aLMDo/Qt+UKqTzydGMl7YTC475zm5hfxjlwk9wn5KmOlsBHLkEiZljEqKSz52UijUUQq95354ONRT/luDaPc5Wrj+jhjMBmqSBIk/b5GsiYj7WB+ua1+q3cPU/L1PQwm+P6tVb8GJRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271407; c=relaxed/simple;
	bh=Rbjdi9szlTfJlZWbAsdkykN4keFd0JarkMhCsrlxMXk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FvoaeQzDM2K/YSTTIzkzbVKjEbAWZSbuVbQiso3wqIUt4R9EGQA+7XAkrhwTlFZfw5lryf2H2hZbDyjHZJ/8AsnEXx3sxgA5MWUTkjJvn93DfxycCF27urFilvEFHX9zIOtrq9SuNZqBethRsOKoHo4nYGex/9mWTZqtwE/NguM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cteCbjXM; arc=fail smtp.client-ip=52.101.46.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cteCbjXM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5eKbTS01HU46hbFPiddtXJHwQc/XINJXE03vBALA6QZRgOjuckMsUMRRzb1JugqYcj/DknDADDameDmwfSjz2WNjxA5OP1Jki5MnnPb3A38kuupGkBETBP4I8R9+zhb2EaBF7Iew3ownIeNZEYxfHD8CpZTpcKguYlFai7fXyZB8Nu/qCqsB6SP/H8RHehX8pYb5ZcANLBVmjqkpLcppN1VRD8sQZQHU5QOa9txCuDzfeaDJWU1+uVVtu4s5RcZDyNZInzReuAX5PgB7GGK0lTetc3VY74T61tZUMnZWShRxGnru87cZLr7XMq9OsdrP4MjVee2w8ji41ELr2NpNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rbjdi9szlTfJlZWbAsdkykN4keFd0JarkMhCsrlxMXk=;
 b=O+oZy1uopEch0vUen/aDJ006W3F/H/W3y4JWxrL26F3OGpgPNuLb3tz79haz5FLAyuWEREjErBYZQ+LSFUZVSwVzbgiutiT3qldO9+FN5ej6z4cXKBZXDs2zV70ssKxyX3Zw25bfQxDNgCOtzxt12oNucfLjthvAk+dSSvwXQY30I46oUk6iY4LQRzah6bUnwZbJD3dmETN2EnOhkya7VMUSk1OaOOhVernkUF8S1lbX/XA/+nE9Uu7Og5CvUKEzIEeFot9WZl4O2/+4PvIJFJDRGJnQMXJuZA5lLBBTBOIOVN1WkpMc4pzo1BqJtOlEFCJ87+dK5DR5udKh4YeMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rbjdi9szlTfJlZWbAsdkykN4keFd0JarkMhCsrlxMXk=;
 b=cteCbjXMyZrlZyoddXarGIAo73yXn6w+3OK3NF74xr0Vls41X8DPjdIg1wjAyT2hhVxW/RCW4NzjMlQJynsvzPwDQuGc0cdJOXflKmVHJ9dvpH2g78Txh0TYiIBfdJeu7gX3y3QOLPHciL89glG8PTvSvAoHOrdmFGGbx2sa/quJruPmwFL9yF2LyWxqhBraceftj8RM/w3gUxnrMpjNSdeT3HTE3W2ZnvHHz3XRsewg9BI8sLZc5YlsVedG0m0m1295fNHZTimcca9eWKZvZiI5Q/MF55aBsqBQ+xjg+WiX7xmwICnVwoNQBuvhGajOS+l4jaeIFwX5TQrKnFOaAw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 16:43:23 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:43:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Joel Fernandes
	<joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] gpu: nova-core: enable GA100
Thread-Topic: [PATCH v2 6/6] gpu: nova-core: enable GA100
Thread-Index: AQHczGmX8OIF/E7TpEObeLD+qZxj6rXgJPmAgAAwI4A=
Date: Wed, 15 Apr 2026 16:43:23 +0000
Message-ID: <ec32b84b55ddaa91e347d8152b10f9fcd53a46b2.camel@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
	 <20260414235047.439322-7-ttabi@nvidia.com>
	 <DHTRZVKNN3TP.1NALV3Q9B6GPY@garyguo.net>
In-Reply-To: <DHTRZVKNN3TP.1NALV3Q9B6GPY@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|SA1PR12MB6893:EE_
x-ms-office365-filtering-correlation-id: aabfb917-8c04-4ddf-8e7c-08de9b0e1c03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 6LrukL3s6xM3aUM+fKi9RwDVMIJ/489OSkKC3oSaUc9iBRpHE8cwhr0C7K7zjMPl2vEDMdPXepdvDmDpGMAYRno3bDsU9ezIB+VtPKkLnil+p/37mwZ1eH6VW/jJErEkj2lEP7IdhvVx4YbkOl+Qnq7GG/VQlZJjO8BGA8UWNd3J+0pfiqIBKHo6lHEs2XBvjIxi60hDebkhQhqz3NIzcixecH8046sGsPCRkv4878HKr26xaxHEr+8hHIVHqr7StNCf22YSNlTEx0VEsQIgNQQx4cEXh7VJhdMxBHOrQmM3qz5hIxnhXM/XU8gUkS8QuZyJRv3onS/YIstdoPtobq9D1YEGP14rAFHbTlI4deeGe0LGwBgckPgMMRxO5mTHEF25+zL/GKnQBhshqmOOrnmC11x6jj01cSD/yLv/mVcvUYLylqvTC/7BLujAx2gPlOH10otCIK8B+MwU5k4DrX01FQlQ9gI8nuGA1aXfffqZ8wghZRg++W4EOOPsQpi7LHrLObZEMY1DPnVlF+JKaQfwOCjmdWIBijLxWVyIksjde+APM8BOQQbjLtzjcSqP6mAcabIsTmJuf2WK8Td0shmSmSy/mbVX/nXz3J2YZmMyx1ssyv+XuEcX6WlaRt6ILBQOueq6rr1m+cY+Vp7RaJ0lI5I+AlvDbzvFRTl2W7Ia5IkdBeUlZRrEXyrNb89FNTwe39EXNEOyCUPnR7P/rL9ZTZiqVSoIXvYhaHO4Ee9j4W7siiQzYP6ej1aTrTAVpWWcBbqkwQg2hLPrF4gB52z18g59eNQSGIvx1zsQURI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHVJa0xMeklOcmdWL3NXUnV4UWpSZ0g5Q1NWRUpxMUdvYTRJUWJ5aCtWekdS?=
 =?utf-8?B?YlNHY2NQVXV3NmMyZVVLc25PalU3NzB5VXhSdUMxRi9RTTR3ZW9rQUNwYTF3?=
 =?utf-8?B?TzZ2L05yb3I2VnljY0JjelBqK0VydWkwYVcyelREa0U3eitxWG9GL2QzOUVh?=
 =?utf-8?B?UFNZaVJ3bmlQeDNCRGdaK3o0RW5tTVdPcUlOZ0VGQWVRM0ZBa1Nmb2toaGN2?=
 =?utf-8?B?U1V5MDNLQWJ4NElBOGhJSkN6ckd6UVYycE1SdjVCdnNYdklkR3NvNlRjcHZa?=
 =?utf-8?B?UGw2L0tZbnlKY2Q3WDVxREw0eWZqVG4zblArUWtlQi9ndUZjUzh6b2lnTWhk?=
 =?utf-8?B?Vm8wT0g4cWhSb3NrQ2FZNGdvelRiK0xkZDlNOUgrVFBPbENIcTNySXdBUUdQ?=
 =?utf-8?B?dVQ4M3RwRFFIRFJaTGdVU2hEMmFaTHhqRFlNSU1mbXl2ZGlrWlBDdG9GYll0?=
 =?utf-8?B?ME8rTVovZC9VTmRYYlZPMHN4ZmhwMXJpYUZxK2U3ckVSOW5XUjVaSmxnTVl5?=
 =?utf-8?B?RnE3TjNxL0dRWEdKV09WVVlFL0hjeXN6VzJHVHdjRUplbWZYYWFsaUJSR1Uy?=
 =?utf-8?B?ZDIyWkkyL0Fjc296NFBnSTZvUm9HZkdnWWFxQjhFRjNrU3BQaEJwMW9kc2Zv?=
 =?utf-8?B?RTgwL0VoRFVqQUFGRUl1SG4ydDkvcTE0Vk5XZElOTVkyU3BXakQyOVNNOGpj?=
 =?utf-8?B?TWhwR2VGS3VFci8xOHM3MHFrNVZUNXVrT3J0Ri90TnhwL0d3YjFkUEx2M080?=
 =?utf-8?B?amJ5NHZOTmx4UUdEMXBLT2VsQkRZY2FwYUtXeEZTei8zRmNtekVQUlpaOS9i?=
 =?utf-8?B?UGs5dmQ1dW8zbUU2UTFHcEI5NmtIcU1XSDRVUnJWbVphaWFJZS85aFRXTmZ2?=
 =?utf-8?B?UVVSUWE5V253SENmdldrZDA1Y2xZazRuSGJnVEZqc0JlTTUwdVhMYSt0Ynlk?=
 =?utf-8?B?b2d5c2RDYkZVZjVIaEY5S3V6OEVjZDczZ3lDT2Y0MkZwL0lXVFBYQncxMU5r?=
 =?utf-8?B?d2R4TVZ6SUpxVXZDeGs1dEdzbmZiaEd5di90UE5PZnVmazFKek9XWUU1dWYv?=
 =?utf-8?B?aWJJbDltYlRRYkwvcXo0UHFzeEpjOHNxR2piUGQvcHYzWWdHbUFFTDZoZEN1?=
 =?utf-8?B?RzlZdFVJM0NwczJvbEdPUnp1RVpoeXN0TGd2MkpHZmtNKzJXam9ycUJzclEy?=
 =?utf-8?B?UXZndHR1QTNIbVJITXdiWE94MTNSdXRubzF2SE1KUW9ObktrdUVDSWI0bWQz?=
 =?utf-8?B?TzJueTJ0ZlgvajBHRTFiajBwOEFsSzhyMnVZbE0wOTR5M2FCMUtuT3hyWFp1?=
 =?utf-8?B?QlUvSGh1TmQzcVUyY2RDN0R5Z3loQi80NEkvSHp6Y05oUXdtV296Rnh2WEFV?=
 =?utf-8?B?Skhka3NsYUNuQWpiWTVPd1gxWDVabUozcWhXTm13QjRvQUpDenlGRlFLRzli?=
 =?utf-8?B?ekV0N2U5QUxoVmthTGhMbmhFRTdVZ3pjaVE0bTVyQ1QzMHhLZmYxUVB6Znk2?=
 =?utf-8?B?akswRGpBTjROZnZCbk1jTjBYRXB5N2xjV2hCNVZiZHpVbkI2bDJHLytlbDN3?=
 =?utf-8?B?WkZpNVU4NzZ0MU85aHdmdGRBUHQ0NUJqMlZPazgvOXRXbEFPRlFpSGpnY0dO?=
 =?utf-8?B?SjJITEdXanFZZm9yTVdaTUY0Y0dORW01eEVnekNYK0RSKzQ0VHUrVG16ejd1?=
 =?utf-8?B?emxIbGNoSnJrelVmTVRMa3lLZDErd0tFSGtVZWZ5ZjFzaGZVQmZPUUsxV1hm?=
 =?utf-8?B?TVgrSkVCNUk5RytBT0pLbkx0bld1Q0JLckZDdUZGSStUdnNVWk1kT0VJMWhK?=
 =?utf-8?B?Q3pGU0ZOTE9aSUZjcHo0WDlLWjQvb3AwNnlBb2E3dGpkM3F3bHNONFBzZ2M3?=
 =?utf-8?B?Nmp5YWM4Z1B5dXJCNC9uTi9HUEhucWQ1RE5Ld2U3Nm9USUVmY1d3eml2VFFn?=
 =?utf-8?B?RWo5WUV5WkJGZytZelgyMm9iQWtlYUFaUktrbTRZN0dKUXVld0pwNTRUUEIx?=
 =?utf-8?B?UVFoYkFTZ2ZGWWcwcGdFNi9UY3BFVG1tMWpwM1hYSjFIN3lhT1Y3bEpEWEVL?=
 =?utf-8?B?cUNWU0JtUE12c3l4djI5eFpQOVRZdWN5OGN1UGRKeXUwVGd4dFJGZkdWejNx?=
 =?utf-8?B?aTBNWVQ4c2l1dG85ejlXUGU2Uit2bW5qMHZsd0xsUHRqQm1EaWRVaVZHai92?=
 =?utf-8?B?WWFlZmlBVWk0VUVadnJGL21yd3QzTTZPOEFtR2RMcUtMZVpLdkNtMGp5YnpQ?=
 =?utf-8?B?UFNXdlVES2NQM25pVmU5T0toV0JvVnVzNUlleWFQUmZZdXgwNkQrcVJRWTBa?=
 =?utf-8?B?Skg4MFM1c3NRWFlaMEZrMllNRmxKbm9qTXoxRGZWdVR2MndkTWpUdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C21398E946D9014E9B59E8957D675FFE@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aabfb917-8c04-4ddf-8e7c-08de9b0e1c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 16:43:23.4523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 19OWb9QcFFL/REe0ho2XxuO6QyMY+50DAgJRgEahOXAWBswL4bBIlCUdeWqdhAI0tJILSZz6pGMvSpNJVW5XMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE0OjUxICswMTAwLCBHYXJ5IEd1byB3cm90ZToNCj4gPiBH
QTEwMCBpcyBhIGNvbXB1dGUtb25seSB2YXJpYW50IG9mIEdBMTAyIHRoYXQgYm9vdHMgR1NQLVJN
IGxpa2UgYQ0KPiA+IFR1cmluZywgYWx0aG91Z2ggaXQgYWxzbyBoYXMgaXRzIG93biB1bmlxdWUg
cmVxdWlyZW1lbnRzLg0KPiA+IA0KPiA+IE5vdyB0aGF0IGFsbCB0aGUgcGllY2VzIGFyZSBpbiBw
bGFjZSwgd2UgY2FuIGVuYWJsZSBHQTEwMCBzdXBwb3J0Lg0KPiA+IEFsdGhvdWdoIGFyY2hpdGVj
dHVyYWxseSBsaWtlIGFuIEFtcGVyZSwgR0ExMDAgdXNlcyB0aGUgc2FtZSBHU1AtUk0NCj4gPiBm
aXJtd2FyZSBmaWxlcyBhcyBUdXJpbmcsIGFuZCB0aGVyZWZvcmUgbXVzdCBib290IGl0IGxpa2Ug
VHVyaW5nIGRvZXMuDQo+ID4gSG93ZXZlciwgYXMgYSBjb21wdXRlLW9ubHkgcGFydCwgR0ExMDAg
aGFzIG5vIGRpc3BsYXkgZW5naW5lLg0KPiANCj4gVGhpcyBzaG91bGQgZ28gaW50byB0aGUgY29k
ZSBhcyBhIGNvbW1lbnQuDQoNCldlIGRvbid0IGRlc2NyaWJlIGFueSBvdGhlciBHUFUgaW4gdGhl
IGNvZGUuICBXaGVyZSBleGFjdGx5IGRvIHlvdSB0aGluayB0aGlzIGNvbW1lbnQgc2hvdWxkIGdv
Pw0K
