Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D1D329C6E
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 22:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765924170; cv=fail; b=rVEK11lrKdhxrCjATDCptcW3+QO/q0bpEdzI06nyzzJl9J3kmj2kcP9xZfwJXADnUb3x5KliX1qwAg8WniEQm6IQZqdxeyexSKvB4tADzaGORaASBz5I6xVjzLUBLFp3cvvC3i57mZ98peRfgyKW1tOB+SEUaJevwnaRUJyGgIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765924170; c=relaxed/simple;
	bh=U+RwRVPocHP5OqJONcn5yuSobOypeM2eRNWtOpGYnp4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DGTCJdETKAdKYphYJSz064JATMQ8v7zo/0RvgohBjv9RWTi97cnIVDzhsHf2+FAqh43cCwI8GkzO6S8cu29mtGD7uO8mc0lITpIhPnKUpfyjE+PGBcbYDyPKQQqUXtBRRmaLruUTreMxsmfME1hAds9Qf/hnbjOhDZzRTdoyEbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hKMCjrGs; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hKMCjrGs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vu3+S/VlbL2Ax/cNkfkPBIgaZnuFMYFUTLnjkY2HWBRhUKFWQozWi4x832Av6DSVqEujDpCEjX9EYvj4J8OwNAT9y9/rr3uSs0kQCjmui6/5/9g9fT7Z+n6OrTYQlxhOW/QWgIl3VjZ+VPkxeWGjRThpCA2shbfWjYhTL6Uypb3rqHc2c8zxqZFjhS4G87PAO5oUBAdjFNuZPEjupb8vEgZz2jYUJFc8SnntOkVbmmF8H7owKOZHDNkI7j4kboibAP6QTtZT5w297QQ+hz4iJz4Kj0+mf5wNFlgi8CssiM/0znBgbdEFbImD4lTQcgQCn+YMSg/tlLCrfUQ05unINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+RwRVPocHP5OqJONcn5yuSobOypeM2eRNWtOpGYnp4=;
 b=Gaqkn5tZp12dCF53/4OoFbrI9kXGx76axmNsp9g+5CtXpytbVER9cASQuQ5UVXxHZxiIvUpG5Mi8BaBvPbtn3mdawN2VJSBsl0hB83xJ+RW05YouT9KmmZKJjzz4THiYDRObgBkno2+FsZIzJn6FUFEWiVM8wVA8+pxMZGAGAfPtz1lsofoz+jgoQDHYEQjanEYteK7nPomlLFOmvXaK8fXb2kdvDmidbjsW4wWUW3tFm9JhUhM+vP0cC8kb+SaiGgrnRXm0toKRA7CGcIvx2szklY4dJmG6nYdfnKNpNX4RYDGu3Le0G2r8eJeJkZ09ooLZoiWz9Z1A4mFWrB5Dmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+RwRVPocHP5OqJONcn5yuSobOypeM2eRNWtOpGYnp4=;
 b=hKMCjrGs6vHDQyMI+yG2sP1++JS/5FHLeu/jHtBi0h2hGqJ2azh4wKwcJ7NYzrRj3ZneGYfpXtgHLuIaJAOkOzw2/hMpDCKPVLnr8bamFXkBq9rCNy1c9c59q7g1HVSdGRQ8277HkldNaowfFilHaB1VClGo4of6Uf4ZTc9exrMaYRTXaRMkAQjPOO8EX3sZMMxzjiSjLFoL7W0cjbLiFl3Zqpu6oYvCo28PD+6TGznrhAag8D+LR4bV5n5uFCfUMltHQnlpnjmUgcZNg8qdxL2zShuAFhbyooGyKgN0qQ/yOV9ag9qF8UpKltxtZaXAJloheV1WbkaS/+L9bTyzMQ==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by DS4PR12MB9772.namprd12.prod.outlook.com (2603:10b6:8:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 22:29:24 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 22:29:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
	"lyude@redhat.com" <lyude@redhat.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Topic: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Index:
 AQHca6j1wQX/qkHUuUaaDA2+kgrCnLUil+8AgABVRACAASItgIAArl4AgAAaI4CAAAenAA==
Date: Tue, 16 Dec 2025 22:29:23 +0000
Message-ID: <1dcf714d18d63e18afc13830e030209214bb2e7c.camel@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <20251212204952.3690244-4-ttabi@nvidia.com>
	 <20251215114036.302303e0.gary@garyguo.net>
	 <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
	 <a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com>
	 <bc1ff6c7c86487143de7afaaef78d8361f590c13.camel@nvidia.com>
	 <378b8542-86a4-4c8c-b1ec-070d1b2372d6@nvidia.com>
In-Reply-To: <378b8542-86a4-4c8c-b1ec-070d1b2372d6@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|DS4PR12MB9772:EE_
x-ms-office365-filtering-correlation-id: 5423a2d5-b455-4d8d-e8f5-08de3cf29066
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SU5tK3NLNU9HdG93WXdCdlpULysvNzVhZGVHTXB4cUpDRjRjZ2dNWlBQMkVj?=
 =?utf-8?B?d2lkQ3cyM2lrVGZzNUxMNUJiaXh4LzVKVm90OHFaOS9KWGtnMnJkN2g1OEI2?=
 =?utf-8?B?Zk9MREw0UkMzYk5LaVgxcTNYcGNyaUt0WFJTVFhsTTg3bEFQSUFCTktncjRR?=
 =?utf-8?B?MDZ6RWJ1S2dKZ0oyVWI4UXpaVkF0cHFMOUtEL0FSaXhMbStyZUp6ZlpPam5G?=
 =?utf-8?B?eThxNWg5ZzVDZ0VSR3VLenUvTEpoaHhCZlNyMlVIY2Z2OHQ5dmdsUm04R25r?=
 =?utf-8?B?dmdzNk92cDJqM0pRbTBkUUVlSG51S0ZjUnpIV25IdklOTjE3blQ5TnFKcVF5?=
 =?utf-8?B?SVB4Y3pzR1oyNnBQRE4xL3ZiNS9yWC9OYXNRTG4zRC9jRWsyYVRyVmtacDVB?=
 =?utf-8?B?Yk5neFl0cVNhNmtJaGplZ09yTzFKV3paYUZUNFdVTUhTMzBRcmxGcG1mdE8v?=
 =?utf-8?B?QWQvejJSWGJCaHpwRWZSSnpoc1A2UEptQm1WVGhoRHpxRmVWd1Q0TTRGMDVt?=
 =?utf-8?B?ZUpFYytqNWE4ZmJZODJ6cjFLWWUyMzhobGRSU3dTWFVqVnJhUkdHUFlILzRh?=
 =?utf-8?B?NDJtbjFUWTdnRjNPd1lPVXhVTFZUUDZ0b1hwSkFnSFRNbU9LSytrT3ozT1JZ?=
 =?utf-8?B?UkZWTlpZZHRxSGQ1dm5oNzJRWmcxL0dvWjQvakhsSTNTcWkrQ1hjTk9xWk9K?=
 =?utf-8?B?eExUM2htNThvbzZNaEdQTXhVS2lTd0h6NS9acXlabFpkbkp0T2FUeVVyUWdY?=
 =?utf-8?B?eWtNdXRoNEhIeWlhNjlDRDM4aGhHVEtWN1FEQmRHdUMyQjB4RjU3eFRMZ1JH?=
 =?utf-8?B?QWFGNloyM2RWOTFKTFRNMmlsS2EyTmliK3BvdFNIZW1zMFJPVXdabEUzaXhu?=
 =?utf-8?B?VDA1ZjZzVDVVdXVVVU5vc2ROL3RWdzNwYWFhdGRRaXVlN2FRMmFuM3F0VzJI?=
 =?utf-8?B?RWhyemNyOGxodVA2ZkRtM2hQNkpRc1piRGtSdnAzZVVDdGtSNXVPdXI4NCtW?=
 =?utf-8?B?ZndCUXF4M0RMYm9FdHdOTyt0MXJsRlVFM250WUl4blN1OXJyMXJ1S3U5dlRX?=
 =?utf-8?B?dXN6MlUwUW5aNjQvVnE5YXZKS2xTK3V2T0hnd0xydExJNUFBSGZNTmY2Q3M4?=
 =?utf-8?B?RnpOL09HWS9nMTEyNmpwZmN5NkZ6dDJLYURmV2FhZGpXOUlRUDZFMXJNNVA3?=
 =?utf-8?B?VHVCdVZlT3NTenpJME1qNE1reW5sc3BqTGlTQU1laUs1VEFGdmRYNU1IMmZ6?=
 =?utf-8?B?NlZJa2gyWE9tNUZYcSsvT1BCUkx3cnlqeHNEcGM4YTRKTDRGNHdIVTZycEkz?=
 =?utf-8?B?MkcvV3pWREtOVk54NkdRSDY3UDAwY21UYjFJZVIyUDhiQStmM1I5dExmSGQv?=
 =?utf-8?B?RTdTcFhmUHVoR1JDZ0kyditVdk9qZDFQTjd0TXowOXAyOVVWSEFmYmpyMC9H?=
 =?utf-8?B?Rlo0OU9GNHpmV255aUhVZ1cwWGs1L090dWhEb0k5SXdQL2NSSGxzZDR2eDUr?=
 =?utf-8?B?UEc4czNpaENJTjFmUnBHNWhBa2crMVJ1RFZYSE44NzFGQ1FrTk1BT3JibUdn?=
 =?utf-8?B?Y3BMaHprc0kwZlkrSmM3S1dyZ1B0T3B4MklmQ0lQQ2VOa0Rwak85c3NsYmJy?=
 =?utf-8?B?cTNzWk1KTnhjTUFMTlJreFFYWDc0a1hFQlgrNTMyL0tNbmRiSU5rWlE3S1NQ?=
 =?utf-8?B?SG8ybXpmc051RHArM2dRTnZadXc3ekZ0bkdJZ2hrQVkwMUwwQ1lMcWw2V1BY?=
 =?utf-8?B?cENRMHdGNXA5VE84YTdmaGdCWklwcmNobURvUFNYTU9IMTZqUXRaSEg1b3pj?=
 =?utf-8?B?MWlTUzdpYmh5ZnJVazdveXZ1NjZlUEphSHZsaCt0bGpUSmZUbEpSWlI5cHFF?=
 =?utf-8?B?VXZFeVo2bVpwSHQ3cStTQUwrVGhteTlnYTJBZ1ZLeUNaUFR5ZlVhU0hjZTlU?=
 =?utf-8?B?UVlWcnc3VGpzRXRaN2tXWWZGNjUxRHgxYXBDZFBGYjZYMnJjejU0blBsOUtq?=
 =?utf-8?B?NmdHd3pvTjRCSlpvdlkyYTNLSVFVbTEzeXhLY0JqVk5wbkUyTFlXbnYyV3Ex?=
 =?utf-8?Q?PypJxm?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7937.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TnY0ZG9Wanl3V2s2SmF0V3RlT3ZJS1ZpZXZsQmV1UkZrVGU0N2xwdHpKZnVB?=
 =?utf-8?B?bmpPc3hPK20yTkY2dm1BV0VqeUNFZ25Jd0Y1dUtoaXNKcEJ3Vk51dnhNL0NF?=
 =?utf-8?B?RU1OeHlyMXIzejFrMWZwQVdqeXhHMEpnWEEyTlZPZjdCNUYweldWNDFYN0F3?=
 =?utf-8?B?NS9xMzcvSXIxN1FGbUppOUtzOUNRMGxZNFdjQlFjYmVJVTdOM3M0REs1Yy9D?=
 =?utf-8?B?MEFvaU9XYytvdHBYV3F0WVI0N24wVFJQNG9DTGtDKzhIbnBEcFcyZHFrVDd6?=
 =?utf-8?B?MGEyRFVLTk1ZOTNrSjZ2SEE0cmJ0V0VyQlI4WVdlS0U5d1N4cDRwUm0zVTJ6?=
 =?utf-8?B?M20rZFU2SnNPODV3UEJ2NTFJRkYrZkE1a3p3aU9pY1ExZndtTnY0ekxMdlBx?=
 =?utf-8?B?cWx6T1JseFMvd2UxZHpramtJR2Y0N1hHS0JDTXRnV2lxNDFVSWM2dGgzRERI?=
 =?utf-8?B?T0VWaGpob3FVMVBIcTVWZ1pKenJWaGpnUEhaeGVrazdBSUczekM0OG1BL0ZQ?=
 =?utf-8?B?M0hHZkVCV0JqWi9YdlE2ZnowcUYveHllL2FtR3czR0QrUFdzWW1GdFN1THRp?=
 =?utf-8?B?Q09OOFpFNDhFbUg1Ui9Td2d4V0cyeVRKWkhlM0lpQmhtSnp0S2s0MzJuVU5V?=
 =?utf-8?B?Q3g4YUh3U0ZUMFYvS0FhU3JoWUNNZnJSaGVnWmpDeFk2TW9HWko1cWRaRVhl?=
 =?utf-8?B?WGNqT21RU0dhc2pSRHFTSi9IcktkaGlKSGNzMkVrSkJSQnJGZm9XV1NJcnJG?=
 =?utf-8?B?Y3I2YlNaUkVpbFgyYzlSeG9kcitCaW15eW1sTFRBMlFtNzBNT2ZkbWVtRGFX?=
 =?utf-8?B?dktGcTBVbitVN08xZ1E4bHJDSEVuUDIxRG5ESFZNRTFkbGxmMzBRV3BpMUNF?=
 =?utf-8?B?NTNwQzA3RXFoaUYzZWZtdmdyQ1RCeTdtQ2ZBOHBtZlVXVlpDeGpVdFJtSWkr?=
 =?utf-8?B?NUF1Nk15Y1NlU1ZabXd1MjdQeDdVQldoODZaTmVaN0FaaDZrRmVRRmFhNnhr?=
 =?utf-8?B?c1NNV29VUEY4T0hLb1U5MFJSaFdXeHFZZE5DNlZCeXE3MXZMRUtUZ2M1Q2VT?=
 =?utf-8?B?OWRTOWEyT3pPWWhvMmE0bzZjQzBIM0h6em1NemlscDRjVE5iUmFsTzRFYWhT?=
 =?utf-8?B?dnYwVndpYlkxTmp4MkZxS2I1djRGSVpPZGliQjh1RWxPSTVFQXN2cFRoOGZC?=
 =?utf-8?B?YVJSUjh1ZHZPQ1Z6Q0ZUZ2ZiRFZnSFpWb05DVU8rcGZNeERRZlJBaUxickV0?=
 =?utf-8?B?TXU2clkvK2tWRVJKRVVUc3p6SjVaVE5vdmRBa1pYWFRjRUpNUGhGeEh6bzFP?=
 =?utf-8?B?SHA0Z2swM0U5OWkvYmdQWHptK2ZRKzIxV0x4NWxTQkdBNkUvOTRMdEQwVzht?=
 =?utf-8?B?ODlrWGhDOUI1M2E2LzNlazRBenhqZVVuZTdjMzVxU0lIUTVVbHZGYWxqd2hy?=
 =?utf-8?B?dWFabWFwMlI0NFRSRW5LMThPUUtIaTdLd3FVNytDVnJRbW9rRTZLOXVyWWlk?=
 =?utf-8?B?SDNYMVBRd1BSVnU3T1V3SlJWK1c1Q2pIZDF0SlRXT0JsczZ5UnMrYVJYempI?=
 =?utf-8?B?d3d0ZCtvUS9Vd09wY1FxRW9LTDRDazNsS1ZjcENSVE1SR1QveUxXNmVlMXNz?=
 =?utf-8?B?SWtYRTlDK3UwaXh3NGdySWxETENEUS9iMURqdkhhbzZ6ekJPb1h2RjBvRjNE?=
 =?utf-8?B?enlwWlJ3VnFlcDhjdnk2U0JYSFNWL0pSVU56RDFIVlU0K1Foc05PNjlkdTQx?=
 =?utf-8?B?dXNsejY1Y01EajB6WDQzdzJZTXdUL0NuMURUVnFvZFAvVDc1eGFFcDlHeVlJ?=
 =?utf-8?B?Y2RqMkNmZHBxTlRYN3pwMHlCUHpvWjJDQzdHVjJtMDYrOHZzWlY0QWN4Y0hU?=
 =?utf-8?B?d3ZxU3FFVGFOaCtqSVBydW5hdnFrbzluWU03alRjQnJac3doQ3F6YzFMZS9u?=
 =?utf-8?B?V1I0Ry9TY24xY0lWclRRbHg1dmZBYmJKYjlvYmVWM1daOTlPQW44R0hEUDlz?=
 =?utf-8?B?alU4YWllTkhrRFZCc2E0WTBGN1k1eDRuV09EOE5CZ2pJK1BVWGN4WHRDWk9m?=
 =?utf-8?B?b2JrckF2UGs2NUtYNGsrQXozekpSMkVjb1VHaEJkejkvbEkxUjN4OXBLcHRl?=
 =?utf-8?Q?zW/Sw3ULBcXFqu2M/Y7CqpXKN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17CBE6DA1E63994FB1C6EA38E3D7AC0B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5423a2d5-b455-4d8d-e8f5-08de3cf29066
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 22:29:23.5144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 817c6W9Z3sGlsuufJKouiauvXvGQOsaUz3UMG8qqSdRB9CJwFqFbFr9NY85VNYDEj8m4cf7EVnxqRTzZF5C7qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9772

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE3OjAxIC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gQ291bGQgdGhlIGRlYnVnZnMgUnVzdCBhYnN0cmFjdGlvbiBhZGQgYSBkaXJlY3RvcnkgbG9v
a3VwIGZ1bmN0aW9uDQo+IGBEaXI6Omxvb2t1cChuYW1lKWAgbWV0aG9kIGFuZCBhbGxvdyBjcmVh
dGluZyBzdWIgZGlyZWN0b3JpZXMgdW5kZXIgYSBrbm93bg0KPiBwYXRoPw0KDQpBY3R1YWxseSwg
dGhhdCdzIGFuIGV4Y2VsbGVudCBpZGVhLg0KDQo+ICBUaGlzIHdvdWxkIGxldCBgcHJvYmUoKWAg
ZmluZCB0aGUgbW9kdWxlLWNyZWF0ZWQgcm9vdCBkaXJlY3Rvcnkgd2l0aG91dA0KPiBuZWVkaW5n
IGdsb2JhbCBzdGF0ZSByaWdodD8gVGhlbiBzdG9yZSByZWZlcmVuY2VzIHRvIHRoaXMgb24gYSBw
ZXItR1BVIGJhc2lzDQo+IHRoYXQgdGhlIEdTUCBjb2RlIGNhbiBhY2Nlc3MuwqANCg0KWWVzLCB0
aGF0IHdvdWxkIHdvcmsuICBJIHdpbGwgdHJ5IHRvIGltcGxlbWVudCB0aGlzLCBidXQgSSBzdXNw
ZWN0IEkgd2lsbCBuZWVkIGhlbHAuDQoNCj4gQWx0ZXJuYXRpdmVseSwgdGhlIGZpcnN0IHByb2Jl
IGNhbiBjcmVhdGUgdGhlIHJvb3QNCj4gZGlyZWN0b3J5LCBhbmQgc3Vic2VxdWVudCBwcm9iZXMg
cmV1c2UgaXQgd2l0aG91dCByZXF1aXJpbmcgbW9kdWxlLWxldmVsIHJvb3QuDQoNCkhvdyB3b3Vs
ZCB0aGUgc2Vjb25kIHByb2JlIGtub3cgdGhhdCBpdCdzIG5vdCB0aGUgZmlyc3QsIGFuZCB3aGVy
ZSB3b3VsZCBpdCBsb29rIHVwIHRoZSByb290IERpcj8NCg==
