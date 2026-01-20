Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583E1410D1E;
	Tue, 20 Jan 2026 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909547; cv=fail; b=G/XEaehdDTiZMecvBlJ1E5oTOSeDSypQ/qJ0UH8xQ6knbTJaIKssj7kISCAXO4FjR9Ec+Ckq0XwDmaTHJL5webWmLIWZZwKw9dsx8k8JpC4tW9bzecEPYNyj5AO9OQ+51X2HS6Qg+y2Zg5RdXS7BYPis7qmkbg9PHNdUkTT6Lr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909547; c=relaxed/simple;
	bh=/M/XB/O3Jz10rpbcJUq6rc6L3/jivjSBkHYo9usW4Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E6yliuBVWECu/sRIp2n0kmi9vWkbTGjbs8SDWcA4fpNMPMQet3N0FKOtELxfEllHgABBNHHVKzI6+OtWQVAp1A6to5f/e/YII9ph3Bv/ftGcrNau0ZXIp2KMcNRzWuLr9hfsZAg5cSnDxYwhZsufRXElTt83cSBOaoXa/MZw2Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=AHnu7WZA; arc=fail smtp.client-ip=52.101.84.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="AHnu7WZA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0tgRBShPb19J7VIYAji6eYKNhk4Is36enyyEtY6+USAGLipkIlcHM+1fpyzziZp2rgTGFw/Jt2b7lHFFnhWSApI3DmnbJlYHMplm0/Ys4otnKg8rjvc7lJeCe88/C4TJpPEuLN7W0kHVlI8u3HxvoNU1Rlvm5n6wcEzP/JwWuMM4IsiUDRppYTg4TdYnuWZbWCVpRrKqxIoKYecXKzQqlZUnDG5BKe3BNXsUfu3DU1KB/HrFgWqkDdyZk73xmihgALt3Gg9a+WXuRMx97XN6FlRjwGlWXiA3ALOhWHJ0EZCo1K4PuYDmzVx8yOC/pt2+AWU8rzy0/UAeov115Y1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oeaw/u7DwfEYJdfmgXKhbYFJaKTD6FvXRvLiN+lv4as=;
 b=Q6etPJT2Zi7d7DNhg7NLPE+O7ywZs5GTe9cbmiSKniWU5hza7RRgG2XFicQ3mr1hBOs5a1rxSLNsBMJ3cyPw0WpJz9D2NCjZQ7oE/RY1+1hO0cNEfOg7Ev1Y/bvnnSdUOn8cF2qiFxHlLdwsYyDJ/fUEnCNzyC4OiT3Lxrg/Sa4fLTCpc4OdkUOp1hdZbWvItniGHQGPfTRnj1a2jgMwizNcNispvBS8UU2xGmN2GcE4QJW3mOtZ4wpbEn4nI3wz8xnfY18To3o97PODvkl4UJHB6x6TWv6lbBbMyTHpTTelAmBokBtKMaHBzwt8C5F6HMbQL/+5iN3LOsAEbMsrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oeaw/u7DwfEYJdfmgXKhbYFJaKTD6FvXRvLiN+lv4as=;
 b=AHnu7WZAEt9ff1TM3YYTlG4p7MunDshPfOtJ93HdlA5pEd5aYeIP2oJNqCsBCx/4vQ0uZdhwaQmt60HbEUnPEI7uN3Qh4sFpmC+QY1ozFJwIH7ZqhdSNG+8/kPTY1tHXSr+jwfHLwziDRtGpVT5GJalMiyKlSFDDNnIRo5M5jzNJ3mf54oZHHy46I/ggi43wAodHK6oigWwOIdlKa7xU4YOrx0ZIv56p7VJI9xi90CsyLoacCX9kKHuFdxiYtd+CslxqGGguv3H46WSzYuJajAT+EV6cbTRJo1WFeASaM9asTGvqSAy6hq1IYERa2Zs1wDfE0OGMQXXL48R42aIcVQ==
Received: from DUZP191CA0007.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::11)
 by GVXPR10MB9088.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Tue, 20 Jan
 2026 11:45:37 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::f) by DUZP191CA0007.outlook.office365.com
 (2603:10a6:10:4f9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 11:45:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 20 Jan 2026 11:45:36 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 20 Jan
 2026 12:45:34 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 20 Jan
 2026 12:45:34 +0100
Message-ID: <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
Date: Tue, 20 Jan 2026 12:45:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>
CC: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, Steven Price <steven.price@arm.com>,
	<rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260120-register-v1-3-723a1743b557@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FE:EE_|GVXPR10MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 0100075d-012c-4746-2f53-08de58196da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjBpZWRqSGV1NG5ya3NQYTI4clZqQ3NwSWoyWnlUVncwV1ZvY2xFK3FrUU5a?=
 =?utf-8?B?cFdjOUJyeVhIbHljU1ExZlZSTjNzaGx0alJ1TitMRHNWRVlVUko3NENySmxE?=
 =?utf-8?B?MWI2SElzM0ZBM0pMUkU4NXZ5eGlZYkVEelBERVRaOFp4ZDA3Z0tmd3k3V3Nj?=
 =?utf-8?B?MHhzOGNldEJvb3VMWEpZNnVDZTNrTG54ZWVPZWJYUW93Zmh5RkVOSjJwVmk5?=
 =?utf-8?B?cE1LRFEwUmoxb2JzNysrd2FJT3pFYkRSTlZXRHQwWlVpUVpMQkFGUm5pREpq?=
 =?utf-8?B?ZTRTcXFDSFlJOUpkS3IxMENBME9ET0VaR3BXRXE3eFhHK3cyZ2h4UzRHQzU4?=
 =?utf-8?B?VmxmUHZ1clNMMU8vUHIzU3RhRVNXUWozb3ZSemJyNXUwTDVpTXdzMk81TDVJ?=
 =?utf-8?B?ak1ta2pBQlB5L2dleDJCN0oyc3pUZG1sMmQvcStHUi9XaVY4UFg5b3c4VlNE?=
 =?utf-8?B?TjhOWXkybEJEYy9tQWIzZFJvM1NzRG1rcmcwcmxmandXa3M0elJjUGt0SE5t?=
 =?utf-8?B?T2hpTjZkY0Y1NVNLU2xRakYvRFE4eGVrYVFMTUZkWGNjMW0vcklrdnNHY1Fu?=
 =?utf-8?B?eXlPanVMVHhDVmpjNW1wMEhnV1JRbllJVzBzQmJmdnpMcEZRcStueDlJbnFs?=
 =?utf-8?B?eWJxaGZUMjl6TFNkRHovMXp6dDQ3RXJNSStOdDhKOElOL3V4cThDQ2x4cE1m?=
 =?utf-8?B?WVlDcktvYjlrcTlRdHh0Ry9ScjZaMTFrYitYZjdBM28zQWh4YldFNjFnU1pJ?=
 =?utf-8?B?dnBxdVRTNDlYQjZVbURoaU9wSmNWMVVObC94azZncnRlZ3kxZERRc21TMjNo?=
 =?utf-8?B?em1JamxqQ0wwTDF1TUFaMHo5ZWZ5cThCV3BiZkt4Rm5JSS9GM2JMSWZzNHZT?=
 =?utf-8?B?c3dGa2pNZDdIeW5Xa3NhckdLMDF6WDdZb2tlbG04Z2ZTSUZYenFNblJXSnpZ?=
 =?utf-8?B?TE5WV01sc2ZLYlNlZ3IyaXpoME9iRnJXd3dXU3l3ekVMRmUxcys4aUhCOE5o?=
 =?utf-8?B?N1hOOVJkKzRlRnJXN1BUemREYzFLZmxWd0ZqWE9HRUpWSUNsUVBQYjRQa3gy?=
 =?utf-8?B?VkthL1RtaFpST0JoOE5JVFMrbVpieDVPampoclZkSDU1dUZVN3BXczZTUUVl?=
 =?utf-8?B?UEtrdVpwYWZkdllsVW1lM0hnUHRPZnFZaTZEQXc3RXE3emlDNllxUGxtWE5u?=
 =?utf-8?B?NGdQT1dmQzRSdjFFT3huRVBBbzc3d016YnZNd2FqYUtveEFDQmNORHcvYWVu?=
 =?utf-8?B?YnF6WEpkdGdKdHBuZE8zWmdEeEV3YXl5WGIrUTY1VTRjc0FTSVFjcjBCcFRE?=
 =?utf-8?B?UUdoclBBeHU2SHg3OTY1Zi81Wjk2RGtUdnIxdFpNd0oxV3JCQTBuUmtNZ1B6?=
 =?utf-8?B?RGZCSlRMY1Fya1ZnRi9kWTRpK3lyT3cvRmhLOVZ4K2RDbEhDWEwyT2VMam9Q?=
 =?utf-8?B?MWFWREt1Nzc2SURwbTcxdSs5amF1VEZlWVhGUjRrbkF3aE1sQ1VUOEZaVi8z?=
 =?utf-8?B?OWhPbDFaTG9KNlYvTGk3R0Q0dXp2NVV6NmJob29UakZGNHhLbkI0RERjQkNK?=
 =?utf-8?B?YnVjcFArZmFXRWJPVHFsOVRHeEUweUZOQTJzbStoNU5Kb0NxZ2MwVGhZRDlM?=
 =?utf-8?B?NURLbHdsZDFwY3FhZkVKU2xsZ2JJM3diZFBCNmEzSithUjRDaUdaeGpNNkFh?=
 =?utf-8?B?aXRnTUIzRU5qZ2c4dFJWb1ZDV1FDeHR1dm9JanFKdG9LcVFmWU83VGpEMWRY?=
 =?utf-8?B?RlFNT1BLQkJTV1ZBS3pKMkpkWEFGTFVWMjZHRkRmM1U4WStvVlJKRnpMczNX?=
 =?utf-8?B?WFBYbFVYdWREK3pMNE9admw4dzVsRVc1b0E4MjhsMVhFRGhIS2ZhZGRaN3dI?=
 =?utf-8?B?dXZnc3N2MFdNN2xrMllEWHcwWWwzZm5UcytXVkRDVVlBSFFITVhiSXNnZUJ2?=
 =?utf-8?B?U3ZUWVBiMWJISmVZa0Zac0toV0t2RHFSdTJCOTdkd0VVTXNPVHdPdjNjSEZH?=
 =?utf-8?B?a0Ywekxydy9JT1ZCM1hLWDNEbFkwSk14d0Z2V3A3Nk9waFJzUU1OQ3RPMm00?=
 =?utf-8?B?ZjVUMGlxTExJYVdFK1BtcGM0V0xzVTR3azZFMkVHdktNTG8zOG9WcGxFdVl6?=
 =?utf-8?B?ejRYMXNZYS8xVnFZUFljc2poR05WaWZRVm5nSHhMNzNxMm04dDQrRHRLRi85?=
 =?utf-8?B?UjNzbDRKT3BxSGZKdFZMa1NsdmZwZlVKVWVtTEhRbHhsVHkrR1VweDZ3a0k4?=
 =?utf-8?Q?vSBo4wsgNfELA5Jce6JkRZA1EtIAXm2eE/UmMD2g4I=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:45:36.8697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0100075d-012c-4746-2f53-08de58196da1
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9088

Hi Alexandre,

On 20/01/2026 07:17, Alexandre Courbot wrote:
> Add a macro for defining bitfield structs with bounds-checked accessors.
> 
> Each field is represented as a `Bounded` of the appropriate bit width,
> ensuring field values are never silently truncated.
> 
> Fields can optionally be converted to/from custom types, either fallibly
> or infallibly.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>   rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++++++++++
>   rust/kernel/lib.rs      |   1 +
>   2 files changed, 504 insertions(+)
> 
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> new file mode 100644
> index 000000000000..2926ab802227
> --- /dev/null
> +++ b/rust/kernel/bitfield.rs
> @@ -0,0 +1,503 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support for defining bitfields as Rust structures.
> +
> +/// Defines a bitfield struct with bounds-checked accessors for individual bit ranges.
> +///
> +/// # Example
> +///
> +/// ```rust
> +/// use kernel::bitfield;
> +/// use kernel::num::Bounded;
> +///
> +/// bitfield! {
> +///     pub struct Rgb(u16) {
> +///         15:11 blue;
> +///         10:5 green;
> +///         4:0 red;
> +///     }
> +/// }
> +///
> +/// // Setters can be chained. Bounded::new::<N>() does compile-time bounds checking.
> +/// let color = Rgb::default()
> +///     .set_red(Bounded::<u16, _>::new::<0x10>())
> +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
> +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
> +///
> +/// assert_eq!(color.red(), 0x10);
> +/// assert_eq!(color.green(), 0x1f);
> +/// assert_eq!(color.blue(), 0x18);
> +/// assert_eq!(
> +///     color.as_raw(),
> +///     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
> +/// );
> +///
> +/// // Convert to/from the backing storage type.
> +/// let raw: u16 = color.into();
> +/// assert_eq!(Rgb::from(raw), color);
> +/// ```
> +///
> +/// # Syntax
> +///
> +/// ```text
> +/// bitfield! {
> +///     #[attributes]
> +///     pub struct Name(storage_type), "Struct documentation." {
> +///         hi:lo field_1, "Field documentation.";
> +///         hi:lo field_2 => ConvertedType, "Field documentation.";
> +///         hi:lo field_3 ?=> ConvertedType, "Field documentation.";
> +///         ...
> +///     }
> +/// }
> +/// ```
> +///
> +/// - `storage_type`: The underlying integer type (`u8`, `u16`, `u32`, `u64`).
> +/// - `hi:lo`: Bit range (inclusive), where `hi >= lo`.
> +/// - `=> Type`: Optional infallible conversion (see [below](#infallible-conversion-)).
> +/// - `?=> Type`: Optional fallible conversion (see [below](#fallible-conversion-)).
> +/// - Documentation strings and attributes are optional.
> +///
> +/// # Generated code
> +///
> +/// Each field is internally represented as a [`Bounded`] parameterized by its bit width.
> +/// Field values can either be set/retrieved directly, or converted from/to another type.
> +///
> +/// The use of [`Bounded`] for each field enforces bounds-checking (at build time or runtime)
> +/// of every value assigned to a field. This ensures that data is never accidentally truncated.
> +///
> +/// The macro generates the bitfield type, [`From`] and [`Into`] implementations for its
> +/// storage type, and [`Default`] and [`Debug`] implementations.
> +///
> +/// For each field, it also generates:
> +/// - `field()` - getter returning a [`Bounded`] (or converted type) for the field,
> +/// - `set_field(value)` - setter with compile-time bounds checking,
> +/// - `try_set_field(value)` - setter with runtime bounds checking (for fields without type
> +///   conversion),
> +/// - `FIELD_MASK`, `FIELD_SHIFT`, `FIELD_RANGE` - constants for manual bit manipulation.
> +///
> +/// # Implicit conversions
> +///
> +/// Types that fit entirely within a field's bit width can be used directly with setters.
> +/// For example, `bool` works with single-bit fields, and `u8` works with 8-bit fields:
> +///
> +/// ```rust
> +/// use kernel::bitfield;
> +///
> +/// bitfield! {
> +///     pub struct Flags(u32) {
> +///         15:8 byte_field;
> +///         0:0 flag;
> +///     }
> +/// }
> +///
> +/// let flags = Flags::default()
> +///     .set_byte_field(0x42_u8)
> +///     .set_flag(true);
> +///
> +/// assert_eq!(flags.as_raw(), (0x42 << Flags::BYTE_FIELD_SHIFT) | 1);
> +/// ```
> +///
> +/// # Runtime bounds checking
> +///
> +/// When a value is not known at compile time, use `try_set_field()` to check bounds at runtime:
> +///
> +/// ```rust
> +/// use kernel::bitfield;
> +///
> +/// bitfield! {
> +///     pub struct Config(u8) {
> +///         3:0 nibble;
> +///     }
> +/// }
> +///
> +/// fn set_nibble(config: Config, value: u8) -> Result<Config, Error> {
> +///     // Returns `EOVERFLOW` if `value > 0xf`.
> +///     config.try_set_nibble(value)
> +/// }
> +/// # Ok::<(), Error>(())
> +/// ```
> +///
> +/// # Type conversion
> +///
> +/// Fields can be automatically converted to/from a custom type using `=>` (infallible) or
> +/// `?=>` (fallible). The custom type must implement the appropriate `From` or `TryFrom` traits
> +/// with [`Bounded`].
> +///
> +/// ## Infallible conversion (`=>`)
> +///
> +/// Use when all bit patterns map to valid values:
> +///
> +/// ```rust
> +/// use kernel::bitfield;
> +/// use kernel::num::Bounded;
> +///
> +/// #[derive(Debug, Clone, Copy, Default, PartialEq)]
> +/// enum Power {
> +///     #[default]
> +///     Off,
> +///     On,
> +/// }
> +///
> +/// impl From<Bounded<u32, 1>> for Power {
> +///     fn from(v: Bounded<u32, 1>) -> Self {
> +///         match *v {
> +///             0 => Power::Off,
> +///             _ => Power::On,
> +///         }
> +///     }
> +/// }
> +///
> +/// impl From<Power> for Bounded<u32, 1> {
> +///     fn from(p: Power) -> Self {
> +///         (p as u32 != 0).into()
> +///     }
> +/// }
> +///
> +/// bitfield! {
> +///     pub struct Control(u32) {
> +///         0:0 power => Power;
> +///     }
> +/// }
> +///
> +/// let ctrl = Control::default().set_power(Power::On);
> +/// assert_eq!(ctrl.power(), Power::On);
> +/// ```
> +///
> +/// ## Fallible conversion (`?=>`)
> +///
> +/// Use when some bit patterns are invalid. The getter returns a [`Result`]:
> +///
> +/// ```rust
> +/// use kernel::bitfield;
> +/// use kernel::num::Bounded;
> +///
> +/// #[derive(Debug, Clone, Copy, Default, PartialEq)]
> +/// enum Mode {
> +///     #[default]
> +///     Low = 0,
> +///     High = 1,
> +///     Auto = 2,
> +///     // 3 is invalid
> +/// }
> +///
> +/// impl TryFrom<Bounded<u32, 2>> for Mode {
> +///     type Error = u32;
> +///
> +///     fn try_from(v: Bounded<u32, 2>) -> Result<Self, u32> {
> +///         match *v {
> +///             0 => Ok(Mode::Low),
> +///             1 => Ok(Mode::High),
> +///             2 => Ok(Mode::Auto),
> +///             n => Err(n),
> +///         }
> +///     }
> +/// }
> +///
> +/// impl From<Mode> for Bounded<u32, 2> {
> +///     fn from(m: Mode) -> Self {
> +///         match m {
> +///             Mode::Low => Bounded::<u32, _>::new::<0>(),
> +///             Mode::High => Bounded::<u32, _>::new::<1>(),
> +///             Mode::Auto => Bounded::<u32, _>::new::<2>(),
> +///         }
> +///     }
> +/// }
> +///
> +/// bitfield! {
> +///     pub struct Config(u32) {
> +///         1:0 mode ?=> Mode;
> +///     }
> +/// }
> +///
> +/// let cfg = Config::default().set_mode(Mode::Auto);
> +/// assert_eq!(cfg.mode(), Ok(Mode::Auto));
> +///
> +/// // Invalid bit pattern returns an error.
> +/// assert_eq!(Config::from(0b11).mode(), Err(3));
> +/// ```
> +///
> +/// [`Bounded`]: kernel::num::Bounded
> +#[macro_export]
> +macro_rules! bitfield {
> +    // Entry point defining the bitfield struct, its implementations and its field accessors.
> +    (
> +        $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty)
> +            $(, $comment:literal)? { $($fields:tt)* }
> +    ) => {
> +        ::kernel::bitfield!(@core $(#[$attr])* $vis $name $storage $(, $comment)?);
> +        ::kernel::bitfield!(@fields $vis $name $storage { $($fields)* });
> +    };
> +
> +    // All rules below are helpers.
> +
> +    // Defines the wrapper `$name` type and its conversions from/to the storage type.
> +    (@core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty $(, $comment:literal)?) => {
> +        $(
> +        #[doc=$comment]
> +        )?
> +        $(#[$attr])*
> +        #[repr(transparent)]
> +        #[derive(Clone, Copy, PartialEq, Eq)]
> +        $vis struct $name($storage);
> +
> +        #[allow(dead_code)]
> +        impl $name {
> +            /// Returns the raw value of this bitfield.
> +            ///
> +            /// This is similar to the [`From`] implementation, but is shorter to invoke in
> +            /// most cases.
> +            $vis fn as_raw(self) -> $storage {
> +                self.0
> +            }
> +        }
> +
> +        impl ::core::convert::From<$name> for $storage {
> +            fn from(val: $name) -> $storage {
> +                val.0
> +            }
> +        }
> +
> +        impl ::core::convert::From<$storage> for $name {
> +            fn from(val: $storage) -> $name {
> +                Self(val)
> +            }
> +        }
> +    };
> +
> +    // Definitions requiring knowledge of individual fields: private and public field accessors,
> +    // and `Debug` and `Default` implementations.
> +    (@fields $vis:vis $name:ident $storage:ty {
> +        $($hi:tt:$lo:tt $field:ident
> +            $(?=> $try_into_type:ty)?
> +            $(=> $into_type:ty)?
> +            $(, $comment:literal)?
> +        ;
> +        )*
> +    }
> +    ) => {
> +        #[allow(dead_code)]
> +        impl $name {
> +        $(
> +        ::kernel::bitfield!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
> +        ::kernel::bitfield!(@public_field_accessors $vis $name $storage : $hi:$lo $field
> +            $(?=> $try_into_type)?
> +            $(=> $into_type)?
> +            $(, $comment)?
> +        );
> +        )*
> +        }
> +
> +        ::kernel::bitfield!(@debug $name { $($field;)* });
> +        ::kernel::bitfield!(@default $name { $($field;)* });
> +    };
> +
> +    // Private field accessors working with the correct `Bounded` type for the field.
> +    (
> +        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
> +    ) => {
> +        ::kernel::macros::paste!(
> +        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
> +        $vis const [<$field:upper _MASK>]: $storage =
> +            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
> +        );
> +
> +        ::kernel::macros::paste!(
> +        fn [<__ $field>](self) ->
> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
> +            // Left shift to align the field's MSB with the storage MSB.
> +            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
> +            // Right shift to move the top-aligned field to bit 0 of the storage.
> +            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
> +
> +            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
> +            // output type.
> +            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
> +                self.0 << ALIGN_TOP
> +            );
> +            val.shr::<ALIGN_BOTTOM, _>()

What have I missed?

error[E0747]: type provided when a constant was expected
    --> rust/kernel/bitfield.rs:318:37
     |
318 |               val.shr::<ALIGN_BOTTOM, _>()
     |                                       ^
...
566 | /     bitfield! {
567 | |         struct TestPageTableEntry(u64) {
568 | |             0:0       present;
569 | |             1:1       writable;
...   |
574 | |         }
575 | |     }
     | |_____- in this macro invocation
     |
     = help: const arguments cannot yet be inferred with `_`
     = note: this error originates in the macro `::kernel::bitfield` 
which comes from the expansion of the macro `bitfield` (in Nightly 
builds, run with -Z macro-backtrace for more info)
help: add `#![feature(generic_arg_infer)]` to the crate attributes to enable
    --> rust/kernel/lib.rs:59:1
     |
59  + #![feature(generic_arg_infer)]


$ rustc --version
rustc 1.81.0 (eeb90cda1 2024-09-04)

Thanks

Dirk
