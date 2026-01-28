Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011070.outbound.protection.outlook.com [40.93.194.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488B36F435;
	Wed, 28 Jan 2026 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622977; cv=fail; b=OelJ5YkEcA/kPEX6ZIGsHIIGvNigsemtYW4ZXuIOL2Zm312gL2CkaGODxqqtsUix0zN53ENKxO/mGYX5YJkAxYrI4VQWlD5TXYLF3h+KizSfz8q2vtIm+RyB7PNC8vl9sCTE7VQ+02DYFlj8q00SBez0VvYQ5Ei2RUtKwMNxdIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622977; c=relaxed/simple;
	bh=YGR1D1ZuXP5BAwN4Lrk6uw/Cb594Q3Mo7xyjl5CHUY8=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=txRjRK4R9QwXHHSMQNF2pwdfeNVal3BWIAR4QtyX6y5jS3V7WxUn0o5p6WZKfjJQBdSLFUIVPe4L2ob6FcZ9q/EfvZhqjHXrGnFzM0Y39wcxOgIyUOBlw3muYRqdmE1FrFL9fSapXe1M0KO+kxqY60bUF1oi3RHNFykjMkYl+eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qLGJFWVO; arc=fail smtp.client-ip=40.93.194.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qLGJFWVO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqvCCwmB9yrPamQOkhi2Xz6NE9WZBsqYkjCGloCoyZXbKfQUO0/K8oKP02OWK2Whc6avQLf+y9XeUPjdnrI6lFHWfgpiOwF9hs3EMn2bOuFG5HFr4Z9M9Px20VaPkxGFcBboGruX4elvcJh8sUiFR7Jlm8PxT9ci6ZIKlmygkLLeCcDio+zHmCm0IpmLYCx6hTEdQHIQ51o/t2h07+wYVai49DPPLo82nBAmtXUZQ5agoi8LcjKBtxz+pGn+fj/icygzq+WgRC0ZKANO48Z3LU0Y0vNqqzNAEjl/C7EOzoCCPw1osB74JsDp21cPiZYwdAjDBRUMqYq/ZQFLJXKw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0s6Q1fmgIT18IGbdhf2o5XO8A9uN5STlx9HksVgZVo=;
 b=tnPmRnVQCq2lQZeZfyckW779Y48CkyeUfYQh3OI4yr+oiIeqiUDDsEk0yTMipJmQdjkqRi6jQ/skcqchL994Gs8WQVcU93NEuZyph0xAEkls6fonHGwKs9zTmTAVliYAywOu4p4wnw0iHIAVv3JFbHtqOUhel3YR3hrKUCMTosFT913ZfVFMuNrzrJCKpOiyMNYvX5mVvyKv9W6GmK8CerViWlISwC0AzkzBw4HhRGaPUQVa4ef7h6n86QtjB5s1v3m1QJt0Bk2knSiM+k/ANCWISPgq0a99rhacBCd+8BulTLN/3Sqrqyndj2Yb+0dyHPc2HfzKkzK9YEpJgkWoNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0s6Q1fmgIT18IGbdhf2o5XO8A9uN5STlx9HksVgZVo=;
 b=qLGJFWVOL2ALh+kfltSl8LRYHhWIyvS3Qv43oELdUKFqseOiduW9IwtFiFHi3p+fFCGfvAIuZgO7dzc7vI8v+t7j/uYgzCN8MBQRo0o+eNLNVQwgZEyQeK5ET1b5RRE8gu9pZrUjhN/sjMToLx6jEdUgMazQ0DRVHhIWCR9vzDHqAS9jiW9X1tNr5mLkwk6PS5o1nRceXhG0ADy8KU8utBeCnhj9QIe6YqCxgONTNQP478ImWqjcexUI1o5LRlOR2aLyZwzm+HezUZm2DaCEyPygHaRFY1hlb2uAh5vn8h9rY1OYbBfU3DD/CkKhjwbRtRIZcg3yV+MYOEdY9zVVpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Wed, 28 Jan 2026 17:56:09 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 17:56:08 +0000
Date: Wed, 28 Jan 2026 12:56:05 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
Message-ID: <20260128175605.GA2175960@joelbox2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG01XSMD0VL7.2LN9LJPH57FFW@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0061.namprd15.prod.outlook.com
 (2603:10b6:208:237::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 98701f1c-452e-4054-54c9-08de5e9683a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RqbEcwKdaGK+0teQ/NCBPklR536iN6xj4qz0CXURq4v3+Y1NDLoCOyhkE1x6?=
 =?us-ascii?Q?r/oQ2WZanCoQ4P23uA3GzASgRFzYNzRyF0Ozjtk68KZJj1G0N20TIW2+cck1?=
 =?us-ascii?Q?TizSIAaUyyzjO+TTWZ951yZu+1ZrL8utzTxSPbVPVP29NaWLaOI2r76MR4Il?=
 =?us-ascii?Q?wB69FXo2wuOHkGAOUHT7UnjmN9FVbs/CVbSg7oijWttB7N0Te4+Vd6D1Ku22?=
 =?us-ascii?Q?xSET48rcQQ/BlYt6G11416SK1WH+pbKlHc/Xvkb892ytj8p4XcpM9eR1sdjn?=
 =?us-ascii?Q?15E21yrF9majXW4+fHjKGAkw+rnSHXCRH/YzYng+DQspPfH/PqX6pdA95fbs?=
 =?us-ascii?Q?tFqb75eXn0gobuNKuy5XIvxyhmMW3F/OrbfA3KGNLX0rZy0ck59+uxub76t8?=
 =?us-ascii?Q?5d+uaVFsaLX90Dm+th/yfjwqbSKgYCAmB6ViukhcDxuDddXLWnf5NQnsDaF0?=
 =?us-ascii?Q?DxsO+5h7icNDOUorZVsrkeYlOI1MBL5lR8jJOPVkYL0tHOgVBaVGW3hHSV36?=
 =?us-ascii?Q?+mSdT08MkVDjU+W+HrbbKcz5d5tz3BJdJl9sgcxn1h1R85UfWL8j7ngCFhF/?=
 =?us-ascii?Q?aOPaYzZrZU1IGKlEFC8aNb3Rl8JMrbJ4qeo6WngcTFhHO+HWOB4LPRc/tHTR?=
 =?us-ascii?Q?gANn+uPXm3eajk9WOiVTF9Kx52x3IjIwbmXQoYKdeF1oPG1hI9NURWFyLz6E?=
 =?us-ascii?Q?+Tnj4/tojAt7BlsJWbv2qIywLnOuflbcHICR21hSI0XpoEWKzedXVrAgPQx3?=
 =?us-ascii?Q?Ylpfd3QHMRVoswUeHUktYP6xJqWjUKWRoj0aJ1APNbra/Dthvf1HkfP+89Cq?=
 =?us-ascii?Q?PFyxUgMdxJMOcdPH2MgzXx9L8ekW3hLM7DwgA7Jn4SviLtqJzBrKqT2W+t+0?=
 =?us-ascii?Q?Muz8k80BVX50wNz6Z0QcJAaqSQ55kFlGvtRT4Vmbrs/qA8wbpgHtSd8gRDsa?=
 =?us-ascii?Q?tLIFKzSoVWnK9+a6ILH9zlglnkO43Yi8G6D3UuBCptxhT1zWXOb3GtGtvKyU?=
 =?us-ascii?Q?jMaRQHB8OWnh3sCrjZjtfZjp5e2+dKqPwAWD9gnapwC9biSGIsmWc4o351Mb?=
 =?us-ascii?Q?dTzHj9/j/NpFouoiIOeqPwaimyLv6oHMUFR8zzTZV7oPOzRbGiqc1z5KzyOW?=
 =?us-ascii?Q?aAlxF6s0eoOc/pptgiQBHwxcwD19uEckpSGRYy9Kl++FcwotYtxhkmk7md7v?=
 =?us-ascii?Q?IvAHpiztoWUZsUQJBnPNHm5N2CH0i788t84Gi3BujR1X0sjST9UkAUKwfx5i?=
 =?us-ascii?Q?Qc+bmCYD+aU2+99opvj0K9CAVR4YSgGq7DnSsSG81x/DzitjVMQbpUlBPdaw?=
 =?us-ascii?Q?HiCqiolIU7ZSW+n1VlgTz7yT1pwgWdEkKyoV/VbBffkcNte7+ibej8dnRBhJ?=
 =?us-ascii?Q?Eg1IKgMY79CeNeHkfxHMKu0h/VRHSagYd/0BwQIXoQLpwrd5aOtkt3PCCH3N?=
 =?us-ascii?Q?Jp88K1PaLCOIxYUIel8+aJKnjYYv8GCzyPytzAuoqG3koR6vsWAlTC6kQF+8?=
 =?us-ascii?Q?iLa+Jl81adOFENWVlmuRnXxnVloy2rB2X5888L1il0Z7+24dqk2DfU7Lb+Vt?=
 =?us-ascii?Q?cqGSStZnBm3ejUiKCTE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uuaMY+w/YjtR99u041QTOmUPmcsTgpESe8ZCmEmWsVbFzPIz4gq62QMCQslE?=
 =?us-ascii?Q?uLMSw9D2oFIWj9ohdG5+Fxx9hSibfuG/K6EQHSm//0fvzurC5lzXzzDVlL1m?=
 =?us-ascii?Q?vxPP7hDZJ7tN0nMrNEP6ReSCT5Lk66T5i2A+pK7B5P75mGDvfZPcAUeVg1J8?=
 =?us-ascii?Q?S+oEnyeaU2mQqvgsQzKHOyJ3fF8QLG0Ots5rNiw5XH9PlTyks2v1+hxvbymM?=
 =?us-ascii?Q?8jggtRYCsxqxkHxOCVc/HepWyrjiR4VMmM2dOIKivZAZH0aWTKZxRfytas7J?=
 =?us-ascii?Q?mr8D5SYQrgjRDRP0DY38SVurvXjH6KdLN/0skvAl+bMqnB1EKYSsfsqinDr2?=
 =?us-ascii?Q?/ZlzaGhhuX0YzrnpEMQDLAKJgSO1vTIhluGUvXyykcKnRW8ct2R5sybODJ3M?=
 =?us-ascii?Q?kpThmAqrm2lf3iATVKvOS4e82NkzDW/TxBzKjdDJEA4Wqn1dQbCLW296MtjF?=
 =?us-ascii?Q?T7RwRdp3P8YcAAsab/oNL+AESwPa/JVILRShJfQWj1RFGYUr7KLEfaB5Rgtd?=
 =?us-ascii?Q?s6QFYVSmYe/RPcFIu9rfR0BcFWUrgoi5/Fp42XX7GbWptAloTQG0esU+cgKb?=
 =?us-ascii?Q?ImaTumssIbvX3AkPzKstVBj9dQZsiY195ft13wOiWvufCoe/wcvGJPVc0SDS?=
 =?us-ascii?Q?qjxYySkOCwlKPOTuEuM6TZK6RvEoqd2syvtlxpXEjcFrBsdba09KLC2nbHEB?=
 =?us-ascii?Q?vOYuML1CNjvS3khHYdrUztgT1wSPd8wN11oVXmyiNvJsr2WzgQN0BJZiB8lM?=
 =?us-ascii?Q?kLRal2LJ9RILkkIrT5h4eUwKS8YunjZU/84U9hxzLlbailmUQQYlBCg/chrV?=
 =?us-ascii?Q?PuInOQkV4nPX9uJYHfrLZSE2irdWJkVB6X0O3VA3P5OI0utzaD7MEd8hh+K5?=
 =?us-ascii?Q?gIgIRLvyk3OHMowxY7eTTwGL8racLqReutSWGIeu/e+rveMdibHQBiTcF0nx?=
 =?us-ascii?Q?XNkKFV7BBmRcYZsh/e65zA/enOZWldpKkj1YZKteFfVzztjouuNCzr+ahhd2?=
 =?us-ascii?Q?X/xuRaxTZ4ueKboyVOszZ6GjolBLqk3QDmJDmxet1wmImLnx1G8gzmCpJPvR?=
 =?us-ascii?Q?uBloT2B+LBmO2r2ZEgtlOUJs/ynMH+r3VlTcv8KsBKtY60P7gRhU4S7B3Ol0?=
 =?us-ascii?Q?Z8f75Je9OEskWWwe9IZtO9SdT2lm4QtSso4vHYwki1Tih1l2SYwAiC9OjgV9?=
 =?us-ascii?Q?h32KUlt4hF1b2yTFZ0OmwHxKqaj0smX74mEqF1r4Sk44Xu5c11+2DXNUX8ti?=
 =?us-ascii?Q?7MCMovDu1u3GsDo2RG8cjYsX+CGIZqewtkcfTTXVaRwJWCgQAsv3a85VOCq2?=
 =?us-ascii?Q?M+uDClpqPM13HCmVCVkObbKcMESUI+G+LrUkgKpheEseO7CBLsyHexG9shGp?=
 =?us-ascii?Q?19Q5DOYy3YZo+1slL14M1D351uSTqfZ8cFlM3Qyq5ZYO3cnbSPi8MLBG3nIs?=
 =?us-ascii?Q?nAzKkKSigPNbE5FV1EYHqEPV0cu7iCmkL4PfSjmclrhJeWymBWlXNYObiQvl?=
 =?us-ascii?Q?NV1FG1XvDC8zgTBxZ5PpYKLjPV0y+ZdOoTL1oAGR4U4vxqzJlwN+pZJ0qmPL?=
 =?us-ascii?Q?v+l+khj5R8jvIeuHjZKFGMeWVmHOeRML2wmewS92m/hAkVIqSNOrBdTbASpJ?=
 =?us-ascii?Q?kcV6i4TK+Tr3LJ9304+KVGs04V1DDKvZcksKg6q6m8T7uwbaELI+3olM26ID?=
 =?us-ascii?Q?gCiLTUpr8eiX70bIfrP1g9P2BKdJm2BtzNmppcT3OCMvpIocixL3JTgtk5vX?=
 =?us-ascii?Q?JJmfe/rwWQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98701f1c-452e-4054-54c9-08de5e9683a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:56:08.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsUoTxrGd+y53EUvjsoxLeQtVbmAof3gfbFc3YwEcBnQ58PFb60pIILPxMNOtwKVm1L/LnnIyzlBBw84l4tv6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445

On Wed, 28 Jan 2026, Alexandre Courbot wrote:
> So these setters are really part of the `bitfield!` API. Bitfields are,
> at the end of the day, just integers which we will very likely want to
> declare constants of out of individual const field values. This can only
> be done by using const methods, and a const `Bounded` needs to validate
> its constraints at build time, which requires the
> `Bounded::new::<VALUE>()` constructor, and by transition
> similarly-shaped setters to set fields at const time.

I think you run into that issue because the setter requires to do `.into()`
to do the bounded conversion.

If we accept Bounded type in the setter directly instead, it
should allow to keep the API simple. The advantage is it keeps the API naming
simple. with_<field>() which accepts Bounded type, that's the contract. The
trade off is the call-site can be a bit more icky but I wonder how much of an
issue that really is (it really depends on usage).

I wrote a simple program to confirm the same function will work for both const
and non-const parameters. Actually the caller does not even need to specific
the bounded int size at the call site, it gets inferred. So we don't even need
a bounded! macro.

struct Bounded<const BITS: u32>(u32);
impl<const BITS: u32> Bounded<BITS> {
    pub const fn new<const VAL: u32>() -> Self { Self(VAL) }
    pub fn try_new(val: u32) -> Result<Self, Error> { Ok(Self(val)) }
}

struct Reg(u32);
impl Reg {
    pub const fn with_foo(self, b: Bounded<4>) -> Self { Self(b.0) }
}

fn bar() -> Result {
    const C: Reg = Reg(0).with_foo(Bounded::new::<7>());  // const
    let r = Reg(0).with_foo(Bounded::try_new(9)?);        // runtime
    println!("{} {}", C.0, r.0);
    Ok(())
}

This is clean IMO. Additionally, bounded! and bounded_expr! could be provided
to build the bounded types.

Thoughts?

--
Joel Fernandes

