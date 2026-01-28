Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022114.outbound.protection.outlook.com [52.101.101.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6EF25A2B4;
	Wed, 28 Jan 2026 14:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611272; cv=fail; b=OaQafxUKiQ6+La2wZVe0Dplv0gw5yPbP+4NCE9KJJ5Chqj1zZ4y3q1nnVDBrD0Gsd2MlfAb9mKu5wb+qh0SK0nxZX0hvof1fzY0573WrN1gLOoAFFb9TlBL1QoPaGtAifnRrw7TSP2fMgyxcT7BMYqQAG58/1CyWmluQijF9b4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611272; c=relaxed/simple;
	bh=exX9qtQaedmoJ3pV36pdMqdOalghLRRlK/B6quRare8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=h4LxNgHKvCAo4SkHMRI8Azn0iL1mu+LUaLz9BsmQvX+8KXAy6v/5YyGE5+iIwvZxY6xmF2XjPZ4WGbzZ6LnU36MEN8jGg1brD9VAPxqT/CzR64RdxWTOcZHvkLoYnml7vSJMYEIny6am2Nn9uOrECV4q/VFFU8FH2J3sOwBownM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=n2zs/YQM; arc=fail smtp.client-ip=52.101.101.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="n2zs/YQM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GS9vyJYeC3pBFTTTGAI93lZEJph4b11GdoRp4HlOeiBmVPwUJy8nmHt+ETYtnI/x/rc4qlWGXBbeTz0LL5BbgyOWuSauOJrKmKXg+MIwNg3UwRjVjTP8mRxIAwQ61lWFKNcHiozkSy2ps9E1L1NtFtDs3jU+sJ7K3MfIdmRxuVKPR/TXdHvEDsRg9bGRPuVnOZ8rakBdHDLzgTtsz47D3Yi6cbHNXS8iK+kbgM5iCholq0+UFQNZK57KZTuXyvShWHIlQCnMLuI/VoX8qZZd1X4VZlpQ4WtA1Jan16xjWdSKh2RXjA6V5dxGvkdBNDNucSq7cC09cmBvG8YnxZWzRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GU9sEvePRHuFdlV+fZKuamDJnFjtgvlyjcu0l3ix3tQ=;
 b=FByM1PcovQXkfAKG6P/QHuPZM9OgKy6YPKrowpGC7IfTvkBal8nqcTs/BFrs5nxfeD0c+8PvFlkXoUNRV7+TDT1hwC1WghQY/7CIvv+jakrXLt7mLhx/apFiztIXzP7ojPVVnH+69/pJ9PeQnFA2pM6WzaSdYzgo3ouXzarStAMjSvYHxi6/YeMcYlMoZZGNOIwaadzP1Qncdi/Cudg9bMzBtkIUFaD5GCC+uK8jgyiPzVGV/IjqmLuoSpf+ImW/nK8p1HxsxMiqUJM/Qtn5qEPihc7KVmYzTceyvFug33vRFeAWNeZL5yAxi+YNQd1urL6MP7Nen+dVUbWR1iRu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GU9sEvePRHuFdlV+fZKuamDJnFjtgvlyjcu0l3ix3tQ=;
 b=n2zs/YQMJUVyfv21yYEmJDVM3gvJvJhJKYHXaVkpycW3+qbbG3X1QzMeEXa9x6p3DReA3DVxbqld3APPsrJ1ip2EOavEz4c25HmNKhSYHN31yXjC/huXYEpy/ZU5WIcWF8JkXZ1luIW6xKQU6Ha/RHyCOFHQz7M2NhW36NF7f1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6443.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2de::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 14:41:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 14:41:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 14:41:05 +0000
Message-Id: <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment
 of values
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
In-Reply-To: <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com>
X-ClientProxiedBy: LO4P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: f144f84c-f474-47b4-d391-08de5e7b44b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFRlVXp1c3ZnNHpGUHBtMFN4d2FCTXBMNmVSODFJTWw1Y0lWb2JpM0sxbDZ0?=
 =?utf-8?B?QWppd2hUVTM2Rjd4VDVxVzNBUEk2Y3BhcU5zdGVPQzNPbS9GR0N4K2tjS2dp?=
 =?utf-8?B?TTBRTzVyaHppRTYzZFpqYm9YVTF4cjZxY2V2YVhIdXNQYWltNFlNeHRVVWFj?=
 =?utf-8?B?emkwUVVNaDdxTzJlMjFFaUFrbTZ0V3BkQm1BWjFwdzNMb3IybUpCUWEyU2pk?=
 =?utf-8?B?THZqYUxQcEk1d25kaVZvN2NWTFkxQkFEeDk5OXRBZmdjQ3BncFp4Z2MxTnBZ?=
 =?utf-8?B?Ri82ckpqK3dPT2l0NTQ5RVE0R1RLSFNRUXo1WDR5ZTJFNlJjYUVRMnptVHB5?=
 =?utf-8?B?aE1BS2JCTTE3SzlzQzIvQUc4MkN0eURJOVhUQnVwKzU3OFdvcEh3OTUyNjRk?=
 =?utf-8?B?ZUxzRmU0T0liQ3RPcEFlWHJkY2YzSGZpdDRGS3pSNXViZzgvUmQwL0dYNUNt?=
 =?utf-8?B?cEExNUlhd0JPOXpiaFlvVkoxR3pQV2pDS0dhayt4RDNsRFhsYjhDQ2JTZVpN?=
 =?utf-8?B?dnhQQnUyL25FenhaL0tTMGVBelREQlNwNGJ0VGxZcVdQdHRrZllyK1Q4aXBp?=
 =?utf-8?B?RjhqV1h3VmNKK3RlajRmK2xMcU9FMVFMZ2JUS0tUWUJKaEpHY0V6UGNVbXYz?=
 =?utf-8?B?aEFmaGIzRlV6cCtrNHhiSnV6R2ZpbHova1phYnN2WlNrWVJsVkgyN0JsWElR?=
 =?utf-8?B?QUFscTFTLzVCMGhjbzJDWGJHTldsNlcvc1B0M0lMaXFnV29VUE9JdkxTZnRM?=
 =?utf-8?B?b3RFTWtwQ0wvVlZpamMrZ2NXY2N2QWlDV0ZNVnFOSXM3bXBDSzR3RmplSklr?=
 =?utf-8?B?YU5VOVNmZ094ZnNHSFkvYXREL21qaTNSRUZJTldaMFJxeTNrbzI1eXlISmpa?=
 =?utf-8?B?Tjc5ZFYxTHFjTzlXYVFnOEQ5UTdUcTQzM1pieDY5eUZNR0VpTE55dVhadVNw?=
 =?utf-8?B?cjZDaFU3dldNUWh6LzNTekJHM1ZmaXdEdTR6RnZmMHF4NnNnR1hYU3BoUk1X?=
 =?utf-8?B?bWNncjZXbTVNdkRmL2NBbFN1U1VTMzd5TzkwWCtkTVpIUCtiQVE1dllxZDhR?=
 =?utf-8?B?NWVud21KMnhHZThlOVlmZHlpdjN6L2JudjFQV09hQitPVWVXVmRZUlJhNEw0?=
 =?utf-8?B?UUs4eEpGZVFNRVc1Z0dnbUgza3k2aEJkaU1ySFp5R2lDaHcyZ0hLQm1iYisz?=
 =?utf-8?B?YzBQTFJFbDlveUk2ZGRxTzROQnBPcTlwSVVUQVVFM0cyQ3htZEhSdFJ3Sk9X?=
 =?utf-8?B?b3UrdThZaGU1WVI3NG8ydmZDT0JJZStydE1DOXkwOUU4VVlTOWlOOWJSNXZJ?=
 =?utf-8?B?aDMyM085U0NqV1F2QjlpTENic3ZVWGxKMG5kOFhFTm1Ddjc3SnIwTnFycExm?=
 =?utf-8?B?blRjSlM2L0dtaXF1Um4vbFk5TlV0SStRckpPQUVZUmxoNHBjd0l2QXpxdXA0?=
 =?utf-8?B?MUkrSm5ZbGRRVlRldTJtSjIxU2s5MXdycHFvL0RrR2NZMlgvY2NhVTY0Yjdn?=
 =?utf-8?B?YTZDdG5ETGZjaXNLbVcrb1lTT1htQjloam84dXhVeVV4blNmVXhSM29RMVp1?=
 =?utf-8?B?SG9acTlNdUN6WkdvdnNvWW12cGY4WmJkTjNGL3c3QU0zbWV3SHBZR0NyVFI5?=
 =?utf-8?B?VG1PNklIeE93NFcweEd4U0RvZS9GeDN5VURFbkd0emdzY2VZVGhrd1ArOEVm?=
 =?utf-8?B?b0NqMFVnWXM5cU8xdjFqcjdTZ041YVNLcytmNkpaODlGM2FxNXJwa3E4M3Qy?=
 =?utf-8?B?eUVvRzFDS2NuUXBtQlVnQVNyRmdibXUrTlRWVXZMU2lTekE2T1RlcWUxVFVv?=
 =?utf-8?B?bFQxeDVBVHBCeFExUGN1NVJpOTNKWXk2UjB6cnQzUEN6Qlc3dnhDNTF6Sjc4?=
 =?utf-8?B?QXJpTkRzRlRnMGRwRDB0ME9BSk1qRkZRSTlaZXdyT0lxUUlJRU84UXc0VklY?=
 =?utf-8?B?dmxYdm1zYnR4cTNsbzErK2F3TDJuQnJXS1RrbUFaV3pNOXFia0VBOG1OUHhZ?=
 =?utf-8?B?TElFV2RuemhhMGRjYlhlT1Y1UGd2V3lKQnNtWm5hc1lrZEVjL3YxZDNHTU8z?=
 =?utf-8?B?NDVKTzRNZTFJN1QwMTV6SjhyRC80cnJZUUQyQnFiVXQvb3BGNFNxSnhMMjBr?=
 =?utf-8?Q?JZHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVc1OVJILzNoanJMK05vS1kvUUVNL3htTzQ4aVEzM1ZDR2xYbm1UdEV1RDJZ?=
 =?utf-8?B?M2V5K3RNZ1JHSmdJakhkSXFzREtieVowd2pFQ1VFQjhBb1pJTmlNdWhnNE43?=
 =?utf-8?B?UUdZRS8za3c4Y2ZScXBNSGlpck5HVnR2K1EzYlVYY0E4RjNHcjZscXpMNkpk?=
 =?utf-8?B?LzExNC8yT3NkQTl1LzdHaXg4N0lOMFkyeUdrS2p6WjloQkFkemFsUG5UNlph?=
 =?utf-8?B?QUdTUkNmUk9CSzlIV1RSVUUvd0QxYmJ3dCtpclgyUy8yODAyV0ZDWHF6WnIy?=
 =?utf-8?B?R3daaXYwZkR4SGc1NVBCMFJYeUJ3NytUQ2NBa05WcEQ1Qkw3SExaRitIZ1RL?=
 =?utf-8?B?dENHZUlUOGtOenBWWmttaWNUeFdSbHBGSXRVLzEwNVgybkMwVzI0UjdPdlpN?=
 =?utf-8?B?dVQyYW1QMFlIeVZqWno2SzlDeG43SEg3WG1QbERYWjEvaEN4elJCRS92R3pL?=
 =?utf-8?B?VUNmMUxxTzZRMXRSQ1A5d3AvQVZGQkR3djNabHpnSWp1ck0zL3Q2ZXc2c2d4?=
 =?utf-8?B?cVBVZVdpaDVkL0tPbG1mMFFTNllEcW9KS2NmUjhpT3R2RWpidCszMndxYXFq?=
 =?utf-8?B?RzZNeHMzSGJTY3pjV0dvUytoTDZEZTVhY1Y2eUZqcDVqSjhncytVZGNMdUJ5?=
 =?utf-8?B?cU9YZDJDL09DQno4MUpkaER6NXUxVkhWcnB6ZlR6NUlER3E3K25rYlIrSUZw?=
 =?utf-8?B?akJ4RVdtMHVOU0F4UlY2WXViQStORHk1ZndWNnRGaXVvSzZwOGs3dlY4NVZT?=
 =?utf-8?B?TWFINXJZU0FibWlUalVDNGxsNEdGTkxDOUdnYmdHK3FOdldoZXFpM2JRSGZY?=
 =?utf-8?B?Qmh5cjN4TG9KWEd5WDBZMExoSmxqaHVFVFpCdjFHWVo0RExYTjk3KzhZZUQ5?=
 =?utf-8?B?ckZiRWx1bnN4dkVvMzVXeThQTnh5MmJWL09rWGdNN0JnTVJuamVIcGJSQjkw?=
 =?utf-8?B?cVRLS2J4cE5hU1NuaEJjS1c0YkwvZWxlaVdrNHN5OFlSc1hRWXBkZjI5Uyto?=
 =?utf-8?B?U29GNUUzalB1dzIwRkI5a3VPeXVFc2NkVlgwanlNb2hpSEpWUjZGWGo0N1dJ?=
 =?utf-8?B?S2RDcjVRd2FwSjlGVkl6SkxFMVFoWWVyNzI5clAzS0VqaEx6cDQ2QzYxNGJK?=
 =?utf-8?B?aXRNaVFHZ0ZLU2ZDQ3FZYzRwOW1Pdlo2akMxWjJXUGhKQ3B2VkNuTkdRYUtX?=
 =?utf-8?B?Qm5uS3NWYUc3dWd2NDBBMlhtWHlTcWtIcXl6REFxRStHbURacGhac2I4M2x6?=
 =?utf-8?B?UVRDekJKWkc1SGtUN1paQkRRTEk4L1p5TlpPRWNoK3FjRXc4RklmNnFaZTlF?=
 =?utf-8?B?MTVYOWRlbEtwWXlWRWVWMG1KNDFOc3VtUnMyMkp0clNQREtHRXNOWThNNzJH?=
 =?utf-8?B?VHhVdHZvcjhVSUFwSy91V0ZiZ2l0MGZpUFlaR1FEd1dLd0pKM2dieUFPclRD?=
 =?utf-8?B?VUpERndDT0d4cVVvS1hZekRwejBDbkVLcjF3V3lXMHl2OXJIZDg5TndFbmJv?=
 =?utf-8?B?TEY4T3ltMWtuUFd1RlRrdCtRQ1NJQ0NTaEc5RE1mdldVRHdlbUc3dE5ZQmEz?=
 =?utf-8?B?QUdvQWRYbzdMYmhZMDZJWW0razhlTmEzTGUxaWtnWk5nb1ZTdGhQdWlNVW43?=
 =?utf-8?B?L24rS3dSeVR0RzhKanhYMnQzZlFGbk9KWDJqK3hOWTU0djFwOEFUVXhSbnVN?=
 =?utf-8?B?c2dLSFVCWUpaOUdQZVNLWHphejFFNlA3bXd0VnEwZWFwOHF4VVZyRmtwZXIx?=
 =?utf-8?B?YUlTK2MyRk5ldUtSdGVFVE9YQ3hpSkVrMWRjMDJXUjJNaDROang2Z1dMeVYr?=
 =?utf-8?B?aUw4b3ZXZERHOExNaWkrcG1GQ3VnZVNxR0gxSVlzaUxxOUJkNzFBK09DNC9C?=
 =?utf-8?B?Ulg4MExScEtQNExzK2Z1TXdPMW5OWlJEL0U1Z3VVRkwvZnpnWTk1b29oZnN1?=
 =?utf-8?B?MXNLQThmbFNSdmJsLzQra0Y5dHMydlIzY2tPQk9wb01kTmZ6SVNiTmFmNHB1?=
 =?utf-8?B?cWwrQ01PSG9RKzNLV2JFd2FpQ1F5M1BVTEwyZ3laL0xvVGZCSXcxL0tHcE1E?=
 =?utf-8?B?S3lEMU5HaTZMcVdhR09LUnFlQlpXZTRtTWNGRW95YUJMajVvb01RNkUvdUFv?=
 =?utf-8?B?ODUwZk41RUxSRnByajZ0Y3F3aGxVU3hQZzV1VGUzWk5JYlZ2MnNScCtZbCt4?=
 =?utf-8?B?S0dJWDhzMCsrRGJuZWJLVXNDVDRuWmhvbW9oYnIrT1B3ek1kT3dNalRKLzVY?=
 =?utf-8?B?ZDFjdjBzUlNaYnpBaHpsb3BlMVIyUlBtMjBoeTQ5YTJxMHY5U09yYzBEWHJ4?=
 =?utf-8?B?Z3pGYlQ3UTdkNkw5Q1JucHhmRk90bVhkL0ZXSEtTby8zaW5yQ3FmUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f144f84c-f474-47b4-d391-08de5e7b44b0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:41:06.0340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKQh64pAHE5hEBYkl/sgJB3ImT3F8Ng8nzlG5/qYClUZL+UfbERaRvnv27TjMIn6D+cxv4HdUNSJmSyldEV41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6443

On Wed Jan 28, 2026 at 2:25 PM GMT, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
>> `CacheAligned` allows to easily align values to a 64 byte boundary.
>>
>> An example use case is the kernel `struct spinlock`. This struct is 4 by=
tes
>> on x86 when lockdep is not enabled. The structure is not padded to fit a
>> cache line. The effect of this for `SpinLock` is that the lock variable =
and
>> the value protected by the lock might share a cache line, depending on t=
he
>> alignment requirements of the protected value. Wrapping the value in
>> `CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
>> ---
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/cache_aligned.rs | 59 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  rust/kernel/lib.rs           |  2 ++
>>  2 files changed, 61 insertions(+)
>>
>> diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.rs
>> new file mode 100644
>> index 0000000000000..9c33b8613c077
>> --- /dev/null
>> +++ b/rust/kernel/cache_aligned.rs
>> @@ -0,0 +1,59 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use kernel::try_pin_init;
>> +use pin_init::{
>> +    pin_data,
>> +    pin_init,
>> +    PinInit, //
>> +};
>> +
>> +/// Wrapper type that alings content to a 64 byte cache line.
>
> nit: s/alings/aligns
>
>> +#[repr(align(64))]
>
> While 64 bytes is the most common cache line size, AFAIK this is not
> a universal value? Can we expose and use `L1_CACHE_BYTES` here?

Unfortunately `repr(align())` does not accept expression or macro invocatio=
ns.
It's still possible with code-generation, but it'll be more tricky.

On all archs that we do support today, I think the value is always 64. Howe=
ver
it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new archs=
 gets
addded where this isn't true.

Best,
Gary
