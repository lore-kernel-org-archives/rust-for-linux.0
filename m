Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E02D877D
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767426701; cv=none; b=ZF2hni92tQkClln9wE7Q9Hh2dHwntx9Mi13p7gZzzD6jhES7xk/yh22TGjJnijgMF5s3wmiSUB0se8gpsx2AxwuKKYmHMy65mD109Z0CC/p6obgE29QkUTuImf9h6Fb3492VYJGWMIdJmF7UxLinBF1PkRYNN6Z+3xT5/JBy4Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767426701; c=relaxed/simple;
	bh=19xBVuqnrYdDhiT7it1shvOeVEY3bEXzrxkKk1QF/n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRpvQNSrPH23B8ZjABaaIVOSDG/Jr6S2gv+jysXU+loJK5BeZgDiAsEkAqP5g3kUJWByMRqibdTIjVKc3mJIfRo8Lh7iM3VA3FrsuZt6HuqPIKLddyBlxakxzVKJqe6Wrg5RZr2wn91cHc5UQpJVk1vNnyc0ChfyB8o3MDvrVf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMHQ4wyP; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMHQ4wyP"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88a367a1dbbso207945936d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 23:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767426699; x=1768031499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSe5mbifGaBAkw4O5w+D387VY2Pk18+MMqBNgSIAcGE=;
        b=YMHQ4wyPkth0Z0gbJMbj8p6jMb8PHwF/6qdJtuzgubPprEq+badAiG160BplnxJ5b4
         zD4tA4n20V1sX6Kpo+GJA/2fYtukLPiL74EMDzEBqv4KxDfwu5yEq3HPHfsaUmm0bgMX
         bnX+bRBx7rQJZjXljTNnalRu8TxdNiIE+06AK87H7RXZepUVvq+hUJUMWQsMdn1qedYD
         Hs+IIp69JpggsNkeBO0RNa/4K0bFofq34gqHLNjmFUu1QuuPwhX0Rtf/VM/ySIMNyi6u
         f94/Jv0wixK5Ifo2PIqLhRp/zm2oL1ByErC2IOep7kk6wmR13Bc5/ecbNWN4CQVag9yU
         zvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767426699; x=1768031499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSe5mbifGaBAkw4O5w+D387VY2Pk18+MMqBNgSIAcGE=;
        b=Bxn2aZWK68YJ9PZ6JvVCEMr/oGtWCNjB5ga+sgTgCSkOubuTUdU9rZp8NojM22jI/W
         urOBqUrzv0mUD1eCGEWjylYq/u/KS/n/64atTVxSj+Y7XOCeQIiMKXRDNlyfphQLGTGp
         l0XEjjU4qwBlwnA8He4U/qLy4iMSgYXLmvGADVu4JW9v6wT8W3DUAoLJ16J1Oo1ngjcp
         1DXXZkBUuzcKprcVV1iU89cniy+AtQAwoWBelvIfCSB5+3I/89kJugum2i1kCUchoyq0
         TBmYCwi+armSdgYvq8suJCLeUl0GAqZ0aXGJsLj1Ef8/TZD0YHnIXW+2ionEXefC6Dij
         Me2g==
X-Forwarded-Encrypted: i=1; AJvYcCVuu7jN9ucwc8kTcTxFRWa6cBcoE/FTEMxSiW2/lYW1EtlE3TbbWi1dMV/moMqyBIOrK3eNS6zyP5iGXJYYfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzegxtiWR+u0epyQ4TmAhXV+LWSVth/wMtdAu2qgrSkHZ63XgRJ
	VN9n1mkCjCHgdqg0zDVbMBwxSz4Trwlod2eWX3yCBz4x/4EKiR18ZuOg
X-Gm-Gg: AY/fxX5TyJzhT+HjYMm7SNmlDgeQEY7sHaXe0mIIikvrQ5tgfKDJZvkkXalppeOSncC
	321FPdnxZVMnT4lN8SWMroNnS9TIEkUVBJBOEoANjUFN06ylni7Fk0KVpJXhCptiwGeCDlZQN9g
	pApjeeCyh5XFv0qxk2SPHk6EVdwsLAeXiPm8WX4MgypL3KvP8HrPz8ymToWZiUZlE3gnlvuD/v/
	Yr23A7FWzRtbKXIFIULjXpL03+YR2ED95d6JdpZn71o3fTf1Xv5+qKffo1sNfrrXGtK6rA1DE1T
	YyD3o7dpBmmELk2lOnPdcEKCJHvGPVM8QK37tgtV2eT2+mN6GlExL/wI0G25jvHWyhP1hP0s8j5
	b7ZCS91G2WxXElX3Qfbsf+prm80uOsQTd8448o4Iy3/Sd9HXYXD3q7TepsnB6KxiHx1sHBTkyQM
	6MnJsG8YeGystfSccByoq7qsRLJJe6Xwmt4siIrxEzqjkcBDY2dDJ/LI8LVd0883TJ35BNjFVf9
	xVvMt309AzKPXI=
X-Google-Smtp-Source: AGHT+IHVnE3Gab+RuoCwsJKDcAITmaTYqbJZEvHnq0cVUj0bwxxKUqYH0tF+fuYy+2vt7ZYQTFIboA==
X-Received: by 2002:a05:6214:23ce:b0:888:7dd6:c050 with SMTP id 6a1803df08f44-88d881b8858mr602545036d6.60.1767426698745;
        Fri, 02 Jan 2026 23:51:38 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fd37sm313271146d6.3.2026.01.02.23.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 23:51:38 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id A5981F40068;
	Sat,  3 Jan 2026 02:51:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 03 Jan 2026 02:51:37 -0500
X-ME-Sender: <xms:icpYaYERI31KCtdioYNB9fX_YfpRWKzqA9iKWN8SlduU8Ldbd513tQ>
    <xme:icpYaX35ATAPs6vGefL83qKCk2HrnVNcOej-3IZTU172RuHVS0M_YCTSBmvHwqlZ_
    en5KnM4OlTu2lX3qAJBKA7kBx46-MqVujIbzmgjPi851EgzMnEGvA>
X-ME-Received: <xmr:icpYaQKTIzVjrYR-HKd-Tlar8T6Viryhf4RSEQwY6ulfW2NzzpIyVH6KWulU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepjeeihfdtuedvgedvtddufffggeefhefgtdeivdevveelvefhkeehffdtkeeihedv
    necuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphht
    thhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhujhhithgrrdhtoh
    hmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohep
    sghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkh
    hrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgv
    thdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepth
    hmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:icpYac2vu-U1nKov7y4dN0zZz1zyyJ4lPCNsUcDzRN-T630_Al9Aeg>
    <xmx:icpYaUnrxcEL1meY_DVO5LV9cprfM5p5NUioe3x0e3F3pd8dC2gjdg>
    <xmx:icpYaXi3uiVbCZMM-RhU1MKivQP45zRg_ibgOQ1QYXkGLNsJH4L6Uw>
    <xmx:icpYabQ7bcuwdf9vTWpCRPB8Fj7B2atgB8Fd0PUBLRXb7JcF8ksRqQ>
    <xmx:icpYaR9rlhOFwkF9Q6QJ5K_6GB4mH5aSeI0KdWKzTgG4HjhZ65YH7WtL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jan 2026 02:51:36 -0500 (EST)
Date: Sat, 3 Jan 2026 15:51:33 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add atomic bool support via
 i8 representation
Message-ID: <aVjKhRKg-05rjnTX@tardis-2.local>
References: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
 <20260101034922.2020334-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101034922.2020334-2-fujita.tomonori@gmail.com>

On Thu, Jan 01, 2026 at 12:49:21PM +0900, FUJITA Tomonori wrote:
> Add `bool` support, `Atomic<bool>` by using `i8` as its underlying
> representation.
> 
> Rust specifies that `bool` has size 1 and alignment 1 [1], so it
> matches `i8` on layout; keep `static_assert!()` checks to enforce this
> assumption at build time.
> 
> Link: https://doc.rust-lang.org/reference/types/boolean.html [1]
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic/internal.rs  |  1 +
>  rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
> index 0dac58bca2b3..31ac4c83b1a5 100644
> --- a/rust/kernel/sync/atomic/internal.rs
> +++ b/rust/kernel/sync/atomic/internal.rs
> @@ -16,6 +16,7 @@ pub trait Sealed {}
>  // The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
>  // while the Rust side also layers provides atomic support for `i8` and `i16`
>  // on top of lower-level C primitives.
> +impl private::Sealed for bool {}

This line is not needed since bool doesn't need to an AtomicImpl.

Regards,
Boqun

>  impl private::Sealed for i8 {}
>  impl private::Sealed for i16 {}
>  impl private::Sealed for i32 {}
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
> index 248d26555ccf..3fc99174b086 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -5,6 +5,17 @@
>  use crate::static_assert;
>  use core::mem::{align_of, size_of};
>  
> +// Ensure size and alignment requirements are checked.
> +static_assert!(size_of::<bool>() == size_of::<i8>());
> +static_assert!(align_of::<bool>() == align_of::<i8>());
> +
> +// SAFETY: `bool` has the same size and alignment as `i8`, and Rust guarantees that `bool` has
> +// only two valid bit patterns: 0 (false) and 1 (true). Those are valid `i8` values, so `bool` is
> +// round-trip transmutable to `i8`.
> +unsafe impl super::AtomicType for bool {
> +    type Repr = i8;
> +}
> +
>  // SAFETY: `i8` has the same size and alignment with itself, and is round-trip transmutable to
>  // itself.
>  unsafe impl super::AtomicType for i8 {
> -- 
> 2.43.0
> 
