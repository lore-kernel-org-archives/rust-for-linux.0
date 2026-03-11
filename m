Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273AA35A930;
	Wed, 11 Mar 2026 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773251616; cv=fail; b=ensMKSAngvlBExBORPUlCDKqHV2z/qv3+LLFw+IFw6Wao8lifP29eMSOSODonfmVwFqqHRRga+r/qtzKVTv24u8zrTVCkqCThhVkcXORG27U8qtCQSQa1mAFsvRElbWOeJ6WS5xD+5Cj95noH66Me8Kc6x7g1reN87ibAAIDFXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773251616; c=relaxed/simple;
	bh=mI22hOVNlxjOkfMB+qWcKQValpvaipaZMNjB5Wdb5A8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZVHINpk2WUCMjb6Ys32KYShWxW4EqhKwljdSb+XrXUidErxsBQEGIxnomz4M9qYmD1QaKDSG09OIqvNceOds4LLknxHIorBy/PIbpesuWJMhFScQPaul/0vgya+SiABt22463v7eFJNmsoTM5ou9LjR1znbgxGzGSkbKnuF0viI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TaiaEupy; arc=fail smtp.client-ip=52.101.43.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TaiaEupy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUhPDda/1P6WKrBaIzpJKwJFGtfzTjYou3ADr6vdlDqFwzjeRExfaKEYQJwg5Y+E6VT23hbxkirkIWlzOISlMK7A3zBEcQineRLE5sWg6tmrKjHx+zYP7uVq1TLziiC4QUZ1/97G+78WaPz+XFj9hWYC7Rr8lSH5i6ceg9vJWgRcO/jKP3U6PgFAHXYiwtKUPY/Capaa1QyBQEqzc9Lvc/nbdYIPsf+AqE/FK1uAUX8K7s3dXZ04A4RP1dwWpWL9Yonx8jOkJDdB/r/ILXFJMuAOqhpSEW75NpZzUJeajSewETV9lXus0JUi6EoUvZaz8fVPHaavFwxHtVN63weojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mI22hOVNlxjOkfMB+qWcKQValpvaipaZMNjB5Wdb5A8=;
 b=rT5Tz/ICL9vL5CuhJRT5LoG1oZCsU0JtDp4Ng8jTXCMZxec6UI4HFTMB8hfFDpU/ejo0OO0iMzNNv60YRydQYDgVuGMA22ys+UfcIii5nik+68x3FK7eglGbU/ysr+YimCFZM1oYhRWEL/LXQ5hoTGQ2rkSr05FgQlr2qfJAAZLc7QZf9OL6/UfbGVVETyEPcfohIpJP9kfB7Lzv6P7fQVBeVAOomuZ2CAY7puVVv8o1DFj1iJJ6c2Ye++AuH5DKiQpJOHRQarb/N6SPrfFxOKKNpXucHnK+ZkYEhbYAkxLLlAHSWcjfwZu50I29WBS+kx/2ZP/xovLzKOLauKOHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mI22hOVNlxjOkfMB+qWcKQValpvaipaZMNjB5Wdb5A8=;
 b=TaiaEupyDDmx+/uNNYPYM9mv6vJqcRsjmL0uNTqN04k7LAT6h55u0llYxbJE92oIkdrvMsUAXwr3GYsKB4MxOkte1EwdRcy2QdYncyXIUEZp37HEeUfqRbBeQFVS6pLls8UvgikMJ3PyIxIQscZxvcbU5P/iTETFnADipDzp+HWK1vz8D5h1k7NJWFsaRZ7xnelhgKz/Jm+eTC2fEHTqUWEj0G9sXeNJ2MtgyAgsE32rVrKuvnZM1NK2QZX3ub5kU71ucoO4OEyFI4lJLbXfsdsWcSXllzFipeTQQbl8HfbloHY0g9dEwD/KWvBxV059XUai/r0mL1qx/5fnuJgIcQ==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 17:53:31 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 17:53:31 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>
CC: "gary@garyguo.net" <gary@garyguo.net>, "lossin@kernel.org"
	<lossin@kernel.org>, Shashank Sharma <shashanks@nvidia.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com"
	<aliceryhl@google.com>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Eliot Courtney
	<ecourtney@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "dakr@kernel.org" <dakr@kernel.org>, Alistair Popple
	<apopple@nvidia.com>
Subject: Re: [PATCH v6 18/34] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
Thread-Topic: [PATCH v6 18/34] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
Thread-Index: AQHcsDNECN8ynpP6aEqfAILEEVXUyLWnmQyAgAIGfgA=
Date: Wed, 11 Mar 2026 17:53:31 +0000
Message-ID: <0b6cee2b5bd82b3af2f5a77592614082af0f3e7f.camel@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
	 <20260310021125.117855-19-jhubbard@nvidia.com>
	 <DGZ1RKRZNJ92.3IPLTIW507A3R@nvidia.com>
In-Reply-To: <DGZ1RKRZNJ92.3IPLTIW507A3R@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|SN7PR12MB6670:EE_
x-ms-office365-filtering-correlation-id: b44eee82-d3eb-434b-f081-08de7f971b80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 BDCX7j8rbPS0Fd+sksFu5cMTBzeXJJ8e7oTIyI0g7EChIXHrIYyWbP4OlkQUKzq9PEDyDuLfb9JXi3t5QXFdmlRv4QOeBLYtZAEYzMtPEI0qOXOVnghsqrUGSqUyhi2epPvbPXBwSwIttUaFge6uO00QnaTVZ9FiERfcdn8dCqP7YpaP46mklI5SyrAQByRpVmvGo0yHNc+BvrvSkSvTUs0JOrjgqlGQUmRwtepIALtuwHUHFf5wgC6thsKJ8ZTCI7GT8YCgjTi6/Q3vxJEoafdQN457boes4cmMtW6Emf2+how8nmNruhca194fhVBhwbSLCyTSnimEz1jXmbPNrxb+xCnyd2n0a+MA5aKOAp4U0OTfSjOkPC+/gnWoeXKW1j/9QXrlbjA4PaGLGKjPHr4P1DNaZTWL++W+aIONqCw000JN6FGjdz/bwQMDB5McMsas7KVDp4I2cibY+3BsZWZH8TgVhIfXUUyYWAuOLBm3Lb0o0eNzW16CqyDAuIKpD8teyb3tnlhP0V1bkWdLIl84KQOCpyEIzu8Lou7V9/teRDAgFkW9XQscBeSflqL/jo43O2Kls50bBn7vVfWkiKJw7q6KxbpAzkgxbX3yANndS3f1ffpOK9S1Q5/Q0dbRc8mtiax5fU9x0JohQSw4uXEhl0bL/BdxXNV2m9NHYUnXD/IqV3COEi7jpO79p0OQGeDdKY9U1oaPYN1TPvR7L69rVHNYNtw5etiFwz0TU/+FO4vKGyFvhYtsgBpZt6nvn95zdsyUmgukue/xp2we3ReDD3DeN2NBm8TjHLIuS0g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WUdtRGhKZUNseXk3azlBTTl4cWg3QVR5blZCVEpDTTVCcWpwcGJId2ZSVnRG?=
 =?utf-8?B?SGJ5YS9NQ3VPeGpFRXNiWHhJa21nTitZY1V5d0l2RVdSVDh4UFBwYklDbHE0?=
 =?utf-8?B?c3ZjQjR5b0pvTUF1S3k5WDZkNFhmcDdHcEVpcEpRZjAvdjV3dWhTRzV5Z1pH?=
 =?utf-8?B?SGx5L2xMOU05N08vN2VSTW91Yk85dll0NnB6S3FPc3JhNXp6RGk3WS9Ba1p3?=
 =?utf-8?B?d0wzU1NwQlF0RVJCMVgzOGtydzNmREptTGpwajNPSlNUS2UzK28vZ01BaDhM?=
 =?utf-8?B?a3kxS1FmV0s1andraDJBY2krdHNTQU94dzNVdlNzeUJBaElTc0NZeXQxUDha?=
 =?utf-8?B?aUlSc0F3dzUwUEVuVTI5UWwrRGhac0ZQYklhTFF6WEdxOFNoc1RDT3R1NFZH?=
 =?utf-8?B?NlhySXdHSkp2M2YyZlEvMXZ0N1pLbEoxZ09OL290aEUrTk80VTZOL2ZYL2Q2?=
 =?utf-8?B?UHhvWUFTTFNiK0l4SitBS3I2VmttemNVUXA1dTdZSHQ0UzA2M2FPeE9GcVFl?=
 =?utf-8?B?MERvVlFqMmJPVUdUakN6VnNGMEpOcHpTSGVxYm1KOFUyajhVeHNtQnNiWFhP?=
 =?utf-8?B?TVYzdk95WHJtRjF0OFhKRjBVZEJaZWl0dnVISDJ5Y0liUmxTNFpKcEZtZmlx?=
 =?utf-8?B?UUpMWnVDVDRzVzJZU0x1V1BCYW5oR3QwRklWUFlDTktlMTMrOW0xZFhPNkFv?=
 =?utf-8?B?dWhDUjZKeVdCUXYxaW5FblM4eXZuTDI3TC9lclVodFNvVHZ0ZGQ3R1lieUhV?=
 =?utf-8?B?VmhJSzFtK0pTVUlYM3BlUjNXTlRQSXZaeEJvMk1yS0paWVdOM3Nqd0Nwdjdp?=
 =?utf-8?B?YnZZdjZvWDFTYVN6THRIUDViOUt4cFY3R0hWWS9qSEloTC9IeTRIQnJmd0FY?=
 =?utf-8?B?WnFoUGRQaEtyR1hsajF6Wi9CUmFOeWdPbHRpblorWXBwMWhyOFFsVzdHN3Rj?=
 =?utf-8?B?ZXZiOTFqbTM4K1BaWVNyQkRhR0ZjMUNNWFlpVFEwcm15cnhuYUNEa096bUN0?=
 =?utf-8?B?Zkk3WVN0ekVlQ0pLU1FTNzZxYzBHSUZvWVpFS1UvbUNOVUEvc0FSWmVybHNr?=
 =?utf-8?B?cW83VEdZbk04Q1RMb0dtc1JuaUZXNjBRR3hVcWpnQmkya2NUOG9VdUZLbXho?=
 =?utf-8?B?OFdGelpPRDdwQUJhdDFWbVJjOFptZ2Z1V3d3MzlKbDJOclEwd2prSnM2Vm9V?=
 =?utf-8?B?MkVmdWVWWFlzNWlQTG1vK0ZyZC8zeGlGZnQ3T3laMEZxRmVoTXljU2kvY1RU?=
 =?utf-8?B?dDhOMEdyZWMyOTV0WkljVkVnQUliTXcwRFo5eUR0T3NWUFdmVnVkRmxkWHVU?=
 =?utf-8?B?WndmaUV1VFBkeXlNZGdtUU14YVNNSXlHQ0FLM01KYm1td1BJcmpQRVNJVHI4?=
 =?utf-8?B?TTBHTncwTTVMeUh4d0JrenZOMFVHdHhmQThzcW5hbm12dHVNNXVDTkQ4MVBx?=
 =?utf-8?B?QXRVQkFYSTVyaXhrREJaemRSV2J6UUVWaElodUlmeWdFNThDWGd2SzJiRnI2?=
 =?utf-8?B?WDdmWkw1Zm9FdVIwU2JraS84KzBjV09yOWU4MmhqU212RkR5Yy94ejZIVGMz?=
 =?utf-8?B?QXhBbTJEUm5kdFErWEo2R1FMbWxwSjlBMU9vcmM4dnYvU0w0alk2THpvZTBl?=
 =?utf-8?B?MTZyS2ZTSkY5RisyTXNrT2FLME1iOVowanZEbnlRejVCU0VGdERURWhiTks0?=
 =?utf-8?B?WFJQNXEzQy9pNUtuWDBVR2FsczlMejV1R1p1bzJEL2o4SWdmMWNPcVlWOXpi?=
 =?utf-8?B?dmJ5SWoxUzdvRmovMDlZQXZFSGNRY1YrcVVmZnRHcGUwYUlyTjVJMGFtVmVu?=
 =?utf-8?B?YVhvdVpDbTJGSGxnTlFhRXVVNE93L2ZWYU42cFJKLzVHczlocTNPRmRnbW9W?=
 =?utf-8?B?cmF1MUVpRmZrdTI1bzJmZ0hyYnNWbkdoZVg4QnJYTlJNVVZjdU1NS3p1TTY2?=
 =?utf-8?B?V3NoWEdIMklzakNTUC94SG1zczdhd1RQTFpvY2hDak90TTZaMmZwODU3dmNh?=
 =?utf-8?B?VzBIbXdHSVp6cXdKalg4SHhJL2ZoRHdRVWJZc3ZYNm85ZW9seDVNYjZsUCsy?=
 =?utf-8?B?Rmx4dkFoVGF5UmovQkxnenlRTkI1QmZDZUs4cjQwNUtIRndGQkVGZkJzVzdi?=
 =?utf-8?B?SU1LZHU3MnIzaFB1LzViYmZ5NjBaelkxQit3NmNXYVlhdFc4RjlxeVE1cjE3?=
 =?utf-8?B?UndYejJFQlNWRUpsemJrTk1LQ0ZIT1FGb21FOTVubVAvTjd3c1hXcFdYbFJ4?=
 =?utf-8?B?dkxVOVl0RFFjVGxiUk9CQXhoaTB1R3h1WmNpSWhtcEtGb1BxbHMxY2draFl1?=
 =?utf-8?B?ZkJrVUE1bytQc1paUERZQ0NsR3JiLzZrbHJqWVA3VzFUUE5UMjNkQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB02B3E15BB11641B9F360CA9F7B3609@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b44eee82-d3eb-434b-f081-08de7f971b80
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 17:53:31.0997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sH7bbRIcVpCfpivZ7JUrHQCBQ246F4Jux6krWK/V+Eci+nlQoka73vystqJVTa5NYTMmqlZeN8uO3Gr6ayR7xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6670

T24gVHVlLCAyMDI2LTAzLTEwIGF0IDE5OjU3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiArLy8gSGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgRlNQIGJvb3QgY29tcGxldGlvbiBz
dGF0dXMgZnJvbSB0aGUgY29ycmVjdCByZWdpc3Rlcg0KPiA+ICsjW2V4cGVjdCh1bnVzZWQpXQ0K
PiA+ICtwdWIoY3JhdGUpIGZuIHJlYWRfZnNwX2Jvb3RfY29tcGxldGVfc3RhdHVzKA0KPiA+ICvC
oMKgwqAgYmFyOiAmY3JhdGU6OmRyaXZlcjo6QmFyMCwNCj4gPiArwqDCoMKgIGFyY2g6IEFyY2hp
dGVjdHVyZSwNCj4gPiArKSAtPiBSZXN1bHQ8dTMyPiB7DQo+ID4gK8KgwqDCoCBsZXQgYWRkciA9
IGZzcF90aGVybWFsX3NjcmF0Y2hfcmVnX2FkZHIoYXJjaCk/Ow0KPiA+ICvCoMKgwqAgT2soYmFy
LnJlYWQzMihhZGRyKSkNCj4gPiArfQ0KPiANCj4gVGhpcyBmdW5jdGlvbiBpcyB1bnVzZWQsIGFu
ZCBtb2RpZmllZCBpbiBwYXRjaCAyMiAtIHNvIGxldCdzIGp1c3QgbW92ZQ0KPiBpdHMgZGVmaW5p
dGlvbiB0byBwYXRjaCAyMi4NCg0KV291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGFjdHVhbGx5IHVz
ZSB0aGUgZnVuY3Rpb24sIHNvIHRoYXQgd2UgY2FuIHZlcmlmeSBzdWNjZXNzZnVsIEZTUCBib290
Pw0K
