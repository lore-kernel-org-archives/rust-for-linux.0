Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F40D3093CF
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190257; cv=fail; b=cwwd4Jx9JVZSbdyib39A8CBgF/spmE13knPeDZh8l12QmZgl5g407QXtRlB9JRQOPVfpXFk4/AxvqTkjFfxFX5VaSPoNreaNTDOUSn7uuG+b8pbWvymziOHu+n/05dnkLICJerUmpgclRonjL5a6RqN4J6ZanXgf5Z5smhu3L3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190257; c=relaxed/simple;
	bh=tQL6ZBA5iZ4RONPW0T/dTiBmc/wPEsUDcG9XRNZiJ6U=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A9ZF5Rxes6lqnSVvUd1+5n+x6D/Imv3l+FSgKxHV0LwHyrmjS+9VwcUYPx3vGlIDzHUqXpgHncaQxJY6RY4cFNmBatRXoWqbOjTQ1p9shrHGFPxYwN3vsTF0tj6JQPVWmOmbkED6u5qTRimvcO68HHBpNUShH6n/IyfHMpH/B6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nf9l3uRA; arc=fail smtp.client-ip=40.93.196.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nf9l3uRA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfXofRTIAi9FRlquvrGFT/n1PH0QQEYV7gZW6egHzIAJs06xCn/W5ON+LIRGqBcIIT63sMgV+pn6IUBDmi9EHBYglphaE+IuIVR7REWyURAxspUQNZ+2naYCjD4B7C0dwMz352t6cx28I/Ifq00XPgkRQ/cj9fAECKjQTeUOouaLd522JkUM/dsidxhuGBqnueN9hwMH00REXupXr1DRB9HY8GtCvbwMC4ZSfTcEfMfn/MDvTNJov53VWDfWPiKJGoANlXJ7xn4VycRzkZ+ybO06mP95zpBBTmFwnGlEnsmPGC1sB9XVfImWupmTRdAtbRvA7Z2wtHASSxznvKQfGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQL6ZBA5iZ4RONPW0T/dTiBmc/wPEsUDcG9XRNZiJ6U=;
 b=uORxlkpNE9j+hP6RoCLe67D22sHMqpdaIpeiLgWmTA6JDO1RNdIkkHjsTwUpTEPh9M2vv/z8sn1z1qagK7lR+GmtRi8pRRw3gy6J5BkFFDno49QRgrT9/iYYwZz4EFNQrQ8XwZruau0wO/EmT9flRMitwAqnPfY8SahMWyV4ZScrgkbgnYwJZ1U3mvJuj6ZC29GbAyTJVxb/pRyQauyUEfaAzcn7V593IOFXofVL1ZCulqQ279rgHoVKbpK1pEldukyv7w68mSAKfw521aGhWsJqkPqPZEKSiHBlxlmbI9EfDRsxODkZq5jiEdUqnMBnkL4y/Fx7sSBKibeA5eM1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQL6ZBA5iZ4RONPW0T/dTiBmc/wPEsUDcG9XRNZiJ6U=;
 b=nf9l3uRA5/1mD+4z49zhy0yUCC4Nfps9rGNAigrNU+K8s5dKvJbETIq2zlYdZIn65EzRmzouHQy6ytzc+t0cuUzH3CCrUBG2WuF6IXZ9XXSSZaAUiWqktMsw8K7ExwGWxI5a985FgtLCUyZnxFs0pnzYhidx03IBEaYXq6ymiLEXTWii4d1kFuYPtDrzi7SCamfnFL7LDfEAGgaYoq50ceLYnfe2brdo9mETZW+ecvxnUjTr2g9d5ULZ/ijaGEl0JhoIAhMNQM5CBCr6KHdz92wZqStZa2wCBPBu/DAQFMicFwui8k/Labghwfm3wmTMc5xwWucZSnOOOkv/ccv8tA==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH7PR12MB6587.namprd12.prod.outlook.com (2603:10b6:510:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 14 Apr
 2026 18:10:51 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 18:10:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually exists
Thread-Topic: [PATCH 3/6] gpu: nova-core: only boot FRTS if it actually exists
Thread-Index: AQHcySnnvwyzZYVrtUS7y+nCSnycsrXcZxAAgAED+4CAAEKxgIABM/wA
Date: Tue, 14 Apr 2026 18:10:51 +0000
Message-ID: <838f5d39768881b05fa83c20f2706faf2b043a43.camel@nvidia.com>
References: <20260410203722.1586938-1-ttabi@nvidia.com>
	 <20260410203722.1586938-4-ttabi@nvidia.com>
	 <DHRQL0KVSETV.2YWE5W5JFGHJE@nvidia.com>
	 <befb74f0523b01622fef9f18691b97481c5875f4.camel@nvidia.com>
	 <15e06581b295691731145b55ecc337ea2ed8dcba.camel@nvidia.com>
In-Reply-To: <15e06581b295691731145b55ecc337ea2ed8dcba.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH7PR12MB6587:EE_
x-ms-office365-filtering-correlation-id: 5751ef68-e0fe-49ac-8511-08de9a512972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 279IcHq5RS8+uvm5T/zhz4gRlx10qRfdoydPdFem6GkN+ViUnixCEc+8x/u7VvARgeAZdrZ4wWjI2fXH2jf+Y7T9fu68BxVSPAZM31UVk5ibeS9eA8sE6yREqwwsA6poR6ufZCgOwfGIYj4YSow2AWI3TEPuBAG3luyahABNx2qjJnRs/WKMkj/5/XdNKLg2pU+p/u6rFCrdQiayMf+eGmo7mJi5QNgKQEEkBvL+Z6MTXfq+pGZqnIS2hdU7USsTgTD+WGkIN9/sMH28Ly3y4uUpJ7onfVfVBefC4y2cBhyzikraMfkvfgO3V4KqvTNGdLzpazdtqVgrfL3T3BPAhVOZq7Cf5GVhU/v5ZrcCFhVjpmv/mitMnxbvnQyq5bFzbnfciYhlqqF5RYqJkKKpwTlDyVuquH+MDVBykeABPKVtCfLKEDMcjt3iFvNjjdjKAb4vV+WB1/XoWehrvsFkxN05p9XodKx1w0nVxtm4Q58eqRPZNWx/Ac6zSixWtRKDVulXoWDkdmttvPjHsq60hxS3T/4VV34iLL3YlIW2nITF6yh3f3PFBlJn7novFeFVYIT6cJM4UMtMgWpV/LltOCNWXNP0B7q0SC2ZBwE4O30YqZmfvxOdw3ywkppN9/6wATtFFNBwmQ2aBBAAijoY58z9auLCzuyYXpvNxgJtfXZob4iEuanXFI08xj/P+hK78H6t3UY7bSJUXj80E3e6XCx5omdP/X7nTHsFMQLXezpM5SZkqkRWZRTHclKh3tiaLKRJ8tZkY22LK8ahIa5VpbU5PxANXJ7TZ3bjvTbCLsQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bndrTWVJdGN5RXMyTVdLYWlkem5hek02b0FMcU5qUkljbEQxaFpQS2FlNEFz?=
 =?utf-8?B?SVdxS2lTb3RyaHhTR1BMZ1NwWnhuZ1JxWnlZODRLcWFHRTJ3QjBwelhybVNn?=
 =?utf-8?B?VHU3Q0d5SS9qTjhYNnR4Y1pncmJhNWJBQ1ZlNHR2Tk9uOEFWbTdabERhNWEw?=
 =?utf-8?B?RjBKSTJDdHRUUzlTTGNUek9zbWhSYmZoeXhsUFJRWkFDK0VmUlJQVWJhZGhP?=
 =?utf-8?B?QWRmdThVSGlDWCtCT3NTV2ZlVTcxSTMyV3dBdm80UC9aVHNuWm9YMUpGblJu?=
 =?utf-8?B?NGZFa3hiZFpkcmVMa3VzS0JVNXh6b1VKNGVTdlZFSStVWnpqNURXbUtFaFVn?=
 =?utf-8?B?VnlJeTFpYUtrcjJEdWJjMVFKYnhYL0d3cWtCMGlKNDA0VlI2VmtrbDFpRGpW?=
 =?utf-8?B?VzhxV1dXdWk2V1BMVkRibDdqbDNHU0diMWdlbmg2S0Z4Nlo0ZDZsVGtiR2Ns?=
 =?utf-8?B?dGZsUENYRjBQMnlVajNYWFRNNDM0OFIrQlE5Ym4yeERZZTZBQThhOVdoV25a?=
 =?utf-8?B?aDJOeGNrTlA1bHlGbHVKQmRPNEdtaUJiNXJLdTRsV3RQRVV4U2d1M2JaMDIr?=
 =?utf-8?B?bnptUDF4bU5HeVBvY1dpN0tFM2thVXI3ZDIwQTh6NlU1d0F4TFFRRE13dUpP?=
 =?utf-8?B?RnY3RHc4SGRVNUUrMEZ2VkYxVmpaRGo3aUtFcHV0RjZ0VG5mSUdJbWxIdUZh?=
 =?utf-8?B?ZTFUeVp5WGhTL0dmYWpNMTF0clBwL1cxblZFUGpyMEY1Ym5JVURQd3pHV2lJ?=
 =?utf-8?B?NXFOd0NCcGFZclR5OXVDRkNVM1FJQVRwVkRGM1Z1VlY2dHNVMi9MS2FsZ3VC?=
 =?utf-8?B?RHVheXplZG0zcXAyRUYzczlJMXl6NEVLQkRTNTlMV2g1d1pYckc2SzhkUWt6?=
 =?utf-8?B?Q0duRXBBMERzNDFCMVNPQmdUQXpDVSszbFBxeFVQdUxwVTZXMmxGb0s3UGlm?=
 =?utf-8?B?TjRFZ0tka01YNDB3VytTNVY2R0twSEZENXliNThJa2FYZ1h6eTdiemI5cmxu?=
 =?utf-8?B?UkNPa1lReHVRRTlpdUhQZzhQa1BqTHdpMzUwTlRYdHNlTFBJRitES05UbGZs?=
 =?utf-8?B?b1orUVBtdUlNNUJ6Z3FhcW9xQXE0SE5ac0dpQzA3SmVtUzdDblZLNWZwUWZu?=
 =?utf-8?B?RVh0QTZYSXNmMmRzZ0FvYUZTVUZCZnNpOHBRK3BRZEtiMFp4R0RUOHlCY2Uw?=
 =?utf-8?B?NU1oM1hYanRmRTdVSU5HUUxTR0MvSEpBdTM5SlJteGpuWXVPRGdCUXhYSkFZ?=
 =?utf-8?B?NjdNV1pDM2pVQlN2OXhnWElHZmppcG41MEJ2d0tDYmdJekdmY0gyS0Q5RWtk?=
 =?utf-8?B?S2F6OTI4bi9pTlpYeFJ6aU9zYS9mM0ZLYzd0RzA4L2NEODZLZVVJelVKWXVy?=
 =?utf-8?B?cWRGYTNuOXYyNDZJMXY0aEJSYUtQYTc0bm9FUTVHekoweGFoK2Zpam5uNVMw?=
 =?utf-8?B?MlZJUUtyd256N2FId00rU0hhcWxQZUd3UTdPUVJaWU14Tm04M2hDVnNmd3hu?=
 =?utf-8?B?aDVobGRZZVJtVzRwaEM0S1ZIeE16YmE0VHhZVDdKN2ZNdVNrckRwczZmQXJ4?=
 =?utf-8?B?UHlJY2FJUk4vZUFPTUFNUitFbTd5WjZES0JPTkFXMzhpUUV6Mk52aEN3R3gx?=
 =?utf-8?B?RVA2TGpqVmpCaUxycTVydCtwTTJwT01rUXpyM3IrNGVpbUl3aXZGeFpsSHBm?=
 =?utf-8?B?cm95R2RRZktLTHJnWlNvRTFzbERINjJ6TjdvM21lZWF5b0lyN2RYd1MyMmxG?=
 =?utf-8?B?UlQ1MmhZQmMvN0lDWmN1R1F1OGpVWFo2YkpqMjVkTTlwNFA2NVNuTER0MTlF?=
 =?utf-8?B?OXgvUSs0Tm42Q3NCOUtwaWh4SHVkOVo3Z3NFRjBpOFdkODNBRHluSjdqOXhh?=
 =?utf-8?B?aDVzOFlUOUVIVzN5NUZaOTFzOHNyTFp6WXNOTmptU2c2S0I5b3k5S0c2Zy96?=
 =?utf-8?B?Z3h6Z2lOTkltVjl4eDQ2S2NPTmNCRlZzZWVSNUxxUnlkZHVMdzJTM0ZGNHRX?=
 =?utf-8?B?azBSMWhrVDY5UG40NGplVzFSMFlWL2UvSnExMS9KTC9SZzV4M2NYZ0twVGdj?=
 =?utf-8?B?LzcrMk4vVE4zTGFGTTFYNWZoR0pLNjBta2ZQM2lPajE0dzh6NHp0M0NyK3c1?=
 =?utf-8?B?ZXZXaGJaSCthQ1VWMUR0clFMZjlsTmJQWXI1RmhMRlQwWUdwdjRKV2lOSUk0?=
 =?utf-8?B?RjF6MGM0U1gySTNZZCtvSVlNalhPZGxEMWtSY3k2R2dERjdJZjJia1QydnhS?=
 =?utf-8?B?QVhscnJUOXhVZEgyRzlRMm41TFdOOElMNDVITHpqeFZKUkpUR2krWkZzK0Fa?=
 =?utf-8?B?ZUVyZXBEeEtWWWJUQTRiRThmRUdQcjJ4WUpVb0M5OU1YNVVuK0cyUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9254D1C2A27F2844A3AAC2C45235E5BF@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5751ef68-e0fe-49ac-8511-08de9a512972
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 18:10:51.1154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F1jdH2LRH31ove8i3YP48HcHj+aPk9N3wJu/F/VpSUkW4Ap15fKZxA5WWBzYytIfdgK8CnGYxRIBNS7aC80eNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6587

T24gTW9uLCAyMDI2LTA0LTEzIGF0IDIzOjQ4ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiA+
ID4gSWYgRlJUUyBpcyBvcHRpb25hbCwgV0RZVCBhYm91dCBtYWtpbmcgZmJfbGF5b3V0LmZydHMg
YW4gT3B0aW9uPEZiUmFuZ2U+DQo+ID4gPiBhbmQgaGF2aW5nIHRoZSBmcnRzX3NpemUgaGFsIG1l
dGhvZCByZXR1cm4gT3B0aW9uPE5vblplcm9Vc2l6ZT4gZm9yDQo+ID4gPiBleGFtcGxlPyBJIHRo
aW5rIGl0IHdpbGwgbWFrZSBpdCBjbGVhcmVyIGluIG90aGVyIGxvY2F0aW9ucyB0aGF0IHVzZQ0K
PiA+ID4gRlJUUyB0aGF0IGl0IHBvc3NpYmx5IG1pZ2h0IG5vdCBleGlzdC4NCj4gPiANCj4gPiBZ
ZWFoLCBJIGxpa2UgdGhhdC4NCj4gDQo+IEFjdHVhbGx5LCB1c2luZyBPcHRpb248RmJSYW5nZT4g
d29uJ3Qgd29yay7CoCBUaGUgcHJvYmxlbSBpcyB0aGF0IGV2ZW4gaWYgZnJ0c1NpemUgaXMgMCwg
ZnJ0c1N0YXJ0DQo+IChha2EgZnJ0c09mZnNldCkgbXVzdCBzdGlsbCBiZSBhIG5vbi16ZXJvIG51
bWJlciwgd2hpY2ggbWVhbnMgd2Ugc3RpbGwgbmVlZCB0byBrZWVwIHRoZSBGYlJhbmdlLA0KPiBi
dXQNCj4gaXQgd291bGQgbmVlZCB0byBiZSBGYlJhbmdlPGZydHNTdGFydC4uZnJ0c1N0YXJ0Pi4N
Cj4gDQo+IFNvIEkgY2FuIHVwZGF0ZSB0aGUgSEFMLCBidXQgbm90IHRoZSBGYlJhbmdlIGNvZGUu
DQoNClNvIGFmdGVyIHdvcmtpbmcgb24gdGhpcyBhIGJpdCwgSSBkb24ndCB0aGluayBpdCdzIGFj
dHVhbGx5IGdvaW5nIHRvIGltcHJvdmUgdGhpbmdzLiAgVGhlIHByb2JsZW0gaXMNCnRoYXQgZXZl
biB0aG91Z2ggSSBzYXcgdGhhdCAidGhlIEZSVFMgcmVnaW9uIGRvZXNuJ3QgZXhpc3QiLCBpdCBr
aW5kYSBkb2VzLCBpdCdzIGp1c3QgemVybyBzaXplLiANClRoYXQncyBiZWNhdXNlIEdTUC1STSBh
Y3R1YWxseSBjYXJlcyAoYW5kIHVzZXMpIGZydHNTdGFydCAoUk0gY2FsbHMgaXQgZnJ0c09mZnNl
dCkgZXZlbiBpZiBmcnRzU2l6ZQ0KaXMgemVyby4gIFNvIHdlIG5lZWQgdG8ga2VlcCB0aGUgRmJS
YW5nZSBubyBtYXR0ZXIgd2hhdC4gIENoYW5naW5nIGZydHNfc2l6ZSgpIHRvIHJldHVybiBhbg0K
T3B0aW9uPE5vblplcm9Vc2l6ZT4gcmVzdWx0cyBpbiB0aGlzIGNvZGU6DQoNCiAgICAgICAgICAg
IGxldCBmcnRzX3NpemUgPSBoYWwuZnJ0c19zaXplKCkubWFwX29yKDAsIHxufCBuLmdldCgpKTsN
Cg0KV2UgYWxsIGtub3cgd2hhdCdzIGFjdHVhbGx5IGdvaW5nIG9uIGludGVybmFsbHksIGJ1dCB0
aGlzIGxpbmUganVzdCBvYmZ1c2NhdGVzIGl0Lg0KDQpJIHdpbGwgcmV3b3JkIHRoZSBjb21taXQg
bWVzc2FnZXMgdG8gc2F5IHRoYXQgdGhlIHdpbmRvdyBpcyB6ZXJvIHNpemUgcmF0aGVyIHRoYW4g
YmVpbmcgbm9uLQ0KZXhpc3RlbnQuDQo=
