Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011017.outbound.protection.outlook.com [52.101.57.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEC0377EAB
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 18:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773601077; cv=fail; b=gF/qyi4kd1wRD9EnOeCX8XVVedT0wjNuXfAoF2JsWrmqdepfPVq2ZBS639PUg0zWLPJE74yqXvVLtqrWYGyFFSA+xwwIbA6bIh9TSzD/7k8+PlSpVtahE/+sARaekH+V3+emxMn9Wzc23YE+2u/2dONjOjpoGEpEwpmvMuliZm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773601077; c=relaxed/simple;
	bh=TltU7cEQ+SnzjNdmV+CLd6C3PrnMSsNHQxexJiQyrcI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FhlFDV6qf0qSno0OiCR/zTn5eCqW1ujK1FXsA4eYkPwERnDozOiTVqX9npCK1FSqROdbN895OKdfUWRM9wLOzjFiGx5V4huBAtliAczWOFL35Ad/hucA/wfYNuEm14y3RNFw6ppkUKP+mAgR/aGrRl9Rdg6JWSzUHHds25Xj9yQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aT1I8emE; arc=fail smtp.client-ip=52.101.57.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aT1I8emE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YEVQICULX3LtsJm8o7cp2wgpLwDqUKQ92xfKMQmQZOdzVSJEODjjOkWvQw4mRosd8eju3bZt6R+cIg16LXf+k0/DEdF+FuSdoa2slStptNiEWUDJhsCAoyJYtl4M5BJct1pyWd7KHrJC3kOat6U5rqVSEBl/2ABSzTfe/AJ0tJ3pakcRGwq8VDU+SQtZ8zGulEceUCVdJOkZTwT414HqkdQFsuaN3wKpyIoVzXcDMWxo9dUAFd138sMQZVoKlgz+FrKCOdYolOf3aJi0L4uO82mDvrczOjwc1nanqFhz6xW6rmSPD1TKtfLcUT4GqqpAq9gsd2oJQYkKVrlgyTyotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TltU7cEQ+SnzjNdmV+CLd6C3PrnMSsNHQxexJiQyrcI=;
 b=jtledWR1LyMrguuBX4RCXncYcM1EvVEhTah3og/51Uct8H0TtKY61UdcH5V8ErPurFUu/V56QDqXotCem5LK1vcn90c1hkOLGZsEYQ1aWAMNbr1LsTTloYsMYvK4psnNi/qtvDlAk7FR1OU6QN1ApM571ZqtPxBZCZQaxzHiXZiNm5Dyk4ZWSbR/GZ9dmvS6kFkhtXhSHaDz5xY7s/LwBnPzlCre9Z4VuYERq3kkWYTWnTi5M9dQC7OlXZwq5TuIkeDWsx41M27LshCCtsVsn6bnJQQ4zAesW12LAW82HtWef3Z6i3vLG88U6IZ36X26ndn4UuaAx3XcQr/bfWph0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TltU7cEQ+SnzjNdmV+CLd6C3PrnMSsNHQxexJiQyrcI=;
 b=aT1I8emE41U8tnzRSWyyELOG2QN6YwSHMGD/dCx7mrW2b7iDrDMoqhPcu2X25hMG+ie7YenJ081NDbH6h1xenjhrTqG05JCmQix71nnWw103gJ7L0bQIZFHK38E88m5L3yDwKi1e++U33Gqo0tZx27MSR1Q7UrOQ2qNdSTYymbc9c46W0uTi8F0/gFKHIajy8xJTX5LDGrjrTaVzqNBFzHu7oK0oGVDnNEd0qSMRjNlMaIG+XgIcmq6yobq93IkROIOZlJOnaH0ZvWwdhhjesco8PWBuTod7Bcww7gJxokAdRWebJ10Qy5SO1LI+vNd5PKYfuGYRjwcmVCdT3pX1Zw==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Sun, 15 Mar
 2026 18:57:52 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%6]) with mapi id 15.20.9723.013; Sun, 15 Mar 2026
 18:57:52 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "aliceryhl@google.com"
	<aliceryhl@google.com>
Subject: Re: [PATCH v8 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
Thread-Topic: [PATCH v8 3/7] rust: dma: implement BinaryWriter for
 CoherentAllocation<u8>
Thread-Index: AQHcsNla+9snc1lOYka4UlljF5Iht7Wru7WAgAGQmYCAAcZEAIAA5vmA
Date: Sun, 15 Mar 2026 18:57:52 +0000
Message-ID: <26a6d9f2f22603a71f36f73c98590aa1a0077a95.camel@nvidia.com>
References: <20260310220000.1897166-1-ttabi@nvidia.com>
	 <20260310220000.1897166-4-ttabi@nvidia.com>
	 <DH1AG9IDZIDO.2610KTTZ29MVS@nvidia.com>
	 <ac909647923d01f1e00e40bb0af83a546fdb1f10.camel@nvidia.com>
	 <DH33IXMUWQ3T.1QMJSFCCA8NTV@nvidia.com>
In-Reply-To: <DH33IXMUWQ3T.1QMJSFCCA8NTV@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SA1PR12MB6799:EE_
x-ms-office365-filtering-correlation-id: cbcc4639-c6a5-47dd-905c-08de82c4c2aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 s47+JwsB9W4mSMaurWujf/xeWy6YYNRvCzK95mv0S5hLqKdXiDwTlHdsJo+iZwg0mGPzhnywLhuGHSaUv+OGnhc7YY+Z36FCjDtP1U+qViZ4cmMb/n6hGupiIFnz2OkzQGzU7Bjgu4nz1sa6RHZsijqjc7eOSfbL5OMa85aSL/TsTOInLaTvWGpc/HYxRmjz59iLV3O4gV4Q9nuhYLhrcK17xxr3CtXOFS7vKIqPJYlfBvcBXDEfGlBsVeY/FRxl3DtyrhgwAJR+r6UMvyr5iamMYKBiWI65c59Awc64G71fJN5Xh7FKdNIMvVK+bEb+3RheczUAK3Cjmr5XiA9UdnY6RToXi6MmtCKrzqQ50tcgSl7jCJGPGc1bkZpDYSdbPZSNE6oj5XzpHOQK0fM0in4H+4T6UxO4wYG1/cY5+0ahbex96bBVCxm/bu0AyoetfVav2Fr9Q2zo+KG6xMYApNohp18hFekaADJrWk0KwYkajRED2Gd61DGLFIvn3cU8nYuBboIcYiJrmryoqTdVV3axXrpRygWUQI91DYZwemuwVHr/JpXr8iqvox2VWQNM4IMAuvfrZBAkPplIkHfJy5hZkZIX4B8rcgfpwXuS8/6MRBiC1KLvJ4Sm66nUSwrnfQgLSckSY8jZ+yGplsHtT6g5H1Nrw+2I+BRnLPMWYuSjFXp5DFTpxq8gaNoYm6l1DBhr1rbSqO2A53+gOV6jenncmy+f4PRYKarnYMwV39HLmbNqLL8tdXqzTsCCIpNroSRt/HES+d88RivUT2WtNYfyjTnNRsVXCPEol+TYjvI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Qkt4MnZpdDE1eE5TUTRsMGRsMWtFMVZ0YmJ5eGg3YzF0RkZTT2NLOUVqK0Ir?=
 =?utf-8?B?K2diQ01OVGRvZFkyOWNadlA5V0pOTzNsWWY4dFVMUktWa3NvVElzSEZKeFFK?=
 =?utf-8?B?UzRFMWd1dXd1bFFrZkZ3VW5VRUVVRzlxcHhTTDUxZUpXRFpnbUZmN1htR2tE?=
 =?utf-8?B?NHpNUjJxcmxtMkhucUZPM0EvcnJzbGdFK2NIQndVMGRXOEZEbDZXaGhmR3V3?=
 =?utf-8?B?R0tnMmpYSzJhWVNMQ3kvaU5JanJ6VXM0OUZTdUZ0SFBCcXpVRDJuVnF5dFk5?=
 =?utf-8?B?QkRLWVZYYW9SNmtqWVMrT0NCSzh1cWUzckV2OW5weFVsQ1hXNE5PbnozakEv?=
 =?utf-8?B?T1BLNmV4OFllUGZOUDYzTU1MaUdJVlpzdXQ3MDU2R2hINENjZDlYNUlja3J3?=
 =?utf-8?B?dEZaWUVUSlBhWVNkVXFpenZwS09Kd3BsdjY4eFl4djlnOXA3aUFwaGVZc0RS?=
 =?utf-8?B?UTBtSy9yN3UrZE9WdDFzRTcrQytsSDBYcmZ3Y2JOVVZ1NnFwRFVQTitCWXBQ?=
 =?utf-8?B?bGxlMFZVVHAyVlluRkZCVFpiNFNBSTZsNmVMMDl1Y0RQMCtKQS9mR0E2Y1dw?=
 =?utf-8?B?NXpHV2hEMG9SK2UzN3VkMEZRREhnK3BnUGM5MG05L1RaRmpXdmVjTmk4WnVn?=
 =?utf-8?B?RUVkWVVFdHdDQXQ0M0kzTXl6Tm8vekl5ay9ibDlaaUkrVWQwd25acWZ4NTdZ?=
 =?utf-8?B?dEVScDkzTW5zeEpGbE1Ydk92QkE4bUdUNmJ4aFd3SFVTVjJ3elNXNW5NVmlI?=
 =?utf-8?B?RXJLdzE2NGpMT1FxbkRMMjY3UTcvRGZoVDNVbEhHNnFHcktlZjFiemxzZS9k?=
 =?utf-8?B?RkhHK0k2RHdreWNqR20zbk53TEdPS0pxaUtVZ3YvZlN6dEFmWjVxLzdIcDk1?=
 =?utf-8?B?ajlTRnNLOFh1cXBmSHo3cGNwSXBxSEdjQWI0VmxZaXBSZFZJY1JiTFZaL2tj?=
 =?utf-8?B?MUtqRnN5dTdtQkFBdXNLZzFINmFjblduWmRESGxUUlQ1emhJK0JGS0k3Z2dX?=
 =?utf-8?B?K2tYUnFwaEVNZEhsaDNqRVlmdEhlSEx0c3FFWkFkbUYwZE83ZDVoZk9Lc2NW?=
 =?utf-8?B?VWFHT3RLRDRTaXFvbkJndXlQTDdYc3dBYWQyMkJHS1FjemNPUVdFNDJJb3Bx?=
 =?utf-8?B?WkF6ZHduckIzaEZjZEZSYk5NZFB5SkxoTFZsakdMVGlJZzdvNW1JR1NXR2hU?=
 =?utf-8?B?Mi9mRDNJdkNMSC9wVTRaaXZOUGJoblhtNERpT0phNGtjVU1tQjR0ZEZYa2VG?=
 =?utf-8?B?eGlsWDlWWFZlRDVhRE9KT2NwZTNlSHpackpQNFltRmRwenVvZVdxMHdlSUZT?=
 =?utf-8?B?d1pQQkRTNGxRbGZldnN3aVMrZHBQaWRrY2tsaktQTUV0cWtuWTNYcENPb2tH?=
 =?utf-8?B?STZoVEtiY1ZyTEFSaDZoclNNTFBSdE1FWVpGN1AwQUh4ajlBRTM3dXc0N2dM?=
 =?utf-8?B?UGZsTk5RWWRneVJpdHg0ZlpPUHh2eTh1S2VQT1BVNnhtSUJ1SXhQUUNVYUwv?=
 =?utf-8?B?NjdxRzRVamFvWDRjZ2o0TjkrVmFzUVR0eDVycHFBNUZ3Z2RMbXpwa0JaenMx?=
 =?utf-8?B?WStRM0hEVU5mOW5XdGRIV25xbGdHV1RwV0Zia25jempqUjhEeTRyUWVacHNi?=
 =?utf-8?B?d0dVZWwraXg4NXQ3a0RsNHg2czBpbEVHWDF6Q3pVcithWW1MR3VsMnE3cHYw?=
 =?utf-8?B?b2EyUU11NUpib1R1dXR1VTFkR2JyUDlCVmlnWDVrUGNNU3NQRUhqUVFreG9k?=
 =?utf-8?B?WmNjMml6Z2IrbGRCaDg4SzJNRGpXbzNaZGJ6ZngrTm9tb0JKdGFZTi9lcDFz?=
 =?utf-8?B?UzMxdlZWeXoyNm9ZSWUwVjlhcUo0VTFPcDRsMjJQbU5RWmxCb2hsZ2lQVUlO?=
 =?utf-8?B?czNZTlRtZitsUVBNMDA1YVc5bFJBM3RYRkc1Tm9uY0MxMjBGa3BCZVBzUmQx?=
 =?utf-8?B?cEMwZGZmRnMvS1JDb2MzeGl4eUhncGo1WWhlMnZ5MUZtYnBTZWNHQWxXelBR?=
 =?utf-8?B?dk5GM0Jod05SMTJvMmZxYzBmaDZqZzVZR1BxUjZ2NWhWZlBRS1JnZ1Z1aUw4?=
 =?utf-8?B?NUpWV2lSb0owWDJic2RPUlQzdUdUNGFEOU9jZFh5TWdPMkcxMzZjMXJSNTI2?=
 =?utf-8?B?ME90QVdWWGFyZkM1UFBMSzJ4OXBTRHpwMmNTWVU0WHZ0MklWS1h3Q2RRTFdz?=
 =?utf-8?B?K2RSZVVKRGNURTE5ZkJwQWQrd3hVS0lUckVkMXhaUGpBby83Zyt1YVN0QkF4?=
 =?utf-8?B?eWxQM0t4akp6MFlCbGdwOGNQVEJpaXY0WXdvRStOeGdhcDRDS3lldDIwOHRO?=
 =?utf-8?B?SmpVYUUzd1k1a1cxcWRLZ3B2NGVQS00yRGNLWmZpTVdaNjNvaGFUdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9463E90E19F80E4C8F78B97539550042@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcc4639-c6a5-47dd-905c-08de82c4c2aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2026 18:57:52.3931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wAGi85wN8q+Sg/eW2TUky/FCDH++gE8DlWeLdpFoIBqRMSCRuF1Tn4bfcoPnfHm/54VotSmDaEKBE85ZrIP4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799

T24gU3VuLCAyMDI2LTAzLTE1IGF0IDE0OjExICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBXZWxsLCB5ZXMsIGJ1dCB0aGVyZSdzIGFjdHVhbGx5IGEgYmlnZ2VyIHByb2JsZW0s
IG5vdyB0aGF0IHlvdSBwb2ludCB0aGlzIG91dC7CoCBJZiB1c2l6ZSBpcw0KPiA+IDMyDQo+ID4g
Yml0cywgdGhlIHRyeV9pbnRvKCkgY291bGQgZmFpbCBpZiAqb2Zmc2V0IGlzIHRvbyBsYXJnZS7C
oCBJbiB0aGF0IGNhc2UsIGl0IHNob3VsZCByZXR1cm4NCj4gPiBPaygwKQ0KPiA+IGluc3RlYWQg
b2YgRUlOVkFMLg0KPiA+IA0KPiA+IFNvIGFjdHVhbGx5LCB3ZSBuZWVkIHRvIGtlZXAgdGhlIGlz
X25lZ2F0aXZlKCkgY2hlY2ssIGJ1dCBzaG91bGQgbW9kaWZ5IHRoZSB0cnlfaW50bygpIHRvDQo+
ID4gcmV0dXJuDQo+ID4gT2soMCkgaW5zdGVhZCBvZiBFSU5WQUwuDQo+ID4gDQo+ID4gbGV0IE9r
KG9mZnNldF92YWwpID0gdXNpemU6OnRyeV9mcm9tKCpvZmZzZXQpIGVsc2Ugew0KPiA+IMKgwqDC
oMKgIHJldHVybiBPaygwKTvCoCAvLyBvZmZzZXQgdG9vIGxhcmdlIGZvciB1c2l6ZSA9IHBhc3Qg
RU9GDQo+ID4gfTsNCj4gPiANCj4gPiBBcmUgd2UgZ29pbmcgdG8gYXNzdW1lIENPTkZJR182NEJJ
VCBmb3JldmVyLCBhbmQganVzdCBpZ25vcmUgYW55IHBvc3NpYmxlIGVycm9ycyBpZiB1c2l6ZSBp
cw0KPiA+IDMyDQo+ID4gYml0cz8NCj4gDQo+IFRoaXMgaXMgbm90IE5vdmEsIHNvIHdlIGNhbm5v
dCBhc3N1bWUgQ09ORklHXzY0QklULiBJIGd1ZXNzIHdlIGhhdmUgdG8NCj4gZG8gYXMgeW91IGRl
c2NyaWJlZCBhYm92ZS4NCg0KWWVzLCB5b3UncmUgcmlnaHQuICBJIGZvcmdvdCB0aGF0IHRoaXMg
d2FzIGNvbW1vbiBjb2RlLiAgDQoNClN0aWxsLCBJIHdvbmRlci4gIEl0IHNlZW1zIGluY29uZ3J1
b3VzIHRvIG1lIHRoYXQsIG9uIGEgMzItYml0IHBsYXRmb3JtLCBvZmZzZXRzIChmaWxlOjpPZmZz
ZXQpDQphcmUgNjQtYml0IGJ1dCBzaXplcyAodXNpemUpIGFyZSBvbmx5IDMyLWJpdC4gDQoNCkkn
bGwgcG9zdCBhIHY5IGxhdGVyIHRvZGF5IHdpdGggbXkgYWJvdmUgY2hhbmdlcy4NCg==
