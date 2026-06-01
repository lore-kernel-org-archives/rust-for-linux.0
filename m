Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFBE2BE05A;
	Mon,  1 Jun 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330266; cv=fail; b=sKYEqQSO0AuVX4WTV7iievWgTP5w1+EvPrwE7WpN2xxQ+1ItaaVLDZ7MKjhTHZvupP9l/kZi3IdEEKswIi3Y67scYg3Z1ewCSEMDgtqXZyvgviz9Afk0MZgYEQYhLEQi2d0llHcugteppHtp2tMejeEU0qkG9Vi8FNTdWHc3Vuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330266; c=relaxed/simple;
	bh=HOeJ00lT7E+THBy65Uj8h5xquYAF085VyLYsTuN0kO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TRtTcNBHFwydjZcSDPU/BSBJCXazyhjV7kcxdBLTb6e4I+FpAWFCggCRQhxT9E6gdgdqD7pjwpz+X6qEfntKYVIKq5qgvX8IAtVxGRjXIPbrSFGRbezTyppl53SnHZTMNy277k4LBoKoTAH+hI+igRK+mKe8XrcCOWxVkqbjpK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qJJfQbOS; arc=fail smtp.client-ip=40.107.209.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qJJfQbOS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrADCLhxhQbZt1vQPky0OaKwB5i+v/Z++FMobH5i+jZa4RGOs9uw8/YB7wc8lvB2gjwrozAlFyxQs9QBXvm3lYV70lqfxhoUgmJ0SWEpuXXPCnbMcLESnvXUsH1pCqIW6I6xwFZ/9/9PiAsbAxXLvxGrMmiCvC9wQiUuEPFdfwZYPSDQp9uuJl/k1VUdoG8Qsqx62pjqZ/yRz+P5TqnSQ1gg3P7n/f8QI5/DY8OE6tynWXFms/nqmnx7Li7XRjozjAavklRKlZKs/lI10GhewHgihdd4W91Zeo7Q8IelCzJ/ifDEf5hfm9X9y/tV/yP4FCh1fpHGZfJZL0IWb/YPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOeJ00lT7E+THBy65Uj8h5xquYAF085VyLYsTuN0kO8=;
 b=rq+KAYMRA7cKy/sI/9qLPAATUDX1mwC928zARwiCETUPVdOqM8yhIHQgVh6DKRVisR9uW89tmDLkZzhUFSOfscUwdCQs7u2IcNQ2p7oaMNSpk/w1R48dwMyymO4rIHuBsVK1CkXnMka3YgFMwSAXtiTpka4QW71TuSkoKp0QNGb7vl1JJs4ad26I8YVFMhH1Hy4vk56OMdoGd/z4vy6UaZOHe5TSyOcdlo2ofx/aFUmfdMfHaxGv+4GBAjsSUChxz+hWsPG7wVHyv08aZ9fzaO8xUMKKnLslOuAF27Xn3macDoUVyTVpGMl0u13L16Ss9Jmiz9vQaR/R8FRQHhvgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOeJ00lT7E+THBy65Uj8h5xquYAF085VyLYsTuN0kO8=;
 b=qJJfQbOSxRipYVVluM2DnmbTcnfQaMgj6cQR5cUtJM7pwk0Ei6QfqhFTkna47cRT56nzijnlPDHL6/h9fyN2WZ3/4ijBgrHoqvr4j/TMTYXw01KXssdkB4xvNJvratQewjEjiPG/5fC1QMPK/dImdyiJpOj3Uge7x2ef/knfFaOGQHm2eLL3PsxYgaVDQbB94ovNtfggSLWqhIQ9XUuEz9+H+n+8GrG1lwU/pvmtGg2FKkFnFgrig7PwyuBJb63c1bhCVCFE1IzobSnIBurcw8V71Ugi9iY3B4S3zeQETzY6QE3i11T+xGmfp1GJUKKfMyfmvgoWoA07Fnjl1gTgpg==
Received: from CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 by DS1PR12MB999190.namprd12.prod.outlook.com (2603:10b6:8:495::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 1 Jun
 2026 16:11:00 +0000
Received: from CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970]) by CY8PR12MB8412.namprd12.prod.outlook.com
 ([fe80::76e6:4d65:7ed1:6970%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 16:10:59 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "aliceryhl@google.com" <aliceryhl@google.com>, "lossin@kernel.org"
	<lossin@kernel.org>, Shashank Sharma <shashanks@nvidia.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
	<a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
	<tmgross@umich.edu>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v11 10/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon engine stub
Thread-Topic: [PATCH v11 10/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon engine stub
Thread-Index: AQHc7+HUz5CUMwAhp0OeAj2kZy4QALYp4rSA
Date: Mon, 1 Jun 2026 16:10:59 +0000
Message-ID: <6c85489c0e8d9b49c01352e869f578c609443118.camel@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
	 <20260530030953.740561-11-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-11-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB8412:EE_|DS1PR12MB999190:EE_
x-ms-office365-filtering-correlation-id: 340d0377-4f8e-43a2-9a8d-08debff85ef6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|10070799003|18002099003|22082099003|56012099006|38070700021|4143699003|11063799006;
x-microsoft-antispam-message-info:
 WpXqGWjYNDAHb1lwBWFPNGFK8Io5k+VfzJeqrN9z5Jwo7V2kEKx69Nx/agPNFESYeHLsIYlertMQNjPPZLenxQw1e/fU+MF/ROacA9J00yPJvUHW8bzq/eMtwcuuMtiWyK8c7FpAFYqgeOfIf+14hyybQJL6mNZIVS4pw2w6HqXtFSRlxsdKgCwxdnifOjgk+jaVWzZZmuqq/X+FUx7rDBc5ZfUYJb4TP3kKMOX04CEuzERZM1rOaYWDCTmHipxu6Wx/oG50NRg5x0zhKWwB1wIbkvztQsEE5U5uT022+7e880PYHyXj9m9Vc5PjcjfA9hysnQCS6eW5QaADTUNHZ5kKWYX0Wec0ns6zL+c3SnvfFplXlY1GVym9ckl9W/CR3mPTZUelk/3V4yUX53O7ppx+/1RUP4j3WY+RhPZ8GHGa3QKuzpqoMUVdyGRxt9SiK0BP6cdUIuaJCo+pQGLPpKsfa0Ea6G0adNU/7kA+jq31xIzYQDZVxjG5YAbtuRCHHkQJldEtc6KcjswewPrkB3ZHqr7iNsb4M7+sJoHyJlyW7SnpXVywECDhO8twCj/9xS7rOZ3HF7F2iN3Xi42qk9l6RuojJ/x9olqPWLdVwkh3qVtCPEFN1ca5W9ccRIqXGTPr0IeVgAZX44G7ZND/g8AQ5tQoMFK+jLGLXF1UR1qkWDm8G0QcgAWQHFVDzMkiDdrpj4vfEeoC8fH+RQ9WKDqc6OLFfTEk/aUVvi4pZpJwagwzed590gG9GZTK/nao
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(18002099003)(22082099003)(56012099006)(38070700021)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bTl0cE9Zcnkxc0huNHRyK0ZYQjdnV21MYXlnWlB1ZFFoZjdUZkd1NmtucVZY?=
 =?utf-8?B?SS9LUzVnckpSWTEydG9LaC8rTWZLQitZK2lBWHBkSG5uc0FHd1k2NjAzWHZV?=
 =?utf-8?B?dThDaDJhZ2E0VDVkZzZFczhNamNGL2I5TzRnQ2pPUU1qRUx5L2RVL0NUVzVr?=
 =?utf-8?B?dmZmNVRsVStQcGRWUk50d2xqUDJabHlOVnB3eDdralp4VmxSMWgvcjZHdzJD?=
 =?utf-8?B?cW9UUExmZ0FCMFNIbmRCdkdybWxvbk9CZ0pLV05relVTNE9lOVpkMDFSVXB5?=
 =?utf-8?B?L0YyWjlLMnJZZ0hEaERvYVdvZVZhalRZWXNXNEZWQjl1dEVWVnNoRWh3ZFF0?=
 =?utf-8?B?WThWUFFkRXJTdFpLOTBwWStoekpXUmZNcVBBWStDVk5xTlBQZE04a0ptYmd1?=
 =?utf-8?B?c2drMXZDSW1uWS95Q0FoVmo3cFE2bU1mcmhhQjBwdk1nVG53Q0F2VDVCRE9O?=
 =?utf-8?B?ZjFKMHBCQjdyVHMyQmx4cWVwekQvc1FRdlU5NjdCNlRoZmNTM3NJNi9BMmQz?=
 =?utf-8?B?TkpweHhHcmVpTjl2Ynd6YzFLcEM1QittcmREUmdNTXpOUndIYmUvUTc3aUs1?=
 =?utf-8?B?UmpsbDJpc3NUTmw4ZnAyakpBbVdoV1hYZ05Qc1lZUnpnMnBUS3FEczh3b1FZ?=
 =?utf-8?B?N1RBS0kxSE50QzVPamgrRkcwa3EzRjQ1Z2x6UjdmK29McWdSbnQ5OXFyVlFn?=
 =?utf-8?B?eGJsWjdCQm9GM1B5a3ZTUFNBR1NGNGxDNkpvbzlnUldKdzNwM3MzVHdXR3dI?=
 =?utf-8?B?TzYzdU16djlrMEw1cXdSb24rYUtFUHVnOW1PY0xMWis5RkU4bTl5V2JkWUxn?=
 =?utf-8?B?MWdzdk1qZVdEdVJUeWxZZDJzN0RHS0UrT1M3NzZsdHhHS2NNUDVrMTJJcHdX?=
 =?utf-8?B?VW9rc05lMEtHUWYwNlM5S2NWcVpVYTN1MTIvWFVCeG9uVHJRYkVOYm9yeFZx?=
 =?utf-8?B?b1djMlhGdEVJR2VxK3BzTVI4eExTVFRwSno4WGtEbENqN2VQUlVhVW5WamlF?=
 =?utf-8?B?Ni9xbFBTQ1BONngwU2d5YlNOS0ZzQlBWVEFpelRTeDNKR0EraEJ4d2tRbmFD?=
 =?utf-8?B?V2ZXWmxic0pGR2NWbC96U3pxUGFyNWtPa1ZkZjVFaXdTOUY4T21LZjJDSTZr?=
 =?utf-8?B?dStjR05PTDRTd2RLa25yNS8xNXBQdU1sTm9CSEZaNmRCenFvektpa1FUYkJt?=
 =?utf-8?B?dDBESE9hdC94SlE3aVRkTEVJUkRHOW5Hc3FOMHRoUk4zWnVGNXlpekEwY0RE?=
 =?utf-8?B?WTEyYjhpUS9FU1ZPMXI0clpaa21nT2tqZHlzZzQvNDBxNGVLUUlnRUxqYWEr?=
 =?utf-8?B?OW1qT091SE5SWFBKNUk5cmhUWS9YUUJTVExPaFhhMXhZeG9sMk5xMEh4N2pQ?=
 =?utf-8?B?emZURVRlMGdqVCtTSGluT0FPTTFrUXNZUjJ4MlJlL0krS3FhekNnbnhLVGtK?=
 =?utf-8?B?Q0prMHZUem9XOWljNGtHdElSR1BxNGZXZDRkeVVUUHNaRGpuS01XVUVzOGt6?=
 =?utf-8?B?OFNBK1dTUzRjOWUxWmU5YW40QWxGY09JbUNseU9yalFUeFZjNmpBdTFmTGJU?=
 =?utf-8?B?M0xaaXRRN2RMSTdFa2ZmR0toRklqWE1TT3JqSXo2VnpEaXp0bWkwZ0crNXFM?=
 =?utf-8?B?bU9KMEtNY2JmaXNkYjYvbEU2QWRzR2pOV0hUajN5WWFKU0FoUkpxc25wNzJO?=
 =?utf-8?B?NXFZV0VtR3c4VUFRNlV3SnA3QVRzN0FuNjhIOUNiMUtvNTc4RzcwTWZqaDZr?=
 =?utf-8?B?SThZUmpvZ1NsZExoeXFxd0cydUZ1eTlQK0ZUcE1wb2NkSG40MCs0K0JnMTZv?=
 =?utf-8?B?SWVlenVObkxNUFF0d3NwZDVFTG5ydDJCTjFXVlFYUlQxMzA1azk2T04wMzcz?=
 =?utf-8?B?NmNMZHE4WTUxemUyWWMzZ2NxeHpMUU5LRXFycXROeDlOUU1ZNkljR3VOejdt?=
 =?utf-8?B?S05sakgwNjBPRWVCQ200TUc0ZG5VSk5RVmpKdFR1L2Z3Q2hVRVBkeGRtSGN6?=
 =?utf-8?B?NnVnUHJpT2NrVzVLa2dnNzlYMnN5WWpmZWE1RTUyTmszVmI5UWlTK2V3Q0RQ?=
 =?utf-8?B?WUhEZWVESTNWV2JPMFJGbEdXaHNBNlNqRmgzaDh1a0w0b29EYVI3VDlNOG9h?=
 =?utf-8?B?VkozbURyNDJyTU1FUE56bVZwRVBncnk1UlIzTEZiakhVeEFYSTVpVTVzU2VM?=
 =?utf-8?B?NUZIRlVidm1RNVhpcVFlUzFxdHdnS0VKTGlJbjl4Rng5WDFpeWI4aDhrMGFx?=
 =?utf-8?B?eWRWYkJZWjNMUFFGNkhyRmtLajlFMHUzNkN3UlFZQ1FGQTcwMlliK1JoUVpj?=
 =?utf-8?B?eDU1MmxabnJlb1hYNGZhV0V1ekJRZndNa2VFSjB2c1hDMHBtbEdhTjQ0ejJs?=
 =?utf-8?Q?+viODQcrm1uryw9hIQAfIJzBi1d6W4VC4goGFGYZcJdFv?=
x-ms-exchange-antispam-messagedata-1: OSF0Qyra+tR92w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FEE364A57E5FA4FBF7808C949AB1253@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 340d0377-4f8e-43a2-9a8d-08debff85ef6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2026 16:10:59.8996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +y5fGeIr3Be46wAdxOfJ6Rjdc9BGUrybInTRqpzwFsMlsVIPOC5RQD317UQw/1LuDhnlkC9SQlIuPyghztbGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR12MB999190

T24gRnJpLCAyMDI2LTA1LTI5IGF0IDIwOjA5IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEFkZCB0aGUgRlNQIChGaXJtd2FyZSBTeXN0ZW0gUHJvY2Vzc29yKSBmYWxjb24gZW5naW5lIHR5
cGUgdGhhdCB3aWxsDQoNCkZZSSwgRlNQID0gRm91bmRhdGlvbiBTZWN1cml0eSBQcm9jZXNzb3IN
Cg==
