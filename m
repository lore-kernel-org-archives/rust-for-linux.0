Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190AD33C532;
	Mon, 20 Apr 2026 02:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776653575; cv=fail; b=NMIT8Xcw3NNTB8IEl14NR0Va16S+WpdKjTPqpiuva2Sl7uruumA7H19xIxnDL7i5k43Cg9JUl/CTOjNcA3J9rbvZMyAJAdZJJYJPj3r4jx2caaBTiCauMesZmcmtG7nJgb59BuBf4xzbhtwbzHln+S75/xrtZyiYAmbBBfraQsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776653575; c=relaxed/simple;
	bh=aiEqfOi9LAQTjrnzTl0ap27qJW/hJkLfGOoEM1yZgjY=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ubG1ju9oHsWwwhAwdS7YlkUwohrGue/+1Ns3q/i81IpMp+m2JRv88prucueDbzmFBYFAbYZxH6EP7LPBrMLXgrLWvlcU3g6DjEqwBoVvKPBCVxEXxf5O7N7m8jRq8ak7Jd/ns8zEJUdD830abRuMLPchxlvpw3Mnw61yGZBz9bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uiL37y4B; arc=fail smtp.client-ip=40.93.195.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uiL37y4B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+V0WiNg7zhPQGpw8VQ3RYNQ5uu/s73Y0ytvrJnpp7bkL/1lX3gg+6Ful3AqgXuwbuPTq6EE+7VuymCz2sSrCHctozZ22KYPerJLz+WS1ApJwdnJZNFI3COS8rKnYpGQSHGvF7KQgy66Ne5/VG1ggfvVaJP4pODq9SodxYde6AVz8pPoRmxALv75XIYEMYGr3hj5mlEpQfJU+744TeM8snSg7bigv6suHPonvqPdcM3Ws2fa2sn68mhDj5pGYwvB8Z5cr5eXONDgp6DRyfo7di5NZ0TvK2V8K7Er0RG3KklSQQDnlIHTd7ciU+laHODT0vT2VfsJIS8Q1vVm7xp/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLPHaqXPBCsiQXrxLGvUQp7Sc5NVdbR7Pt2Q89IjNis=;
 b=SlTyuKSk7TRwdwNPZkwKY5xu5w6/XweeuIjUp8M+q7OJBh353A6vtgHH21anI6YVMAixnPqHWw0Mt7NxaxSutSYylQMSEQgdxC4DcIkeBy6Z+radF3q9XH+USS9B6nc3ZLwtgaPTzUKWRjrhdUanhoHjYZlFqhwWioOvE0k9pYZXH04k86gDvwKMOe047mqgtVgXHPFIKm4UdyBu4T7sWTjAYrV6u0aC3pRB8vNpckdbx/XVaUGUAL5JSQo6eDJPhR723iid2twW57Gx3rN5E9oPKkuAYhO+Idg2SS1W5kunYYYPawH65WaynFmA7jYTmqVrFJmkVQwQkOUIu74HkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLPHaqXPBCsiQXrxLGvUQp7Sc5NVdbR7Pt2Q89IjNis=;
 b=uiL37y4B9pKQhDnB95gb4RdbfE67PcK2PJKy46Co1yDaagBcfX7LAcGJmRFVXgV8YoL26K1GxqOUxrTtJaGev21LU3GD9R8DUhFLsJztg2dKU2G7O05wymZNP2vmdO0CkvLpb4FHjhosMR4O8bZr/vRiMnRAYjfBTyXmmO+j2DdUjTSExMMUatvDeVJ2cOqmpKOqyi5yyeAcSK3lYWRdisBBKAtPunwpzT1T6Umwzc2B6naR9+xHF84tnK/eqU8kURaZi4YolHAi5vF2KYRh4w2RbHBEOIfmIwCHNZrnE5SzkuzCEh4xpGYXQ6RM1K2+0bAwKcISebG+ZF5lhLvHfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4451.namprd12.prod.outlook.com (2603:10b6:5:2ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 02:52:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9846.014; Mon, 20 Apr 2026
 02:52:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 11:52:38 +0900
Message-Id: <DHXN4H7HAQL6.2H006OV47SJZV@nvidia.com>
Subject: Re: [PATCH v10 24/28] gpu: nova-core: Hopper/Blackwell: larger
 non-WPR heap
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-25-jhubbard@nvidia.com>
In-Reply-To: <20260411024953.473149-25-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0P286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4451:EE_
X-MS-Office365-Filtering-Correlation-Id: 83edef7b-aaff-4b9e-fe30-08de9e87e4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7/WrJx7awIQyssT191v4tvTAXb48Tpwcn+cAGsGbC59RHwicDLZeamJFCmkYCuO+lqksJzpthSIC8Kj8r7xyer/bJPZudt+MbIyoyXD237qaC7T9rJakM4a6pYv2kDvGZ1JIZV8+mNi4SgSZyL433oPqlhulUC/fSBstJ8epjT6gRhg/fY0uEJSpWrRB7ytk4CfLk5P1YxVlHiuugSdIdIOGQECu/r8vCfZyalmG1GFrab7l2PCV8M3btqNi8QHRjzZlmKl3s9o1fmeek4MJbWkBjQURy0TZSppG8LlrmTEi+L/95ysaJEUuYRzgXyRC5HD1W0gROMxdMjWpv9//enAecV55LAj9z/ePZ94KHZyHib36spzlIvnN5ECV/l3j5w38si1KvtskTxobdYtED+dkywStgeK7XqV0fFuoIUqSScxlZyrKo8DOlKjBmILB8LwuiwTGxBO6Lz5/MUB4WuJqRJ1er/PhDHfhTlbX23amM9CgTvCzQhumR6uaFG1mg15sTTT5JhpIu0fZDhURt9wdhkUuCLebNg7qlLrfsDZS33xGc8hny0so+ffdDXGyc21X1r+PoeUohONNw8EbDfWQwDpQlWQNtUGGLa+Fr6Yg22ogGxmPHdxXF0x99Az4njdBZpKNhabbTOa47Uw2afUmMs04gh7UHDHrVaxnDYmy5FVvwJsLE5e64GGLoV8gXp9DhqeJRm/gW+9yQVyuahRyh3xKtgn+6fg7CUqfpRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlBSNzZXNEJaZTVucXduOGpZSmM1SHhJQ0NncnBvMGZkTDd2S2FNL2lHeWI0?=
 =?utf-8?B?QS80RWJNL1lDREIweEM5eGorVDdQWmlCeHVBWnRjNDBnemdVQmZLSndYdCtr?=
 =?utf-8?B?anBNZ1lRNEVtR3B3TXJpTzJ1dTI2WndwSXJzRUc1VytvK2VRSlhEK3dkMU5k?=
 =?utf-8?B?aFNyTWQrcWNEak9FYzFaS0EvR1FLZ1R6aEhlM3drWExibjYrRHFISUZtLzhl?=
 =?utf-8?B?aHhDekhwRXc4U0lFYWZIbEUvUDV1aEd4QlIxMHBYdXlRcDlpaENCTDlrODlm?=
 =?utf-8?B?RE1lc1pFaXpDWVdGdlEvMWlHN1l1ckJ3RG9ENEpFWjN4MnRCRm1QeUEzby9G?=
 =?utf-8?B?RTQ0U1orbDFvNFJJRGFrZzZxRkZvdnl2enZvZzNEOXcySWMwU2Z3LzEwWWxo?=
 =?utf-8?B?U1RCYXJIdkVkWXFIVFVIS1ZNT2p2SzUveU9UWmZXMEQxUnRsek44VlJTZE5t?=
 =?utf-8?B?Sjh4K0JhbnF3bkFwczh0aW9ZaWltRFZFY1l3VGloUW1PYUllaWtxdnd0eTFN?=
 =?utf-8?B?aHd6eXQwYis0T08rTjF0YVNQQVdDTHpuWmwxd2w1TFJNVlRQTHZDUmN6V3FE?=
 =?utf-8?B?VEVwRTY1bzgwa3JHQzkzd05HSk1QaFVPamQ5VDVtcUs3MkdGUnFyVDFuSEt4?=
 =?utf-8?B?Z2NScFp1b1hHeHFNTjBCY2I4SWJLK0RNSW9yQlhPd0NZSy9iOGE1NFl0N2pL?=
 =?utf-8?B?WlRTVFVBNDQ1dCttdUhRcVZYbU1QRXM3RVFlTEErbW9CVnVoSGZVeEJjSmFq?=
 =?utf-8?B?Wlo0eDlpcDJrRTZsRE55SGtoN1pGbXVvUzkzSm56UnQvODV1K0VEZXpuZndS?=
 =?utf-8?B?S29nUVNtdmxWSnVINmdLYWFWdlNXMEEzNlVacnk0NjEwVWhvSk5abnJyelNH?=
 =?utf-8?B?Z1EyUU9EVC82NEVNZlp4QmYrR2JaSFBLeEFucit4N3pJVUdyVGZmdElGYlVj?=
 =?utf-8?B?WVJSc2p2S1ZSaDQ0U2w2MTRiT3ZXdjQzT3diVk9DMzEyUnNKN2Nrc0N1R25M?=
 =?utf-8?B?SllPeHZsZlp0MVBtNnZMeS9QQzNXSUpCempJTTBmRjlsWG02djFXa0JKSThF?=
 =?utf-8?B?dkF4M2llWkMvRHdqRXhVejA1ZUtXbTVGL3o1eDd6aHM0b2ZIN201aStIUzJH?=
 =?utf-8?B?UkRjeGlEYXo5UzZvWnJCZDJGOTRHa3ZKV0RzdHRFTGlaMkoxb1lQVkxMbTRV?=
 =?utf-8?B?dVd1T080Z1FFQnNDc04rUmorVDNlV2lJUnR5czJDWEhSalBwY01ycnViQ3lp?=
 =?utf-8?B?YVRybUI4akd0N0twdVNtZ3FPTWJpY0M4ZFRDaWYxVkNpeEMyTnN0Z3NUNGRR?=
 =?utf-8?B?R2RjRlpEQzZTNFljTmQ2eEJmSjZTVDl0aFhqNDgvMjdsR0ZrUVNmRXYyV0FV?=
 =?utf-8?B?eitUN2pRbVRuTnJSbG5OcW5JOEJPMVF2dzhzNjloOXJUSkhkQXJEeUlxVzdy?=
 =?utf-8?B?K3dPdEVMWDEyT294L0Nybzh1V2tUUlVmd1kveDlWYklFdmhwUzBINXVBNEwz?=
 =?utf-8?B?enlwakpyemZxbnNSd1FzVG90R1czQ1VxbEpRL0hSNXI3ejd3c0JPeDMyS1Uw?=
 =?utf-8?B?UVlLc1AvOTE3aklFdXRwSzBlK1lxeFpVS2dWLzN1bmRRc3Vjc1NMWk81c0Vm?=
 =?utf-8?B?TGsxNnY3STd5QXR5Qlc5cWVmSjVUWFQwcGF5N3d1QS9xK1hTTE9PeXJsT25D?=
 =?utf-8?B?TWhVS04wTWI0SGxKcytselAvNzVBeTRFWW81RlNOQ3hyRGppdHhkZnkwcDcw?=
 =?utf-8?B?OUF0SkxUaVpMZnErVHZXK0NOT0t4dThUTU0xTEg2a1dmRjAwVkJjMkYzdUIz?=
 =?utf-8?B?dzUwTlJBZ0dZNk1QMDNwS1MwYzNIaVMzQ0YxTDhEQlJXWGlaQWhHSzZGU0N6?=
 =?utf-8?B?U0RVYUJsS3VPL0dxMlpDTnJ1d2t2dTNzVDNveXlMNWd1RnF3WWQydDc3cjZ5?=
 =?utf-8?B?ak0zbzE0TVZ2TE4zSjR4RGFzOTJ5TndrTnZyaEtvZmxBcC9pQmNmK1F0SlBr?=
 =?utf-8?B?Sk5vWm9GOGhOK2JrYkJkSUNrSFdZYmF4NE8xT0pzTWJTUEdvRVZYWHVqbXhH?=
 =?utf-8?B?cFZURkYyMktrZFErWDd5Sm9CME5FOGRhRUYxc2ZiMmxYYS9pcC9qSE1MV3d4?=
 =?utf-8?B?eForcFVZVmZqWDJHZGRJak0yWXJadnlkUk01dlVYdStXcHFVZjBHZDlEak5R?=
 =?utf-8?B?K3oxMTZ2b1hqOVBIVWpaSXBlTmZROEozUTh0Z28rQjZPUFRjY1VVUW90Q2RE?=
 =?utf-8?B?ekVpM0JaTkNyLytKTVgzQ1R6bjY2bEpXcWtpQ0Z6ZUs5ZlBldGtBMGFjWGsx?=
 =?utf-8?B?UlZadUZGaVJHRnl0cUxSZ1l2cnQ5Z1h5dUxNRmljeGoxYllDYml0RWVQblJT?=
 =?utf-8?Q?zYgpfck08D4X3vrGS7KAq4bztuuE040ak1FNI14NtWUV0?=
X-MS-Exchange-AntiSpam-MessageData-1: BOw5k1GptlbLGg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83edef7b-aaff-4b9e-fe30-08de9e87e4ae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 02:52:43.0744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVu2az1KuIb3D8Eb3/kT74HVQFROg0vm5GctbI4PlbDJCdl9thgbh06RGSuCc/unVSToA5ZW2bSuQLf80ndLIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4451

On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> Add dedicated FB HALs for Hopper (GH100) and Blackwell (GB100) with
> architecture-specific non-WPR heap sizes. Hopper uses 2 MiB, Blackwell
> uses 2 MiB + 128 KiB. These are needed for the larger reserved memory
> regions that Hopper/Blackwell GPUs require.
>
> Also adds the non_wpr_heap_size() method to the FbHal trait, and
> the total_reserved_size field to FbLayout.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Let's move this patch earlier in the series, e.g. right after "new
location for PCI config mirror".

This will keep all the architecture setup/non-messaging patches
together, and keep the more complex message queue ones at the end,
forming a more logical flow and letting us merge these ones first
(hopefully reducing the series to just the FSP messaging patches soon).

> ---
>  drivers/gpu/nova-core/fb.rs           | 14 +++++++---
>  drivers/gpu/nova-core/fb/hal.rs       | 19 +++++++++-----
>  drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
>  drivers/gpu/nova-core/fb/hal/gb100.rs | 38 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/fb/hal/gh100.rs | 38 +++++++++++++++++++++++++++
>  5 files changed, 101 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index c2005e4b4177..756ff283a908 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -103,6 +103,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>      }
>  }
> =20
> +/// Calculate non-WPR heap size based on chipset architecture.
> +/// This matches the logic used in FSP for consistency.
> +pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
> +    hal::fb_hal(chipset)
> +        .non_wpr_heap_size()
> +        .map(u64::from)
> +        .unwrap_or(u64::SZ_1M)
> +}

This method is only ever called in a single place (which already has the
HAL at hand), let's just inline it. The name is misleading as it doesn't
calculate anything, it just returns a fixed per-chipset value. The
comment is also not particularly informative so we won't lose much by
dropping it.

> +
>  pub(crate) struct FbRange(Range<u64>);
> =20
>  impl FbRange {
> @@ -262,9 +271,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_f=
w: &GspFirmware) -> Result<
>          };
> =20
>          let heap =3D {
> -            const HEAP_SIZE: u64 =3D u64::SZ_1M;
> -
> -            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
> +            let heap_size =3D calc_non_wpr_heap_size(chipset);
> +            FbRange(wpr2.start - heap_size..wpr2.start)
>          };
> =20
>          Ok(Self {
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index 3b3bad0feed0..478f80d640c1 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -12,6 +12,8 @@
> =20
>  mod ga100;
>  mod ga102;
> +mod gb100;
> +mod gh100;
>  mod tu102;
> =20
>  pub(crate) trait FbHal {
> @@ -28,17 +30,22 @@ pub(crate) trait FbHal {
> =20
>      /// Returns the VRAM size, in bytes.
>      fn vidmem_size(&self, bar: &Bar0) -> u64;
> +
> +    /// Returns the non-WPR heap size for GPUs that need large reserved =
memory.
> +    ///
> +    /// Returns `None` for GPUs that don't need extra reserved memory.
> +    fn non_wpr_heap_size(&self) -> Option<u32> {
> +        None
> +    }

This HAL method is bizarre.

Why return an `Option` when `0` expresses "I don't need extra memory"
just as well?

Then there's the user of this HAL defaulting to `SZ_1M` if it returned
`None`, which was the default value for `heap`. But if it returns
something else than `None`, then we just use that value for `heap`,
without adding `SZ_1M`... So what it appears to do is that it returns
the total amount of heap, except when it returns `None` in which case
the heap value should be `SZ_1M`?

If that's the case, then why not just have a `heap_size` that simply
returns the amount of heap needed (without any `Option`), and just use
that without further complications?

Please confirm whether the values returned in the HAL are actually total
heap size, and if they are, let's generalize the HAL to all GPU
generations.

>  }
> =20
>  /// Returns the HAL corresponding to `chipset`.
> -pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
> +pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {

The visibility of this method doesn't need to be changed.

>      match chipset.arch() {
>          Architecture::Turing =3D> tu102::TU102_HAL,
>          Architecture::Ampere if chipset =3D=3D Chipset::GA100 =3D> ga100=
::GA100_HAL,
> -        Architecture::Ampere =3D> ga102::GA102_HAL,
> -        Architecture::Ada
> -        | Architecture::Hopper
> -        | Architecture::BlackwellGB10x
> -        | Architecture::BlackwellGB20x =3D> ga102::GA102_HAL,
> +        Architecture::Ampere | Architecture::Ada =3D> ga102::GA102_HAL,
> +        Architecture::Hopper =3D> gh100::GH100_HAL,
> +        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x =3D>=
 gb100::GB100_HAL,
>      }
>  }
> diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-cor=
e/fb/hal/ga102.rs
> index 4b9f0f74d0e7..79c5a44f6a29 100644
> --- a/drivers/gpu/nova-core/fb/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
> @@ -11,7 +11,7 @@
>      regs, //
>  };
> =20
> -fn vidmem_size_ga102(bar: &Bar0) -> u64 {
> +pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
>      bar.read(regs::NV_USABLE_FB_SIZE_IN_MB).usable_fb_size()
>  }
> =20
> diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gb100.rs
> new file mode 100644
> index 000000000000..bead99a6ca76
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::prelude::*;
> +
> +use crate::{
> +    driver::Bar0,
> +    fb::hal::FbHal, //
> +};
> +
> +struct Gb100;
> +
> +impl FbHal for Gb100 {
> +    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
> +        super::ga100::read_sysmem_flush_page_ga100(bar)
> +    }
> +
> +    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
> +        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
> +
> +        Ok(())
> +    }
> +
> +    fn supports_display(&self, bar: &Bar0) -> bool {
> +        super::ga100::display_enabled_ga100(bar)
> +    }
> +
> +    fn vidmem_size(&self, bar: &Bar0) -> u64 {
> +        super::ga102::vidmem_size_ga102(bar)
> +    }
> +
> +    fn non_wpr_heap_size(&self) -> Option<u32> {
> +        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgsp=
CalculateFbLayout_GB100).
> +        Some(0x220000)

I could not find any function named `kgspCalculateFbLayout_GB100` in
OpenRM. There is one for GH100, but not for GB100. Also this method
computes the whole layout, the relevant one would be
`kgspGetNonWprHeapSize`.

Also I know this is a bit overkill, but let's make this a module-level
constant so other HALs can refer to it if needed.

> +    }
> +}
> +
> +const GB100: Gb100 =3D Gb100;
> +pub(super) const GB100_HAL: &dyn FbHal =3D &GB100;
> diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-cor=
e/fb/hal/gh100.rs
> new file mode 100644
> index 000000000000..32d7414e6243
> --- /dev/null
> +++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::prelude::*;
> +
> +use crate::{
> +    driver::Bar0,
> +    fb::hal::FbHal, //
> +};
> +
> +struct Gh100;
> +
> +impl FbHal for Gh100 {
> +    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
> +        super::ga100::read_sysmem_flush_page_ga100(bar)
> +    }
> +
> +    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
> +        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
> +
> +        Ok(())
> +    }
> +
> +    fn supports_display(&self, bar: &Bar0) -> bool {
> +        super::ga100::display_enabled_ga100(bar)
> +    }
> +
> +    fn vidmem_size(&self, bar: &Bar0) -> u64 {
> +        super::ga102::vidmem_size_ga102(bar)
> +    }
> +
> +    fn non_wpr_heap_size(&self) -> Option<u32> {
> +        // 2 MiB non-WPR heap for Hopper (see Open RM: kgspCalculateFbLa=
yout_GH100).

Here also let's remove the reference to `kgspCalculateFbLayout_GH100` -
it does exist as of 570.144, but has been removed in `main`.
`kgspGetNonWprHeapSize` is a more accurate reference if we need one.
