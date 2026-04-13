Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B9358375;
	Mon, 13 Apr 2026 21:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115290; cv=fail; b=M26iwpU13T5KqEh9ok4BasF31sdghkyjlS4209LqOdON12jhDtTTJE9y+YTk8kDO+X2fIVrjpEJGcO63jn0sXwQxz2bGpOrI7qhuNskArCx9F3SCJj0IuAlcCrHi/aSB132ihb3e4tFSmHIW64VxEUhoBJDGWEtJUnpH731OivA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115290; c=relaxed/simple;
	bh=fSXTAbh7kK2q+i11NNfZI0OYFn6SzVk+B9lQ41a3L0A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HBEEJ88d8b63qYpEnSMMzP4h7dMpgqc7PlIKgbv2oxE1qfhhsZ2K0VuK66kLPiMWqTBFMwwjDGG7uYTOwORmJp44qPhsCjcLnaoRqYAF1x2c3IZMj2Rcf17F07/+RzL5/KcD+dKIWtEGY20nmOkUNs0d7JyduwiHdy2vF1EvSrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MzCY+aU/; arc=fail smtp.client-ip=52.101.62.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MzCY+aU/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqtwGkrWLO4lj7lMKxfuwz3xhzDW/LBqeKWNXXYiHlHqlDPHoQRFFXgQRXVxnSs1fI8cC1pc8rD8UI2L1fL7a2y02i/vu5Pey2W62VC3j3WhiWtl/oKRK8sW1En5bku9YNTNLRos4+wMkBVYknl6VgxxBjCh713lT4ohN7RYuDvf/ttsc7kqKqcJKjna6vVzz3+5NiSCLjaqp3JTduqzvVirX819YSf25NT7p4K8WC3VUfn7e3MwU59lXU1JYQD9NQ/+wSPyfQVsllgFgays7OmdelTcHBBcQrKsPgnn7/5P+pTeo6WeWSv33MrYxv9xPLQ4ZYmjA3S6fFC6z2lvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSXTAbh7kK2q+i11NNfZI0OYFn6SzVk+B9lQ41a3L0A=;
 b=G6aY6cvmCAFSVhL4t/VuyrfzvOOkoZSPK9ZI3v6zROe7UZaVRHrBE/GcUlONBOX0ghK96b0/f918gUOuGR9NXGB6d5IyeCtYtS3Vn1a1v0/1FImlsdpe4fF8woHQh78mHG7A+2AlQr/4q0h0ydwz7IdbLmoDtN/zmdPyJkNIkB4vRS0ViTjB1mTG3O5Kwq43eSvMuWmcgLxx53n4qOl4QHrc3M1cT6PCHtFMwZjzhSEbXfYzN/Ldib40FTrXwzSFQbxFU2u5QtM7VFR4/W1VCTvWYIrtFB/uRF/Gl2Qvg4Hu0XC9F56P1Mv+kPu9e4DfyugMYNFd/s3AzKjq+D4J+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSXTAbh7kK2q+i11NNfZI0OYFn6SzVk+B9lQ41a3L0A=;
 b=MzCY+aU/y+8YPUGVtw6VR1M7cCrCoJH+T52uWzZITqkcW79Y6BMEk3gDjCB6yU5FukRi5SA0VYsQTjJdwRHCkt/yfzXzr4zpQAxeEJ9a8fQ1zyGe5Z1Ft57uBpYzK8nQNubKoOhkV3BGLZ2TNi0O3YG9YJR2L+6vY4TE5iI5OqDB4SLrTIriNH/uUf4KFdaDEKEtPC071wUbZV1TJWBl9vf9vR8/0TxfIIuiqyGVppmr5tQrMGHSoZ5LAakO2veo1ZbqmYcVUiWuBMCCnZQvaCT6fuA+oN8z3coVLhHAGElhZCCJALE2mh90SbUJSxubu0WiSLVM+flTjMK2Ny2Itg==
Received: from DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) by
 CYYPR12MB8731.namprd12.prod.outlook.com (2603:10b6:930:ba::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.20; Mon, 13 Apr 2026 21:21:24 +0000
Received: from DS7PR12MB8420.namprd12.prod.outlook.com
 ([fe80::b9d4:6de4:f1ea:88b2]) by DS7PR12MB8420.namprd12.prod.outlook.com
 ([fe80::b9d4:6de4:f1ea:88b2%6]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 21:21:24 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "a.hindborg@kernel.org" <a.hindborg@kernel.org>, Shashank Sharma
	<shashanks@nvidia.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"lossin@kernel.org" <lossin@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu" <tmgross@umich.edu>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
	<apopple@nvidia.com>
Subject: Re: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Thread-Topic: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Thread-Index: AQHcyV3lkcAMQsc+f0iu8dh5AdWM5LXZPCwAgAREWoCAAAOzgA==
Date: Mon, 13 Apr 2026 21:21:24 +0000
Message-ID: <8e47b4697c213ce11dbdae8a1a3fcb591c69b34b.camel@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
	 <20260411024953.473149-4-jhubbard@nvidia.com>
	 <2a4c06e1616ec84e29166d881ec3240a1fd441d6.camel@nvidia.com>
	 <cb2bf998-55cf-466b-a6ba-1851278bbf43@nvidia.com>
In-Reply-To: <cb2bf998-55cf-466b-a6ba-1851278bbf43@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB8420:EE_|CYYPR12MB8731:EE_
x-ms-office365-filtering-correlation-id: 4b1cdad3-a47c-4b4b-842e-08de99a29da1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 ydokSZw+y84l7mIgpEmooPVqSjs0QS9P8Yjj2wxxSXZaaTZCpTV+qBjrB8QgP3OhC0qzDRCdht4TM7qr9Y+2Rivrn566aDPLMfuIUiia1uLIYFkbqvSfgxMwy3QMvm/FFDiblbjUBZahvK7AagQf0JyTspXK4ZV9rBJKHO5YMHrcgq09zjbv5azI+BQLV9CSiRF2nuq9sVp/ylTY2rFftt5iOOVdCw1RVKpPWNf3qeXLcRruhWANJrWothZzROSWzknHj7YqDbdlum0PBuV9NUnBGa4TenAGgs4DDRNVYxPQWMUMf+GfkZl+flDlkW0CV+mDnv23EPL6Ew0MgkEYYBALhsB7vAFpmJmjNseI4FjF0kJAKfuCHO5Z0imUx8m9mTwFMNi/lll+cEuhGdd6RBmZdS7aLid1yMnpZbTqRAD7TdgJgApnliOcl/EU88IMGBGdlNr/gxFwvS/qA/XDGYHNHaGlR44zYIr0CaX6Lwvo3jWPlW1CddChFEkuvF2fAoRmUtxeKiQfKFx/gBxixLtiz6g0nAyOcnuGgd70OgqNN7gadKVmP7o1VYbSPInJNEVKmnhhxfysrPFo9LLpNeg6kB4y3TR89Fu5mnKsY7UNqcVyFApUDsCd9zrCeGGp5zWHwe7yWomDlfbHf2yqly42SXf+iZmF2iGu2WrfS3HFTurL5zLTf6xePitWEd+qL5IdrdYj2oFDZITLtagHoj3FWCR4t9UwbKr4SgVjapAIoi5wXMkDdpQAszt9AumDsnjFLuCkSmSodR+X8D+GCWRiWiV25IuUBhHNoJPPtjw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8420.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YzZ1SjVmU2dFS0NQZ0VkRjNoUU5OUVc0YzZHNnh1Y2kwR1hudjBSRGg1akYy?=
 =?utf-8?B?M2RLZWlsYmwyRGNidGM0eDVZcmhxR0dkVXdDOXEwb1h6QkpxOEQ0bFJuM2lG?=
 =?utf-8?B?OVZ5WEJBakxjeHVwWWdFMm5GSlhWY2lXV0J5RW5rc0VDM0gvSXBEaFRIM1g0?=
 =?utf-8?B?S1BKV3cwZTlBS1FPR0RwRm5laWNLa0x6YnNpN1Y4aWpqUkZFZnF0Ty82ekZt?=
 =?utf-8?B?andiZGxIZDBhK2tkR3VNdk1nZ2pnbG1uVTZDdW5hMy9pWXhQOFZ0M3lhSnNN?=
 =?utf-8?B?aUZxN3U2MmYxWkhMNTFLbUJnQXM2UityQlE1Y1dWWXV5L3NQYml5NEhmUElR?=
 =?utf-8?B?YWQvaUV4ZlZDK1ZSQnM2bVRDd1dwZVVzTWlnRUtsVWtGM2o3cE5xZEppVUJa?=
 =?utf-8?B?bVdINll0OXh1ZlFoR0hoTFhyekt6VG5CNEtQK1BXdjZ4Y1doL04rem90RllW?=
 =?utf-8?B?WDlDNzgzUStrYXFqaDNEMWxaWUtvZlRweXBSSmhqNHNhMHJjdXVkQVY2TGg0?=
 =?utf-8?B?SkMrb2xVaXRoYU5NT3Era0lNVTNYZFF3RGMzZGljVHhnQm1pcHdsdXg1Y0ZL?=
 =?utf-8?B?TEhpNkNESlJlQUxQcVlpaWVlMVlHYzFSRW1nTW9WNmd0d2pCaTViWEE4d05Q?=
 =?utf-8?B?K1d2d1hkdGlQS2xqRURRRm1BYzhhTitRanZOZEJwQ0pKd0dwbDdpN0tXaitB?=
 =?utf-8?B?RmVmWTB0cDNPUC81b0tsVDViQS9sZWxwam00azV0Y3pXYjF6amdtd3NyZ09q?=
 =?utf-8?B?bTNZUzN4U3JQRnQwbHU1bnl6NUt5ZW9GL2pVaWJZQ3gvWlZpNkZJU00zU29v?=
 =?utf-8?B?aFZtR1gvSEQ3M3FRbEVUcXhpNXR2ZEJOalBnMzdHUnY4MlZ3MFc3L1JNKy9N?=
 =?utf-8?B?eTU4UVVCcERuYk5DeVJGUTVwYUt3NDVCZzNWQ2ZtdVJVS0xSQ2NQdXdRU1BU?=
 =?utf-8?B?S1Q2bWkvSnlRblUvdDJsUHFDeHllNHN3TEx1VGZPelowRjJ4anpTaUR0R3My?=
 =?utf-8?B?Y2NVbWZFb1hWWC9DMlNJQndSM2ZEV0ZiR2NrblBqVkVURG5MY0pUb1dHNlFE?=
 =?utf-8?B?SUZHdEVnVGVJSE02ZUs5TWZRNmUvZ3g5TnZ5WmxFNlllZVpDZWM2Z2xrb20y?=
 =?utf-8?B?a0hwQ3UyczZFVllRRDhtMU9RbmxCNytDZEp2dGo3aUNTVXpkd29GcmRRanpo?=
 =?utf-8?B?TllWMDJ6MnJBV1IzM1NWMzc1bnVvMVBGVWJMeWtrblN2WUhYUFRDWDVZdGRv?=
 =?utf-8?B?SVNnOTZsZmx3bElsSFhmNnduU21GcFJuNFZuSE5McFlZQ3p0MWZwWWFJYzRD?=
 =?utf-8?B?K2hGQ21Ud0pIV2xFdzVwN3Z3dnhIK1hNbVdKMzYvZ2hlcjJZZVRwb0NkdHhv?=
 =?utf-8?B?OXZ1K3F5T2xJL2l0eDNYRTRRMzVvajBJRnI0MVZidnhURHZxRkhNWXMrd0Yw?=
 =?utf-8?B?WG51SmxIWmN1YjlHajIyN1NiNmhsdVpwblJzNVkzWlFhaFhPRHZSZzZBZkRB?=
 =?utf-8?B?cllMWDNZaVJOaysxQ0wrZGhzNTBwV2dWRm1TSC9TTXhIczBjQ1hlUStUaGdI?=
 =?utf-8?B?SFFiazVybjgwa3NGcHdTNmUzVzdmcnNKc0lHT25nazJKd3ZOOGJuSjBjZ0pI?=
 =?utf-8?B?RzZOU3BHb3czcU11b3puUFFFL0trU2FIOEtyOEU4ZjZOQWk4RWpnVEUvSGxD?=
 =?utf-8?B?MExkZVlPN050VW5nZXR2NEpsZVVLU1RFcXBDOUVKWndXZFlYMGRxVnMrdHR5?=
 =?utf-8?B?RitKRTY4M0NYVTNKdjNjTktDR2RZaStwcngvSEZ4T2h6TElFVkc2SStkOVNK?=
 =?utf-8?B?YUhBN2ZUZERGWTQ1UmdDdHhVMjUzT2FvNloyZ3lBZkdXYkRvT3Y3a01aOC9C?=
 =?utf-8?B?Q1dLcElmdmhiY2NkSTlIWW1VTDU3bFVqMjhzc2U2dkUvMVJPb1ZVenpiT0l0?=
 =?utf-8?B?QnpiU3J0NGt1RFptR1RLNTBJVGhVOUZvV2NDWFViSld3ckYvajRFSmMwK29k?=
 =?utf-8?B?eDMvUHlXRGtPOG9FNnI5VDM0TUF4cTNmWkp0amRmSk5EVEQ3TmNLcloxMVlG?=
 =?utf-8?B?TW1nclo1cGJ4YWpsamlHb0hPUlNpUXJsM04waU5jVzl0YU1iYmFTOEVBZlcw?=
 =?utf-8?B?YzRkWThia0NWNXA3UU5tb256Y2hWSWQ4TUVuYm1NTUdweFVQckNybE8xay9q?=
 =?utf-8?B?YkIzdXl3OHNyU29NbC80SEtmS2FBVmk4OEVqNnZZTmVRRk5nWWVyc2ZHcVNm?=
 =?utf-8?B?NEJhSk01bzFFMEZiSU5FVnRiTHQ4MGZ2RVFrdWJJM3U4aWxJQ2RabklLTVE5?=
 =?utf-8?B?VFVQS3IwcjltQVhGK1lGZ0c0SmJNbW5mbUpXYXcreWptWjFhWlpYUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EF908EA803E644A9945B073EB06931D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1cdad3-a47c-4b4b-842e-08de99a29da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 21:21:24.1384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvGP7mnofJYCH16mA8zdn32BrZOjyG6CxT+j2iR4akDht8fSNB+vZOLe99t51H3y+rc6gWU9Z3DyHcfz7MoSjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8731

T24gTW9uLCAyMDI2LTA0LTEzIGF0IDE0OjA4IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gQ2FuIHlvdSBhZGQgc29tZXRoaW5nIHRvIHRoZSBwYXRjaCBkZXNjcmlwdGlvbiB0aGF0IGV4
cGxhaW5zIHdoeSBCbGFja3dlbGwsIHVubGlrZSBhbGwgb2YgdGhlDQo+ID4gb2x0aGVyIGFyY2hp
dGVjdHVyZXMsIGlzIHJlcHJlc2VudGVkIGJ5IHR3byBBcmNoaXRlY3R1cmUgZW51bXM/DQo+IA0K
PiBIb3cncyB0aGlzOg0KPiANCj4gQmxhY2t3ZWxsIHVzZXMgdHdvIEFyY2hpdGVjdHVyZSB2YXJp
YW50cyBiZWNhdXNlIHRoZSBoYXJkd2FyZSBpdHNlbGYNCj4gZXhwb3NlcyB0d28gZGlzdGluY3Qg
YXJjaGl0ZWN0dXJlIElEcyBpbiBOVl9QTUNfQk9PVF8wOiAweDFBIGZvcg0KPiBHQjEweCAoR0Ix
MDAsIEdCMTAyKSBhbmQgMHgxQiBmb3IgR0IyMHggKEdCMjAyLCBHQjIwMywgR0IyMDUsIEdCMjA2
LA0KPiBHQjIwNykuIE9wZW4gUk0gbWFwcyB0aGVzZSBpbnRvIHNlcGFyYXRlIGNoaXAgZmFtaWxp
ZXMgd2l0aCBkaXN0aW5jdA0KPiBIQUwgcm91dGluZyBhbmQgZGlmZmVyZW50IGZpcm13YXJlIHNp
Z25hdHVyZSBzZWN0aW9ucy4NCg0KV2UgZG9uJ3QgbmVlZCB0d28gYXJjaCdzIGZvciBBbXBlcmUg
dG8gaGFuZGxlIGRpZmZlcmVudCBmaXJtd2FyZSBzaWduYXR1cmUgc2VjdGlvbnMuICBMb29raW5n
DQp0aHJvdWdoIHlvdXIgcGF0Y2hlcywgdGhlIHZhc3QgbWFqb3JpdHkgZG8gdGhpczoNCg0KCUFy
Y2hpdGVjdHVyZTo6QmxhY2t3ZWxsR0IxMHggfCBBcmNoaXRlY3R1cmU6OkJsYWNrd2VsbEdCMjB4
DQoNCkxvb2tpbmcgdGhyb3VnaCB5b3VyIHBhdGNoZXMsIGl0IHNlZW1zIG92ZXJraWxsIHRvIHNl
cGFyYXRlIHRoZXNlIHR3by4gIFRoZSBvbmUgb3IgdHdvIGluc3RhbmNlcw0Kd2hlcmUgaXQgbWFr
ZXMgYSBkaWZmZXJlbmNlLCBhbiBpZi1zdGF0ZW1lbnQgd2lsbCBzdWZmaWNlLg0KDQpBcyBmb3Ig
T3BlblJNLCBJTUhPIFJNIGlzIHZlcnkgbXVjaCBIQUwtaGFwcHkuICBUaGVyZSdzIGEgd2hvbGUg
YnVpbHQtaW4gbWVjaGFuaXNtIGZvciBoYWwtaWZ5aW5nDQphbnkgZnVuY3Rpb24gYXQgYW55IGNo
aXAgbGV2ZWwuICBOb3ZhIGlzbid0IHJlYWxseSBsaWtlIHRoYXQuDQoNCkFueXdheSwgSSBkb24n
dCB3YW50IHRvIGJlbGFib3IgdGhpcyBwb2ludC4gIEl0IGp1c3Qgc2VlbXMgdG8gbWUgdGhhdCBz
aW5jZSB5b3UgaGF2ZSAiR0IxMHggfCBHQjIweCINCm1vcmUgbW9yZSBmcmVxdWVudGx5IHRoYW4g
eW91IGRvbid0LCBJIGRvbid0IHRoaW5rIHRoaXMgd2FycmFudHMgdHdvIGFyY2hpdGVjdHVyZSBl
bnVtcy4NCg0K
