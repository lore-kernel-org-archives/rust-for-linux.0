Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD2B3AA1A7;
	Mon,  7 Sep 2026 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770740; cv=fail; b=tOaniOh+0AtqDWGrsf7ALbm4CeYY1QezScnXRkZhd7zCMKI65YqWLD8Tjp79qUODUGdctn7hyulPvWys5KC1BQ5aNWtNKBxws21uAdSE5krfJTMVk+GjoXLq5aiwIpCvHolZjLFZ9P0ltP5rD/SnSmfSfbmKpyyI0JIojcHljFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770740; c=relaxed/simple;
	bh=P5HHzjHurulN26Nfct/QQM27pgTtWJ9FU7zSRS57kdY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BCUFvfY80V3Y2KdGN58Dla9zY5J9jdNygSbaSKFS6tNBBA6+wbrq5LM46bpoSWyghBbUbmiP17uE1Zf8RJdpzVrZIF3asaQBrx71rrupczCxP1OAlJEBDABpnE5heY5Ktfjk2Wjlyh0mdlsCXH85Xm48uaw0StG8pv1yBft7xOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cicg29a6; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cicg29a6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEcanTe4q9a02pBXxfwaHvEMPqsbSqno2tyMdABU9jvnl574yBCqU7g1jdknTDzAgC1m7TWG1mokqxCBXhYn3JLceh/1qs+pr5l7j0WUF7d2EHfXFS6ZYo06yQ9Vr+y0aE7fVEKgtjP7w6sW+vZvF3llWoAHqJMlBxbfZMr5IqSPcS4euU4+xhsdjY8sKdhM22ygPK1zcJyxccqcZZw1O5/KHEqjvm8AZrFSe5403WcFLyBLs9Dt5idlJv1WEEWHKm0xDPr/bqRbGGynRhVU53bWr8OVSUrh+YKMlOJHZgaIvxRuKqzl7OOmTcuii47h0FNN6kfCZlOcXA1Bc8dM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmcWDh61tgnXMhkT4RPQb/8e+fPAoWDMTVqAeNshtzA=;
 b=TCkUDKLGMqv8yQHmNiA3P4H9+NAAWvzkQuKFfTI0RU4BoaNqK2Ot8cZz33xsD1/FhtYLdOv24t+GXZ+uVcl9mex1d+9Jlk0CrXUJ9yKpwkQbJekca0ukJc1Ru8H2LltBuyOhi+u9KxZeprphlYVV509AyvMuY2KB63r8BDXPSP+KlRE9qH/hoPSV0o1MPzn3rsDRLsOrrqZdzyfK3Wj1LNpYRwvlxP6O3AbajeLuOMAXgsKJGQYSm8CXkUpojm3ZbCtt33D+yshyS6F5qLGCkWNVnQArdMSTG71s0eypoO5RrSwQ/glrzHWTjf23masmV71gKdbFIoDTlz4hGZ6Ezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmcWDh61tgnXMhkT4RPQb/8e+fPAoWDMTVqAeNshtzA=;
 b=Cicg29a6WEHD7L2wqgd5qY/olOy3ZvjxQttkZ0dmNr8t/KLefTJPI9rj/RaFsP/+E6xbHZik3rlbMJu3JkGVreAWgfC+VgMJjPCKRkZa5nzzCLFovdqnCn/bPvTcZTYGrToFe9pdcB4F/MdO1GlpWTQ3VfdzuZIQV6mVft41AyzxFzcQIyx6qS7V1NOGnwnrIncQm0lRMC1RFfrBpOT5bz87MzDt8RTpxFrPcJnKvw5Jl7bwvmy6Y0m244NnqQTJNNiow1yV6bsjE0Iy1t+55IVL6LcxNFA3lNgLvpqNMPE1vI4vZQOKMscN9WYdaPWSBKEGwCQsGx69J8WYuthZxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SJ1PR12MB6097.namprd12.prod.outlook.com (2603:10b6:a03:488::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 08:45:34 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 08:45:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 17:45:30 +0900
Message-Id: <DL8YAXFG28GT.11FRAWC7NUBM7@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: const_eval: add `#[const_eval_only]`
 attribute
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260903-cv-v2-0-e93b1613e40c@garyguo.net>
 <20260903-cv-v2-1-e93b1613e40c@garyguo.net>
In-Reply-To: <20260903-cv-v2-1-e93b1613e40c@garyguo.net>
X-ClientProxiedBy: TY4P301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::6) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SJ1PR12MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 967c3859-255a-4287-ff37-08df0cbc61c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|23010399003|1800799024|921020|6133799003|10067099003|56012099006|4143699003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rRTwqfark76+yPPbXCUoGVLpBOIDx1PeAdt1hA/Ilnt1emfJlJ+QQP3xDMSGmPW5tEnqFxsYI4NNipEhJmcd8Eh1B8CdgphWEQx9XEVCtGt/F82AHbRWyGzYr8EB2jb/Y3CyTBSfoWV2ruIJRp/rxYN57ckwQiM8IU6Uqc+46Du3pDU9Lc5Gu2YtZ2KSxkyyN1vZzTGbZu9pyBfNPyMWbnka+dCVMTKYSUx9YoPVvayTYtpxhk1xrOcrJxUzQK4mEqJ/y3MykMSAkOJ9yEREoUwZftwIKk1brZrlAiMwR1YQY612MxtjgVuUFmIpMhIF75NYrVH2qIAkNeReRSFEPRuhysCiPiQ7psSY9a4cS7yH3nG0ZtPY1cSR1OPrgAMwhWRki6PqaWYH4IeD6eL5GUQaiSb2DHZEzu5D31XwOGiyF+tT/LonJnoixvsfZXSP8zx0cKL03lqaFqmLnfEIZE4ZnfNp8Yb1ZPuyRXyv+rRMcUXGlBMSRsdg+paSSslQGcecZMUkYVQHGT9tQSg1p1tT6tHZrMVTJju1i74lK7r8ZS8lZ/n2aahdoS1/6srBHorGdQka3sW8OZSUENE6K+ywlkyGgRdwwNz/3EDOhnXyc+K4OzB0PrtRee2T4JYXgumBpo6CyPRTSefDY75ZAMQPGNBbVSBWPjnEHVIaxOOk1OtZ/mTsQEBUianMn56WzU2zJnSlxJ1UBavK4wi0WA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(23010399003)(1800799024)(921020)(6133799003)(10067099003)(56012099006)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGZ3U3FKSkNjVUsxUTFhbG4xc1J5aTN0amo2NnYyV2Q2WnBLaGRsdzM5QXFS?=
 =?utf-8?B?elp4RmM5MDNrWkNYaFNMWjg3NFpWd21yemRqRU0rYzJ2ZUVyRi9yVVNFQTBM?=
 =?utf-8?B?a2p2UlhzR005UjllSk9lTnc2NlhWRk9KR210ZDRQci9SNXA2RXk2Q2dTWS84?=
 =?utf-8?B?K2RGZENlVFJ3SXhEUDI1L05FcVcxTFNWQWVreXg1Q0tVMkxUNldGNEY0SHls?=
 =?utf-8?B?RHBtQ2tMQkNXdGw5eXVKcjlVeHVFcG1ycVU1NmlyYnRqQmZXc2FYUGtld1ls?=
 =?utf-8?B?dkE2RUc3MmtWcWJMS1JrY1VsNlhnZkhsTVI1NlBncjd5ekdUMDVIb0VyQ25X?=
 =?utf-8?B?Sy9iL1llcFBid3Z2VzVoc2M0RFA0aDhLQVUyUHBXU2E3UVdpaUo2bDJ4bmJq?=
 =?utf-8?B?b3lqSkI3VmtZMlNkejgwdUg0VlJuVWdCdjRLcjU1MThPbm5VM2Z5RnpkOTdO?=
 =?utf-8?B?UWZ3RGZrbngyVWE4YnoxK2IrWDg3WXNxZFY5S2EvOFBObWN1K2cxMjVsTFFy?=
 =?utf-8?B?YlRPZ0llemJEQm9Qa3Axdy84dEZMYTBGcHpSVTZkMEdyMnBmOGZQYzlBMlBs?=
 =?utf-8?B?UFJtcnNzemN5VlAwYjNmOTFmNWlTckpneVBISWc5TTF6MmtOYzE0b3p0OUJy?=
 =?utf-8?B?c0ZKZm1GMWJ0U3ZJOENId1A5SEVHak5QSnJId0tKT3ErNHNLMldBN3AyeGF6?=
 =?utf-8?B?M1JQSmc2Z1MzYXRMZXZrdVp3Z2ozNGd4bFRRelFOTUJnV2luSWlsZ29SVkFp?=
 =?utf-8?B?dkV5UWNpVndGeHZ5d0ZNSnNBc1pmcWxyd1dYOHQ1b0lHZjBuM2IvYkpuWFNn?=
 =?utf-8?B?RlA0aDFvUSswYWtHc0o4NVFteHhyYngzVTFkSFFkaE11Y01BSkM2UnYrQlNv?=
 =?utf-8?B?NlZuWVMxWXVBQkc5MmUySXBDOGJZVUNReG55SDNSbzJRa0Q2OG9aOXEwSmdK?=
 =?utf-8?B?THdtRWxnNFcvZ3U5MENwMWhDTmZhZW12RCtwUkc3bnJCUmYvc0I2MVFKUnZR?=
 =?utf-8?B?U2x4UU0xekRlc3BnQXFVYndva3BFb3pROUNIdlJUeW5ZZEZCazNER1dTbkJC?=
 =?utf-8?B?eURvcmRlNDVqRG0zc3lxY1lMK1pVb044QkZFSFZrSXJIdTZhSFpLU2kxRnYw?=
 =?utf-8?B?ZDEvbWUrbzZMV2dIWTFoazNacmFGdHk5b21BaFdKQlJTM2Zxbk40dENYRm5R?=
 =?utf-8?B?TmtkV3huek91UXVsNk5SR0RrV1k0WE5Mak40N0ZBUFBlYUIxNkRubERrUG1s?=
 =?utf-8?B?L01Ubmxna1ZKSTQ1NG5NQ2QzdTZDcmVhSm9RTUFhZGpQNUloYm5NQjNLejIz?=
 =?utf-8?B?cUNhY2NSLzRjTGxMdWcrTEptRGpqbUVZdGpYMEJtbkltYmpUMzJDeUFBK3Zj?=
 =?utf-8?B?SEZKZjdzUldTbEMvZk05eldnTXU1Qzd4UFJPZ2tOSy9VeTdDTEYyM01JT1RQ?=
 =?utf-8?B?VnUxV2FWeloyN1hHZmt1NERFc0NnNCtaQWlnNy9ET1cvV1JHeSthUFd3WnFJ?=
 =?utf-8?B?blVJcEI5YzQvQnIvNXF6WEhwMEFpR0JyQ2ZGY0U3WllxVW44SUsyMkRWSXZY?=
 =?utf-8?B?d3lQclpYWTRMQjhkdW5SRldPSWxibXBjbGZJbXlKcEJ2UVpPcDhSbjVDa0pI?=
 =?utf-8?B?M09DRk92cTJLSERQWU5HSzF6WjZPMkQrWVpFWDk3VHR6R21JV3Ntc3VDWld0?=
 =?utf-8?B?VGdmdkFkVjFhSmFmeFZXb3V2QTFjMlR3NVAyclpqbFlObEVROHN6bVF4cEVm?=
 =?utf-8?B?QlR1ZVM5SUhCWUFNS0NCNE1aRkw2VEdNVngzN2FKS2gxSnRVRkg2WjVlbzRJ?=
 =?utf-8?B?OUFrVCtEUi9uVlh4dHFZSlBacCtLR3lnRWpQVmNpM0N0ZE9SZzJMbloyVHlq?=
 =?utf-8?B?cVhodVAxOFphNlR2WDlCTmNZYUdRM3dVbUdnQlN3ajhQbVBZdjVFQjhIYW5S?=
 =?utf-8?B?SnBKWWN1NFN6TDJ0dllxZUU0Nyt2akYyWmd3N3NCV3M2ZnMwTEdSalowSHd5?=
 =?utf-8?B?WU40R1Z1TlBBRkU1NUJzU0JGMWhkL0hWcmNxclFZTDlET3BVMDFGMW1MWVBO?=
 =?utf-8?B?TWFjTXc2N2szOGJmSzNQck8xNDFETW5HSDFTb3pPMTNuemZyUzkrWnZacHFu?=
 =?utf-8?B?NTNXN0loRHI2Z2VvdDA2TDlWRW1GMHpjNVBzTTl5N0ZiMG1ycW0yTXMyZFlP?=
 =?utf-8?B?RjJvdHVXcmpXc2puMEkvQjJiWm1VTzB1bFpMVkhvTDlQU0pzVEVFOWVMbk91?=
 =?utf-8?B?MWNOVHVqNU56YUpwV040U3FVQWtZOWRGdWxZMzZpWnIrY1pPSDFhVExEaGxJ?=
 =?utf-8?B?ZWlxK0I2WTA5WkRQdmhaQkx5dDN4ZFRyallNRFFYOTRrc0tiMURGQ1Q4QzZP?=
 =?utf-8?Q?FmGAvfAwSnDvIlEA33VDBbpdP2NL0oBmXdlsGvf9b37wD?=
X-MS-Exchange-AntiSpam-MessageData-1: gEzF6ZPyVM72fQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967c3859-255a-4287-ff37-08df0cbc61c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 08:45:34.5580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDczUTuI78iuXRD7ZjGQ6tOfn9nGcgyvk9AH/BZesM6NK9ZT/aqMnW+bSX2ye8aOc+g9r68/ttZ9FHic3gYAOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6097

On Fri Sep 4, 2026 at 12:21 AM JST, Gary Guo wrote:
> We have a lot of helper const functions which are intended to be used
> during const evaluation only and runtime calls should not be generated. A=
dd
> a macro to denote this explicitly. This is similar to C++'s consteval
> keyword.
>
> Convert device_id.rs as an example.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/build_error.rs       |  7 +++++++
>  rust/kernel/const_eval.rs |  9 +++++++++
>  rust/kernel/device_id.rs  |  4 ++++
>  rust/kernel/lib.rs        |  1 +
>  rust/macros/const_eval.rs | 24 ++++++++++++++++++++++++
>  rust/macros/lib.rs        | 21 +++++++++++++++++++++
>  6 files changed, 66 insertions(+)
>
> diff --git a/rust/build_error.rs b/rust/build_error.rs
> index fa24eeef9929..b7ef80596f1f 100644
> --- a/rust/build_error.rs
> +++ b/rust/build_error.rs
> @@ -29,3 +29,10 @@
>  pub const fn build_error(msg: &'static str) -> ! {
>      panic!("{}", msg);
>  }
> +
> +/// Assert that the code is in const evaluation.
> +///
> +/// Triggers a build error if called at runtime.
> +#[inline(never)]
> +#[export_name =3D "rust_const_eval_called_at_runtime"]
> +pub const fn assert_in_const_eval() {}

IIUC if RUST_BUILD_ASSERT_ALLOW=3Dy then this will not cause a build error
anything built-in. I don't expect the call will ever fail to be
eliminated by link time here, so isn't it better to not use the same
mechanism affected by RUST_BUILD_ASSERT_ALLOW=3Dy here? Guess you would
need to make a new file for this.

> diff --git a/rust/kernel/const_eval.rs b/rust/kernel/const_eval.rs
> new file mode 100644
> index 000000000000..f1b79d82549d
> --- /dev/null
> +++ b/rust/kernel/const_eval.rs
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Utilities for const evaluation.
> +
> +#[doc(inline)]
> +pub use build_error::assert_in_const_eval;
> +
> +#[doc(inline)]
> +pub use macros::const_eval_only;
> diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> index c81fca5b4986..dad9cadaeb1b 100644
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@ -10,6 +10,8 @@
>      mem::MaybeUninit, //
>  };
> =20
> +use crate::const_eval::const_eval_only;

I am used to C++ so #[consteval] looks nicer to me (same with Miguel)
but no idea if that means it's better. Just another datapoint.

> +
>  /// Marker trait to indicate a Rust device ID type represents a correspo=
nding C device ID type.
>  ///
>  /// This is meant to be implemented by buses/subsystems so that they can=
 use [`IdTable`] to
> @@ -108,6 +110,7 @@ impl<T: RawDeviceId + RawDeviceIdIndex, U: 'static, c=
onst N: usize> IdArray<T, U
>      /// Creates a new instance of the array.
>      ///
>      /// The contents are derived from the given identifiers and context =
information.
> +    #[const_eval_only]
>      pub const fn new(ids: [(T, &'static U); N]) -> Self {
>          let mut raw_ids =3D [const { MaybeUninit::<T::RawType>::uninit()=
 }; N];
> =20
> @@ -144,6 +147,7 @@ impl<T: RawDeviceId, const N: usize> IdArray<T, (), N=
> {
>      ///
>      /// The contents are derived from the given identifiers and context =
information.
>      /// If the device implements [`RawDeviceIdIndex`], consider using [`=
IdArray::new`] instead.
> +    #[const_eval_only]
>      pub const fn new_without_index(ids: [T; N]) -> Self {
>          // SAFETY: `T` is layout-wise compatible with `T::RawType`, so i=
s the array of them.
>          let raw_ids: [MaybeUninit<T::RawType>; N] =3D unsafe { core::mem=
::transmute_copy(&ids) };
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4d5c96ddc49c..d9ed25e96ff3 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -57,6 +57,7 @@
>  pub mod clk;
>  #[cfg(CONFIG_CONFIGFS_FS)]
>  pub mod configfs;
> +pub mod const_eval;
>  pub mod cpu;
>  #[cfg(CONFIG_CPU_FREQ)]
>  pub mod cpufreq;
> diff --git a/rust/macros/const_eval.rs b/rust/macros/const_eval.rs
> new file mode 100644
> index 000000000000..0664888d3b38
> --- /dev/null
> +++ b/rust/macros/const_eval.rs
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use proc_macro2::TokenStream;
> +use quote::ToTokens;
> +use syn::{
> +    parse_quote,
> +    ItemFn, //
> +};
> +
> +pub(crate) fn const_eval_only(mut input: ItemFn) -> TokenStream {
> +    // Prevent code generation as the function is for const evaluation o=
nly.
> +    input.attrs.push(parse_quote!(
> +        #[inline(always)]
> +    ));
> +
> +    input.block.stmts.insert(
> +        0,
> +        parse_quote!(
> +            ::kernel::const_eval::assert_in_const_eval();
> +        ),
> +    );
> +
> +    input.into_token_stream()
> +}
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 24f96feaeb34..e47a8c35ccff 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -15,6 +15,7 @@
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_SPAN_FILE), feature(proc_macro_span))]
> =20
>  mod concat_idents;
> +mod const_eval;
>  mod export;
>  mod fmt;
>  mod for_lt;
> @@ -338,6 +339,26 @@ pub fn concat_idents(input: TokenStream) -> TokenStr=
eam {
>      concat_idents::concat_idents(parse_macro_input!(input)).into()
>  }
> =20
> +/// Mark a function as usable from const evaluation only.
> +///
> +/// Build will fail if the function is used for runtime code.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// #[const_eval_only]
> +/// const fn call_for_const_eval_only() {
> +///     // This code will be executed only during const eval!
> +/// }
> +///
> +/// const _: () =3D call_for_const_eval_only();
> +/// ```

Looks like `make rusttest` fails here?

> +#[proc_macro_attribute]
> +pub fn const_eval_only(attr: TokenStream, input: TokenStream) -> TokenSt=
ream {
> +    parse_macro_input!(attr as syn::parse::Nothing);
> +    const_eval::const_eval_only(parse_macro_input!(input)).into()
> +}
> +
>  /// Paste identifiers together.
>  ///
>  /// Within the `paste!` macro, identifiers inside `[<` and `>]` are conc=
atenated together to form a

I think this is a useful thing to add! Thanks~
