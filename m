Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013009.outbound.protection.outlook.com [40.93.196.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F148CD7B;
	Mon, 12 Oct 2026 14:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815814; cv=fail; b=I29veGcl7YYDgVYDcmEBUBg6wzrpXgVRbuB/o/zQW1NJixdKaM1znIthwmubj/eLp/U9KYDYIyqwoTe+CgKAsHaapWjJa0R8qmL/y4BnOC0YfzaVffEC8ysQ3X1qXtSW5N5oX4IVjeJI67T64tO5czURmNaM+DH9H8NBKSdRaFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815814; c=relaxed/simple;
	bh=56b1e3pQ7QJgmWD6JEhDJejakOFFRIqo1dWRTU5nn8k=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=FqG+iKGkjMmFaEmSSo/XgIj13MyMwXgiFMDvBvfNpffYwPZL2Ho8u/3lHAQ0EarAgqXS9UPC7DDU4j9Vfr1giDQhLINq4Ab36+XxVSmRPvwlysVCbSHfhLUTlqOcsVKvTedI+wa4UxCWJGd2fJGJjUBSWO4l/svnlKZ52QgYXdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QZNwFUZG; arc=fail smtp.client-ip=40.93.196.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QZNwFUZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngNSCR2XMQTQJYZ/k0uNXGxf5B2QG7te6yq1ZEvhLIRfQ1UWxmkeiXJhw/oL3R5C/4G1V3oODxB1/J7GyUKyDRGvL4ALbJCrMTfXpJT8swVfqGCawiaflPRRg0xfw58fd1SubJ2geq1bsNX9JGYJTgrlSZvaMEjsj40BvyJeMOkBOOZD5IYUd04WonX7ThgoLMm0Lp0xAX61L/9MSu9rfKnL+rbNjmnvCwp6Y/NGOY9qik6k4bPVBEceL6ZOXaK76/7Ke5eUTcw2flJs2XcGcE7cQWn90dU6EnV+1pN2vXY4ynq7DuMRUNkfREcXgk/O4tXJSNLtMx9gAAm0ebjYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEWRm6qvUtlcZLD/q4pZoLf6uE8EFqQ3oL/tZ9FYSBM=;
 b=xAVfK9Qc9STbmhsEQijrmA0v4lGSimjAHLwGL4Y/35dgCfEOa+2OjbLt5ykR9SxdTv5oy742mh9gRqlevUkGq7o3X6Aigui3i9WmU0bAnftHClI9kaOIxNe165MAhbD/BUO3i4GTW6B6d+m9vDlMXestYikX1/QBLR4MklxNSlach6OikG7dI/qZalPfhG/lXeHoETmYJZWpy+Hie7x4mcc8QdwZAnjh6siEw7V8X4QKkL4U6gS4+dXIyZWC95yYs79XsUx1EglbDNBVsK4BLgDFWVJJg760zwyZIR9j0Yl+wrMhc/AyUqlb/hlV6Sup5qxp11mhr4+9t2GnSWNMIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEWRm6qvUtlcZLD/q4pZoLf6uE8EFqQ3oL/tZ9FYSBM=;
 b=QZNwFUZGTpJMx2XjinLYQqxxeqpum8KG91tBIjLQtFRhyrYfk6up146SoiALeSSKDBdhi1y+oprdJ8c3WoDsTpPXAgcQBawj/wkqjWWUfFjAJTj5+OPwweyg2+H+lLXQWY+mUZDcW8fGpkr/CV23+K94p2PkT0lfMwRPt4v14NjCXKNVwsNmNQ6j7jk4TECA4/bmShMJ2HRW0IT4SkM5r4I4Y/FkH/RBcea7CHnk4MigpezJgTgJBRITxovnB0iqEdwv/K1fU8N9IFcm83uqjTOTbg5f1msLluuS7HyrvRowPHBcTjZ1hRRQqnLo+fJMVqA7zqrzQyy105DmW3qlAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 12 Oct
 2026 14:36:44 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 14:36:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Oct 2026 23:36:41 +0900
Message-Id: <DM2XOVH1P1FU.2FHNOM9U66YPS@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Francis Laniel" <laniel_francis@npnm.eu>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alvin Sun" <alvin.sun@linux.dev>, "Thorsten Blum"
 <blum@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [RFC PATCH v1 1/2] rust: add NonEmptySlice
References: <20261011191540.56199-1-laniel_francis@npnm.eu>
 <20261011191540.56199-2-laniel_francis@npnm.eu>
In-Reply-To: <20261011191540.56199-2-laniel_francis@npnm.eu>
X-ClientProxiedBy: TY4P286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::8) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: fc600ef2-6920-4735-551a-08df286e3c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|10070799003|376014|366016|11063799006|10067099003|56012099006|6133799003|5023799004|4143699003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wB1/Nj2sOvC9cGH99zYoYZfPOJbgIUDuhfmx7dEPDyuv4ZgDTTTWLIOs0nPnHhg2BUQyEiccnrVjlT4IOzMfzj/IBgOZH38v6bAl6gp8HajVCWziCa1o326CJEgkg64qZJT8hXdRdTnlqbVfP+6wUjCWRlTROKodzfVh7Aem4ApfqSO7KBIKfDw1W8XvaAa8aa8ldh1Nl1uAosj/2X2Z+gtcpy8ZRkXh3mIilfr5Sd2+Dg60y4TMhvC34V5gknetgL8UXqMfYoF7gIZZ4wUGwcWzHwZZraeBPSixc6/gzvLq11RXFNCwr0Q5Um7kJ3HPJxRvLktal3ZJjl9Azd4yCA4rDoL+HFt4+HYkq5geMuqJa9qvHozFU1OZ/pKNt4DftdEl2xCuEfNdm/nVXChyQjOPv6lUY0QZMwu0w1e/MfaXXbYCjzcEBRxyyj3IuQqEA+XadDTBeEEcqxSEpuRXkuOpidltB6NXTadolxVHjzdk6nRMn1hYBrihSOFN5VAZR0ijk5Mmd9u7M6YhQUAXRbSuXMehqlQDt2tFp6IIeEzGrn7BtHXdqYbE8IYxgMqoPf61Gr4eR479O15TZPD6kg2ndy4+7xP5vc8RBSOTaibAWiYMw8jWl9wmxm3HYo8bE3iAv5bDqzy7eGTU4cnh+fz4V9w6LeHTLUXLZl3DhDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(10070799003)(376014)(366016)(11063799006)(10067099003)(56012099006)(6133799003)(5023799004)(4143699003)(22082099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3E2bWRoMFdDcVY2SHYzcElYOEUrZzI2US91d3ExTkFzVVJBTGV6MmhPMFN5?=
 =?utf-8?B?Y3AxR2VTYXVYQWl2ZGNYZTdXL1BCRHo2b3pFVEZ3a0RUcmtweFdNSWNIeXhC?=
 =?utf-8?B?STllV1FhWXo2bUtEcU02d1pFYVlkdGRvODRuNFV3WHcwaDE3R3NUOWMzRXRr?=
 =?utf-8?B?SmhlMkJtdzN6OHhhNnZSRXhZVnZZZzhMRlQyZTY1ODZYVlpRd3Y1aGh2ZllM?=
 =?utf-8?B?dnNpcVNtcmw2bHdla1llVTE0VmF2TXBkTVpmdStWSzd5S29nZWMyNnNBUTlQ?=
 =?utf-8?B?QWZpL3NFakpFQVdNdHpGOTh1MHphMkJNM1lmWlNCeVk0bjNJQ0dHd1pSY0F2?=
 =?utf-8?B?ZTl4QkFSdDBGME1QVUV6QXZkazl0dlVmRkRYQkNISWhQcytsenhwVmhmOUgv?=
 =?utf-8?B?Ky93a1pidkUrSTR0QUF0ekc1N0poZkYxR3JZQXI3a3pzM2JGbThHd042UGJm?=
 =?utf-8?B?S3NKWldnT0syM09PRTZpbkJDalpza01rL1FWU0dQcURiejJmM05PZE0xNGVJ?=
 =?utf-8?B?OUg0T3orMG54R3JZU3VvMmFNYWZqaHB3Q052NFppRERyYVRxV2l3RmdESml3?=
 =?utf-8?B?aS8ya3E5VlNYNWVlelVjd0lkd3NsdlNsZjlteXc4TnZTRUhIMnV3bzZGdjZt?=
 =?utf-8?B?YWtMREdxRklKK0JxeXJKWjc5TG9lY2ZkT3BMc0FpRTdIekpscVUyZHo4QkdY?=
 =?utf-8?B?TG44R3NRNGVJam5NR1ZidlZnMVFWT3YrcUVJNFZLYWkzN0VLckVUSFhLN1N3?=
 =?utf-8?B?QTZzZ2hsc1hzWUV2eEFBT01PYXZ4Q1VlbjRCRnpXV3FYdXB0TkU1K1VwbjBK?=
 =?utf-8?B?UERuT0RWRHhXc0JveGVaTTVOZldKNWhaWDNHblNUUEMvOGlHNFpobnpDVU8z?=
 =?utf-8?B?amFVMWRmZW5JN0NlNzM4c1ozZVBDWG9YUE5pazZsbS9PZ1RqYlBrNUhJaWU2?=
 =?utf-8?B?NlZnczRid3JCc0RQc0ZpWmNCQVFHeTBucE01VDZGdWRjaEVzVG0vTG9YYTZu?=
 =?utf-8?B?OFJ3blc3dTRZRDcwbGdHdkU1NzBaTE5kdVpydEs1UkE0TVhjd3gvVW9kNmlr?=
 =?utf-8?B?SXhoVjNwVmdvSEpGZVl2TklrV1p3eFdPS2NTcjRtR1JFbHRTL0V2dHlhcTAx?=
 =?utf-8?B?V1FkSkxpZzJzTjVkaVduMzZmemJSeFB6NklkM2pxWUdZMEQweDJjLzFjN3J3?=
 =?utf-8?B?Vng2SVRIQlpId0tRNExJbmViL0hXT0lpaFNQMHlUQ2xodnQ5ZllUOHNoNVJh?=
 =?utf-8?B?MkxNbEFDK3h0eHdjbDNMQWJlK29lZ1RhZUd5bWp1ZTA3L2d0dGdOTnpFSVRN?=
 =?utf-8?B?clU5MzBMTkJubklnR3g5LytXTVUyVE53WkVpL0hlcmZkQXJidzNWRGFNYWVl?=
 =?utf-8?B?UDlFWS92MlN4K1hCbW1oUzEwR3NpQjBrTVF0T2ZibExSTTg3bFhVUktldDh5?=
 =?utf-8?B?NklpelNhYmFuNVdrb3gxaFZuSHNkMDZDSUlNSjJjMWsxdDgrTGw2MUgxZS9B?=
 =?utf-8?B?L3ZRbjVGSGNWZnNjbHFKamhtOHpjMnFFeFljL2NJZDYwV3Q0U0pjbW41b1p0?=
 =?utf-8?B?bVVEbmhZVHhmOWhZK0x5aTE0V1ptaXhUUFNTL2czT1FXYjRLK2xqU0NubXVK?=
 =?utf-8?B?Qjl0WmJOL3NreitaUURMK2VCRUZXTDdwdFF2MnphNnVqQklrRzdUVDZLV1pL?=
 =?utf-8?B?UktPbjdVM0xCUzBMVngrSnVDS1lBR2RlaHBvYlNxLy9WUTVTa2lNbjFQTnEx?=
 =?utf-8?B?dmNrZit1TDB6MmdYSFVvbTRUTEZBQUFHT0lhemdGdmpXMHZXd3U1NE1HNG5r?=
 =?utf-8?B?c2JvVm5XK3huNTljei94N1RMaTlKRXRjK3JtNlRhcTVvZ05yRVJtSjIzVjUr?=
 =?utf-8?B?RW1aVXZWa2Y1SjRxUEtHM0tYOGZUUW1vZGZ5OCtOUWNoQ2lUajFkS1hlT2RY?=
 =?utf-8?B?bVNNTS9nNlhBOEQrSmVjOUtWSHJWMzUyM2dpd1d0Wi8vQXoxdlI4RXBMSEZ3?=
 =?utf-8?B?NnFEclA0VWFES1lJa0NmaHF1WkhWeUdxaE5IcmhwU1BQVjdWMnNNUmRNUzRh?=
 =?utf-8?B?SXlsalBHQVM4UmVSYW9CNWJJYmdGcTRyNHdQb1RsSjdmSm9iS0JrVHRoNjFy?=
 =?utf-8?B?TlB4cUdDc0lWMFJXcGVKOHhqeFhwbUYwN3h2NmkvT1U1VnRyTDBnWXVtWkFO?=
 =?utf-8?B?UG9meTUxY201ZmNrRHV4c2s3YnhRZXIvOG15eHQ3eEwvZzcvaEUrS0l1ZGpM?=
 =?utf-8?B?a2VtbDdkSFpMTE81ZWh4eVdmMlFvTEh1UmFYeU9yQk9TUFB1WFJwakNWWGpu?=
 =?utf-8?B?czJVNGhGN1B4aG5nTjRkUityUHpSTkNGUldUVnp6RkNUQ2ZmNDZlWHh6NWZ1?=
 =?utf-8?Q?A4jotyJzCMXqpu2/ODEskdJF3KoX4xoWfuOPh4NMx0p1Z?=
X-MS-Exchange-AntiSpam-MessageData-1: qRZ5R1QT9IsNzA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc600ef2-6920-4735-551a-08df286e3c6e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:36:43.6759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WL03216Ta/hxKOcmrvEUV21VkbzRsludYKNW+dh3mSNs1oiWqIJHYft1NOtM5DMqId5ftpAEflG/U3k9/eViKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728

Looks like we are converging towards the series sent by Lorenzo, but
wanted to share a couple a quick comments nonetheless:

On Mon Oct 12, 2026 at 4:15 AM JST, Francis Laniel wrote:
> Add NonEmptySlice<T>, a [T] wrapper that is guaranteed to contain at
> least one element.
> This lets methods such as last_mut() return a plain reference instead
> of an Option, so callers that have already checked for emptiness no
> longer need unwrap() or unwrap_unchecked().
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Francis Laniel <laniel_francis@npnm.eu>
> ---
>  rust/kernel/lib.rs   |  1 +
>  rust/kernel/slice.rs | 76 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 rust/kernel/slice.rs
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 7225abc64084..8cc01aceb3b2 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -130,6 +130,7 @@
>  #[cfg(CONFIG_RUST_SERIAL_DEV_BUS_ABSTRACTIONS)]
>  pub mod serdev;
>  pub mod sizes;
> +pub mod slice;
>  #[cfg(CONFIG_SOC_BUS)]
>  pub mod soc;
>  #[doc(hidden)]
> diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
> new file mode 100644
> index 000000000000..7e467cb952c3
> --- /dev/null
> +++ b/rust/kernel/slice.rs
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Slice abstractions to ease development.
> +
> +use core::ops::{Deref, DerefMut};
> +
> +/// A slice that is guaranteed to contain at least one element.
> +///
> +/// # Invariants
> +///
> +/// `self.0` is not empty.
> +#[repr(transparent)]
> +pub struct NonEmptySlice<T>([T]);
> +
> +impl<T> NonEmptySlice<T> {
> +    /// Returns `None` if `s` is empty.

This is not a standard doccomment. Doccomments first start by stating
what the function does before explaining the return value.

> +    pub fn new(s: &mut [T]) -> Option<&Self> {

It looks strange to take a `&mut` and return a `&Self`. There should be
no reason to take a mutable reference here, and you can use
`ptr::from_ref` to create the reference.

> +        if s.is_empty() {
> +            return None;
> +        }
> +        // SAFETY: `Self` is `repr(transparent)` over `[T]`, so the cast=
 keeps the slice length.
> +        // INVARIANT: `s` is not empty, checked above.
> +        Some(unsafe { &*(core::ptr::from_mut(s) as *const Self) })
> +    }
> +
> +    /// Returns `None` if `s` is empty.
> +    pub fn new_mut(s: &mut [T]) -> Option<&mut Self> {
> +        if s.is_empty() {
> +            return None;
> +        }
> +        // SAFETY: `Self` is `repr(transparent)` over `[T]`, so the cast=
 keeps the slice length.
> +        // INVARIANT: `s` is not empty, checked above.
> +        Some(unsafe { &mut *(core::ptr::from_mut(s) as *mut Self) })
> +    }
> +
> +    /// Returns a reference to the first element.
> +    pub fn first(&mut self) -> &T {

Same here, `first` and `last` should take a non-mutable reference as
their standard library counterparts do. They do not allow to mutate the
slice.
