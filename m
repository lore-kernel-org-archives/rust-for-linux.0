Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021086.outbound.protection.outlook.com [52.101.95.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA28C1F
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Sep 2024 23:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726357964; cv=fail; b=s8Vs9LbrlnBGirKrpN4lj3bsq0r0qntRTJFEwkIU+hPvK/p2UMxmf4dobJQ7mgox0eBaJWeYXaqt6V1yYkBA/sXfyLkTWhvJ47bNGSIyvVTS0WmhPZ6LuvX+Ahzh/vjq+by/AKePMt8LOGO9WdKyfkeCTm6M9SoMqxqqYhYPHKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726357964; c=relaxed/simple;
	bh=R4f1McxBSfdHQmNRqHY9lTFdOTLXIz2YZPXPfm0tidM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DZTt7HrM23Wc1e4FdAO8Q/eMaMDkgA8JjmEqdD2bd9ovDiYovPLcmh9hZWUqT1IyIraB/hBBlg5AjG8zkwPlkD9S5sK8YqAmOottBk9RdIqKS4IaWSGrD9OsqV5a1hm+IcrUjCUKykGgRogYUHiKyEw3RcZuBCTZY9B1WtAd5zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=G4dV7q39; arc=fail smtp.client-ip=52.101.95.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="G4dV7q39"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8pWFUmCDPOSumM5zLdq5GcL2ZtlmQG5sQbrKGf7XQqdRYqTisFbSYWaJQY9ig8a4i7Jyes3rDtd8piga2iH97bOxjbPeCkM8f3oeJU5v8kNlh/2YNQS/KFvgqi+kVstNVy6CTjWvcKhtJj6hvYBnNVM3WJko1sl/YOc3ZsGsQSTJPZTQEyJVG8I8I9kecFEH21KTAlkFMI1JglYpg86fc2m+xZt8ImtDjhEeQOgc7S7XoeFrLUuN/avjPe/FlY4yvA1NTjuNOOh6sjUdfS/r2wKGPoqcGbNuxkuUVzg26yLndtTqx2aSz1aHUAIJTL5weaRWzqVhiNsKEqlZskX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4f1McxBSfdHQmNRqHY9lTFdOTLXIz2YZPXPfm0tidM=;
 b=BsU9o6v9J9nhOYPyCSs4u0jSi12FQkLSEO59Q8bOrdN6gKK0PYUE1ga6pgdEAPcCdqyA8Wn8NdFo+JGQwD6uNAJ+uXp4bNZwAbp2irINGCQsv64C7PnPYNut2lB5Pcp73cc+ZaAQfUbxaTaJhOAMcAdoxg/sj0rj0CaQ4APAjR+Rn61mAs58LLdoFslbva8EDhiwpGvGtUyWBKniXvp2IaCwjuJSMXJ61GTSjfachwcbrieXvuRFc6LW7nfYf/EIdQsuUmCF88xBgriETlJzUQSafU/2svlM7ILYHPw9unGGugcjFYuHPmgrZArmLqxMziPymr/La2JpXrpB12pJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4f1McxBSfdHQmNRqHY9lTFdOTLXIz2YZPXPfm0tidM=;
 b=G4dV7q39PrJvwuR3lv3NStcXjgB2kbahZiZawiKukVo0+qC/GnxVQ9qIpJUHj8SQNv9HyUaDO4bn5mG2jpuRIa/UY5yCFen08gsq8MA5c/ZspjteJ46JTe1230/PZCMmk93Zl6OcOW/Sn+PsGWBhvbjc05p4+R5VPXbZKNB5BiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO6P265MB6476.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sat, 14 Sep
 2024 23:52:40 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7962.022; Sat, 14 Sep 2024
 23:52:40 +0000
Date: Sun, 15 Sep 2024 00:52:13 +0100
From: Gary Guo <gary@garyguo.net>
To: Ramon de C Valle <rcvalle@google.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg
 <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross
 <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/5] use custom FFI integer types
Message-ID: <20240915005213.7ee8b814.gary@garyguo.net>
In-Reply-To: <CAOcBZOTcoPEk2Bo05gj66cHiqKxTR7j1z9U_j+Jeh1oCjtOKXg@mail.gmail.com>
References: <20240913213041.395655-1-gary@garyguo.net>
	<14389f99-dfa9-4646-a24e-e5eef1beacf0@proton.me>
	<CAOcBZOS6BAJ1FTFkB3x6jdag_hL7zrLbFy7TxkvZWKxRZ_+ggA@mail.gmail.com>
	<CAOcBZOTcoPEk2Bo05gj66cHiqKxTR7j1z9U_j+Jeh1oCjtOKXg@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0009.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::17) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO6P265MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 41979c8f-3c29-4958-020b-08dcd51850e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4KEiplTnIwzsDjoLl698qCNg0ZZ5Lxs2Ax1cs8GQjlelGr1K1cKaA778Uhxl?=
 =?us-ascii?Q?MW9PE2zuOLzxxaN+d0bli5WDWe1fF4YMOdU1N/olbhlLzieTTJQKTlwwj2Ad?=
 =?us-ascii?Q?xA9r0iDeKGUhzux7IPne9FkyNjLdZcP9wvjXgoRcRL+E/LsIumvoUS+aspnt?=
 =?us-ascii?Q?Tftan58TAhy+CTHVkR0PTzm44/0rsIX4leiwo/e1wQQxgwhccLSJW/08gT1g?=
 =?us-ascii?Q?GJpybmLDGnE/TMbPCaBLcNj2PUqoFG7b4W57WcV+uLryOcW9bicMpPNU3Khk?=
 =?us-ascii?Q?P4Hk5SDecbv0CirZLgGIBNYEOrWYHyWXsnO4aX5ZBTLt2v4rk27Pyn0Ej8Sb?=
 =?us-ascii?Q?vb/k1d0jL57audRyHf2PtVo0pT9q73yX4OYuIVBEYITFPn3+jR0JaekWkR4n?=
 =?us-ascii?Q?RKyzbaSHvVlmEICFsEXetYJoEREOeTa1gH3Gx1jchFsXMMrbEGsMpZv0SsIP?=
 =?us-ascii?Q?qSn6fRE79ImghRRznKVlh6yeUok9eH4QOT/7q3WiwgCJBG8b2TkgTyeKj8eL?=
 =?us-ascii?Q?pkQXeZfXIGrFpFvZ/+XDtTh/xhGVbBc2pXzeU/abgSS8nITnz6Jdz4Kp523K?=
 =?us-ascii?Q?9JEN8F6/vNLSTw6CVp8zY9g3VLkZQ78Vkkg+ueNrdDz5pAroAeGTj2HiRW5E?=
 =?us-ascii?Q?u5pg5WdSuH3gf42Su/1jPfZaY8oWauYwkOu1oF38x5ZrS9Q97pjKPTqOnDu0?=
 =?us-ascii?Q?4ivHGqXPJSIpO/dlhuMefczOXacEEsE5qDeW7k/IxLB8UEr5XsEn0Zqe0bRp?=
 =?us-ascii?Q?wnecnvM6nuuSiI5FBM/6MsFCd9lM8dJk7Yvg4hL1ZF2toZFc3KRfOS/kHNes?=
 =?us-ascii?Q?qo/D+TOEuhl9O/+bB2UeYR2e9uLsSR06a+xaRKQlXN0J7WL612h+AIzvb0Ir?=
 =?us-ascii?Q?DWTX01o34VUdGGbsik2mNP7qZDPK1vVujeMHiHbdjSviSpx5fduN2QQCybAB?=
 =?us-ascii?Q?AiS2hLTFDd6+LSlLHLevP5P6V51+rovc+77ja1AlXS5/0mpO8F6JzSB1uDSN?=
 =?us-ascii?Q?0RuztHz+f1q4StKlSUQ080z/EEVLazzTPBpm3l7EMMqP2lK6Wz5nBpgnX6iM?=
 =?us-ascii?Q?rGg6kcalvWK35NuFRsaSq9nS+QUjpKZ0avxi6mA8CUVsirHzGUAkXFPFWUoJ?=
 =?us-ascii?Q?V3mPHOvErhkeQLk0Rto5NI+CiAtv80RGxz/NEhplAKju/8ivutsK3NJOMvQa?=
 =?us-ascii?Q?FMOWFhGcj07c+8IrdMA3xNk6HDoscKEgs0WrYmrkTUZQKuHAQlkUzMZ7pBzR?=
 =?us-ascii?Q?aKL7eIXjoMnts6THUJCB/kPjm66dStPpUMY1j1sBlKYDw56T1/TDgmOqMPW3?=
 =?us-ascii?Q?CbA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?srAVRDklsGya7jVUey6m+MX+CCT8gJ1i7czKRrFrC715YWeLU2VwLxIonU5K?=
 =?us-ascii?Q?oU14xhPSPOYiTCg8Iskm9r09F61ZAx3Q7fdLHUTUP3VpIdnQ3ip34HNY75VR?=
 =?us-ascii?Q?oc2EGjfqvNKGCCY8kg6yvgGh17nLcBV/qEKzOr7D3keB81T+YKm4cF+1QGzA?=
 =?us-ascii?Q?95rKZxFVW3dBn7pnkdVNVcGglxRfvUMvdluvnme18kMa5+rb5Ez+oo9zgk/+?=
 =?us-ascii?Q?3s7pkLoULjr/Q38oXneDp9R/ql4XS1ruN2ZznEvCjPj6vWDA9pNPoNZsOFQa?=
 =?us-ascii?Q?7EyYa94a/BlDfrM6KVNGJircUCeHgFjH7fETxleT4DGfv9+L1pFZJPBvR0sO?=
 =?us-ascii?Q?9w/tg3qopGgrySUIoZ/kzyi7c4xP0xoIYu6h/B24rXuvlCXdG6gqBtg79DxT?=
 =?us-ascii?Q?N3u4sGkhzv5+5lMVzhsBUsITddxjQWhJXn8HlQkNLunDC+kWuzsuKwLMLtHP?=
 =?us-ascii?Q?4AHQ6LPXsGP81gysBE17KyjAghbBMvSkhUIsUlu0Om70idaMXS1+VoL9k/Fk?=
 =?us-ascii?Q?jpj0LrXGkCVYeIfK5d0Y2m/Nf2xPfiscuKFDhsASBpyQsAM5IiDO4nQZdaLP?=
 =?us-ascii?Q?oRZR/D2DDEvM1x1CGDGQkMNDXPzMfzE/DiWxN4PoSNV64Ni50JU9U/sBKj/V?=
 =?us-ascii?Q?8BVuaBDLhGvS/lUrsQUj+uLyXB8FfqBf9b7r3mJpKKK/aD4JeyxKVsTDEBP/?=
 =?us-ascii?Q?fEGuUodIRdLXFI51jlqi+FfRiDDjkgFQCNbrNW+AEnws2MT55zVSnRZjOZhg?=
 =?us-ascii?Q?MQr1Hc9CJfQ1MA1g+0fNcDFtg5yL77MCApb7EOa02Gp2X8XTrAisAzstED/W?=
 =?us-ascii?Q?nL+XcM3Ovs0JwE79CsTyjvzqrHj9nDJQGwvUHxO+VXOHWjb6ht+GY3XH7wzz?=
 =?us-ascii?Q?nKbr+FUQeUXgZSXGRe7kffBO56EcJMDuBxrjYopk4KfP18ttJoI21NHULNyJ?=
 =?us-ascii?Q?D/hs/6fId0kofdMjkmyA4ZO/gZ1yOGLKRpsIppeMIBpoNu0MP4/pZobSpeo7?=
 =?us-ascii?Q?0HBw7R9L9Eq0DV2sOZaH/2BxMa7gK6WzDRPE7KWiufI7UVFl+99wIA1ZUDKv?=
 =?us-ascii?Q?2RrZwGdQ+0LJApqtYnGcgeSEgtJzmV+ZShfKJJfdE0+m2WoSr4TJggo2KtbS?=
 =?us-ascii?Q?ZPceCKdAoJ5B+qKtJWoqwYcT9BE8fALQz1YX3tFlll1bVXMm0GVwuHVpP+WM?=
 =?us-ascii?Q?VDvkEjXoNC9x4VrajDb8lqjERQ6Mvkm1f5n6yFvp1wSuyB6e191z++4d5oAC?=
 =?us-ascii?Q?L+hVy39YkPeW1uvfTprhvWxwwm85XUCkWLejA75pKNI1/zWTbYvg5jMhGtEJ?=
 =?us-ascii?Q?XT0FZTqqfaAtu3PGANg29EbjTU+I12HqQiyP8308Ns+cyiS54oEReWncfxsd?=
 =?us-ascii?Q?aXeNHnpTPEocK4SF2iXL15whTWUMg/mvgo+1QY0TI6bIAcxF/UZcVSKN2BhL?=
 =?us-ascii?Q?4GdsTub10T29bA1JDszeIfaijHH/f7FSazUcjyNiPiCI18URunXpp9MSue9w?=
 =?us-ascii?Q?/vBh4qr21NyZFWsRwxHPszYAxrCjtcAKDbenNzL80PWC8bHMva8DUF5JXdt+?=
 =?us-ascii?Q?FVh3++dWorWC/RkuRXUp6vSgcq1WDD4q/IgGIgwqCtv3qAWpToeseucrgIYa?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 41979c8f-3c29-4958-020b-08dcd51850e4
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 23:52:40.0001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtLSBwW/iDRIW4hiMjMaJKLRcPAYUIqy7Zfx9uHUkytsGSV2UjqSswkpkpYk5uzBpDgR0qDgfZ7Ex2EkEunEzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6476

On Fri, 13 Sep 2024 19:51:01 -0700
Ramon de C Valle <rcvalle@google.com> wrote:

> Since we're doing this, may I suggest that we use
> https://crates.io/crates/cfi-types by reexporting them as kernel::ffi
> instead? By using those, we would also avoid the granularity loss of
> normalizing integers and using the integer normalization option
> wouldn't be necessary. I could accept any
> contributions/kernel-specific changes that would make it easier for
> the kernel to use them.

I don't think integer normalization is a big issue. Sami said the
granularity loss only results in ~1% reduction of unique type hashes in
https://lore.kernel.org/all/CABCJKuc8ue1y7WBPo3YRRoDeGUFpRon4at=Wa1rQjrXzOGpt9w@mail.gmail.com/.

As Alice said, if the CFI annotation works with type aliases then we
should switch to use them. Without it though, I think it's quite
inconvenient if we have to use new types for all FFI integer
primitives and add a ton of conversions. I'd prefer we still use type
aliases.

Best,
Gary
