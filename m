Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010044.outbound.protection.outlook.com [52.101.85.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7678927A476;
	Wed,  4 Feb 2026 17:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224676; cv=fail; b=jWTzk/K6Rn8R+1MTdIkRTTX3S9gKTR0ia5bMtEKHbMLnMWhVleS8BTqiIqYQt2HW6BrmUMOZl1JMXneOzpSRKnHAuIRGGgv2GtEtMM3ut83opU/0Ap0eFGtVK/3NoewhFWsdHboWn5bHCxeTOATxuKPCvlnqniE+AW92QfABzn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224676; c=relaxed/simple;
	bh=SU3u+ivxg1YROBAcLEhPllj1VKaCKbTY/BKQAwo2fTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TVrHBeyN0mwPVecowgbsl4rjQG8Am2dLjU4Jplq1tlAB9KRhfNFpP35poyt/nabcJvyoGeu2iaq/PVhkjvC2XE0XPflKIk7uT+QHjG9pRHx4owVHKWUDF0mReXRkcHIZJrbh24cd8ZbtUmkPFxlRGX0/Go3i11PE1OKwyohuHpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=G4/L2v4t; arc=fail smtp.client-ip=52.101.85.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="G4/L2v4t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1vHIgZ/dMzjRNZpZ4b93TeKCUr4dLHBE9XU5sne/vgh3ssrfCmCIJZytJOv3mTYYxwU3NnLpSFyMfbXEAQ/CUiigWEq/Pm6a4aFwx28knUbypQSjWa53ZlBNq5azwzBTcR5zOXGqZHc6XGk46OAsYX5GmG044IAUoaUwUIO9g1O+jSwfwP5hxSqXaF0ss6c+lkZjAo5Lh8DftZ3KcQaKtFG8fDtIikxlMVtuRYKM+QCKVpiyxMkSOC8EFCNfzh90Uo/BdEtK9XbOm8J/CjXJhPOutdGiuxlG9i2pzRUoQiKU+wDWbtEOjCXMsTgEPLLeS/PkTfDRQHxBZhZq7bEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnpCIoDNzuqJnfnScMe5dDfgj3/P0GqsvFAb3v8em6g=;
 b=gmHV+XjyiI3phow14KgWyzIihKa4f/Va9RSe1xR1jELlLXu3S0944MUxKJSqCvIByzMW3fz3Ess4w13TTv7xbaQRMUuQRhIt0bWuv+qARKqHYRAsmU7BNUzrAMoZtLzkxXyJ3y6EbcOKLWOTicUF/ITzmQ91QdfvSdlp6D6ZeXJS77Fi8nBOiKYlWgpOY2ChXITdlAmfYl/uCI3jUNmAlFF3JsUhh0eqtmgJ73HD4PNfr8x9nd8t5ieF8u0Q+3/7Mc7l/XNvxzHPEwqtiM/RJjvyxYiSpAAh38gFiSkWi8R/J/VLuKVh2qy8a+stFTiu91/3csnalgWqcvIqjc2RyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnpCIoDNzuqJnfnScMe5dDfgj3/P0GqsvFAb3v8em6g=;
 b=G4/L2v4tOB2cGWCQrrnHYHXGcPaRVcz3DKp2ceR0FMwOuK4yNMD2/EB0mfmFENNcKfBvwFQZ9ZjznSPegYu3TxpsXvH1PYAxTUAKoLBV299lZxTGEIi+vggnYo4ntjMilm2S+2jXZFoEEX8OyNjGsYQAxqx0DJ4adnFKDBA6RjXKKVtFzKYJNBNp134au0yWwLO80/Kiiofe/MlNuAmp6HAc0IveGmq6LHMoiJf45w3XYm/RuqNkPbgbZkNPGvsYxk1fYDTMGT/5N5PJCBOzBWqSsJercPhAu48oOs4czjuGEQR6MeR/SjwP1qlPgA+FRakPYawDiCBPlQzAAfSOoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH2PR12MB9520.namprd12.prod.outlook.com (2603:10b6:610:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 17:04:19 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 17:04:19 +0000
Date: Wed, 4 Feb 2026 12:04:17 -0500
From: Yury Norov <ynorov@nvidia.com>
To: jongan.kim@lge.com
Cc: a.hindborg@kernel.org, aliceryhl@google.com, arve@android.com,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org,
	cmllamas@google.com, dakr@kernel.org, daniel.almeida@collabora.com,
	gary@garyguo.net, gregkh@linuxfoundation.org, heesu0025.kim@lge.com,
	ht.hong@lge.com, jungsu.hwang@lge.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, sanghun.lee@lge.com,
	seulgi.lee@lge.com, sunghoon.kim@lge.com, tamird@gmail.com,
	tkjos@android.com, tmgross@umich.edu, viresh.kumar@linaro.org,
	vitaly.wool@konsulko.se, yury.norov@gmail.com
Subject: Re: [PATCH v3 1/3] binder: handle PID namespace conversion for
 freeze operation
Message-ID: <aYN8EeZKIw4_QHRa@yury>
References: <aYJc42j9bwgZyCFD@yury>
 <20260204090521.32136-1-jongan.kim@lge.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204090521.32136-1-jongan.kim@lge.com>
X-ClientProxiedBy: BN0PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:408:e5::8) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH2PR12MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d221551-9473-4dee-6673-08de640f6f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|10070799003|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YwbUi+h5nOKvWYPUX0OA/zwmt10bgWPn1nYhR3gPHB+MiJshMN31iFPeWfa4?=
 =?us-ascii?Q?Nq5sjvwiD+zFq38m7y0mMKntzWep94xAyqgcTUj5Tclr+2iad2+PGfSRmy05?=
 =?us-ascii?Q?xa7yM1wrohRe6wIaNxOYYteOx1Nl1rpYoEtXmytwy52yI5j10gec34JelO3s?=
 =?us-ascii?Q?TcOnAHib/MeVwAS0eUOlaInSMNa8hPfMYI1qGW2R9FOavPowHev9Peu0eSqL?=
 =?us-ascii?Q?gVhVMc7CmMEWr3z6jo9ZKUYdbskPLSzlHa0IqLPhLm0hEvWeJQhsi50hXSeU?=
 =?us-ascii?Q?C/qKr99xqToowViiD8Z+a+3jeVU243Rg36fSLTY5ocQnX0sYAs0trvF8bcB7?=
 =?us-ascii?Q?V20rDNTF+EFkgMfLM55FbSJ8DajWqCiXLC4QZt5SKZkAR8w1A1NAP7x4saAV?=
 =?us-ascii?Q?AuGUFB9tiQFxH6XXci9KaFIeuWNcS5VWMFy6ZdVsakjki+1iTBtuKlgU9our?=
 =?us-ascii?Q?s51U98Z5HrkuS6Jtsv9Rb8AE89HbQnpkJPnWz9zWqlrgu6OHw59M1tY3w+nQ?=
 =?us-ascii?Q?hL7Vewh4G0jdr3Nv3WOTL0lQqzpWmq6+Pk7tZg0PX87KpSdJz+lIB1VQk7rT?=
 =?us-ascii?Q?Q8YyDbuAkhNNzAJOflD8Q7308bKHb4GgyQXZQjd04BCMNe3ZZWzC7xh59a7s?=
 =?us-ascii?Q?sBPo8AjNZCj+XRZcfDNSSSHTG4zgQ4vo5goZxwGjc0woM7qhHG13oIAolTSt?=
 =?us-ascii?Q?YLdL5CBoPXicaXGBfc3U5XRuQss4ehVFf2+3hK5+vmg5cB7G9pMdZg7pAYVZ?=
 =?us-ascii?Q?ZteT0QZ1M0PQ/w3+B15IWnkYGI+AismeM3tcbXK+V50sYu7DcDGmRDb4UfQ4?=
 =?us-ascii?Q?ZhPOZC82QkiTpdnfB6CWPLxqm1etk9utzL/NJoPfnjotmV0xRmSKbloz3anf?=
 =?us-ascii?Q?/H2aCMF8ZIUmYs/YUorrvjB1rVo2Tuisxrz3PR2Fm+FMfkXhv3iTbfRpkzio?=
 =?us-ascii?Q?jkPBMO2PNLFLJOSA5e265CjK3W/Iu5nkGjzlHEdcW++F/Ncoeei2K9kWTxc8?=
 =?us-ascii?Q?dPIf4ytVKQ2RQIa293Rh2YGNArit8t28/CjNMFE+9XsQTgAuNgYFMHDKKwOp?=
 =?us-ascii?Q?JOSRuBwZcaGJL3NNrBCd7k3N2mQlgqfN2YuxaLptZUxIEC9m3WacZdoGueSm?=
 =?us-ascii?Q?Rmh/wajr+X1bgVR/v08nppulVSgp8fP1u951vk2uYrjsUqZw3+GIk6IQFJr5?=
 =?us-ascii?Q?zo5QO8u3jQvvDCL0a05z+AoBCszSsJ2GP6+Wy7/fYC8ObG0CK3xTvErBOMsg?=
 =?us-ascii?Q?P/e1g2OfeJII8GxMJZaqD00K0vnyd8Dg1coBMw9qMQXkPBPsXoh32EfgmNZK?=
 =?us-ascii?Q?G4g53eGKDy0mpqH87ggv2I0gaSz/r4VoWeIXUCZTFVDf24A9qqMfeVkam2oO?=
 =?us-ascii?Q?jaUINDUgJ3EXqTD6JxH0rGu58v99KmvBCyfZ2DsvBH+megWBNJJdXw3c+nN+?=
 =?us-ascii?Q?PdJJiJpAAc9UyyKZ22B2OJdA8Gfpva3yn6MNrQdUlntyUusnCqJRBNIeoJ71?=
 =?us-ascii?Q?6kShyFNhInH/EQ206sVEZEsitn2VrujsKc945+YDtt9Y54aAHt8082y9hzYJ?=
 =?us-ascii?Q?5nv1zeVF0OvU6IU3LOU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(10070799003)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LmcBSgtx6f656mFUsGW8JqwOGm+ivNFy6pob0NNJG+MMmFF0/F1hypFqkw/l?=
 =?us-ascii?Q?t9xp9s/gB/onuwN/O6MOFXt6yWRNn3umhcHAAMc2u6u07eKFnVeW0GmOBm/U?=
 =?us-ascii?Q?KT4GGS/fuIK0qzp241z08EW0rQSrcspEcGsueMZsImAOuolQOQWwv/0a3l9M?=
 =?us-ascii?Q?PXKaiPPgkb+qT7Ldq9TaCQC+IkdSQOtlpXBlLFVe72LHoFgD6kz7wICAjVU5?=
 =?us-ascii?Q?q+tMf7uFA3Ebxv8HF2rfpa5w0ePQfHviK1+ZYkronFMAlN9iyP0OhEKUdvq7?=
 =?us-ascii?Q?Dzg+2R7SM1HJB7+JYwcG3nPlC7srGCp33Vq2Dso9Pa8V3aLAfNwFt9UBTgE+?=
 =?us-ascii?Q?iNVMmgLt5REtsl8ElMzmZnKprWtdjpgzuu+CHYJ+cn2m+bopMXK1NPvMbpkH?=
 =?us-ascii?Q?o1CxSIBF20FY/98u4IRxDXunRZPH0pWpGN5YZoUul8wgloPXBZbvGnAJvvGE?=
 =?us-ascii?Q?Xy2cz5z2vOQO9jcYQlvzffiyaKC0hw/hxZOcfM5WQsOssrBxeb2AVXhE7nbb?=
 =?us-ascii?Q?U8Wws8t72eT2mbzT7pf55W4sWvqT78bxqXeLNrQJW5Zxy3ooqPE9WK/A4hv0?=
 =?us-ascii?Q?qG+3OQKo9O13OrtkT2YtrAtKyn2PR6i+lzfTReoLYB7ufg2PvXexNenvnfv7?=
 =?us-ascii?Q?nPQOiNtEFDvE5c0y54VSCWcpMN+k17j8qivg7kDFu+moUzqr39Nxubk8fP6M?=
 =?us-ascii?Q?ECX7BK9mf9kHfE7G9O8OmsIJWy/Jre3YavCx8szyZhU3BTy8dcFLz3e8RmmY?=
 =?us-ascii?Q?kP2i6U74SmMl6tcVONVg5XlqXEXnGACTVwo25aYdQw0MdctVRLYZ36m6V9kz?=
 =?us-ascii?Q?pEE8Age79fOLPNKA/iTKzL1tjYcbkBaNMMxCPHhArg10ntECJqjU5FJy4c9K?=
 =?us-ascii?Q?Wnit1m5N3pAVGvNTSe19xYNdwkQOuAec0LVyuBXkMicomwyc4VymeKutaDs7?=
 =?us-ascii?Q?hbzRZQSnc9O0+XHZzn6vmhnoKY3rzhjkRibIF+3xOzqw5ylmG+0m6zwWi7Ez?=
 =?us-ascii?Q?+0STfoi+5U2O7brqk0pYgiWuI9+OcgoNBbtZ3+sMB2xxc25hg6FFY2DMLjCX?=
 =?us-ascii?Q?BVpIXvVVf/iwfpkReoIzBHTJlB1ox+kfD1eGkITX7h9Okb2QhjAYKN7jJ1C0?=
 =?us-ascii?Q?JQZejmxaRb0WFATnK3E8xQeKeamunwz5Wz8eXIbzvP9+GrKIJ/HdA1cWxQ3K?=
 =?us-ascii?Q?6E1bDA0lY6Y2qKuUGrwuCU+WXOwWpUy2QBcSOjExA5Z1NX8m+AaT2UxFOmph?=
 =?us-ascii?Q?VVLWLrUPw1g9wYdXGQ0u1z83EPXw42bFshjEvBC9z/cMiSmG+5pO61Pa6/8U?=
 =?us-ascii?Q?BZB3qrq2QMxHxLqNdPqO4BVlZq1Mz0lZzojF2gdf2dfM7w6uijQuMCfdGHqh?=
 =?us-ascii?Q?h1hF24k57fLhlr2N5KDbPJKtnTgU+BGqSDInPb65+/6JppiAHpceeHsiQyGE?=
 =?us-ascii?Q?fXUu8P/dTeuX8UEIYfL80dEwEjYLY/1IuSEh4LbBeUZUvKhM9MjNIDsSoeE7?=
 =?us-ascii?Q?1nObiB5lYMi7CBmDxS4hoMlihhEfQoqSSYmpsQ8FdHy5bTnf47XG4tUM/peZ?=
 =?us-ascii?Q?uRPTx8Yh56rKrudreKN7o7eEavWrv44V/9h+5yEJQYHsW3RyBtGU/FCrh18h?=
 =?us-ascii?Q?m5jBo6bPNYw2X39ABIBnab1CuI+AhHg7aOR5R/x/wHvydj1ELm4TUOS/Jifb?=
 =?us-ascii?Q?1OJKxd/SzcQUnzr+w9P7Xe7FtrJWAw51lLFKcaHDcO72T5mvIG8vXWIy/th8?=
 =?us-ascii?Q?qW2oPYL8tVQ6f+Oa+o9dtiryd5AirUEAeKKN8OkiR22leUsg2PfQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d221551-9473-4dee-6673-08de640f6f74
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:04:19.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U40FliDTnC+nXOe7rsg88XX9Ql+8fhAuAzC/6lLqYjnMKKLSwKwlv2uMNmGw+9Dwqh3avYxUbGoyczvY7xuxfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9520

On Wed, Feb 04, 2026 at 06:05:21PM +0900, jongan.kim@lge.com wrote:
> On Tue, Feb 03, 2026 at 03:38:59PM -0500, Yury Norov wrote:
> > On Tue, Feb 03, 2026 at 03:59:26PM +0900, jongan.kim@lge.com wrote:
> > > From: JongAn Kim <jongan.kim@lge.com>
> > >
> > > Currently, when a freeze is attempted from a non-init PID namespace,
> > > there is a possibility that the wrong process in the init namespace
> > > may be frozen due to PID collision across namespaces.
> > >
> > > For example, if a container with PID namespace has a process with
> > > PID 100 (which maps to PID 5000 in init namespace), attempting to
> > > freeze PID 100 from the container could incorrectly match a different
> > > process with PID 100 in the init namespace.
> > >
> > > This patch fixes the issue by:
> > > 1. Converting the caller's PID from their namespace to init namespace
> > > 2. Matching against binder_proc->pid (which stores init namespace TGID)
> > > 3. Returning -EINVAL for invalid PIDs and -ESRCH for not-found processes
> > >
> > > This change ensures correct PID handling when binder freeze occurs in
> > > non-init PID namespace.
> > >
> > > Signed-off-by: JongAn Kim <jongan.kim@lge.com>
> > > ---
> > > v2 -> v3 : change to use task->tgid instead of task_tgid_nr_ns()
> > >
> > >  drivers/android/binder.c | 53 +++++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 50 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > index 535fc881c8da..4c4366089ecb 100644
> > > --- a/drivers/android/binder.c
> > > +++ b/drivers/android/binder.c
> > > @@ -5609,6 +5609,41 @@ static bool binder_txns_pending_ilocked(struct binder_proc *proc)
> > >        return false;
> > >  }
> > > 
> > > +/**
> > > + * binder_convert_to_init_ns_tgid() - Convert pid to global pid(init namespace)
> > 
> > For global PIDs we've got task_pid_nr(), see include/linux/pid.h:
> > 
> >  /*
> >   * the helpers to get the task's different pids as they are seen
> >   * from various namespaces
> >   *
> >   * task_xid_nr()     : global id, i.e. the id seen from the init namespace;
> >   * task_xid_vnr()    : virtual id, i.e. the id seen from the pid namespace of
> >   *                     current.
> >   * task_xid_nr_ns()  : id seen from the ns specified;
> >   *
> >   * see also pid_nr() etc in include/linux/pid.h
> >   */
> > 
> > I think task_tgid_nr(current) would work for you. Or I misunderstand
> > something?
> > 
> > If your "binder_convert" returns something not covered by one from
> > the above, please put your function in include/linux/pid.h and give
> > it a proper name.
> 
> Thank you for the suggestion. However, task_tgid_nr(current) returns the TGID 
> of the *current* process, not the target process we want to freeze.
>
> What we need is to convert a TGID from the caller's PID namespace to the 
> corresponding TGID in the init namespace for a *different* process (the one 
> being frozen). The flow is:
> 
> 1. User space passes a TGID in their own namespace
> 2. We find the task_struct for that TGID via find_vpid()
> 3. We return task->tgid, which is always in init namespace
> 
> This differs from the existing task_xid_nr() family because we're converting
> a PID from one namespace (caller's) to init namespace for a different task.

OK, I think I see now. Thanks for the explanation. Maybe add it in commit
message?

> > > + * @pid:    pid from user space
> > > + *
> > > + * Converts a process ID (TGID) from the caller's PID namespace to the
> > > + * corresponding TGID in the init namespace.
> > 
> > Process ID (PID) is not the same as TGID, but you use the names
> > interchangeably. This is very confusing. Can you reword?
> 
> Binder driver handles TGID for bind freeze operation.
> To avoid confusion, I will unify the variable names and terminology to use
> "TGID" consistently.
> 
> > > + * Return: On success, returns TGID in init namespace (positive value).
> > > + *         On error, returns -EINVAL if pid <= 0, or -ESRCH if process
> > > + *         not found or not visible in init namespace.
> > > + */
> > > +static int binder_convert_to_init_ns_tgid(u32 pid)
> > 
> > This should use pid_t.
> 
> Ok. I will change to use pid_t for next patch.
>  
> > > +{
> > > +     struct task_struct *task;
> > > +     int init_ns_pid = 0;
> > > +
> > > +     /* already in init namespace */
> > > +     if (task_is_in_init_pid_ns(current))
> > > +             return pid;
> > > +
> > > +     if (pid == 0)
> > > +             return -EINVAL;
> > 
> > Can you comment what is wrong with pid == 0?
> 
> Since find_vpid() always returns NULL when the input value is 0, it returns
> an EINVAL error before calling rcu_read_lock().

OK, so it's a performance trick. Can you discuss performance impact
then? I just wonder how often this function is called with the pid
of idle task?  If no performance impact, maybe it's worth to keep
code simpler?

This also adds inconsistency: if you're running on behalf of root ns,
you return 0 if pid == 0, otherwise you return an error. That's weird
because idle is 0 for any namespace. If it's intended, can you explicitly
mention it?

If you still want to bail out early for pid == 0, maybe:
 
             if (pid == 0 || task_is_in_init_pid_ns(current))
                     return pid;

> > > +     rcu_read_lock();
> > > +     task = pid_task(find_vpid(pid), PIDTYPE_PID);
> > > +     if (task)
> > > +             init_ns_pid = task->tgid;
> > 
> > So I've been replying with the same suggestion to v2, but you did it
> > in this v3 yourself.
> > 
> > > +     rcu_read_unlock();
> > > +
> > > +     if (!init_ns_pid)
> > > +             return -ESRCH;
> > 
> > You can assign init_ns_pid to -ESRCH at declaration and drop this chunk.
> >
> > > +
> > > +     return init_ns_pid;
> > > +}
> > 
> > Thanks,
> > Yury
> 
> Thanks for suggestion. I will apply it (init_ns_pid = -ESRCH) in the next
> patch. 
> 
> Thanks,
> JongAn Kim.
