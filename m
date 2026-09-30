Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020072.outbound.protection.outlook.com [52.101.195.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84126372EF7;
	Wed, 30 Sep 2026 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781193; cv=fail; b=pOUrwB0r2ZglJFkmKJ4PmK7e4iMzY9Xr5AOm568Hfm0XGxk4VzFYBj6WM6wp3/zv70gquNQ9CoehJgRbF6bspUvQpTvkieZPbFFCT+3Eey7g5+YSAuZXyMutiiqpFmx7yOMPnRnDX8hkiP2OPtXWmn+6tzXcc79y+1zhQH7eFEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781193; c=relaxed/simple;
	bh=C002izBszELp/B9ytbiRGs675YIQ2I1086+Fn7qMW58=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=mKnatbjRYRGmsp6prFGBLrBiOs2wfv/KKthRCbwYKmq2kQ9P79JRuhQnRm2hj+ZeAtobl5FlOVyBcBCIR65J97BToVOWGAr9KWsRhSynFYmG7zH50qqOl7N414cevJ0q3LmcXF799Pk1YCG9Gs8esx3GEkl6zoA7iobNRt8oFUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sPyBsTT+; arc=fail smtp.client-ip=52.101.195.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sPyBsTT+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcHOIX2UR3xt1mjVbNEhv+7Fiq5y1l9WeckG9H7LgVWrftdDXNbNsC7PhjvcSZ+21BcooQImkGIogHNch2oMQ2vEw94yxLdlZ6AOKqx96AwgeNuq64I1qMl1LIm1hry7KnF8e9fdKzmwHRjwKnrQHdFKJ2r0LiTCWlzmJ9jCSmkQM9b9GPSpES6x56Hofr7QbfYUY0PrBnDustSYLdBQCV6sTpjuP6ctZAJQmyENLR7J9M7KT2HpduZr3Eub16osS+5yR16W6RbW+oEPCnoEL0hZ/yeBGQo8tSzO/G8i70OhQacIuuJNAO+vJB87VZljRtux3O3EC5eHBPdegEZe8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIoH2ga49zUNZcYGP55s/j2FxPCr3k8iRyvCBAyHP3s=;
 b=m3I1F0+RvneFH6A/lLSkexVXvGVcm5PMCMNmijABE/0JS4q3q3cgC176ovtZ+IAP88wUsBAb620/+L6u194JakmM4uag4HmpC49l8PaNWqnjvN5hX6n6DhYCbkjiAG/z+wZYVG0zGkp3/Vh+3QS5g/LBo/fA9QU0sYhhprAdam/Se2m1F2lV+QrHSMwZ9OvM8iBhtGEWAEyPDyfWA4hoAJLpUbfozJzfnMcbNZOXFWnYOUKYB7IpebV6nCkgsZSJX4Q4qMxsCujIIspi39bimZJZtSpAZR+MiSqY7YN1G/1X+4mH145k/ZqSFYQNKsVouigPd3esVheMyAhBuLpIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIoH2ga49zUNZcYGP55s/j2FxPCr3k8iRyvCBAyHP3s=;
 b=sPyBsTT+pdCvdU0xarRAItw3OeTzUMCuFqDmt48wtl0WkGd/NkbWmIzqzRAJ1wARrptMZ6q4VfTMEqnVvzoHUfJHW2D8vQMzbxYw05SPA7kX2YrcKVx++R1c5qzBBWDNdWZFVmGm1hwv4apfZ4ai4a5/r0mVRTNxutiVdoprk5c=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO3P265MB2124.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 15:12:55 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 15:12:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 16:12:54 +0100
Message-Id: <DLSQY2IKU5IO.3BFLXTCTJ5I6U@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 "Uladzislau Rezki" <urezki@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] rust: alloc: move `NumaNode` to the `numa`
 module
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
In-Reply-To: <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
X-ClientProxiedBy: LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::9) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO3P265MB2124:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9fd0e8-fec4-4b5b-e901-08df1f054ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|7416014|921020|4143699003|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UkNvYep7hCpv1rrx0iOEwfAAgifCFdZ2gO9VzEx3mlAkyEDd35wmren6gQo6b67LcpNW/lDZ/+2Mcr/tBjhvtwhUfYZ/HItYuO8Is8KUo/Wh4q8u+I+KXF4qB4KXtH1TQLpxIm2ecxa5mnvFQWkJnYk4us7AmgDBDuCOmdC2lvpwdTJkadJvqRmYZ9AzkrEYEDduMcytkuN0mQCVcs1w97biWP+yYIQ1ogEhSJ8YJ8MwEXhDaubeuSqzLzCPaHyITWNksjr3GSr+CMXXHFzqj59MPF96Ih9AU4td6siiP8Ag+10GiCo8PGYt3tG9aOMKQZ8D/zTSSoJEF4cmpNg8m7T2jCLqEjllf+pC99r+R8dy0/zzLxBMi2FTzWjoJcsJZkX6kg8HqlAm/GmzT0WR+WxL5VakhE+Rm44GYPjvudsgjTNkvhyg3ZXioCveNrTbvZp02d2RDIhto7jOqQL7SxZybmX8yC2glbEKpMzsWlm0mXf2kpzWDpoz4+Sgq942YaS4b2bQL/FuM6lDJTOU8hYObLAvCj5maDNOue0TDXskO3+cpKFkdp3QH1D7zHFwXQNrYaE7w2nxS0Zlm1k6SvQOpk3tgYLYaqzDdNvUezqm87HBGOpSWkLx05IvDtbvLEr0zc6+Kn1IqGzcgCy9yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(7416014)(921020)(4143699003)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eG1Pb0E0Z3dIL3NDTG9IblB1dVRwTFM3K1M1LzE3aFdCWlo5bWMyUnI4VUZk?=
 =?utf-8?B?UWVHQUJvb25nN2E0NC95ZGJtNnBqaEFBM2dxOGVtU25Zd3IzbGM3SElVbWdw?=
 =?utf-8?B?UXM1U3hjdkNrL3FnTFpSYWwxL0JhSzMwL1M5U0RiSWNJcHlPZWduYWNKanBB?=
 =?utf-8?B?a1FHaVh4NjRQTzUrNmFqRXd0RnFtR2dJZjFwMy9EMEFHeGNVZDZnYTZHRUxW?=
 =?utf-8?B?WmRkWXVHczhNdmtwd1l0M0FrcUhHQTBoZDFzZUlMemJFeWFzc3BXZXNjS1o0?=
 =?utf-8?B?bEtDSnZqWmp5SGIzK05wZFdYclAvMnRCYnVLSzd5L3Q3THpxZ3pybW5adGFY?=
 =?utf-8?B?dlU0eGw0TDBySUhWWm9sNjBNTVRVMEtENkwvQURoQ0V2NjBWV3RDeTJqbmZq?=
 =?utf-8?B?Z283NDM2Y0NsYVY2UUQvc2szZ1IxK3pLa24yZjVZV1h4N21FKzlnbUphSFQw?=
 =?utf-8?B?ZDViTjhtUkJyRXJ2SzlwNm04YVM1ei83ZXVuNDNhRHJyd1g1UU4xcUZNaDAx?=
 =?utf-8?B?Um5aa2Z0a1hTMUpiUkxkOVhiVjNDc2RLcmFZYWVpY0k3OTFibnZEbjNjekVV?=
 =?utf-8?B?bExmMTlIaWg2ckQ5T1hucVJjSU52UlpjRTJVeEwwMVdiaDVDZkplb2s1elk4?=
 =?utf-8?B?djlHNEZmRVNGMnNiYlNDZXlFSXFabUhjc1l0bFluWVJVTjBHN3BmcHJVNXV4?=
 =?utf-8?B?WmNiRlBJMmhySmlqQ0RLMG5zdTZDUlg5YVk4SDM4ejc4em9WbE1qWVlOalR5?=
 =?utf-8?B?QXRrNEFEUGZEd3dld1psb0FTdzJzUlZEL0czZGwrRGl3M0kxU1ErMEVTUlBm?=
 =?utf-8?B?ZGJHUEFEVnFONVZPdDVkMHlYWjdQQkFWNkluc1RUaEFWa0g4bVpNdlZ6SnFX?=
 =?utf-8?B?L2dYZHg0cHhEZlhMWFdoNXNBVFZweWVNQTl5dnZCUHdoSEo2Z2xSMFBZOWVG?=
 =?utf-8?B?amUzWi9FL3FydUplenhqdHhyaXBFNVVnNmtTT05KNUZibGNxOU5FeXU1d3pU?=
 =?utf-8?B?a215RDR6dVErTWVLSFZsOTgzbUR6clJlWHJRMVNQS213STR0Uzk0NGZXcEtT?=
 =?utf-8?B?ZnRVZ0NGZGw5K21vWWRMcER6c2NIVTZPMmc2MkQ0Q3Njem9IekdjNHRZTldB?=
 =?utf-8?B?c0MzWktlWC9zYTZWak85Y0dVT21OUzFCOCtVTnZVSkw4a0dnTi9kMkg0Mit3?=
 =?utf-8?B?cTJkZ3BSbFVpam1DZm94aHNWd1NFVklwbmpRWk5Md0FoYTRNdzhhQk5meUhr?=
 =?utf-8?B?QmFydHJKREdsTVdzVE5xcVZiQk5MRVRVSmtPWU5JOTIwRG9KZG4yRTRQMDZM?=
 =?utf-8?B?OG1tNDZ3QXM3K0JjS0p6ckpKa0dXTnIwSThkcVcxUWdOaFlpWFRSdGowVm4z?=
 =?utf-8?B?QUpuY2lBS3ZTZ0xPMWFURy9iOG1GNnppUm1vOTRIbXp1cnFFSHpDcWt1Nmgv?=
 =?utf-8?B?b0FvRTJ2MDcyamxIQ3FLdTlJaWJnbWV3TG9ZWWEreEJ0MDFqaHF0bFdoSkFi?=
 =?utf-8?B?cWlFdVVOekdxNzlpV3IvVjBjN3J1NWFwOEhiOG43NDNQd2ptZTVBaURLZXpl?=
 =?utf-8?B?K0xaM3MyS2J0SnAwbFd6aXE5RTdtQlVBbmlmcTNUa3RLUEE2Q1Uxd0NFaEhS?=
 =?utf-8?B?VVhGVDZlTGF4UUV1SnJHZURRMHJvVGRuaC9CY21OR3ZBak4wMDBPMk9KY0xF?=
 =?utf-8?B?ZVJlanRMYnlzaGhXbGd6NUVobTNEZWpSQThYN2RGeWJuQ01rYzlsRkttam50?=
 =?utf-8?B?Z1BrN21QckV2bDFLZEVLNXlsUUFxR0lFQVRoR05LUW5ZdTlUVkFhQjQwcGFV?=
 =?utf-8?B?d3ZXV1JhZVUvQ0FweE9RQVAwVWFkMG5PQ0wwMlBBTmNBbTlYYkt5WUZQaTN6?=
 =?utf-8?B?MGl6cXJkQW9yMm9wV3FodkNjL1ZZVE5YZ3M4S2lXYWRYaDhrM3JZWCtnZERC?=
 =?utf-8?B?T2JiY0xWVDJja2xqM2NmZ1k3MklSSkc4SEYxV3VSRTNTWERsWWl1QmxIeXNG?=
 =?utf-8?B?TFpLZmZEWXJFRmUzeHpSK0cvc01ON3gyMHRPVkNuQjZGcTRRdVZKZXZUbmVm?=
 =?utf-8?B?cWFyckNIZ2k3Uzg0MEU4eE56TjNzN0FYSGdDMi9SZVovek5ja0JQMWYyK2FQ?=
 =?utf-8?B?eXQ2SEVuWTl4SHVacWZhRGZxWFZ0b0hCeFQ4ZmRML3dqbUZNSFVGZ0RHQkgz?=
 =?utf-8?B?aW91bVNtWTlDWVZaVVhwOExHU0pGZHNVKzlWaHRJL0o2cFc5dHFPS3YyVGNu?=
 =?utf-8?B?ZVNRcXhadjE0TDJ5NVNORXZTa0QwWUVoMFhHdmI5VUltenNqNWRkTVZkRUgw?=
 =?utf-8?B?TFJtbUFwSUR6aWxMdm5EbUE3SENzMEM4S1VNa2UwYktjRU5GQUVrdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9fd0e8-fec4-4b5b-e901-08df1f054ded
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:12:55.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yz6KR34WN8ObWtgfoHpEPoeK/uxMZHjNUulE9QV/3scNpRpF105amCRJSk6fflUFS0T5cnQi/Ubno1TeUgcx7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2124

On Tue Sep 29, 2026 at 6:56 PM BST, Andreas Hindborg wrote:
> `NumaNode` identifies a NUMA node and is not specific to the allocator AP=
I.
> Move it from the `alloc` module to the `numa` module so that NUMA related
> items live together.
>
> No functional change.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/aiZvKPFCkqJUsP0a@google.com/
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
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
> =20
> -use crate::prelude::*;
> +use crate::{
> +    numa::NumaNode,
> +    prelude::*, //
> +};
> =20
>  use core::{
>      alloc::Layout,
> @@ -114,31 +117,6 @@ pub mod flags {
>      pub const __GFP_NOWARN: Flags =3D Flags(bindings::__GFP_NOWARN);
>  }
> =20
> -/// Non Uniform Memory Access (NUMA) node identifier.
> -#[derive(Clone, Copy, PartialEq)]
> -pub struct NumaNode(i32);
> -
> -impl NumaNode {
> -    /// Create a new NUMA node identifier (non-negative integer).
> -    ///
> -    /// Returns [`EINVAL`] if a negative id or an id exceeding [`binding=
s::MAX_NUMNODES`] is
> -    /// specified.
> -    pub fn new(node: i32) -> Result<Self> {
> -        // MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10=
.
> -        if node < 0 || node >=3D bindings::MAX_NUMNODES as i32 {
> -            return Err(EINVAL);
> -        }
> -        Ok(Self(node))
> -    }
> -}
> -
> -/// Specify necessary constant to pass the information to Allocator that=
 the caller doesn't care
> -/// about the NUMA node to allocate memory from.
> -impl NumaNode {
> -    /// No node preference.
> -    pub const NO_NODE: NumaNode =3D NumaNode(bindings::NUMA_NO_NODE);
> -}
> -
>  /// The kernel's [`Allocator`] trait.
>  ///
>  /// An implementation of [`Allocator`] can allocate, re-allocate and fre=
e memory buffers described
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator=
.rs
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
> =20
>  use crate::{
>      bindings,
> +    numa::NumaNode,
>      page, //
>  };
> =20
> @@ -122,7 +122,7 @@ unsafe fn call(
>          // - Those functions provide the guarantees of this function.
>          let raw_ptr =3D unsafe {
>              // If `size =3D=3D 0` and `ptr !=3D NULL` the memory behind =
the pointer is freed.
> -            self.0(ptr.cast(), size, layout.align(), flags.0, nid.0).cas=
t()
> +            self.0(ptr.cast(), size, layout.align(), flags.0, nid.as_raw=
()).cast()
>          };
> =20
>          let ptr =3D if size =3D=3D 0 {
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
> =20
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
> =20
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
>  //! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemas=
k.h)
> =20
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
> =20
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

FWIW the C type is nodemask_t and this should have mask in the name too. It=
 is
not an identifier. That said, this is an existing issue, so shouldn't block=
 the
move.

Best,
Gary

> +
> +impl NumaNode {
> +    /// Create a new NUMA node identifier (non-negative integer).
> +    ///
> +    /// Returns [`EINVAL`] if a negative id or an id exceeding [`binding=
s::MAX_NUMNODES`] is
> +    /// specified.
> +    pub fn new(node: i32) -> Result<Self> {
> +        // MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10=
.
> +        if node < 0 || node >=3D bindings::MAX_NUMNODES as i32 {
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
> +/// Specify necessary constant to pass the information to Allocator that=
 the caller doesn't care
> +/// about the NUMA node to allocate memory from.
> +impl NumaNode {
> +    /// No node preference.
> +    pub const NO_NODE: NumaNode =3D NumaNode(bindings::NUMA_NO_NODE);
> +}


