Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E619E96D
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 13:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755265907; cv=none; b=QCm9TKsauQ7w3cy1/xbaZ3ioDlKWGUwy4GMvLrOFC5PiULR7tj/gzCfGIFqp5HHCFoeXmdwsGfQV43ePgrvzKSsFmiDLYUOsbrxm3EWOrLwVKp7+qiE7G37yzh4xTc519HUTkZg5PgVlQng/J76Y1pEeo98mktS31Q84Wv6e5HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755265907; c=relaxed/simple;
	bh=py+vR187Mqp8I13kFA3nYONIl/30zwbVxkeEOKXSt8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm8iizgbeaGD2i0TdecWGXsBSc6SBemt7UYPWFruftVKEj3fKOynyj0u45kNCJfvSZAh4Gak6xAFQ0WPq5y9KPqBMDfp5qtDyfpgYa23lba0nfuqy9vlhFmBl5jUIcadwDONSL+Ef3A0UZDq+ickaBvGI8y/OfgE2442JA2nQMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HAcXOuqO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HAcXOuqO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so10271945e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755265904; x=1755870704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=093IlVQTdAFvs60Lglv1mh61RWoRsNADFmPT6VwOqcw=;
        b=HAcXOuqOXn9qZ8CdlcIxvcb6NrliQ29xlXjO7356A6nxuDw9zUAahslqc1yZIq+mHi
         S+r5yxS8rdY/B0fiRkBOcpYkIaRwT/R+Yyg1ZNg4YGAa+v5WLJh6+EXyl8X7UpwDw6SC
         Fv8O7WdHMjdvCTHrrN5FXXpnHSZrl56QHRtDvmC2iD5Sm8gPFLnhHjxHDli6oEBVmKBz
         WESG84K7LAsnDV3DAj4tF+Be6mdH3mwdOMamVP30t2rcUxpqiSdfsQ7sYBVCGxq9SJlu
         PWU/szR3SGiDiOZ/9kOw6Or3lsS6UP1+FIBPI/HBxFIW05KA2Q0ruJ4QiNtxS3Lfn4Yc
         kD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755265904; x=1755870704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=093IlVQTdAFvs60Lglv1mh61RWoRsNADFmPT6VwOqcw=;
        b=fANASI6CP8cWwijVT3e9Sj+BctrZWaGch7/txlnZtRzjuHyl2UvM1Eg/G1XMEtIb8M
         GvNEWRx0AqXoUZluLa+0AQ/A0ldU+hxxiHN9x11QFjkhkSWIaPugW6gmOyoXLbkOzsuk
         CJOuD/6APTRO45WF528g9VPThUDpOvBxD7qVaKHQbO9Zaq8tbdfM6EK0JiT9jG7YaFY5
         wBazo1gWCSI0hHd8+SQxYxTuIHx2P+y6oRCXFrBgLVXphjhu9SN5U78wlCheO3V/0Xyi
         Dp4gMi0euJJL1KMm7S7T7R7X7RQobSBDMHtWASzFYyChft76PNUS4/NHheqaicRvRBd+
         lQOg==
X-Forwarded-Encrypted: i=1; AJvYcCVYdS4b/LGHvkYi+muTS7rJK7RtOrtHoAca3oG3W7w7jVyXI2fe5URsmVFMQZZibqzqylRm9/AT81LF6CnasA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcUyYAF2Y4oAsxDsCem5GTxXEeiGhyPj/xD3NkRQ2u5Bnz5f/
	9aWX8h1uoHxpyuZ/qlgvzJMSPrbT7k+VKeMbHMsNdPala4NsTgi5j66U9ttLzDm1RkWJYrIqFJk
	Mj1Oc/shgOQikihWljA4CFKQzam2PgfmZlai9X94f
X-Gm-Gg: ASbGncsVGSySFkEH4ltTLwELfFfPfb/p0ZEDrnvF0oirnsWZtcCpO9GGkAllIGWTVyr
	TxJN/h/Wdyus+LEZlXPYduCA+x/LlEZxe4PhK2tDYsvPet/eDkuPwyKklC/BRsvjPvnw4v290BE
	Dg0DPy9whuz2o3qMgevRb6qxDz8/R/1OV9pEZxx/X0dgpCf0UGucfKn5uG54AbYZXB8lrSFNZe3
	meHazJwG1UWZpbGwv4AvSFgVB7nZRDQQx7pbhUDpVG6UKlXWhjFGDA=
X-Google-Smtp-Source: AGHT+IFv6jZ3CYzc8+DB8tcb3iOZ0eSeAMRULpcmDGXTdj1HKyqd8QladLBnI4IfXS+FlzQLbMsVXltn+AO6gJPqM/U=
X-Received: by 2002:a05:6000:2481:b0:3b5:f93a:bcc with SMTP id
 ffacd0b85a97d-3bb68a17993mr1756183f8f.35.1755265903498; Fri, 15 Aug 2025
 06:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716091158.812860-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250716091158.812860-1-shankari.ak0208@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 15 Aug 2025 15:51:31 +0200
X-Gm-Features: Ac12FXzFwpjZfyVT_iQ3XLEvKiGOnwXqbtcp9YGn_MuwLv_LAEO4d7-XhWxUDaA
Message-ID: <CAH5fLgiUfZG4e0k6ajkkKo+iaidWHu4dTRfBbgm4Y_CQPGLHpg@mail.gmail.com>
Subject: Re: [PATCH 3/7] rust: mm: update ARef and AlwaysRefCounted imports
 from sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 11:16=E2=80=AFAM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Update call sites in the mm subsystem to import `ARef` and
> `AlwaysRefCounted` from `sync::aref` instead of `types`.
>
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
>
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Andrew, would you be able to pick up this patch? Thanks!

Acked-by: Alice Ryhl <aliceryhl@google.com>

> It part of a subsystem-wise split series, as suggested in:
> https://lore.kernel.org/rust-for-linux/CANiq72=3DNSRMV_6UxXVgkebmWmbgN4i=
=3DsfRszr-G+x3W5A4DYOg@mail.gmail.com/T/#u
> This split series is intended to ease review and subsystem-level maintena=
nce.
>
> The original moving patch is here:
> https://lore.kernel.org/rust-for-linux/20250625111133.698481-1-shankari.a=
k0208@gmail.com/
>
> Gradually the re-export from types.rs will be eliminated in the
> future cycle.
> ---
>  rust/kernel/mm.rs             | 3 ++-
>  rust/kernel/mm/mmput_async.rs | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> index 43f525c0d16c..4764d7b68f2a 100644
> --- a/rust/kernel/mm.rs
> +++ b/rust/kernel/mm.rs
> @@ -13,7 +13,8 @@
>
>  use crate::{
>      bindings,
> -    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
> +    sync::aref::{ARef, AlwaysRefCounted},
> +    types::{NotThreadSafe, Opaque},
>  };
>  use core::{ops::Deref, ptr::NonNull};
>
> diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.r=
s
> index 9289e05f7a67..b8d2f051225c 100644
> --- a/rust/kernel/mm/mmput_async.rs
> +++ b/rust/kernel/mm/mmput_async.rs
> @@ -10,7 +10,7 @@
>  use crate::{
>      bindings,
>      mm::MmWithUser,
> -    types::{ARef, AlwaysRefCounted},
> +    sync::aref::{ARef, AlwaysRefCounted},
>  };
>  use core::{ops::Deref, ptr::NonNull};
>
> --
> 2.34.1
>
