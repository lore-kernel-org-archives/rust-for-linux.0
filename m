Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851D21D590
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747696371; cv=none; b=l6s/o1hxbMNoJNRL8vyxCIH+rs+/8P2XwZ0lfEAixIjkLk1F1Qk0n1WBLmw+KUyiyRvARctvSut1P/UeHxtaYQIoIq9vp/qSN3fw+isKWOAATPKKebgq+i9ZMXwtXZV2dimAj7zQHKYLElvgTRPgAJlsFa+BmDBT/F0pXjDR7wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747696371; c=relaxed/simple;
	bh=87hIp6c78DiL87agGJnXiJJQtjvJP3j41yfq86lXmds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NidGiTXwPLguMtHX2HgIkGEHyjI7MtsT80oV8k1Y18xuOjyTSEnR+e7qWWXfD8xNFxKXooh+yaq30FrqkqdhgwIdhkibZKeX0pt/yJ961W0iDjb0CuUdKgsn2MRf8m3Ijii6X2TCp7Mwdp5KrbN483Wlq/5xYytQlWNjsqtfSd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PTFT408Z; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PTFT408Z"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32911d04ff7so17553161fa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747696368; x=1748301168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87hIp6c78DiL87agGJnXiJJQtjvJP3j41yfq86lXmds=;
        b=PTFT408ZRSKWpUJ368sG1SDa1gADZNp3TAosbCGQEA9nnyA31kXfZfP+U0URl73oKu
         L1NMdGr1MRKQ6NisYXLjDVUTa/8bOBlnU7MYReQ5OjrWiPXXkPIDck/o6O/Ac7BfSwMR
         TLGQsgfCu8ajZh56FP/jPy6j/WERhe3Ar9FPDn5PWrTAbXUvYZVhERMgI0+9U2kLcCwm
         1RKFS5/gQAeq+ANsYm+2e3Q0UYyVWVZ7Ig38Pnm0sJshRgH0JwMcC7RatMiH7lmYWrsI
         oNEOyVtKQVXQytSLwrDf6ubg+CEL/uT82t8eO/TIHY1xrnqlSFqZ28c4ejvVeH9eYP4q
         zMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747696368; x=1748301168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87hIp6c78DiL87agGJnXiJJQtjvJP3j41yfq86lXmds=;
        b=wzsWiC85AGcykO2BTIKK4cwLq+pXnPNUFEZwTrxWVeTe6ilO+WMXGGReHno1XsAZld
         MYZqVn5DdMeslbV7g1871wGgq5VcD49dmVQFXrC1+PgPDdk/GJfXVueNSJ1/ljV98V5Q
         iE+W8cUspFYiYFS3F5NzUR6DU80wizUmHg2vnOgTXmfGFSPKWvIzbuftCA+V2l7cegzD
         McxWsJj7Qy1zQD9ipXuwbT5t2BhwoBr8xfxpFCWaF2x/9izRAUYshaMQYammgizhlfH9
         KHIexO84rU5+MYKVLTat6mXrve9rXABkS/DJ1mBxowuYZNEQK1gxJbg/W9Fj0lK8cx8g
         vzJg==
X-Forwarded-Encrypted: i=1; AJvYcCXxrLHpeM2lENL59r0cdbPh1CQvTYxhb7UoLbGfLC6QUZi7LagMfhgBaIJBfiAdVWNkvWrI6r55c8oviw/MLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/Zli2S8VuZZISgc2uu09kcUVfIztSrGXbZ6G6SLM+BCBr912
	XLPKLcEl5cBga+8s7X/qePpY7p1GaaJhktsfOkvOIpIpuEIxQX5IHONbMitOeilfbDGyNOGUoLr
	nDtIVCiOntnf5yB549ozUa9UdlNa3eq7FJU5bK5RVesmDNzfbX3Hw+nxQOBY=
X-Gm-Gg: ASbGncuOUgtMCEwU5ep9zQb/ocEvyinD5chsAklJ53YLqGhLtsZwcYCpiGo8MgMdBjg
	fEJoi5xuWKcyJsHPTzk3EYDGvmKdGE4E0pj1Xces7DP+aOXGtq0c/g4pMYlaKLnO7Q1pNCXnC+c
	nRs6V5ceIjwGtyoLdmA0/r0YTnnNp2/HS7xT3b5zzbkUHeh5ujORbDS0kA3FAwA0kL2kqkrKVod
	A==
X-Google-Smtp-Source: AGHT+IFxjVvyKOGmjWHJznPp7p3rSwibUJdBaOZqXxE8AhRSbnaIU7l2iziSz1RfAcS4JYwrPiMZ+cyz28rt7IFl+Y0=
X-Received: by 2002:a05:6000:2311:b0:3a3:6715:afba with SMTP id
 ffacd0b85a97d-3a36715b0dcmr8982767f8f.44.1747696357043; Mon, 19 May 2025
 16:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519161712.2609395-1-bqe@google.com> <20250519161712.2609395-6-bqe@google.com>
 <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com>
In-Reply-To: <CAG48ez2WdxXVCzVsAPeQWgso3ZBQS_Xm+9D1FLBx6UHFV1bGHQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 May 2025 16:12:25 -0700
X-Gm-Features: AX0GCFtuAkg0Wlc1J3hEEvQ6t_eM5QI8HhiIJsVxpbsn_aW9f8RIs4Pivn9RMpY
Message-ID: <CAH5fLgiK3T24gf6tjXGGMsjqj17dh0PFbRZboE5oXXp16yOLTg@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] rust: add dynamic ID pool abstraction for bitmap
To: Jann Horn <jannh@google.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 3:51=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Mon, May 19, 2025 at 6:20=E2=80=AFPM Burak Emir <bqe@google.com> wrote=
:
> > This is a port of the Binder data structure introduced in commit
> > 15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
> > Rust.
>
> Stupid high-level side comment:
>
> That commit looks like it changed a simple linear rbtree scan (which
> is O(n) with slow steps) into a bitmap thing. A more elegant option
> might have been to use an augmented rbtree, reducing the O(n) rbtree
> scan to an O(log n) rbtree lookup, just like how finding a free area
> used to work in MM code... That would let you drop that ID pool bitmap
> entirely. But I guess actually wiring up an augmented rbtree into Rust
> would be very annoying too.

If we're talking approaches to avoid the bitmap entirely, it would
probably be easier to replace the rb tree with xarray than to use an
augmented one.

Alice
