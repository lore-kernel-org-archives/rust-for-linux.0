Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B1E3346A8;
	Thu,  2 Apr 2026 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140422; cv=fail; b=k3w4RlV7nY+JFADRogYv7UYK2FpZ+tG6c3Iy+sjz1rYMEdVxd+su87+PKBaBXAW9DyU2dDrjq/kLLVti7N0WyOKTgVtwKBvln9J4vJaT/1kBhOgDjEJQHIxzA1Ed2109knD3f8DFMMjfEwqduS49GFFlFjzy1gkPRZ16msEfRfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140422; c=relaxed/simple;
	bh=o11PTlGCeHXV+IU3jrtuZZgomGXMGAxlWiFPu0k+0us=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A98GhC5h0bkE4Kp2zzs/eiH7yFLrQy8C1Tj1RzKNrVhP4pjn1jMI0SULkTE2Bz19nkE006hrkFN7Og4pR7Eh3rPSe38+GGI9q19KzjeSP9wNSJqEDTdT2b1ugtm+zj7p+XPoJZJ4pENqVCqmZ27eeSTXkwoL3DVAhkzT5d+U9Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OZ4Vc2Ji; arc=fail smtp.client-ip=40.93.196.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OZ4Vc2Ji"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePZBe0+KZTPmo9sMLsbsOXb+WguC+LWGB4P1MLAw5tgp/JI++MgWOIqvei1SoMBMMC3GFz2vbYlm379PxW1a4+lGfX+OjpOUilujvc3yJ0zA05NjIZG09ZmvOCKP0tokR3KO/vddvCCOkxQZqgxBycgeMBnS6S8FD8T5GioDTdHN8UEHlgpp0c303yB1wn4SWKU0b+e84q8lNuxXSIirK70KsM0GlbuBYgyefLeaAl5CXDzpUNO0EyeGXl2YbnBlY0xexH8ER2RmN+actGubtVAMfA1hUQsCgdd4O8IYYekinkyHv3SHaWosJXsaZeALLi8eNqC1IH8bmMUrDhU93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMj+i/O6svh0u6OT3xlVNtfLCUD7FjE7bQgMf0QFmbs=;
 b=Lh9+cH5vQOetoesky7pv9YwAAjboUiLXMlNFlfzUDghiVXJk5m4pRRv2a4yZghv3vcSY4Xw9iJF9wyrW3kj1pX/mOL0E93mP9V+x7NHoDh4cB4EG01fmY83r4I8nMeI9IzW0nw/o8BBM6kaGVKZD1o+EKj1/i6SvcXDnZftMdvl11RuKJ39Sxv+l84AKz7rJE9JSSt+sfBduoXksotvGQoU+vPokLTfolrrwoZ/ENM//JZyFF69Hr+6znJCsEfiYqmpnNRLKfs49olsD9TF3U/Q3cgwQSCKUNYMXPfwcRAxtBi2JE8y/QrZugTVH8utpwPhpoWonSswE0fmXGROsjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMj+i/O6svh0u6OT3xlVNtfLCUD7FjE7bQgMf0QFmbs=;
 b=OZ4Vc2JiJ9ABUh/107EOUppu8vT7fah+qvdVHNC1MN8Aequ6Qx794LjdA2qG2V4LNUeUmj2WWt40oMGE/GhRR9X4kS30K6WXqg11zZWeisaDY+RNze/idyOMfiedVoaOYwHhDc+tnxJsDH/AMs3Wh5SwGqHMMNL93s1LGDL3UBZ4Nbbyll2rREtNsjYMNlhaAlt7kNYoNmF3Xml23W21vqrlmnR5htV0vVf507entvsHwNTJmj8xxjp3ldEb6lro6q48z/PaN8lFLPXQBgqUm1BIqFE29KGB6OAwptREcHGd7uKshBr6m1M6HACq3PkhPLP+qXw8lVDe5z1co1uglw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Thu, 2 Apr 2026 14:33:33 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9769.014; Thu, 2 Apr 2026
 14:33:33 +0000
Message-ID: <b1c23169-9368-4ec5-98f9-f73fe8128305@nvidia.com>
Date: Thu, 2 Apr 2026 10:33:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpu: nova-core: use SizeConstants trait for u64
 size constants
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma
 <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260401222743.148710-1-jhubbard@nvidia.com>
 <20260401222743.148710-3-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260401222743.148710-3-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LV3P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::10) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ded139-1227-403f-4e3d-08de90c4d147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Oolt4L8nq9kwLY+F2v1l4lKSfLwpcuc8xudN3+LKH9t1j1A4SyZ2mQP1odpdxarwDL6KGFx+E/Scm1DcQ6fCPM04e77ZEI/5Wor1SOxgXCLIQvsARvfJanN7NywY+oex1etin0uPze9YtCHl9Oy8i05E4aomMB55MKkitH40jNVjOc24L8iTHt3sO8+3BV5xwwStYpSteZ88uaOLkac2sOx32FeZQPOBSjxZtvtbKakgQEvtZ5wFF3UsKcnwb+B8u8Y0I0dslAnKBIguNGUh+0p6uLcHgJQL22YKo/27UO4CqGmXOrnNppYt3rorLmtgKDN3xHWashNfp5enB+3Sp9jga5B5GP/Dc40Gvyx4W41v2SkUXrHXloTZ06o0g0NdlEI5PjeTwATpypRDtro3aCBL+oZ+5QJ/45yrWL/02PZMk9qZ4p2tXmYUY2tzQhfYrOQwEOGSqdwU+NnI2uxb/HmPBo4fN/wnNGoQ+EpMW0/KnQKy4xMmd/qhECtYmMLNSAOTfz2dk93l3sqMadDws7cLVw9zMDYduJHyc2/vXscb/rKzkvSAfkcsfirVNgQeLRMDdFZnNpiFx1paQ96v9ZIlcMsXEBgwdQMu6jatsAHYwSKTUyiRtFqU0WFLxCQYAfzRWQoYRLsAz8V/YwJ4QD28iVvzNPkta9+pcGjUKO5HcZ5EEuIXgZITQkN6AhRbg3AcmhtRx2gyHSuD2Nw51dy9/PKv5JtU7vmuSP8zwVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWN4TTdVT2xQWVM2b0ozR3ErU2RoRys1dFkrT2locStJVGpxYzBDaVVsZUhv?=
 =?utf-8?B?blgwMjhhdURFT2wwK213dGV3TVRnOUFwNmV1VVV2dUdZYzdQVGNZSEFTdnFp?=
 =?utf-8?B?VmhLRGg1ci9yY3Z3N0hpeCswSWY1QVdEK3NWVnJQakhPU3BlUFpOazRBTUxv?=
 =?utf-8?B?cjNTRUFwQlB3TDkrSlJqZ1U0K1NETW05NmNjN1Z1cFFVUWVBWVJCL1BPTk9M?=
 =?utf-8?B?N1podzdFdDBzd3E2RnJ3MlJaN3FQL1ZibDQ2bGVydFVFL0pWYWZBUXBEOG9W?=
 =?utf-8?B?czQ1TFVwMjZSdXlaZDBzUkNzS1ZleXVTd1FWNjRESXFTNjhyWW1RTE9hS21B?=
 =?utf-8?B?djJZMUJIajNNZkU3UklpSEJJblZQUG9hcmplT0U3R0JEUy9semtVcmZ5S1g1?=
 =?utf-8?B?aUZNVnVQL1FSSTdYRnJqeXJRTTJTYWhtUXpuYW5HUVg2cGtlWmxmb09lbzlu?=
 =?utf-8?B?RUlaOHU5TldQbmdVZW54Yll4QnBhUmhRazI5WU1xUUlqS3JWL1hEOStkVy9y?=
 =?utf-8?B?QTlmRXBxQ0xGYVd1WkRyakZCZ3ZtOVY1SVhmMVhtS2lnV1dlOTMrdTZEdE9P?=
 =?utf-8?B?TlhEbnRhN1dFTjlhcXVIaEFDZjJsU3RiSlpYaUNhTFdmL3p2c0JqNFRjUXVw?=
 =?utf-8?B?akFQdGVCRDJwR0xnMnFic1FlUmxadUprK3ZVcXVIOGhKV1ZsQ0dRUmt2MWJu?=
 =?utf-8?B?dC9WeStxODV3Smxic3BwMjFrU2NxSDZOMUxqOEowa1VFbXBveUdDWHhNSnFw?=
 =?utf-8?B?R21qZFNMLytJbUF0SHhnb1JPRHhtSnNFSXplaVVRSGtXTmlhbHQ2aEhJOFdX?=
 =?utf-8?B?dURRdzdOTDZtbzdPVS9QWGREUWVpTEFRQVRSeS94NkpqVGM2M3BTQmhJSldW?=
 =?utf-8?B?bXhYcVBiclJjMFpVbFJnaWZyNFdXYnJTTDRKTTNuSk1LT1pqMWVYNE1rSVBw?=
 =?utf-8?B?YzljOHlpaVlGaHZJM25tblRqeEpqYzBTQTdzNjE3Qm9nOXNacStwRmlicUdn?=
 =?utf-8?B?aEI1eEhGeGtnMVErcUpuOFVFVC9BcG1lTktPQkJVWFNadElqWU1TdEx5aGJs?=
 =?utf-8?B?aDVmVnNFeVh3Z1NkNlVJdnBYRlVPQ3dGMytvRXdKUGcrMGVMQWs5L20xNHp5?=
 =?utf-8?B?N21mZ0JWejF1SytrUGxac0JwOE5nU3N2ODJuOUtDcTl0T1hSWWtvd0NtQXlM?=
 =?utf-8?B?R25nRmdDOEhXbzhKL1RqSi9ybzQyUmtkTnpjTTg0LzZ1aU1veFArbk84aHdj?=
 =?utf-8?B?TGFpdUdjM2JpVDFnWDM1bWd5RHdsREluUEh5OVBnVU5ySTB4LzVPRUlPdmlU?=
 =?utf-8?B?L2V2bkdBSDN4Q0pDaFgxVzMvZnJpbWl6NWVZSmNSSU9hdUY3VXhTTC92YmM4?=
 =?utf-8?B?VnRoVG91MFNVY29XTGlCVVlOYUVYazBjVyt0eitwSVhnamUzZXlVZjMySXpt?=
 =?utf-8?B?WDNnN2k1dUgzampuK1hxSnlia2VrY2xiVGFmNTF0bHdFaFhKdEprWlA0bnB6?=
 =?utf-8?B?blF6bTNyYmhBM2pueks2cTMvaGt6TzdTTzhyRkt0NWVXV24yTG9ZZHd4Rllh?=
 =?utf-8?B?R3FqZUJaU1h5cjZCZGxTUkJ0d0srakZ3UldsUUgzSWswT3NYOEV0b0tCTjBK?=
 =?utf-8?B?Q1RKc1RobVR6RVdmQ3l2MjNBWmVVWkl1WThycDlxcEk2R3VRM2ZuUHg3bi9F?=
 =?utf-8?B?UXhxQzBiRUFxR2dTNHJVL3ZNZ25FdCtibVFQMWk0UXp6aU5zai9oVkt1UUhY?=
 =?utf-8?B?U1ppZlliN1VnNmx1ZktIMVIxa2hiNkxqYUhhcjdzdHpGSHdDWVFNOURBMVZr?=
 =?utf-8?B?dUs5aWRCZVR5S01SUU1reC9hYm1lM2tuMkRyUUFlNzhFREVHdUUvY2FSNGcr?=
 =?utf-8?B?MlU5ZVpuN01jcnhtUWdubEFYVHNoa3hFOG5WRUxxcVVUY3B2RnNHZnpOOG1h?=
 =?utf-8?B?d0VjSDBKc2hFTXVhZ29pT25yelNnTCt6bHFFZmFXUWpNZGExQW9YQTQydHEv?=
 =?utf-8?B?VFZOK3hLZ09tNk1CNHhUbWVnODJGRXJ1bUptT3JKSkNuU3ptRGN6QmtiRkhh?=
 =?utf-8?B?dDB1cjdhMlFkZzlkMDdWcXJ2UThCY05iS1NzcjJ0WncxcFkwTndCbGxwSnlF?=
 =?utf-8?B?UVJ5Y3NHRFR2YWsrZDBIOTdGR3ZzOEhoTnYvUVhqRElnbnBGMmp4TFlTWjFT?=
 =?utf-8?B?aHljRDhOTGRLbXZXV21Kc1pqcDd4enNYN0EzRDR0N216UEFTMWFpT0U0NVNS?=
 =?utf-8?B?TEhnNmtWRW5PS2MwbkVQTXNnbThPNU5WVW5MM1R6VDNPeGd6SWxUbjRrd0Za?=
 =?utf-8?B?d1YwQkdsUU9XVXI1cXpDZWJ5V1FpdWVyL0czekl6ZVVndlU4UHpSZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ded139-1227-403f-4e3d-08de90c4d147
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:33:33.3803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzaLOrfe6yNY/7RDe3Kx30yvq7enNhevOrc5lmIX4wwjh889SpkECB0+QKFo4MHDrSoxRM16oAuwLni8hbfZaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202



On 4/1/2026 6:27 PM, John Hubbard wrote:
> Replace manual usize-to-u64 conversions of SZ_* constants with the
> SizeConstants trait's associated constants on u64. With the
> SizeConstants trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M)
> and similar.
> 
> This removes several now-unused imports: usize_as_u64, FromSafeCast,
> and individual SZ_* type-level constants.
> 
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

I am very happy to see this series since I have these issues with mm
patches quite a bit, which this series will resolve. Should I update the
nova mm series to use these, or wait for it to be merged? The issue with
updating the nova mm series is, then I'll have to either:

 a) carry the series as a dependency.
 b) wait for it to merge into drm-rust-next and rebase

I could do a) and add a [REFERENCE] prefix to the patches, similar to how I
did for some drm buddy bindings patches. Thoughts?

thanks,

--
Joel Fernandes

> ---
>  drivers/gpu/nova-core/fb.rs     | 21 +++++++++------------
>  drivers/gpu/nova-core/gsp/fw.rs | 15 +++++++--------
>  drivers/gpu/nova-core/regs.rs   |  7 +++----
>  3 files changed, 19 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index bdd5eed760e1..5c304fc03467 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -24,11 +24,8 @@
>      firmware::gsp::GspFirmware,
>      gpu::Chipset,
>      gsp,
> -    num::{
> -        usize_as_u64,
> -        FromSafeCast, //
> -    },
> -    regs,
> +    num::FromSafeCast,
> +    regs, //
>  };
>  
>  mod hal;
> @@ -127,8 +124,8 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>          if f.alternate() {
>              let size = self.len();
>  
> -            if size < usize_as_u64(SZ_1M) {
> -                let size_kib = size / usize_as_u64(SZ_1K);
> +            if size < u64::SZ_1M {
> +                let size_kib = size / u64::SZ_1K;
>                  f.write_fmt(fmt!(
>                      "{:#x}..{:#x} ({} KiB)",
>                      self.0.start,
> @@ -136,7 +133,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>                      size_kib
>                  ))
>              } else {
> -                let size_mib = size / usize_as_u64(SZ_1M);
> +                let size_mib = size / u64::SZ_1M;
>                  f.write_fmt(fmt!(
>                      "{:#x}..{:#x} ({} MiB)",
>                      self.0.start,
> @@ -186,7 +183,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
>  
>          let vga_workspace = {
>              let vga_base = {
> -                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
> +                const NV_PRAMIN_SIZE: u64 = u64::SZ_1M;
>                  let base = fb.end - NV_PRAMIN_SIZE;
>  
>                  if hal.supports_display(bar) {
> @@ -196,7 +193,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
>                      {
>                          Some(addr) => {
>                              if addr < base {
> -                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
> +                                const VBIOS_WORKSPACE_SIZE: u64 = u64::SZ_128K;
>  
>                                  // Point workspace address to end of framebuffer.
>                                  fb.end - VBIOS_WORKSPACE_SIZE
> @@ -216,7 +213,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
>  
>          let frts = {
>              const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
> -            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
> +            const FRTS_SIZE: u64 = u64::SZ_1M;
>              let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
>  
>              FbRange(frts_base..frts_base + FRTS_SIZE)
> @@ -256,7 +253,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
>          };
>  
>          let heap = {
> -            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
> +            const HEAP_SIZE: u64 = u64::SZ_1M;
>  
>              FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
>          };
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> index 0c8a74f0e8ac..9dac3288f3a3 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -17,8 +17,8 @@
>          KnownSize, //
>      },
>      sizes::{
> -        SZ_128K,
> -        SZ_1M, //
> +        SizeConstants,
> +        SZ_128K, //
>      },
>      transmute::{
>          AsBytes,
> @@ -123,7 +123,7 @@ fn client_alloc_size() -> u64 {
>      /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
>      /// `fb_size`.
>      fn management_overhead(fb_size: u64) -> u64 {
> -        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
> +        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
>  
>          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
>              .saturating_mul(fb_size_gb)
> @@ -145,9 +145,8 @@ impl LibosParams {
>      const LIBOS2: LibosParams = LibosParams {
>          carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
>          allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
> -            * num::usize_as_u64(SZ_1M)
> -            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
> -                * num::usize_as_u64(SZ_1M),
> +            * u64::SZ_1M
> +            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB) * u64::SZ_1M,
>      };
>  
>      /// Version 3 of the GSP LIBOS (GA102+)
> @@ -155,9 +154,9 @@ impl LibosParams {
>          carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
>          allowed_heap_size: num::u32_as_u64(
>              bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
> -        ) * num::usize_as_u64(SZ_1M)
> +        ) * u64::SZ_1M
>              ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
> -                * num::usize_as_u64(SZ_1M),
> +                * u64::SZ_1M,
>      };
>  
>      /// Returns the libos parameters corresponding to `chipset`.
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 2f171a4ff9ba..6faeed73901d 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -7,6 +7,7 @@
>          Io, //
>      },
>      prelude::*,
> +    sizes::SizeConstants,
>      time, //
>  };
>  
> @@ -30,7 +31,6 @@
>          Architecture,
>          Chipset, //
>      },
> -    num::FromSafeCast,
>  };
>  
>  // PMC
> @@ -150,8 +150,7 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>  impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
>      /// Returns the usable framebuffer size, in bytes.
>      pub(crate) fn usable_fb_size(self) -> u64 {
> -        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
> -            * u64::from_safe_cast(kernel::sizes::SZ_1M);
> +        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale())) * u64::SZ_1M;
>  
>          if self.ecc_mode_enabled() {
>              // Remove the amount of memory reserved for ECC (one per 16 units).
> @@ -241,7 +240,7 @@ pub(crate) fn completed(self) -> bool {
>  impl NV_USABLE_FB_SIZE_IN_MB {
>      /// Returns the usable framebuffer size, in bytes.
>      pub(crate) fn usable_fb_size(self) -> u64 {
> -        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
> +        u64::from(self.value()) * u64::SZ_1M
>      }
>  }
>  

