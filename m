Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E292352038;
	Mon, 24 Aug 2026 02:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787540385; cv=fail; b=SqUbd/CVERy9a0wjIziUp6GsZjG9RkZyPDptl68laGpkKOylEZ0cA6oIWAA9Zuia/9sPE/68fZOoU58JiRPGbaS8Gxn5FVANmaLH6oNjmwA4lfNrjvVrxujtVQRQxCS7TtTLutUnD7DF6nwfAtE/V052A7JXypMknYVlN9DCdiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787540385; c=relaxed/simple;
	bh=WHFRHnt2Ge9b0ANuWmseaKfNBJ2v3ynBBloMubqvapw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=sTdr1q3sHY8T1RdL9m5l6Jn5hWbO+1G276GQrN2K0bT16NUeQIdl9JK3s0saX09DZ8sLq53WfhWw2kghDFdc/grx+sRDCRld+EgGEYrVei5aMF8isDJfg47FdlFcdgllQi0G6vlMEpiJWQ2At6j+Hzov/Zr60ozJTPTn28lZuFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pBQQJMy7; arc=fail smtp.client-ip=40.107.200.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pBQQJMy7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7nhoNwSi7M3qA9E4DEuZbq5rInh+mYmJ3nyNq/y1k1Rk5PzDwqlo4LFgN2M/mwH5InS+Pu+22hjtPd5XoUOBAhzESRjbhe6wB8ahC4fJllMRNMlwN27xz0Vh7N7dzP1d+acZ/C6LvN6NeelzgTc0rIYhvamvO0LGpWPBSWcDwNI6hP/mz9UBFH9rfFQKApV/0CLls6v7SwQ6DjMBGet4ysQJHXMRg51mWJliuQaQ0bG96ECSSgLdSpya4vmRCpHJlrVXScccqh5dp1xxe1wkCOWIKUQ6zBwODntWLRc0D94c/irPbVvftzO8ERuLCBgfOFFY6EYuNg+a6TOkqwTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YFaGO7R2QJWFcSqLtX+1C3xXx9LqBJsIdco10DmgOg=;
 b=lnkMlAnVTwilb8jwl/9U5PpBF9xUGERcmuyrpzJYpi6t0NW/4poV06pNt0wtFSzps6krfhiqE1zQS1VTmyL+GEhTzRHErV0hoCK8EzfYeQRbHFL48ePbtCTZRnuq8UK3ZncLrvg+Uevy2cnbEHm5koeIDE+lNGVuNkv+4bfXUU6LPfBiDecEl2cmw6S32EDUqD1H8fB3el6MdEVZmIWrKAWsZ1CxwCMdt+dkhsK6zKIXfKxbhhXtvBXDWlQ+jHypXYs59r1dCdqKLucaR9EZT8L+wzmwNLfUKCkaoOXIvyi3y/mmfVym4SjTW5/moXMsbtj2rLIsxEjJKHuKgsgJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YFaGO7R2QJWFcSqLtX+1C3xXx9LqBJsIdco10DmgOg=;
 b=pBQQJMy7suPMllb20RfGnebO6hMu/6f4tKdsEqKrt4FE6slnqGeLDYcOwetjqX2Y7EnlVG6umizwdqrXLS5HYDiJntCI3AkDNaB75XhJgAGkhUhmVQeMLJdXoXLswCtbvbFgLJHWLEW40jNHmJFKNe+xRhLoCU/r7QFJdhp7u6d+IpbTlhGuLjnlYTTRYAm5z/nuqp8LuWa77L/AcJ+wVjZzi/tBTCQGgBIOyOilDKzZa+/wJODPiZp5QlmthmNvwKtdj9xU1KIzLLPL9b8kKzks4rS0JywyFv7mRDbuioLdP75nY7rh6BHFN/QODc6inUWCWvJxumhaWWgnLMChPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:59:38 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Mon, 24 Aug 2026
 02:59:38 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 11:59:35 +0900
Message-Id: <DKWU6FXYZTYB.FY9L7L4OTXCZ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Zhi Wang" <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dakr@kernel.org>, <jgg@nvidia.com>,
 <dave.jiang@intel.com>, <saeedm@nvidia.com>, <jic23@kernel.org>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
Subject: Re: [PATCH v8 1/1] rust: introduce abstractions for fwctl
Content-Transfer-Encoding: quoted-printable
References: <20260813152312.1311142-1-zhiw@nvidia.com>
 <20260813152312.1311142-2-zhiw@nvidia.com>
 <DKP1Z8PZZX83.GZ924NDYZYPB@garyguo.net>
In-Reply-To: <DKP1Z8PZZX83.GZ924NDYZYPB@garyguo.net>
X-ClientProxiedBy: TYCP286CA0272.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5c202b-d57c-42c2-83f3-08df018bbc5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|7416014|376014|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vJseH+5SpF0eG0PrM404jeuUGJvanu76XApluoAPE9RLDx1osZWJ50ndcVUEG86lKQtBXdCpDsbgZBtSKeci9gBC+jRVOVDHcLvGhhX/Ue64gcpDOuVG4wlEQlfIbBVp0J8fFJIKZOf0MUG9hUn1BYnBPLoFKrA0s65Qq7lce485TIMIcXUW2owe5KBGoT1cPiRoEhLKMF9jxB+Duq56mHOZBl1nMxQ+H0FZvTCl0iOpZpeRMSlVPsRYWHrYwaz2UEvx2tGi34vAuNOUmQsohlOyzJb1ynMe3TZ9Hn6NKUcJfRrSJelt95vQkdN5aXRy6BbypBKIi34PSRSvlgAfgNkPUePJyclCVfs9z1Wcrc0TSay3aVF9rHsYNxyfBdmX4BRnVYAjJjMqYwJ47Kskds1OmXRhYyQPPNLe0pZGu2lxh9XiJtL4qxhN6JeKd8FiXOOfIA4VyCosH6aw7i0S/qWl6xOaz6B0t42sP9Iy/XLZuOj3kWrcAYaa8NDxbZ+tdPUnae6wyQQBfCVHeGrXIdyVe67W1xB9Qr8wbh+WompG2IMNp4LLDNdnxLz16ocSbQj6YYObhmySSi8CKymvEdsDpaFxZ9eobQkwVigR9Z3zp8ZAyv0l0NTuagY7Nuzp5g9jZPfoWL613dGFzw3UUTxJs2PyfUHQDUuGEQGPCwE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(7416014)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2MxSUVBZmE0WmdMVE5UVkFtNWsyNGROclJuMGY3ZWVNNkliZ0VQYXU2UjB2?=
 =?utf-8?B?Yjg2SWxNVk9MZXBIcy9xZGVBUlVOaVZVMS93VnZLRVRvVlg5Z2xsR1VxR1BN?=
 =?utf-8?B?Mk1yY2VmOCtJUGs0N1h0ZElEMnBrN1JEUzlyQW1rbzlZVTA3NEMyTXRzVVBu?=
 =?utf-8?B?MHZ1Y0FJNyt2ekxzeWp2d1I2ZmdzejFlclVxQ1NXYUlzejdVVTBpN1NQb0s3?=
 =?utf-8?B?NmdEck5CRG5GTTREWVpYczR6YVVtSGo4T1BoZGNHZ2cyRjFHTHpDbHNFM2I3?=
 =?utf-8?B?ZmsySUVERjQ4MFlxcGdoYUthRXd6WXZJTzVKVUV2Lzl6YmxiUytWOEtUd29L?=
 =?utf-8?B?bzBNcmxvZTFYMWlTdUN1Y3NyYkFrQzI1bjMzcXRWT3drMFNuRUQ0MVpoS05K?=
 =?utf-8?B?dUhaMXUwM0REL1o0d2YzRHBnYXg3bTFOaDQ1SnBONW5pRm5uTnBCQUVrS1A1?=
 =?utf-8?B?b0oxK0tOeEhmeHJxWVN1T0hSSE9hcWwyQlJuUmFQbHkwNWJqQlZEaUJvVWIw?=
 =?utf-8?B?S2YzK1pkRlV5aTV4Tkc3bm9HK1RNT1ZYblorYTM0M1EzWDYrL0FoL201bGc3?=
 =?utf-8?B?V1k3VHhQN0ZPWWNhRnAramR6eDhMSW1mUlV1eVBFdXJ5a0labHJvN2ppSnov?=
 =?utf-8?B?RHhqY2M5emVkUUY1c01uTVpQRSszbSsxVk9tb1BzanRlM0VvU0FWTDBJL2Y5?=
 =?utf-8?B?TFRvYWxJQXdvc1JkTkhoaGtNUGk2Y0FIb2V3cWY2cFkwTWJGY0YxM2M5R3Br?=
 =?utf-8?B?VXlad1NabFpRY0pVWmFaNjJ6ckxuVEZPMk9WL2EvYW9CWGZzYVRwSjU1V2pq?=
 =?utf-8?B?Q0hnMUtsWkJveERjZlN4WnFyRUpGTHZwaTRtb29CRVZEL0ZyM3Y5TW1RVGlB?=
 =?utf-8?B?bmFreEovM05vczZ1S1lINDRESFVRVjdncjBoWFVNc0FqQ25NUithUE9FaHNM?=
 =?utf-8?B?c2ZiS1NXZTU0MlJVT3NVbktzVmhPU1FQVThJU1V2Sy8zVDhyM1hydFlJNVJu?=
 =?utf-8?B?YTNpb3A1MDZCcVlwV29vR2tzWkErOHlRcTRSU3lXN1lnU1VwUnZFczZDbzhi?=
 =?utf-8?B?aEplWW0vY0I0YkJVcFJ4YiszWUJaMTdPM09MaDJOQlh0V1F5elZJeXh2ZVEz?=
 =?utf-8?B?YXFaVTd5WGNIODVPR1crb2NCN3cwYlFNL0NydXZWV3h6N2JTWHhFZWtQOGNn?=
 =?utf-8?B?U0xtWHlDN2JQODE2Q09yUi9jKzE1V3FZaUVNSmtkeVpOQjBrVnBsbDI4eDEx?=
 =?utf-8?B?TkU4bnl4UmNZTzBPRUMyZW0zbWxVQzF5cHlWZ0Qza0Y4OHc4U24yOXdBT3Bq?=
 =?utf-8?B?VG0zckc3RU5oUFZCenV4cVE2SDFxYXl2Q1hMdHdyNVhWeE5abTBMejlNYlQr?=
 =?utf-8?B?REVHcXBXMC9yRjF3OUhsdUxwUzYvelErVnp5cnNZNk1CY1J2YmR4NW1qRDhJ?=
 =?utf-8?B?T3F2bTJxYmo5TjdmemZJcVVaOG4wU0Rrem54UjdiMVFwbDdCOXdkUXg5cURo?=
 =?utf-8?B?d2FzNFNPcVowMU92ZlM4b09TUi9rNzRsMlBoRVZmdnVlbTY0SjRCZ3lWSVh1?=
 =?utf-8?B?Tml5LzBOalh0QlJFbVg4Z1NyempKYkZEVUI4bkpkSWZxWVN6Y2EyRnNnUXdV?=
 =?utf-8?B?UzZxc1cvVmRZREFSZ2pSYVBHdHVnWVkzczV2SmFIYk1ndmNtT0NQcUNHN0tK?=
 =?utf-8?B?ekErZDZDeW1zdzBzQW5ub0tNOVRZRWIrL1hXcVVMejRaOTNCck1Pa3RoWUZ5?=
 =?utf-8?B?eDRlYUtEaXMyNzVpUmcwT3c1MXFseGliSkNJNHV2T29KZkh6bmw2RWpVWU5I?=
 =?utf-8?B?cVc0Rk1ycW5aNXVIMm1ILzlLR1U2eE41ckxCMFAyblhyTlRxM0djeDEwZEI4?=
 =?utf-8?B?TzI3cERRZW5QMHM1amtpdG1UYWE2dDNPRFJzWXA1UTM2MEN0aHZmK3Q0OEV2?=
 =?utf-8?B?L1JJMlhYSGRNNHh4ZGZaQ1FsUUZRL2phTlYxZG95ODc3NG05K0I2VzhxRE1x?=
 =?utf-8?B?LzNSODdkbUNpNG83N3lsY043NDEzSkpZZzdtbEM3UmdHTzAraGhNZWhMaHBS?=
 =?utf-8?B?MnVhVE1VQ0N2d0haZVA3RmV6NkRpQ3RSTHI5d2kycldHWFpwN3BLV1lsRGM5?=
 =?utf-8?B?R0pZVHYzWUk0MGI4ZWpaUjh4TldIc0tMcXRMamJpZm5uSlhHbWpURXFQRk1y?=
 =?utf-8?B?OFBKVGRFUmcwelg1MHFtZmRrOTJyclo2VzE4NTlab0pkYmR3Q3dkUGMyZXpm?=
 =?utf-8?B?MmsvK21aaHArNExTS0dGNXRDYmE4L3dGWnc4bnFoa3AxQkZtL2tPSCtWYmNS?=
 =?utf-8?B?TXJOYnlBb2dHcHlXbUlpZlFDNVlyTi9tc2FZdlg5dHcrTm5KbDJKMDNXU2Za?=
 =?utf-8?Q?Lhm2ZSZEYILGUb2X8Ldo4lEiznZEDgF6ZJd6Zrx8U4NQC?=
X-MS-Exchange-AntiSpam-MessageData-1: K+xgpSCPJf54Dw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5c202b-d57c-42c2-83f3-08df018bbc5f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:59:38.3749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rk8f04rHpqa6s8iRLQJj5uvhTpP//iYYeGyPgdy0n9xMMa80yIw+Uh0HQi9Iet6ClumnxXEEMymZf4fUdRSW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245

On Sat Aug 15, 2026 at 8:25 AM JST, Gary Guo wrote:
> On Thu Aug 13, 2026 at 4:23 PM BST, Zhi Wang wrote:
>> diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
>> new file mode 100644
>> index 000000000000..e6a8513a47d0
>> --- /dev/null
>> +++ b/rust/kernel/fwctl.rs
>> @@ -0,0 +1,593 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +//! Abstractions for the fwctl subsystem.
>> +//!
>> +//! C header: `include/linux/fwctl.h`
>> +
>> +use crate::{
>> +    bindings,
>> +    container_of,
>> +    device,
>> +    prelude::*,
>> +    sync::aref::{
>> +        ARef,
>> +        AlwaysRefCounted, //
>> +    },
>> +    types::Opaque, //
>> +};
>> +use core::{
>> +    alloc::Layout,
>> +    cell::UnsafeCell,
>> +    marker::PhantomData,
>> +    ptr::NonNull,
>> +    slice, //
>> +};
>> +
>> +/// Returns a kmalloc-compatible allocation size for `T`.
>> +const fn kmalloc_aligned_size<T>() -> usize {
>> +    Layout::new::<T>().pad_to_align().size()
>
> What's this function doing?  This is just identical to `size_of::<T>()`.
>
> The layout from a specific type is already padded to its alignment. You o=
nly
> need to call `pad_to_align()`, say, if you are computing a layout or incr=
easing
> the alignment of layout.

IIRC this was meant to be a const version of `Kmalloc::aligned_layout`
[1], which although it is equivalent carries the intent better than just
using `size_of`. But here it would maybe be better to just make
`Kmalloc::aligned_layout` const and call it instead.

[1] https://lore.kernel.org/all/DGUZ4A6W87JU.36R2KDR7YGSEX@kernel.org/
