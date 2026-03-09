Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0025036D4F3;
	Mon,  9 Mar 2026 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093208; cv=fail; b=WoMK0a+ADnL5QaexaIL0nu+gjDEzn31JQ9GbRJi5N3jTHltphQAfxzeuljnUlQ2hWFd0bzKzkZ8jljpsXR134G/9wECKo+2JLY2dcxWkmNC32+qMLxDrzqgM+n76KQ/iSwMwxPW1fvhdCJdTorvVaZy61hH9OA8Jir4s3lJkdYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093208; c=relaxed/simple;
	bh=2Xdxigi9/6kWGDZpX5y1wRnRrCIFjB4KQBJ7CN7Bjp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HtMFF0a/sjyTDB+Tnz4cvdQXbaNWOQwXlmbNJLwRhedLweZpWSgiJjla3DVXlfTNzxvazH5y3gaNiu21um5l4ERXvenNvIJuLDaEjsXxomJ5od7Ig07gNuLbzQ6lRb35C4CC+EKWxej26v/TFgz38DU8WrZQaEz8We7TaG/lVuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H/IDCNeo; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H/IDCNeo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ug27wscTFK7PsqHETyok4mqwpYyWwgl1gSxWbWfqXkCUuBdb6XhgBkBmr1JmwvlUH5M5zyibzvDDwJpyBqqm4BvBI+nr5VtXfT7beKlq0Fu3Fxb57O+NM5qraHcradMwOM9MaGkQIbvUZuMg1jipvNVGqLnSQBj9Meam/XinYADpXrk2qiBmpeHxHQpf2zQNWwKnbinsL3+5Dj5Aq/WXHQrvu5XHHdOCPbsLdNbjgnSY7jl9EpjM05nhxZTN1txDhe3AAw+v9J9SNXy7mHZQ3HKJzKthJwJ9VLkJPyWePzrQ1oevPzovt0QWbLXYear9s1MOWxrA3OQGv+OJkyBFkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1H8JWQKg4rmuxExCJ+0FkS/FJ4qGX+i9QEduVxvNbc=;
 b=GyxiscSrQlKGOpqLjY141sOZj8wDKyHhCY3MdYaDfmOTxcn34tSAGV8goOfF8lexbHKyBN5GLCqSfnuGh6QLULNzJ8XX0cemCKghq6/P8kDQMXZNkcvATf+dXZT8At0eoXAIT5fJZ9LevM5fCjt8jmFzC0f5ks76durVQQoKsDa4euAGQHPSoBl3ILb4Equhu52J2xg/1wPbmeQi3dR9HyQxZ3pV0U5zRKVkNNQIIyd2Pm6Pey7qrCA2qwef65iPbColJ778gXWw54ItLlVc0wZe17ToFxDk7rBSfGlMWubVhki4kwQSEPphzsHmRP9lopq6vjqq2Mss+LBzWbQtrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1H8JWQKg4rmuxExCJ+0FkS/FJ4qGX+i9QEduVxvNbc=;
 b=H/IDCNeoFe910wePDdTKjW2Rt22G1p9Ozkoe4O8NL5AkXobSPuzsjg3uJbLs9daBwBe4s5bIEp01tusNzYkCphIcdNhjEQpMMVszvGP0muCNovVvifVOmLwcMNaL3PA2xo9HNW5O3b6wQw6wzFzGisHTSUNEtB4ZTsFWLTgAjG5bngnDLa8eBxz6KISbRnVp8n+uRRq9RloyU0ZjQwIH6mExRkQWTPOUkmUjn3VdOLi94sm6pPSCli+XrRzbf7MhTVNfqyLoACQBgnWSJ/rub6ZXgVnz7oBC0+ovbSxcBKvQOk3ov/BgXSZRYs6XadPDob0YDj2JlScHT5kUBUGCRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB7024.namprd12.prod.outlook.com (2603:10b6:806:26e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 21:53:23 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 21:53:23 +0000
Date: Mon, 9 Mar 2026 17:53:21 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
Message-ID: <20260309215321.GA3120567@joelbox2>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
X-ClientProxiedBy: CY5PR17CA0033.namprd17.prod.outlook.com
 (2603:10b6:930:12::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 2849feb6-0f4e-4268-86a7-08de7e26494f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	z4Y8AC3HGkJUgN99uA9qnGmIcGsTLI9Yc6G4WRy35vzn6EXcUZkIw5W4MRukkPfXjWqiDzK3RZ4wxBWAOb/doJozd88yh9dr7/0UABjcxRIhrJh242ZCpHqC9AY9Rj4iQyvJA/QvEjHEVCATMNpFCCp8oRUODOdYXP9AdJN70+Kw7ttiG3Q1iUIl8fZpYJpxqRT1mHTDujb9XSP5MBdM+vl1RjDDoEBTPufj1zlm6u3R6WxAmtis2a1/PsOG867gJ1bGhznsp0B3oGeA5C29d3TybApSif49HBF8UfqN3OVJ2QeKP535O8VFLZiTfXKTRVLUzgm03JLzgLYep3qAZzDnJE/hjg39aPrKiYcH2HZeclzdMmkhvLqkzveDi4ZL8c7UuWLLrJ4LiXQrP3o1fEkYzMijo5IXcRt9TQzfwmxW22vCwmYgFE9qFUQ9neJGZiu7+dgEu2AH0fp33uIbJGHS1mMgNsFZRI5bk67J6ItkdfHD97oHzexZN0z3b1SN7MKBnJ7QRbBaIrieCl/To3lQgY7RSJEu4SzCRVYsxvm0eB1WdGvKmhxhABwFwAr0lgH8BXzgWyYt6tX1OZVhwXfgSaaaaEwgXzkZ3JJlPnkFA9hQY06sM3EM79+GnsnWoMrlVP3YN2y5D6JqnNEDx9q5DAPXin/bk+j7TcU9QIqEXKbj3I71xrT+FVGJtmPlvFwZmOgPoBYkiUUajvHgA4irL8PNfJP7SCDxBBJPeok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?58MgLbOGEUx4OnPdpMGr4qKfL66JIwO65/h37QeOSFFD4hubKHhdkJtydsJi?=
 =?us-ascii?Q?gtKY9+YdXU4Ie/rxQ35Hrru8mCCjRPNWyeu8wpj1VRD0qCc8PvBFP6xXNVgf?=
 =?us-ascii?Q?0TUleDI7Oe+v3rh72+JyPCap0UKcRtkIio0G11z7745d1ib3Zd9XmvMEWb6M?=
 =?us-ascii?Q?8v5vW0d+bjFeam0pz2lBEVkwjKNJkEfI33yMIQkw0VtC0IVB/yuA3dxDxUan?=
 =?us-ascii?Q?le+N9lpZgf4hgVYk4+rGyleA6sJ6xBoa36/um6UC7kuxdmUZZ3xeAANAfOzV?=
 =?us-ascii?Q?UdNvXYnUgIGFK84ro0Z4wHPX1ka7JlmGBI7+lr80kxRq+aGRzXHf91dDDJ9d?=
 =?us-ascii?Q?Ux3cEQYdVXX9P0LbgUUS5YhsYKMcg5KNzvyGM9/aPwRkwrYb1W17G1/Cijrg?=
 =?us-ascii?Q?F0VDB/YbWTdkm4YWDNcNV+N2WAdJAAMSLSGchRwUFbDsb+DOoF/aSxHPBYmd?=
 =?us-ascii?Q?v567Px8APp/fpF3aYuOnkuUqsf3woK7dwuHk13ewL3T6Nm+1FYG+9LeFZG2R?=
 =?us-ascii?Q?PU8vBoRHB+tX6ROTNe5BOCEjJyz3WDvQUNVAmge7P/+Q86wfhejyD6F9RiHa?=
 =?us-ascii?Q?8L/7WSX0IDsBsK0VvISfClVkwgoeWELhAr+GNDBmPYTPfwKUVCbNAOjM19cg?=
 =?us-ascii?Q?g5YtPHpuek9GvwxAVW9/RE8Q4uE2D7OMz//z/NR83IddSKCW+FH3naUVpZ/Z?=
 =?us-ascii?Q?2Wl5z+3mZR8UG240D/QVCO3RTPTmsPy31qFb08TZ0F6zhA4X3t0dMDdIxnZW?=
 =?us-ascii?Q?TRNbBvsVxfBtUfWtY/PuzC6fpMDizhmHtfICWClED2V/g1KU6ODwYGGaK6lp?=
 =?us-ascii?Q?0Exsbzpg4UTkdF3uB+3PghscP9GRsdK/I12uimVxbzXQZFUkrM7DtvRCtbDJ?=
 =?us-ascii?Q?dV73A+1lmMy4NaJcSdOZZxIeZfOiLKBLS9l4wFUpJeaBAlvb+QzjAE01CxNW?=
 =?us-ascii?Q?ZF/BGoFghq5sYEedsszLsD+D+KWjISn/0sB4YDMdv70J2KfokgUIQHPJ/JLY?=
 =?us-ascii?Q?FHyy0JnnQzbq4hr+l9QMrx0TxjuowUSrA7JkwFwOAKQRqkSELFKmrHZJo2K3?=
 =?us-ascii?Q?W5vHHHo2MHKYucNVfK4YaDJmA3pNiHItOSAoN6+glHh+TmTmhWj4XVnYPHWt?=
 =?us-ascii?Q?QP93C+s3f8LXv3FSz13h30EmBSwRrA/wgqvRdUL83QlN4jYN5TCJMLiTG+4O?=
 =?us-ascii?Q?btHHjDV6J3QoC5Qt3BR0nblbnPqI7NXRWf1G2244y+x1G3CGBRrC5feVFmIR?=
 =?us-ascii?Q?00gG7II0ISWw8Q0Y39Mm8Q3CzcV81RW9Zr30OSV0YREnm1jFjiAQaf1SKzgW?=
 =?us-ascii?Q?z9Ze6Y/qsigDJMW5jRVLmDyTxIRVP0Bf8dZreUs0IzVBp7uNsOiAJLopocDb?=
 =?us-ascii?Q?li5pFp0WBHkjYuc7emaBOR0emgVpLjbfqh3xiJ+3OAK1GdfXItJzb1Tgks7P?=
 =?us-ascii?Q?EXqRhFP8eMKanRLx0PgA2ofAtiOLO4iHSiMkbYBl9p4BqEmYPmM8lWVrDFg0?=
 =?us-ascii?Q?fAwYEKy8gGv67ymcskrrtHF/mv0LANUDjDPJLMSe0u1JMQS1THBfo+aa9Dft?=
 =?us-ascii?Q?B7c+NwAwwuIYPETyNBvqqpRwKmwcX+51bgIvosegkt6ifoNS/kRIFgNSsH3V?=
 =?us-ascii?Q?PE6bQhxLTVc1ti1CLeyXltrnP/vQ/Ln99IeSzmK69uLe2hlZKoy2PL4Feo0A?=
 =?us-ascii?Q?MTM1MYOedE9cEu2jg9qkaYk5ulvtYOk5csRvedejaOphylV88xrJTYinepJ9?=
 =?us-ascii?Q?3pCDF9OXUw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2849feb6-0f4e-4268-86a7-08de7e26494f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 21:53:23.8038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7yWUvggBsgI9DhpaDt+DXx89Hv+XKCRUen/AGTCgUGkr/nKtSnQiOjujE2Zpf4FgdaF3n/J0upPNTpIFqi71A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7024

On Fri, Feb 27, 2026 at 09:32:11PM +0900, Eliot Courtney wrote:
> Add general `flush_into_vec` function. Add `flush_into_kvvec`
> convenience wrapper alongside the existing `flush_into_kvec` function.
> This is generally useful but immediately used for e.g. holding RM
> control payloads, which can be large (~>=20 KiB).
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

thanks,

--
Joel Fernandes



> ---
>  drivers/gpu/nova-core/sbuffer.rs | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
> index 3a41d224c77a..38f8a8426521 100644
> --- a/drivers/gpu/nova-core/sbuffer.rs
> +++ b/drivers/gpu/nova-core/sbuffer.rs
> @@ -2,7 +2,13 @@
>  
>  use core::ops::Deref;
>  
> -use kernel::prelude::*;
> +use kernel::{
> +    alloc::{
> +        Allocator,
> +        KVec, //
> +    },
> +    prelude::*, //
> +};
>  
>  /// A buffer abstraction for discontiguous byte slices.
>  ///
> @@ -162,11 +168,14 @@ pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
>          Ok(())
>      }
>  
> -    /// Read all the remaining data into a [`KVec`].
> +    /// Read all the remaining data into a [`Vec`] with the given allocator.
>      ///
>      /// `self` will be empty after this operation.
> -    pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
> -        let mut buf = KVec::<u8>::new();
> +    pub(crate) fn flush_into_vec<A: Allocator>(
> +        &mut self,
> +        flags: kernel::alloc::Flags,
> +    ) -> Result<Vec<u8, A>> {
> +        let mut buf = Vec::<u8, A>::new();
>  
>          if let Some(slice) = core::mem::take(&mut self.cur_slice) {
>              buf.extend_from_slice(slice, flags)?;
> @@ -177,6 +186,20 @@ pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<
>  
>          Ok(buf)
>      }
> +
> +    /// Read all the remaining data into a [`KVec`].
> +    ///
> +    /// `self` will be empty after this operation.
> +    pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
> +        self.flush_into_vec(flags)
> +    }
> +
> +    /// Read all the remaining data into a [`KVVec`].
> +    ///
> +    /// `self` will be empty after this operation.
> +    pub(crate) fn flush_into_kvvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVVec<u8>> {
> +        self.flush_into_vec(flags)
> +    }
>  }
>  
>  /// Provides a way to get mutable slices of data to write into.
> 
> -- 
> 2.53.0
> 
