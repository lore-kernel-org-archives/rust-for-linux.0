Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2086.outbound.protection.outlook.com [40.92.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55403169AE4
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732184834; cv=fail; b=VPQ4cqz2RGKPDZ0dK8SxsceqgMgKejM/WijTnEsYKjii5wpSr/w+eKAv/Lw02L43mWk7J3rg4H4M31+asTEZ18ysOAx2OIbnH6ZUWyKSiNowFMCKGGlX3q7BdrvNq6yl6xtJj0D0dllvom+Zy4OEzpYi3aDYvBqtHJNBj3iD9aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732184834; c=relaxed/simple;
	bh=F/SF3eIAkjiIa4r6UAqcnMhcskqRWCND6f+Yu6hH5OE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fEjgJo6VICtOJnyfNY+1N5BRnC+uscKcz+dx80eFwX4345N2BuamToiLtY50q48sXyBA/eAewFJrHJxlpUMNLbmefiBMGDSPQqvdynOUDuU09WGX44+brYYaOKnjjeza90zpGn5OcYKblGdPygf19wyyWfQzwehP/yVBM9Kf7ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=llU9EjM2; arc=fail smtp.client-ip=40.92.21.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="llU9EjM2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdRREr2jzI0dhbvRwvG9qjqd37mCQFgfXgtA7ApDD6mDLitcqcA1bMvJgN1Z95X9MHlMvnUsmjomt/wW5jykI/uIaWBRqXPlFWhJrm9UDG4MdfSYgNPmdcKJxCIS57dNylSwz7O9loRfmAr3EMoDQ0A9UuAztv2jhqmiWSFxoy2+XdGcdbuu/vKRlM9AUL8F0jwKz8gIzblbK0YPCiR6WADAvKhFtvDKfqswqLU72bpfHW2WApTjdd3/q+oUsSmqnWzh1Hnec+gjyaTz9ANSH3ruAJLtqretlQx2RU6CcAb+3DcAKPJOq8WSjM5FQYrUr1e2rglrTxxvvkFkZAuBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/SF3eIAkjiIa4r6UAqcnMhcskqRWCND6f+Yu6hH5OE=;
 b=YYeye3fi4ZwH8N19lqNpWNYcgDFjcz1Y540/qa58NlHoe2mkmQL1g12JTWk7ijS0e927ezjG1byn6uD4U5jZYwPvUdNY3utovNc6AIv1k+oxUDVm9EXLE0y6bjD3AQfL2cfQbxENxgk5pIODD61p2Uk/QjuH9387IeO0YvKBZnxuynUpwJw68Kh/X/GestHOijxgyWqXz5K2JjEVvFtJtkE1bbUT6gAZQ2L/+9k5dC5QMccH9juTeL614TSOJbBCWsO0e9Izf8cgNRsoICr1lxUwEHIGNHHs+J2we0KVL9nFHyNWmIpneNN5sJp0cqAS47N+ZS5pbCeO/uT2ds2row==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/SF3eIAkjiIa4r6UAqcnMhcskqRWCND6f+Yu6hH5OE=;
 b=llU9EjM2yVVYO/Lkybs0/N/iYtqoeKMAxCtYFlD5WHNDofZwFS+oJdQkZM2MDzRzDUW0fn4tZAvbI0tM6dR4A66S8qPUoIKhmSyx9hJeiWN4iSFDE30NsNuVzbA5ngq8noyFXPmpuqcyQBKVzlQFlyPINkt9zFgOxoiFR4MPbpzAtvqpGm82K3E2vda4lrctoG55wK6rQV7t1tSueN8d1KE8bBz6Zc0KTp7BOIJwZM2FhBzIpfx1hfJyH5Q/SxuyOdt/ZaM9KbRV1nRrgkvIeB6EM4JnH+C0+qBrdeognBECIQD6rAKZqjD7he9B8NHo4jwUPI7ji+J06PsBNksD9g==
Received: from BL0PR02MB4914.namprd02.prod.outlook.com (2603:10b6:208:53::23)
 by CH0PR02MB8105.namprd02.prod.outlook.com (2603:10b6:610:10a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 10:27:10 +0000
Received: from BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089]) by BL0PR02MB4914.namprd02.prod.outlook.com
 ([fe80::906b:d00a:2d95:d089%3]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 10:27:10 +0000
From: Filipe Xavier <felipe_life@live.com>
To: Lyude Paul <lyude@redhat.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
CC: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Martin
 Rodriguez Reboredo <yakoyoku@gmail.com>, Valentin Obst
	<kernel@valentinobst.de>
Subject: RE: [PATCH v4 1/2] rust: sync: Add Lock::from_raw() for Lock<(), B>
Thread-Topic: [PATCH v4 1/2] rust: sync: Add Lock::from_raw() for Lock<(), B>
Thread-Index: AQHbOth2ckXrGvqb4E2yghJsPsXed7LBiYv3
Date: Thu, 21 Nov 2024 10:27:09 +0000
Message-ID:
 <BL0PR02MB49149575B8A82816C1C7D63BE9222@BL0PR02MB4914.namprd02.prod.outlook.com>
References: <20241119231146.2298971-1-lyude@redhat.com>
 <20241119231146.2298971-2-lyude@redhat.com>
In-Reply-To: <20241119231146.2298971-2-lyude@redhat.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR02MB4914:EE_|CH0PR02MB8105:EE_
x-ms-office365-filtering-correlation-id: 59c87f16-e2eb-423c-d040-08dd0a170e71
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|15030799003|8062599003|19110799003|7092599003|15080799006|440099028|4302099013|3412199025|102099032|10035399004|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZDNNV2VHUXM1Q3plemFVcDVGYVBvK2VhTExyTkdJTWkzR0xNaUZjN05OZlI1?=
 =?utf-8?B?QXpac0RFenk3czlQSzZhTjRINnpKZkJpVmpHdFRmblBFaXZKV1ZMdTd2TFdL?=
 =?utf-8?B?QzQrVFNISzNaRThYSXBXcERlZ0g1Zzd0WCsrQWc4clJqT0ZNbmVKWGlqVkRp?=
 =?utf-8?B?K2xIK1MwME5PV2RXRzVGUW5ZMWlCRjkybE8wNGJNM3NQV1pGNmtlOTdSU1Yr?=
 =?utf-8?B?L0RLNGZuZ1hxdDk1QzRLc0VKSkJsTi9QbXlUejMzMGVHY3hJVGFrUWd4WitR?=
 =?utf-8?B?ZzkxK3ZqdUFhdllYamZhdWZlM0FwS05nK2RTODYwZWRxSjlodmVDRU1Ba0dk?=
 =?utf-8?B?eUpCbGkvckk0QTNOVnBxSGxLVXI2Ylg1bFJTTys4a1NYVzlXakUzRks4UkdC?=
 =?utf-8?B?cktNS1FvelVmWFNGQXFnQWlhQmpBcWw5YjQzdGIyc0kxNStIMEg3MnJrRlhi?=
 =?utf-8?B?TnpTSm1zSTBLOE5acHo5SGczUEU5NWRPZjFEdjVGakdKN21NZjFZUlpWYVhu?=
 =?utf-8?B?aHcwekx6bUpXU1ora2M0em4yRTVKenlWYzA5OE1DTktNWmw4Ujhrb0g1UmVn?=
 =?utf-8?B?TjVNRE45WjVnTzVzeXZaaUJjSUZGWDFEbzNWOThtek9Ia3hIR1NLSVZXZDNw?=
 =?utf-8?B?UTh0Nzd1SmlzV1VpM2UwSjZkVmpWeFhRb0tGajR0TzFQQng4Vk9wU2gyRmoz?=
 =?utf-8?B?cnlnTHhlSkw3RWxKU0FoKzRuOWtpai9wRzVwNXQzVW1lTU8vcmo3dUZjZmsw?=
 =?utf-8?B?VXBkdXFpekMzaGRpY213enJDUXBCU0lZZGVCMUNQeWxmWDV6Q1ByVWJtTlMz?=
 =?utf-8?B?NlBuRmVzdjRrU0pmaU13cHRQaTE3RE1SQ0c4N2w3K05mQlFzMGJkSDlPbUNT?=
 =?utf-8?B?Mk9VV2tJeW0yQ1MyQmxlWmxCRlhGYmorKzlybU8zcWtxRzBaNnJEVFZPVm9M?=
 =?utf-8?B?SEIxWnQxak1vSUYzTTBBdmo0UGY5WlY4cSttU3lhVlZ5SzA5SmdmZThQMkFD?=
 =?utf-8?B?cU9OUUpzQkdva1lmWVh2dC9EcHRzQ252SldlYkFNT2FIRWNJcmxGOHRGcnM3?=
 =?utf-8?B?aXQ3cFJBUTR5VVFhZjNvR1IyNkQwZ0dvMUZNQkhJSTdpVkhFL1V3ZlRFVUhI?=
 =?utf-8?B?d3FDdjE4MkVZWjc2UXFtSUFBczNrdjZINklwaVNLU242cDhlREEzVERWUDEr?=
 =?utf-8?B?bW9sZ1F4Y1VVcWF3MnIzY0VTY2RncHJTanFveDFVTzZjZmwyS1ZxS2RwdmFi?=
 =?utf-8?B?MjBtMk5GaFdqOW90TjVkL0VPZTBodWphR1Z4VmhRczNXN0NWNlUwU3ovK05k?=
 =?utf-8?B?MmsvSjFpNTNuZVNSRjQ3bUxTVUF2alZ5T3lqR05zUTNJdTFyZEpRNUZUMnZS?=
 =?utf-8?B?VEo5SlZvVzJrbllxekNoSy93b3M2STFES3NzZDJ1eTgrMGJGYVJvc012NklX?=
 =?utf-8?B?RTRhck1RU0pMUWtlNjRDbjhPQ0ZrY2NqSVpjRUtQRGd0Ym1jNVZCb2JiNzQz?=
 =?utf-8?B?Y0orL1FKT1BUQUI4bGt5dFYxamJndHZCa1FDVTJpQllCYnRROEhEelpSei9w?=
 =?utf-8?Q?j1JCdaVQD7/qtj/SDAugoJdJgxMGe3fJZ+Qge0SZ86qlBH?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWdsVkF2NVVla3Y5aFZMZmpaMlZtQldZRGtROUhqb2lKY281SUhJS1hXaXhm?=
 =?utf-8?B?U2JHWjBFOHQ4NGg4TVFnbmR6WUVVUVNOWFpNcU5KN2tJNFh1V3EvTW9oYy9p?=
 =?utf-8?B?YjB5cTBnNnNycjF1TU5mL0QwZDdIYzRaUkxONEJKMmt3RWN3WkI2NmRTVnV1?=
 =?utf-8?B?RnNuSlZjTTRIV05EU1dMYWNtZFhUYlNiZWNhUEJXRWZ5bjhPbEpxWkRNVm45?=
 =?utf-8?B?S1ZZdGRxS1lzUUc2N1dDT3hIc2lNa21qQ042L29ZRmNpVkdJaXFhem54N1VO?=
 =?utf-8?B?YlJrU09hS2NER2hyZUVYd0tPeTZkbHJnUVdmWDdwSFRuNklsUHhzaTBTR0li?=
 =?utf-8?B?TEh1ekVzOEt4RHFkQ2N1UndHSXk2U1ZTdEVGTzN0RTZvTFJldGE1dFlockhm?=
 =?utf-8?B?N3V4SUZvZVhyRGlaKzkyRmJtY3FoWVU5QnJ5dGgrbVJXdzhQS0ZBU09Xa1ZV?=
 =?utf-8?B?TVBwM29BcVYxcUJZM2ExZVhINDI3Zmp4Ui9WdUlkL3Vuc2lLMTRkcElFWURj?=
 =?utf-8?B?LzNpRlZyOFd5eU5VSnRtdXhBZHpRKzg1VFU4K1lFUmQ4MmNoRkxkb2lrbXh0?=
 =?utf-8?B?T0MvUWw1VzhkUTdjc0V3Z1NXMVh4dHo2NC9KaGU4b3ZJR0pRU3UyazI1Q3p0?=
 =?utf-8?B?VVp0QlFBRXFiRThVRm02VlhhR2M2NmIvWGtDbUQvOUlQdUgzYXFJOVNDelFO?=
 =?utf-8?B?MTRJeFRWSFl5bVEwV3A5L3hHSnNaTlF2emxiTkxlWEZFWUNLU1BoNUcxdkl1?=
 =?utf-8?B?WjF0M2s0R05PV2diSXJYMWtaRFRDb2cyNGNhODBMckVQQnpxNktkTzBNcjB3?=
 =?utf-8?B?UmpwalB6eWE0TWZQSmR1bTMvV2ZiVlBQVVN5dGhUTVZyUVplZEZxeTIxdGdZ?=
 =?utf-8?B?MTM5SlEyZC9JUWRCRURKRkgwbEtWYzVDaDc4OHBCbzBCbUVjWGRjRDROTjlh?=
 =?utf-8?B?bjZycUNNQ0Z5ditrTWZPMWF3T1QwWjFiVXpPS3ZzV0pwTzZQMk5BeHdqbjBz?=
 =?utf-8?B?dzNBdXNqNmY3SitkUEpDRDRBZloybzRzWDZ3NFFTYnhVSmliMUJjbnQ3OEJI?=
 =?utf-8?B?eEwrUVVOVDdveVRRdGVxL2hvWFVMZENwWHNwQnVrWm1IZW5jSFZjT2t4allJ?=
 =?utf-8?B?Tm9wazN4S3JNeXNZOHRhY0lRSmU2K1J6R1ZWQ3JwanJKclI5QVNVT1VoYm9M?=
 =?utf-8?B?SWhqS0tpVHBHdjJUaW5hemgvQ1BLc2l6T2IxMVZ1WGxQb0xWc2xYdzNuUUVu?=
 =?utf-8?B?citUa2s3SEVWS2YwSjhaRHVnU0cyazQ2azhlRTQ5SkY1TlExYWJjZjJHK2Rw?=
 =?utf-8?B?NGwzTFpxTVA1N3Zxa0tjT1BMRk5VSFF1ZmN6VTJDOEgwMkJxNG9UY1Vha25N?=
 =?utf-8?B?SlBmRUdIcnZPdUFKMUoxbm5KRWprbTV6MGowZVRBR0sxWFUvdk5LSjhFQkdx?=
 =?utf-8?B?U2YwTnlXNXNLWkFJZk1CNGgraWo4NnJadDZzZEJmM0JjNFN1SXdWRGNaWmVi?=
 =?utf-8?B?emUxYXIvZW4xNnNtWW0wc2h6VENWYnZEdG9uamNEd05SRXAvS0syYysxdHlL?=
 =?utf-8?B?TXhUSHIvRXl3V3BxN2lzSVpNRFRCWVNnTUxFeElnNWcybU9rYnZSdkFyRW1w?=
 =?utf-8?B?ZXllTWV0VElEZEthckVHc2FNeVRoZzVCMUg3VHlSMUdKQTFnTWgrZ3JzU3h1?=
 =?utf-8?B?UWNDQ2lkd2tmK3JYdXlxakl2MEtvYjN5UkpHUVpXS0xQNUdGVkEzc3NJUFJt?=
 =?utf-8?Q?5WVQ33vD1MLDfRx9l0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c87f16-e2eb-423c-d040-08dd0a170e71
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 10:27:09.8976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8105

T24gV2VkLCBOb3YgMjAsIDIwMjQgYXQgMTI6MTHigK9BTSBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPiB3cm90ZToKPgo+IFRoZSBLTVMgYmluZGluZ3MgKCBodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzEzMTUyMi8gKSBoYXZlCj4gYSBmZXcgYmluZGluZ3MgdGhh
dCByZXF1aXJlIG1hbnVhbGx5IGFjcXVpcmluZyBzcGVjaWZpYyBsb2NrcyBiZWZvcmUKPiBjYWxs
aW5nIGNlcnRhaW4gZnVuY3Rpb25zLiBBdCB0aGUgbW9tZW50IHRob3VnaCwgdGhlIG9ubHkgd2F5
IG9mIGFjcXVpcmluZwo+IHRoZXNlIGxvY2tzIGluIGJpbmRpbmdzIGlzIHRvIHNpbXBseSBjYWxs
IHRoZSBDIGxvY2tpbmcgZnVuY3Rpb25zIGRpcmVjdGx5Cj4gLSBzaW5jZSBzYWlkIGxvY2tzIGFy
ZSBub3QgYWNxdWlyZWQgb24gdGhlIHJ1c3Qgc2lkZSBvZiB0aGluZ3MuCj4KPiBIb3dldmVyIC0g
aWYgd2UgYWRkIGAjW3JlcHIoQyldYCB0byBgTG9jazwoKSwgQj5gLCB0aGVuIGdpdmVuIGAoKWAg
aXMgYSBaU1QKPiAtIGBMb2NrPCgpLCBCPmAgYmVjb21lcyBlcXVpdmFsZW50IGluIGRhdGEgbGF5
b3V0IHRvIGl0cyBpbm5lciBgQjo6U3RhdGVgCj4gdHlwZS4gU2luY2UgbG9ja3MgaW4gQyBkb24n
dCBoYXZlIGRhdGEgZXhwbGljaXRseSBhc3NvY2lhdGVkIHdpdGggdGhlbQo+IGFueXdheSwgd2Ug
Y2FuIHRha2UgYWR2YW50YWdlIG9mIHRoaXMgdG8gYWRkIGEgYExvY2s6OmZyb21fcmF3KClgIGZ1
bmN0aW9uCj4gdGhhdCBjYW4gdHJhbnNsYXRlIGEgcmF3IHBvaW50ZXIgdG8gYEI6OlN0YXRlYCBp
bnRvIGl0cyBwcm9wZXIgYExvY2s8KCksCj4gQj5gIGVxdWl2YWxlbnQuIFRoaXMgbGV0cyB1cyBz
aW1wbHkgYWNxdWlyZSBhIHJlZmVyZW5jZSB0byB0aGUgbG9jayBpbgo+IHF1ZXN0aW9uIGFuZCB3
b3JrIHdpdGggaXQgbGlrZSBpdCB3YXMgaW5pdGlhbGl6ZWQgb24gdGhlIHJ1c3Qgc2lkZSBvZgo+
IHRoaW5ncywgYWxsb3dpbmcgdXMgdG8gdXNlIGxlc3MgdW5zYWZlIGNvZGUgdG8gaW1wbGVtZW50
IGJpbmRpbmdzIHdpdGggbG9jawo+IHJlcXVpcmVtZW50cy4KPgo+IFNpZ25lZC1vZmYtYnk6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogRmlsaXBlIFhhdmllciA8
ZmVsaXBlX2xpZmVAbGl2ZS5jb20+
