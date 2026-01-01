Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021097.outbound.protection.outlook.com [52.101.95.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E61EA65;
	Thu,  1 Jan 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767305353; cv=fail; b=TPkCWaHljlaJar1R7hkZ2t3BR920CoshK9ocQx6Clw96iVumhfCe/cUkkkAiqKAAIQce1vDvxMPQoImthn1bDX3Bds/RFi+FfnBSqPv/FlmSmEfdPWnbsxsk6znlmXLRPm/KSgps8+yfSbX8nJ6sZBnXjLYdGAbenwid7RpS3B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767305353; c=relaxed/simple;
	bh=znEzDjD+0+1gPidqUetFLILZ7Wl7JncQWnujIGybKes=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KsWnFfdrh8nBthdYQOGa6WssanZ5B/oR9sgwYfWxnwzT9YtmDAEgBbKMVNR9JKRwNSH6Jf8EAQ88a7IttovR0rjC7UCbm0mKYr3tv4UGarcyhYns/llaUoEmICGlrtVM3nqSvXC+5hr/wGOBIqfjZfQfjMCagRq3sF3bPEGPqn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=hJgzNreZ; arc=fail smtp.client-ip=52.101.95.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="hJgzNreZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyaYWaWeC2n329ui+VDeEUfvZbR8tV2axGxPsgg6DMBAs5iKSpteP+jaSQAJ4NVFy7c7SPtJZegCB+rAhtJ1ksh2J4r2dUlpcM2FdcZHWRmPpsb6ycjXjoP1FzHr2o3lbp2XHZDdzk4V8CmwCjS8s+qqMNCkc3Lyj0juGaz7P2fibM4uLW8cMcaB3sCU4nbZjhfQedpswLcxH9ZGcCqjYy/+4/h7Ad78UjBlzVE9lzgs36/GiB7U3unFfZYXyLSGmJ4xEospCLrE9NF+w3DYXV8Y9ju1zjfhoaILa9Ye+dmkBBL9/FSWKs2d/CP873uMOL5LPVGfN6BZBbGcVfK2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+3fpFQgHW6QC+ktzDXH+QPGlmCASZF3HHpq9irRTgE=;
 b=yO+oJHIDthsf1W9THyQDKZkfU4w8j9tOtcOvgiOT5afJ0QxYpy2sbQeUgfjI6CGBTxfhraPI831AnJJ0BVtOF7jLdGgX17LcIWKKI/9giyoGEM0VZpQJWGprmzvr2nzQPnTt9YTkDxq/zp5idTQioCAO88zd3Rp5UUzFFGBWZkCRHn2iqlyki8r1L7QGEDJAE9CDYnI566hk8lxEhVfpaigjncADsYz/Qcw+lcDvicr/4n2FvMtWXr+1UUQLiMsuKuMhxx+eZE7osPchXTF+PeaQDXUHjVk2zsYMp03ikDvA/WmV2rEbLqtLM53rPcD5V349xBX6YiiFjQKxuUgj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+3fpFQgHW6QC+ktzDXH+QPGlmCASZF3HHpq9irRTgE=;
 b=hJgzNreZ/luITnTZDx/3OhsTH5CGKQpfGmaMBmbenICFztW5HxUmiALc3cnpOB31xYvWl/4RjbWznecXvY1NW3n8U3K4rdOHRZxCyrruqVLDOV0HwpLU6cTTqWQy3UY6vK+FzGdM5j6vtGgGds6oCjdRliY5+Q6HAMadpA4nbB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7402.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 22:09:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 22:09:05 +0000
Date: Thu, 1 Jan 2026 22:09:03 +0000
From: Gary Guo <gary@garyguo.net>
To: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Cc: y.j3ms.n@gmail.com, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: generate_rust_analyzer: reduce the output file
 size
Message-ID: <20260101220903.0c099099.gary@garyguo.net>
In-Reply-To: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
References: <20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7402:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a769a0-43eb-4fc9-687c-08de498260e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yEEjvp1l+txQ4N0iGJeMzDYJjwThR0DYr0tjrKHfgdpzKGhKjTalL/gNTEen?=
 =?us-ascii?Q?5ohU3wcMZ+v2/Ie2eSAZ9tc6/IJ15o5SR1wWspi1CUyOp5b/pSeSHOUuOVCP?=
 =?us-ascii?Q?GXAY3jxsIZY6MDG6CI1ztPIrGPSN5unNdz5sswXfunwuHrA2nO/HVI5MSC05?=
 =?us-ascii?Q?2WQpsKJy3yGyS2hI9OMfsn09+u4JzDa1QBdGkwrB9I7GsbXo1eekQZfObGFI?=
 =?us-ascii?Q?wLjrspizCMtp9HkxoFD6NJYw3vzDkLlckS39jV7aWBDdFCd13Vzz2yY/XyaT?=
 =?us-ascii?Q?jXmFkZanJbWig8YhJTrYoozE6tN+nmmDUq4LhfNBVjTobJzAF1NaSqhlAvTX?=
 =?us-ascii?Q?WEa/YFFlyId/HJ0mIPDCiDFEP2AbsFq0wNRkHIeGnaaQAQ7cv+YXcTBAnSim?=
 =?us-ascii?Q?ubT2siUmAeKoOjNzOZ/96SzZkBaHD8rCBoS1dAKTRJUP7yJo5jEMbGrcYEgp?=
 =?us-ascii?Q?OWctORnNrQ5NZfsqT38kjRdRhBbC7Ahhz5t0Jw+ZLfpiV8M6OvPR+OyE+XvX?=
 =?us-ascii?Q?PxhgfVuKnGcc4lrCJKYTAi4mUYfpF2NFAidMhEk9HiOO24lr8VvQmRNna+pL?=
 =?us-ascii?Q?xtkCK5RV9+P2pYCD0Z5O7bx6/RPv1oZjpqyzBk0JLPfQZjSLZa+9w+AE6XLY?=
 =?us-ascii?Q?dsxSbxddDDCdaEhKb7bCw71luWDHsOo15S4DFcdLn4KT5n37KS8d3C27mGOk?=
 =?us-ascii?Q?rXNQ6AA5Gxq+zhmOu7JKw/KV62ENLf5UfxNGGAm3OPL8bHe+MXAOHRCIPQ/k?=
 =?us-ascii?Q?NGlERb38OaFQ1VwOhrSieYyWewYE5mYRh4TZUpUET1e474WjkEbpSHL+2X8w?=
 =?us-ascii?Q?GOjvGLDK3DGojxmPBx0ueHTJvTlpbJSs7b0nOet5cHLYkNV8p7ajIxWh3CHF?=
 =?us-ascii?Q?6p8+hROXjbPGpbirrVAhWjrUQxfIvEwmdySARr/cG0HYaj+2BoCJTdrtE+PV?=
 =?us-ascii?Q?B4dh2WFGk8Oalm1bMq1XhxIHx2KDPTt3d4klSuHfzXUHC4yvjgVb15AKZFKd?=
 =?us-ascii?Q?xWmOgCcN1mKnrTl1FpKcCOQI6ThAeNAr7s9w0tu0cvqeY1OLxriYavLvKIBR?=
 =?us-ascii?Q?G8TvDR/k+5mMd4hPqlEWIppdTx3nFHpTM9YVyYHyCKl0V3rKK7mHj/YBbZT7?=
 =?us-ascii?Q?52CqCqshPTLWMIs1nNYCin/YI5HvZ9t8mT6OFwXBk9ZfadProyI0GffngjS6?=
 =?us-ascii?Q?HmsDofW1jG66ZOttQvs0Gtct/vv6uJdZ8bvukUCCcYrQcBjKDBUjwfwHqeJD?=
 =?us-ascii?Q?EQr9h/2LL0Xwx3FYTBOEYFh3uyMYUx9C29d1reuwDpo/Q7dFTci2sBdOUpQu?=
 =?us-ascii?Q?3KnseL8RAL2ehlgu802p/vB5DHoHedY5iboj6xAD5rmPybC2QW7DvBnisvfJ?=
 =?us-ascii?Q?8mahsYLUCxGvo4drOG1TIzlXthfwJMj2r2/H6HgEg62mgwpFBjzvZZ9Su9Et?=
 =?us-ascii?Q?YbCSU7GphHdPEMJNDo9t+8fmmI2cp2u2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b8byIFG3zU4Xznf7kFvufc4U10vjoCJlIRc0ZlvCKuyq3CLguU9a5PKNGjHu?=
 =?us-ascii?Q?k0idMJW/xRSSccMvBxs2umxAPJDs8reuPTK2A7s0qHc8H2q1N+SZDn72e2zt?=
 =?us-ascii?Q?SRTcIPSd3sN3IBvPuWIWD6n7Jq2JHQcyAhn5t8ULpbnrx9Jk/pRpmL+AqNyK?=
 =?us-ascii?Q?8aH5hj+xDZz77aaLwpYlIB0KQ/OhqN/lStxQ4V70vT5pq++ygIVifmtXqUTc?=
 =?us-ascii?Q?9feWj6BB4SsNMMsMGHLrPHbMc/iELXZEk1ZGjowTBQPT53jaZNQ6v4sBjOmd?=
 =?us-ascii?Q?OcVAenU9aiDyofHSP+xvdxNiO/fiE+DKuB7zdKZjzKCK+P8RQlwpX224VUXc?=
 =?us-ascii?Q?TBxOv2brWYl/RrcV+CSh0uW3a6OmoGTyZ628csiNg17En18pT8jPiEf7M5gK?=
 =?us-ascii?Q?QMnTI3FO2WTBAO4eXnFhwpKLICqNNdx09H2KYp+lcaG7HgL58LqQMtpngFXz?=
 =?us-ascii?Q?fHpc2qilxwWW8HJ9QlavCiXi1Y84UkdPWyEJHlJaaA2HWYhKC6zrianDqYHN?=
 =?us-ascii?Q?p4yaxwGkfbtlOBR3dXEHS25gxCzRrNGYT7Vf1B+p1M8xG6w8HTiecy+hFe+Q?=
 =?us-ascii?Q?P6pUqZhbMGRIXgqMf14tI4nUL3/9xmBqFp89qtZCwsUWSZ+wFcv2IwsfetjS?=
 =?us-ascii?Q?cqkIVIuxO3aD2KUAXk7yuOsvBoc7BjU7quXgWPbPHe0NBRj/OFJspUlLPjjz?=
 =?us-ascii?Q?AskfqHjvM3Zj6TkGDWgvmFHDqKO1kMmL5BZeZgXU+oLqjheSrqkzIf5F80mE?=
 =?us-ascii?Q?Xpde+CX5FuAqoAPV9VsvqAg9AgiQy0tJw3EB62lD3kV3LaZ6DRPyLLL0zOus?=
 =?us-ascii?Q?x+edOh92fSThLDA3Tw1EqB5tpybsLogA8SemK4Fa4pXyq/lfF6+7KM01serf?=
 =?us-ascii?Q?ZJDFb/Xm36JoOZ18IOBdiEnMsCPxntoeH96Xhuuu7+zeDzQrCh2WU8dmTHfw?=
 =?us-ascii?Q?10J2Ln+LRbXGbnc30ESJ9bja+KKp/ynB8XAdsnwU7txYlQBlMAADJ042Zdfr?=
 =?us-ascii?Q?C3nylf4gFlXOE5qBtRUTYqHTKieDXuJLeQg2dNElcOdAZg1Lkm6tf74wiA9D?=
 =?us-ascii?Q?iiVCv5pNnydBCEt1BjX8f9mfHw8t+v0296Hdq/bl3LaSU8oUVOL3imiIJDDO?=
 =?us-ascii?Q?Nkh7sFrMZ72qM0RqQSqtsszPgXiSRxSCmh0NWRFlu3+M2zOXzBQlX40c6hVr?=
 =?us-ascii?Q?tdgR6j5VrL9ov08HJJLUDbm96ZaJdusRBP7QjfBEwJovtICxSJOgQ+yW771D?=
 =?us-ascii?Q?ZkmJaqvJBb3h8hV1+3Rx6XpVfEuQvIAOrdAkVD1J05TlvorUSqTCQFO81BYH?=
 =?us-ascii?Q?0XNAvd+MkJxTfAb95VJmeronDbZedjhRVa2mJzGF+qeGe+WXJdNQVFNjOf7n?=
 =?us-ascii?Q?H8qOGoqJwmlm+l/x3sRR3ZymgNJA12KTKvpANhZ3zVXoxSPqFHTdWy5e/dBP?=
 =?us-ascii?Q?sXFG+g+Q+OJUwAkKLnKohlPhZLhlRr+B8ufCCx9Ix9HxgE43d3uBJRuRCrpb?=
 =?us-ascii?Q?ZCMKLgXc2ZDr2ht2abyS3UnmbeMUVvthkYF+psyEtLJpZqrWJvUWf6Yveurr?=
 =?us-ascii?Q?xvQTC3BJSdVefedVcqH6JfNBqqfHmyHWK5WYbHJAKO8dybGSpyCx9loVmWFK?=
 =?us-ascii?Q?T4aXMpGLTgguqaUV8+BSDsL6e+x3CcieqJ93le/Ty5VC7WRrOZkiCXa0T84m?=
 =?us-ascii?Q?NAo7Nlqokdy8Ji3BnWdk7Y0RtmUy5TlgrlBPLfAoZX2P8owL+3K2ko92CPiA?=
 =?us-ascii?Q?tE8+4J5GEA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a769a0-43eb-4fc9-687c-08de498260e1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 22:09:05.4050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lOog99cE67IbDVssfpafept46vzp0qJpsudatnANylKbt2FXmfDavSyYFT+leJgUljkKeOdGYL9Bkh5+QmpsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7402

On Thu, 01 Jan 2026 08:21:24 +0000
Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org> wrote:

> From: Jesung Yang <y.j3ms.n@gmail.com>
> 
> Use the `cfg_groups` field to aggregate common configurations into a
> single project-level definition. This avoids repeating identical `cfg`s
> across crates.
> 
> As a result, the size of the generated `rust-project.json` is reduced
> from 11MiB to 406KiB (about 96% reduction).

This feature is not available with Rust Analyzer 1.78.

Best,
Gary

> 
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
> This patch depends on [1] to ensure it merges cleanly without conflicts.
> 
> [1] https://lore.kernel.org/rust-for-linux/20260101-ra-fix-primitive-v1-1-def809357b4e@gmail.com/
> ---
>  scripts/generate_rust_analyzer.py | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index 6178a53516ec35f308897e65c5001edd81b0d3dd..2a8578fb784d08b2a5e628bfab935080759d2dce 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -19,15 +19,7 @@ def args_crates_cfgs(cfgs):
>  
>      return crates_cfgs
>  
> -def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
> -    # Generate the configuration list.
> -    cfg = []
> -    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> -        for line in fd:
> -            line = line.replace("--cfg=", "")
> -            line = line.replace("\n", "")
> -            cfg.append(line)
> -
> +def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, kernel_cfg_group):
>      # Now fill the crates list -- dependencies need to come first.
>      #
>      # Avoid O(n^2) iterations by keeping a map of indexes.
> @@ -35,7 +27,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>      crates_indexes = {}
>      crates_cfgs = args_crates_cfgs(cfgs)
>  
> -    def append_crate(display_name, root_module, deps, cfg=[], crate_attrs=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
> +    def append_crate(display_name, root_module, deps, cfg=[], cfg_groups=[], crate_attrs=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
>          crate = {
>              "display_name": display_name,
>              "root_module": str(root_module),
> @@ -48,6 +40,8 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>                  "RUST_MODFILE": "This is only for rust-analyzer"
>              }
>          }
> +        if len(cfg_groups) > 0:
> +            crate["cfg_groups"] = cfg_groups
>          if len(crate_attrs) > 0:
>              crate["crate_attrs"] = crate_attrs
>          if is_proc_macro:
> @@ -134,7 +128,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>              display_name,
>              srctree / "rust"/ display_name / "lib.rs",
>              deps,
> -            cfg=cfg,
> +            cfg_groups=[kernel_cfg_group],
>              crate_attrs=crate_attrs,
>          )
>          crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
> @@ -189,7 +183,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
>                  name,
>                  path,
>                  ["kernel"],
> -                cfg=cfg,
> +                cfg_groups=[kernel_cfg_group],
>                  crate_attrs=["no_std"],
>              )
>  
> @@ -214,10 +208,22 @@ def main():
>      # Making sure that the `sysroot` and `sysroot_src` belong to the same toolchain.
>      assert args.sysroot in args.sysroot_src.parents
>  
> +    # Generate the configuration list.
> +    cfg = []
> +    with open(args.objtree / "include" / "generated" / "rustc_cfg") as fd:
> +        for line in fd:
> +            line = line.replace("--cfg=", "")
> +            line = line.replace("\n", "")
> +            cfg.append(line)
> +    kernel_cfg_group = "kernel"
> +
>      rust_project = {
> -        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs),
> +        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, kernel_cfg_group),
>          "sysroot": str(args.sysroot),
> -        "sysroot_src": str(args.sysroot_src)
> +        "sysroot_src": str(args.sysroot_src),
> +        "cfg_groups": {
> +            kernel_cfg_group: cfg,
> +        },
>      }
>  
>      json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)
> 
> ---
> base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
> change-id: 20260101-rust-project-reduce-size-d829a7a708ae
> prerequisite-change-id: 20260101-ra-fix-primitive-78154fe8173f:v1
> prerequisite-patch-id: 0544fdf5522949047a81c3580960183375574fd3
> 
> Best regards,

