Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08D31CF8B;
	Wed, 11 Mar 2026 00:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188016; cv=fail; b=Jg9Va4U8s0hzmQfPMq+wCS2dfEaoOB3kzmDUINrdd3/pyuUyUNkBGwgmd0mRKBIes7llH1/7DRCKQ5JZVsw/iH76u6lU+YJLnoMU9i5iUI6mlbVVTrTSYpP2EAuu5AVm6YKt3QIQo3RW3OU3BllmpDG0uvvNQG3XA3bGoOoY6hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188016; c=relaxed/simple;
	bh=t2xtMCQLvU2Y6G6eEtKae9kVYwBkUJ+atiOGiIs+vrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uaYboG6a488fP7kiJUyjkRYXuPtlcio+CtBYMfYWj24F/vfn6bKBHPjrz84pniiWHGuMIlZGzItt8Tp7xf1Dd7XfeZHqasR9c/Xz0n33V6juipFOgFvWaOn3C0IutGji4zity5DoOXFEGa5cwAwnYlG8TEJa1pjGzyHRJA+47+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AgbzYm0m; arc=fail smtp.client-ip=52.101.57.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AgbzYm0m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmKztNwTwQYLWrdZoyX2SkAE2K4F40JaG/xI+J3JrMyK8B1QjZAc7ryFl3FAl7huonWO1MPvWk2j/T7kDtv7fYZMdVpoCz8/b1zuwhyZUztH43vLe2iL7cG0OhgdKdiWm6xv/EKN8OdJQ5OUQNyfK/UvhH3gGQ/dL+4RSlpO5nNTfJ+uHqkPNy6z4VlxtB82L7E0vIbDlKzaGpXjs7sO2uklySlo7IeKDvn19F8FRqSHF5YJvm3ahiy/oi4C7tMNUbw1q7gxbxO8IrCVAFBNEjFrwIACLAkFXPsFGFohIInC1PXHI+HT9+kKURLYDpcGYuqkOEQ/k14AA16zdXPV5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npnU72L2EO1oXXydmZEUaeN5klaeW3djPz/AvZgYWy4=;
 b=VqTJDsUb6nhZzR/NoS7ihEtNUd320i/uRkJO+z7XStqrugJyYoGp0Bu9aYP+wjzBEYRIWWNp/1cxgmoG+GmKYEb0ghVpN2hdc8m8v5JlV0GIHovJ002SSm+4DIJJ5QHVldoJ7MxosiGnzuTBfwtqtmS/NTO41rRZD22p9rRWFkPUJcODgjUBYUFq3SPYWJkFDTBRRmhzUZNSsPNP1yhaMpYvaQ2gfLP6kt3qHolmKzWPFtt4oSuFQPjuW6QozwshF0FgtVa/IptxaGM7/AmmWnjTU3Mqb8iivEO0cs7rWJ83gKCjUFJGX5VclgznlDdwfl3Rhau5Kk8YYLPDAbza3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npnU72L2EO1oXXydmZEUaeN5klaeW3djPz/AvZgYWy4=;
 b=AgbzYm0mJ4Facauw1+2HI/VlHCdY98g5ZgP1pTLcog+LGiH2+YVrezuJvtTrhW7OJqXSpkWbTkRVnQw7D39JjRyEIlsWtb1kWzyysKtWym2ot/th3nrm1EY6Ydvzf17wfdARpjyrhtWfzXJhaFxCrKemy2oBDA4g0XF2HTxmRsLOhljfMc7lWslPdeplxpjwqLtJWFGqv1oKWwrhwmxExb321XXd6FF3RSRQaUaUDxiwOm/Ffx1RGl8vxfLk2tGg9BO5pcVHzyNqXUITbZUBYgj0YPrhxTD+YH8LCJ05wX/0ulVoBPlJxAqQV0qDIII8Q5QwacEDhUZCjwwfc3oU6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 00:13:31 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 00:13:31 +0000
Date: Tue, 10 Mar 2026 20:13:27 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 01/10] rust: enable the `generic_arg_infer` feature
Message-ID: <abCzp-nH_60rtpb5@yury>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
 <20260310-register-v8-1-424f80dd43bc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-register-v8-1-424f80dd43bc@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:408:f5::31) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 368b7a7f-ef36-400b-7aa9-08de7f0306d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+LpWzOzaHooJTtdoed3WS0J9O9lhOXmZXgG4V6wakEefcMQ0KwDIckceUA2Z7v4a+8rCD/b9nR9Y1gnHA8hyXcGUEIEefam2YlbSsA8MGyzr0sIrKhTpG0V+MMTR/n8j5y6POD5OaW9MuWQoECtXD+/aBf26kUKeuMjSmSiGT4T+ONUPKxh4gthee0n3fjDitE0yxxUDjpWRW2FlBwNmTr+KZLP85aBch+5DhkZPTkkq4tkZ34nQUEsdAsEbG1ddN62TwYqebsSh06dcSIVopR8yYZvm1n3R5MMd4+q+QqSksTTiHfI0OMX0K276WdXiYNH0fXnH3z44QCul5WNpeR8DA0ARpWHojWJgLrl6Dhai/0mMKbHLc/drcx6QH8q5f0Q3okNk8OGBniC+SFBRV9m9Ylz3s/NewNkK9BqEafi2IKljzBloXGLWhXDUfKls+5r2ush96WHmBPMFJTS5ls7nS84O5GR1Sxnw44SIy/UAhvVZRPuC2Ltc54sAp1orJcSmvTHOiNBXhA5XWCk0hD1jk+sAVfMNawTXcrEJ3gx/Ay897Vw11ZxuGv+LPLdwrrPqgl6USw8wqfi/hJIB0pb5vHNFjI50mNqywfeLbCMUZ7qT+mHY3Ha09WYkphfFWZyJGWf5hWG7+lAtyfS8PjgTBYyahtJRBtaSlkvX1rHN6hy4k81bBnLd04f4NhoNk280GaucNdol8YyjmGpiNiNXv4cRF3rE9IyGFnjRxuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bS4pvTFp0j8DjuiYSXLwpE60xxVEWFWl9gvSVDN2vze7BuzaugWdxwzrRP3r?=
 =?us-ascii?Q?REitWLGZ3J4GCwBM53HM5fG5dKsrMwd5VxwA486c9d85ZxWoutOZ/6frqnoW?=
 =?us-ascii?Q?hNNHkxAo9dzjGlfAWZrDO5Y6iXlssf+Gf9ETzTPuqt6u8I2sgl8/KEOim5cK?=
 =?us-ascii?Q?PDG7x14RdqgY6/LkKVr48vduRMmW12XQoeEKdEKmyv4NUHdpObTOfxs+bnNS?=
 =?us-ascii?Q?oMtibBncYEVpRvVVAz+VxRH1U5vDuTeTF3hWpDVTiasrIgl4Qoivzmc0Uk7n?=
 =?us-ascii?Q?nyBMJmlbY9FAP/itdf3W8p/6ZjiSOADbIanrKDFn8pEtc73QreETSR3va9lF?=
 =?us-ascii?Q?0WUlVuWTu5hJVdOLdPEEVtrSkg75yvFv78Qqy2v+x9HfNj2i20mLNXral44a?=
 =?us-ascii?Q?+3Dr9aYbHtTl6ik7c0rj/iQNgoyS2DUw1dEuG25Yes7W6UTnxm72bKGQ8xzg?=
 =?us-ascii?Q?gt2DG+x0hdVkeOJkzzXHc5UedtzkZOENpuzdO0ZXo1Wwps6GW5uu1wgrS8o3?=
 =?us-ascii?Q?wwifT58Wfwdbxb8cgWL4dtuEG/0zd+Qil4K6HfRvkX0OfoApBsqXebEjxjAW?=
 =?us-ascii?Q?QvIwKHwzOpjJXacFgKvX4cxl9vAWlKkX8DES8GERSDFF8pWvao8lOeoXzSb2?=
 =?us-ascii?Q?DzZo+4b+0Mwx0wTDhGEkHlDFrxpRWtoDn0NLs9cXBT+BQtLLsT70WS4WMHpo?=
 =?us-ascii?Q?1Ig+Ofez9daSGg4Yj+kBl4p9c45IlHaYkf/jAoxuw7B5VqURQazRo3ga3DvM?=
 =?us-ascii?Q?Bhw4NyY4Asp38rbIQFmDH6OjJI1L8W1hj5Ej8XgRXAV/kS7sKvZSuOrzX5HN?=
 =?us-ascii?Q?IVqH37FpkkfzllM/THEGD+d3AxmbMhEYN8YDyG2NHkqVDoNV8VoJ+LA7b2lt?=
 =?us-ascii?Q?mtweCzUdJ1Vx/XfWArmF+aVk6yi79APBP+vx8k9lDI/XT/Li77ICdIP97zLh?=
 =?us-ascii?Q?92sBt9mf/V/XVOPRH3ggEGGOs5PBhsdkZBLpXX2ZumySOg/ME98WscBdw+s2?=
 =?us-ascii?Q?zlC6ob6gVKZEqci2qRBRDGodfOpBshDasgufbHe8iXNq8xB0/rDRii4ilrt/?=
 =?us-ascii?Q?ZCaNkYSewL5JzDl2zCyYVVEP7+clF3EXLDatZ70oFZKcB07SMAHcoeYaXdaD?=
 =?us-ascii?Q?EbkjEX154Awyvg4P/DqPFui2Ha5XNleEsbJPwF59NMBNhxDsDb3nHYOLr6sF?=
 =?us-ascii?Q?XkjEWu4vpzoNgMYqFHX6WkM/Dj5SiOUdce7Csbr9Cvk/rD6y9+w05+/DfK5R?=
 =?us-ascii?Q?DZQzE/JylPmIPcfHlfOwrhWtzpbKYgnwwbfXl9jZxKHyq6ERI8sQUhn95nF2?=
 =?us-ascii?Q?GSs+RCgOcfrbW9KEVuj4CbX8lhBXTGv1ZM0IAdbJQR9ZZwJpzBjI11LWbeEi?=
 =?us-ascii?Q?uebuf9LY0geOOiRVCmqokGPldd7R/0aYhZeVFyMTfw32hX/o2LfrDR4PMXL7?=
 =?us-ascii?Q?sXEhy6JEStohIobDywaakvsi/IOuoMWzVcFInk5/hKNL5fkuGo4HEqpqRlQW?=
 =?us-ascii?Q?3kDTEuaSvhwE7D9iZjzQWBNyunB1y1oFeULK/qeYsGiQ2J08ONmmlIXP9oVB?=
 =?us-ascii?Q?Qu3LLHxgB+lsSFpp9t4eFAuHkwKrt7tnUeJT+f9ibJG7KvOLfkfkn+b1FwG1?=
 =?us-ascii?Q?2Sev6WdG77ndTq4xKXblnhOZCGB0s6G2re9/5ouNiwOF26Yhv/YlGE1Drlxm?=
 =?us-ascii?Q?5+WNDiutuEeAB45vkuirdM4sTmNw+Vb3vYoT/N7AESqjDRAcZMZiZWca+HGp?=
 =?us-ascii?Q?wrUBEiHh197YEGfFm0EbmnCLrijlYt+EimAhmvxCapzkCugqkMPi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 368b7a7f-ef36-400b-7aa9-08de7f0306d8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 00:13:31.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZE4zL0olmHdmkSK2AAlXDqfEdd8JjsXX19VyTbXSY1ORg+z3g7w266H1EVO/+F0iBnOKt3ofRRqZGJXjLMDuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749

On Tue, Mar 10, 2026 at 12:13:58AM +0900, Alexandre Courbot wrote:
> This feature is stable since 1.89, and used in subsequent patches.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs     | 3 +++
>  scripts/Makefile.build | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3da92f18f4ee..cddeae8b6cb2 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -37,6 +37,9 @@
>  #![feature(const_ptr_write)]
>  #![feature(const_refs_to_cell)]
>  //
> +// Stable since Rust 1.89.0.
> +#![feature(generic_arg_infer)]
> +//
>  // Expected to become stable.
>  #![feature(arbitrary_self_types)]
>  //
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 32e209bc7985..923886735299 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -314,12 +314,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
>  #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
> +#   - Stable since Rust 1.89.0: `feature(generic_arg_infer)`.
>  #   - Expected to become stable: `feature(arbitrary_self_types)`.
>  #   - To be determined: `feature(used_with_arg)`.
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
>  # the unstable features in use.
> -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,generic_arg_infer,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg

Maybe split the line? It's already over 100 chars, and it doesn't seem
to get shorter.

>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
> 
> -- 
> 2.53.0
