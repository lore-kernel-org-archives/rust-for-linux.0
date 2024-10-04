Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010004.outbound.protection.outlook.com [52.103.20.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB041D5AD8
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Oct 2024 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728042633; cv=fail; b=e+XLzuyeH815fX6by7AJELa1migAvDkjOxatn/+9RLo9/yEGstXoIPbUPRugtQGAmyVZYggux3tJ8ew+iuBKUPNMLyGfPdFxT9NFzfb+4EB73m+X23sA8k7K9SilAb+cClTOkrVJRsBqqhJmjLfHyN7hF/qJXGIZ9XpiD9TkYjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728042633; c=relaxed/simple;
	bh=nFPb6pXT57AJcALF/jiFC+qm0n/r20Mo9VIolss/2ME=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kIvQvXitqH4CWWxurxnjZ2QbA5BFzytSeFC1Wz8kEgFRAoKZ8dG2dFh21j3Z8FYP7nIO6aXzRJC3lUWfCSlhwlVex3suF186WXW5O3HWvZjZx+9HHi3T+ju67XyHPFtWOt5xzIK+OWd0lnVtZ9UN5CDx3Lt5IEleZOvv30nyXSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=L6kBxntj; arc=fail smtp.client-ip=52.103.20.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="L6kBxntj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl7mtxpWCx0DWaC97yHZGUhZCMbNQkmCU/CjfTNgMVzCEb5BKt+HNQ/Jlpkzcsbhr1+4B0m9viiSWBKoVnNHk9VwrD+NCP+8eM+8sgvtkr65XptRr7lTEzGvOJxCwzCvr+tTb/RgUR4fJ3iYB/y2BhLd6mohg9OpvuzQmHw1ZaHww9NE2b07RiJOEvkqOTl0IQ3Z2nX3X18JEVwVZ4g9l1Izt4H11yLkrKlEcIMVKtnAwuTQageosZotAtug0CXLOkxZXBbXLlljc48Ce4C8DX18entTsoza0Hcvu0NUlyHTi+QJ+HFn+/JINoDYLWgQ8yEFDTdUTVWznowrhQV16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFPb6pXT57AJcALF/jiFC+qm0n/r20Mo9VIolss/2ME=;
 b=vN9LhS/bU7R0i4JgG9orTUxS4rzhFloaYmakDfwf08ykoJcguKIppNjvIEix0lC8KhUVuvOl9hvU02EpdvlaqngQAQeIM+yCxS9Jk9rm6p3oWSDNTHd5YhILcDUGBiNOlmAfoIl8ZYtmmaPuPIcMsRjhY7BTuFdnQQ88Qa582boc/PttF1ngYNJW0D5/YMGsgmzwxZRP6GvFMGD0AikbGiauEmjUscfSn/ebs1IWgBzhIeCEPCUcWLozL2r38GkXI4e95HNJAxsdOaoIcXYBdhyPY/iI+sx+UbuSnTatCGyTfuxGsuS46wqWsg9eevlzNcwmXpPoBNRuRdhjCLFnvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFPb6pXT57AJcALF/jiFC+qm0n/r20Mo9VIolss/2ME=;
 b=L6kBxntjaZLv0/MowJPqgFEhJlfsnHKMAdPHbJRev9ZCyo17gPEN+E/qU/sPVG8ThXGUhG8HQJNGbPOJLKzcoRWTzLci+MRAg7ASCpL+Mr8Z3NY70nQYzXunjMtVtAfNjbxbRRBt6j0i0wJsmNg7Wsooo2MK91mLNPEuMYMUzNr2jhWuL44Nd/cVHUe/0E+buXSeBQnnM3tCHMTdYpIK7GijiZp7hXmQF5sBe0WSiQUIHzD0+nwne4pkkYuUE50cJ20InelF6HoKwSpfzkiAcJ8PXXLZ1LIdfC/jSY9BJVGPG6i180kXNRDlm+/aK71K9UwCHzci+Tmp/jf4JIbYSw==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by DS0PR02MB10289.namprd02.prod.outlook.com (2603:10b6:8:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 11:50:30 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%6]) with mapi id 15.20.8026.016; Fri, 4 Oct 2024
 11:50:30 +0000
From: Filipe Xavier <felipe_life@live.com>
To: "ojeda@kernel.org" <ojeda@kernel.org>, "miguel.ojeda.sandonis@gmail.com"
	<miguel.ojeda.sandonis@gmail.com>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: optimize error type to use nonzero
Thread-Topic: [PATCH v3] rust: optimize error type to use nonzero
Thread-Index: AQHbFahP9OWFfUsSZUuXZh7D51fhPbJ1q0AAgADImGA=
Date: Fri, 4 Oct 2024 11:50:29 +0000
Message-ID:
 <BL0PR02MB491430823078BAD42FD56D13E9722@BL0PR02MB4914.namprd02.prod.outlook.com>
References:
 <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com>
In-Reply-To:
 <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4914:EE_|DS0PR02MB10289:EE_
x-ms-office365-filtering-correlation-id: fea8fa09-b392-478b-ecba-08dce46abeb4
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|8060799006|19110799003|8062599003|15030799003|461199028|7092599003|102099032|1602099012|10035399004|4302099013|440099028|3412199025;
x-microsoft-antispam-message-info:
	=?utf-8?B?bjRDbW84QkpSK0NKU1ZwT2pPZ0FZU1FIZ213aUN6bGwzTkNKMmhuNHJSdkNn?=
 =?utf-8?B?Qng1REVhY0VYWnZOZS9RQURHczZtKzhxdWpCYVRCZ1BoRkgrbEpDVGU4bVl1?=
 =?utf-8?B?aEEyRzNCT3ByTlZiTGtQa0ptektwWnhNYm1OY1NaWjdkQ1FKSFBYR0ZHMkt2?=
 =?utf-8?B?WXloODlqb0E2T1dXMzVwNDFxNGlBNGZ5a2hwcUlXcXN4US82UndzQVRVTy9O?=
 =?utf-8?B?RE1xem1pUFpTdUlLZFhOR1BUWEd2aHlBTjZVNEk5TzN6cVE1dFpuQlFaREJX?=
 =?utf-8?B?VDFINFlEWlhqTHpYRkFodGl2eUFJay9STnV5ZXJtUUtRdGZ5MUhqamU2Rm04?=
 =?utf-8?B?VjJ6ZFZQaGNpbGFNOTJheVQ4SkZZSmVWeHVEOGQ3NXZHNVNnY0ZpSHhSMloy?=
 =?utf-8?B?SDd2elVGRFQvR3k3NWlTc0hzTHJhN0JtK09wSFRaWGJhb0xLUENUc3ZmQTBB?=
 =?utf-8?B?dkFxa3ErN3RFempDRFprNnkwNEQ2ZEZNc3RIUnNYaG9wNStQOTdBekFFNFda?=
 =?utf-8?B?WWFjR21HbTZVTjVCTERqSDRCakM0QytqMU02MHM5aThKVk5KbG9EdHphdW5p?=
 =?utf-8?B?b0JPWnlWeWdTSWgzbkR1MHVDakVqbTdxZDlzOSsrS0lKUHFxUWF0ZEE2alUz?=
 =?utf-8?B?TG9mbkJwZ3hlRW9CVm9scEVKMkZpOHU3VXhqMkMrTjV6N3dibVdsbHNKcVJC?=
 =?utf-8?B?T1FmM2lCMlFuYkFTaVU5UWkzdFZFU2tkNE0yNDh0L3F1K2MyTi8yNWd4NHBn?=
 =?utf-8?B?ZFlKZjZxSmFodWd4cy8xSWZ2Zmc2ZnF0aTUxSkdrdU5FRE9TNWF1MlNVSEwv?=
 =?utf-8?B?dUV0YmtsaXpUTldaNjZNa0pYYjMyRkRVenBIcmdJVGtCRVgwbHB3aVVCUkU3?=
 =?utf-8?B?d2g5ZDNJNUdvb29IQlE5ZWoybnQ3OEMzOTNxSVpJcVF0NXJTdnNlT2F3aUlO?=
 =?utf-8?B?eWRWNlgxbHE4NHM3M01RWHVPYmNBL3BFbzNuM3JGckpMWmF2REpPMGlGOTRm?=
 =?utf-8?B?Y1RQaHhyTVBDNTVlNGhkbDc5OUYyczg3QjhoVkdNcm1RRU1qd0ZJZmRxV1E1?=
 =?utf-8?B?YVMxWUtSRXYrUE5WZ0RuUXFPZGQyZDN5L0c4Yk9uN3hwWVZYZGZyRnJyclZw?=
 =?utf-8?B?SkNDbXBMUzRzREdDYWJCYytkZmRnbDllUEJDRm5jcTBCVjVySGk5dFpyV2ZY?=
 =?utf-8?B?THBkazZYQVRhZlVaYWJRY2Z4VE1oRjVxYXZJdHByaU05Y2IvSWJKWm1OMkMv?=
 =?utf-8?B?SzF5aUwvWFF2Szg1MUZGRHloOEhGKzl2ZWlqb2ZhbytUTERKQT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFR4ZStFUzBlNzhzRGJiUWloZ0J4bVdXeTg0cEdhTEVLdDFKUFdJVWRJVnFm?=
 =?utf-8?B?V0ZES1BsNWdqWTJHaHFrNVlaTlhDSHBMN1hkSGFpcDg0bU9RTXpXNDVrMGRv?=
 =?utf-8?B?OFN6aU9CSDdOVHRRT3BUOUs1aEF1bVN0ZktvdkdGSDNXSUlGd0JLaWQrV0F3?=
 =?utf-8?B?QUN3a2tsRmtVQ24wVWkzT2I0ZHZLaVd4ZGF6eHRjN2toelovazc2UHZLV0dF?=
 =?utf-8?B?d3FXOHRybWRHS3BkWndhRUk1QWwzeFJyQnJnVnpxaVFuMk5KOXlTRFdNMzJY?=
 =?utf-8?B?Y2MwZ3FyMU4relVBcHNOY21TS1EvNkZSamphcmRvMStNYm5GOTJyQWJBalpT?=
 =?utf-8?B?M1p0elN5WVE4VkgrcU9hUmhLWDZreHpWdTFSV3NkUzFwdGhYeG1ZQmdmaGNp?=
 =?utf-8?B?ZmF1WnQ0ZUtDcXpTMjRITXlqSHgySStLYUpWanpnMm13aEdnU2o2Q2o2VHM4?=
 =?utf-8?B?RlFNQVVuTENuS3kxZi9EZHd3dFQwcmJkakdOakx5dDcvMGdDU1pTdFBERVF0?=
 =?utf-8?B?V2lVbGROT3BCK0prOHRXRXI2ZlNyaEZaZmRybnNhQWtoZHdxSjJuaEo1S1lm?=
 =?utf-8?B?TW4wU1BoMnlvc0ZaWWdQWTVjaXVlQnFTeTRKMXByYmRFOGwzZXVjT2FuREFq?=
 =?utf-8?B?alZoV0RtdlJ0djNKMnQxdGFOVml1dHBGa2hNSTdZQzVHMEpObS9mZW1GZFRq?=
 =?utf-8?B?QmV3blVvbFNGY0kvOEhOUmo0Z0h1Ym9BZkIyZUswczVXWkt2T2krVldLQUw0?=
 =?utf-8?B?OUxwU2pMdktrYUdYOXFsbzJqdXNXSW0vR05NdUVha2NlZ3RlVndvRkM1bmZy?=
 =?utf-8?B?eU1YZHd4ZFIvSHlINTl0Nm11RWk5S3hkTUsySjBXMG5WL2dlZEZhem8rbk83?=
 =?utf-8?B?V1hxa0ZtQS9TWncvc1JIekVrUjNUZkNYTjV4bWk4eGs0RkVTNGovUnVJM3pa?=
 =?utf-8?B?aXp1dDlKd2RIU0V6TkZGVkQyblIvTFFrd3dHM0ZqY1A1b1FId2c3WWlGaGFM?=
 =?utf-8?B?dEQxSVo0YWZLbjhlMUJXY1liSEdjSHRsUzJOV0dqYW5NZkYwUTI0bjV4b0ZU?=
 =?utf-8?B?ZXB3NU1tRk9lb2RQV3krQnZBZFFXNW9weTJFUFJITGpNOTNVcmhLYWdjVWND?=
 =?utf-8?B?aXZTblZaaUVUMkRoRFFnVmtQZ2dubHpqa0JhcERCaDVxaEZCQ1YrLzhJUlJp?=
 =?utf-8?B?MUJaeGlLeDFIYUY1cHA1dHR4MVlFL2FnQW1ia2ZPNjNSVmVIcUVvMzR0ZmY3?=
 =?utf-8?B?SVpkMEhhWmpSWkl5VTZCZ2RPS1hMUitUK04wa3pGM0QxdXpYWHh0WmRXeWdU?=
 =?utf-8?B?OEFxbnhMbzRObFNUN0FHaGY4RmlVNkhhdlBmSGZxRmVDOFhjdmc3NTBraitO?=
 =?utf-8?B?TXZsckdrRHFUbDNhaVQxd1FhUitsTkpwbDluZHBLb1JYUDAzTVdITStUTFp2?=
 =?utf-8?B?RmczOGFld3NhSFFjaDBWb2RoeG9UdWVvdVdTZmtHMjZTeHJUMTU4c2YzUlM1?=
 =?utf-8?B?Q1dQL1U0cHVGME5qL3lEeExvaHJnb2NhZXQ3dmpJZ1BsTVZReHVVQUQxaXdD?=
 =?utf-8?B?Z3pyU2dnK3ZiVENkM3dFYXhWNWRiSEd3S1NOdTNwT25SRktnZGxWS21peEkz?=
 =?utf-8?B?NHQxYjhvOHFMbmFWMmFMbkFOOXkrb2ZNVEk2UzNKaU9uUURUbjJvcWduWHB5?=
 =?utf-8?B?NEdmeXVYVW54d2ZpYnppblBCWXdKbVFQaWNCcm9ocmNKNEd1bkhSWld6byts?=
 =?utf-8?Q?ZU47rNKVw/+iHauRzw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-0f88b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4914.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fea8fa09-b392-478b-ecba-08dce46abeb4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2024 11:50:29.6753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB10289

T24gRnJpLCBPY3QgMywgMjAyNCBhdCAxMTo0OOKAr1BNIE1pZ3VlbCBPamVkYSA8bWlndWVsLm9q
ZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6Cj4gUGxlYXNlIG5vdGUgdGhhdCwgZm9yIG5l
dyB2ZXJzaW9ucyBvZiBhIHNlcmllcywgaXQgaXMgdHlwaWNhbGx5Cj4gZXhwZWN0ZWQgYSBjaGFu
Z2Vsb2cgYmVsb3cgdGhlIGAtLS1gIGxpbmUsIGV2ZW4gaWYgc21hbGwuIE90aGVyd2lzZQo+IHJl
dmlld2VycyBuZWVkIHRvIHNjYW4gYmV0d2VlbiB0aGUgdHdvIHZlcnNpb25zIHRvIHNlZSB3aGF0
IGNoYW5nZWQuCj4KPiBJbiBhZGRpdGlvbiwgeW91IGhhdmUgc2VudCB0aGUgbmV3IHZlcnNpb24s
IGJ1dCB5b3UgZGlkbid0IHJlcGx5IG9yCj4gaGF2ZSBhIGNvbW1lbnQgaGVyZSBvbiB0aGUgY2hh
bmdlcyB5b3UgZGlkIHcuci50LiB0aGUgZmVlZGJhY2ssIHNvIGl0Cj4gaXMgaGFyZCB0byBrbm93
IHdoeSB5b3UgY2hhbmdlZC9kaWQgaW4gdGhlIG5ldyB2ZXJzaW9uLgo+Cj4gRm9yIGluc3RhbmNl
LCB5b3UgYXJlIHVzaW5nIGhlcmUgYSBgYnVpbGRfYXNzZXJ0IWAsIGFuZCB0aGF0IG1heSBiZSBh
Cj4gZ29vZCBpZGVhLCBidXQgSSBtZW50aW9uZWQgaW4gdjIgd2hldGhlciBwZXJoYXBzIHRoaXMg
aXMgZ3VhcmFudGVlZCBieQo+IGNvbnN0IGV2YWx1YXRpb24gKG9yIG5vdCkuIFNvIGdpdmVuIHRo
ZSBgYnVpbGRfYXNzZXJ0IWAsIEkgYXNzdW1lIHlvdQo+IGZvdW5kIGEgY2FzZSB3aGVyZSBpdCBp
cyByZXF1aXJlZCwgc28gaXQgd291bGQgYmUgbmljZSB0byBtZW50aW9uCj4gd2hpY2ggb25lLCBm
b3IgaW5zdGFuY2UuCgpJJ20gc29ycnksIGFjdHVhbGx5IGl0IG1ha2VzIHNlbnNlLCBJIGRpZG4n
dCBrbm93IGFib3V0IHRoZSBjaGFuZ2Vsb2csIAppJ2xsIHNlbmQgaXQgbmV4dCB0aW1lLgoKQWJv
dXQgYnVpbGRfYXNzZXJ0IG9uIG1hY3JvLCBjb3VsZCBhc3N1bWUgdGhhdCB0aGUgQyBoZWFkZXIg
ZmlsZSBkZWZpbmVzCnRoZXNlIGNvbnN0YW50cyB3aXRoIG5vbi16ZXJvIHZhbHVlcywgYnV0IHNp
bmNlIHRoZSBmcm9tX2Vycm5vIGZ1bmN0aW9uIApjaGVja3MgdGhpcywgSSB0aG91Z2h0IGl0IHdv
dWxkIGJlIGludGVyZXN0aW5nIHRvIHZhbGlkYXRlIGl0IHRvby4gCkl0IG1ha2VzIHNlbnNlPwoK
LS0tCkNoYW5nZXMgaW4gdjM6Ci0gQWRqdXN0ZWQgc2FmZXR5IGNvbW1lbnQgb2YgZnVuY3Rpb24g
ZnJvbV9lcnJuby4KLSBBZGp1c3RlZCBtYWNybyBkZWNsYXJlX2VyciB0byBjaGVjayBpZiBlcnJv
ciBjb2RlIGlzIHZhbGlkIGFuZCAKICBpdHMgc2FmZXR5IGNvbW1lbnQgZml4ZWQuCkxpbmsgdG8g
djI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4L0JMMFBSMDJNQjQ5MTQx
QTE3MjU2OTY3OTkzMkVCQTIwQ0U5NzEyQEJMMFBSMDJNQjQ5MTQubmFtcHJkMDIucHJvZC5vdXRs
b29rLmNvbS8KCkNoYW5nZXMgaW4gdjI6Ci0gQWRqdXN0ZWQgb24gY29tbWl0IG1lc3NhZ2UuCi0g
QWRkZWQgc2FmZXR5IGNvbW1lbnQgb24gbWFjcm8uCi0gUmV2ZXJ0ZWQgc2lnbmF0dXJlIG9mIGZ1
bmN0aW9uIGZyb21fZXJybm8uCi0gUmVtb3ZlZCBleHBsaWNpdCB0eXBlIG9uIGZ1bmN0aW9uIHRv
X3B0ci4KTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgv
QkwwUFIwMk1CNDkxNDJCREYwMTExNzVEQURENkU3OUQwRTk3MDJAQkwwUFIwMk1CNDkxNC5uYW1w
cmQwMi5wcm9kLm91dGxvb2suY29tLwotLS0KClRoYW5rcyEKCkZpbGlwZQ==
