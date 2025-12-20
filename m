Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C492EB85E
	for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220087; cv=none; b=YfWZaD40HewysIX6gJqAnET9q91kgsqEfuw50zm+6UzcSHykXNT/rEUaT4KBkdMizlnwWQ5bYjPStzR6NFuB7eX7YHyeY+IgqoJihPhK9moLX26hCFLoGpYhKPRpk5HXpNG2eTUXpI2eXFFS1oneF/Q2zTk7XoOxOfTNpxX3WiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220087; c=relaxed/simple;
	bh=jA8x3+Ev/73DySJ69fZiQRQYow8d0Sy2QpZdncY5jnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKOEg5N90S671CrqgAG2sch23ra8Wi+aWuKHhyp3orRGSwAtLuhWHDwMYRMWvOZNFGNsDZOIDDKvQsPddwAwganTQQLPbfIafxvLXQz0FtiivvM9e2HhBGCr70JoKFz/IvaMn9QWCDqYUKIepB2XT7uDB3cwjbZDDfxX8kPhzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ic3kwImJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ic3kwImJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7a6e56193cso425184966b.3
        for <rust-for-linux@vger.kernel.org>; Sat, 20 Dec 2025 00:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766220084; x=1766824884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWMu34v/hHkSDoTf1KqyJ/0RKvtfdSHBb4H28JDtcl0=;
        b=Ic3kwImJDhqRDpx+YALzM2Glgmuybn1xQ3tmzQyx5BWcI/c1wSmIf2n5YlVHkotsYi
         wIvPTUVOrn6LZ6mCg1EziwsGhJJmEXu9j3hCxAxZYKk6H1yTQO5KKVjcHNsDRl6cG1VQ
         ATjk1Ygnm/cQrTQu7wMmKMNXgsZ9zEhvvxxyydLylQVEHCbNkA0bvdLY0QvCFFiFWbXT
         DLU2xPKbDEihkOK3aycrgYTlsCUNPav+W6KAXiWaeNB8VlcjTbHAhwiFcJ7i8DUouZlP
         z4HM9gWzNC3dqkse9pZIEwJT0+9NVqEIcxZAKYik0aRy4KWc9gbzoyq1gn2UUS4NnZFF
         u6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766220084; x=1766824884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWMu34v/hHkSDoTf1KqyJ/0RKvtfdSHBb4H28JDtcl0=;
        b=alM44g+h4lVu3O2a5R5EDtvghkD8PITLaM1ubXXj3X+nxvq3eef3kVUPvDtCxPl9j4
         bMnMhmpalF84zL8E73J2eIUswGKA0D6N0YC2gXeUsttVxDeXn1/sZdBBcMStouXn9tup
         OBNZ4qKi+Bsw2+D402KNwdH+X8/P21pLS85UAf4BTGOGitSFlBdt8k8VV0yWHlgw6q2v
         og2/GKYkKC/D/5mabkS+iA4Q1huI54pCcXXXERm9XIC7v7r48/GWnjOAViABooe041Zv
         YXh+kn7rXydOIj6z3okOyFNqYctJJNo/EGtLM6KJylDOSxUHDmwjv22aSjkhyGekvS2M
         DFeA==
X-Forwarded-Encrypted: i=1; AJvYcCVPwSTzhp9t6kAzzYS5Sm9hPGTUyot9K5Tm2fOmO0y52HRzSI3Q7WqHkH5lTYERluWBL2waVHokxbuHlUGtLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpgWDKdhReaVQio+WZrSfZRZZSN4nRX1nzZnOx28yc+XzvaU4F
	VUow5dz39Z6QWB6PTXyCzAjrM9tIE0nTMTrvRnGcIiV308PsmNEbwwnjuR/sSDnz
X-Gm-Gg: AY/fxX6FF3jHS0M103tJpyQV2YVYsp4wCvzGtoDW4ofY+ei1zS6u4O/PgFVhkUdeZcy
	MidljWP5RvG7CI38GUOt2KACvIfP8OXgbQKvKuwd55Byl6G5+DHRnjicF2OT9daj/q6hiHpg9pn
	zqhEehxqC+MRS9KCAyl//wcp4bK/39KpCKQQAxudMVdFOgxaDnT4tMZ+ETMehSwcSbYNrygoN/e
	cIvj1ilinPAr2Ng0u2wVAjnuLAkBQh5enzydJOfzGCMsnswEZbCeLqcAAbeh+bxnblUFgizBkJ6
	mBWo3HSAgc/15tkynLtoaMjKg+7LZbFAKr1GtFtVNAIv2Qh6pIAAANgK7vBhmwz2QNm3ua4dmH6
	eKYjPyiZX7m0cpDvT8gg+GXBYzW213Ad1kSuntzbighfJeNG7ztgWxzBMAxtTznEeDVE5Kw+qO8
	ZrwQHDI2ccVml+noOAcT81Tp00DF8YQQPQOvaVUCYv7mQx/1284Zp4ZZeVIbdWTPf2VbJDhz5C7
	MjxoOG+aUh3+jWAxMxLJHBHTXzslx0UfC9LWWqK+J+4WQ==
X-Google-Smtp-Source: AGHT+IHZzjoS9V14RENmLKlf+khQqIifVYxxHt4K4jB0VUyp6GWo7+1rwbjQADCiEESqZ3CgtTPG4w==
X-Received: by 2002:a17:907:960c:b0:b80:b7f:aa32 with SMTP id a640c23a62f3a-b80371da8f5mr551727066b.41.1766220084018;
        Sat, 20 Dec 2025 00:41:24 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:6a92:2e3e:53e0:d832? (p200300dfbf2de3006a922e3e53e0d832.dip0.t-ipconnect.de. [2003:df:bf2d:e300:6a92:2e3e:53e0:d832])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037de0de1sm452672966b.40.2025.12.20.00.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Dec 2025 00:41:23 -0800 (PST)
Message-ID: <9efae3dc-05d5-475b-bc69-250c2186dd70@gmail.com>
Date: Sat, 20 Dec 2025 09:41:22 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: page: Simplify overflow check using checked_add()
To: Kari Argillander <kari.argillander@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com>
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.25 22:29, Kari Argillander wrote:
> Replace the explicit bounds comparisons with a single checked_add()-based
> range check. This avoids redundant comparisons, makes the overflow case
> explicit, and results in simpler generated code (checked with godbolt
> for x86).
> 
> Option::is_none_or() would be nicer, but it requires Rust 1.82; the
> kernel currently targets 1.78.
> 
> No functional change intended.
> 
> Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
> ---
>  rust/kernel/page.rs | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a..a07e6d256860 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -239,17 +239,15 @@ fn with_pointer_into_page<T>(
>          len: usize,
>          f: impl FnOnce(*mut u8) -> Result<T>,
>      ) -> Result<T> {
> -        let bounds_ok = off <= PAGE_SIZE && len <= PAGE_SIZE && (off + len) <= PAGE_SIZE;
> -
> -        if bounds_ok {
> -            self.with_page_mapped(move |page_addr| {
> -                // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
> -                // result in a pointer that is in bounds or one off the end of the page.
> -                f(unsafe { page_addr.add(off) })
> -            })
> -        } else {
> -            Err(EINVAL)
> +        if off.checked_add(len).map_or(true, |end| end > PAGE_SIZE) {
> +            return Err(EINVAL);
>          }
> +
> +        self.with_page_mapped(move |page_addr| {
> +            // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
> +            // result in a pointer that is in bounds or one off the end of the page.
> +            f(unsafe { page_addr.add(off) })
> +        })
>      }
>  
>      /// Maps the page and reads from it into the given buffer.
> 
> ---
> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
> change-id: 20251219-rust-page-check-819ccc39c53a


Thanks, this switches to the early return style we recently discussed
in [1].

I just wonder if we would like to add a comment like

// TODO: replace `map_or` with `is_none_or` once the MSRV is >= 1.82.

like we do in e.g. transmute.rs [2]?

Anyway

Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks

Dirk

[1]
https://lore.kernel.org/rust-for-linux/CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com/

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/transmute.rs#n75

