Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020101.outbound.protection.outlook.com [52.101.196.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11144C8F;
	Sat, 13 Dec 2025 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765622160; cv=fail; b=nL+G4LlpMuLArKrQ4/j/8rbMSXOGI2hfF+LPutq1PCiC1cd1iMJnDTPkBzBIpGRUOQ0P/tlCjwn3VaoHZp20RQw0HdAfHtYcaQmnA3nYvkhnZCWitw0wSZy0hl3dO45NShNNNR0HidW/Y7E7q3Un/qX2pG/JZj+QqJnD5wwd978=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765622160; c=relaxed/simple;
	bh=GWDTPXHZok9aJOT8KQ68euSxgTX5R5JvgN+djuHT4ck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a560lj6tQ6um6MvgIGw1fW1PCZRlptZ+qU4+UGvRKAxdxCsybupbJul+EDYbZa4HoKTABhFps5YuCZd3jV1ymv2tdmgImAVjmf7sCqCpDf9XMnI2AycgYBIrJ2Vrxa0TxbS/ToJhHUg8BlQ7OyZxUZBoEHbV7/x8jNU5ROLbMoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=nz/pj9vr; arc=fail smtp.client-ip=52.101.196.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="nz/pj9vr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm5rRY+1XcGjYp2UiSn+a50ko5f/gjVBra+C6Wl+1CUzvlQ35h7UpPjlb/uqBnz7lPPNe4+okQZVPQyISeCJJQdWEoN3sKhWo2NQsGfCkEuGElRpzjqxy1ywOb0S7NFRR6qkmvND2IuEqK7nTmsWTcBggt/f6FhhDGKa1t22vrTgiqv98ntJQzVnQJsGqGMuIDWX6mMFA0ITzrQ5pZrBdYYHlrvFFsPQfheVHFciRts0nnvA7LAKB0/MRzeW7lfLjStJWN307mfA+vMaay08nA3GxcCz+owL3AN+P0xTEJW5uZjz3c1Evz6mTO9SFFIvX1XQEAQVQLyDvpHbtCdmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaHgdXmpvkHYtoNHwNWpSCSM+9TJgp7PL2PKwFg90qM=;
 b=MgjICgpQ9x+O+mmFbp7T/FPtcubRghKrOml6ihyUhvfRlAoMlCWiPUnLa/INdbbXek9Mjbe4JJES0oPEfTpmYbXZnXJs1p/NJBX9zjxcVY8ZrlxMxrkhkd5gb4Gc+yK7cyANwpY25V5XfXol4EwbV8HFZHSWgSV5FcbkX8qjpFLBNLgvSrKdr1J8ueDOymD/IZ7/DMoifqt/DRG4oh26JbHoWb22Ep94ILw3oPyRsu3nt/BP/BILxnhg2ky00wEHj7gPKlPDYyYtzRdW90OwFqbtKL5u6Ljw+Ra9Z+kN3BYoU3Y/IqtNTq7C9ohr004Sf0vB6pc2DfRDHdh+Icrg1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaHgdXmpvkHYtoNHwNWpSCSM+9TJgp7PL2PKwFg90qM=;
 b=nz/pj9vrCk4Oi0vD0qgTy2/rebBvfpsMHz2AbTq/GkwEaBCk8ZxLRZ8/3GXvEaZDS53yS2C04uS3WhdgSNzOhaIcn+5O7+2fhUMmsMkoYBq81Q/fd4bqnyDDILGjFGVGvAJWDa2HSOYRItvLaMH/UeMb2AOubsOjJexbOySeuyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB3441.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sat, 13 Dec
 2025 10:35:54 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 10:35:53 +0000
Date: Sat, 13 Dec 2025 10:35:47 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: conclude the Rust experiment
Message-ID: <20251213103547.68e46eaa.gary@garyguo.net>
In-Reply-To: <20251213000042.23072-1-ojeda@kernel.org>
References: <20251213000042.23072-1-ojeda@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::16) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB3441:EE_
X-MS-Office365-Filtering-Correlation-Id: f4464407-ed40-4f9f-e75b-08de3a336487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZfcNKYRN2u5xvj5xXil0Fb12lVl28Xl4E5ApmzrJGaZ2SL7rvHJz2V5MlbH+?=
 =?us-ascii?Q?Fu0nX0sADFpJCgHz1mAkFtVv4dyr5enlEKk73n4XIe3XKp7XiJhoFq4XLCPz?=
 =?us-ascii?Q?jbdqiQ8p2HM6QPK0dNAtCeTiELZF1rEmEbkriNssz8Dsfqkz2y0PrIPiDmot?=
 =?us-ascii?Q?emsCbAfwEHgeO2uQmNf1jUdqmqrq3bvMSyAv9ifb1/2mpdvUt0jvwCY8Iacw?=
 =?us-ascii?Q?d0ztOrRufV7bqLSNY1iRkZvk1tc7ZjdgLq4g+pjq8/2nSvmyNRMl5QmrxCGf?=
 =?us-ascii?Q?EG4sYtWOgSoZ5o1j+3F3MacpZIUfZOhrGLEEEm4Tfy5xcwCwHN4WhveYci2z?=
 =?us-ascii?Q?kWD1WSTHi9pTYXZqKVBw4DvD9fk2ffKCaKO4oFXmVzGFQuSr/u5U4HkJUpnX?=
 =?us-ascii?Q?XpbrxAi0w5ipWv2Uz7xft0+ePglyqYC1QVu9DKxpmhnIDTMwyvQFR5xAsU4M?=
 =?us-ascii?Q?SFhVn+iYCyFz4Zc0zKVC28OTZf6hZ4kr3KCuyWhsNLSfqh248X3cvxELdcCh?=
 =?us-ascii?Q?59RGAil/f4OmdHdeZp8gjM2ryO/lI63id6ZbnEtcIfQCRlttMN/fw0svUWj1?=
 =?us-ascii?Q?TjeNa8cOusAEghqVgyfhEMWfH8xRgixQRCc+q/C1yM08OYCRMEOAZeIxTpc9?=
 =?us-ascii?Q?2b844VcfyYwoMwIUpgJ+eFfli5kqjxAtGkDfkkTGFhyWW5XNGNH2IgbLttZn?=
 =?us-ascii?Q?xx3iShgSJX3vFIqqZ9prJjkzb+AmiyHembB/lxEA7p5PPl7tVRnq0dR4udjB?=
 =?us-ascii?Q?BavjrSxHWJuDogtdAGtwst+Y+xbI7e7y09TrMMMxeyBUE8ZFlCcbjmqQGS1U?=
 =?us-ascii?Q?ewm9lo2MgP82SioYi4JedXJCAHWJ9mRBRVAy3tHZBIvU3nrLHHYYH+J+CMir?=
 =?us-ascii?Q?Oe7GhcBYCE8S05Kev+LZIa3y0INMY5WPMoHZhXf7o2UNaa+qqSnpCAN3jycA?=
 =?us-ascii?Q?T8gCrwZBVmm837OtAzR+iZd9RLmaygiiSNyTTAKHsXMYBsb8GG23JuoMT+kb?=
 =?us-ascii?Q?uAuMjCHIPOIle7KHx+7eYI+DUtvnWGoNX1ZA2ucaxwvfTp4faecj1au68nQR?=
 =?us-ascii?Q?xYEjRgB3lfiLBFiJllasCOZCo/47Z0GK2DQ6YXOi5pTvPZENj1W/uB5q4GCB?=
 =?us-ascii?Q?fYVdTE3AtdJw1m8h9FKST1hUL++nZHUeieg4maaY1gPy7kAls61N7wo6Qyxg?=
 =?us-ascii?Q?mYk2Uo4c+6u7+x3440fNbJDqGq1Vl2I4kG/JQs/Bafq/jgrqypJzm68/0MOs?=
 =?us-ascii?Q?DwqlFteci/fBmrOu9mjjCzYjkqJ4SSWQggogPmS86B/Vb0j5jhA8CZYXVu2a?=
 =?us-ascii?Q?3daQKeM84BFI2PN1aqQ7qJ8R4IWGkCaLY15C79cLQAUR0lPZ5k53W6dQh3qa?=
 =?us-ascii?Q?uxUhRirZLe7QbdKZNK4CgXqlmCh6TKaJVqst1o6M53CFtEn1XmNWd7uE5ubD?=
 =?us-ascii?Q?tYvjlUmqRz4Sj6SFzUCMl6iQTSbdhPX8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4sbHLrbx6OywFKncIA4yw8u/HvPuDaVj71Mx2K9/UTWB0f+Mkn5QULdmthjG?=
 =?us-ascii?Q?2EctcwzvslWOKZ6DSmGe+4youRsxHsAU16rq5v/+ovdXHTNrwi2iSR6rAoc4?=
 =?us-ascii?Q?EzCZxIdGiM09ySfy0O/fIqrMJibfFDfkYhSKiy6b//qUl33q7jSGGzO7Kdy7?=
 =?us-ascii?Q?JfACrba43kDz1QKmRDG0PqquPRW7n9afDNweRnB4i6Bd8vRAO2ZeWV3K9yM5?=
 =?us-ascii?Q?3HM9XjgLl6PLEc/sNNrwl7ODuGePO9/NquTENfkWhkBnnkDKrFZyAdOzS3Ef?=
 =?us-ascii?Q?vJL9OyKnwYRUN8+UWECy4GWEjjcMGgGpJrM1iOFoK9oVU0853Xg2h48ksvU/?=
 =?us-ascii?Q?LOR9qekXRw9MFaW2+qwG8bIUqTEiEmOoDLg3fyB+yk/JzlMyzfBqUmyLAXK9?=
 =?us-ascii?Q?B5G0gyBasFFPypBT059LS+ZN2yN6SIvTDQaiWnVdJZM/HvPZDPCrrfN3jv24?=
 =?us-ascii?Q?+D9OkXSiwwSjdubaZY9T433BMCvrIpYsd5RUmN/3qazGbaz5r3bTIkIJRHSR?=
 =?us-ascii?Q?Lg3hFnmM83ibbKX751myAHG1woLkjb/wwu7GNCcsH3joc1W6OP3PZ/NuFbfo?=
 =?us-ascii?Q?DLi+I9g5zIoEzwbOYbwdzEKsamJQk9AoOrJPysSEAJdedRg/BTcYYXlivbnS?=
 =?us-ascii?Q?Mgwo6iLJhb3d9mSNIRrlMfeh4Fu7+bA0bV1QmMSeMzfTSkTPFAPvCoBfSWyV?=
 =?us-ascii?Q?sL+LdtN4VNTZ0OU8xlQ5IlklirRZgYCyOTJoag8gL8XYIZeiehSmz9saCQXW?=
 =?us-ascii?Q?pmBKY317Ns5Jyc6kymfbSn5swjehd5QpO8y1DNXnKWkd0O3OlAvHmZu7Yvuo?=
 =?us-ascii?Q?+/VwnfUvwCsyDnq8Kcf1qUK5AkWUVMAfYCF9s5Q8/pjyF0u/AIpZHSehzVmM?=
 =?us-ascii?Q?HI7E3YrdRgTu7RbjRpbjtLUJMMLRl/PcVK+MlEutbrL4TsaGCbRoKy+5J7HY?=
 =?us-ascii?Q?d+3k/Eke2C+rArluVcfkiVDL2jEJqjmzDHk/PGtYScOxl5vcvz/YEiFp2nGm?=
 =?us-ascii?Q?R4kTx/AJi2IAqIxeA49x5/XwPfGtKxR8dwync3obr0v4AXEfQKrvafmfTSJ4?=
 =?us-ascii?Q?V/bec5m0P4SAAceuSLU0/L9xaxptfM4rCv/1iGQzX8/J3Jrp1qSgPc/Jd289?=
 =?us-ascii?Q?a4yBc40LmdMsTpEDUiCDecarmhvuF9OX5bpgVQNs/4HoV+j3m1jBejb1y340?=
 =?us-ascii?Q?By9RuwPoOX/gSlOK+eBSL48hitQiffY7KtUiraKMf6eujzQASGztnbuZPg4F?=
 =?us-ascii?Q?stVMAiBFtQv22g14fl4ZTik+GNoqa9cqNsTBbHDJum3RmT3oOKqR2CmL73Rj?=
 =?us-ascii?Q?f9t8tLFRXD8/X5Z2iaVqkgaP0gIzVclhRNve1XW0cHY8Q+UAUjFh97+Ba25c?=
 =?us-ascii?Q?rBs2oG+kPnbfQX1ASyTdY3VOgE4MaREYR/Qec3hHaDhrWCR/llMpOTKxaV7d?=
 =?us-ascii?Q?3HV6rtyShw9mhjbun20PNb93mP9KLVCF2lj7mhyE2pT49KMJw3a7TwEWmuQI?=
 =?us-ascii?Q?17aSOAMFk6gTZyLagYh6R+5NcCVDlCmN626TIp9Ee2mHWhCwpbU3lT9OljUl?=
 =?us-ascii?Q?kXirNdAaQ3dG1kZpIl9+112kvYWRIteY86KVw/HW?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f4464407-ed40-4f9f-e75b-08de3a336487
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 10:35:53.8777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Is144vtf+1RiTGAuUXJ8uNy2h92xnsilN0gOnrpn9T26TEpPxKtJ1kMJeR4fXbMNwQ9nfBoHWyhgiEAxq1hG+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3441

On Sat, 13 Dec 2025 01:00:42 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> The Rust support was merged in v6.1 into mainline in order to help
> determine whether Rust as a language was suitable for the kernel,
> i.e. worth the tradeoffs, technically, procedurally and socially.
> 
> At the 2025 Linux Kernel Maintainers Summit, the experiment has just
> been deemed concluded [1].
> 
> Thus remove the section -- it was not fully true already anyway, since
> there are already uses of Rust in production out there, some well-known
> Linux distributions enable it and it is already in millions of devices
> via Android.
> 
> Obviously, this does not mean that everything works for every kernel
> configuration, architecture, toolchain etc., or that there won't be
> new issues. There is still a ton of work to do in all areas, from the
> kernel to upstream Rust, GCC and other projects. And, in fact, certain
> combinations (such as the mixed GCC+LLVM builds and the upcoming GCC
> support) are still quite experimental but getting there.

Indeed. This is not the end, but it is perhaps the end of the beginning
:)

> 
> But the experiment is done, i.e. Rust is here to stay.
> 
> I hope this signals commitment from the kernel to companies and other
> entities to invest more into it, e.g. into giving time to their kernel
> developers to train themselves in Rust.
> 
> Thanks to the many kernel maintainers that gave the project their
> support and patience throughout these years, and to the many other
> developers, whether in the kernel or in other projects, that have
> made this possible. I had a long list of 173 names in the credits of
> the original pull that merged the support into the kernel [2], and now
> such a list would be way longer, so I will not even try to compose one,
> but again, thanks a lot, everybody.

I would like to say a huge thank you tyo you, Miguel.

RfL won't be possible without your tireless effort in working with all
other maintainers, connecting with the Rust projects and all relevant
parties. Your leadership truly excels.

> 
> Link: https://lwn.net/Articles/1049831/ [1]

RE: your later reply, the non-subscriber link
https://lwn.net/Articles/1050174/ should be fine if you pick this up a week later.

> Link: https://git.kernel.org/linus/8aebac82933f [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Probably not needed, but if you want a tag:

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
> I could update the first link to the full LWN article when published.
> 
>  Documentation/rust/index.rst | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
> index ec62001c7d8c..e61524959dbc 100644
> --- a/Documentation/rust/index.rst
> +++ b/Documentation/rust/index.rst
> @@ -7,24 +7,6 @@ Documentation related to Rust within the kernel. To start using Rust
>  in the kernel, please read the quick-start.rst guide.
>  
>  
> -The Rust experiment
> --------------------
> -
> -The Rust support was merged in v6.1 into mainline in order to help in
> -determining whether Rust as a language was suitable for the kernel, i.e. worth
> -the tradeoffs.
> -
> -Currently, the Rust support is primarily intended for kernel developers and
> -maintainers interested in the Rust support, so that they can start working on
> -abstractions and drivers, as well as helping the development of infrastructure
> -and tools.
> -
> -If you are an end user, please note that there are currently no in-tree
> -drivers/modules suitable or intended for production use, and that the Rust
> -support is still in development/experimental, especially for certain kernel
> -configurations.
> -
> -
>  Code documentation
>  ------------------
>  
> 
> base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
