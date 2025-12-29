Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E57381AF
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767009542; cv=none; b=QeY9GRg4GHxOA3wZVDUpy4jZOMNY+TCW+9MaC+N3KuW6G+kOv2yhU/61LFzXzYS1rty0Z2meBR+IUKDVzKBZpQPLYjVcpsI4PVJ7dBwb0di62LtNQtYmlne2Xo1xnoJ7Q4sp6Ec9ncCJwiqpRS2a4RztSITx1+AcfGHr7BN+FKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767009542; c=relaxed/simple;
	bh=QdaHuz4+XalIyIGBrYqJORXm4OdGDdAIaAcu+Q5qbO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUwV/3wZOXCQWOf0VvfOfrBHcX4TM2qr9DkIszU58ansmr1kXTLFSO8iTsOPg59MQ+bz8bkQYYL1tdOxB9ftAOEJ37ANn/pAlENutZ5hPsajjCLaQZMewUvftC8UM5A6XpJTpcOxQSnHShP90+SgMmNj2TRYsP6x0iFmzisW1Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+7Mvv38; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+7Mvv38"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-888bd3bd639so120920356d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 03:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767009539; x=1767614339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwOlffPgoxBlHSMmCKnukNQHZsicEfKa4Lb6NhA2aGo=;
        b=d+7Mvv38OvK/kzyTci6Jc7Tn9ArYXK4orB2ucIM9gxKxAjURb970B5UABsLgbcCs6I
         nr36cA5T6novpUTwypf79QQn4bnhlq8WNwoFz72jSFIlNCtyDR0nAT24cerswolt89RK
         FNTy0os2/Eo0JQcRjPO3JHJLd1LjwVAsyd1NmgWCuj8DxIYM44OROAuTPj9ELxzx5D83
         gkLr7FDrQMqXuWAph1+V+1OaycvrTm2rxKnXKvR7TJSWhS0IAgH/tMmIKNB5AynyFmdg
         YDxk0vpTWjfFy8xAbX/77L7++sE6/OCrfh33JlYp8Zdpsd7Cq801p0EmuGj6Uw1Jg4NJ
         82OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767009539; x=1767614339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UwOlffPgoxBlHSMmCKnukNQHZsicEfKa4Lb6NhA2aGo=;
        b=FWRjkY+4onlTYhd5DCiEmy7JeguQomEcHx0bxrcnB+/u2A3X14rWb/jJf7pttybirG
         DpEUK8WrirnIx8kt95duzKsAJeyVV4JXthSeKQnFzWhWjSj9tetrLW6wP/SdIdbRq8LF
         rL8+Itoh5Jk9QNSp8VR0hWzDJqNnbq53DM+3N+4hU5GJTKWNBPToCg0brqOCinTsaCsq
         DbYUh7hPVX+xydgFMNh4dB9ZzeVxQkjea8n9BkNws7l7CMObzvghQ6uL/+dniCEocS64
         FGT40QnZIAFkvrqmsxL5xhMRc4Pgl7Tsv6b1WM0Sa/qQDiVFluumIZ+Jc8RsnFNRfoK4
         hO3A==
X-Forwarded-Encrypted: i=1; AJvYcCVbCRv3A8G6LCQP+37OPOI0kv3bb0WVvv/kUyg/kpYLj38XA2QmWlnDY1nKyhheY7khf63SXGL+feBn/B2Tug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaiGRBVV9Jt/wT9YkOvMkNhTUWnHUZ57HHlD2DNTw5ik42Q+zS
	xjBWsPP1JwPBJrtw+5/mJ/4CdTuqrF1gciVkKBc/BX3HzHa6i+MsBsOE
X-Gm-Gg: AY/fxX5JH76ChraeCReMFxmsFCqRc3Hpayk8vDSSyg9yKtBU8CcLzq/WsYFiS0NxiU2
	YT+7zubB+JrdnrsQwUigdAvOawhNaM4q8cPZbNdpIR8Rr4oBDEX1gE2TYVLSXVCI38PKdGjgJb8
	P50k6/NQ/Nb4D3tT7I1ZV4Ge64A0HjTUB8ZvstUa0p93WB8ME6XuGsNsk7xmZsR3UYk72YdKXE/
	1wTjRyEEpLC6/jx+G2u6conp//rbw70ipIsv9KDk7FSqAWvxYcQZSTItn0H7Bh6Np6LxNhMgHzs
	C28p40BYbGY5A3J4fpOZNpJhv4PCkw3HrSV2FDYX3wL8CYHLfOhgLzvPzL1KyM/ET73GOG5cS1M
	h8QohYdUvxH5fmb4ixLMABNAZAJH64taPqKux/AB6SYz2Q3g9lzBLG+eG5Dfb8evTsNa6J19NLH
	7MAHbwD0v2Ry+jBlhMt2Wil6itk/tGMxODUylA9vUTMM+ffshAuoLQqQCpx3G2Fflis69em7En8
	XA2M0qK50JN+ogaLANLhqhfbQ==
X-Google-Smtp-Source: AGHT+IFzXq+ynGI24wv1yLcTVC4fQGx1cvQRkqSmIN6hhCsbXSpYjuakUMfNM2gQW1lzdctnUGV79A==
X-Received: by 2002:a05:6214:1d03:b0:88a:316e:dad6 with SMTP id 6a1803df08f44-88c5204d7bemr499292946d6.23.1767009538526;
        Mon, 29 Dec 2025 03:58:58 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9680c323sm219001636d6.13.2025.12.29.03.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 03:58:58 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B4441F4007F;
	Mon, 29 Dec 2025 06:58:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 29 Dec 2025 06:58:57 -0500
X-ME-Sender: <xms:AW1SaVO-ZYcTfkDU2e1aB29NECWBg4LQ1eqvS58QLHKWKpPkhmh2oA>
    <xme:AW1Saec6QuOA6W5HNxFlAH6KU0lOOcdA7AJODtnbBEGWqUHlxIEMuJYpdjAprhhpP
    oV73GYVYdTOpRrG5WuhGQIZVDMQK4-hbT4YU7k17-_cuu0U0fHS5g>
X-ME-Received: <xmr:AW1SaSSp_HukLQU-OASrDG0Hmi1n6iwDD5iI4IwVbpewF-wrnUlTCMG7Tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejjedtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonh
    horhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhho
    rhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrh
    hoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:AW1SaUeoZP0jhsKJpIPxpO7hKk2I5xggGYnzu9hT4SK_Ye8igV8t8Q>
    <xmx:AW1SaTtTbYBVw1QqgKAGjpkn6SMH49s0DfAP3qKIazA0zbRg3SVbXA>
    <xmx:AW1SaYJlfWnkah3tz85LUxbATKqrE_Ud5dbMYnl9rO7CRiVl3WYNCQ>
    <xmx:AW1SafZR5qrsuVXeddwczvojx_Y5IWDZyVxK40l3yGW0db9JShFXBg>
    <xmx:AW1SaTkx_MQIFWzsOYi5WDWP7cPiE-f81RHG7IkLsj14NtISZK_A7vAO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 06:58:56 -0500 (EST)
Date: Mon, 29 Dec 2025 19:58:48 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 2/3] rust: sync: atomic: Remove workaround macro for
 i8/i16 BasicOps
Message-ID: <aVJs-D4V1IpfzR7z@tardis-2.local>
References: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
 <20251228120546.1602275-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228120546.1602275-3-fujita.tomonori@gmail.com>

On Sun, Dec 28, 2025 at 09:05:45PM +0900, FUJITA Tomonori wrote:
> Remove workaround impl_atomic_only_load_and_store_ops macro and use
> declare_and_impl_atomic_methods to add AtomicBasicOps support for
> i8/i16.
> 

I did the following so that we can drop this ;-)

1. Change function names of [1] and [2] from *{load,store}* to
   *{read,set}*.

2. Reorder [3] before [4] to avoid introduction of
   impl_atomic_only_load_and_store_ops!()

[1]: https://lore.kernel.org/all/20251211113826.1299077-3-fujita.tomonori@gmail.com/
[2]: https://lore.kernel.org/all/20251211113826.1299077-2-fujita.tomonori@gmail.com/
[3]: https://lore.kernel.org/all/20251228120546.1602275-2-fujita.tomonori@gmail.com/
[4]: https://lore.kernel.org/all/20251211113826.1299077-4-fujita.tomonori@gmail.com/

I also reorder a bit to make the introduction of helpers are grouped
together, please see at

	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/log/?h=rust-sync.20251229

I feel this way we have a cleaner history of changes.

Thanks!

Regards,
Boqun

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/atomic_ext.c           | 16 +++++-----
>  rust/kernel/sync/atomic/internal.rs | 48 +----------------------------
>  2 files changed, 9 insertions(+), 55 deletions(-)
> 
> diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
> index 3a5ef6bb2776..10733bb4a75e 100644
> --- a/rust/helpers/atomic_ext.c
> +++ b/rust/helpers/atomic_ext.c
> @@ -4,42 +4,42 @@
>  #include <asm/rwonce.h>
>  #include <linux/atomic.h>
>  
> -__rust_helper s8 rust_helper_atomic_i8_load(s8 *ptr)
> +__rust_helper s8 rust_helper_atomic_i8_read(s8 *ptr)
>  {
>  	return READ_ONCE(*ptr);
>  }
>  
> -__rust_helper s8 rust_helper_atomic_i8_load_acquire(s8 *ptr)
> +__rust_helper s8 rust_helper_atomic_i8_read_acquire(s8 *ptr)
>  {
>  	return smp_load_acquire(ptr);
>  }
>  
> -__rust_helper s16 rust_helper_atomic_i16_load(s16 *ptr)
> +__rust_helper s16 rust_helper_atomic_i16_read(s16 *ptr)
>  {
>  	return READ_ONCE(*ptr);
>  }
>  
> -__rust_helper s16 rust_helper_atomic_i16_load_acquire(s16 *ptr)
> +__rust_helper s16 rust_helper_atomic_i16_read_acquire(s16 *ptr)
>  {
>  	return smp_load_acquire(ptr);
>  }
>  
> -__rust_helper void rust_helper_atomic_i8_store(s8 *ptr, s8 val)
> +__rust_helper void rust_helper_atomic_i8_set(s8 *ptr, s8 val)
>  {
>  	WRITE_ONCE(*ptr, val);
>  }
>  
> -__rust_helper void rust_helper_atomic_i8_store_release(s8 *ptr, s8 val)
> +__rust_helper void rust_helper_atomic_i8_set_release(s8 *ptr, s8 val)
>  {
>  	smp_store_release(ptr, val);
>  }
>  
> -__rust_helper void rust_helper_atomic_i16_store(s16 *ptr, s16 val)
> +__rust_helper void rust_helper_atomic_i16_set(s16 *ptr, s16 val)
>  {
>  	WRITE_ONCE(*ptr, val);
>  }
>  
> -__rust_helper void rust_helper_atomic_i16_store_release(s16 *ptr, s16 val)
> +__rust_helper void rust_helper_atomic_i16_set_release(s16 *ptr, s16 val)
>  {
>  	smp_store_release(ptr, val);
>  }
> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
> index 0634368d10d2..1b2a7933bc14 100644
> --- a/rust/kernel/sync/atomic/internal.rs
> +++ b/rust/kernel/sync/atomic/internal.rs
> @@ -256,7 +256,7 @@ macro_rules! declare_and_impl_atomic_methods {
>  }
>  
>  declare_and_impl_atomic_methods!(
> -    [ i32 => atomic, i64 => atomic64 ]
> +    [ i8 => atomic_i8, i16 => atomic_i16, i32 => atomic, i64 => atomic64 ]
>      /// Basic atomic operations
>      pub trait AtomicBasicOps {
>          /// Atomic read (load).
> @@ -273,15 +273,6 @@ fn set[release](a: &AtomicRepr<Self>, v: Self) {
>      }
>  );
>  
> -// It is still unclear whether i8/i16 atomics will eventually support
> -// the same set of operations as i32/i64, because some architectures
> -// do not provide hardware support for the required atomic primitives.
> -// Furthermore, supporting Atomic<bool> will require even more
> -// significant structural changes.
> -//
> -// To avoid premature refactoring, a separate macro for i8 and i16 is
> -// used for now, leaving the existing macros untouched until the overall
> -// design requirements are settled.
>  declare_and_impl_atomic_methods!(
>      [ i32 => atomic, i64 => atomic64 ]
>      /// Exchange and compare-and-exchange atomic operations
> @@ -332,40 +323,3 @@ fn fetch_add[acquire, release, relaxed](a: &AtomicRepr<Self>, v: Self::Delta) ->
>          }
>      }
>  );
> -
> -macro_rules! impl_atomic_only_load_and_store_ops {
> -    ($($ty:ty),* $(,)?) => {
> -        $(
> -            impl AtomicBasicOps for $ty {
> -                paste! {
> -                    #[inline(always)]
> -                    fn atomic_read(a: &AtomicRepr<Self>) -> Self {
> -                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
> -                        unsafe { bindings::[< atomic_ $ty _load >](a.as_ptr().cast()) }
> -                    }
> -
> -                    #[inline(always)]
> -                    fn atomic_read_acquire(a: &AtomicRepr<Self>) -> Self {
> -                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
> -                        unsafe { bindings::[< atomic_ $ty _load_acquire >](a.as_ptr().cast()) }
> -                    }
> -
> -                    // Generate atomic_set and atomic_set_release
> -                    #[inline(always)]
> -                    fn atomic_set(a: &AtomicRepr<Self>, v: Self) {
> -                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
> -                        unsafe { bindings::[< atomic_ $ty _store >](a.as_ptr().cast(), v) }
> -                    }
> -
> -                    #[inline(always)]
> -                    fn atomic_set_release(a: &AtomicRepr<Self>, v: Self) {
> -                        // SAFETY: `a.as_ptr()` is valid and properly aligned.
> -                        unsafe { bindings::[< atomic_ $ty _store_release >](a.as_ptr().cast(), v) }
> -                    }
> -                }
> -            }
> -        )*
> -    };
> -}
> -
> -impl_atomic_only_load_and_store_ops!(i8, i16);
> -- 
> 2.43.0
> 
