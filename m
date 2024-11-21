Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42AB126C05
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732182146; cv=fail; b=D8AcaIgObtn74BNnnaqnGYcLWIvISOtNyGB2teIgh9eYP9pFhrLy4YwOoFO11j7JHRsiNd8+owtftLKKOs/6e1J3hkOgXrNQ9AXp5oxNFsOO5VGxlNnxZmZapRnh9TK8mEjJEJ8w52imRBe/WSbbDxSsTmAQMdfmHjHk6jsOhwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732182146; c=relaxed/simple;
	bh=z7P76/R7vOt5K9liaCIorh2IWLV0t3jUXhYnbLcQcgE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=blrFTtm01KuwSlaYXvcAotHqBLkqUwuljcSQcNM7M8C4XGM9MR3orHVOgE2B/n7KiBFaR7ajH+DxJojnJ+RflbpfYcljSuQbR9vfObgZAiWi91TmgsaDYBc2GgwCHYGBfRYR750XU+Qq1LrbknY6b2tlKXtwT6eafZFq31zSnss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk; spf=pass smtp.mailfrom=prevas.dk; dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b=AP3O87yG; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prevas.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prevas.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prevas.dk header.i=@prevas.dk header.b="AP3O87yG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKlXbHWPHrvfIz2BJE52givQC1RKEFLuJopPR+/IjmfBuu6BDjCioKUQNuqgwXi45WN42y9e2c6/VoiiCcrdKxmmV9GyT01+ouWsFYuicDi61og4m8wYZBs8zMoxp5hEiRguElrs0aBEzlJ10vx+nOJHjjHn+1zHP3Txy6O0oGJIqr8lebFZPUxC7FP+wOMBN7f8XGd3qzQ1PAFEy7Gx+664VnT80a9ogoKNOql8gBCb6uZnfBUywU9NBKN8L+9nZR21M9sNrKYALXcZWaep/uIpga8O0gIEOuSUKovPpbPR1Rte0AiWJ5AspZhNZfrB33GUtGHVRaPGpxq2frFrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGNgE1aIQDoLqx1DNiMUcS7fptBEUyUTpfzETI4v0X4=;
 b=Y567MNvKDsvKJL/zTAf+HSrPuewO6spQ4eIRsm5BrTwU+mhKdbsYAN45hlPCEN2B1OTBKFlLYifeTSN0MsZHj0C0yOXTp3YbiVl16FHqK10k8mtMqevWFEBoe+CPwSe3U38ZCYn3hV0qMv4zHxRVNTz5X4yllM+ndPZcrhMr/boUQIKTvTPev/HeblcoQsDRpme9vBSabjuA/4wBAETLp5m+X0h/gd+UTej/4mILQw+Xe+bVx9oEblIxiilMSalD1iEGBzBLXfBMTpyL0x1FIBVgFu1mjq5Ok35YqKJdOblxCU5gxjpBQSTrL9gBHS/4twOSe/iaL9jEfA0+oE0vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGNgE1aIQDoLqx1DNiMUcS7fptBEUyUTpfzETI4v0X4=;
 b=AP3O87yGiTLK0OFJkghYnO8jDPQewpjPZ/AFSNHeUdyZ59KO9Eh0WRcJLmbW7gXTxKeKb0+qTfW4ZOKveRd6+8GpS4IuL/0SjcVRgM0Xg18VWbIOqswNi/Y+6uhNPd239hh7bc9hM1YMV09nzxv455MdKSM1+82aS1/TF9VVxb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by PR3PR10MB3850.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Thu, 21 Nov
 2024 09:42:16 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8182.004; Thu, 21 Nov 2024
 09:42:16 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add safety comment in rust_fmt_argument
In-Reply-To: <20241118031225.38080-1-kernel@mandragore.io> (Konstantin
	Andrikopoulos's message of "Mon, 18 Nov 2024 03:14:17 +0000")
References: <20241118031225.38080-1-kernel@mandragore.io>
Date: Thu, 21 Nov 2024 10:42:23 +0100
Message-ID: <87ed34ly80.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0051.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::35) To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|PR3PR10MB3850:EE_
X-MS-Office365-Filtering-Correlation-Id: 686e9d5e-429c-4000-4f77-08dd0a10c8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wIV0LH5z76lLRA/gDWQqPJLEQC30/oPxmqAqF65ajq63LYTMTvVKzeatlaSo?=
 =?us-ascii?Q?bJstY1RO3kZGoSrLl4LBAj39DpS+0Iw5cnHeAPywJS2Blj1t2Hlj9UGrz7Lw?=
 =?us-ascii?Q?iaCC7S9gp9C2D+bgQIJJuYKjrHHHmlAsotUyQv246ZEbFFkA1d6QIh2PtfMX?=
 =?us-ascii?Q?btK7dyMgZMWVUAVz/6xBVQVmWl/qwXPZPh0VSXtFmC1QD1q5ifHr6CaZ18xN?=
 =?us-ascii?Q?D/pnUOmezzLGxjWE3PgR4yV83WELETdN7vQFpiWzNCrFHwAiRSEh38B8KAjz?=
 =?us-ascii?Q?RDgsl1WpTs2fdqh23r/CXRIs7KXv1Pp4mDWTAY4+IGR2KJGuXlmfgAd6S3Mg?=
 =?us-ascii?Q?HM+7Iv3QrZiry6bri0i1BegjpCX8UlHX8Uv0hLdfM8OpUDanHoDb39/8zseG?=
 =?us-ascii?Q?IVAiYDV7Tyqnnp1FYMFfXPWlqfqxWFyNrBKSu4FHZdLCHOraytUXHWCXUoaL?=
 =?us-ascii?Q?KYjlLa+kkqv/00IrWiT0s0CUqW89S3xzm4qJfhzREpgKzTgzEoaGF84jeFmU?=
 =?us-ascii?Q?tT1ct6/lQNBjs3Y82q+gKMOWV5FAJeVhIGYvrBacmcWYoKhLAdM7V+hXyFxS?=
 =?us-ascii?Q?Nw8kNGoFWBBdu9xcu/U7y9CLqkTayO3MlZKidWNIBdKkD1HPuIXd8Bny0KJc?=
 =?us-ascii?Q?UbnZSmfeOVbpXaXAUhQeTPCcq7toR+R/k/r9sRPTHbeGtB754ib7nQYIBe2o?=
 =?us-ascii?Q?DPl+TDjUO4TUunfgxRhRzf4y4UBXkrnjzbDnS9zvXQQMg5XrcAR+K+mu4Urw?=
 =?us-ascii?Q?O/uCY0V443HX8xWTmkBMWsXuUMReJZn18UfQNoT7FqmYtDMRW1mT05lrtXBB?=
 =?us-ascii?Q?G8t5K1hSCbQ/kHMSPIV5pmR6Dd4D/eNr0WOczIJtQ/D8UAoEqN6pHVunelit?=
 =?us-ascii?Q?zxmsQh4ZutkUZzmE/BNxPmj+oFWFkBHWehwSNeTc9euUunhfYCN1iMjxfxsy?=
 =?us-ascii?Q?y/epBn0B0le6Z4wFrkJ/8LY+Wnxkd/TfZmuTOPLS7bHCI5tZajC3GuIM6Zp4?=
 =?us-ascii?Q?XfchNzlPTp1JpPPyv2FBfsGNYRDm1Xft6ak+DLVFQYeCC2RA/M4/Rqexjyzu?=
 =?us-ascii?Q?CRoL5T5F1DxOo4D4aInphVsYc+pQmMlNYRI9nTfhIkIhJ6CRPidot63J5xsu?=
 =?us-ascii?Q?pbeVpItG8nkqq5shAahoGRAoTZQkzs/bOhLaB0KKsfIl0r7G5Cx1UAtsp/+f?=
 =?us-ascii?Q?eSD3BhdqgXUMGi9ALLjP2Xj7+hdJdKKjMGVOGu+sq8jSSk7eymm/cN1Blc/t?=
 =?us-ascii?Q?mayVHM3D0J++NMFDnhfpBg4tj8lki3hfL9xQAOxl0oGTj6WCh45y9gEnlCBF?=
 =?us-ascii?Q?tlyHPMurA9/H67Apn+XJNZpFvpi5v5nZhXPy+Vq6k+7yQNUMpj2kWzeifPD1?=
 =?us-ascii?Q?5Ygzrhw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?di1bk64/Yd7TGmUNh73e1sAk3E0HXCy6hGKKXL/35OKhD+GA5lr2Ok/dQ1Q/?=
 =?us-ascii?Q?dipTCiyRf8FBCW4p1Y1adMaX292clK8FqjeFZsfqk+vo98pvhyDZ3wcA7/sN?=
 =?us-ascii?Q?V1n/bRZZUlVmEiBtUg04YSh49rE9yDjFCjAEidZ4dX14SFAotuzsUH8kWTLL?=
 =?us-ascii?Q?bfd1RuCrorkrbZzA3kcQEaQ7/vrDUU9jQgEMlcKClK8S+IapPC6QIx2FKbHk?=
 =?us-ascii?Q?HGl/uuLUma21G6DYf+5nZtgUc4nhyC6Km6nm3DlsXStnMzmPmk9FHSdqorLg?=
 =?us-ascii?Q?f4FjzTDqxaSlQvtUWMGP9lwdjThr31lHT1SUut25lckl17otVZNHbvCKGpCs?=
 =?us-ascii?Q?cKHuAswSpNhvO7lrVIkU2vTqZoBmUDHhR02f7dwGnSz/m83eFzikLZAkEoCT?=
 =?us-ascii?Q?Yp6UN2GKWi/KwB0CEl9AO1IlZS2CZJ2987PEEVZ8CW9qtjk7Mh2DlPNC4r35?=
 =?us-ascii?Q?MPX/cuRZmma3e6JQBL0yC7Hilu0I8AGrRGEnV/8UuY/4zFwP8/uzazNqQRp7?=
 =?us-ascii?Q?IXdP2WqcZ6nwTAK9T0RGu0q4DBudfYWNzr6wrUidbrmfCKSGk6DabQXg/7hS?=
 =?us-ascii?Q?8YlnW0sQZMCAp2W8bbWLnym5Q4lXyJwn7dGPwNyhNFasMnYcQjH1rmrngIHW?=
 =?us-ascii?Q?Lniquj4BqFZFRBxdlsOwhlQPSb2EvJRNtsK1NnnO1XLO+w9Lfp3fgDVyxKuX?=
 =?us-ascii?Q?tGqGpN9haWEQyXuzPmtgVR1uRQxFR88lwR7gzY6Pr0OOAE3n/J6YS3rkKSLJ?=
 =?us-ascii?Q?kmVaFsnxzRIflZiR0Cd57MSlJG6IG3i9L8d547Pd/1rqhFaNyOWsNeqVP0P/?=
 =?us-ascii?Q?bnHNL35xEO1GQNkDLEBD5k6/O0pIf/ScYAlFjARLz2E5et3ryy8UZXP/yOUL?=
 =?us-ascii?Q?xCi8vtGJieUY9AbFHuGw5rGrkxJcvT4nwflxiwV3EBFUyNgdk61GutFXgQEx?=
 =?us-ascii?Q?ePy04zsikNck39/t+zhVhkXv5l9ZwLP4YWs9hssQRRtUe/z2LMLX/Vxgp9ds?=
 =?us-ascii?Q?dVJz/Nrjwvt9nPRgUHVtQ5OJysU50p3oG6SFE81YcfLHe0V2bZHlxkY2sTG3?=
 =?us-ascii?Q?ora+iv6ux9P9oCSAQd/OP9FRvhBcx3klRd9JRwtHzqBQGxEj7qrgr2IfR6pl?=
 =?us-ascii?Q?cXevG35UOBvZThM10YDOwyEfyWn7SU2F9MG2XqJqWKjM5451zZkWcIeuHpoM?=
 =?us-ascii?Q?rvtUBcq2LLU0sEHwx1C8IqPZlJiT+OLgt/zvXgr+Rjs6UAp+w6vvrkr+Tu3o?=
 =?us-ascii?Q?9aQhJ5kmiq02TJbIpH0yr441rL2qQ4FrsOYgkq1T86xHxMylZNsG8txHm+RZ?=
 =?us-ascii?Q?kySS9EJMqSlbu3S11szfYgonP/3wkSTGtcCr6c15C48kEmVs7uP2RBUtQCCV?=
 =?us-ascii?Q?bg602xT3gzMQfu4MF3JIV2YlrIuYimetAPTV2k3O1xvWFrsILGLLIedKc6dC?=
 =?us-ascii?Q?XzefJ3SPb5hDc6/64jB0dgNmdDcBurqrb8HIo0F+LEPnjiaMdRd4F6ZW+bqJ?=
 =?us-ascii?Q?gf5qebddQt7ASN88hyI4nyj+kmI+wkWjnaGyRaaxRUczYYK8KNj0EZ9RPNWW?=
 =?us-ascii?Q?ANHe3T85Y8VN97EQyQJgQqCqGFOOT6Lw5nW0uoxnfMk3rnIh0orV1s3flhJW?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 686e9d5e-429c-4000-4f77-08dd0a10c8dc
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 09:42:16.8292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUxpUVgQv9EQNnzb9jV6j/B+PJLuvST23sUbvxD9YaHflCSoGG0A4NkYiGSKJmzuJrWyK/2eDcrlVGw0/QJw7LYRSKHjq87omDHw5s9dj74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3850

On Mon, Nov 18 2024, Konstantin Andrikopoulos <kernel@mandragore.io> wrote:

> The function rust_fmt_argument dereferences a pointer, and thus it
> needs an unsafe block. The safety comment for that block was missing.
>
>  
> -// Called from `vsprintf` with format specifier `%pA`.
> -#[expect(clippy::missing_safety_doc)]
> +/// Handles the `%pA` format specifier.
> +///
> +/// This function is called by [`vsprintf`] when it encounters a
> `%pA` format specifier in a

Nit: The file implementing this is vsprintf.c, but the actual workhorse
is vsnprintf() (note the n); all other *printf() variants are wrappers
around that, and I'm pretty sure no code path called from Rust ends up
passing through sprintf() or vsprintf(). Yes, I see that the original
code said vsprintf, but please fix while here.

> +/// format string. `ptr` points to the corresponding argument, `buf` points to a buffer to hold
> +/// the formatted argument, and `end` points at the buffer's end.
> +///
> +/// `rust_fmt_argument` treats `ptr` as a pointer to a [`core::fmt::Arguments`], which it formats,
> +/// and writes the result to `buf`.
> +///
> +/// It returns the address after the last byte it has written in `buf`.
> +///
> +/// # Safety
> +///
> +/// `buf` and `end` must follow the requirements of [`RawFormatter`]. `ptr` must be valid for
> +/// reading a [`core::fmt::Arguments`].
> +///
> +/// `vsprintf` guarantees that `buf` and `end` will uphold their
> requirements. However, it will

Same here.

> +/// just forward the argument that corresponds to `%pA`. Callers that provide format strings must
> +/// guarantee that arguments which correspond to `%pA` are valid pointers.
> +///
> +/// [`vsprintf`]: srctree/lib/vsprintf.c

Same here (the filename is correct).

Rasmus
