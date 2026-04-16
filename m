Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0409D199D8
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Apr 2026 00:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776297656; cv=fail; b=sXT7EbtkfFEtq1EYrDsTAq2vObTxH3KYUtYJfdRS2bcmy0BED//2bpReVPlA5lEDqWd0vusMrGxANckp6pkxMo9fi9l7mwZkWcb2V3CIhNd0H6w6w6hOOkfNNT7f5y39eij+cEACo01AUiuZiiNVrOz3Ht5NA0dTBwbVsPVrGDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776297656; c=relaxed/simple;
	bh=/wDf6xIgXYK6lSQCbRRaM7gOnRvuJIRT0ntiZaA6s0w=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d30GGvPibZVDa72iGCiIuD45wzycgrid4v+HM3Uamo3LnSfZCqSTe9j/LTxe1JfvBKEn+zY0J55Y1I6x6GhP8RIwVPVp7KcUMEGvPvy9VSVPf8tCwho7zvNVUpJNFYZdwhrBGvqKC3cU9mktB+p0eh9EQduj1HA/ae7vM54mvfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G3dR1h55; arc=fail smtp.client-ip=52.101.61.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G3dR1h55"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfpFbu0uQ2t7F1jLSbpoN2ovk9O/a2dNMly/6KcEvSwGqBKYUca6SUYiqtLTswAEQXT+Q/DMXaXxEeWv7+V2Lpml3+6yOpEjIFTNrWqD/HwOua8d0DQ8iqf8B+tAOXnQO9liaQHVxNR6LUsIyc2RPbcuadnc/GaNfWDVI7G+nH2dlVUR2A8Fsepm+0X77bfW8cFK0WqGNdlDqERQqhTVgQiWh/swS2xmkpQK4ZHadwWmXP0n8B3KCYKEO+5A6gGfOVCHZILBf6nSHJGxHrSlnuE9NxhsUXCi2SS+QUE459ksZRHN8j3W5Q0Tyf8w6t+iUXwvm/sPX6Yv1JmMJv633g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wDf6xIgXYK6lSQCbRRaM7gOnRvuJIRT0ntiZaA6s0w=;
 b=sSO8eC03I2TQrCDxsVU6186L715ymyOFKhqjP7RsnPxH+QEbfWPVgkgian3dLC0725ArjcPip2c+ihyM5UyIQm7USJ/lpjZx3LnFYzeNQ1KDj2pibwUWui+/n+rq0KT6wg2FhlX9+7NU/Xgww/ujoEieBVANEjOHdzOeAkjIeKqTdlVWAqPRkrauUaX3GRZVL3Vd2dciRQl/VmW0uFwC53NCa3lHvPl9SEnFPX0npFejmRMZjbG+fdljH3Dy3LXFqqmEAMpN1vBw2DokzWVk2w5/hn5Sn5pJbwJLFTLo5ffdCiykFqpAAaovrRhZJ5OGt+OpOIT63aMij2QLrJM6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wDf6xIgXYK6lSQCbRRaM7gOnRvuJIRT0ntiZaA6s0w=;
 b=G3dR1h552TJeoZRrfNbEkn4f+aZbxJF5/2z3slDgfPMCjVSMvbAp2buM7ziZL0Eq5nP+ryQAAJKbJqj+9XxSmLI/d8PHmQYM4QwlMzJZIENvaQ9BVBoy5Dm+JMsCsX76UExknc8e/tIC0D7cUmTmDYbL0PFvr1zLldl5HKNzWklfgilrHWMt1cxxDtImjoh60lPQuHDVkrPIBoJxzZ0iwdA9NBIBOMY3tqX0ZQw79oYDZwg53UeezO9WLg/HbeoVh4iSNRsT7+Zzvxhplg2T/Xwzq2BE3JSVL5rJqIZLkygxTu1fWqSlLoq9t96s2WKW2PC+I7Ddbgu6d2Um1gcT2A==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 00:00:51 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 00:00:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
Thread-Topic: [PATCH v2 5/6] gpu: nova-core: skip the IFR header if present
Thread-Index: AQHczGmX/7gBt0Wx5km8JIJK+Y5ALbXflxOAgAEIOQCAADANgA==
Date: Thu, 16 Apr 2026 00:00:51 +0000
Message-ID: <c5729db265dbab17735f50cc41afce555db12e6b.camel@nvidia.com>
References: <20260414235047.439322-1-ttabi@nvidia.com>
	 <20260414235047.439322-6-ttabi@nvidia.com>
	 <DHTH70U5666G.1ZGXQJ5TSNN7Y@nvidia.com>
	 <025756bb7dab3527b3070a94f8b4f70b5ba5622d.camel@nvidia.com>
In-Reply-To: <025756bb7dab3527b3070a94f8b4f70b5ba5622d.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|IA1PR12MB6460:EE_
x-ms-office365-filtering-correlation-id: 34385210-86c0-43fb-59a2-08de9b4b392a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 yj+EqoPZvGlIoqQdaPJWHTXie7R1atnCUovj/TOakar7zW4ye7B6MFz1ijKdyvZl9wU0Ye8+dd0iL1ymNpqNGVOn1gL7yqZelPnMq4DFe/PlOoEI6LKNXqLX1vRK/hUFaC17ex3Lb12G/Iei6J7kVLFBdEQ+WAJpuiS78gj8elB2+mYhhE0rlZZWkGVxW57haMeMivzI60UH8LEzFzF1R7XIAFotzQz8lgk0xJO6Zc5Y2ffrPjaLHjndnvy/COXatv05pXaD41hNTwxynzz/kk4Fw/SoKhTiIwJOhnL9h9g863a1XJ5rgIEZH1slhwNv29yjUO1IPXpuMX2/EEvY2ExDk5kVEyIYdJe/j6Pt/eAY2E4D/xN/9rbN05MVNXVXqib0NtSHlTgh3YxDwVonpqto0zMqU07gBRe1wpnY75ql7foJySBxr9+vvVRsGP06FunAlh+Svty0NYzjkfjWhwsVVfbDRKLlY5Gufe1RzgxdM67gyRmpDMDBjg16DE9XPeYQKSGOjPdFl3QjEPKrnWHTlhdSAxZey9Fn906ka255qae9u4MZAVwPCde5t8DUJoL5lEAZB/OrdVb7NxMelLVCPlf4SG11apuW+xpo8BH/Oq4XgK5J0kld5xKaM73SpZrNhr9+b/qM18qQlFVahgB67Rrp5TLBQ1c2vr3h7Bed6LIpkbHgAp+n002A13qCfMSZLCcfZLFkfSQYq3NPer/uY5PJVL+SOfzKuX1zP1KM2pJgPWtsFXiTidn2N7q9xQk7MtFRhfglaEsiRbXhSvkgDWwR0KbotKXL4HsfZ/M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmZKYjE5Y3pSU0xVWUNhM3NTRktXb1FsT24weDMvWkVjYStMbCtIc0tmdUxv?=
 =?utf-8?B?TE5idzU1L2JCYk8wSFNTSHYzWG9na3NRZ1VOSnNDMCtJalczSWQydnVNUnIr?=
 =?utf-8?B?MVFqYnRQTGR2Vm1GTktZZlZVSkJMdkE5MnBZWUxKL3N0L0RkOVJUeVNFYThp?=
 =?utf-8?B?VHBsVm50Q0xsUXYvbk5EbFVoQzM4Z3pIM09CWjRjNVdLK2pwSEk4QUFha1E2?=
 =?utf-8?B?OGEyakZXWWIwRTBoWmNFdFQvQ3VFdjNJeW5PUHF4aGlzeGhLUnlyMzhWQ25i?=
 =?utf-8?B?M0JJb2RjcmRSSGVqQjRaU0tDUEhPUGxxeTZEbzVueDRDcTF0SjBSUUpQbXV3?=
 =?utf-8?B?ZUVub2R3cjJGeFNzZ2hqaHMxTW1vdWxQTFNKREtURkVVN2hGZEpJdUVJa2Vw?=
 =?utf-8?B?dDZqMnFLVEUzbzNUUndoVzhmQ1BZSENsS3hYOS9JVGswalZ3S004UmtqakFJ?=
 =?utf-8?B?TVhLMWY0Rjd3c2Izd09aVjNpZm9UUVVZUXFSUkI0ZFlzaWNnQzFUM2RkbVlM?=
 =?utf-8?B?OTJqVHMwc0NxZGVxRWtkc2dsb0ZQNGlEZTlUMmk5V2Y3VzlZdGFscXNPY252?=
 =?utf-8?B?aXZjY25hbmI4VWtoZnFDdlJ1V2srWGFHWUhYdk1wY1FvY3M0NThUMElrMGlD?=
 =?utf-8?B?Q0NPMWlGUk03Nko1aTRLL1MvMHlyaGlVMXA4b0l6TVk1TDA2MUFQVmxBTmR3?=
 =?utf-8?B?RDhtN3ZxYW0yZEx5Z283NFhkcnd1OWx4UWthSUtqUDRKQm4zemM3bTVKUEF0?=
 =?utf-8?B?WHFmdjU3NytZMkdXZG42OUhaZEl2bEx4M1RGTjZBeEIwczJjSlAxMDVSbWFq?=
 =?utf-8?B?NUg3dW5wMXZqUllpYURlc1VTVGlRdVNuNnNIU0w1dlZ6UU5DSDh6NkdSNTVP?=
 =?utf-8?B?ZmYydXluL2dXQmpIdVU2eUNydnBJZ0VaR2tGRkhzSlJxSmhqcVNOOTduQXA2?=
 =?utf-8?B?TXZ4QXFmcVYzcDBFVUgzNlN2YVFwZUdJSkZwUzVESS9oT1Bqb1djV2E1Wkl0?=
 =?utf-8?B?WVZPMW1DSm5PVEY0WEpsSmJrNnlTdU10SjhYOUIwUTdFY09GT3BRTjRKbXB6?=
 =?utf-8?B?M0drRTlKcUwyTU0wSnRhTFJXaGlSSmcrRnkrckl6dG1aWEo3RVpnbmFicnQ4?=
 =?utf-8?B?TUFIcGFmdWFIbjRqVzJ4V3p6Q092Rlh2SFp6YW9icldsbUpWRmQyblpCVGg5?=
 =?utf-8?B?dWpYb3k4R1F1VDhQSXpCTDF4Y1A2bmZwcDZ4eW81NS9QZDl5dlU2UVZLSDFV?=
 =?utf-8?B?TERmR3ArMUswV1I2YXd5bEV3NDFKS2FBWVFHWEpuVUozbGZrY3lKYnpkS25X?=
 =?utf-8?B?dVdBZkxDSHRmY2x1c2FDZHR3bmxGaThUd3BIaHJNQjF1UVRyMDVOdytaVWVF?=
 =?utf-8?B?Mlg4UzF4aEZlaEkyT3FiaHR5dVVjb1BqeXhtUU1odUk3YUlvQ2Jubm1RLzBj?=
 =?utf-8?B?WmppWEszUWZRazVXSkZwUUViSVUvdDErUDV6eU9qOTIwSTJ5dkhteUV5eDZh?=
 =?utf-8?B?dWswY2IzUUpEdXVueE00Y0d5YWFmV2k1UVdyZGZDblNCRlloTmdhUnYrWFl6?=
 =?utf-8?B?R0FjWDdPN2RsM21Idm1OQm9mcVBndUYvejVyNS9LUFdEbnJzc1owd3JvRmFB?=
 =?utf-8?B?ODdCUmxmMTVrWHRheGVuS0dsdFR2cWJMOEtyc1g0VWlOemxhSjV2YTJCRC8x?=
 =?utf-8?B?bzByOUtILy9WV3Rpb2hab2JGQTllRkdteWZiaytFRU95TW43c1NyNHE2QWM0?=
 =?utf-8?B?ay96RkdOWXlIclRVZTlrSlM0dnFjcEJYeGFjaUptNUFFQ29lOXZmMHdvczlr?=
 =?utf-8?B?S0kxdndpZEZ6cnZGTjVkc3liSVNGNGxDNWk0K2R2RVB2RGNiMWkxUjhOejVy?=
 =?utf-8?B?Nzk5UHZkekt0V2QzWkVkSGNITXJxcGc3bmtIMVpSakpIRXFuNVRybXBFRHRr?=
 =?utf-8?B?K2d6eE43bW1DUVJ2OTBmbXh3TjRaUWVNVFZSemdTdVZXV2hFelVXdU9kUTZn?=
 =?utf-8?B?S24zaXRFTDFjcUtwVW9iZW1RSGlBN21VZW1WdlhzQi9JZ3ZxYkNjSlhYSW9a?=
 =?utf-8?B?ZCtNTFE5UUc1cEhvS1UxN3hKU0dYdFVmb3g5emoxelJVRVJjVWQydlRadldV?=
 =?utf-8?B?Z0JYM2VlM0c0QmhYdmFFWGRsMUVhNGFmbkwzcGV3azZTMCtLWThhYnlIckxx?=
 =?utf-8?B?N09hOWVFcTQ5dWJId2g3MG53MVh6cHMyTWRhSmdaT28xeEZRL25rNkVqSko4?=
 =?utf-8?B?MjdtQWRnWUREQm9za0FvSkZONkE1TWRzcWdrTlRTUjhYYTVSSjF4WDJNS3dY?=
 =?utf-8?B?dmJLUGlGc3lZaFI0cE5rMktwZTh6YWxSKzE2K0hyZnNWaG91OThwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1024871016895A4486588484B62E80B2@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 34385210-86c0-43fb-59a2-08de9b4b392a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 00:00:51.7073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1h21LFngjWtipmiXW2VJqyM9c3mi57dUQz3K0A8YyCqa0WypcifUnfjjwjLU5vpdlgnsOreT4cRYpBs0OC27cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460

T24gV2VkLCAyMDI2LTA0LTE1IGF0IDIxOjA4ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBU
aGUgc2Vjb25kIHR3byBJIG1hZGUgdXAsIHNvIHRoZXkgY2FuJ3QgYmUgaW1wb3J0ZWQuwqAgTlZf
UEJVU19JRlJfRk1UX0ZJWEVEMF9TSUdOQVRVUkVfVkFMVUUgY29tZXMNCj4gZnJvbSBkZXZfYnVz
LmggYXMgeW91IHNhaWQsIGJ1dCBOVl9ST01fRElSRUNUT1JZX0lERU5USUZJRVIgY29tZXMgZnJv
bSBrZXJuZWxfZ3NwX3ZiaW9zX3R1MTAyLmMsDQo+IHNvDQo+IEkgZG9uJ3QgdGhpbmsgaXQgY2Fu
IGJlIGltcG9ydGVkIGVpdGhlci4NCj4gDQo+IEFsc28sIHdoYXQgdHJlZSBpcyB5b3VyIERJRkYg
Zm9yP8KgDQoNCkkndmUgZ2l2ZW4gdGhpcyBzb21lIHRob3VnaHQsIGFuZCBJIGRvbid0IHRoaW5r
IGl0J3MgdGhlIHJpZ2h0IGFwcHJvYWNoLiAgSXQgaGFzIHRoZSBzaWRlIGVmZmVjdCBvZg0KaGF2
aW5nIHZiaW9zLnJzIGRlcGVuZCBvbiBjb25zdGFudHMgdGhhdCBhcmUgZGVmaW5lZCBpbiBHU1Ag
dmVyc2lvbi1zcGVjaWZpYyBoZWFkZXIgZmlsZXMuICBJdCdzDQphbHNvIGEgY29udm9sdXRlZCB3
YXkgdG8gYWRkIGp1c3Qgb25lIGNvbnN0YW50Lg0KDQpTbyBJIHRoaW5rIEkgd2lsbCBqdXN0IGtl
ZXANCg0KLy8vIElGUiBzaWduYXR1cmU6IEFTQ0lJICJOVkdJIiBhcyBhIGxpdHRsZS1lbmRpYW4g
dTMyLg0KY29uc3QgTlZfUEJVU19JRlJfRk1UX0ZJWEVEMF9TSUdOQVRVUkVfVkFMVUU6IHUzMiA9
IDB4NDk0NzU2NEU7DQoNCmluIHZiaW9zLnJzDQo=
