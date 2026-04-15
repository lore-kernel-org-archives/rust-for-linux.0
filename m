Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59666285C8B;
	Wed, 15 Apr 2026 21:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290264; cv=fail; b=r/sitRg5BYokbZaCuo637ojuiJhHmzn7uyXUbyfpRpu/cLbSruAPXZQt0n/1gg4Vy/FUU4OAm3MJX/caorRX2u7Ve9Zvq2OTvsTLIzR7y0jcnE6/Wt3XYf7paWw8/W9VZ9yEaEYZsS5XGsx7fm42xUV7sdxfEf4hKnpc+PgEr3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290264; c=relaxed/simple;
	bh=o1blgHEa4m1l3taVlOc5XNs66lyL9VUIaHNWmRofM40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IttXxkfuXhJeV3PZagfszmTqd4jlhaoMd/UxY0MoKgVxtIPo2zlW8ZSS8rL0kiIOahkmbEhvuLUMAZ8zk+WrsgJoCk3wm1igDSNQHMx80uK2VieJ8bkyfwJrJfwYhtewOGYceG8hctBbAV6a6OltDd6eEgLpGR5+GknrP7IVWnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YtfrhPmW; arc=fail smtp.client-ip=40.107.209.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YtfrhPmW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptU2891pg8Z5Od5i2/aqDLjfyyOVdjegeOBQw9Sml9eyk3dVL27uT1U3fN+uI170Sr0sUR9lCwo0g8Hu3Mkq4zFhM2gyOyL7caXiMoUlvhy9tYoUbY6MIinNlre2pb+7RmfqVEMDAFNfoXW2vYA+V/qeG4hpytib8uv+riqAmsNKuMS3C2mGDeW3KMn5BYNTrXe9pO4iZhIzPJibJ3mqGL+vTjv+ZDYY/bex93EyrwB9jNugvIiXM0vZOQBEOy3kIkOK6UgkK90Zzr/JUcJMKXnHZ5BkLtXtjoIIuFUS//GplpIzc4q/d/x4TUbJXWQYClIn0E27n1Uwc1RotZLynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTAF2mIeDKIj/zMvH7bBX6/1V1KHatSg6cyn+ZSJl/U=;
 b=xEGpJ9p6/i62GyZs5C95Dx+tjcd+Yu9Cjbw2OQ7d2AUXk+sTvASWUySBXv8B/cAqEo5VsZMih2R7vANcjH24gE8naRcbmmPIMRUdnwCPWhNmSL+Ew2/52FBkHhKXiDdp7m5ldU3gAdOvhBqZm9hSCKykKvw6M/EDXk7eJk7AFJf6ttPYabBe6Jd0qg04ODKA/i0LVJ1j9EalOL2yrJ16SZl5krKHWStu3SdzRJ3SZZP8UdOcgRwaypNKOcbllp2ua4UwIIGyFX3LxZTweU7QL1W4D6id3l/YDhLZB5GAxO3DTTWaRzZvyeA3sj83NF3OnLbzjRI3YQR7q4wV6sc5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTAF2mIeDKIj/zMvH7bBX6/1V1KHatSg6cyn+ZSJl/U=;
 b=YtfrhPmWfc2B+cAN3PBMgUscnCnsxJsWFKKQ6Ou1+bKkoqGebDzcROH00nz+NRUeFNp8sFTj0ZBAyCbw+8QbeKC+hs3aP3+WxjJS3rX/2Bmqd0ma8qyhWuz6r2RPL9PGp2xGMPZbi1KVJYTYjfnP58/OpLiYUl5XBFG0FGzrH+POzcPMWsj8SslCWNq3FHDYveF5j/TDVWd0vqPYsWK4B98UQku6ERm0WXrezFF0cw+kYZGfJgHIKiV1tyxlrEIgYS7Zf6Y9ZPAg4Om91el04RnK2qQQqpTu/P+VV976he4Ls5L7TSbiUEoyZ8cBe7BSh/OpnpWtAvRddo5vJT+low==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by IA0PPF316EEACD8.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 21:57:38 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 21:57:38 +0000
Date: Wed, 15 Apr 2026 17:57:36 -0400
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
Message-ID: <aeAJ0Hja36TPWDS7@yury>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
 <20260410-rust-percpu-v5-7-4292380d7a41@gmail.com>
 <adm6rmerdgVtclo5@yury>
 <ad_2VOc2hjhTYMQk@Cyndaquil.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad_2VOc2hjhTYMQk@Cyndaquil.localdomain>
X-ClientProxiedBy: BN9PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:408:f5::18) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|IA0PPF316EEACD8:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2dd03d-3e4b-49ce-f13f-08de9b3a0237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oy+FbicrOxIWxnwlCMESyDW40vuCxxgzKRufHMNfQUxFSqVGWFFnKsHHEKEO9hWsfm+E4kUxnsIYN9Oo2lqKUuHdQ7qbOuNtTiqUuO7+S+MqS8Njsmag/xtdOl8A1kypGGnYLzv5aswr/U+Zz+tcvFH9ajgFu3X4mfALvRDux2kVON6yz2gpw2x/al1KT7dV8Ie3+CimRTSEKK2JVKO8RrO7EbOkdixqhhYWUn+E9MvsxhXSe3AsJnEXezJiGojrRTLnRAbpUzgt1rJjqRsObXesA5psyCxjbstn7inW1euIAsfrs5Qjwg9+/WPTQvg7PFpMkhHNi2gRBhGv9IS3h+7OjGXAvqKeY4NT7DeKLIPYR/i9VYxgQ8oQf68tMfZFOszxfH6k37GSCPhLFm9jSew2DdMmF7vIMqMBdISc2xfirYDebBYNQweWAUa42skDbWhe9CyQTt33PaKLLHD4ElLD3svMkQuCYSBs8LyRPlpNBneb73Llbcylwi50bJsezSaAOTLHGLezdGWTQVMcWKIIytRcpKhU+zsvAxcQH5eiDoyuKnoxpj8otDZBWcg93eyn43DmaIIB2/I13YSthuQazFkpqTaPj9WaPwSxVLty8HIxLrdl5mvP9CgpCX0LY35uULuGQ6mhlrueQBa8PdO8tesWAVZoV9Yn5c+f3TgKrjIKYq+OSPrnTxlVO9mMfaKO9qWuepSAv8LsR5r398FeCPWECSpV9E0EHgsVcDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j2LHLClijzDN67MMUKfuJfcOdHfRjBE5dWI1Rslf7aN1pWkFHonduKstHctS?=
 =?us-ascii?Q?vwy0eDndGsgmdMT8Xq1AMZ9ui6X0qH+T/B1pwqvl0/7Q+HcrlRAyYL5FFGlQ?=
 =?us-ascii?Q?aNgrP03aYEoC3p7F3dLGQK5MWxeJPgJYhLSRwdndfwBqZmVZ4Sc0IcZ8PTvS?=
 =?us-ascii?Q?ljOVMA7Cewyrg0ygaBhm/o7fYFf6r/Z6Ks5IgOemV3tLYbuHgnPLiqanwTdV?=
 =?us-ascii?Q?dd2PlxYau0GCqg5+KFdghiluMApIIcXULt7c52qqNk4AlWZRzebNqlO8d7RW?=
 =?us-ascii?Q?MD62bgjZiNdTAYKP7aS3LzynSO2g2ck/YWH5KyVBcPDfgzSnt6nxeKgTYIVW?=
 =?us-ascii?Q?4PxqGNMQh0U0amn08cgnsE5cUJSTQaYnuBSe36hPjV3u06rzp68UbHXKSUPu?=
 =?us-ascii?Q?ZwmzHCzV6yGts92Wxd3EBpmR01Thv9Nwfku0I2Q+T4o0PDoIPz5UkYsmw7Qz?=
 =?us-ascii?Q?huQkzXk7JrhNGzQi+fOsrkH2JN2xj1gDIPB+39xFrFBBiGJq9OUm3rLwLnp5?=
 =?us-ascii?Q?1GytKQNpYmQqTQ1ydKM8WT0CsekV6tEVOMvuntoHLY1wHFBnXMiHol7+wycc?=
 =?us-ascii?Q?XvSK841C1dWj5PnGJaHKFUo7p+e+BOZ9G25yURsgez7TMeXwMYKPMVFsN7/J?=
 =?us-ascii?Q?5oTsmMd4XuSA1cb2aD5dHJRqNsex8Qvb1YoMmDZfJYyFO4k+IS5ic6CGdhLh?=
 =?us-ascii?Q?k/t+HDfkupKVYS0il4PlDbW8Idv8cUmtG4MvRL9TwnrzSAXFiS2OEBNHgsTP?=
 =?us-ascii?Q?V1onlkZpuBraT7byeBLyjqqKMldDIhlUuY/ub3PsezfLeY0SHJaoHR4PgzFU?=
 =?us-ascii?Q?6f+qHbf8YAXKxuDus+57mR8T4bQwTwtHm/RC2gHVSl59MUSVr48VIaq03oqz?=
 =?us-ascii?Q?OyJok20FMUhXpqPL6NXSMEjJMJ8etx/JJsuXniwHA0fvJ3boYFXNeoa241vv?=
 =?us-ascii?Q?XI4Yvo1wJ9tBPhyhSRSftDEXMkYkA2cNVKd1PcZW4NwTBVifwKBnID5tAuiy?=
 =?us-ascii?Q?plyS6XmE5bRI+v7hJGJqJo963U/2UIsUy+NVqkkEVKLlTE3Hnet+NW2GGy5G?=
 =?us-ascii?Q?d1fCtmX6i2qpTrNwAJpq/LYoAfSDtYFYeVsxfsJ7CEccVwWrSysWJj/yULTv?=
 =?us-ascii?Q?ngSIE/PA4QzL5k+bsDfWeN6D7bs3ioU6YNkE53LD+KgLTgFD7KjzfgcqSTS4?=
 =?us-ascii?Q?Z1SlYTLEWSzRrl1aKh+9QTDQSmmJnWmrzvVtbjIKphlXyL65nqBrQidhSZm4?=
 =?us-ascii?Q?6JBuyq3qFTg2hoZDbUovHJifaro931rsa6L/7oyL6GITZubi54jwJ+twq1RY?=
 =?us-ascii?Q?rgLb14TAFQcK1exEdfbJuoFwkp4n9JmDyxdlCvMfyfPz0uwKlbpWVnLrBpPb?=
 =?us-ascii?Q?B2Ob10GYKfkr79AFGIUAR4QE//VQgnO4ummLOi6jJlR2WvVurIYhtio6RemN?=
 =?us-ascii?Q?fjQmSK4KTLpzmgsXGu4HgelUBVRvM7scrzFblam3RKarl1k7rBcfOgZXm13g?=
 =?us-ascii?Q?7DLcK5XuVFMbIN8ZksTx1rdKoZ4hTD6KWRSRYmmueV0laQqB4KC5Fq70/zvH?=
 =?us-ascii?Q?ZaFLh+R9Q6gbowtd227EUfzY9FZ3j07ukRuaCQBO+D17tCHmRmyAHPiH4fjv?=
 =?us-ascii?Q?sj74R2cAGXxnBYbXmX+nn8Y5H4jysypAJqnZ1bmPn41R7JyqbVEyIFPZAaYV?=
 =?us-ascii?Q?m6o4db1EgTYHOU8rnxYFhdCuVNjXPkeVUAAFzJlHmkebUUvHwEkEggjrj36t?=
 =?us-ascii?Q?8TQZdzMi1ISbOvWe66O7yTv2jYXRjz0H2Apvs2w1KxhzlaHl0tIp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2dd03d-3e4b-49ce-f13f-08de9b3a0237
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 21:57:38.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3I3pl48Vv333iP4MKduObSopidHwWQkDYXiQVt479DzSVeZpsORHPqkBZWfSLsFUOLNRpR6a9THP6L4frHf9QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF316EEACD8

On Wed, Apr 15, 2026 at 01:34:28PM -0700, Mitchell Levy wrote:
> On Fri, Apr 10, 2026 at 11:06:22PM -0400, Yury Norov wrote:
> > On Fri, Apr 10, 2026 at 02:35:37PM -0700, Mitchell Levy wrote:
> > > The C implementations of `this_cpu_add`, `this_cpu_sub`, etc., are
> > > optimized to save an instruction by avoiding having to compute
> > > `this_cpu_ptr(&x)` for some per-CPU variable `x`. For example, rather
> > > than
> > > 
> > >     u64 *x_ptr = this_cpu_ptr(&x);
> > >     *x_ptr += 5;
> > > 
> > > the implementation of `this_cpu_add` is clever enough to make use of the
> > > fact that per-CPU variables are implemented on x86 via segment
> > > registers, and so we can use only a single instruction (where we assume
> > > `&x` is already in `rax`)
> > > 
> > >     add gs:[rax], 5
> > > 
> > > Add this optimization via a `PerCpuNumeric` type to enable code-reuse
> > > between `DynamicPerCpu` and `StaticPerCpu`.
> > > 
> > > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> > > ---
> > >  rust/kernel/percpu.rs         |   1 +
> > >  rust/kernel/percpu/dynamic.rs |  10 ++-
> > >  rust/kernel/percpu/numeric.rs | 138 ++++++++++++++++++++++++++++++++++++++++++
> > >  samples/rust/rust_percpu.rs   |  36 +++++++++++
> > >  4 files changed, 184 insertions(+), 1 deletion(-)
> > > 

...

> > > +        impl PerCpuNumeric<'_, $ty> {
> > > +            /// Adds `rhs` to the per-CPU variable.
> > > +            #[inline]
> > > +            pub fn add(&mut self, rhs: $ty) {
> > > +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> > > +                // pointer relative to the `gs` segment register) by the invariants of this type.
> > > +                unsafe {
> > > +                    asm!(
> > > +                        concat!("add gs:[{off}], {val:", $reg, "}"),
> > > +                        off = in(reg) self.ptr.0.cast::<$ty>(),
> > > +                        val = in(reg) rhs,
> > 
> > So, every user of .add() now will be only compilable against x86_64? 
> > I don't think it's right. Can you make it in a more convenient way:
> > implement a generic version, and then an x86_64-optimized.
> > 
> > How bad the generic x86_64 version looks comparing to the optimized
> > one?
> 
> Currently, all of `mod percpu` is behind `#[cfg(X86_64)]`, so usage of
> per-CPU variables in general is only compatible against x86_64.

Yes, and seemingly for no good reason. The only assembler function in
that patch (#4) is the get_ptr(), and to me it's quite easy to get it
implemented it in C.
 
> I believe a generic implementation would require implicitly creating a
> `CpuGuard` since in general you require two steps: computing the pointer
> to the per-CPU variable's slot in the current CPU's area and actually
> doing the write. On x86_64 we can get around this because segment
> register relative writes let us combine these two ops into one
> instruction which can't be torn across CPUs. But in the general case you
> could have the task get preempted between those two operations and end
> up with a data race.

Yes, you need CpuGuard to protect the .add(), and there's nothing
wrong with that. Especially if you provide better alternative for
the x86.

> As I understand it, x86 is the only arch where this is possible, so even
> once `mod percpu` supports more architectures, I think it'd still make
> some sense to have `PerCpuNumeric` specifically be x86 exclusive. This
> means that the user must always explicitly disable preemption rather
> than having a `PerCpuNumeric` type that sometimes does and sometimes
> doesn't.

GS register is the x86-only feature, but per-CPU variables are not. In
the mother kernel, we implement them for all architectures. For x86,
we've got the effective arch implementation where needed. But the
generic one is the first and foremost. Refer raw_cpu_ptr() for
example.

Have you checked performance difference of generic vs arch per-CPU
API on your workload? Is there any measurable difference? If not, I'd
rather focus on the generic version.

If you prefer the arch one, it's OK, after all. But can you please put
it under rust/arch/x86_64 please? And your driver, correspondingly,
would be hosted there as well.

Looking in the rust codebase, I see, it uses assembler inlines for
things like compile-time barriers, labels, sections. Those are
features of assembler language, a generic thing.

You're the first trying to add something really arch-specific, unless
I overlooked something. So please, either stay (happy) on the generic
ground, or create all the required infrastructure for architectures,
like the mother kernel does. Particularly, such a basic thing like
per-CPU API should be available for all architectures.

Thanks,
Yury
