Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C17378D63
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Apr 2026 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776707477; cv=fail; b=ZwPlBFmXysCB8fQF4izFRXWczTWvVCu5eoZ1r0q189LiFnQtv8+OqOmUDmvoENZpF+3heXx1FTf19CNTPwNiUoYQY4JABrhM4p9YxSRngQWAbvhOXvWHonIt1kmgzX5usrbXDzgkNsp96dK0QtuP9ofvZNdLxUtN9PkwfYGLMyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776707477; c=relaxed/simple;
	bh=AjIFUd0CktBV+KOB9OJlc054EKQ40qeWL6pIHABXr48=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CdalAJBRBlGKCeBHsV8h3t7uExWjkoHgr4JCK5VH+oEoCuMO0CddKz53Us6YxH47fzQ1hZx2hUDjqhHhIm5N9tu/QpEVc4mDEMjc5Uv0WB3EW8D+dBE/NS9W+DCcUpScHG/N2v9cFUbFUh7yPmIGAkbG3uZgtJvDCqUvmaq9cxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C1VXAchf; arc=fail smtp.client-ip=52.101.85.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C1VXAchf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNxt0cl+7yNCKswIA+pgVbeX3qR98zfqpVo5JFxiBLIP3X07g7FQN0+L+1aOMkvn9gMmClNi8vAY4IUK0LT958ACfaKEIziJHPgPDKQ474O/7wfhtEMUB3qWE0NYaLH8bJOuo6DoW19z24JuJprD37/4bZPAYJXQh4U37U57m2qSfQFllCsg8ScAInpSQ74WwFsRMnn+yaJIChKaHrt1uBVAM9nJlKfI2WOJ3g2iukCrxvt2y7qfq+GPEZbFsDKyzKCH0qq24C6f5Z1vBsLNfVPKRBlHi6RUR6otxH2WUvkOOhfmR9WS7wjXdIk1MSVuUutDyY+YMvRbYm3kG6NFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjIFUd0CktBV+KOB9OJlc054EKQ40qeWL6pIHABXr48=;
 b=ICRmDDisfRROkWqc7erPytXsu1ZpwkdT1ALPgJbSbcOqSyX+lX6U5X9RskHNDDYPGSusU9d8qJiFKka87MD8XKK4dWoBEl3Msc/kalJpIp4HjwMElBMY070QlM2ZF8jZMCt1cmdkjkuHnoC/DxRKx6SUaoSmST2Li3tNXAoy7qY6Ya9iTAOpiMuS1/lQLL1qX+qiB3p8YqH86lTovU1wnQQ+GeCVmL5Cyj3Yskok6Q8+MUcR5x9ca3/TAs+sSAbM+oFEooVkqAVX4M3dluiS+HFHYvFCtCy1BYIukjCB7IIRomhV3Hz1nw48EAr9XGW43MejULyosR4Z5a8R2OwBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjIFUd0CktBV+KOB9OJlc054EKQ40qeWL6pIHABXr48=;
 b=C1VXAchfbdqz0gJpTxFJ4Aj38l7ClcN9mtOLv3uj2S3SHEGjm65Z6IKKIe33zRdQckgnxAIv+sm3BTaesg9wb78KP2pB7sfqUL+zl3tQ45YeIyRLfGA3hWzdDKq0Os8XCXhyTUS5MGfRFuIoyG8f03I5UczpITWL2tXC7Zk6eF/lSijNQNxMvEuxuBQaYK4nUKzGsfqWpS+TVtoNWlcOrSWfgvIwRS5OgRwEzi8qfWRpk+T15ZE+ww4tKUZuDkMvcE42skITefZVb5GsJG/lvJrunu3eA5oj0s7H5BcjjWqbmmU37zwAGNwq2ZiQpGv/uqQg/cj1ceTAU9rqHtjY8g==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 17:51:10 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 17:51:10 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>
CC: Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Topic: [PATCH v5 4/6] gpu: nova-core: add FbHal::frts_size() for GA100
 support
Thread-Index: AQHczp5w/ypavRL09UO9Q6M6pTcTvLXmzVgAgABfagCAAJVcgIAAKVAAgABT3QA=
Date: Mon, 20 Apr 2026 17:51:09 +0000
Message-ID: <a2bb46f8cb312643ea5997ab4b58042850554a0c.camel@nvidia.com>
References: <20260417191359.1307434-1-ttabi@nvidia.com>
	 <20260417191359.1307434-5-ttabi@nvidia.com>
	 <DHXE2MBVLV2S.3AUM31VR2XC0D@garyguo.net>
	 <DHXLC2ZLHLWG.1Z3SQHOEYMYH3@nvidia.com>
	 <DHXWPED46OYC.U21Z21V0PM3C@garyguo.net>
	 <DHXZULC2O3CE.2PNA9P12ZPC2B@nvidia.com>
In-Reply-To: <DHXZULC2O3CE.2PNA9P12ZPC2B@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|PH7PR12MB7378:EE_
x-ms-office365-filtering-correlation-id: 6825e203-7ba3-4a78-9fae-08de9f0567ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 lZvTJVgz5M4ISXhvrI/2DmyziuYk8tnalJ4d+7p7UzYMRYk56R5++i6xadObPKPPKwQnlpq5zZVpXG9IjGW82RyUG9PSfUxG4nzZzslCNHHizHmddBRynJk+fMJNU4PSeT641xgtSvwy7Yb968bfwCWpONkpWslBeNKUpqg8Mooxi5RT98pkOUWGbAzttpXPfCc95vLa68+U8Ip+iZnlOPSNIpJCklGR48TXfCbBEXGDRojDDtw0Gz5bBuPWYKulcsVB2AZ/uoXJn7cNrMtmbYgyt+A/Ui5+7oMBtE4g9l3OBtL13hObp8XHjyC6mdkw9bHSgDEHrNnR2syR1S7RP+9XMxbYM6eoWA7ujWyrQtdXG8FQtPwN3uBqjRXlE8ud9SvCpoONL8oEDMTU+0eAeAJXB1+TPYp++RI+5xXmmcQv2c/Tsrtcn682oFTt9SkgbRuIaS6dfhUOOqIYgWo5NgPy5NUCsAEf+fOY5cBUIzGsDQdrZGLMNtakQ+z6hPMGcG+PEE1rkk0zUkSRmEJrTObmU2XRl4nlbTL3mDzFBwevbN7jk44wKdrP6CyX9LMkInfwf05mot4+E7Fwc9jlKGeKH0K6K3S3DhV1bQ2Xdhd2V4d1eBA7i1brngL97NB/r/RRwE0DcSPJmQdJXm5liCUgxYsSco+m5vGLOpcAuuUpDqvyQBWyTgPbR0nDY6llMgNZWy5PnX+aOi4ZLtDTQDObzKDyHUeKcGu+Zm7zzWIF/g9atrLoAQ96TyUEAkcRgcW6+4Pn9XW47VYStkajOBsHJgnkn2FqdnmGa+blv1I=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVd0a2x2dXJXYkdZR2J0cEMxV21BVkxZdklPVGlJY2h6KzMrbmdERWV0Zi94?=
 =?utf-8?B?THVXeEMyR005VEs0eStINEc4ZUVoWnJRZXVaNkFLdjFpUUFSbkpHeFlhc0p2?=
 =?utf-8?B?cUFkbjdNYWJndTBsejNvU3JvYmxjcmZvcFNmQmx1V0NTWllGZDRibGJjbVRQ?=
 =?utf-8?B?SSs3dVp0Y0Z5aTU4L3F3V0k2dDFEV05ucWlXOE5nZWQwWWt3MWlTOHN2UXNS?=
 =?utf-8?B?MW5Oamg5RXVPZVFqUXZxTHBlajZ0OG5UTGUveTZvVEIwS2xRb3Foc3lraTBr?=
 =?utf-8?B?SEd6dG9xMmdyemtaNHR3RG44QSt5UmxKcEZOWDgwdUY5K3oxd1NLMVdrMHZD?=
 =?utf-8?B?Y2R4VFR4aFdUYWVicFd4aytpMnVWRFFYN3hkY1dIQ3V5UnBmMENiUlVuUUUx?=
 =?utf-8?B?ZWhJNkdLbklZUVJlem81UXJ4SWJXUlZ5aUlZRVhwbW1ka2IxYnRyTVE2S1VD?=
 =?utf-8?B?bXZZU0hsNWc2aDlhajVuemU5d1NMaWo3T1JKajFhQk9kMURJd3MzM1FZdGxQ?=
 =?utf-8?B?VE1YeUxNZVNuc21UU0NKM2NKNGJ3NUhTRVpNOEVOdUhKTUtZdWJ4Rk90Tk12?=
 =?utf-8?B?bHlCSVQ2UVZSUXFLSDY0aXBKRElkd01wTlFLTTVBQ015UlA0ZGsvOVNmekFP?=
 =?utf-8?B?U0liUjd4bUc0bEQ5U3dTbHg2YkcrS0labXVacytDVlV4QnQ4ZWllTkQxS1J3?=
 =?utf-8?B?RlFIQTQ3M0NpaWpWdGxVeHdCcXZKeGtycDVkWkEvbDZhYWFFQ1crWnpocjJh?=
 =?utf-8?B?K1YySlVZdmlSQ00yQ3J2OEpnMzI1N2ZSOXF5eG5NWVpPNVFMdGt6ZndJcC9t?=
 =?utf-8?B?a2RONy9xVzQvNFdQU1NjL3ZNU3ZxU1Q2YUp5dXhRUm10S0RpSWhUMlRRbllo?=
 =?utf-8?B?dnVnWFg3N2dsMng1Wm1ac3U1Z2N4Y1FLbzRvT1YrMzJCb25OUENrYW1BQThu?=
 =?utf-8?B?ak5nUldnTTdNWHpIanhiR2paSTdJNGxWS29Bckd2OXZ5WGNBY0E3Q0JKYm05?=
 =?utf-8?B?L3ppenZoZm1WZERvVjBjS2JjbkZMVjZ5bkdWUTNVR2NUaUEzWTVYZWpwMmJo?=
 =?utf-8?B?MFlTbE0vZWtrR0tmYkc5UzJLZjBJQ3FPS1hsdFoxTmFMbjhSVmVJSFI2RDM3?=
 =?utf-8?B?RUVWTmQxeG4xV040aWtSeHgwelIyZUdvRFRrcVoyUjFhVFkvajNVSjBYL3px?=
 =?utf-8?B?ekFBa2RGVS8xUXRGS0taV0tDNWVZS0hMWG1HeG5CTHpoTmt4NjlMazA1TGJa?=
 =?utf-8?B?VUo1MU1KeXNOZWttVmFrLy9YeDQ5RWxUSktXRjVuTEJ0UGxEcFF5TXQ5c3RU?=
 =?utf-8?B?cXFpVVVLdXlWNmpLakh0QzRENFhBZW5TclptaDlFMTN4clI1Mi9LRVh5Mldr?=
 =?utf-8?B?OEk4RHdnbmZaTEh1bEZ5MCtMcTN3Nnk0RCtLNTY3NjBLdU9lQzlUQUdFSi9H?=
 =?utf-8?B?ZmpsaDdVRUFidjhTQlRzdnB5SGIwaUlnejFQdDdBMFBkQlJNTDM3eGIyTklN?=
 =?utf-8?B?R3NPNiszelFIQ0JjY2tOOEFzR1d2N2wvL0oyNnQxNjJ0Vnd0RzQ2SHp4T1N5?=
 =?utf-8?B?OWpiMzVCUXowZDVheDNSYmlPaldUeURxTUFSVmpzRkV1eGR4Uk8zVkhURjBD?=
 =?utf-8?B?cE5KcVBXSTcrTEYyYmNiT2JXTjNWK2VXeGtuUVZTV2YzRWJGaUxRMFZnYmJq?=
 =?utf-8?B?cE43VGJIYlA5Z3ZjM3lVRWYwTCtUUXNUZFMyU2RHRmw1MzF0SW93TlhVNTl1?=
 =?utf-8?B?cDViQWxXWmp0YXNqMFl6QXNTRTE0aXduZUJaMGRZbWtmQ05UUzAvbldITWk3?=
 =?utf-8?B?T05LazJ3eVFUbks3VnBFNWVIQjdtSFdXVDJFaGdQYThDOVF3TkxFQk5ZVlRM?=
 =?utf-8?B?SnpyRzRmc2FJdmg1eExOeW9OY3Y0N09lVmo1djV1REJ4TDFIM1hWeU9xMWVH?=
 =?utf-8?B?MTBUSEVQMjhvYUF3VlRiQjU5b2tJUXVlenBjQnhlZ1duMzNtYzExcVhOYSs4?=
 =?utf-8?B?WHErMHJtVW1MWGl2TzhtQzFiNWNxZzh2KytjUm5ac29iQlUvbXlPYTVQNHpH?=
 =?utf-8?B?NjVuaTNJM2pZRlEvZk5QOVZ0OXZpZ2hBdGhPL3Y0NVFkVzNWRDJRVkFXWjha?=
 =?utf-8?B?ZG1nRm9QSVdtL1JsMTJwR0RrMUh2V2h5bVBXRnVRZVdhSmFFRTd6ckNtTVYx?=
 =?utf-8?B?cmxUQXplWEhpazBHZ3gwRWg5TnBSVTdDT3BtbFFXSjhGUGc5dHZPMVppRzBD?=
 =?utf-8?B?Q0MxZjdzaERMZVR3eFlRWDBVUExWSnlFVDlFdmtDRDh0a0FuVU05QmFqWXlN?=
 =?utf-8?B?QitodFk2NDdIRjJlTkVPb3N3NjFkWmlwRkNZR3BRUzgxR0kxcEV0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02EA552BF4C0104185D950EE5D41B80C@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6825e203-7ba3-4a78-9fae-08de9f0567ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2026 17:51:09.9897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uRiPdNu5HqB1KNDJ0/U/1K+9lZMnILfgYJE7mp1/iGb9WRp15QGLB6py9LcApuGQGq8moI7+0mjqxPfpqPQAxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378

T24gTW9uLCAyMDI2LTA0LTIwIGF0IDIxOjUwICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBPciBiZXR0ZXIsIHVzZSBhIGJvb2xlYW4sIEkgZmluZCBOb3V2ZWF1J3MgQyBjb2Rl
IGNsZWFyZXIgaW4gdGhpcyByZWdhcmQ6DQo+ID4gDQo+ID4gwqDCoMKgwqAgLyoNCj4gPiDCoAkg
KiBDYWxjdWxhdGUgRkIgbGF5b3V0LiBGUlRTIGlzIGEgbWVtb3J5IHJlZ2lvbiBjcmVhdGVkIGJ5
IHRoZSBGV1NFQy1GUlRTIGZpcm13YXJlLg0KPiA+IMKgCSAqIEZXU0VDIGNvbWVzIGZyb20gVkJJ
T1MuwqAgU28gb24gc3lzdGVtcyB3aXRoIG5vIFZCSU9TIChlLmcuIEdBMTAwKSwgdGhlIEZSVFMg
ZG9lcw0KPiA+IMKgCSAqIG5vdCBleGlzdC7CoCBUaGVyZWZvcmUsIHVzZSB0aGUgZXhpc3RlbmNl
IG9mIFZCSU9TIHRvIGRldGVybWluZSB3aGV0aGVyIHRvIHJlc2VydmUNCj4gPiDCoAkgKiBhbiBG
UlRTIHJlZ2lvbi4NCj4gPiDCoAkgKi8NCj4gPiDCoAlnc3AtPmZiLndwcjIuZnJ0cy5zaXplID0g
ZGV2aWNlLT5iaW9zID8gMHgxMDAwMDAgOiAwOw0KDQpTbyBmaXJzdCwgdGhpcyBjb2RlIGluIE5v
dXZlYXUgaXMgYWN0dWFsbHkgd3JvbmcsIGFuZCBJIGhhdmUgYSBwYXRjaHNldCBwZW5kaW5nIHVw
c3RyZWFtIHRoYXQgZml4ZXMNCml0LiAgVGhpcyBpcyB0aGUgbmV3IHZlcnNpb246DQoNCglnc3At
PmZiLndwcjIuZnJ0cy5zaXplID0gZGV2aWNlLT5jaGlwc2V0ID09IDB4MTcwID8gMCA6IDB4MTAw
MDAwOw0KDQpTbyB0aGlzIHJlYWxseSBuZWVkcyB0byBiZSBhIEhBTC1zcGVjaWZpYyBpbXBsZW1l
bnRhdGlvbi4gIEZvciBiZXR0ZXIgb3Igd29yc2UsIHdlJ3JlIGFjdGl2ZWx5DQp0cnlpbmcgdG8g
YXZvaWQgY29kZSBsaWtlIHRoaXMgaW4gTm92YToNCg0KCWlmIGNoaXBzZXQgaXMgWCBvciBZDQoJ
ew0KCQkvLyBkbyB0aGlzDQoJfSBlbHNlIHsNCgkJLy8gZG8gdGhhdA0KCX0NCg0KPiA+IA0KPiA+
IHNvIHdlIGNvdWxkIHNpbWlhcmx5IGRvDQo+ID4gDQo+ID4gwqDCoMKgwqAgZm4gaGFzX2ZydHMo
JnNlbGYpIC0+IGJvb2w7DQo+ID4gDQo+ID4gT3INCj4gPiANCj4gPiDCoMKgwqDCoCBmbiBoYXNf
dmJpb3MoJnNlbGYpIC0+IGJvb2w7DQo+ID4gDQo+IA0KPiBUaGUgYm9vbGVhbi1iYXNlZCBhcHBy
b2FjaCBtaWdodCBtYWtlIG1vcmUgc2Vuc2UgaWYgdGhlcmUgaXMgcmVhbGx5IG5vDQo+IG90aGVy
IHBvc3NpYmxlIHNpemUgZm9yIHRoZSBGUlRTICh3aGljaCB0aGUgTm91dmVhdSBjb2RlIHNlZW1z
IHRvDQo+IHN1Z2dlc3QpLiBJJ2xsIGxldCBUaW11ciBhbnN3ZXIgdGhhdCBvbmUuDQoNCkkgdGhp
bmsgdGhlcmUgaXMgc29tZXRoaW5nIHRoYXQgZXZlcnlvbmUgbmVlZHMgdG8gdW5kZXJzdGFuZC4g
IDk5JSBvZiB0aGlzIHN0dWZmIGlzIGNvbXBsZXRlbHkNCmFyYml0cmFyeS4gIFNvbWVvbmUsIHNv
bWV3aGVyZSBkZWNpZGVkIHRoYXQgRlJUUyBpcyBub3JtYWxseSAxTUIsIGJ1dCBmb3Igc29tZSBy
ZWFzb24gb24gR0ExMDAgaXQncw0KMC4gIEl0J3Mgbm90IGJlY2F1c2UgR0ExMDAgZG9lc24ndCBo
YXZlIGRpc3BsYXkgaGFyZHdhcmUsIGJlY2F1c2UgdGhlcmUgYXJlIG90aGVyIEdQVXMgdGhhdCBh
bHNvDQpkb24ndCBoYXZlIGl0IGJ1dCB0aGUgRlJUUyBpcyBzdGlsbCAxTUIuICANCg0KU28gdGhl
cmUncyBubyByZWFzb24gdG8gYmVsaWV2ZSB0aGF0IGluIHNvbWUgZnV0dXJlIHZlcnNpb24gb2Yg
aGFyZHdhcmUgYW5kL29yIHNvZnR3YXJlLCB0aGVyZSBtaWdodA0KYmUgYSBiaWdnZXIgb3Igc21h
bGxlciBGUlRTLiAgSWYgaXQgcmVhbGx5IHdlcmUgYW4gZWl0aGVyLW9yIHRoaW5nLCB0aGVuIGl0
IHdvdWxkIGhhdmUgYmVlbiBkZWZpbmVkDQphcyBhIGJvb2xlYW4gaW4gb3VyIGZpcm13YXJlIGRh
dGEgc3RydWN0dXJlcy4NCg0KVGhlIG90aGVyIHRoaW5nIHRvIGtlZXAgaW4gbWluZCBpcyB0aGF0
IGEgbG90IG9mIHRoaXMgY29kZSBpcyBiYXNlZCBvbiBPcGVuUk0uICBPbmUgdGhpbmcgeW91IG5l
ZWQNCnRvIHVuZGVyc3RhbmQgaXMgdGhhdCBSTSBpcyBHUFUgSEFMLWhhcHB5LiAgV2UgaGF2ZSB0
aGlzIHdlaXJkIGluLWhvdXNlIG9iamVjdC1vcmllbnRlZCBDIHZhcmlhbnQNCnRoYXQgbWFrZXMg
aXQgdHJpdmlhbCB0byBIQUwtaWZ5IGFueSBjb2RlLiAgU28gYXMgc29vbiBhcyB0aGVyZSBpcyBl
dmVuIHRoZSBzbGlnaHRlc3QgZGlmZmVyZW5jZQ0KYmV0d2VlbiBhbnkgdHdvIEdQVXMgLS0gYm9v
bSEgbWFrZSBpdCBhIEhBTCEgIFRoZXJlIGFyZSBhIGJ1bmNoIG9mIHBsYWNlcyBpbiBSTSB0aGF0
IGFyZSBpbXBsZW1lbnRlZA0KYXMgSEFMcyB0aGF0IGNvdWxkIGJlIGltcGxlbWVudGVkIG1vcmUg
YWJzdHJhY3RseSwgYnV0IGp1c3QgYXJlbid0LiAgU28gaWYgdGhhdCdzIGhvdyBSTSBkb2VzIGl0
LA0KdGhlbiB0aGF0J3MgaG93IE5vdmEgaXMgZ29pbmcgdG8gZG8gaXQuDQoNCj4gPiAoQlRXLCBJ
IHN1cHBvc2UgdGhlIEZSVFMgcmVnaW9uIHJlYWxseSBkb2VzIG5vdCBleGlzdCwgYnV0IHRoZSBz
dGFydCBhZGRyZXNzDQo+ID4gbWF0dGVycyBiZWNhdXNlIGZpcm13YXJlIGRvZXMgc29tZSBjaGVj
a3Mgb24gdGhlIHN0YXJ0IGFkZHJlc3MgdG8gZW5zdXJlIGl0J3MNCj4gPiB3aXRoaW4gYSBzcGVj
aWZpYyByZWdpb24gcmVnYXJkbGVzcyB3aGV0aGVyIHRoZSBzaXplIGlzIDA/KQ0KPiANCj4gQW5k
IHRoYXQgb25lIGFzIHdlbGwuIDopDQoNClRoZSBGUlRTIHJlZ2lvbiAqZG9lcyogZXhpc3QsIGJ1
dCBpdHMgc2l6ZSBpcyB6ZXJvLiAgVGhpcyBpcyBiZWNhdXNlIHRoZSBzdGFydCBhZGRyZXNzIGlz
IHN0aWxsDQpuZWVkZWQuICANCg0KU29tZSBwYXJ0cyBvZiBHU1AtUk0gd2lsbCBsb29rIGF0IGZy
dHNfc2l6ZSwgc2VlIHRoYXQgaXQncyB6ZXJvLCBhbmQgdGhlbiBiYWlsIGVhcmx5LiAgRm9yIGV4
YW1wbGUsDQpoZXJlJ3Mgb25lIGNvZGUgc25pcHBldCBmcm9tIEdTUC1STToNCg0KICAgIGlmIChz
aXplID09IDApDQogICAgew0KICAgICAgICByZXR1cm4gTlZfVFJVRTsNCiAgICB9DQoNCkJ1dCBl
bHNld2hlcmUgaW4gdGhlIHNhbWUgZmlsZSBpcyB0aGlzOg0KDQogICAgcm1MaWJvc0NvbmZpZ0lu
Zm8uZ2Z3U3JNZW0ucGEgPSB3cHJBcGVydHVyZVN0YXJ0ICsgcFdwck1ldGEtPmZydHNPZmZzZXQg
KyBwV3ByTWV0YS0+ZnJ0c1NpemU7DQoNClNvIEkgZ3Vlc3Mgd2hhdCBJJ20gcmVhbGx5IHRyeWlu
ZyB0byBzYXkgaXMgdGhhdCBJJ3ZlIGRvbmUgYSBsb3Qgb2YgcmVzZWFyY2ggaW50byBob3cgdGhp
cyBjb2RlDQp3b3JrcywgYW5kIGl0J3Mgd3JpdHRlbiB0aGUgd2F5IEkgd3JvdGUgaXQgZm9yIGEg
cmVhc29uLg0KDQpBcyBmb3IgdXNpbmcgYSBUcmFpdCB0byBkZWZpbmUgYSBkZWZhdWx0IHZhbHVl
IHRoYXQgaXMganVzdCBvdmVycmlkZGVuIGJ5IEdBMTAwLCB0aGF0IHdvdWxkIGJlIG9rYXksDQpi
dXQgaXQgd291bGRuJ3QgYmUgYW55IGNsZWFyZXIgb3IgbW9yZSBhY2N1cmF0ZS4NCg0KSSBwZXJz
b25hbGx5IGRvbid0IGxpa2UgYHN1cGVyOjp0dTEwMjo6ZnJ0c19zaXplX3R1MTAyKClgIGFuZCBJ
IHRoaW5rIGJvdGggdHUxMDI6OmZydHNfc2l6ZSgpIGFuZA0KZ2ExMDI6OmZydHNfc2l6ZSgpIHNo
b3VsZCBqdXN0IHJldHVybiB1NjQ6OlNaXzFNLCBidXQgSSBkb24ndCBjYXJlIGVub3VnaCB0byBt
YWtlIGEgc3RpbmsgYWJvdXQgaXQuDQoNCg==
