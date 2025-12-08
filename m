Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C112B94;
	Mon,  8 Dec 2025 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191395; cv=fail; b=owkJL7oTroW7QSPgSZ8Q/BPHuXhMs38GZq0jPWiuVfad4nRuqN2KHaiARBpcKCOEIcObPGPls5bx6z9Rp+6uv0GULa6KXEVtY11WMhZojTMBAKFQRYH/ayUCEV1W2d478oqGNEkofzhJ7Q93D2GCtVyYkhVRwQwOKL3d9pPBpeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191395; c=relaxed/simple;
	bh=NFOm0IBGOh+jqEnpRie2ZEIWIvtzmItFLhIzDVJwT0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=crEoqhNwi2zzirvIEUQfdshi+zMiK7RwMs4yv6J9+VaH+LOfi7wb50w4wh/V8qu0V8zG6CJ40RVV7Rw0cQ3esIekOEldcupKhItzt4ZKXnvmGUtdLvPa1ZqfMk7c29RbrnpAYwgSNi1aZnyO5czji6q0zU7RjMieEgWj0HmOIA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KWLlFqnP; arc=fail smtp.client-ip=52.101.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KWLlFqnP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0222w5ISb24EJX9SKMPlONF3vPz8lEdYOa1BUEfo9E7hBWkCfivc+qYU62LOVxpj4bHcEtB4rqN/yKEYfor6Oi9+112cTpGkvlLoARQgMtXxYXj2l7OwAEf2pgo2LncxF1yZkL8uvOu0jBuJZkRZpJtUw06KFVNoUg7YNfY6Ta3A6ebDY4YtLpzoWPAesulK4sMgnz32hi/rsnK5ncLGwUVL5PT64Kl/IWTjEHIlsdtuQxJ+98Adz6b9Rywr4v3WneucOFEaU1lKCgUY+Qx8ArPI4KTUsGVJUQU4g5S+FAgECSAWT0Fj46ykO4xdwl6vilNUL6TJ+l+3ZvyrIMMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtKwgujdXT6kE71r4Eg0YsH6dg6Tjvd60XfX3zsmb9Y=;
 b=p7YMx+ZSx6cSGeHAe27SAFljOPGyWDnJMPdpzoqWJfOvDn3djYAN1Culcy1owU5Bjp/inwKlyhxJh2fHcH1/olgRclzruscJEG6Q4JHVGpt94tnzVM47fJzDua6Mof4DdOoHSGYINlQA3omXKUqJj0RR+uMz8cTzkvwZvjMtohXo37L1RjwK0QfnnfRhs7I/XGCO6wcCjoTVU4N0NxGrL1t4MlGdkHoVgOOGe8XzJSqAddjDEA/sZKtNLeRHcfKUhWONKdFSPLS4+rwe7pbX2X8a7vLqcMhsRx6eyMxC31894nlYyDe4IWpKn858Y9uOK8mGl6VWZWccjBE7hmTXVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtKwgujdXT6kE71r4Eg0YsH6dg6Tjvd60XfX3zsmb9Y=;
 b=KWLlFqnPOvug3t7ldlCUFHbkxyk0y74bln/wCzfRO/knznZaBAi5o1I0nyITW15MLgLgIaf5EFVbbdB0AfxrpHuY+B20RD/hVqQk4G9fEqzQ4oK5JR6cZQTAO9Xsa5U7KHGSfGWS8aKSekHOxscwK97QhsUHq2prSgbh0BBWnWFrgstsQwixVl3fqk6H16wyE+s/afpXlc9GE5SXcLxUzbr3U1dFLjVFz3fIb46ondUximG7xE4pWXgQVcS+U0OkBMlAG2tliRJ3zbFSGiWir01CQ1oqBpnd/oJZHpmPU/SRb54OGA7XtByKdD5/tJqCdrBOySNdzXtLH6nNeZqIPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB7629.namprd12.prod.outlook.com (2603:10b6:8:13e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 10:56:24 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 10:56:22 +0000
Date: Mon, 8 Dec 2025 21:56:17 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpu: nova-core: gsp: use () as message type for
 GspInitDone message
Message-ID: <gqe7jfj3bwvar5kk6dqc2dsxwrrs7ug3tpyj6b3sktkzi7bjlg@a6aukp6v6com>
References: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
 <20251208-transmute_unit-v2-2-aa17a6848afb@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-transmute_unit-v2-2-aa17a6848afb@nvidia.com>
X-ClientProxiedBy: SY5P282CA0101.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:204::16) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8f8131-c61c-427f-37ba-08de36486c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nzrp4Kx0ZdBirvnzErh2HEi+HdnJ9NqBLzQHbEQ1Qg9V6X2B/eaxC5eyAEqV?=
 =?us-ascii?Q?nAe/TiPJsrvFYVDcXXVgaANeNAKM40xqVU8oYm9U0phbPA3NachTDpxgHpm1?=
 =?us-ascii?Q?OwkPamPBh2F77KxZThXnr5WOUnjqeyCd1iSadFxq1DwyYfPVzAAreZ9EDNKu?=
 =?us-ascii?Q?NssJ0juRMhVuwmUKZyFvwNUYgUKuaYKVeG40sZqNU8Yz+tbpP9uGf7jEmkMF?=
 =?us-ascii?Q?Rnu/4lPv/WcPx2BNCD8pPuzrS1Nl/v6/0fmrrte/zESh1U+eBR/5inPA3e7F?=
 =?us-ascii?Q?xpu0ZY5bNJg58nDgggCuTPnnptl24ta2CsY5e/bJYCHRvs2GG8Il6pJdPLKF?=
 =?us-ascii?Q?JAnWzkQEQ1Gr1KEZv0mLwwQlJZ666EgGADSTDZ/sq16fUrfQyOJKKsSo49h4?=
 =?us-ascii?Q?jKV0pj+m/U4r1RPfts5hfmRS3RJuO77VTP3gcGps+QTGx4T2Y9xvsj4cq0lz?=
 =?us-ascii?Q?3201vBNoH0RCsL4otu4UD9lQLx8ICo0KmGz6cfCoEOyaPbEjX7aMMUv0VrId?=
 =?us-ascii?Q?JSvc1hXdXW7Z+GsQ5UgZuV0UUfFwDzKp5U1skBCHslUgTP/ZfmYDXhQx/gAl?=
 =?us-ascii?Q?eI1KiLPo8BJdCLPbGnXvWMwgECrIl+4QZPAuxdiyWbVQ7VCIW8Y7almwroqs?=
 =?us-ascii?Q?5F25ipgSAJ8fkUZniqcHJAqCbKsKNjjl51NWFYe3JQNNKEoX3wr0QHaMmipH?=
 =?us-ascii?Q?Kmb/RS7kxJOuQ8j8dvrs8OWTQY666S72TtaaB+B1rKTFGtzRySo61yiBf/LV?=
 =?us-ascii?Q?Z88Rc0wokqz++ekB+v/tMv+okz0KYk/TTH5Ssk7FhDDsYrgsgFH5My7FfajU?=
 =?us-ascii?Q?Deo9NCU/hyOCOCpxeEWT4ooQNcwVb2UFmRderI1PXWfOMWuAlLL+p5gHuSPc?=
 =?us-ascii?Q?s8SNFv/sjBvfngAyyc1Zygm4x6c1YnIa8TNuT9xvgfjmvgWZ3xevyPhnnd+l?=
 =?us-ascii?Q?A3EEegTYEqBw4DidhfkiK/F6za6qqyyTUpKEKi79kRQMzGDH9zZ2AXkWebvQ?=
 =?us-ascii?Q?sua7ukJaUBKw2l/qmbo7njaK/8ix+GE2XxHuzlltMAsmM+3Symha3nL5d4Ck?=
 =?us-ascii?Q?aLw9fXWK+MVEr4LOojjC0M6NNIJSK8Ldu9vkzs3kyOXpvhTEqqCI3C58oHT4?=
 =?us-ascii?Q?DRrVTTwBBUnOiN6Zb02jDKjJZvWrxYoGGZr1ocVtEggvLeKJefx5coebO9Ky?=
 =?us-ascii?Q?xS5wps8zDcyWdd4aIeDKX7S3RS6/0dJHHwwry8P7guhz98EK/Q/cfL63U/dW?=
 =?us-ascii?Q?WsN1KnaCzB7QUl9eDlzxFXusy8m0KQNA3lgywj3PJIawZD0gQauZXO41mSY+?=
 =?us-ascii?Q?DV4JKTFL87L0CbuCJ/3r5gyPH2hucd0DVAuDesVhepeHWeL87zw1rO2QmsUr?=
 =?us-ascii?Q?3/tR1HdC6q0LuxqcQeqwp3d1B1OpGSwjBXXTZRJxvLQUoITug+nep/9VOmoq?=
 =?us-ascii?Q?AfT3O+2SiGSuCKbC9uqsbbNGTizP59JB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1eFg43FtmfeOypA4UvwzwVJyLeulxOiBZd5wtLYf4Rn47ce1SMcMi9aK2gOm?=
 =?us-ascii?Q?fm6K9xAoXDWNilW7KftnFenelnHQP6OSbvAjoWXwZgMc7A7x4K1oBzlMGxTm?=
 =?us-ascii?Q?UggVo09+MWAN9XbdsXkAG4sfgLxDwtAEydsbV1NaQCkKA04aN29taXa0pB4j?=
 =?us-ascii?Q?PO0w754n6ik6QtbASXjdsnMIVs4OpYVBsol3Vtl1qpPpsPemBgKl9C7Qp/xS?=
 =?us-ascii?Q?fh70sZp9UXTuaSefVp3Pbq6gnoC/iPhuT8qwgTcksCJxEWdrzgxyrFLD3uOc?=
 =?us-ascii?Q?HyGRuWx/hk9E7yzGTBx8yvaeZsDz5xzqG/nI5EbCRvKOmCvCdiRvad1fQbAq?=
 =?us-ascii?Q?6DD/X7v8Tn5ztGPAQau9NREJn+HcNMK66KTGYohUeWnOeuSkOmuecnoQJEeg?=
 =?us-ascii?Q?vScK2eos0yG2Bgd0mUkqwGV6a4dmrI1j0DOktO3dGjnPrJaU0YvpaXFCITmB?=
 =?us-ascii?Q?YkbbhmA4iuVHnCkNxDEttvHYBTksQvBWgXZfOrlBehdd+Zx1mpdNSkvDukCd?=
 =?us-ascii?Q?qtgAye0YQuY+WoP4E5Pe67a5tkyNXNGLlOQsoLCZIpPojQIxGVCxWV/t3/og?=
 =?us-ascii?Q?Iji0WHt3wzAq2GNM2LB/wRex0I5mg9ibicUKk/VebPBYYHVfGEj4sDcCxflB?=
 =?us-ascii?Q?18T0hm4VjXIasrYFEjmcmN/ZTEhdQCklmo2AFCwszKdRdEJ52nB7RQSO9sLw?=
 =?us-ascii?Q?lW1uy6qsLeIk3tLfGKnGiRHWQ8GFE5uh0QuSmUiDvK8p0N9Iez2Jpmmu77kv?=
 =?us-ascii?Q?Ae4+bqR6b/nwE8jk2PyhDu9rQgpdAAV3eaa/UYL2eMgOr1mazQjhC29v/yhJ?=
 =?us-ascii?Q?R6N2zBM3fwdi++7mPqNxUB81HBVlqg0LHW9LFYziNPKXVB86IKLN/xTFnLRA?=
 =?us-ascii?Q?fbpW354+4vI2qI86sOEvW3arTGQjONGe41VNHI2+F3b1Y1UjBoBb+TpDuJIQ?=
 =?us-ascii?Q?lzC5Eei/8Fo3fO+TgjcSL2J72bpixg56PqP2vqDWtpiKsvGsY/bdgXLbPGLc?=
 =?us-ascii?Q?559bVQ4Vc85VfSq8wO+jKWvdKyk14Hlc4qotqfltg17HsnkkIuqJwbqAyepv?=
 =?us-ascii?Q?K4Cqa8B0ktARQWlWpKNVI4lbfk7Ro1v6g3LX+ReMsO4WbllRimUvp8NcN9Xe?=
 =?us-ascii?Q?T8Uft/aDgVRLYLugKYp8TKdwxReiVeeAYw3h94eK3n/87+tWCcpqvhHG3mLS?=
 =?us-ascii?Q?XiEunzyygBJvJJvShuIkDD4j+pLqVTzhsgbrbDAkGWi7+ix2PrueZxuxSnE6?=
 =?us-ascii?Q?X1UgKlxu2BAYMi74hdV4zui60dNcwQowzTE09jMiYcfaspHsfkgNCdFjkUop?=
 =?us-ascii?Q?Hra/Ph4H73lFXEBOFXABMn/5FBx6svHeea7i+dOXM7uPZ5Cdp62YEQVRcubt?=
 =?us-ascii?Q?L7Rsfm2sFcXTKwzpGjOanMXRMptUCPcR0yxgHhFSBa6Cy2UgGcBC+06NFJBR?=
 =?us-ascii?Q?lGguuaXA7UtHInxGIH8UqFhSrEiIimPJ8vdXJGyPFceVwJqZ14CDCWF5vogJ?=
 =?us-ascii?Q?UtSDRYABKYWE0gkKvKRqr2llktQ1pibhSPAl7LhPqmpw/AD68wf1eltbeUjj?=
 =?us-ascii?Q?zxN1ZsfD4VWujrPZInfODdNZr8sVAkCWwOn6lyq4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8f8131-c61c-427f-37ba-08de36486c87
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 10:56:22.0889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeUGgX/L4QPNeDHlMWdnEQXrfr1qMAdNhCJOKfPSjg/8EUYDZ38kW0hT08E/BLS/xJrpQkYUojqNh9Iam5Zr6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7629

On 2025-12-08 at 20:54 +1100, Alexandre Courbot <acourbot@nvidia.com> wrote...
> `GspInitDone` has no payload whatsoever, so the unit type `()` is the
> correct way to represent its message content. We can use it now that
> `()` implements `FromBytes`.

Much nicer, thanks.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/commands.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
> index 0425c65b5d6f..2050771f9b53 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -142,7 +142,7 @@ fn init_variable_payload(
>  }
>  
>  /// Message type for GSP initialization done notification.
> -struct GspInitDone {}
> +struct GspInitDone;
>  
>  // SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
>  // trivially has no uninitialized bytes.
> @@ -151,13 +151,13 @@ unsafe impl FromBytes for GspInitDone {}
>  impl MessageFromGsp for GspInitDone {
>      const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
>      type InitError = Infallible;
> -    type Message = GspInitDone;
> +    type Message = ();
>  
>      fn read(
>          _msg: &Self::Message,
>          _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
>      ) -> Result<Self, Self::InitError> {
> -        Ok(GspInitDone {})
> +        Ok(GspInitDone)
>      }
>  }
>  
> 
> -- 
> 2.52.0
> 
