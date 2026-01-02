Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020132.outbound.protection.outlook.com [52.101.196.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995B724728E
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352405; cv=fail; b=Jpl2OdUzCT+yC44cYcxb5S4FURWQSdJBtdd4INs+j+C18Bt8mrJfusDQYYrY6y78xB+c+0q/+pKULOyNxWjrp1skGi7Rkf36UOvk4B70om9k1DOW1K2XSgsOvmsUN+p6KMvWXHRjKmWu12zyUPtscNLqW3zuHr9NwQzh7AuaNB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352405; c=relaxed/simple;
	bh=gexIl9h/O5RZicF/DXm3MWoLbkZjiDvguDXjGAFec9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B79TcBCYF0x0XoebN3NoNPQOlFjyFT/PHiVk91sxoxWTxD5HeXPioJf5shc+ub5Mu611F6ub5L7Au2rFtkzwny+XjZShkCaHfAPUmzvRw/ME+tm2qi2Z4JxtqLepfmf3ypu/e3+ZE7T9g2sXiseUUVyOpGB256dCoaNulcb/9Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UfrsWp5m; arc=fail smtp.client-ip=52.101.196.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UfrsWp5m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGR5M2vaKTsRC0XFOEFfcH6DppEolAQZHEB2QZzzF8XSMwioZoXoaJKUo+mQQRSf2zQxCTI4zlRqKcN4PYFOAFGEwc+vWk9WsBNTJCcXflwFQgTn37VB1HgBSx5AZQGXHTntTG+mX2m6/h3IlpW5vVtkEdZSyTFrMCFLSaJtmXFVnOwjRquz3MNXGcWk1MhTnPeLsT+tkJR3TStAQSBPig+AG4cknTlOSQrPg4iNOxgANm198SDfoE1HvopolUtYO3iYDj2HUYYBRRtW7nLl4mhQ1RaFepjRrWVaxNIWRWZ7VdJmwTZwYQlCk1RpuUi2QVybDehA7Hi2qJQGXRkMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYF4bcjgwhBTkdhyuPpJ96cM2IpGhOaOo+nMwFwTn/Y=;
 b=u90TOpMFAa48zTTKkIYX5ytPer8jZN0TTzrQehEoUpyLvOil3pkM3tNVsd0BsxnnRTAxTn+XQ8pdk35iOxoKfKDhi9Rl8Kh8jbcbcS0sx/ZMhtQXbPP2EpT9N2MvuXt6uY6Bkv0FVrmuB3pr856+WXRthg0Dxf1XKuJnJ8RUoaM5weev4EkJPz6S7p4bfkpwG+mv1rcRRIJt7Az1H8eSpPZvsZPa97/SaIOVsWu3R2EXvBng6rS/QXHWCuz9CWK8W2QgrJg6Mu3a06y4BUWj2ixdIXSAodDcGcT/rEF7/YkTu6i2dC76CYc7rkO82CeuQ/sVtU1ya3KKqvxVy7obNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYF4bcjgwhBTkdhyuPpJ96cM2IpGhOaOo+nMwFwTn/Y=;
 b=UfrsWp5mgiq7HiuvccInA1957T+DhhLmpacvRj/FqaOP0t9N5U7CJ5y8neaG2B1JY81SjbW0Y+ieba7oM+8KT7tNwCXNou2QIqN01tkKpMGTysPQh6fjtE3czJ9S7LzVnwf07Om7xCfEnSBW8WejZ4WW82kjAS+6xjHB2vivaXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2094.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 11:13:16 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 11:13:16 +0000
Date: Fri, 2 Jan 2026 11:13:11 +0000
From: Gary Guo <gary@garyguo.net>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, Danilo
 Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, John Ogness <john.ogness@linutronix.de>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein
 <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v8 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
Message-ID: <20260102111311.03eb0b8d.gary@garyguo.net>
In-Reply-To: <20260101081605.1300953-3-sunke@kylinos.cn>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
	<20260101081605.1300953-3-sunke@kylinos.cn>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0281.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2094:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d6801a-69fb-4698-717e-08de49efed5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S0FtpJfVi0Wi0WS0k1z6bljVZtB3WRF0P6gXY8ZdBigvgZSPBzVX9agV3sjx?=
 =?us-ascii?Q?2R0whHP8oPrSZ1E7o2bC2YZtK73nHXBAueg/OT1UOeAMK2hr56CbQIf77bnh?=
 =?us-ascii?Q?D5a7CZS7qlgDJsFE1f5VvE3R7Ht0FF05vPm7E1uqELZxiO414LBibI6gOHek?=
 =?us-ascii?Q?YV2OEZrJESjEuPy2o00UwLPwVu3XaxTrLujoa6h/C4pHXAe/uyRlOzich1Xf?=
 =?us-ascii?Q?KUXUSTFv2TN/we5W8e84vpVt1t7K9/OmFaYzwHLfRDcXz4NdWVO3kAwi4LEb?=
 =?us-ascii?Q?R4mBC2RvDEz5fvWH4DfwmH6ZuLBW9mTFpwKafEL61bOze5kmyug6/7V4yZqy?=
 =?us-ascii?Q?5nkgQcqYh+Slff8AT/xaXMH5iMmOkeISZxktlVtWLrB1tdhiMF5fFpq+CPiG?=
 =?us-ascii?Q?tBNvIbqQWoj8KBOpU4/R+DswCguGrwNhwPFX+J85uijaNQS33e29mJDCvTQs?=
 =?us-ascii?Q?LZ6WRBOmXNDxtWkOBjeZqtRfJS7RnpuyvrNumHAajqdL//GyH9RAB/dZRow/?=
 =?us-ascii?Q?7WyYb48duQQjfbm1IBQwKvPH27O8qp0Zw4gdqQNd8+6T42wXZtBpSv1Ex6mD?=
 =?us-ascii?Q?uDzMXtSLYWqrn5K1BI+xW8EUM9IyrgrECkwhoAUdCT6wS9//lmIuo95Yoi46?=
 =?us-ascii?Q?EkskXvrhYgNedfp2zzx2PAij3AvHlvkWNfIvQBu2spNZ4eQUB8DdZ+bLeScp?=
 =?us-ascii?Q?dHcU0jcav9H38Bzex3WFqWAahWEtNVrGrnEY/IOxm08VpL5TfuE/aQUA66RW?=
 =?us-ascii?Q?hUomIZbxdKXCw9fW19IOI5IbpYLdcOtpRGvQEGe4PqdvyGkRFt3z3J0X1eYP?=
 =?us-ascii?Q?SDSHc0MT+URn64zSGhy0ddpLwC3vRZeyTQ2/6ld9SOq9FyhD883NnTW5CN4i?=
 =?us-ascii?Q?FmUKWqurKeYUAOfdtiIc81WS0BD6LAiYm2pQJ58qnP+5wIgBUIWJcZ/rveAL?=
 =?us-ascii?Q?gvfz8dbyjT6OkiDgw7iNQAUaU61v9DbC4U8USAotPZWX9Cax55bufapHOWMb?=
 =?us-ascii?Q?I68NlfYHp8KlnamlLirjJEb+GP8PTmgHnX1+oepffk8jpMrMWo2h2Q2CjrV3?=
 =?us-ascii?Q?WSDiiYiNbrBGCGxuyRx4pbH1QfXpxws2Hgpez90nwYeZnlUizTKWt1NcTLK0?=
 =?us-ascii?Q?GnpBtVPy5jdCwC88B4wiAnG8mG0U8lUzEmGXrDUtI4uU0bo0+8UAZ8xUazbn?=
 =?us-ascii?Q?d9loaQw3L38Y7RePLAfrRIsQSnbf7UNhdRuoCbmZzNGGyStEZdBMh8N+ev7r?=
 =?us-ascii?Q?waDdJjcTAZGIqtMxn+3Nwm8129mfNKIPyf24ZqDskr4ZcAey/wZ5ImlnDlbx?=
 =?us-ascii?Q?qybJt/qC/oXTWzY+ZTn0DMlzEKFT/siUzdp5oVHZ7yabXWvUWfStVysPZnFU?=
 =?us-ascii?Q?qzRLHhxcXpZkM8RpgXmY8yEtPYqoP/87le55T2q+4AH0hVm00Vn2qkoTi8o4?=
 =?us-ascii?Q?PCWgUmzUWq71X5dmPzMv3RwcaGr2s12h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(7053199007)(7142099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?px8mgPawbg5L/26aIxfBCVFDI6tcTFf33w9tLYAGgeC4QrgEwRNiMRFzQ9QJ?=
 =?us-ascii?Q?RM03SCsBpnUEaJ0chCh+ydB0IuYUOUTKlIR198v6DQDMzTns3SHfOdSlVxbr?=
 =?us-ascii?Q?TdDtvi+aA5ycQ8Ctxerthr8QKZshmO7TLIx0Ueu6d+vTFn/ggVNyM68kfhsz?=
 =?us-ascii?Q?S+2zmisrjKM2jXydHtlPVrOC8wTJTjPDMupyDS2UNouKBvTdVjBg1LqsWZKa?=
 =?us-ascii?Q?C61cTeMpP38ShpCaIV/TwR3NSR8L8S5Wu3c86BLm+uZIcLP58v8Ht4Ja6/8P?=
 =?us-ascii?Q?/Dlpce5nyC9PYY615Zgakt8NEPJtWTgBRSoNh/YvkN8YQBpOg+xijg3Rltly?=
 =?us-ascii?Q?pCXB4FOfco40dzu1OJhGYxZbKSneXUlUahQqMNW2JPEYG029VvQfy3aPDoGK?=
 =?us-ascii?Q?BS/7vSU1hUQtD5HheIQuVvuzBZRoLwDxJDA30a31u3tKETG1GXCwERDgpKQL?=
 =?us-ascii?Q?rG4UGvQUOM+MgWBSEcfG3S58nZ9YpPmkG+pCwL3FPG4QCijkiOylcOhsYQML?=
 =?us-ascii?Q?R0RckvHdgsrpO6OMzsg2HQbOjNjICo1TA9oHcG4fjRTMFOMWiYbrvR5A+8ey?=
 =?us-ascii?Q?VhijGDcyqGehJsNpX4y/qegMTY7tmhDa1YPoUh6jXnDV0NJcVFE8ubz8aewJ?=
 =?us-ascii?Q?V32eiM6PNVu7Qj8wRI5bbHmSNKuLd6qIbLKDjcCLDhTrSsgcKZcaoVgywvWm?=
 =?us-ascii?Q?qm9oT6gJ3a4VsJDonXGIChTc1yBSozHALTzYYDPANyFoEu7srafQN+oooVy3?=
 =?us-ascii?Q?aOdo4ZF8al38QhWqU0/ARkMfBTN2sw6xWV0jL9JTy1l2L8pbB7FTUe/d7oSD?=
 =?us-ascii?Q?HFhemFGEBHV3Wv8nv5GYscMMmVorIWYItRWzPOSFPEmEwZP29tfmno4NP4Ta?=
 =?us-ascii?Q?uXIikRTNkeYezWAuWFzk6Mpt0IZHyzcyXwmxwuMhoug5tQOwhB6/11CwiwyU?=
 =?us-ascii?Q?e4qw5xpErFAVAI+fjsko5GvDcWkJlGd4d40iYrU9FRHoNNZlVNKsmUHU9VK/?=
 =?us-ascii?Q?Z8gLcKPKEw0KhfkMcQgZGfphexsG8JjY0jH+dR7pmCoOzP9U4X4X+3xUjrhE?=
 =?us-ascii?Q?mLWNOCmrgjWnB6MBMvE0V/aE0k5wDS9cgQne/SEWBza39YVEIlK0u67htzoc?=
 =?us-ascii?Q?vAo/hNA4k1tKDCHuRGeyFiJz4FU/2g2Wa4Csv+4i7B2eJ1qJfZvLJBHBvQyW?=
 =?us-ascii?Q?0iN3AI/M22TBN72yGDhAYHB/dsVPWUpifztYLxq3GXGd8AsOn/nG0FD219Ro?=
 =?us-ascii?Q?o/Q2W4KpNdzeOaJ4ptDPd/ZIdQXgA9RFUcAcF4FPPqeWhc6ApNGIhHcRDMiz?=
 =?us-ascii?Q?eCipXvezx0F+oCmGRKaGvmD1SUH8FUtQXJ85D95JwO+6J3PQ8osVTl9BSQQf?=
 =?us-ascii?Q?MxlZCN+NQdJDP3zkbTOkRYyTNsjQ/iQO78k+Uth2Y8G4DWVK8y2kJXVaQ4S5?=
 =?us-ascii?Q?EzVeT0zAkRj+XiktXG0cnUBpZ96E2xQLCgliMgyonNMlOyMpwi10c0Th2bQI?=
 =?us-ascii?Q?zS26t1W2U899l466rGQ4NidtfrWuQ//Q0os0erxO9Z5Vctt/dfEjJFYZ1yJA?=
 =?us-ascii?Q?/86g6r0YVCmwqBi07t+Cr2kB9tYIC8ubVUQ8EzC4YcKB/ALRfK/2NvQCRDBJ?=
 =?us-ascii?Q?eBMrGIOyzHx2PluyVPtYvuQA7WgYihkcWps2kwDDOW4K5Jl2F+/rgvC8kvyI?=
 =?us-ascii?Q?B3S8yg465TqFa/11iYkrBS3b7haX+Wjdc5nUwLh0dn/mrNO/4knbag64yeKX?=
 =?us-ascii?Q?uy7bzZST/A=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d6801a-69fb-4698-717e-08de49efed5d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 11:13:16.2491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzkWK4ULGxcvsdqQpvu86Z2I/dLF4lXOY/Wu7CfRl9rl5ekP0iz6UnxnvOCxa6dJxRv5ui6igVYwvtn2QfzA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2094

On Thu, 1 Jan 2026 16:16:02 +0800
Ke Sun <sunke@kylinos.cn> wrote:

> Add two pointer wrapper types (HashedPtr, RawPtr) to rust/kernel/ptr.rs
> that correspond to C kernel's printk format specifiers %p and %px. These
> types provide type-safe pointer formatting that matches C kernel patterns.
> 
> These wrapper types implement core::fmt::Pointer and delegate to the
> corresponding kernel formatting functions, enabling safe pointer
> formatting in Rust code that prevents information leaks about kernel
> memory layout.
> 
> Users can explicitly use these types:
>     pr_info!("{:p}\n", HashedPtr(ptr));
>     pr_info!("{:p}\n", RawPtr(ptr));
> 
> HashedPtr uses ptr_to_hashval() to hash pointers before printing,
> providing the default safe behavior for kernel pointers. RawPtr prints
> the raw address and should only be used for debugging purposes.
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> Suggested-by: Dirk Behme <dirk.behme@gmail.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  rust/kernel/ptr.rs | 133 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 130 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index e3893ed04049d..77132eaaef73b 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -1,11 +1,22 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  //! Types and functions to work with pointers and addresses.
> +//!
> +//! This module provides wrapper types for formatting kernel pointers that correspond to the
> +//! C kernel's printk format specifiers `%p` and `%px`.
>  
> -use core::mem::align_of;
> -use core::num::NonZero;
> +use core::{
> +    fmt,
> +    fmt::Pointer,
> +    mem::align_of,
> +    num::NonZero, //
> +};
>  
> -use crate::build_assert;
> +use crate::{
> +    bindings,
> +    build_assert,
> +    prelude::*, //
> +};
>  
>  /// Type representing an alignment, which is always a power of two.
>  ///
> @@ -225,3 +236,119 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
>  }
>  
>  impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Placeholder string used when pointer hashing is not ready yet.
> +const PTR_PLACEHOLDER: &str = if size_of::<*const c_void>() == 8 {
> +    "(____ptrval____)"
> +} else {
> +    "(ptrval)"
> +};
> +
> +/// Helper function to hash a pointer and format it.
> +///
> +/// Returns `Ok(())` if the hash was successfully computed and formatted,
> +/// or the placeholder string if hashing is not ready yet.
> +fn format_hashed_ptr(ptr: *const c_void, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +    let mut hashval: crate::ffi::c_ulong = 0;
> +    // SAFETY: We're calling the kernel's ptr_to_hashval function which handles
> +    // hashing. This is safe as long as ptr is a valid pointer value.
> +    let ret = unsafe { bindings::ptr_to_hashval(ptr, &mut hashval) };
> +
> +    if ret != 0 {
> +        // Hash not ready yet, print placeholder with formatting options applied
> +        // Using `pad()` ensures width, alignment, and padding options are respected
> +        return f.pad(PTR_PLACEHOLDER);
> +    }
> +
> +    // Successfully got hash value, format it using Pointer::fmt to preserve
> +    // formatting options (width, alignment, padding, etc.)
> +    Pointer::fmt(&(hashval as *const c_void), f)

Can you use `core::ptr::without_provenance` here?

> +}
> +

> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct HashedPtr<T>(pub *const T);
> +
> +impl<T> fmt::Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Handle NULL pointers - print them directly
> +        let ptr = self.0.cast::<c_void>();
> +        if ptr.is_null() {
> +            return Pointer::fmt(&ptr, f);
> +        }
> +
> +        format_hashed_ptr(ptr, f)
> +    }
> +}
>
> ...
>
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct RawPtr<T>(pub *const T);
> +
> +impl<T> fmt::Pointer for RawPtr<T> {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        // Directly format the raw address - no hashing or restriction.
> +        // This corresponds to %px behavior.
> +        Pointer::fmt(&self.0.cast::<c_void>(), f)
> +    }
> +}

Given these types are only for printing (and not applicable to general
operation on pointers, I feel that these should go into `kerne::fmt` to
stay with other formatting specific utility.

Best,
Gary

