Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020088.outbound.protection.outlook.com [52.101.196.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7F919C56C;
	Wed, 22 Jan 2025 14:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737557768; cv=fail; b=H5FCQ3VKY6ImL2ngOznPFyXYCESqw7tkc5YCmDI1upOsNomFHYdWVBlhPgubvgYrjnIj5Da3J49bgohrwaQ0qb21g/WdKAdcDr0tcfhyeOVCdzKQbeycZS8toTI3PXkkboHSXN7bx7XuygXz0X28quBiunoHd+GA1Xfm0pfB+mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737557768; c=relaxed/simple;
	bh=GGKg7Le8mm+rvdrp4u38FdN7XKIay1lzLgs76waVM0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llcn9ObUkyy3CqycCmKYMd9JyB8z0S5owTsELk1OBuewVlin/Idrpx7a6OPF0J0GGnhg3TRl3wu2NwjSfQbPTm75vQe9sfdICtU+tj4vP0rLW3ze2bhlz25cw4bq6w1GX/A4DZfY91CDOJucxBokcngSzLqClzBE8s5LkreygpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kdM6DJS4; arc=fail smtp.client-ip=52.101.196.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kdM6DJS4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he69GUdkMprE5q1OF1SD/zG70HoP+UEl2kNixSHV3EJRpdh39trf6Bt17htntX70YSwk/v/T7d5UmHSZPdaIS4vi2EFhJPqJqImqL8bqMcvZEuvZ5dWpenhBoDgPp7iWNY2wYG0gVh047kza4nVScK/asFHRKCqRHWmxtvFSHGT6QlQX59gHcbFDAuxKv4n0VIaK8pFMgoI8SkFyVNvsUla5KWrSuEqV12lx2CNo9hbB7qNpQqLr8jxhbptWAs6g5q72oGSdVVWga0oWb2cosJwSh5Lp6PHuPirAxu2/xOgyqQukKdDAwiOyVp3+xWQVTHqdSee+M28xaYkVkM4jfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIbfed+Q4hpLlf3ENu+naOxVouWTYsrgzZbbC+wb/Ho=;
 b=VhmcOKMrD5dxaL/1D0o1gyOpBhu5ILqAiZ9IY1gjBhaXH82pqFZgN3p7vBBGubdpPZl4zzsPB768Ez3/w2r6UlraCPDOy0l5hv6g5/JYDNCsG6RNBoTVDBQe0TOuPBLJdS4wT4RfDl4AswEeQ4pP1s0sVIATrJ8TQIAhbWqp4QwOKz7U/qZZHiv7+Y3Gor32qjeSbZC7Nc1DoFB5DvRCG/anF+8qPhiu3Fw1BaXyViQ8/ToT/iF+uJAwRQFXY8nLO77SQQcRJN45nVez3tRaIsOSUADmdv6Ml2lhIoaN4TKWk5OB1jMJDSacV2LEvD67StywFqaxEyGvZwIj73ZKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIbfed+Q4hpLlf3ENu+naOxVouWTYsrgzZbbC+wb/Ho=;
 b=kdM6DJS4kCPHtoOEK+8wCiHFsa5/wFBsT2pFT2GRMg/6urEIsvPTNG/3RlLMyw6MvaWGdKWTui56u1JYYgbOLW8EbFgedZEbZj7iYI/rzUFQ/5X3/owoNypmqz2qGhpDa/E6VOyUsMqNlse7tX2ZOmvh579mQC7VhFWFXyZJ4Ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO9P265MB7567.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.23; Wed, 22 Jan
 2025 14:56:04 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 14:56:03 +0000
Date: Wed, 22 Jan 2025 14:55:58 +0000
From: Gary Guo <gary@garyguo.net>
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: io: move offset_valid and io_addr(_assert) to
 IoRaw
Message-ID: <20250122145558.7b27d8cf.gary@garyguo.net>
In-Reply-To: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>
References: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO9P265MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 782b3603-bee2-4641-1621-08dd3af4e481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8zsRoiWYI3nKjmjbsic5DRXPX6/rvWkVGrNqKETDS1rFvOPeLL6le1EUBgOL?=
 =?us-ascii?Q?lot4OIAYkixgwbbdr1/kkr1u2psc2vz+w2gCYc1CYQC30gDSjkSpghr3bb2w?=
 =?us-ascii?Q?WeurdgiLuSgWGh6XnEDTdro9CMuAuYmTqufVsydjCBEXFmeXSbXtZskQO2MU?=
 =?us-ascii?Q?WT1bnRMEnXbO0Y38a7hTViJvDX2t/l+DazwaaY4HNuzyQjlM5+1TXJoTOTkf?=
 =?us-ascii?Q?R29s90pwA20tJ69Tx0WxkPnaWD0nOGl2xf0anSH0GnAWcneGSvfRbwGhlM4U?=
 =?us-ascii?Q?zlhG6xmWXb8dVfhCOR9PVCIak+FNyx/14aK9fbVb3pAFIZd/GRpIvxCYycOa?=
 =?us-ascii?Q?O20KvizpH1JM1aFF6Yca6sgBwOvApUs/Ply3IMBHN8IR4HWNVZ5/JUbYFyjb?=
 =?us-ascii?Q?8PvvrB6asguCyI3OCnVtg32uEJ/Qn+gUV5QVUFTcDzhsYqwMN77edSIHqY1V?=
 =?us-ascii?Q?rH+eD4TcUs81WyX09hzqotO+GMXmll5rd4264QrU/94I5ep7N4rmzlYtXxAP?=
 =?us-ascii?Q?pzI56H7z99v7gFtxnRedUjVh/Nt1Y7W5qOhC7JGFYuutoZNgCyGz7hT2+i+A?=
 =?us-ascii?Q?WLfNGo2Zpj+TW84HvmzVxDqPeEEdUDzx3GCPAZTBtkdD2QnNTb8PuVHMvtkr?=
 =?us-ascii?Q?KaWIGsr2ikl/ymzzc4MuD0787rZYqI1bxfE6SPRc9URL2571QkAfFZGQA/df?=
 =?us-ascii?Q?zuNsjNtrPGBUWZM/S/KZYpHYpqcqmFV5qE8dnFBfnihysKd8m6cMxOb1MGsq?=
 =?us-ascii?Q?epiHvYGiQUzF+DO31656zvrxQHsvlPKe8y0hXxTzvHzi5uFBgtLvl7I6lrSz?=
 =?us-ascii?Q?eyC+sR+3j2THQbY7lAguaNU69fPoR4cB0pD8smpEqNqI/tD/yr3incSd6Hmb?=
 =?us-ascii?Q?YuwPhHncCq6lLsfE0MlF3rQgEaqj8XqjaURprTAal1x7qy49dwRf007r68hx?=
 =?us-ascii?Q?+9ni0f2Z87UJQTRO0GJ4t7hXpeSdqW7vpm6VTKaaSY8bsbF+56AG766KvSkx?=
 =?us-ascii?Q?j+cFL3pBQpQ05qU9TGqDz5E6PFLlby2d/QluB/Aj/QfKutBhxpIrY54HQ78o?=
 =?us-ascii?Q?zKfaiV4aNO0TxJRWb6Da30EhokpCxf116hgLw1G6NUpB7fvKvD/ccZM9/bO4?=
 =?us-ascii?Q?fpFT5DE1qhdl/IvDq63vopjDxjuHBvqogtab3fV4c8JhzC30oRv8lsTOVTTg?=
 =?us-ascii?Q?IpO9lj/L27i/ZVGUs3pej2Qeuh15KOsmgv9YzRLKsbbajS9ttScNA1kwtYFE?=
 =?us-ascii?Q?FgQDuBT/p/buY8sqIW9szjTf8TBq3DFafgXrW/igXzZqUU9/tlQgbyu47N5N?=
 =?us-ascii?Q?LBOhrGglDW0K4A+HGLztFL5HyQeWQnD6yGwAnGDf6Yp8MC5HT+Ciyu5Y9jXQ?=
 =?us-ascii?Q?sFId9IRK/gyG/6ABkywK90GpmYmi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?feeZqcCRmwVSoUnGjlDf5y+AVD41T9vFfVMJoLXXukRuhGabgqJ65lnm+okZ?=
 =?us-ascii?Q?Wuo5elY1DoLKn8gRo5nKSnkUh+5yEkvs3t1aF8u3oBFZRrrtW9wtWQ94NoYh?=
 =?us-ascii?Q?nZNEg2N/dFNyDncYrh14Xf+kbVY467gp5w9o2nZS8VqkxuOQhJnVjL3zCu3l?=
 =?us-ascii?Q?NBThvFCJZbsk4hK0eqTKs6tkMrwHy1N1BVLuvxkILpS56OmnR25i4MhhjD9W?=
 =?us-ascii?Q?fOzkmfZnnsDtMiH0Oci1TkjLsjppdzmHqMeftjwnhbHA1uNn3/YZMbxuD3L0?=
 =?us-ascii?Q?iNqWTj/aSoKqwg5fvUllABzSBEyz093Ii2d0Nuk6PL5L7efTKbQp2G6ipk/s?=
 =?us-ascii?Q?jue/dF2HqSjaktjXQs2zfQyleWHE+xDGi4g4k1DLBL6MShdHlMM/WHllqPKF?=
 =?us-ascii?Q?bKnmBKCehvShPBX1027uSosuV7RtwxiGTcpUHDK29OV1Toi3HgkTtq7BDojq?=
 =?us-ascii?Q?zb6y0cLfIpMSlFlIcD6wsbHImuUghgqyB7eFpTePZcCsXolciWTUB4iRzwfi?=
 =?us-ascii?Q?MeRc39YjiY2C1Z2Qdb8dZ/Z8b9D8EQ7Hhyb41kSz1LCYC8GGDyMJO+p9VE/X?=
 =?us-ascii?Q?BlhJLxpH6f8jMuNPyA3c6hKg1rtuloDYSstU209tYrT2r9Gy/uxHURwOGi5X?=
 =?us-ascii?Q?RoWWnMw8F7VtMmmWgsmZVbZF7mrEdQCZn3mDmfmP3Obuq79eRARe6RYy4wnY?=
 =?us-ascii?Q?9LmPpAU2g6NO7eymsYofgD+RwbY7xcGI4ZqeHmE/SfWxHONSn0YF1hAmryG8?=
 =?us-ascii?Q?gKwLqtQSvOsd6Xkls8c7YYueXigB2co5m4KzgteaVVgc+wGgngXq5YGgigKP?=
 =?us-ascii?Q?5GPwWjhubx+i7iZzXAPDrt4V9h4HdwFW+KU7/uPOaEcE2YZ60JCXK+sSJ4GW?=
 =?us-ascii?Q?GroUcs4AOgZIhcIFOTGK54ZHasnQW3J4fFWf/s5n7oSOuDn9PKWoFEHauxzZ?=
 =?us-ascii?Q?JgtZLJkAqZRXao4xHDZUio39MVaV7T1awBsQUKopm5hoDEfSHUJywOflCjr+?=
 =?us-ascii?Q?gnqSKeHR4rNjyDN2DhAn1FuDL+5CzYEBAKEnCFDGFCQorW91el4q8kpeVHX1?=
 =?us-ascii?Q?E3QoEpKBpn5U5JZCN2QISMBhL/Ymn57J1EVabB3IXTx2Ani+s2JBslCv8dws?=
 =?us-ascii?Q?hD5+xtrfw0H81gjl1XBsNvNZ3YGZBHy36iwiF0Cwx3Mt6ng5RG/QOXOFkL+J?=
 =?us-ascii?Q?vvsDYiJUm/rAo/U5yhn9i7Qlg9/AR2F+QL1gyA2KUsCgQlsd9Op76610Gwsq?=
 =?us-ascii?Q?MvwP0cf0wV228DKdh/HnHJlqV3OdAvk6wGHQc+6Hgi/2Ws3DoKKSXHBHckMD?=
 =?us-ascii?Q?OlgIU4LvjO3aARnK3ju496X7g5PgABcCuUA8djJuA8NncK5CrozhNEvB+ytv?=
 =?us-ascii?Q?6a6JC78fgsh2+5vVw908n2mM/wlsh4KIkxQxl0EY0oO4TZ0DUxHP56/dHHrI?=
 =?us-ascii?Q?VbEK4WlJrFvIyt/IQMVx3IPY6zCJtN1yIo6pGc6qW7p27Qu7JqEOaWRDAEHh?=
 =?us-ascii?Q?IatCrn2BTH6Pibk//DCHKTypOZ3Hi5EmqKWPAaDe4oEzKYyJLnLotmSAGuNk?=
 =?us-ascii?Q?DQRLA3Y1v9zm0IGxaE5i+LzbglWKSJjMQgAcB3h4qe+IyIOWt6EH1EGdVgxt?=
 =?us-ascii?Q?aA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 782b3603-bee2-4641-1621-08dd3af4e481
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 14:56:03.8581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mK6QZkEfIPcA4ShTIrcyNzpLazxskt6jDkAb82NfgXZFnc3rdcwAkOSPNOUW7DVeFZ8n0SDIwKNq6xFspPft8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7567

On Wed, 22 Jan 2025 13:38:09 +0100
Fiona Behrens <me@kloenk.dev> wrote:

> Move the helper functions `offset_valid`, `io_addr` and
> `io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused
> if other abstractions with different write/read functions are
> needed (e.g. `writeb` vs `iowrite` vs `outb`).
> 
> Make this functions public as well so they can be used from other
> modules if you aquire a `IoRaw`.
> 
> Signed-off-by: Fiona Behrens <me@kloenk.dev>
> ---
>  rust/kernel/io.rs | 98 +++++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 63 insertions(+), 35 deletions(-)
> 
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..a6d026f458608626113fd194ee5a8616b4ef76fe 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -15,6 +15,11 @@
>  /// Instead, the bus specific MMIO implementation must convert this raw representation into an `Io`
>  /// instance providing the actual memory accessors. Only by the conversion into an `Io` structure
>  /// any guarantees are given.
> +///
> +/// # Invariant
> +///
> +/// `addr` plus `maxsize` has to fit in memory (smaller than [`usize::MAX`])
> +/// and `maxsize` has to be smaller or equal to `SIZE`.
>  pub struct IoRaw<const SIZE: usize = 0> {
>      addr: usize,
>      maxsize: usize,
> @@ -23,7 +28,7 @@ pub struct IoRaw<const SIZE: usize = 0> {
>  impl<const SIZE: usize> IoRaw<SIZE> {
>      /// Returns a new `IoRaw` instance on success, an error otherwise.
>      pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
> -        if maxsize < SIZE {
> +        if maxsize < SIZE || addr.checked_add(maxsize).is_none() {
>              return Err(EINVAL);
>          }

By creating an invariant, you'll need to add `// INVARIANT` for the
construction of `IoRaw` below (the untouched lines, so not visible in
the patch).

>  
> @@ -32,15 +37,66 @@ pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
>  
>      /// Returns the base address of the MMIO region.
>      #[inline]
> -    pub fn addr(&self) -> usize {
> +    pub const fn addr(&self) -> usize {
>          self.addr
>      }
>  
>      /// Returns the maximum size of the MMIO region.
>      #[inline]
> -    pub fn maxsize(&self) -> usize {
> +    pub const fn maxsize(&self) -> usize {
>          self.maxsize
>      }
> +
> +    /// Check if the offset plus the size of the type `U` fits in the bounds of `size`.
> +    /// Also checks if the offset is aligned with the type size.
> +    #[inline]
> +    pub const fn offset_valid<U>(offset: usize, size: usize) -> bool {
> +        let type_size = core::mem::size_of::<U>();
> +        if let Some(end) = offset.checked_add(type_size) {
> +            end <= size && offset % type_size == 0
> +        } else {
> +            false
> +        }
> +    }
> +
> +    /// Check if the offset (plus the type size) is out of bounds.
> +    ///
> +    /// Runtime checked version of [`io_addr_assert`].
> +    ///
> +    /// See [`offset_valid`] for the performed offset check.
> +    ///
> +    /// # Errors
> +    ///
> +    /// Returns [`EINVAL`] if the type does not fit into [`IoRaw`] at the given offset.
> +    ///
> +    /// [`offset_valid`]: Self::offset_valid
> +    /// [`io_addr_assert`]: Self::io_addr_assert
> +    #[inline]
> +    pub fn io_addr<U>(&self, offset: usize) -> Result<usize> {
> +        if !Self::offset_valid::<U>(offset, self.maxsize()) {
> +            return Err(EINVAL);
> +        }
> +
> +        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
> +        // this can't overflow.
> +        self.addr().checked_add(offset).ok_or(EINVAL)

I know this is moved over, but I think if you added an invariant you
should use it. Given now this is given by the invariant, you
should be able to use `unchecked_add` (or just add and leave the
behaviour of overflow to user's .config).

> +    }
> +
> +    /// Check at build time if the offset (plus the type size) is out of bounds.
> +    ///
> +    /// Compiletime checked version of [`io_addr`].
> +    ///
> +    /// See [`offset_valid`] for the performed offset check.
> +    ///
> +    ///
> +    /// [`offset_valid`]: Self::offset_valid
> +    /// [`io_addr`]: Self::io_addr
> +    #[inline]
> +    pub const fn io_addr_assert<U>(&self, offset: usize) -> usize {
> +        build_assert!(Self::offset_valid::<U>(offset, SIZE));
> +
> +        self.addr() + offset
> +    }
>  }

Best,
Gary
