Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07072D7DD7;
	Mon, 12 Oct 2026 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820252; cv=fail; b=Io04Mm4UPt+ngbqR5lOXlvzSjf+eaA/ba9baHTy75EJpoQuR+PQ7TYVRYN21DnrtiNYVIKH7z2KHsdd9+/ABNWF3yaKxvoufJndzut2xeujG0ZWYY1pYxtmY5OY1nQU0rQv6ziALBmjIKuA+Zp4sUDmfI5PvB6LEdmqFHiZsMJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820252; c=relaxed/simple;
	bh=qNRknCT1HzDDWqy1bc51K94upHhLWwLGgKmsftgcucc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jbJ5sTUtWhIvWXFB+jIqmQdCaWJNjIwB0+XWy1GsxLnlsomnv6K2EmVMP+200CEwgfVm65ldZAsPihiiBPKEbuSZ0r3I3oLb+v1OdKRJ0cAhzMG4tZgIDfqxNiDW1QfIWVwOYpHsezIqb73EbrQSW9whlsdQF5kFgbmnfOQ+p8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S1Oo9sll; arc=fail smtp.client-ip=40.107.208.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S1Oo9sll"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFiwTZOArC3pBSvD18SNKPV5JrL7jA33tqf47JQnh5xQA8ih1dGnTrC25jkY+HKqmMozpPDtXghwlDKZEZCIf8upiAtxRawJbX/TsJcwd7qqk2M1EAKxpqD1nWzwL1+cCNqgz0NjflszbEAIEmDliNTMk33iyLuL+2mk8Qc65M4kLbPd0HZ6WC32bNzaNdF6QFI0/Mi36OayKEu0ILnJqeCXfFDbpPzMpSotHjEn8evh1F5jI3W8A1tMO6LlOkvtEuMdFuFgcUEVQu12Is2a5nP5H03cdP7jPC6jub4pydq1mE7vDz06l3P5GZdapcCAu5au1SeUa+1BcMJhVaV0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmTcJKn1nqBIFUdjAJoZO7+nfjR1U+LjugHAkQ5Fl7w=;
 b=FQk4xdTBMgktESSjDXYoOPWfUJlBConGX6gh028wxdNuHK+1Yz+U0jT6jSdghdPZymfAXnS5lgBtMYhjDhQ2OL7M43+SkvTQY0RmI8DBgN/DGNHb3nyXAao7YDSCRoZsLuWRtv39KRfdYv1qwc1JFH+qeh9RnytytO1qcHMjGsCXgIVfKZ7YBSXMeaI+FHTJ3nEckDE1dY6TaEZt342Oxcj3uUC6QzZt25zZNzrB/lIe6ppN+QmJ0ARe7iBZbT5t1JdpWNjwJQHRI1g8tnh319tw+FQ2/MrDP2c7plYQg6I4YzxdPu8Z1yHeDdjTSpMzPlEAtiZ3zvbNLRzWhVNjBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmTcJKn1nqBIFUdjAJoZO7+nfjR1U+LjugHAkQ5Fl7w=;
 b=S1Oo9sllol6JdrBQdjEL5P66YBC+dNM1Hi38KHjrdp26pOkUbKlAv9VdH6+5Cb1Cw33CoNqu2WNPNYOiGEDax8ObJqOk9y/OtLEUbGaxRHL5HazHL7CDwBCxT9FGQcrcl/svSJsk///RUR9gN8dBmwJqWXMWid6yMqJOV0uYJGb4WQn3qg6DN2xlKHyOe9ddGYwbht3QUwb+4DsU7bo9Ifb3pjOUzqsb4ODgz6BF7PqcRuwTIE8E0lLWxDSYNDpBgG0g07nAhCcHQPPnP7MKxmWDG4Ulk8p49kEdtjtASzbanCPiP5jWwq4lXJ1u+Xj157NR/FN9vkJ/Dw8EF/1Cmg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS0PR12MB8020.namprd12.prod.outlook.com (2603:10b6:8:14f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 12 Oct
 2026 15:50:42 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0496.015; Mon, 12 Oct 2026
 15:50:42 +0000
Date: Mon, 12 Oct 2026 11:50:41 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rust: alloc: move `NumaNode` to the `numa` module
Message-ID: <as0B0dC0IUae9iTu@yury>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
X-ClientProxiedBy: BN9PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:408:f9::33) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS0PR12MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 84efd7ba-2ef2-4ab6-0cfe-08df28789231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|10070799003|366016|22082099003|10067099003|56012099006|11063799006|6133799003|4143699003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GnDCuFlBoHC3D018Jexdy9qd34SHKmWR9ViqGNkYjMN/UB4eeT/1tMmO1oAEzAVUBO1Xxpn4BCIF4E0CwDg1rUgFaafnGBvflQLy3tebjXTU+JmwklUKySzH1cnOURY8Kc6AQKF+hux9MXxrHaSSdTX7yAeRuO3j94B5YHwfEzEidmiK0JdCb+CGiDy/XUCbHsVUucxNKP5wbFS0TI2gEyKAHvkmnXNGfxf2kEwKqYUju//O/94gnBJjFF4aVq5dKSGiJU63/lslvomhManbZXx//75UdW09u0h8FdO/sgkAkEqt1KX76D0e5cSwb0vwU2frOhDRXKiIkfS5bC2iiU+mRpd9yQCQTdx/LGWX3S5ZE3XYE2UL5i1LHVDmdJm+D6PXN+ZaEsRCbZdHuqBTW8Q1N3zdvQRRZUjSI0kRVSvf8QiS7BZT4eqbIuAwjf0HV72f6cCCjhD45VX6PodWeAflK9ofH0272V1HTq/UUKF/Y7XKovoP0Gig+X9oihBYIsVCEYfNK12ijJL/iARf4q1SbxBSUgadVNvPVSnCUAj70n3fMUdY0PHTs1c/0CYJWLEAPTDBEAgP0yXLvzYHMZa0opspr/ZpWFVwIZLeFogpcxYfjuqWW8aQxvi6hgRhX+FEwv8q14uRiZ0jhqHBwnwmTAq9SbCk7vo/uodfbfU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(10070799003)(366016)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZufqHf19OaaO8IpVmKLj8zswOEBq/231DFm5TRwWLS1MUQ/yH+XetYupL6BN?=
 =?us-ascii?Q?/nDpvvUkNC0HE3NZyz0goC7eHpMw3E7mY654JHBoFcAKsvGdHqQcLdK7P4J4?=
 =?us-ascii?Q?60wAk30AkHtyoQzer/33iSdz8busaB9ZAoPpIL6Ja9HBlG674uWdVmOA7HXH?=
 =?us-ascii?Q?PuFLbkyi6o0o/Dy+oG5PrvCPc2b3xV9WE8n6bsijwCYbCOz0WOI5Q/ZqyhJ3?=
 =?us-ascii?Q?pRS2E7k3Atlj+vVn81JzpCHqSqSa47RtJtO2F+fghBXy62jjY2ZxaD4ZIyzS?=
 =?us-ascii?Q?i5JG/relrRoImmbn0RNP4kLK6oX/Mc72H0U+ViZlYLXb+j2sblwfdVzMhfFr?=
 =?us-ascii?Q?JiyN2bdUDQJ75iGzlksohYXUkZk5DBeI/fpH3Vv6KeuHwqeI7Qg/fNL0FJjw?=
 =?us-ascii?Q?tibMm55tFrisKe8+AOvVeEAJ8UnSeM7HIJ2AIia65y1k2vmnqP6F02skJT2a?=
 =?us-ascii?Q?sDsCbiW88NWnX+Hso2o0fD0GDKIOc1uui63cSISaHko05gbJLUiHDI68KFuS?=
 =?us-ascii?Q?k+H1SHDbz/ih6N3KjhXaragWhmb5sLkvOwv/NeJ6Fz1nwGgGfCtuLuNa7rdl?=
 =?us-ascii?Q?dFuA8W82e+ZQA0TfDhXNSCPz2j/zuh9+912+EvgnfOtM0VffGfjncTeDd3oC?=
 =?us-ascii?Q?pW4SItvc9I78lgulSHswMWgTJSVic6D8mke/3EqciSub3a+8rClDS26qV67M?=
 =?us-ascii?Q?nMxGmHH1sj+S715zT1DRC5eTgAif/dwWln1F5cpm1PH+dbC1fo0PjFJlvwGi?=
 =?us-ascii?Q?LJO0+lyISSHKi/v21GMd7XZUcrP2YU+XIuYfqGE0SzslPa2ktl5NOI/R112I?=
 =?us-ascii?Q?bt7tsyswbDMBcBbktzLWfUIm0KdlVRkGefU5XUyeR1BTRba4QuMT2u6OwMU+?=
 =?us-ascii?Q?TQrecON7O5iizWNQuXMfeVhLyEWJQvwpXfYeEYij6tw56ztZrqb6HStUrH8c?=
 =?us-ascii?Q?Tj+IOrBOCcZ4ZXFHU9PljCVM39+/mWP1DBOJ9X+Q9UG+9DKnKwF7Z+3C6Nt9?=
 =?us-ascii?Q?gkgcmCZuficyfr5m5KCpAkOVmWD3GWTbg0ae3KtRL0yG+3QeYBsAienLS4eX?=
 =?us-ascii?Q?ohIhah1MHLNGlHRZs/s+wd46D5sn0YCMPc/zPnri4WDYBWBEpgBTq1i3BrZV?=
 =?us-ascii?Q?8TmsHsoSfc6pg9W1TVcuT2DJiRnjZr1m9GfCMv3FJCpRUVJ9RrgLQOmZB9ET?=
 =?us-ascii?Q?cMhjxNhOwjp2UdDhI+TGZMsuKL7IuactHaex4DOJmGtREEZYPSeSMfg0Y0n6?=
 =?us-ascii?Q?xyqbD1m+6u+dhMzKG3fYKWdl3fU6Evx8O/y7X2bP4haj7wu5KbetVFGVmWdJ?=
 =?us-ascii?Q?gNtqL23eVDxJ5cwb0k6M3REeyPfegn2MZETDtllLv7rBhnhKiz8rIbhuqXKX?=
 =?us-ascii?Q?j/wb6y9UZxpQynTCd/TT7Ndx74um/kOSbidEw3rUmuenWqqRyzD5p/TvNmya?=
 =?us-ascii?Q?gIqODzrn4E8oI2ZS+heyLIe2CVCKI1WWuHXPoA6qkvICOz6diOI0lKz1rkBT?=
 =?us-ascii?Q?EOBy8ebXIPS8zE9nydrb6rGPaaheg/L6JXvk/dNe5ObiPhStCDyo2x2TmZGN?=
 =?us-ascii?Q?s+enhzvmsXKGKAL9Gs80DOifCtfSe0+8FvpQnZXrqDMpewjy/PASUeGcxFMb?=
 =?us-ascii?Q?K4KfJMT9M9LMWyiiJB+ajSUzBCQBbIGRhNHyslMT7kkKezmhkXnDE5xhAX88?=
 =?us-ascii?Q?3KYJSrevYa7odfxbU9cBEJSoUODa2TSWsjqUOD4CQfgEh4f7dCb9wuXnspji?=
 =?us-ascii?Q?IXpTzSN4iT5SHYuwxSk1qWk0yqEAWZ2SKfacOuo3d/SeXx3G66FI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84efd7ba-2ef2-4ab6-0cfe-08df28789231
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 15:50:42.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwmXoKxun0d2G5yxBXcnZWTldY+NLRfjAM0AF6lvi6rDgAVNXlAqqCM9iSvLu/GkfhhCOElvmiX14j44SGDOEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8020

On Tue, Sep 29, 2026 at 07:56:50PM +0200, Andreas Hindborg wrote:
> `NumaNode` identifies a NUMA node and is not specific to the allocator API.
> Move it from the `alloc` module to the `numa` module so that NUMA related
> items live together.
> 
> No functional change.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/aiZvKPFCkqJUsP0a@google.com/
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Yury Norov <ynorov@nvidia.com>

> ---
>  rust/kernel/alloc.rs           | 30 ++++--------------------------
>  rust/kernel/alloc/allocator.rs |  6 +++---
>  rust/kernel/alloc/kbox.rs      |  4 ++--
>  rust/kernel/alloc/kvec.rs      |  4 ++--
>  rust/kernel/numa.rs            | 35 ++++++++++++++++++++++++++++++++++-
>  5 files changed, 45 insertions(+), 34 deletions(-)
> 
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index 21067bde6860..9daddf540e7d 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -22,7 +22,10 @@
>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
>  pub struct AllocError;
>  
> -use crate::prelude::*;
> +use crate::{
> +    numa::NumaNode,
> +    prelude::*, //
> +};
>  
>  use core::{
>      alloc::Layout,
> @@ -114,31 +117,6 @@ pub mod flags {
>      pub const __GFP_NOWARN: Flags = Flags(bindings::__GFP_NOWARN);
>  }
>  
> -/// Non Uniform Memory Access (NUMA) node identifier.
> -#[derive(Clone, Copy, PartialEq)]
> -pub struct NumaNode(i32);
> -
> -impl NumaNode {
> -    /// Create a new NUMA node identifier (non-negative integer).
> -    ///
> -    /// Returns [`EINVAL`] if a negative id or an id exceeding [`bindings::MAX_NUMNODES`] is
> -    /// specified.
> -    pub fn new(node: i32) -> Result<Self> {
> -        // MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10.
> -        if node < 0 || node >= bindings::MAX_NUMNODES as i32 {
> -            return Err(EINVAL);
> -        }
> -        Ok(Self(node))
> -    }
> -}
> -
> -/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
> -/// about the NUMA node to allocate memory from.
> -impl NumaNode {
> -    /// No node preference.
> -    pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
> -}
> -
>  /// The kernel's [`Allocator`] trait.
>  ///
>  /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index cd4203f27aed..4af50e20933b 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -11,12 +11,12 @@
>  use super::{
>      AllocError,
>      Allocator,
> -    Flags,
> -    NumaNode, //
> +    Flags, //
>  };
>  
>  use crate::{
>      bindings,
> +    numa::NumaNode,
>      page, //
>  };
>  
> @@ -122,7 +122,7 @@ unsafe fn call(
>          // - Those functions provide the guarantees of this function.
>          let raw_ptr = unsafe {
>              // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
> -            self.0(ptr.cast(), size, layout.align(), flags.0, nid.0).cast()
> +            self.0(ptr.cast(), size, layout.align(), flags.0, nid.as_raw()).cast()
>          };
>  
>          let ptr = if size == 0 {
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index c63d6acdbb6f..0fa736c81287 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -13,12 +13,12 @@
>  use super::{
>      AllocError,
>      Allocator,
> -    Flags,
> -    NumaNode, //
> +    Flags, //
>  };
>  
>  use crate::{
>      fmt,
> +    numa::NumaNode,
>      page::AsPageIter,
>      prelude::*,
>      types::ForeignOwnable, //
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index c7546b9da4fa..b669ca10b3f7 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -14,12 +14,12 @@
>      AllocError,
>      Allocator,
>      Box,
> -    Flags,
> -    NumaNode, //
> +    Flags, //
>  };
>  
>  use crate::{
>      fmt,
> +    numa::NumaNode,
>      page::{
>          AsPageIter,
>          PAGE_SIZE, //
> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
> index 164e622d325f..4a3a880308f3 100644
> --- a/rust/kernel/numa.rs
> +++ b/rust/kernel/numa.rs
> @@ -4,12 +4,15 @@
>  //!
>  //! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
>  
> -use crate::bindings;
>  #[cfg(CONFIG_NUMA)]
>  use crate::sync::atomic::{
>      Atomic,
>      Relaxed, //
>  };
> +use crate::{
> +    bindings,
> +    prelude::*, //
> +};
>  
>  /// Returns the number of online NUMA nodes.
>  #[inline]
> @@ -27,3 +30,33 @@ pub fn num_online_nodes() -> u32 {
>          bindings::nr_online_nodes
>      }
>  }
> +
> +/// Non Uniform Memory Access (NUMA) node identifier.
> +#[derive(Clone, Copy, PartialEq)]
> +pub struct NumaNode(i32);
> +
> +impl NumaNode {
> +    /// Create a new NUMA node identifier (non-negative integer).
> +    ///
> +    /// Returns [`EINVAL`] if a negative id or an id exceeding [`bindings::MAX_NUMNODES`] is
> +    /// specified.
> +    pub fn new(node: i32) -> Result<Self> {
> +        // MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10.
> +        if node < 0 || node >= bindings::MAX_NUMNODES as i32 {
> +            return Err(EINVAL);
> +        }
> +        Ok(Self(node))
> +    }
> +
> +    /// Get the raw representation of this node identifier.
> +    pub(crate) fn as_raw(self) -> i32 {
> +        self.0
> +    }
> +}
> +
> +/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
> +/// about the NUMA node to allocate memory from.
> +impl NumaNode {
> +    /// No node preference.
> +    pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
> +}
> 
> -- 
> 2.54.0
> 
> 
