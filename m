Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011012.outbound.protection.outlook.com [52.101.52.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA7B4A32;
	Fri, 13 Feb 2026 00:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941369; cv=fail; b=M5YOEJm61+AkOIsy0wtAGHfORNyDX7AAgghNfA8W822HDIA9hbAX/ngfqvTvR6/VJ6hlNrFN9i0fhMdzsxuuBOhEzgme8RNOYbW2Dt//Z5wwylzlO0ygbzWd4gjsou35W8ruItdmidcKd6NSbgE1wgdwFp9MOLWUS45q4auLVho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941369; c=relaxed/simple;
	bh=79AGYpRW3Jh68y3ujB4BjQUeCI5xwAhLbOgOls6C4Sk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=ShVQj6oiEQ07a8mAFVAvwHpSZ1zlyfhxkB66QRdg3cNpmEhSzOqQc5RFd2JcLDaE5XuQDeTRs4RorINQi1vZHk313yqAmlY55Zh2/1S4LSGgofKA6BHEGOhBnSb0htKZeM+GP074q0wA0ZkPPIeoDPdzj7Vrdg/TpBVwPhAXRRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fhXKO5fP; arc=fail smtp.client-ip=52.101.52.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fhXKO5fP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t19Nblr/lJMLKjJJjNqLOhqwjxCMIGyreJQBtBnnMEl3ziBEd3ZlQifZ2G+FZP3IwDB1ye743lLnUsWjd31ixQdD2r75P75m/f3G211mIyWxjgUMPMGd+AFYEs34zh5BjAIQqGDyDt8yNQFJT/+XvmdOA77XR/ya+zGat+Om9myIn6gMuxWbr6fqcp129OAijs8meVeInTiIkfmN4Uo4vDPP/TT//ZcYHxEF5+3h6u8Zplx3uYueLFVoNcVdjet8uVQ1N/v4yXwai1exnnZ8/bq9twxdphKFgz9/RC2kj/KJ62BqBfpC0qc0NUPrrJ7t4V0QfESdTuaJgEvw9j3cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBJ8FqP3i9bEg2lxjvW2h3ncAkiaBIZmNtm8DAYmp1E=;
 b=fXjJuIzxMpxk2f5Ho/0LXvsTvAM4z3vWfv9EjyzXPAMgB8W/JD0YLsOKfw6/4LXv3FsqCiJozi3fihxl3l4BTSHCuGAcRFFFfkg4Ujt4gZwAZXXa8ezxa5Rh/zCupwTzVvDRxG1/UC5JbcMlcdvV0T5rYwDPj6jRRTtsno0mA7xLAafXhDj+0VkNUPjyKxecl0X8w0EYAEs/wFRUm5DqtIkOS8y3NQX9kaw3h/f8FWwwEEfl5pFiBcSVX85ONaxwF/wm6XkO/uILEUzMzMhW4Zb2Wf3FDllIHVnMhpKHGB18yTAh3didK732o4x3aRxFKlWVqrR2+uIzhMLGjWuPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBJ8FqP3i9bEg2lxjvW2h3ncAkiaBIZmNtm8DAYmp1E=;
 b=fhXKO5fPQFCUIUsMStR4zQkacytptTfxDKxOMvfVFkWgOI6GNVs6mbuw9pNugu9+YbzUqO7pE5B6KBO1IEBD5XTGtLKWHcznJ4SKPTp7628C0hYpFN5A+jq3fCxED+kr0xxcuIFr5qy2PPPtL7xNl3g9kcD/xDEBN9oYBjVVtcB/qA7IoSL1l9l+yJS+mIrwxvrnFhxUvPhjFJWH8tY15MtjEnX29d7J/Wqxe2zQ16BL58UR3MnkNsnnji+C7jKf/yGInLH4SnK+o1F8o6eDnhF3hokgVrWMl/77yq/aWXQbQvLLuB5xfB6v0jQnL9Fg69W7m55slY7PyJO1LEIzvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB8166.namprd12.prod.outlook.com (2603:10b6:a03:4e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 00:09:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 00:09:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 09:09:16 +0900
Message-Id: <DGDEBFOE9HWW.1RSKYGYF3GUEM@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix aux device registration for
 multi-GPU systems
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260205221758.219192-1-jhubbard@nvidia.com>
In-Reply-To: <20260205221758.219192-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: b626194e-c6be-4bc2-5229-08de6a942284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVZrenJxVzVGeFpUSm8rSHc0TTdWNkxyQVZSVHBqc1RkUVJVNVc1MW1tL21k?=
 =?utf-8?B?TWVvMjNHYzB1Rll5MW9CckQxbHd2NXZZZEo5bzQzdXIrb3puM3RJYmoyRktF?=
 =?utf-8?B?cmxCWTg4OWV3Zmc5K3h0NXRsRmN3U3QvcnhFbEMxaWQ3ZHRBbjRUUS9EcUVO?=
 =?utf-8?B?bW5zMDJhUllNcXgybjF2eVllWEYyTG9hdjZsbGRhT2xiWkduOEFzQnlHZGZh?=
 =?utf-8?B?QVJvRjZlbmZBVzV4UVA3YW5DdnFwZlJQdUIwQ2d3K1p3VmNxSFcvWmo0bkhJ?=
 =?utf-8?B?c2lZb1BJK1QvOWtKRXp4KzJaVnl0K0dNa0pHSkhLSGFaL1NnR3Z2STZEb29U?=
 =?utf-8?B?OWl6NzQ4azNuUGdiak1XbXRVSG9WRmU0QnQyWDA3UVJ3c3d1MHpaL0F2L051?=
 =?utf-8?B?ME1jazR3MmFuRFJycDFPVk1Ja0ZXRjVJb1pTVVA1SXNtK2RMRU9tSFYwc1Rs?=
 =?utf-8?B?cXlSaHo4aFE1VndXaWM2NlFpa09LN3pCOU5PWEdOTXFQOFlXSDFZc2diREMx?=
 =?utf-8?B?OC9aOVpvZzNhbjBBTSt3S3M0akJjK0dhUHRQdVJGajJnQ2xrV0E3d0VBWjF3?=
 =?utf-8?B?RFY1WlAwS2JLcXdKUDUvMzhNYXhZbkZxV0xiNThEbU0vSGZNOEFPZkVmeEVF?=
 =?utf-8?B?a2lvdzNNYW5zQ1BUR0c1UkhTc0cyVWNpc0ZJbnlHcnl0MjV0c1ZrWFQwS1lO?=
 =?utf-8?B?amd2Tk0zaE93V1dRVERwUUhVZ3hrRDV4NjJ0REpjVkpKbktWcmg0a0VObnFn?=
 =?utf-8?B?Nk12WFIvWVJwU2JBRVdqSlZIQkFjdEdZMEoyRkVYc3ZWYkZtcUZ6THdybmM5?=
 =?utf-8?B?MXVaUUZyUHE4OWJ6OCtiZlFrc0dobi9CczloZTZqVytPVllOdXV5NkNqcDVm?=
 =?utf-8?B?OUlNVzNZYkpGZERnRVN4Ty9WYVV0SkdYRGI1eG9JaHlLS2xQVDVPQ0pWMjJx?=
 =?utf-8?B?Skk5RTlUQTR6eWlvM0lXL3NGVi9ndFIyem1BTDB2OUNHSnF6NWl4V0xUL0wx?=
 =?utf-8?B?ZEFpd2xOcm5VZHQ1NFNFd2hhNXBXemMvNEY5cWlnNFFMd3pzbDJqaEdJQ1JM?=
 =?utf-8?B?TjBJeE9aS2JiYlRiMnVCUS9ITm95Y2tOMCtCbDk4cGRsRUo3d3R2Q2pFNStn?=
 =?utf-8?B?clU0eS9INGdlQUJFMDd0SXVHNHhRUEo1eTRjSG9QZUl3a2Q5QlpzQk4xOVEr?=
 =?utf-8?B?VzhSTWhnN0FYR3hyZHNVZjNnVFYwU2o3RWRBY2lZVjFURUtidyswcm1Gd3NN?=
 =?utf-8?B?c0hVbzB1TllDZ21yRE9BMlpENWh4ZW1FQzNTaVBYL015a3VFc1U1TmNNNG1P?=
 =?utf-8?B?ZEhBRlRSV3NYaVNnR1RmdWFNaEZWZnh0Sm8zY1FOSXhCeHJoSTlycWFYNWR1?=
 =?utf-8?B?b0g1VVo3NDlxZWZvbTI4cmdib3hEZjAxdDVlbEZTdGtWVmJGNHFJMXJ2dEJX?=
 =?utf-8?B?cDRqV0VYZ0s2SVcreWN0bjZjbFo4bG15MWpZbU5tR1hKSkdXWHR5anBRU3Ay?=
 =?utf-8?B?N2piaTc3cE5EOEt4THhDREhVdmFKSkppTGExQStWdDM1OTNQSHpMTE8vOFNE?=
 =?utf-8?B?WmlnQldZeE45UXFIeDZRL0dhWUp4NGpXWno2cklLbHB1RzdjcHpIdUJDcmlK?=
 =?utf-8?B?bEdkQy9tMWMwakpaVW43cHJFU3NIWi9BR1hLcTBLV0RTNGJpR2FHNVMrTTVm?=
 =?utf-8?B?ZUZLajYvTHVuNm9IRGpzL2xKNzFtd0NTRjFmMVY5cGxjeXo2YVZtVmhSSTFR?=
 =?utf-8?B?VG9Cc0g3dzE1QzI5YlFuN0ZScmdJWDZOajVDVTUvOHFHUDV5WjlJVkwrS1FU?=
 =?utf-8?B?WVE4SHozdHhtUTkwWko1aFltV3JnK2JxVjBjTTBhUWNrMyt0d3J0TUhETW5H?=
 =?utf-8?B?dld0RXZYR0JTUE1IUkxHS0FMRCs3blVkY0lBakx3NS95a3dqcitKbXBhbCtT?=
 =?utf-8?B?RGhncVo4T2pCVHgyRlpZZ3RHbVVCQ2pYeEtFM2d3YUdwNE9uOFVlaEJ5ZjFQ?=
 =?utf-8?B?MzZueVliWEhEbUZ2dTFlY20vT3B6UVgzUk1UTmFlN05MTmVBQnNSNUZyaG9a?=
 =?utf-8?B?VVI3MkRaTGZPMXMyZm1JeXhqVTlzQ1VNNnduRE45SkpPdkJvV1hhbjIzbDFi?=
 =?utf-8?Q?Aep8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExldndUMzJlbGRMbEIzWHg3YmlFd0VwcWtRWm84d3lGUEpXcnpwdzNCZitq?=
 =?utf-8?B?RXFLUzJCOGZSYkJZR2FGZXNPaUI3VzRhRm0yVzh2a3JacE9zS1VtMkUwTGhY?=
 =?utf-8?B?ZU9KaXhWeHl1dEo2SGM2bVR5cFNTOFFZRFh3ckRXcnNBN0RyK0dadDhwQ2cv?=
 =?utf-8?B?ai8rUy90SkZFZk04KzU2SFZYOHJvNkZxQkhBdURhR3lyZ3JPTU9hVDZIZFZm?=
 =?utf-8?B?OVZXaWlSRVdKaitwN05nRjIzU1RwbE5oNEIrcGNDa2pBbWpucVc1eVBPbnBH?=
 =?utf-8?B?V1RYVHlmTjNnTW5HU0Q5MnVCakNYRmh1NnRvMnlMWGJmdGJ2aVRkMFBIOFBB?=
 =?utf-8?B?MUM2cCtLL2RDejlESXMxTDhYbmprZm1PQUlzb00vOXdPTitPeEJNQ3c3dmFO?=
 =?utf-8?B?TWtOT1ZWRzhpYngzdTJTTlR5M3RHbjNoNmFQMEtpQ3lmeW95VnUyNmk5R3hD?=
 =?utf-8?B?N25ocUVSVVlPSitHTkNPUitYRG1ZSS9ycW9FcGVGaEtWUVU0d3dub2NmUDFk?=
 =?utf-8?B?RGdNV2FEUWI3TnI5d3YrZjlMd0E1VlAvKzJsSmRQM0F4RTkwL1RUTVhEOURr?=
 =?utf-8?B?Z3JJS09zTEpvWDBWQTY2YjVnbXpYQS9EME5CaGlTNm0rbFdsMERUMnQxaXJn?=
 =?utf-8?B?Q01iMzIyYnhZLzhlZ3RiaEErejRJNStIcG1qYWJ2UThyTU1BKzlBTmx5Yjlv?=
 =?utf-8?B?REppNFBiRGdXejZMZWlBVUsxbFJTZ0M4czVpc1RFTlJ6aG15ZjZjZzBJaEFR?=
 =?utf-8?B?S3l3Wk41aTFCaDZUQ0svKzdyVThHTTh1MmNBbkdvUzhidjM4ZmVaYjByS1Q2?=
 =?utf-8?B?VjNONzhtWEZONlM1aTFjMzl1MkkrczF0WXN0eDRaQ2h4a2pad1VtdCs0RHlh?=
 =?utf-8?B?MzhYUURrbU9hVUhhL0hTWGFmWno2emxZZ2taQldQUlMvNE13ellxUHdUVnpz?=
 =?utf-8?B?M09XZXQwNDQyVkRSYWNVK1NaUytab1ExdS9sZ1ZEaWJTRFFObDhZb0o1aEov?=
 =?utf-8?B?YjZiZGNBaU05cnVtODBWSmhSMVRlU25PbnlENW9oNVZCc25pOGpMTTduQmVw?=
 =?utf-8?B?eUpVc2FxVXdoOFA5NW5aU092VEVmQWt4Y0FPVDVKMkhZR1NtRTBraWtHOTNU?=
 =?utf-8?B?NzNKdVdXWXRObU1LdzJReFpTTFA5NlRLOXFYOGZuM0hpRHhQdENvWXY3NEZ2?=
 =?utf-8?B?QzlXaEh6a1o2dWNzdHEzZUwrWFJTL3Q5OVk1ZlVoQ0NLRkZuMk1mMmNBMFZt?=
 =?utf-8?B?SnVSb3RVV3IveDlXOWxQYUNYd0ZITjBXd0ZsSGI3ejNrTHIzU0VvTURjZkxS?=
 =?utf-8?B?RnJkbTFSZmR0NDhlYmo0UExxTldjT1ZJdiszb0wzaVpWeHpBaTBuOXpkUUhC?=
 =?utf-8?B?WWlLTlJFYWZQRWx3WWNoaFBldkhDRXh6VmxkTWsxQjZFWW9hRm1peDJXMGhk?=
 =?utf-8?B?NmNNUThWYWNrbXBYK0Q3cGVQaWVwa1BJdkVCTFlrYUJudEZxRTYxUnRTYU41?=
 =?utf-8?B?WGFPeE40SGlNVjF3aVJCc1FTeHhjWllpdmV3K3F4ck5WUXNhV0lLSzdYZ0ZP?=
 =?utf-8?B?RWFGZzJWV1pJWmgzWHQwd1pxREhZNEY5ZUhyWmNHSC9PTVhvTnN6Ri83YnJS?=
 =?utf-8?B?NU1sN3lTcU9QeFhRNDYvNWZLSmZkcHN4OENHK2I1ZWtWVzFwRCtidVRueE9m?=
 =?utf-8?B?b3JNeXNyT2tNSmU5V3ZTNVZFRnZxRTNrMmlqZ0ZTaklqYmM3RGpIWEtXb2R0?=
 =?utf-8?B?Nk1HRjJybllrQUlKS2I1dWw0Qk56VE15dHhuR0l5ZFo0R2pvaFZXdUJLbnc1?=
 =?utf-8?B?Q28rRTBVRnVKejBlZ3NnOXdNUjR3aEJieXZ3UVdnZFI0THlYVWUrR0ExQzFw?=
 =?utf-8?B?bGxMMU9nTmVzZzlWTFZzYmZGYVhNOEJ0VkhpSm05dlEwWW15aXhLTjMvUHZU?=
 =?utf-8?B?a2c3N3AwYUUwdFBVNy84MGhsTmxvZTV3VHJHNmJZS2VDUGs0ZWl5NUI2SzlX?=
 =?utf-8?B?cGl1cVZCZ0c2UnJtb0hTS2NHajJlS20ralRldzFqd2xSMkwwRnpTSUtPa2pV?=
 =?utf-8?B?N0tjRmRJb2NZMUY2RHhPSzU1eFVKZ0ZTUFA1ZGdxMTZDSXUzL0ZYa2piWlZp?=
 =?utf-8?B?cS9NV3BQbXA1U3FySHRsaStkYnBFUTBYNEtHVTVvakxzVWI1b3BVN1hucjVQ?=
 =?utf-8?B?bmFHcldtNVczaDd1dDdpcXE3RHllK0Faa09OaTBKMHJYM1dpL1BjK1VhcERm?=
 =?utf-8?B?VnhrVXZpRm9GRCtPeVVEaU5sd01NajI5ZFdadDFoQ3JMSzZDT3o3a2krQk4x?=
 =?utf-8?B?T21ZNE9zVkVDVVgyQmZpTTNTWjhCMnIyVWI2OXorMFNGZ29DZFJ2T0Yyak1w?=
 =?utf-8?Q?QJzyWKK+Mc+ymbUsuH8T4jKITuZ/dkCn2WqWC3cbbd4JI?=
X-MS-Exchange-AntiSpam-MessageData-1: hLD8ANPBzHW76g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b626194e-c6be-4bc2-5229-08de6a942284
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 00:09:20.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhnsDtqTiZDIaSRKStn2cBazFVtBnncd1EyrpiLfWVYqq8FvnnkxpeKPf72vGvuWrPlpywNY0VU5jphyV206gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8166

On Fri Feb 6, 2026 at 7:17 AM JST, John Hubbard wrote:
> The auxiliary device registration was using a hardcoded ID of 0, which
> caused probe() to fail on multi-GPU systems with:
>
>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCo=
re.nova-drm.0'
>
> Fix this by using an LKMM atomic counter to generate unique IDs for each
> GPU's aux device registration. The TODO item to eventually use XArray
> for recycling aux device IDs is retained (and modified slightly: IDA
> might be better) but for now, this works very nicely.
>
> This has the side effect of making debugfs[1] work on multi-GPU systems.
>
> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Queued for merging into `drm-rust-next` when it repoens - thanks for the
fix!
