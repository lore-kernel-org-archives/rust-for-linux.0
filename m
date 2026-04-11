Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D329AAEA;
	Sat, 11 Apr 2026 03:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775876792; cv=fail; b=OZqLegIhD0CWbgBu4gCBehQhb1gxa4cfBY7JOnm8rfg/RVnBdFi3NsX2bblQqKsWxlNeNaCSOFJpA4I0TRiRfxH1zNTH21DlbgOXKrwNt6cPaqD2VNPCQq8P785opeuaBgxRUwXUQvZOBtcD4ikaT8ATIjzHAzf6LUCYJe6rhNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775876792; c=relaxed/simple;
	bh=ZyCDJweJULx3kqjRIeHSjrDfyyNRYyK/0J6hUct70bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZzL9LjdqkIQ8MAB1sJd5GumUGDqhCRBXpwGZXMCR7ZNHhzMduwW86Jaz0rgo/KOuiTc3vCEqXeLPPHcKjP/GN6HKnX2gLWxijvHolDgTYYmu4C5oub4sZOqjXRdBHoSmmT+gpguKJKsWMqwlh7h26BGwxTWZdKWgm3KN4lTvHyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JfthdI+x; arc=fail smtp.client-ip=52.101.46.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JfthdI+x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPAQT3mQAWOT1ehzCbTGp8/wpgEqCa5ccWoOkMU8NAIObmCD9ap553ygYtAHWzSKZ5LOToOkieNQNW0It1xOHgfJphmtsLVZXtBafW/u3RvkwMD02pfDQ+F/c2bAjbNtjSHo1vZtYOs+Na93YScMRm5f552GWfqIXl3daPHF3ndeaj/vUq7cFEdC+62TqrAsv+a95GWdMjC2nuir1S8Xmnuy6H4FU5BhlcC/LlAfl1/FH3iKtzDDlkJ+goHZilunSMYQ8Q6f4AUKuf097Hm68gKKt6j4k4U2L/t9Kp1+7xVLdynzyAMuHqXpaRcW0vVODdDr0uuy5WvzzH7g14seaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k78EPPb2CagNEgVe5EaK4TxmVqHb98V2wPlEU/CrjYQ=;
 b=TjgipQZvh0/IR7rjAkY9o/PhbTUtaGtvJZJjLBufcC9lmua6nNQaM8GVHh0eVCd/CSpjdwp6z1W4hLGQcveubZe95AiXQ7T3ooabgGlKJRVEiaXVSSVsa/RdYcfCj/FF3KXFyWzVtoe4uacfvkPYmYfYFlxK9ejBDmcZeyqiWrs4aX4nBP8N49+xWRdPNI2fK7/ivguS2H9kzfNvbvhWEXqS7HR2EQaOBduiNS3EMWYciYkcUAe0PtdIAKQGPdD1mOFfYSCi7DjLp/UbB6TNj4ufbuZYiR+WgZWVxTTn1GM8YG/QyHDCRKGnV+hXTGD2n5YhdKulchIY80YWlftebw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k78EPPb2CagNEgVe5EaK4TxmVqHb98V2wPlEU/CrjYQ=;
 b=JfthdI+xwu4X73RGdXSHXHYzaItFNfd+cEAa3eXwynATGdbgmsd3oXmZxYRPc5sMvSxW3SYruSW1D0VD5yTzuBMLLR1Z1xswkogTw/rAHtdEMuK8L83TFJEYGUffBa8k8u/yoL9BervXboHBwnyGkqL/l46yYTRyOLsMZ87cBoZbarwHlkESSFKSk86KuKZVBj15093Bdie9Wa2ka6BbKIJnvrKH9gx9u02090SZW7WehbuBXp1M9RnPcCJSFFKAc2mpWmhPeyoAA6AG1yia2ZQxboyVDVBLcqwGPuZA+Kz3Gxk6shj3xZwobAgP6p7NRIcxjDFJM/vxxbBKnvchlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by PH7PR12MB7259.namprd12.prod.outlook.com (2603:10b6:510:207::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.44; Sat, 11 Apr
 2026 03:06:25 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9769.018; Sat, 11 Apr 2026
 03:06:25 +0000
Date: Fri, 10 Apr 2026 23:06:22 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Mitchell Levy <levymitchell0@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Boqun Feng <boqun@kernel.org>, Tyler Hicks <code@tyhicks.com>,
	Allen Pais <apais@linux.microsoft.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 7/8] rust: percpu: Add pin-hole optimizations for
 numerics
Message-ID: <adm6rmerdgVtclo5@yury>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
 <20260410-rust-percpu-v5-7-4292380d7a41@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-rust-percpu-v5-7-4292380d7a41@gmail.com>
X-ClientProxiedBy: BN1PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:408:e2::33) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|PH7PR12MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: c19f99bb-48bf-4dc2-803f-08de977750cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RTOlnN4NLH9FC/PFc/bGzQ388auIkjnqGTf5N6DdTBBkYXY3e609DYDXfMnOE3LraRFIC3oKmCve4qiLsaZJugQBpRwjpBw01YEdxAmjkCobTFxTxsHvzO4W4L50rNN2KxJTTrHzUKsBPehvO43ElhccDJjz5NBcX5kT7TG3GYhuVxv+fyXhAROAkaF3ws9K8flm5boXEJ9Q9KKP0u5LpAe9G08HlZ2eioN+mYb1+RV6zH2KkgghjOG72N+Ab3kK56KkfP4nt2aHXsHfjJjEbPI+L/3nqSjyuNQdoS/7ZqcHLnZ9fhQkn1BuMTqbV5Vd1wdfJtVO+n2zdkd0OZJgL9dhIlAWpFFKqjEfaODmv1OzA9i+FwzMtOnZSrAKzHI2T/trMSsSEwHm7ShgH+9UM5zCUCTRK80LK/R5rORnYsHVjZJqwKWgju56bPBoZknzTd5TSSclt80Ujew2jONCa+rxIP2cOnJk6s3yi59kii1mbuC5FNUoen8aITcB2dXSCds+/QiB5pDwusNcKLzE2QOHwdGjvODNcY22jnrrCweCfxX22rFDvqzc/7yg3WddtwfspNdscAJCDzpzYrG4Mbi30Zmr5FrCRbVNt0zW8uQL2zYlPDBqSwb9vIfgVkB3ztYGetaGn+owlPIOSFYRCG8d7gw9i/xRxeTncK28QM3MMyO0N0QaNoVcMcsAk/gQvbrc386K/0/kM9HasMZCkwZhyoaGIvjFB0rqlt+3ZEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mSRuiNR20kMmyyhWrfeb8m7LcRXhgR3XF9ExaTnL5p8lXfRtkz9Z5rNKJsCU?=
 =?us-ascii?Q?KHeEps/mqCmPF24IV/VkEQu57zF+K8NMMEaLvgV+N6eAh8rIy1U1Kbzzkyvk?=
 =?us-ascii?Q?VeRnGqhvFBVUwbdb/ZzHGXg0UoRzHkOw5YbDSIb0G7j/8kNiixHYoTKpbeTz?=
 =?us-ascii?Q?IW1c1Fi8eapRrn5N/D5iV3Ft3wZh1JD5opvQKlwrK0Wue+RROVO6b8nXYXJo?=
 =?us-ascii?Q?jGyKAZoJk0LotzYNw63ATt3HYyTiiHIZtgiI8vOpylWvgV4RSt7dKc7wyLy0?=
 =?us-ascii?Q?nAWnhUp0O5hXV/S8Gevb+3pfpnExdaUgFqTK8W6xEHAnP8dc+TKkvgYus2sr?=
 =?us-ascii?Q?ToqB/chzrtqcCQU5XubvP//xRifYurgwKhZecITD3igBKEeCtzfzFTod4NOa?=
 =?us-ascii?Q?DNtbVxGRiPQ1Z8MMGxyvb2NQ4zVbFwpx9yID3niDmNeZhKb/6TlTnOLWOYlP?=
 =?us-ascii?Q?E2hAAxtLvp0JIr5dNaOCfDkqDc5+UpSojDN0aG5fVKwzsuO0crZVoeHcvsG8?=
 =?us-ascii?Q?OX47AgsgJrC3zcqaT2q2WmSiKu+y+iwjMGihWiJQMjNqODhV5kkoryInB3fV?=
 =?us-ascii?Q?GGWFJ1KdUrES3yj5Z03+2791Mu/ivuUoFXtdGS3U+CkcEuuivva7yefIz/2o?=
 =?us-ascii?Q?NY7xkIeoNuum6TSCULLNnIp3FmfyQISnFYfhdSNgTljtcmrKe3zTqGsbEaLi?=
 =?us-ascii?Q?QQwuSpYaHbKQmr+dXId51sH/TVIibWsyMif4VawSXfrTHunkGkCWnA5ciSba?=
 =?us-ascii?Q?O7noCtpmqhqZly98jvzux9A6JJ6K1cGM2PsKpjEHh1qU7n1AJbdvqtDCYZmk?=
 =?us-ascii?Q?nncv1biFA1aocg9pUGCALi/A7+J7C8LHc01HBneMt6rRvtnvDWCtOqlld2YK?=
 =?us-ascii?Q?L4++Z/Y/psFBjAfiBCZ49NE/ncwLub6iFNcRLbYzCApehiKsNwFRjZsoVXHn?=
 =?us-ascii?Q?gVLqVzTKvKZOCTF+fNCrfqU402cnbBkk/6Wtq8NEeIUt14GM8bIk1uc7sJZd?=
 =?us-ascii?Q?4rKKHxil/XlT9FzR1V1FNlAuC37fVPCaikNof85it7DkDPy0q1Z4cNggmxuK?=
 =?us-ascii?Q?iggj0l0k8J9ZAD4ubFoq1c4oIs7sUGHJJecihbWr9c3jBmZG9gfkFtfY8Ygp?=
 =?us-ascii?Q?OGtQiB+8OMDsXc9EdcAr2ivPKcuNmlJaaJ+XBDzLZfEv4U9MBR7GbxblpoQ2?=
 =?us-ascii?Q?HOektLE8h/FTbMX/gF/fgeQkxn9LpnJGJgspkxebUOQal07dQq5qHWxER63t?=
 =?us-ascii?Q?uCPlELSvH2vUOjLR9vl8Mj+8zubFKuJwXu4k3q02MQP9t6YbnfCMO9X279GS?=
 =?us-ascii?Q?AeX5yJS+AZrzrv3ME9gjZpiPTP/4fWESe2GpqArU9J14XJmI99bRIRGDK6lk?=
 =?us-ascii?Q?J3N866axIgNfTlTxK5IkN8iMiFsPjb+EyGFpIOmgyz2YgJupUD09+ZwdI2p9?=
 =?us-ascii?Q?nF4WSdWE1MQTeEPPjCEzUc9GGoIQyE5cHDcS++qzQPWJb0qdq64YBsSCcQSA?=
 =?us-ascii?Q?3lzTZOpa1yQnyOroufIGJvnw3wbE+wXZLxHRMArzXASxPvlX9W5GLE5xfGdD?=
 =?us-ascii?Q?j78O9e50QC2FJSqEd6S6Qacvc40sdJS3ZpH8NbMVC4lQCJIm4emjBmjUpW//?=
 =?us-ascii?Q?8Vrqd+MUJnW0lDZBB3a+TXUXPb6/kYLgckIMjzvLaoeV/nMf0GW5RZ9isPM2?=
 =?us-ascii?Q?XGcm/iLA9aZq65FQTC1Evn4vQaTMZvkxmO2txgs1pept6V8HKiKjY6dehJG8?=
 =?us-ascii?Q?yCKfrH/OqPMs4i+kIg/MaLBwxJyaMlERtxVMISAyH+WQVzm301jh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19f99bb-48bf-4dc2-803f-08de977750cc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 03:06:24.8592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M643T4ju2WCGn+/YElT0ywANNVrsmGTTjMegjf93ZXI9kQOt9H+xACyCEDqeIkDnEivSX9AzySSYC1Bh8cCNFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7259

On Fri, Apr 10, 2026 at 02:35:37PM -0700, Mitchell Levy wrote:
> The C implementations of `this_cpu_add`, `this_cpu_sub`, etc., are
> optimized to save an instruction by avoiding having to compute
> `this_cpu_ptr(&x)` for some per-CPU variable `x`. For example, rather
> than
> 
>     u64 *x_ptr = this_cpu_ptr(&x);
>     *x_ptr += 5;
> 
> the implementation of `this_cpu_add` is clever enough to make use of the
> fact that per-CPU variables are implemented on x86 via segment
> registers, and so we can use only a single instruction (where we assume
> `&x` is already in `rax`)
> 
>     add gs:[rax], 5
> 
> Add this optimization via a `PerCpuNumeric` type to enable code-reuse
> between `DynamicPerCpu` and `StaticPerCpu`.
> 
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
>  rust/kernel/percpu.rs         |   1 +
>  rust/kernel/percpu/dynamic.rs |  10 ++-
>  rust/kernel/percpu/numeric.rs | 138 ++++++++++++++++++++++++++++++++++++++++++
>  samples/rust/rust_percpu.rs   |  36 +++++++++++
>  4 files changed, 184 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
> index 72c83fef68ee..ff04607ee047 100644
> --- a/rust/kernel/percpu.rs
> +++ b/rust/kernel/percpu.rs
> @@ -6,6 +6,7 @@
>  
>  pub mod cpu_guard;
>  mod dynamic;
> +pub mod numeric;
>  mod static_;
>  
>  #[doc(inline)]
> diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
> index 40514704b3d0..a717138b93dc 100644
> --- a/rust/kernel/percpu/dynamic.rs
> +++ b/rust/kernel/percpu/dynamic.rs
> @@ -28,7 +28,7 @@
>  /// the memory location on any particular CPU has been initialized. This means that it cannot tell
>  /// whether it should drop the *contents* of the allocation when it is dropped. It is up to the
>  /// user to do this via something like [`core::ptr::drop_in_place`].
> -pub struct PerCpuAllocation<T>(PerCpuPtr<T>);
> +pub struct PerCpuAllocation<T>(pub(super) PerCpuPtr<T>);
>  
>  impl<T: Zeroable> PerCpuAllocation<T> {
>      /// Dynamically allocates a space in the per-CPU area suitably sized and aligned to hold a `T`,
> @@ -162,6 +162,14 @@ pub fn new_from(mut initer: impl FnMut(CpuId) -> T, flags: Flags) -> Option<Self
>      }
>  }
>  
> +impl<T> DynamicPerCpu<T> {
> +    /// Gets the allocation backing this per-CPU variable.
> +    pub(crate) fn alloc(&self) -> &Arc<PerCpuAllocation<T>> {
> +        // SAFETY: This type's invariant ensures that `self.alloc` is `Some`.
> +        unsafe { self.alloc.as_ref().unwrap_unchecked() }
> +    }
> +}
> +
>  impl<T> PerCpu<T> for DynamicPerCpu<T> {
>      unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
>          // SAFETY:
> diff --git a/rust/kernel/percpu/numeric.rs b/rust/kernel/percpu/numeric.rs
> new file mode 100644
> index 000000000000..13b4ab4a794d
> --- /dev/null
> +++ b/rust/kernel/percpu/numeric.rs
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//! Pin-hole optimizations for [`PerCpu<T>`] where T is a numeric type.
> +
> +use super::*;
> +use core::arch::asm;
> +
> +/// Represents a per-CPU variable that can be manipulated with machine-intrinsic numeric
> +/// operations.
> +pub struct PerCpuNumeric<'a, T> {
> +    // INVARIANT: `ptr.0` is a valid offset into the per-CPU area and is initialized on all CPUs
> +    // (since we don't have a CPU guard, we have to be pessimistic and assume we could be on any
> +    // CPU).
> +    ptr: &'a PerCpuPtr<T>,
> +}
> +
> +macro_rules! impl_ops {
> +    ($ty:ty, $reg:tt) => {
> +        impl DynamicPerCpu<$ty> {
> +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> +            /// variable.
> +            #[inline]
> +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> +                // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
> +                // this pointer is valid and initialized on all CPUs.
> +                PerCpuNumeric { ptr: &self.alloc().0 }
> +            }
> +        }
> +        impl StaticPerCpu<$ty> {
> +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> +            /// variable.
> +            #[inline]
> +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> +                // The invariant is satisfied because `StaticPerCpu`'s invariant guarantees that
> +                // this pointer is valid and initialized on all CPUs.
> +                PerCpuNumeric { ptr: &self.0 }
> +            }
> +        }
> +
> +        impl PerCpuNumeric<'_, $ty> {
> +            /// Adds `rhs` to the per-CPU variable.
> +            #[inline]
> +            pub fn add(&mut self, rhs: $ty) {
> +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> +                // pointer relative to the `gs` segment register) by the invariants of this type.
> +                unsafe {
> +                    asm!(
> +                        concat!("add gs:[{off}], {val:", $reg, "}"),
> +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> +                        val = in(reg) rhs,

So, every user of .add() now will be only compilable against x86_64? 
I don't think it's right. Can you make it in a more convenient way:
implement a generic version, and then an x86_64-optimized.

How bad the generic x86_64 version looks comparing to the optimized
one?

Thanks,
Yury

> +                    );
> +                }
> +            }
> +        }
> +        impl PerCpuNumeric<'_, $ty> {
> +            /// Subtracts `rhs` from the per-CPU variable.
> +            #[inline]
> +            pub fn sub(&mut self, rhs: $ty) {
> +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> +                // pointer relative to the `gs` segment register) by the invariants of this type.
> +                unsafe {
> +                    asm!(
> +                        concat!("sub gs:[{off}], {val:", $reg, "}"),
> +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> +                        val = in(reg) rhs,
> +                    );
> +                }
> +            }
> +        }
> +    };
> +}
> +
> +macro_rules! impl_ops_byte {
> +    ($ty:ty) => {
> +        impl DynamicPerCpu<$ty> {
> +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> +            /// variable.
> +            #[inline]
> +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> +                // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
> +                // this pointer is valid and initialized on all CPUs.
> +                PerCpuNumeric { ptr: &self.alloc().0 }
> +            }
> +        }
> +        impl StaticPerCpu<$ty> {
> +            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
> +            /// variable.
> +            #[inline]
> +            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
> +                // The invariant is satisfied because `StaticPerCpu`'s invariant guarantees that
> +                // this pointer is valid and initialized on all CPUs.
> +                PerCpuNumeric { ptr: &self.0 }
> +            }
> +        }
> +
> +        impl PerCpuNumeric<'_, $ty> {
> +            /// Adds `rhs` to the per-CPU variable.
> +            #[inline]
> +            pub fn add(&mut self, rhs: $ty) {
> +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> +                // pointer relative to the `gs` segment register) by the invariants of this type.
> +                unsafe {
> +                    asm!(
> +                        "add gs:[{off}], {val}",
> +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> +                        val = in(reg_byte) rhs,
> +                    );
> +                }
> +            }
> +        }
> +        impl PerCpuNumeric<'_, $ty> {
> +            /// Subtracts `rhs` from the per-CPU variable.
> +            #[inline]
> +            pub fn sub(&mut self, rhs: $ty) {
> +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> +                // pointer relative to the `gs` segment register) by the invariants of this type.
> +                unsafe {
> +                    asm!(
> +                        "sub gs:[{off}], {val}",
> +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> +                        val = in(reg_byte) rhs,
> +                    );
> +                }
> +            }
> +        }
> +    };
> +}
> +
> +impl_ops_byte!(i8);
> +impl_ops!(i16, "x");
> +impl_ops!(i32, "e");
> +impl_ops!(i64, "r");
> +impl_ops!(isize, "r");
> +
> +impl_ops_byte!(u8);
> +impl_ops!(u16, "x");
> +impl_ops!(u32, "e");
> +impl_ops!(u64, "r");
> +impl_ops!(usize, "r");
> diff --git a/samples/rust/rust_percpu.rs b/samples/rust/rust_percpu.rs
> index 5adb30509bd4..90f5debd3c7a 100644
> --- a/samples/rust/rust_percpu.rs
> +++ b/samples/rust/rust_percpu.rs
> @@ -28,6 +28,26 @@
>  define_per_cpu!(UPERCPU: u64 = 0);
>  define_per_cpu!(CHECKED: RefCell<u64> = RefCell::new(0));
>  
> +macro_rules! make_optimization_test {
> +    ($ty:ty) => {
> +        let mut test: DynamicPerCpu<$ty> = DynamicPerCpu::new_zero(GFP_KERNEL).unwrap();
> +        {
> +            let _guard = CpuGuard::new();
> +            // SAFETY: No other usage of `test`
> +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| *val = 10);
> +            test.num().add(1);
> +            // SAFETY: No other usage of `test`
> +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 11));
> +            test.num().add(10);
> +            // SAFETY: No other usage of `test`
> +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 21));
> +            test.num().sub(5);
> +            // SAFETY: No other usage of `test`
> +            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 16));
> +        }
> +    };
> +}
> +
>  impl kernel::Module for PerCpuMod {
>      fn init(_module: &'static ThisModule) -> Result<Self, Error> {
>          pr_info!("rust percpu test start\n");
> @@ -228,6 +248,22 @@ fn init(_module: &'static ThisModule) -> Result<Self, Error> {
>  
>          pr_info!("rust dynamic percpu test done\n");
>  
> +        pr_info!("rust numeric optimizations test start\n");
> +
> +        make_optimization_test!(u8);
> +        make_optimization_test!(u16);
> +        make_optimization_test!(u32);
> +        make_optimization_test!(u64);
> +        make_optimization_test!(usize);
> +
> +        make_optimization_test!(i8);
> +        make_optimization_test!(i16);
> +        make_optimization_test!(i32);
> +        make_optimization_test!(i64);
> +        make_optimization_test!(isize);
> +
> +        pr_info!("rust numeric optimizations test done\n");
> +
>          // Return Err to unload the module
>          Result::Err(EINVAL)
>      }
> 
> -- 
> 2.34.1
