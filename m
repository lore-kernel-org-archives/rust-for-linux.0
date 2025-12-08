Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9627FD6D;
	Mon,  8 Dec 2025 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191655; cv=fail; b=uIQhjLbod8RwyT+mmJGXAFIbCQbbX8tKIcOap1AfHH4tB9Icod5cGUUhzAar+ZqYJErR7lYZHMZ8GaAg4BtyFDlDKBHbz0g8Mu7goK/N/HygSW54FNr8mxAG/yrP8dQWAIkRzw/5AP1eU3QWpARkUv+ria1kEnWGdWte0FYwgI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191655; c=relaxed/simple;
	bh=bR+I6zWk3SoecJplE2wHkbSuEXjw/aGd5uBMueEjO0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DEPcNpcx7zmzVv2btxB9njkrdcvY9oXTQtteur/YGk1t0Jh9jEaeHMCm1w/47Ars6dc/BjiMjiejLQ74dV4LI1eKbS0nJi16zagpruRkMD0MvVasFEyj8xD5HrmPr4gGstm+qtrSfwCrEGQ+IbsmokCbpKLyMS9LfbN3qJl93JI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AI/bo4tm; arc=fail smtp.client-ip=40.107.208.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AI/bo4tm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feoGeLHE+ZS2GWv5urTfYvQTTJY714FVgx1DCJybz7PvdW5d0wkPmIIbkfrWLLRbPIZL4OI7cGknES2d9QbaoBNRMOEnDqKW5zCdUzIZebuIs/fD55hxf47qNBG01CvfIJWDppdr4BgP7Dr7ClpUzZyL6tKp1NFI3lIdWLZxSe18xL9aMHYb+nL79YryqesHPS8ItqNghjGniqQulmzVSb8PPL3tdv98+wEAQ3s5tQw29l+xnf0XQtb742D7reEmn0DsNky4nZwRSGUOKBx3mOxp57ZaqLO56fpS0vNzIaN6MpQFx2pBhtPF2CPN4v0Jk5fUc7nk4dJJwiaxI4dH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxB43O5H4e9ESdvQrbWVxypAoj1ByWs1DqmbunWqgYk=;
 b=q8PpqMAdMn/ctT+BnR+SmO4s892zTcRiWzJ+41G9X0ya64QeKVFiuhRatcLVrgEFhYv9l5D//wtroZdxc9nu5cdIAzFzgPDGwN7QwE6s086OZp1FQ1o8jRVqNas4M8KYCEAYabaUAheRE1CwVQiNizDg1BLHBkpL9cxEfyrdtA+IeibfsTnxDfE08+KZVUM5oRfbCGMvDkeeupinQOtWBoaE/lDJjxR3EOuG2uhWXUV9JqOv0vV2Bs2iZpoEq9n4m3dUHBy8/t+kYz6cdQQC+F5LLybW2jcNfnBxtTIA7gHhRFjmR/sL6q3KSq9Qo0IMIUI0qu0wS2eJQsIGNEKYTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxB43O5H4e9ESdvQrbWVxypAoj1ByWs1DqmbunWqgYk=;
 b=AI/bo4tmmmfu36+AD2OgG72hjsFJELbmAc7M1SX3SM/gCb3VV9w0NOZyxx+Abm8HklURb/gRA5uFoxoUtuG9KNKJaFfam5oAmXnbekrrUfc51ZatEtwyY1/J0wMYrilRSMs+YpIpv2uEYxqVg5VAQsH3Pc6Z0NubNpLAPQd78p/sYcxdKQS+fcGuo+A8FWcCdPg9B35ZcWOjKwRimYZPc1ALhrh/XrMX3S52AQyIk4+lfv3ePiFczWeg+Q1sg1mvC5rtKIEFvPFTbP9vlYVJpz+shUs0Z7Bym51Yg2KJXAodOf0r0i9ursnjcfd2L5LvgSfjYjdq27PQanRjsABWNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 11:00:50 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 11:00:50 +0000
Date: Mon, 8 Dec 2025 22:00:45 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: transmute: implement FromBytes and AsBytes
 for ()
Message-ID: <fflyalpsifmeusaw2pru6765ry6a3q4ja5x3t52dwjyoqfbihn@krotxfd7vyaj>
References: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
 <20251208-transmute_unit-v2-1-aa17a6848afb@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-transmute_unit-v2-1-aa17a6848afb@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0160.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::15) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b21a0b4-2f4c-4a45-047a-08de36490c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B/G9S2KGr1kRMKwIT/PMvjm7wnSAOrUnJPdHg6SGIncrCxkF9Tw4iqA9Vhui?=
 =?us-ascii?Q?FognKqbufv78MT0bhk0A2bvWTznBDPBHZo/XfsGsegC6o/zgnV8xwIqTAanq?=
 =?us-ascii?Q?Yx1UJ0BnUwVWnEOgo/STW3hon06pvtSQfnuLFGVjpM/PuwQPaHVDTY8awXPq?=
 =?us-ascii?Q?mTcGGX4OJUXAmcstK+706JNNEdXRqHs7LE6oZbTjzGyF5UcejC+cjnLY0mjT?=
 =?us-ascii?Q?lbHwWhSUa4/oMj+BVpUy1XHGsNKExp7P2Adpd4acr+nDSOAQI0MjuXC31etS?=
 =?us-ascii?Q?qjuTkTSTH3ivuUFejLIMUSgZe6SxcM7WP2WbcnV2em0E3Zzs3yY3ml1zpxAm?=
 =?us-ascii?Q?tvuBD2nleMJ6Gh6mSd2kE19ItPGYdoDxTwc/CiPyWYztZhHUcxmq2rsuAHaX?=
 =?us-ascii?Q?zkrdn9J2NofTk5WMHHSbb9NaWDb6xA/X8HGt+pBe/g4FlDfKJrJHJXooZQ9R?=
 =?us-ascii?Q?XhPGCikct4qVqIfO1BeEgWV14kzjLkhZh+DX6AP9RKvRSt7LxEfKFQbHyvdN?=
 =?us-ascii?Q?46fdFEknZKJKlhvqFbNdT167x/24ZLkjX3FkheFzQZdXqiGxBLfnRaO3oTrh?=
 =?us-ascii?Q?9SOP92UDyOdbQeD/koeSIekbR5s2J02uOsk1clm1G6zZcRk/1kRwRCHsk882?=
 =?us-ascii?Q?Ft5tosYU7l21i+ZFo9hsf7SlU7AMlRIjJsHEnTF+u+ez41eRmWRQKdBA68jn?=
 =?us-ascii?Q?HMnKZtBvthC1AxdLVenYzcp07fIaYGnFwYZhtQvq8m/ZhZlSTtY3J7iDE4Kq?=
 =?us-ascii?Q?QVp76/6R/PB5qGHQYuolPRLbkHp+ZpExhMmKTjihriqyy0t7nh23llgtaOr2?=
 =?us-ascii?Q?n1q3v3ul89v2kG4kdFQN/IZ0xnOPDaDlEYWbic0Eag0fEYIpqX4Ypzn9rlZb?=
 =?us-ascii?Q?n05kBx3ZH2MDA4MJXUWRVEp70FBwaVI2ardKq0NAP9nfO8FTVExD+2WcM2/n?=
 =?us-ascii?Q?SkB74idr7pbUWUqCJ5ZonzI7Gt2aMMZc3Kd1DBwOzLcusK6rokd+hNoNqK5R?=
 =?us-ascii?Q?qlwwEvugAGjPjGI+F8Jb9Ip6bJHzGyj7yjyLWUXeLikLRA5jdNufwQNG3Dw6?=
 =?us-ascii?Q?qz1aqubiOkq2wYucbMSx4mJlfzOIV3xfmxr+SWph1ku4WApcJBn14ToPNVP5?=
 =?us-ascii?Q?yCQ07Tl+eurXGXKUSzIPyl9PmAoOesZfSD46gIIjg/56GnuUP1tGyS626wIL?=
 =?us-ascii?Q?LQ0Z6C15PWPvOB8tBsw2Dx1xMe5w1JVte30bhLCQNrwnIW2EhydLMwuMD1Df?=
 =?us-ascii?Q?YzKFVuFxfGt5J0asnhjC4raf69SSfsxqPCoDFzQKz16N/sc/TzvCd5Y6sI5N?=
 =?us-ascii?Q?hBOg2eBZFd1UFwutFsLz358TEcO9uaeXpZctEh3aJTLPhlPWdTvznBhKZdRH?=
 =?us-ascii?Q?w/XCqodf1/sWosWenN4yvfMLYxrTnXyYYKUtjxvgp1Nxj7j5eQ9e649bQS0I?=
 =?us-ascii?Q?rU40UuBa93kKVHR1ERlM7kG1jMOvzy4o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WwQhG9WS4asMpDhYxGGZXZR3k9jx2QWvVCVXKFVAroSRIRALTY4VXQLUqZzR?=
 =?us-ascii?Q?SeSJj+Vras4UDR3sRTEepsoagKTka5X2vw5ImruaFTLClxWAce6I+QZ2sVN5?=
 =?us-ascii?Q?+NwMA8hv8knZI1ElnqyUdi4VMR6ZloM+/9JLJvTcjcBC4Wb9qlOLhrxhSNAJ?=
 =?us-ascii?Q?VH3PdRT2rORZp0cPCkcOG+8PQaZ79ZaDcFAEnwO+IS7noxWKlAWlQ310a+7/?=
 =?us-ascii?Q?/CImg7JlF6LogXHzXTopn5eX9wAuCVCc4o/kHYlrx+xn7Zq9/xUmGZykqE6+?=
 =?us-ascii?Q?pUsMOQM5M4Hp5G8kK0QV4gEw/gHQlq+Yla+wdorscI2du75EoEuSeBT8m+F6?=
 =?us-ascii?Q?Y1322krnLjpCX2aufRAbBpLofGFp0alYNhvi2VmUegMnJapLEZZLwvSa2L9U?=
 =?us-ascii?Q?hVT56LvGHPYwBMot/uBM2LUqDFSoNYWXMhCIZwp3ne8FwFkxixZmKLfWAV6b?=
 =?us-ascii?Q?HDnc0aT/ObyaKSQSFVinG5IoI++wcYawDaX5pX/VV5g+7X1Umpuk/FBySCVl?=
 =?us-ascii?Q?Uh2bMfOUWo48MAioaKXk784gYLjGI1gKdWIJ/b9Mz/WKYRU2uB3oVXsg9X/a?=
 =?us-ascii?Q?Mm00ylV4bNxVkDPpk41yYUR2Xq9E0dRiLZm5kzqi7jHkr6QbaS+QxzJyXqua?=
 =?us-ascii?Q?DKx4eWiY0XxJEnKmNq3ZTW6HthkcWAtzGU33QJcA/DfqY1E3MBCmdCQTcNkh?=
 =?us-ascii?Q?U+v4qJ6+1UPh9HdHMfntWKOXSXwvRqXgn0wVquv5yO2sTzkuK2fjrJgq8ao2?=
 =?us-ascii?Q?SaoehQ7/1+XQkXeHOnH6ZruwYN020aWOY1+hvN2XcLc/HIfbaAe3t4FLc7ad?=
 =?us-ascii?Q?70YkL9vsqn9Vzre8JPPMtzeFdacxkEqRRd7Fl7Mxu74icCvU2La/GYK+ZklX?=
 =?us-ascii?Q?S7GJjA1Qh2PxOQDrDQMc1uVR781XtrC067UOPCfFpoyaQqhlUSqMuHrWDQSW?=
 =?us-ascii?Q?nJo5Fz3jPvZEEYV6fXTTIsMsNaCNPJZGhPjPyGEiHIVSVRCDeHpHUloyjCPv?=
 =?us-ascii?Q?klOi/K62r7UFv2KlsSuXyJ+jsJ+CsebMHqeRBFe7pZSytFM1F5ed5bx5e2fw?=
 =?us-ascii?Q?/CPym5O6K/BMKfNbn28MUczmKIvI1cc1PAL5AdHLyveoBneeSbuQLEC55sOq?=
 =?us-ascii?Q?X9jMJp/GCP23qGyvqrt2eXQNJI6+tgmUzHQ5duAxWPEjtCFbqvU/Y+kgOyrt?=
 =?us-ascii?Q?TO57CN8ZeeX4MnwLmq97iq3ZZyfvS9G2xNTXKi669NoIEIaLuY05gt8RNGOA?=
 =?us-ascii?Q?t8Db49je1zmcAnFwqHkOSEQuaWoAKKCVauQwx45tBIvzuqPgO/qoqeWBATnc?=
 =?us-ascii?Q?CO6wiPEJBTfcMfSljs+oym3InFosTwAfKu/0fDOSGTit6PtAlH3w3PCW3eq9?=
 =?us-ascii?Q?fvWt7jVsjvwTdDdy4JMZyzN1prdXcOJaOgSIFYwq2OjpZbGSpGFrFIBqTF0B?=
 =?us-ascii?Q?TWz2OLBIgy3RusxaU+iCHSGA1YnwO/AJmZTwpSA+jsvLeF/Xk5gmzSd5CiqH?=
 =?us-ascii?Q?h17WrB5SBmJxoxzgd0dgHqm+MB0GDh18ghw30aCjeItN75JMr7IMq80BM0B3?=
 =?us-ascii?Q?UjMEP7/0PY7Pbj45BkiqP8yNmTTbu7/Hfj2hOz4Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b21a0b4-2f4c-4a45-047a-08de36490c62
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 11:00:50.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k1D4p5dKbKcghsNuA6TcYKWPmFx0vAbfE8BAlXN3j8EPhGyIVQjsLDUO5+zUysbn/23PK0jqzTzYqlgeE16qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629

On 2025-12-08 at 20:54 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> This is useful when using types that may or may not be empty in generic
> code relying on these traits. It is also safe because technically a
> no-op.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/transmute.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> index be5dbf3829e2..8d78c81e3749 100644
> --- a/rust/kernel/transmute.rs
> +++ b/rust/kernel/transmute.rs
> @@ -170,6 +170,9 @@ macro_rules! impl_frombytes {
>  }
>  
>  impl_frombytes! {
> +    // SAFETY: This type is empty and thus does not consume any data.
> +    (),
> +
>      // SAFETY: All bit patterns are acceptable values of the types below.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> @@ -230,6 +233,9 @@ macro_rules! impl_asbytes {
>  }
>  
>  impl_asbytes! {
> +    // SAFETY: This type is empty and thus returns an empty slice.

I would have thought the safety comment should have referenced that it cannot
contain any uninitialized data. OTOH that's probably obvious so:

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> +    (),
> +
>      // SAFETY: Instances of the following types have no uninitialized portions.
>      u8, u16, u32, u64, usize,
>      i8, i16, i32, i64, isize,
> 
> -- 
> 2.52.0
> 
