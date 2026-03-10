Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAA175A9F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173471; cv=fail; b=plpeg8DrcBQW/CN/edDmYNU2aMCcyuGSTk9qy6SJxvlKOUk5kS8v8IxoQSR6XECcdvh38NtMQ4jErpiuUsyt5AlwkZrR1cf6du4RhJuu44c5r0peo4L06+9w2i8S+BtQWsnvfNwtjSHl3qYeJ8rVV+frWsaMi1rNHU9eDddBvfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173471; c=relaxed/simple;
	bh=ku1MrYFDt+JFMwbZCD795rPvwOumDvGwxHCF9i1Tbu4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m5fVWkzl07owQM6uhSIXoTlQhRi2bmV7XLBkeRLpBeJyJQ5eOtI9bOsoFnsN/+LpmcrsQaHY7ofqY6QhJNc6Q8a4owMqKXEQv6mwHQ6yrWizWvCG9sxPczVGi9j4ng06uIG6XGFb3Sc5Y4pxXg9OW07jS8YVTM3hJ8cflQd3yWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aFcf49Bc; arc=fail smtp.client-ip=40.107.200.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aFcf49Bc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmHtG+z/eEdQEPedEy6rmxZhjJ/Mobpjr7TrZNdRaQuV+pmpQgnS+FpXgu0TWLOwJBOs+IUV79HF2+pwOI5JSoZKm5Ns162QPgpRzF4pMrUL0sNuTlKr9E3WbmtC6r7YlnorV5uSz4H2YBCcqvo1kDP/EX34mlcCk2O6rgJkPolMeAWpfNOlJkm80ANDBKyERxcJb64jbjYteRQSPcSDc1gXmVGF4sC66p2PqWVLS/I+QCrgtZH0+kaz1OxG1nGOeir+ChpMQxwwR6PfmwkVwV2ycBgQa0r83rLVrQ4uzJF6PeJOLA8ORcgXpTh+9kuuzJDX2rmMomaUc4NDFyjeew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ku1MrYFDt+JFMwbZCD795rPvwOumDvGwxHCF9i1Tbu4=;
 b=LhBDy9a3ZzB4dKiHxMTIqOsUHAQpup5KZA/tYN9qFC9B/PyDqTSU6DOKdIX972qXRRDpaOee2e6fFYpq7TTi1bP8022HVOIrwG3hJCrPuQ/8nCHx/lq6rcUhQY3udLBH8oA1TspQr/iqbYoZkRvcuViHNJGWzV60PtQp/gwHgvMbLh5DfPbnksG6g2TS8ikWc9NaBkJ8FoO/B/xe/0uhIbltcl9sgNVBT1bgBTqHsimmB7A1S/LKLqigC9TGOvO2UCxkm3PYB9s7C/iyrzZnnBUOEO16j6bxiOuATBOHveiO8i2QR4svtHm9A64FAIacveUXP5cTSeX7f07Oz0Gv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ku1MrYFDt+JFMwbZCD795rPvwOumDvGwxHCF9i1Tbu4=;
 b=aFcf49Bc0eJ85CH+rWhHLTF09UaNw0oMfasM0r4sp3qYMb+7qI2DXTQtnmeqtPASeDlF89Udj212yIgU8QILys/Ba7rn7ennolEphXeVYMTjQ1nfbNn+XR0dXd7fqU9C+7ZlGIKJGJoJUrb0uwpenG9zzHdCkPw8CgMPE5afN8PJClJ7ssaHDAJiAj7s6y4Zo7LSpwxb1bJMNanrf8Xw7wEb9wn0iVgBVKx1MzvP0J4FcieH4FbIAbWipSDG7lM3BFdGMhxUFx62XhAvusXPgyJbYeooo0F+scgR+g+/Z8NP9eVNKrLDBwwU+GK+ivy6ge2vnH1U1x+iWj7eoHdF0Q==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by PH7PR12MB5593.namprd12.prod.outlook.com (2603:10b6:510:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 20:11:06 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 20:11:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
	"mmaurer@google.com" <mmaurer@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot
	<acourbot@nvidia.com>
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Topic: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Thread-Index: AQHclV8+E+e1YkC4CUS9TNMdRwsForWm080AgAGQZICAAAElgIAAA/kA
Date: Tue, 10 Mar 2026 20:11:06 +0000
Message-ID: <8eaaaf65ce5a8525e3b4469bb8763effe37d6acf.camel@nvidia.com>
References: <20260203224757.871729-1-ttabi@nvidia.com>
	 <20260203224757.871729-3-ttabi@nvidia.com>
	 <DGYIO09FC9VC.5DQNYP82VVFC@kernel.org>
	 <4452ba874cae2d6dfa64b9625e4e5f2ab7f34559.camel@nvidia.com>
	 <DGZD8D623QRZ.BXYEDETBVH84@kernel.org>
In-Reply-To: <DGZD8D623QRZ.BXYEDETBVH84@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|PH7PR12MB5593:EE_
x-ms-office365-filtering-correlation-id: dffc55a2-c1ab-4591-e157-08de7ee129cf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 uypyLV5COlpoS8B2t3k73ovxynXfC6PW1rVKl8V3xZ8h2RdMhVa4gPkE/WSSFoZO3DqjpEPWl8FeyKH5oM5KYrxWNzEcjpnBG9BeHg2eYNYRoDkQ3e7k/72BQ8pepzjGp8BMdZHMU/NAGDihRzAEP+EKmvdggaC54s+lBFK7t+Ju+RTAykDbkMHfOEObHug9e/VUwFxjkf5T64yP/j4Cn5Zdo8mNvQZ1RD4l3FJn0tlwWRArQrPHWHzsFL8EM4cYO2POIH/Y0CwRdlC9UcUVRbyRdZ5X6QgBQCx1MVJhyQZcZ4JDzkPhJpRHr11CfgMT5b/FU9khMW1++RUT+jxs9gFAm3ZioAltARKWrc4laozVcPwf6ctimClx+2iXrmV0X6j0kvlYB+NaIw7KtRYxvGQQztC8uEs953eMuue2MW5vZhizvAA3LzVyvfWSxQiOKsiAmXxyslG+yP1eVSUIlW5AlHdnsvLtznfowGMDJInXyRBnXi2bBuneVz/ffNIELTNsYAKz8VFhGay6qXgasgRIeb5WFE3Nxb3DuW99B98tv/MXvr0DlC70niX2MQbeEp/qUTCT5JJfmeq+EcnfnYnI1I0QHlIZPDAiXWzFicj4IXmEuczp5hOzMNaG3iKAuVANOjxpdTDW+W9s0ZJ8ofr67DNpVNTyz+woytFlA1z7lvYRy04TedfnYnCMit7lILa7Z5M+Bfii5RaKwzWB9Ly+VgrkcoCIU2NDESKByu3IKiOL/7cI2X7J71ftH6f0jP8WxQnUaTWvFQG4WmuHJ3pm+9eLecBkCDqPQ0nshcw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXhlNUxTWGRwU2lYZlFZZXgzd0prNGlaSnZKWFZ6eGxCeW9WMzVxTUh6K1Bn?=
 =?utf-8?B?YS9zdFE2NERHVmF6ekZYS2Z2bXJJMUFZTzBXK1NCbmRlSlllV2s4VnBFajVl?=
 =?utf-8?B?V3NBOWRSc2RqZzV2MVlaaGxCOWNNVzdRZ3VCeGZvRDNTbDVjOVRtTFZ0ejBH?=
 =?utf-8?B?VlhaWVAvZlA2bzZmVzU2Y0hjbEJ2dTB3TDIwY3N4S3hEa2Z3VVlpV1ptZGtF?=
 =?utf-8?B?VVpzcm9UeFBNcFh0TzhydTRKd1htRWNydG0yYm9XdnBwVWVKV0xsSDRUT3hM?=
 =?utf-8?B?NnhHMEdGK2V6OXFkUi9mbGI2NERETTcybEswNmlWYnpDUWo2TjBGQ1lpL2Vy?=
 =?utf-8?B?T1p1bWlUbTYwak9xdmhKNk9lc3dZVmdDUC9TUk90VTBMT05VY3EzQnU0eXlY?=
 =?utf-8?B?clUrajVoUnZWTFl6c2F2RUY0WmdNRnJQaU82UWpwTkM0YkNmcWpUcys0NVlX?=
 =?utf-8?B?dmlTa3QreVBJK3NPZlFYNUhEcy9rcDhac2dmZDA3ZndQeFkvb3hzcklTWmUz?=
 =?utf-8?B?UUVrTVlJTzFCRnpyTFpWK2MyajliUWJoOVpRUmVtWnowZG54SnZxcTNlQkV3?=
 =?utf-8?B?SXJ4Zjd4YnVyVklGWGVxOVJ2emcvWmxDWHhHUnlQWm5kZjZDcGZRMU9ubGNG?=
 =?utf-8?B?eElFZU52OXhEUFhrM0NKdEwxVGhxSkxabjhGU2FWMDdPWUxjaFhvdytaRVd4?=
 =?utf-8?B?OGJRSDJlMXVWa09lanVia3p3TkJrOExwMnZHQktuSzViQS9iNWU5Y01WUjg4?=
 =?utf-8?B?VUc5R0NrSkVmRHUrR0lWWUhiV2czRktEcVNLbUNFa3ZpZDZkdkxJcnpSMG5s?=
 =?utf-8?B?UENrSWdHdjVjb09KTHRBSk15Ri9hOGpLV1RiWEtnaXM0ZzVUNjBRUmNnekdK?=
 =?utf-8?B?UFpSODJ1RW9ZaUpkbWJIUklkYXN1ZGJhbzZaZmU4dk02R1E1R2VRc0xuL0pM?=
 =?utf-8?B?cjI5WEd1Nk55M0lodzZhZlRjNEZvUlN6bWV1Nit6cFFmdm5CTERyejhXUXdz?=
 =?utf-8?B?ME12anVPcEVqa2xtdHdzandTWWJLaGhLZnh5N3ZoVEtwVXFPQ1NBWHRyOFpD?=
 =?utf-8?B?V1RuUnpsVW8yWUk0RDJTV3RsV3V6YUM0K01qdkVXWUYwVDExZ2JEaXZZUEhB?=
 =?utf-8?B?di9HaHVYWHJqUW5Ua3lNak90bEVtelo3MDlkSTNDbHZWRU9HUVE2R09MYmE3?=
 =?utf-8?B?MmNHamtNcE9KYXV2NlJlWEEydzJwNWowOVFtRmZxQTJjQkJqb201WVViNG9N?=
 =?utf-8?B?SkZDWSs1cS9DclhWMzMvbFhtOEZFbFJGM01wRXMvZ3dITlZEL3V3OXU1YlR5?=
 =?utf-8?B?UGo5bHIweTIzeHhwRDZHZDBTcnlIdjI0M0NLKzJEREwvYnVTTjU1NytpanMr?=
 =?utf-8?B?bnZVV0NuaXdSTDNuckRsaHV0UnZvYWpWSldEa0dpdTYreGxDVFhUSVZSOEFL?=
 =?utf-8?B?cFRzOG0xMlVKZm9sbG5wN2xlekM3Z21IK0NzM1ZIZnlBZ0tEcWhhVzI0MkhH?=
 =?utf-8?B?R1pnbVE1cDZJMlBZS3V4MEhVd2ZTSUFQRDMrTk9GNkZNVExJbTFPY3Z6a3VL?=
 =?utf-8?B?bVAvQ21yK2prU2FMTXpCVUlHRm5qQ3FiOXJseWY1WlQvaXkwWlQ2RjhmY1JU?=
 =?utf-8?B?YnViZkdoTitocWtPem1BYzFPamo1WElNRmNRZ3hvTnNpK1NvQXpVekUvRFl4?=
 =?utf-8?B?blIvbmphYTl1U3ZselUrYThKMHZPQ3g3MGNBTzQ0Vlp4cFljVHdRdXMrRDUw?=
 =?utf-8?B?Y2t3NXp2aDVFNTRZY2taNnVVWDMwa21yRXU1V2pOSmtlRi81QkV0Q0xQSDFy?=
 =?utf-8?B?Q0wyMHN0aE0zNURERzVmWnQzYjdDcHQ0VjRlNmdkS0diSTBrd3JDVHh1eGE5?=
 =?utf-8?B?aGx1Q2xZS2I5N1hQcXlITi9qcFVKU1JiWmM3WG4xMitjNFRablg1dWs0VjdO?=
 =?utf-8?B?YWxnbWhBRzNkMkVyV2RDWTI1b0dkYzNNRkpOMnRYUU1DWW9zMVhidWVIN0hP?=
 =?utf-8?B?QUlpQVJvdTRhRUNEanpsQmJiUUpSNFhKbFZ1VDh6d3A0RWU4QWdEeHB4MVpq?=
 =?utf-8?B?RWMrSlkzZE5WUElDWngyYVBZM3puSGowVkdOck9tL2NaSXpWMjRmWWVScERa?=
 =?utf-8?B?UU1CTVRFUThWVi9jbG5Ob3pqd2RyeFUwMllEYlI2R0FQQ3VyU0hZM1BnbzJr?=
 =?utf-8?B?VVpOUk9JN1lWT01kcmFiRlFoQUxpR1hjWFplaUNrSkhraVlESUxZaEYyS2Ix?=
 =?utf-8?B?QlluSUhJYW1Ta21UMUVqVndZeCt4UXQ0bEJSR2VIT3ozUXk4a1VCUFZDalNo?=
 =?utf-8?B?OXQwQjhkbGJoMlAydDRMdUY2VzZmeURWYkgyZHE0YUNtNDlMcGVvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7EF24DD5E9D9C41BFE807AD00088AA9@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dffc55a2-c1ab-4591-e157-08de7ee129cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 20:11:06.7017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CFnsk0/EEp7Z9b3amjY2lS3/yTifO4KakB/UW2WwHUsA59u5/fb0wtXU53if9gTI9vsHmVn1S1Qeoy/niIRFVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5593

T24gVHVlLCAyMDI2LTAzLTEwIGF0IDIwOjU2ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IA0KPiA+IFNvIEkgdHJpZWQgdGhpcyBhcHByb2FjaCwgYnV0IHRoZSBlbmQgcmVzdWx0
IHdhcyB0aGF0IHdyaXRlX3JhdygpIGFuZCB3cml0ZV9zbGljZSgpIHdlcmUNCj4gPiBwcmFjdGlj
YWxseQ0KPiA+IGlkZW50aWNhbC4NCj4gDQo+IFRoYXQgc291bmRzIHdyb25nLCB0aGUgb25seSB0
aGluZyB0aGF0IHdyaXRlX3NsaWNlKCkgbmVlZHMgdG8gZG8gaXMgdG8gZm9yd2FyZA0KPiB0byB3
cml0ZV9yYXcoKSwgdGhhdCdzIGEgb25lLWxpbmVyIGFuZCBub3QgZGlmZmVyZW50IHRvIHdoYXQg
eW91IGhhdmUgaW4geW91cg0KPiBwYXRjaCBjdXJyZW50bHk/DQoNClNvcnJ5LCBJIGd1ZXNzIEkg
d2FzIHVuY2xlYXIuICBXaGF0IEkgbWVhbnQgaXMgdGhhdCB3aGVuIHdyaXRlX3NsaWNlKCkgY2Fs
bHMgd3JpdGVfcmF3KCksIGl0IHBhc3Nlcw0KYSBwYXJhbWV0ZXIgdGhhdCB3YXMgc2ltaWxhciB0
byB3aGF0IGl0IHJlY2VpdmVkOg0KDQogICAgcHViIGZuIHdyaXRlX3NsaWNlKCZtdXQgc2VsZiwg
ZGF0YTogJlt1OF0pIC0+IFJlc3VsdCB7DQogICAgICAgIHNlbGYud3JpdGVfcmF3KGNvcmU6OnB0
cjo6ZnJvbV9yZWYoZGF0YSkpDQogICAgfQ0KDQo+IA0KPiA+IEF0IHRoaXMgcG9pbnQsIHdoeSBi
b3RoZXIgd2l0aCB3cml0ZV9yYXcoKSAtLSBqdXN0IGhhdmUgd3JpdGVfZG1hKCkgY2FsbCB3cml0
ZV9zbGljZSgpOg0KPiA+IA0KPiA+IMKgwqDCoMKgwqDCoMKgIGxldCBzcmNfcHRyID0gdW5zYWZl
IHsgYWxsb2Muc3RhcnRfcHRyKCkuYWRkKG9mZnNldCkgfTsNCj4gPiDCoMKgwqDCoMKgwqDCoCBs
ZXQgc2xpY2UgPSB1bnNhZmUgeyBjb3JlOjpzbGljZTo6ZnJvbV9yYXdfcGFydHMoc3JjX3B0ciwg
Y291bnQpIH07DQo+ID4gwqDCoMKgwqDCoMKgwqAgc2VsZi53cml0ZV9zbGljZShzbGljZSkNCj4g
PiANCj4gPiBJIHRoaW5rIHRoaXMgaXMgYmV0dGVyLCBidXQgSSB3YW50ZWQgdG8gZ2V0IHlvdXIg
b3BpbmlvbiBiZWZvcmUgSSBwb3N0ZWQgYSB2OCB3aXRoIHRoaXMgY2hhbmdlLg0KPiANCj4gVGhl
IHByb2JsZW0gaXMgdGhhdCBjcmVhdGluZyBhIHNsaWNlIG9mIGEgRE1BIGJ1ZmZlciwgdGhhdCBp
cyB1c2VkIGJ5IGEgZGV2aWNlDQo+IGNvbmN1cnJlbnRseSwgaXMgdW5kZWZpbmVkIGJlaGF2aW9y
LiBIZW5jZSB0aGUgaW5kaXJlY3Rpb24gdGhyb3VnaCB3cml0ZV9yYXcoKS4NCg0KT2ssIEkgaGFk
IGZvcmdvdHRlbiBhYm91dCB0aGF0LiAgSSdsbCBhZGQgYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0
Lg0KDQo=
