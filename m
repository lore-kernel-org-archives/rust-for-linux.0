Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1A53E51DB
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 16:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776271515; cv=fail; b=KV48Yml5AdAVe8LVULy5rzMSumMkjQTRUd/PDgFkKFVPwIwRlsa18ORPUsp6iwSpYONOqbAZ1NyXIAwEbk0TtP9uA+/rR7kk3NsK1i9xSwnNRLE06jLqCA7iBZ0Gvq5M97V5gkRsRDI3+TsWpbPHhddWZixaXmFmAtHg/8s3JGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776271515; c=relaxed/simple;
	bh=/isDvAz5GNlOnvfD09NidAj/Ru4x/yo4bRXMZ37uWd4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iep7bjtii6aM4p6JqKbvi84hhpAF+YwOY3ZpbbSfw4pN5UXCXUbWYff2bqlHHZB00PoR6XLyGsC2V6W95hZ1v5GRY1Fsywv67S8J5KfZgx4pVNvPbYrJkWWJlGqTi9falA6Ero5Jh1hMoGQ1t/MZP08AuGlch6UqoiNcIrGbDcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h1kdWCiH; arc=fail smtp.client-ip=52.101.62.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h1kdWCiH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc5z/ujkDoS43wqJnEOatzp8uga3DGWfjHqLmPxD+O5CTT3BBi0r2WZYAbHsaXextjZjow9fNTUQ1j1RyjGj38DytfD+jo1yDZVFaUouAfUik2AGq7CtJ1GIv7JFROgEwEBLzkJ6sJ/n659ft4KeagVP0mCPGCZ1vM6M3icxzJ7drB1eIDKQA6pLWGslFY+leGpbpUXA+DtskC0m7GxrERhRIsBqlzgTDhoYCMqvNT8JV8UUAQbtj6BsDJ5DB9+D47GaleyIlJcr0cVw+YXOv/SgnTvo28b4fxHKtmLwlrpX9/PWMJmERqUi64rLpidwIjMJN/vED2RmZPU9ygol4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/isDvAz5GNlOnvfD09NidAj/Ru4x/yo4bRXMZ37uWd4=;
 b=aOT9lPgLnjmLqrTAbzdyYMJs8w/9RZM9LNh8Tmcjk5gSe+89nU0ez8YKoyRRbXA2lsltobZ9cHv4VkXkneKb7s71Er6EJIxRfUUfL+sQQqfMJXTGWLdpZQN1wWw9muYu5K0IifhkJpB/IFiad8Kp6vRoRyEdOLDZKg4pSomdVPFPQl24LAtLWRW7sS3DZChGRs3Q1K5YpUk75WP62H9qehFnjVosFGicrrZugZ1kIZaLv9z8iGi8gzd/+/IJwXdUverJBmTI27m+u6ziAsUCJHPN0vRk0LE8eEuSkleQmba7GetyYTsJ93jMjGDw6tYcmtKov2KLtRCVy9Gc7sKmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/isDvAz5GNlOnvfD09NidAj/Ru4x/yo4bRXMZ37uWd4=;
 b=h1kdWCiHFzw9G3Sxs3TeeJDd3S86Fs2HaSZlvEs8feBASr6DNQeFUIhxormdMBESHLGg1EElwRpROU+tOD0VOO4QFeAXLzCz+7KvZGhe47NQGLqQ7vs/pMCjowvBhnN7wDvj79xrpgx0dzJV7uUHxrHeZIc5erkgEynudV+RTzQ3mzn/0HG1w5NaG4iL5XIVojSLdf+Oj0xCzn3eN0rRaP73m68lxtsQvvao9ScYhtQt8hdemTQj8Nwc6HfxJT2t5SnKw+PSFnYUu2F5uI7fMqPpo/2oUanNBdYIFMqi3HIBIAI0sRp38OSa7fPNeE+hiPkorB/uSIgCtzj2rRXUfw==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by MW4PR12MB7468.namprd12.prod.outlook.com (2603:10b6:303:212::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.37; Wed, 15 Apr
 2026 16:45:10 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:45:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Joel Fernandes
	<joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] gpu: nova-core: use correct fwsignature for GA100
Thread-Topic: [PATCH v2 1/6] gpu: nova-core: use correct fwsignature for GA100
Thread-Index: AQHczGmU8PjTn6UQBUOkYRoauwHM17XgI3wAgAAyIAA=
Date: Wed, 15 Apr 2026 16:45:09 +0000
Message-ID: <fa185d19ea0e43a55a32af1e76fc1a29534a264a.camel@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
	 <20260414235047.439322-2-ttabi@nvidia.com>
	 <DHTRVSYVZKQ4.O3G9J0M423B4@garyguo.net>
In-Reply-To: <DHTRVSYVZKQ4.O3G9J0M423B4@garyguo.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|MW4PR12MB7468:EE_
x-ms-office365-filtering-correlation-id: 81d9fe6b-38f4-4d54-37ae-08de9b0e5b60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 tDT+Y+V/vUn0391kocVCW2kGbbL9FlK0dtmNRF69Y0s7DXOM19EY5mTV0MhbtdSfPWkJt6xEZnOmPrpwYaeOVMaEe5IOtQjfnAiZ8kboSGFXZ66HvWsdxwBf/GgC0wPYXgWb35+oXHsohSXJQXgu/1ctaqD/jSP9Z1bo6P/mabVd90yQEGirh40D33Gnc9/TrZDsGesPcWX8EsdZhXDqqWrF6HnPe0Szg3vERTwyp7zkPfGoPkGe0d9+kdZtSEtlju6sLqTkGC9hDc3FB8YoWvpqrEam6FLERZlbAyD3yypnuJE5AD2EGxMk4TlqKMfxiB77MAN6sD3MA8q18Mlh1WFEWzx7tyWaP37KynS5M4RaRaP4aZaDTYL6PpGWCR6CNQ/kIodQvIxOaZxyKrTcV0v4G52/9jnD7h7w1XLSZMuhFbHNo/HfLaSeeV7wwi+2Rme2UOJfToPkEngkLTlma3as1KrrEzJe5NbEd1Q3QG9/Z8ZfOas6nqDNEmZG9L6Js1Tw4/mLW70e4I7fLfTJLu2mCOMGFSZ3qp8sj3I2LcwV7dm+X2tiur1WhJPQC50xcf4PMxRjylnSZlu82vH5NTqXhG0Er1fiBA5d/t16XQdUdr3XY3QSjgQKbFiaf0dVYBs2GSlj7ke8XCoNlgX16mqnIAqLE9TqyJkm52Z6edE/6KF0Ml67XTPs6PKMK+eitU7/qZx7dEvhgQc00N6Y6G09x7b3niIeDFDRM0WQzullp8Y5AysVf2pCCx/h/aY/P93Eewldyk+wscJ2/V0TlSHfF8ME+XqAg7fRbiDKxD4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzZLTGpQMTczalpkYVRkdG1mWTc3SnRFdWVQUEJ1SXNyZjZlUHJFY1k2VjZU?=
 =?utf-8?B?N0hTd2U0OExuNjZBSmdhbVJRSjFkemd1dWNidzlsTkQxNzRHQ3RKVU1zbVZh?=
 =?utf-8?B?ek9hRmpWTTNjWVlHcjhrV0RMdUdCcFNnQlFuMTlpVnZCS0N2MUxkVGpYYzU4?=
 =?utf-8?B?TCtYVEl0bzZFRVlFeWFVWDJlYW12cko4QW12dlk0THNUTndpeVZObXhyOGcw?=
 =?utf-8?B?UjRVK0FTd3FVVDgza1J2LzFTRm84aTMvVkpvYnVtL0JyUEZHbWVGZmtPM1N5?=
 =?utf-8?B?SDZIUVpleTU2VWc3Vlh1N1plSVNVcUdSWkVBMW5LdStGdGpTdVNBZjArTkpP?=
 =?utf-8?B?TktBSUl2eW9RU0ZNT0JvUjdpcGdSdkxiSXpZVnBDcURnSU1rckNrV3plUHFO?=
 =?utf-8?B?ZXBJVVc2SzUvZUhyNWdXWlJPMmhuSVBZckJqODRsSHc3ZCt0S2Q1YURPbVB2?=
 =?utf-8?B?NnhYY0VHN0NvNDhxQ1g0TTBnYnJSNFlvVS9PejN5aU0xR2JVZlFGSkI1U3Np?=
 =?utf-8?B?Sm1ZMW11dDhqVENmQkVGd205UFdaSHJlVUNuRnhDejZpWDkzbzhGcEpUMmp0?=
 =?utf-8?B?QmlWS096cFYzZlhKZExMUDFIdmJ5SXdTT24rc1RCNVIxL1p4dUh1YTVWMk01?=
 =?utf-8?B?NURiV0krSkxBN3BxamdvY21CN1NsNkVmUSt4WlprRGhFd0pRMlRlYTdRY1p3?=
 =?utf-8?B?MW9ZdjZjTWxvc05iUmsycWo0dlpqOHJoM3RqbHhHU1QrMlR2ZTFPVXh3V0Qz?=
 =?utf-8?B?T3hrNXFwYVNQeU9ad09COGxVeStGWXVKSVJzNktqS2EwZHdVN1Y0ZUM3d1J2?=
 =?utf-8?B?K2dwQ0NzZlFnU1Fsb09KTXVLMXNHQTR4SUdKNW03cWtkZnJ4SmppcjFGUDhH?=
 =?utf-8?B?R1hZRzcvVGdwOHFEL2J3NE1uS3M5Rzl5VW16OU9COTh1VUEvU2VqOHFjWmVP?=
 =?utf-8?B?ZHJXTTBzYTJlOGtWeXpTWVF6aFVUUjN3bzVqaGh2a0prN1daN0E1RDhUdFdC?=
 =?utf-8?B?amJXS2FEMEdBWnFuWXkyektGanpkWGNZaEt5VUJrTVRTVWhMSlZEU1ltWTRw?=
 =?utf-8?B?eE83TUpNN3IzcXFCODkra2tPc3pnbDY0cTRaSURHY0ljQTZaYnFrVDF4SzNE?=
 =?utf-8?B?VXhOekxqVEpaZFM5d3hIeHk3ZGw4U2tzeDdsQTBlTWdxNjdETmRRSlBYY2dz?=
 =?utf-8?B?WGd3Y3o4UFZhOHJXU2tBdmRQTXIzMEJ5bHMrOThYQkRsUnA5Z205U1p0Wkxr?=
 =?utf-8?B?WkxPWDErdDJXQ1Z2Ny9ySnAxcHdXc2NpaTNBRXNBbS9Xa0dpRnFMTTlrN1Ns?=
 =?utf-8?B?VFIwQk02OUk5eFpHQUpIZFYwZVVBSmVFTThUU083dUozUERQK3RWWktWKzli?=
 =?utf-8?B?eVJhY1hOR1FVYmRQcnFhWWo4ZmVTRVZtQ1ltclZOVjN1ckM4TGNQbFlGbnB0?=
 =?utf-8?B?b3MvTmZsWHc5TFdva2VnTzRNa3pDSUtTeVljcjBQWHV5ZERNVjBobHJFbysr?=
 =?utf-8?B?R2V0UFNtTDVsYWNUNndCN3VzODRWc0VndFhaeUJKVWtETWprMEdnZnhJQmZK?=
 =?utf-8?B?dk9ObHczUU5XVTB6UkdJS0w5NEZIWlFVZGxJL3JrdHpnYlFqa1lxMURyZ0ZV?=
 =?utf-8?B?WkRFb0duQTFjQS9qVWQ4YkZiaGx4b2EvbXZWQlp1b0x4dG5Odzk2a2t0UGE3?=
 =?utf-8?B?c0g2d3IxK2xGbkxLdVlkSmdlQkNjZi9mRmlrZ29jMUMwc0VaR0M0ZjVrMDlK?=
 =?utf-8?B?WHRpNTFXZW5FTVdkMG1WZDNkM3k1N2RnNGxzcVAvemEvazFSdThBTFhFcWYz?=
 =?utf-8?B?REZGUUgxRDdmS3MwVVVYcklmTnFZY09EdTVmQ1ZRQitCVUtTMzNUUENURDd0?=
 =?utf-8?B?Uk1iVWNQSDMyQTZLZDNiZU93MzVMUExIWldwNGFzTHF0Zm1HM29WczZHUFFO?=
 =?utf-8?B?dXVhaUhNeTVxcysvKzEzL2wxc09qQkxnVmJjNmJFaGtsN1VxNWdQT2w1dTNH?=
 =?utf-8?B?dWtEb1FRZ096YWt2aGVjRlRWTGpFRzQwRnBvOGlQU0RvblFIS3BrU2JwQUpO?=
 =?utf-8?B?eWtpK05HYU5EeTRUdkswVlBYQXZiMzNlVjJMZG01OGlCdUZTalpsNkxRRUpP?=
 =?utf-8?B?aG5QNW9EUSt1dm5Sdnl0a3pOM2ozbyt3RzFqZWdheFlhUER6K2V6eTR0bWFJ?=
 =?utf-8?B?RGtzTUwycHdNYjluSDZpWVBsUnJsY0VPMmV6bTFQTlEwcTdPeEZUT2ZoM1hO?=
 =?utf-8?B?Slh4ejNDVWhldUdSV2JwWGg2YjMvT2tyTFlsbHhLRktpZ2puV3BrU1dwWHFM?=
 =?utf-8?B?RzhGODU1Wm5ON1o0Z2FiMjVNamMzTURlR3Z6Y2pabUZZQnhsSDVJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DCEA754EAD12ED4CB3B6C4C572DF03B2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d9fe6b-38f4-4d54-37ae-08de9b0e5b60
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 16:45:09.7174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXQhWD4DB/c/kQWMQbVGj0Ob0KBaCfNO/o3TxO1+9ND6xxj4HdbQ0t5WWTgLHKS9lQdsvlCuUydrytyTGkHL8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7468

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDE0OjQ1ICswMTAwLCBHYXJ5IEd1byB3cm90ZToKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFyY2hpdGVj
dHVyZTo6VHVyaW5nID0+ICIuZndzaWduYXR1cmVfdHUxMHgiLAo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gR0ExMDAgdXNlcyB0aGUgc2Ft
ZSBmaXJtd2FyZSBhcyBUdXJpbmcKPiAKPiBUaGlzIGNvbW1lbnQgc2hvdWxkIGJlIHJlbW92ZWQu
CgpUaGlzIGlzIHJlbGV2YW50IGJlY2F1c2UgR0ExMDIgZG9lcyBub3QsIGV2ZW4gdGhvdWdoIGJv
dGggR0ExMDAgYW5kIEdBMTAyIGFyZSBBbXBlcmVzLgoKSSBjb3VsZCB3b3JkIGl0IGJldHRlciwg
YnV0IGl0J3MgYW4gaW1wb3J0YW50IGZhY3RvaWQuCg==
