Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE19528A73F
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753266354; cv=none; b=oKPo4YHlEITC+3xSJnXn+33AMFDsygzt7pbu1QjPk/H5aq6+toAEd6/msMPmOs5dE11kRFiSDK2mArcRfMJoqrXbJm68rSNRi23UAKJD6/aNuc6swRJ9e6I3AR514/Wi8ZMB33rQvX3X5gzlAjQawOpOHUZuOXSjOvNpj/WH21Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753266354; c=relaxed/simple;
	bh=VVjb6DUrAuickZ0G9yw7njNk5OG9V6OqIV0LVoFQeRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRCJmNvCi0kA1o0lsf5DuRfMi03CB5GR2y8KSZ/NV+yPWElnv60N9e491XtS5BdkodyFXPaQt+GoxhJEG2DWtUaq+CISg3FTkFJMSn5ij7HjI+Q2E30jO6MmhiZ5EGD67VHGSiYxYI6RNaFPy+YuOStKo2SYbQO1w7CTLV4iwIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=0/GAdPYh; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="0/GAdPYh"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so1316517266b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1753266351; x=1753871151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ga6K4SG1euhWTtbAS3BVYAi++JrAr1J3Z67aIAYOeBw=;
        b=0/GAdPYhOG1SFsyVKTbvnlBQBb/W0Tynp3T3qsI4s0sruMzqXhLWqBNQvuM6Tcdi6t
         YkR7vetJ4r37Dfme6dfgVZ5GEJVX3G3v0GxGxuajNlu1AaT9t0q60piJsN0eJvp0u9O2
         1igUgPmcH7taPEmM/4qjnmyXzHakKYr6d3qCfQ7n2s4/Xu9aCwPpL1NUsp8RDlvCR+5g
         FoQ61xcJC1PX6ShY2SUJDc316IcVj2mTKR6PeekoIT370LHZbigji0UAq4kEl6XS+ZL6
         P/KDuhuwTAkGG/PBeO9I/S4RgRujDXjiXuAVLhDp86hXlJrr5HwGA7J6I6wtMCX2P3j4
         Yn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753266351; x=1753871151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ga6K4SG1euhWTtbAS3BVYAi++JrAr1J3Z67aIAYOeBw=;
        b=nGXSAx3pu5VMGr1c6QyW/GWQ8UOUnxyjZfIJby/0YHTJKejOgX5Ie59Ypx4Bgz8zRr
         9IklmPu2bh0LytkKOWxcNg8qzBppKjnF8MdZKTFrGeaXZxig5tSIgAbOJ/8c/GvPYHvE
         oI9Eyr5Lc86U81RNP/MerJA6MghLZ+KSfS9g2tlD86544DHZ7ZQl5sFjDnaPu2G+Xlel
         jwaFCcTAas/MKqZQk1D1DvsAE/CoLMCdyJjB76+AqKYkEWMHkHJTC7Sw8JRdDkSBklPY
         YhFYQVOcsjoah40Um6MRQZm4f9nFGnuiKyy0MLnA/QlBOTh4hFGwxHBaxbDH+OsvdNT8
         9G7g==
X-Gm-Message-State: AOJu0YxRXAuwMqQRcDOeMVjdp0yuNszg6WQlVXsDgq08VdFalD6idfzV
	XoOUt8hdQ7Qy/rtvf9Sy303QhoU/Sx2rPt/b0NuH83GIfj1YIf7+spqfwf4cCzWoSV4=
X-Gm-Gg: ASbGncsP0UeRUDZJtKOvpSNYFyaxCy1iId5Fd/PnAUaacUkiA2AyGaFg2CosVn4hdiC
	yI2EEbGr5eOL28PVRFFmerJNNtWSN3MlvxXOnVHVJ1kw+1tDh0BqxCL1Fi9nkwaCSFjEW5URmdz
	Hvz5MTgQGQVNE9I5GGkJIWlmfj53BCs1+ee3y1VSM1EmTlLamNM57/covBEwDAGXilAtvtJRtF1
	u4N5fH6DtvJC5yMBDgM3X5/Xg48Z+RMpjENG1AHfwFncaLRhAaBC7Z9gsZVX1UxDGag0g9BM6+Q
	5/Wupcnt1TvumEaqVRG9Sdp27cx/nu9OZIt5lRRMPE0qR8cwYHUL2SnMAIwSWnTqamkvgyl2TOV
	p/482J4j4gKhjzTHgDprwu6akeif5m34f
X-Google-Smtp-Source: AGHT+IGIX5w14miEveZpwRaz+qEMxxSq+qAWW1H+PTbm9ok6gDczq0hGu6EbnXSMSPUh0wki0hGG/w==
X-Received: by 2002:a17:907:1c15:b0:ae0:da2d:1a53 with SMTP id a640c23a62f3a-af2f8d4d327mr227744266b.42.1753266350622;
        Wed, 23 Jul 2025 03:25:50 -0700 (PDT)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7dcf71sm1029261366b.64.2025.07.23.03.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 03:25:50 -0700 (PDT)
Message-ID: <9bae0d3c-7900-474a-a0af-d2f90ec65012@sedlak.dev>
Date: Wed, 23 Jul 2025 12:25:49 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: sync: extend module documentation of aref
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Shankari Anand <shankari.ak0208@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250722121441.224439-1-lossin@kernel.org>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250722121441.224439-1-lossin@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Benno,

On 7/22/25 2:14 PM, Benno Lossin wrote:
> Commit 07dad44aa9a9 ("rust: kernel: move ARef and AlwaysRefCounted to
> sync::aref") moved `ARef` and `AlwaysRefCounted` into their own module.
> In that process only a short, single line description of the module was
> added. Extend the description by explaining what is meant by "internal
> reference counting", the two items in the trait & the difference to
> `Arc`.
> 
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>   rust/kernel/sync/aref.rs | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index dbd77bb68617..1c212238c0e5 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs
> @@ -1,6 +1,21 @@
>   // SPDX-License-Identifier: GPL-2.0
>   
>   //! Internal reference counting support.
> +//!
> +//! Many C types already have their own reference counting mechanism (e.g. by storing a
> +//! `refcount_t`). This module provides support for directly using their internal reference count
> +//! from Rust; instead of making users have to use an additional Rust-reference count in the form of
> +//! [`Arc`].
> +//!
> +//! The smart pointer [`ARef<T>`] acts similarly to [`Arc<T>`] in that it holds a refcount on the
> +//! underlying object, but this refcount is internal to the object. It essentially is a Rust
> +//! implementation of the `get_` and `put_` pattern used in C for reference counting.
> +//!
> +//! To make use of [`ARef<MyType>`], `MyType` needs to implement [`AlwaysRefCounted`]. It is a trait
> +//! for accessing the internal reference count of an object of the `MyType` type.
> +//!
> +//! [`Arc`]: crate::sync::Arc
> +//! [`Arc<T>`]: crate::sync::Arc

It got me curios. Why is it required to declare the doc reference for 
Arc and Arc<T>, but not ARef<MyType> and ARef<T>?

Is it because ARef is in file scope but not the Arc?

If so, you could just add

	use crate::sync::Arc;

in the file imports and you wouldn't have to duplicate the

	//! [`Arc`]: crate::sync::Arc
	//! [`Arc<T>`]: crate::sync::Arc

And even cleanup it a bit by simplifying

	[`Arc`](crate::sync::Arc) to [`Arc`]

in the AlwaysRefCounted trait.

Thanks!
Daniel

