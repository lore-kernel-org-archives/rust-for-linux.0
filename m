Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50C627380A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 00:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768955124; cv=fail; b=lIEjYvlXAR23M4k/kpBazWc/m/D2GdkVPwZWtWinAOBJ8MhsnV5ELELhFWVIhOz3QsMaWAOpFk68DMywHysAVnEx4Lwn0T9Su/KTOGbVKL0ybk8JGYSfFVnCM5QLAcnFiA3dGskkGSJBLMrhheFOowaZr5v7S6R3Z5T5CXAR7GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768955124; c=relaxed/simple;
	bh=gntn2ppzK3abVpnY/qeWkGcWW8hv6DJ/pff/qa4elqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IhbPm3lg0cJPigZR/KP6wAn3qH87iq5GlsuoYxu9/OCQKHw0yQvoioSwb+iPVe59MdLAqU9W1Mgtva679Xfeqf+LngCkHgAhM4jE6YwyiwCRABhfH/9u4Rvi+qPfzdUaVSuEc5+j53pD+CadJv7tVSK8S16+bdXMRg8XLTyQd+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=msB/4yN1; arc=fail smtp.client-ip=52.101.46.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="msB/4yN1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUtyKPjfqc5+SKdgH9TkFUiLWtaoblHBQlKKaRc5L+gHhqPEEGSfnB9oiXkfnJrujCP9RjAfe6E07dibOBvaOoNEI0uMxQV1B6L5UI+RD3BUW1oADA3YEPVNrQEA1wdSaf36qmmxlxTFjbxTjl8D7yCg6uLcBGYRPvZMGcJYnZxWsXO9ZBZBG4lP8hSqKcxl+9pLz4k8z640n9nGfcCzmVUc7isBRi8QoIrVartjlYGgJvK7HthAW8Rk7nLer1oyTu0ANnD9/L1q9sxqYJOvuJff1m+u63u72LWZd0h46mn6/EiK7RJFlIYsnDqqxALjBsFp3XLQ1jZJksMpdRkE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gntn2ppzK3abVpnY/qeWkGcWW8hv6DJ/pff/qa4elqs=;
 b=gIEeLvU5pn1emjujpF5HD8V5kgWRhDm51XP6dUpG9IRt+RdccU6Th2Qf98I1uPjdVB070tmpeMkzNM2L+Az4TG9g/gqrLA5yFwdwWgOMfD1+2ceYGBAqmnD0Uyy+IM7PraAv2sW+94vHzeda4zPasDV4ilDYrI9tT+RB3uu7v0IL8EaxtfqPUw3hDrgaFfXXm0USouF7Be73bt+nMnqWFuVqTcTUHxNDHLQiaGYPiHMx8yvO7FvekjR2BzQKkW1ZM2OWS2GLGRZTNeFmONxnREb8htAKpPZ2bqd7tZM4Vk+KClRm+UxcCg/yAPKJXnjpb+MgnxfZkwpXbaOf9A1tYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gntn2ppzK3abVpnY/qeWkGcWW8hv6DJ/pff/qa4elqs=;
 b=msB/4yN1KkS40YajGYMMlIgEF6zosmtT8P2p8Hgc53rOrxNF8Z3PchyMuxD7al88V8geT+AfBGyRQ7MCUYuMwRsbw/jx6rbA2hSMe8MssTKMkcRSIL6r/HyMjENFMBJCkH2D/qZ4gE3Whk1QxTIXt6YzSj1b3Vcu5bA1B1EnlI+PkL81jUbMDQTkmVOOnhEMImOuf+iK3VUfJ+gqUFsM8HaQL1gY2Ip2RRNAGTz/pS911EdeuVlQkXXAnSSrtLZpBZIne9TB7jNfB8BfsdXpo5APlNLUh6K0A6IfBN3yjj8bAJJwPwfRZi4Ca/upBxHxlbp4NaMNuY6RcRYe9zyc6w==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by IA1PR12MB9497.namprd12.prod.outlook.com (2603:10b6:208:593::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 00:25:10 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%3]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 00:25:10 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John
 Hubbard <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v6 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v6 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHchYxMP7m+aGiN/kKlmTl4t+ZfdLVVTIuAgAaBJoA=
Date: Wed, 21 Jan 2026 00:25:10 +0000
Message-ID: <18ef8515a5cb46f4a2f2f4604502609247511beb.camel@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
	 <20260114192950.1143002-12-ttabi@nvidia.com>
	 <DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org>
In-Reply-To: <DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|IA1PR12MB9497:EE_
x-ms-office365-filtering-correlation-id: fac0bd17-c8e1-4ff0-3264-08de58838952
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXNqUE5ZUU51YkhqS1lkbTlTMi85OFowR0ZnbVp1clpxc2JacjlzenNvZlZ6?=
 =?utf-8?B?U051amgxQ015UXUwNHZXdjJDZjN0ZlQ5ZVFjWWZXalAwbldSZ1hFUmRuNEt1?=
 =?utf-8?B?cUpqT0EvMTZyam5Sekx4VE5Gd052WWx3a1lRUGZzWGorVlk2SGZtOHkwc2Js?=
 =?utf-8?B?ZXA3ckZ1M0RZVld0MVlIb0lUL2dtazZlanRHeDQzcElIVFpQWXVUbUdGZVZD?=
 =?utf-8?B?bDZidkdBWS9zanl5VUl6aXQydzA0Mm9sM3FrSG5BR2Z0WFdKakxWenJScm02?=
 =?utf-8?B?OGpyLzRBSzZrWXJ3dHVYR1laQ2llc1RieEw1RkJKSy9SQldjZEhrek1sMUJC?=
 =?utf-8?B?aE9hU0tJek5TM0VYcC8wMmhacWNMTjFnbnViV2k4TS8vb2pBZm9VMFVGWVhz?=
 =?utf-8?B?OTRueDNNVlRWeGZNOXViblcvMDc3OEsrblVSVnoxSVFMVDBMVXcvL292eGJ0?=
 =?utf-8?B?aDN2SlFpN25BTFlBY3htaStJWVE5dUlwWWwyYjNrL0duZW52d3pmODQ1R1pJ?=
 =?utf-8?B?VHJKd2V4dm4zTEVENkl6ZXpPRGNjVkFIbU42QzZMNDliRVEwRysyVk5aU0ps?=
 =?utf-8?B?N2Z6TGtHcjlkVWdmdGxpd2Q4ZXNQZW9zN3ZNUzRJQXhDQ2pCUHc5YkYyc0NG?=
 =?utf-8?B?bXVvZ083cnJ0dkNFclpLUFkweVd1MlFGcnRzUjMvZ1VVenZpQWJHVmswMTJx?=
 =?utf-8?B?MlZndWlnbSt2YjZ1bXc0c1B3UFIwZGFiUmw2QlZNVUJ2Q3RyUjJ4REE0RW5F?=
 =?utf-8?B?aytyeEdhWHFMQjRjN2lQQkZ1L3pOUlBxd3NBRHZUc3ZDSVNpQ0tudk9pU3oy?=
 =?utf-8?B?eEloMTVHMzVESlEvV05yeTFTUU52WlJvdDluL3NueWhUaUJiNC9GTkxIdXkw?=
 =?utf-8?B?clJUWkd2U3Y4TTU0ZUg4bnViQ1BKempIUm1lRTN3T3RIa0NBY3F2WTdJTzZx?=
 =?utf-8?B?QTVpbktpSk9mSkNVQ2IvOGt4UG1qYVRjOTZMSmdlZjNNaEw0VmxIa0thV1c2?=
 =?utf-8?B?VEJxK0hXWkcrZDdXb0JDUFJBVEpWbURyYjJkcjRIRVcvQkhhM0VJUjNaV1Br?=
 =?utf-8?B?a0NKMXFueis0N1ZMSVNNeDRZTi9YSnFZWkxBSGV3aWJ4M2dQMTF1VXk1ejE1?=
 =?utf-8?B?eXovRVl4Z3hlMTFaL1VMR3ZEc3VkMDNDZFlleDN0TVhoRTN6TC9vQjJINmQz?=
 =?utf-8?B?NkdDcnVYQnRCMmg1T3ppeW5Yc0REMkM0R3JPbVlnWGRpL0lIRncvbGVYY1Fj?=
 =?utf-8?B?dXgwQXNTMW54N3Ivc2QzekhvT0Q0b0tuUDE4MUdZMzdsUTEra21uTlBsWnRV?=
 =?utf-8?B?S0lFSFc1d3hteE13cXRVQ3I2eXZPTnEzRFdiMWIvN25NTHpheWZjaUZ4OHZn?=
 =?utf-8?B?SFRhTFQ0d2dLeDd1SlVtNnpQQVJ2cjRnNkZCbTlvMXpOZHp2dnJyT1Q2RXRF?=
 =?utf-8?B?NmtXTnJYWnlxRG45T0V3clVJOGxDazdwdU84Y2ZzYzVkR01Jb2lFbU9mdUV5?=
 =?utf-8?B?c0tFZXJSR3d4cWhPTDMwOGQwUXpFak5WMUwydXJHZkRtZzBUT0JvYWRXdDlZ?=
 =?utf-8?B?WEkyeXZLZlVZTy9zV0w2VU01eUlTY0lrdDhsVExuVG9TMVFpVE1HVndYbG5Q?=
 =?utf-8?B?c0htSmZjN0xVUG92YURMaTlIUXU5OTltQ0dsaWRVSmZoOXc1QTNCVFlHVXZH?=
 =?utf-8?B?Z0VCT0hDa2tNVEdGUnlOTlowSWNuRnBTQjIvb2hVdGJiRkZVZkwxYTJCVCtj?=
 =?utf-8?B?cWJVbDlRWkQzbmcwOUdWTWxlVi9sSXlVeW40cHFZNzgzeVJvSDViK1NyaTZu?=
 =?utf-8?B?MjlaWFlYanRvNXZzbW10SEo2RXJQMG9xVGZhaElxZlhGOVgycU9ESFIxRXVa?=
 =?utf-8?B?M2ZyUE4rK1F4UEZLTVFGaDJEZXhlV1NMUVF2bGJOWWNBTFExYkRTL3k5ZXJS?=
 =?utf-8?B?RFVjRm54bStGWUo5azJsbzZqT3BtWTlnV1FFakRCRE5yRVRaNWZyQzZoK0sy?=
 =?utf-8?B?OXhBaHE4Vmd1MHFpRndHdjJTZU0wR25XSzZwSXYvQTNOdmlNMGtSZyszQTBn?=
 =?utf-8?B?eEJJS0lTRnZmNDM0c0NDeDNrcFpMbVV0OUhUeDVVOWtCSi9sTERieXF3Mm5u?=
 =?utf-8?B?a1ErR3BWNmd6U3dGR0FZREs5RStSc24vK1RQbFVwRy9KYTZpUzdJWGYya0ZW?=
 =?utf-8?Q?8MWzjNJsmAMHGIJ8CphNXzI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXA2dTVDMTZUd2lOWmpSbDZGUE45b3BIejNxSkRIUGhQVTV4YlNtTFBWQXMz?=
 =?utf-8?B?SERjbk5mRzZjRjk2ZFRLdHArbjl3UEgwWThDRjVGem03eGZZU0NQSWVPT2h0?=
 =?utf-8?B?UHZXSWx4eGRDSlpLcG5kaWIrM0NPeGRqRUoyVWlrYlZGS2pFMVlKS0FzWTN0?=
 =?utf-8?B?R3RrSk4zTnVwU2V3YXVRVnd0QmtOQXBOYzI4USswaW16TVBuRUwzQTFiVkxQ?=
 =?utf-8?B?M3JMSkxjeUgyZnlobEI2R0pUTXM3MnhVQWRxcS9udlRuN0oyWnZSZjJmUHpC?=
 =?utf-8?B?NGtTRnA3VXAzVzhnRlIxQ1VkemZkbWs4Mk5wMHErdUN6Vm5zM3lraFY4WWkw?=
 =?utf-8?B?Vk5yeFpFRjF2eENHWXlPN1psRWRBZ1pOUHpHYWMxT2NIUFZuWU5iU2lUU1RG?=
 =?utf-8?B?cWtiMVVxSlI2eklwZHpmRDhNT2xhLzZVblpuNzJHWHpOZHhWd0xwYjZ3cUFw?=
 =?utf-8?B?MjFYSjlBdHFWVW5LZDVldzJzdm5uRDJqU0N4Zzc4Sk5WTjFZdXlXWTdrRzdC?=
 =?utf-8?B?QmI1WUp1bU51L3RvNWlTdkJnY2xxQkJuUVBsYzhMUkZhREtrcFo5RTkwWFFT?=
 =?utf-8?B?aUR1eXlYV3JZbFZWZ1hzNlVBcktqci9ySmV3TjJ4ajFJUVQwVk5rQ1RPMFNm?=
 =?utf-8?B?b2kxZzJhRmR5YWhrTE9tUGsrZkMrNENJNVlGYXFLTmFuS2pGVVRJbnBKeGxI?=
 =?utf-8?B?enBWd1cyempBcDZYU3hETTJpbFJkQ3ZCajdmRHJHSEhxeVJWUG1sN1JKbkgr?=
 =?utf-8?B?aTBPa3k1RmRHMS9OU05EM3lkN1FCbEd1TGVmNUV1OWwwSXlhdW1XWTE2UmVv?=
 =?utf-8?B?OU4xWVBxbmM2TUpJUXV6U2JydmFuQTkrbk1HdUFFZnpUaDBUMElpSFJqSm9R?=
 =?utf-8?B?M1JGR2k0YlI5Z2d0c04wbzNocklIMXJ2WENabCttU2toelpBWmdBenIrTGs4?=
 =?utf-8?B?L00yeFJxdDFRRXpOUCs1QWNmZUJjRVFiWE80UVBGb2xJNFdjNGpNQUJpQ2NI?=
 =?utf-8?B?M2xoc2FHQ0RZbkxPSjFDTUR6Q0JDL3NESUY0aUgrVGVVWHRxR3ZPbWk1dnRp?=
 =?utf-8?B?YldGeFR2RzJEQVd2akdvMEgyY2hQWVpnczZRR0M4UE1veXdRZ0drbXlHcDZm?=
 =?utf-8?B?TCtJY25Ob25GNmsvZEltUU1BcmowSFN5OGVZaERiVnFGbytjNFZvWWRTdExF?=
 =?utf-8?B?cWNmT09ObEx4S3MxdWsrQlY0b0NUdXNDZ2E2MmtQeHVCVjVQeDRsenJRZFJs?=
 =?utf-8?B?UmQvWkZHUllQZXZzVE80TG9aR2JaVEgvZ0RIS2FabzZwWnNFam4zQi9McFVi?=
 =?utf-8?B?M3RTRHQvREtjaG92ODZSa05kNjBnZWtnRU5mcGZUbzFONTQyeU5vaXpaL0Ju?=
 =?utf-8?B?K285aDdnY2dzbE0xWWlzSyt6bjYwYXc5SjBRK2pmaTdkOHRqZ05CcWdKMjNm?=
 =?utf-8?B?ZDZQNzZYdHc1NFMxQlhMemw2RmRaTmw0MDJjTkZteTAydlppclUxUzlBN1pz?=
 =?utf-8?B?dlBkazFtYkJ3WS9HT29rMkRCU3R3ZkhNZ09mU3loQnlkSUpPbVdzc0k1ai82?=
 =?utf-8?B?bnRhTHRla2J3ekx5QWdPbS9wK1hQKyswN0lzeVg4dTNtVU8zcU5UZWN3QVo0?=
 =?utf-8?B?ZGVscklMKzFiM0U5YVQ4RnAraFFTOGNMdkdqNXJGYjdOOFZ1YjBWcmxnb2dp?=
 =?utf-8?B?YStuTk05SEhEaGVyeWlSMHZFbU9vckxtdEJ4L0xzeEVzVnhGNHdaNERrVTdG?=
 =?utf-8?B?V3A1Nkl2WW9hK3JLaktIeFJ5OVN6eXFjTk5valBGNG1WSm9UMk5UaGpEMFhm?=
 =?utf-8?B?b05KcGRkT01pSUpHY0wzclU4TEVtZ01Vc0FrUmU0NlA1emVDUjk5S0pGMEUz?=
 =?utf-8?B?UCthcmNHU2RoQXUwZ2FPUWR2VlNUR3BoUGdGZ3AvVWxacm5sOXFSR3NEcUk3?=
 =?utf-8?B?WkJyNkVETkV6M3RORzhpZFQ0TVYvb1ZKY0phQW1hUms3V2dRa3d6NTRGWDdJ?=
 =?utf-8?B?c2RjWTVwMkxORjdrTmlVZGMzeDd3UkdINlhHeEFGak5PMCtHakJacWxZVEY4?=
 =?utf-8?B?bTgxc3ROV3ZrdGVwM3lpZ0Z1K29OWjJhSjRPTi8zUVlLMUFMazZYbnN2bkF0?=
 =?utf-8?B?WHE3Y0s2RHpOWER6UWx4VnpTVHJnanRlMFh6TFRQZ3BsUC9sazVtUU53Y2Ir?=
 =?utf-8?B?M2F2eVZyMnJDTEF3aVFJZCsrU0Z4bW5PSkpYQ3dxcEdRUlIyOGViVmNZUmtP?=
 =?utf-8?B?dk9oMUsxUGpsem5aVDZHbU5xRGFhbFBjNnRLL29BUitrMHVjMXJJZE9nWkk5?=
 =?utf-8?B?SDR2OWVJODVwNmZ5R2M5ZW1kMGM3TTJvcEtTRGZhaUtFeGZkK01Cdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3157E2A5825D3499ABD706717482DBE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fac0bd17-c8e1-4ff0-3264-08de58838952
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 00:25:10.0775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BnW+/wuDRJwu//o4VI1PiYYdfU6H2Bhx25P1QG9kLzAAOOCKmY6TxXM+U/1GWDti2O2kTtAXm/UfNZMx7CnHfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9497

T24gRnJpLCAyMDI2LTAxLTE2IGF0IDIyOjA1ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICvCoMKgwqAgZm4gcGlvX3dyX2J5dGVzKA0KPiA+ICvCoMKgwqDCoMKgwqDCoCAmc2Vs
ZiwNCj4gPiArwqDCoMKgwqDCoMKgwqAgYmFyOiAmQmFyMCwNCj4gPiArwqDCoMKgwqDCoMKgwqAg
aW1nOiAmW3U4XSwNCj4gPiArwqDCoMKgwqDCoMKgwqAgbWVtX2Jhc2U6IHUxNiwNCj4gPiArwqDC
oMKgwqDCoMKgwqAgdGFyZ2V0X21lbTogRmFsY29uTWVtLA0KPiA+ICvCoMKgwqDCoMKgwqDCoCBw
b3J0OiB1OCwNCj4gDQo+IFRoaXMgbG9va3MgbGlrZSB3ZSBzaG91bGQgdXNlIHRoZSBCb3VuZGVk
IHR5cGUgaW5zdGVhZC4NCg0KSSB3b3VsZCByYXRoZXIganVzdCBoYXJkLWNvZGUgdGhlIHBvcnQg
dG8gMCBzaW5jZSB0aGF0J3MgdGhlIG9ubHkgdmFsdWUgd2UgZXZlciB1c2UsIGFuZCB3ZSBhbHdh
eXMNCnBhc3MgaXQgYXMgYSBjb25zdGFudCBhbnl3YXkuICBUaGlzIGxvb2tzIHNpbGx5IHRvIG1l
Og0KDQogIHNlbGYucGlvX3dyX2J5dGVzKGJhciwgZGF0YSwgZHN0X3N0YXJ0LCBGYWxjb25NZW06
OkltZW1Ob25TZWN1cmUsIEJvdW5kZWQ6Ojx1OCwgMj46Om5ldzo6PDA+KCksDQp0YWcpPzsNCg0K
PiAJZm9yIChuLCBibG9jaykgaW4gaW1nLmNodW5rcygyNTYpLml0ZXIoKS5lbnVtZXJhdGUoKSB7
DQo+IAnCoMKgwqAgcmVnczo6TlZfUEZBTENPTl9GQUxDT05fSU1FTVQ6OmRlZmF1bHQoKQ0KPiAJ
wqDCoMKgwqDCoMKgwqAgLnNldF90YWcodGFnICsgbikNCj4gCcKgwqDCoMKgwqDCoMKgIC53cml0
ZShiYXIsICZFOjpJRCwgcG9ydCk7DQo+IAl9DQo+IA0KPiBUaGlzIHdheSB5b3UgZG9uJ3QgbmVl
ZCB0aGUgbXV0YWJsZSBzaGFkb3cgb2YgdGFnLiBCZXNpZGVzIHRoYXQsIGhvdyBkbyB3ZSBrbm93
DQo+IHRoaXMgZG9lc24ndCBvdmVyZmxvdz8gRG9uJ3Qgd2UgbmVlZCBhIGNoZWNrZWRfYWRkKCk/
DQoNCk9rLg0KDQo+ID4gK8KgwqDCoCBmbiBwaW9fd3I8RjogRmFsY29uRmlybXdhcmU8VGFyZ2V0
ID0gRT4+KA0KPiA+ICvCoMKgwqDCoMKgwqDCoCAmc2VsZiwNCj4gPiArwqDCoMKgwqDCoMKgwqAg
YmFyOiAmQmFyMCwNCj4gPiArwqDCoMKgwqDCoMKgwqAgZnc6ICZGLA0KPiA+ICvCoMKgwqDCoMKg
wqDCoCB0YXJnZXRfbWVtOiBGYWxjb25NZW0sDQo+ID4gK8KgwqDCoMKgwqDCoMKgIGxvYWRfb2Zm
c2V0czogJkZhbGNvbkxvYWRUYXJnZXQsDQo+ID4gK8KgwqDCoMKgwqDCoMKgIHBvcnQ6IHU4LA0K
PiA+ICvCoMKgwqDCoMKgwqDCoCB0YWc6IHUxNiwNCj4gPiArwqDCoMKgICkgLT4gUmVzdWx0IHsN
Cj4gPiArwqDCoMKgwqDCoMKgwqAgbGV0IHN0YXJ0ID0gdXNpemU6OmZyb21fc2FmZV9jYXN0KGxv
YWRfb2Zmc2V0cy5zcmNfc3RhcnQpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoCBsZXQgbGVuID0gdXNp
emU6OmZyb21fc2FmZV9jYXN0KGxvYWRfb2Zmc2V0cy5sZW4pOw0KPiA+ICvCoMKgwqDCoMKgwqDC
oCBsZXQgbWVtX2Jhc2UgPSB1MTY6OnRyeV9mcm9tKGxvYWRfb2Zmc2V0cy5kc3Rfc3RhcnQpPzsN
Cj4gPiArDQo+ID4gK8KgwqDCoMKgwqDCoMKgIC8vIFNBRkVUWTogd2UgYXJlIHRoZSBvbmx5IHVz
ZXIgb2YgdGhlIGZpcm13YXJlIGltYWdlIGF0IHRoaXMgc3RhZ2UNCj4gPiArwqDCoMKgwqDCoMKg
wqAgbGV0IGRhdGEgPSB1bnNhZmUgeyBmdy5hc19zbGljZShzdGFydCwgbGVuKS5tYXBfZXJyKHxf
fCBFSU5WQUwpPyB9Ow0KPiANCj4gV2h5IGRvIHdlIG5lZWQgdGhlIGZpcm13YXJlIGltYWdlIHRv
IGJlIGJhY2tlZCBieSBhIERNQSBvYmplY3QgYXQgdGhpcyBwb2ludA0KPiB3aGVuIHlvdSBsb2Fk
IHRoZSBmaXJtd2FyZSBpbWFnZSB0aHJvdWdoIFBJTyBhbnl3YXlzPw0KDQpJJ20gbm90IHN1cmUg
SSB1bmRlcnN0YW5kLiAgVGhlIGZpcm13YXJlIGltYWdlcyBhcmUgYWx3YXlzIGxvYWRlZCBpbnRv
IERNQSBidWZmZXJzLiAgSSBkb24ndCBjb250cm9sDQp0aGF0Lg0KDQpwaW9fd3IoKSBpcyBqdXN0
IHN1cHBvc2VkIHRvIGJlIHRoZSBQSU8gZXF1aXZhbGVudCB0byBkbWFfd3IoKS4gIEl0J3MgcHVy
cG9zZSBpcyB0byBsb2FkIEZXIGltYWdlcy4NCkknbGwgYWRkIGEgZnVuY3Rpb24gY29tbWVudC4N
Cg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29uL2hhbC5ycyBi
L2RyaXZlcnMvZ3B1L25vdmEtY29yZS9mYWxjb24vaGFsLnJzDQo+ID4gaW5kZXggNDk1MDFhYTZm
ZjdmLi4zYTg4MmI3ZDhhYTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3Jl
L2ZhbGNvbi9oYWwucnMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmFsY29uL2hh
bC5ycw0KPiA+IEBAIC0xNSw2ICsxNSwxMSBAQA0KPiA+IMKgbW9kIGdhMTAyOw0KPiA+IMKgbW9k
IHR1MTAyOw0KPiA+IMKgDQo+ID4gK3B1YihjcmF0ZSkgZW51bSBMb2FkTWV0aG9kIHsNCj4gPiAr
wqDCoMKgIFBpbywNCj4gPiArwqDCoMKgIERtYSwNCj4gPiArfQ0KPiANCj4gU2VlbXMgb2J2aW91
cywgYnV0IHN0aWxsLCBwbGVhc2UgYWRkIHNvbWUgZG9jdW1lbnRhdGlvbiBleHBsYWluaW5nIHRo
YXQgdGhpcyBpcw0KPiB0aGUgbG9hZCBtZXRob2QgZm9yIGZhbGNvbiBmaXJtd2FyZSBpbWFnZXMs
IGV0Yy4NCg0KT2suDQoNCg0KPiANCj4gPiArcHViKGNyYXRlKSBzdHJ1Y3QgR2VuZXJpY0Jvb3Rs
b2FkZXIgew0KPiA+ICvCoMKgwqAgcHViIGRlc2M6IEJvb3Rsb2FkZXJEZXNjLA0KPiA+ICvCoMKg
wqAgcHViIHVjb2RlOiBWZWM8dTgsIGtlcm5lbDo6YWxsb2M6OmFsbG9jYXRvcjo6S21hbGxvYz4s
DQo+IA0KPiAJcHViIHVjb2RlOiBLVmVjPHU4PiwNCj4gDQo+IEFsc28sIHdlIG1heSB3YW50IHRv
IHVzZSBLVlZlYzx1OD4gb3IganVzdCBWVmVjPHU4PiBpbnN0ZWFkLiBXaGF0J3MgdGhlIGltYWdl
DQo+IHNpemU/DQoNClRoZSBHZW5lcmljIEJvb3Rsb2FkZXIgaXMgdGlueSwgbGVzcyB0aGFuIGEg
S0IgYW5kIGhhc24ndCBjaGFuZ2VkIHNpbmNlIDIwMTYuDQoNCi1ydy1yLS1yLS0gMSByb290IHJv
b3QgICAgICA4MTYgSmFuIDE0IDIwOjQ3IGdlbl9ib290bG9hZGVyLTU3MC4xNDQuYmluDQoNCj4g
PiDCoC8vLyBUaGUgRldTRUMgbWljcm9jb2RlLCBleHRyYWN0ZWQgZnJvbSB0aGUgQklPUyBhbmQg
dG8gYmUgcnVuIG9uIHRoZSBHU1AgZmFsY29uLg0KPiA+IMKgLy8vDQo+ID4gwqAvLy8gSXQgaXMg
cmVzcG9uc2libGUgZm9yIGUuZy4gY2FydmluZyBvdXQgdGhlIFdQUjIgcmVnaW9uIGFzIHRoZSBm
aXJzdCBzdGVwIG9mIHRoZSBHU1ANCj4gPiBib290Zmxvdy4NCj4gPiBAQCAtMjIxLDYgKzI4Niw4
IEBAIHB1YihjcmF0ZSkgc3RydWN0IEZ3c2VjRmlybXdhcmUgew0KPiA+IMKgwqDCoMKgIGRlc2M6
IEZhbGNvblVDb2RlRGVzYywNCj4gPiDCoMKgwqDCoCAvLy8gR1BVLWFjY2Vzc2libGUgRE1BIG9i
amVjdCBjb250YWluaW5nIHRoZSBmaXJtd2FyZS4NCj4gPiDCoMKgwqDCoCB1Y29kZTogRmlybXdh
cmVEbWFPYmplY3Q8U2VsZiwgU2lnbmVkPiwNCj4gPiArwqDCoMKgIC8vLyBHZW5lcmljIGJvb3Rs
b2FkZXINCj4gPiArwqDCoMKgIGdlbl9ib290bG9hZGVyOiBPcHRpb248R2VuZXJpY0Jvb3Rsb2Fk
ZXI+LA0KPiANCj4gSSdtIG5vdCBjb252aW5jZWQgdGhpcyBpcyBhIGdvb2QgaWRlYS4gV2UgcHJv
YmFibHkgd2FudCBhIEhBTCBoZXJlIGFuZCBoYXZlDQo+IGRpZmZlcmVudCBGd3NlY0Zpcm13YXJl
IHR5cGVzOg0KPiANCj4gT25lIHdpdGggYSBETUEgb2JqZWN0IGFuZCBvbmUgd2l0aCBhIHN5c3Rl
bSBtZW1vcnkgb2JqZWN0IHdoZW4gdGhlIGFyY2hpdGVjdHVyZQ0KPiB1c2VzIFBJTy4gSW4gdGhl
IGxhdHRlciBjYXNlIHRoZSBvYmplY3QgY2FuIGhhdmUgYSBHZW5lcmljQm9vdGxvYWRlciBmaWVs
ZCwgaS5lLg0KPiB0aGlzIGFsc28gZ2V0cyB1cyByaWQgb2YgdGhlIE9wdGlvbiBhbmQgYWxsIHRo
ZSBzdWJzZXF1ZW50ICdpZiBjaGlwc2V0IDwNCj4gQ2hpcHNldDo6R0ExMDInIGNoZWNrcyBhbmQg
J21hdGNoIGdibF9mdycgbWF0Y2hlcyBiZWxvdy4NCg0KUGxlYXNlIGdpdmUgbWUgbW9yZSBkZXRh
aWxzIGFzIHRvIHdoYXQgeW91J3JlIHRoaW5raW5nLiAgSSBrbm93IEFsZXggaGFzIHBsYW5zIGZv
ciB0aGlzIGNvZGUgYXMNCndlbGwsIGFuZCBJIHJlYWxseSBkb24ndCB3YW50IHRvIHRyeSB0byBp
bXBsZW1lbnQgc29tZXRoaW5nIGNvbXBsaWNhdGVkLCBqdXN0IHRvIGhhdmUgaXQgY29uZmxpY3QN
CndpdGggaGlzIGRlc2lnbnMuICANCg0KSXQgYWxzbyBmZWVscyBsaWtlIHRoZSBraW5kIG9mIGNo
YW5nZSB0aGF0IGNvdWxkIGJlIG1hZGUgaW4gYSBmb2xsb3ctdXAgcGF0Y2hzZXQuDQo=
