Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309740DFA5;
	Sat, 25 Apr 2026 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777130143; cv=fail; b=I6h4u2ZE6wQZvUkkPpft7XPdvQmKkt/ecyuFxEedcle38iPJOqqwiI5571Ky4w/XejHQSqk+j1lQbZRvswiuHjX8/kiyCl3YDW+gGr48C3u6SViraBX5zR3SSDuW1zDwFtyypMth+0pMIxgqLEXjIKGc1ATJD6Xtf7s+KlcgB6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777130143; c=relaxed/simple;
	bh=cItzIkiB6NBgQqk+z7FUI2nrKpz2SOWITTTT1MK2ASw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PrLzigQl+0+8l5Al2dnl41/YX7MZJDiwAcc5BnS9oqE1lMpVRUBdZqtm30ewosdp9cKfbJnTPfkaZqXcfNN0J+IyYQprBFmrzyq2hsiimTX/adegUf5EFZx5OSVQBG9a/3VVt6Dl1+ongQT3mLuWStoVN4xVmM6XBmakD8+LHCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mijLbY2f; arc=fail smtp.client-ip=52.101.61.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mijLbY2f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGksuEhxkAbA1jeDhnp84jMzswn0F8a2xLjUOu4x5pMvekSqbvmQQyOWLd1MP1j4zN1VYzBJ2pfNGmio/FBrMWFpPPGFJL8LH54oz9sIRpnk6O4wUeXQGsK8wf5vtr7+Jn7l7bRX/pBVLl42D9lngQU0fJVkAE9lZlwMTzpxgMjUaEIc+MJJvb9QAy/y9OZm0n3Rsc8ZzkD86Q7vsJDp50QYaxfk3wLUdiMtmR202YbouYKKgIKcCEEJODUkOFZpV6NlEkiFCUqtFs+NaKDotvLrD7NldViai4HI+kqA7jEADCTT+0g8SdIIwgA5tPwbanrmxtvQX4J+4b+Zr0vbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn25qgsnudxMnAwJZpQzOeYkNSlGmVQV9AhacId4Kow=;
 b=oSjCfDhjHdIX8AUvKdsjdGaWUYg6wyEJWltjDiG7Cw+cXiqKvqn+j41YL6ahoaSd8+o3w92occ7rIAhLnw+gVW8cQOt/P4D9xwkAhYEEcnUUlrInbPKDrHCr+glyY7wyqSz3WVWvjOr+QIES7W5CXG1Wmw49CA9wA41cJDKBlUgSWLbTujiEXGbniUJNaz5JrgshmkPXqigXZcH/keWbRmAXrkxXAyU0RQ+gESdBq4bWZe3uKp9Cwi3O7NO7sDVauNk3GTz64vIC/l7wiXDEs8fI+S8W1qPRtEP/h3xtphlwuX/0jQagZk8HomUwbduZn6oh9oOaTqHHikJuoaU3kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn25qgsnudxMnAwJZpQzOeYkNSlGmVQV9AhacId4Kow=;
 b=mijLbY2fwUaas8n05tEX1xTCkzZHRFNpqTee3TFE5NOnIPogaQDryG+5Tnb5x0tn5QKWp6d7WA3oVdZIcf/oKN6t69L8jRiqGPJJidQvzM+MJdro4myJOt9yrX2t3BGrOY+w+Z7hgPxK26Ujo+bA1c/OtF94lbzZfzoLJs5epl6GDVZRs8DqDpxp6YwuX+pYG/kbHQpcloQ0xEZT/IekG5Z/VqSCKpwt5kpFxItw92n7aaBJm/Bk1mYqbtR8fFP3iIFJI184mzYEZN5r2qGgTYYSHazWj1WZNcsrDbAhLh2opSA6qgIZfDiDoa1sIrJErdnnJPFDi0JThw5tzGpICg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Sat, 25 Apr
 2026 15:15:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sat, 25 Apr 2026
 15:15:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 00:15:32 +0900
Message-Id: <DI2C20BLZ28S.1BBI3HTPX8GBZ@nvidia.com>
Cc: <ojeda@kernel.org>, <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>,
 <boqun@kernel.org>, <gary@garyguo.net>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <contact@onurozkan.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: workqueue: fix SAFETY comment Arc refs in
 Pin<KBox<T>>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Sagar Taunk" <sagartaunk2@gmail.com>
References: <20260425135701.34010-1-sagartaunk2@gmail.com>
In-Reply-To: <20260425135701.34010-1-sagartaunk2@gmail.com>
X-ClientProxiedBy: OS3P301CA0052.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21c::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac284d2-a0de-4bad-fec0-08dea2dd80b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	292U3RmCwZB0e2Xj1lyP3chKTlkBaP4lJ93OhXIsFz0pOoNv5D2yHQpwBv3k/BxHQfWyC24OtCd7FsS5ln2Mqeo614DhErGh5vSnJYHjj/Aj+09pzV91P+2aCV+U2iOXRi9WNRSI+g8YASdjPbnutliSmM6vzAiWZsHUAeB9/N+hZyZFlLMDlGx6HwC9oCYYa1N3UDXwhsgnHyAUxJj9Xb8fOwd72F4h4NY4EIvmUmSdiZMxF4KxEJbVIC+HXeiKfB5dPr1WpY+pBkRGc8TFZqZRVVeKz9zwtoDtLMOUlkdi2r1AqFh4mIEZlCsEyggwReIh7zqjAWBtSPz3QSYlt3zmR4IlF3XpimfiagbRgSaZBngNfy5qTub5Ns8Z5XZR6UBbZI/SOaYSGaqT6VF6KnBgHaCrU4eNYnhcxvbsqAGR7udUBEpL3c9hSTetKl5FIULMSpUSiKO2yM+nLYGdhKr5h7gRuNkQTL/uoqLhOWhhsIfsjLbsbk/hTAURe7z4AumEdAGqCkRTlpTaC5T/dPXjWabklMVvimJh7A7P9BWiV8VIN8hG4CVWt24oD4PpYxcAf8YxtT2Zm84wdEciDiFowOaZxQuanSXtonpmm8ZfinwJOAk8+rBo+tHF4aaiC5p5eZ4380x6kLTIOaoUZU9gbPluEedTeJEU4oEzLfkuh5Mvun2YtANPqDBvpBm/P5coT0URG5+Xm64IG6ihkxyqWsRGb8YyozXscW96/p4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmF6bmQ5VXVaL2pmLzhUU05FQjBDTVJzUDU3WVgxUEFMdlNWcndZOFYyaGV1?=
 =?utf-8?B?K1p3eURBWldoaE5YaTJPbUtJUXpudzhDVHZiUTY5eHM0TllEclpzUEJsU0J5?=
 =?utf-8?B?TEdxM0FBZ3MxKzM5SExJcEwySGY1Z2RPbEpVeVBwbDBOc09GTTcrbnRlU1JX?=
 =?utf-8?B?bkNhWFltc3M2cURXNk9PcTRDM3lKR1oxT20yWjQ0TmcreTNhL1k5RlpMK0RE?=
 =?utf-8?B?YmVPSG1nenRGK0xtcXZVZXFWbTIrQ1NyZ0V3VXUvcUxERVE5bVA4UGhXOTgr?=
 =?utf-8?B?SWNLeElwdTF1TWluSUJ6RUxKa1ZDTDZLN3lDeXRSdnNHTjhqdkVtYSt4R2Nm?=
 =?utf-8?B?RmxCSGtQL2RlUWRtR200K1NMQ0IzTGJ0V1dNUDZ0RE9qeTZjVjBSSXMwaUpi?=
 =?utf-8?B?dURzK0VodXR1dGlJZXFzempjYkJpUkRIN25jbmdlSTlRS3RaOUo0RzAwaEx3?=
 =?utf-8?B?Y2dYRmxta1dSd29PUEgrQlpuUSs0TDFycmQveGdqYjRyVmVodDVabUhKd0s1?=
 =?utf-8?B?Yk11Yk9BaDdLQkFxaFFyellXalNpa2kyT2g1VWJ0cFFXaWorOWVXRzlqaEtv?=
 =?utf-8?B?Z09Rei9VRVlDREo4djNqZkNYeG82TGlYSm5UcExtVFIvWmI3eFNkWFhEOEk0?=
 =?utf-8?B?MnNWZmxjWDdKOU1RMnpXeENZaFB1R0RtTVhzM2YweDV1VUJqWjIyQTg4Ymda?=
 =?utf-8?B?N1JxNC9EY3lHdzJZUG9ieXc3WmZDWi9wU3paUGN3K1FjdGg4SmJpL2I4aVlC?=
 =?utf-8?B?V2MrRjBSc2xya1ZxZk5XeVN0Nlpuc3VFZjBlVFYyK3R0ZDhPUFR0QlhpakM2?=
 =?utf-8?B?Tk9RNzM1amU1c1JiMEJCK3lzcEpoc1diSGpxdjNoQkF5MGhiTlM1T0UrQ3Bp?=
 =?utf-8?B?eUdYWU5FQ2pLSTF2K0k0OEVOc3BaSk1OclNlbUVHa3ozNm45VS9wQzFYbW1i?=
 =?utf-8?B?cGhOVWFkVE9hRnhDeGcyUDJ5MkhYUkhQQ1UvdzNMc09HbFJXdWJSV25iQkY5?=
 =?utf-8?B?bENKWmxUMll4V215dDVYeS9qYlE5eEdxWXBZOTkzVDZtM25KcmtQR3huN3py?=
 =?utf-8?B?Q0IyeGNCc2d3M082d0wxWEViUUsybkxWaHJvVU1SblFCVmwraEJVcW53WGNO?=
 =?utf-8?B?SXlqV2tFQnZjZmtOaDNJL25aUloyNDVPb0drVFk4TTlpWldNcGR3MWowMGph?=
 =?utf-8?B?RGNrclN6dUNBdTMyZTlzNnpQWThwQ2JodHh3WjNjVWE2MWhBYkpmUG43VjF0?=
 =?utf-8?B?OC9NeVF2aE5KVnhubmRIdm5KczlOcnVtRHJsWmZaSzczZjJDQXl2MDduRnha?=
 =?utf-8?B?NEJzQldoNmdrQllWVVdpN0JWTENZaGVJN1dMUXpNSzFBaHpKVGlzWUlOTmU5?=
 =?utf-8?B?ZjV6TTlORElNc3JxN2V5bmlzL3BRT0x4bWJReVR2S1RLaSszNGV4eFZWS09L?=
 =?utf-8?B?NzhaR3FCSE8vbnhCWGFkK1Z3b0QxenZMcG0xYnRLVFlmTEdEUE0zQlFGSnhG?=
 =?utf-8?B?cVNBdW1EeEpNeTlSRi9iU3hKbXBtQWFoSEVXR2VwL1Q3ZXdTSm1XdkJLNDFL?=
 =?utf-8?B?bFRnRkxQS3c4NVhmb2NrQ1RCRGZYUnVLSWpRaExrNm1ET0hPdy9jSE52dHlR?=
 =?utf-8?B?NVc3VnIvc0hKa3NGL090Y3FjcVpzNjVjVDR0VXRacDRqaWVQK0QzNDZDOVFy?=
 =?utf-8?B?YkU3cVEyRVNIQ0F4TDNIK21SZkMrRjB4dWtMNWRDeTFxaklGNGJhaURCRU5Q?=
 =?utf-8?B?R3FRZVNVVmNNMDcyY3BTbGQ4Tk8vODVIUy9sdmh3RHZmS1AwcVp3SFVuTTFO?=
 =?utf-8?B?VVZTY01teTlwdGFvYnc5eitXcXA5andrZ1d3VTBsOW9hWjUxU3dHOE0yMk1G?=
 =?utf-8?B?eUE0YU4vTExXZU94QXhuUEdUTVhoNkd0TWI5c2R5VzNjczE5b0xxMkhoR2J4?=
 =?utf-8?B?WUNSY254ZEhQVWR2VnIxNm96cXVyRWg1ejM2dUVqRU1OQUI0V2lKMmpoQnF6?=
 =?utf-8?B?QlhrT01HQVl5aGpHNkJHdmZ6ZjlkL1BRanpDZi90aHNiVUJ4bFBibnBaaUQ2?=
 =?utf-8?B?eWRTRk5WY3BpL3A3T0RGcTB3VnAvYUswbFNyazE3b1FNY2Z3VktNSmsxRU1R?=
 =?utf-8?B?Nk52V1U2cTBFSHQxa2hWZ09id1V1RU5MY3RtN3dlUUVzcDVoNlViYkhNK3RC?=
 =?utf-8?B?VjdiaFpud2sreFpRVkppUDZIdHd5VlZWU01qbXg0aE5HbFhVR2ovTlR4WGQw?=
 =?utf-8?B?Zm5hZmZHeVRRdzlKdUQ4ZTNvV0xEaTN6NnRJOUErUzlSZXFRdkJybm1jNy9h?=
 =?utf-8?B?RVN5OVJaRGc4dWNtYWdrQUZrdmtxTnNHcEtSaldybWgrVnhZNmFQcmF6R0lP?=
 =?utf-8?Q?85qH9USfoKPw5nVf9zHf5YWzcGR7v5YBMEuE4aDAEl+xX?=
X-MS-Exchange-AntiSpam-MessageData-1: T4Xk9w4E+a0TbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac284d2-a0de-4bad-fec0-08dea2dd80b2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 15:15:36.9027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maiIoxG0wjolbg2mxQqcTKE/1Qq0MPC3IijGRJpxB6B7atFvHkAWmnUy6OciG1JSt09NqNUnqsAL7Cmt8+Z5rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882

On Sat Apr 25, 2026 at 10:57 PM JST, Sagar Taunk wrote:
> The `WorkItemPointer` implementation for `Pin<KBox<T>>` contained SAFETY
> comments that incorrectly referenced `Arc::into_raw` instead of
> `KBox::into_raw`. This implementation uses `KBox`, not `Arc`, so update
> the comments to accurately reflect the actual ownership transfer.
>
> Suggested-by: Onur =C3=96zkan <contact@onurozkan.dev>
> Link: https://github.com/Rust-for-Linux/linux/issues/1233
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
> ---
>  rust/kernel/workqueue.rs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..74c59f2b1c09 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -890,9 +890,10 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> fo=
r Pin<KBox<T>>
>      unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
>          // The `__enqueue` method always uses a `work_struct` stored in =
a `Work<T, ID>`.
>          let ptr =3D ptr.cast::<Work<T, ID>>();
> -        // SAFETY: This computes the pointer that `__enqueue` got from `=
Arc::into_raw`.
> +        // SAFETY: This computes the pointer that `__enqueue` got from `=
KBox::into_raw`.
>          let ptr =3D unsafe { T::work_container_of(ptr) };
> -        // SAFETY: This pointer comes from `Arc::into_raw` and we've bee=
n given back ownership.
> +        // SAFETY: This pointer comes from `KBox::into_raw` and we have =
been given back ownership,
> +        // as the workqueue guarantees `run` is called exactly once.

Not sure if extending the comment is useful, but the comment looks correct.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
