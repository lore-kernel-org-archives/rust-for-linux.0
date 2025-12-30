Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0D3A1E9C
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 22:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767134743; cv=none; b=E8DpSJmPQsy0G7NtJgxyRIzGYW3vUg1fZfpEeVWTl4MK9MHZHe/RefX6I7q/hs/hWQVg1o5r0Md6sx8bftq9whfF/LK8t96W17zb4V4vzKDuPkCHcqKdeICnPKEHHC0JjUFRFAbL+7kFm91eM9+QsOwPijNdJvDojGbtu9L46Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767134743; c=relaxed/simple;
	bh=48BXp9duWstmXM2wwFjUjd74Fd/KCHgqIDUXsjbF5rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spU8DLXTLC9SQoVSVuzWG+lZvlWTEMpwX61rKPz+4NvnCImekTwplKa92mRtNuBpXkOyDjg3UsXlLbm4ib06Zb2CC4wCoNhueHzrZ8ywEdwNE6UQrPiJE5fGB+6ELJLDMSokPLfyJPDboPZvG3oF8e40W8+HcJ6SlzAha5TagMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3R2zfv4; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3R2zfv4"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8b21fc25ae1so1032877185a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 14:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767134739; x=1767739539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK5YGZOzvx/5nggsiNqHVrVY4+9Wea1elwiHJ9WZ9mk=;
        b=k3R2zfv418trZ7EdMTfsfHRQZwxYF7R0b5hPSfraD1aQDuGQTF33J5CpCak0d+UY13
         U5RWAsDRr3bgIqOTgo3qNwM1B4l9KlsspldlzAWYDMROzHbgH6I8EU8FFBMQQh4rq/Vk
         7urXlOJuefnMnAuOq6OMpiFfdIAiDQfazbzcTINpiQQD85u76EstlMcPg+9Lu364Dwdj
         cM9YZCdEHm1cdkY4aHzHiWjIjKXXKcoUVNabqt7gCMDmJtT+NDURFG4NObj9BGpLAvJe
         GVTozJXVC/CaGAV/gigfxYwxQO1Oirv7ruuYE3L0wmU4+WAIG2vdpA54iEKDe+Z+Hn6C
         ZI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767134739; x=1767739539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XK5YGZOzvx/5nggsiNqHVrVY4+9Wea1elwiHJ9WZ9mk=;
        b=R2gpH8Td/ibQuNcavxQEIRVAd1Dyd/iJt8E2G2pj4kJLuuWMtPEtCSIXLJ/z7P7Ak1
         I7YuocnrVzDFuOfO9deZubtYxqwVSWJb04PyQ8YztOGb6abQdygVvXbXzvXOhl2Ky37g
         8pj3bVXjP1tBUJgDB7vEWJg4n2X/8yUjr56gx1I4dsD7JUcOWyJVLwmX4XQ6QDvxcIZa
         fRhT512k3EGChOyCK26RRm/ZXbvUuqfO9LPJq143IaxAUCYAq7k2MfG3jHeee701NHPm
         AMcMUBOInwqFQS1Rlhalxb4ug5On3W5TZ3K/iMZwze4LgPhoZyD0NaBC3wahKri6sNIw
         K6bg==
X-Forwarded-Encrypted: i=1; AJvYcCXC8rIY6BDj1o/raX45m6wfaQJCxn3nUa35yS2gAQBpOsRL36G/jn5Mg98gNhHEQVxTAG1pZq6w/ERBzFURrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNRpSzUM1400sERZYbhicia5LumMTRbaJM7WLiw6UJWzK2P7A
	xcUAjQI6GSE48cgcpp9Enolf25UVHNJXP8GCNTz6hhl6pBaXdTIcqIUL
X-Gm-Gg: AY/fxX6jMxZRPvGeortxpeVlO+/5cNvLaG7nGB8a1j5mMxuDY1wUCNpVXj97n9cKRNl
	cIXkGHYWLDgRSbgBEfjgfYyOYI++OIZcnrRF3H3TH7awV6UUHRWrcXowwCDusfoP3VQr+/TJZK/
	mT78CwtkcsEvYOzRF3y3Dvy5rcQm45aTGf4qdxfQjPdLL2AkZmLZ2GshnAW7vPu1M/W3a2Lvuuv
	1rTVE6V22qLHSXJBbD9yzITkivS5NLEn3o2R0O2TS8F7EZnZkW1HqDQo/KBQgOMpgRv3wFYLvp3
	jEHgW7oASwnk5nlZwJzC6fo1Q7zMveeW5DsQ0cgATfkHZZsQAxjCfmwzaFkskTrwhfXD6+0CIvX
	AFcT+V+oWvwUSlo7pk+9hMd3lxFAwcRlBI5m+fdx+dxg9LbpzeKjnMMTVQwvuPb1rkZt+asSCL2
	JbVh5eFcJDgWU3wQ+oT1rluFkFxhWM6eEUCTgLJAdGEHZG9S7RFoSwKEPDLBZyC1FWVUFEZxoZD
	W6/g9jWTXWz++M=
X-Google-Smtp-Source: AGHT+IESE4crps8PhtSzDrAOWDrm2KzI0zn0B3XfHBbsttw5F1shqymidXfpwmyQaGoA6cgzOQ1H1g==
X-Received: by 2002:a05:620a:4689:b0:88e:4d7b:f5c8 with SMTP id af79cd13be357-8c08f666ff7mr5160819985a.20.1767134739578;
        Tue, 30 Dec 2025 14:45:39 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ee7bfsm2600236385a.51.2025.12.30.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 14:45:39 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 98FA3F40068;
	Tue, 30 Dec 2025 17:45:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 30 Dec 2025 17:45:38 -0500
X-ME-Sender: <xms:ElZUafwy9Ao8FYH3GZ753TYq6nXK-W-GTQu7VN0CRNWSXXvjXO6LIQ>
    <xme:ElZUady8hf3cVnJ3vsnePavLhd9DUcNPrPbGz1_ZOGptLjYShQnvFV8N1sqCkGUDG
    uX3jjZRx8GoT0tt0jiNokE1v6XypWTuAxZDzGvO3AWPkedmmadZwQ>
X-ME-Received: <xmr:ElZUaXUcWZW8v1z9Z35m1zULkRpH3AOGAUVfBB0mJKa410yt9BuosnhBpfxa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekuddviecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:ElZUacSHCGbB9zOXpxAlBkRbP6GpNhcLq_EAAjcVfUhmSRsLE6n-UQ>
    <xmx:ElZUaXTJObZqb-9tpi8_uzJqqbmgRk4KGtpk2kSPiqEZmDTrni5fiA>
    <xmx:ElZUacfxTm65uXhhEC1hML4oue1d7kuthhMDNZUfFV8-loRoN7w0RA>
    <xmx:ElZUaVcJwSHE5xN2SpsH57Qf4qj9enO8snRmV8m3QHbF9zqcMI2qYQ>
    <xmx:ElZUaYZrSQw6Tu8wLSLuPoMkVeDn7skjAX2hIYyYwuQvWpfvEym-rUkG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Dec 2025 17:45:37 -0500 (EST)
Date: Wed, 31 Dec 2025 06:45:34 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add atomic bool support via
 i8 representation
Message-ID: <aVRWDgb29OkHAGnY@tardis-2.local>
References: <20251230045028.1773445-1-fujita.tomonori@gmail.com>
 <20251230045028.1773445-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230045028.1773445-2-fujita.tomonori@gmail.com>

On Tue, Dec 30, 2025 at 01:50:27PM +0900, FUJITA Tomonori wrote:
> Add `bool` support, `Atomic<bool>` by using `i8` as its underlying
> representation.
> 
> Rust specifies that `bool` has size 1 and alignment 1 [1], so it
> matches `i8` on layout; keep `static_assert!()` checks to enforce this
> assumption at build time.
> 
> Implement `AtomicImpl` for `bool` under
> `CONFIG_ARCH_SUPPORTS_ATOMIC_RMW`, consistent with the existing
> `i8/i16` gating.
> 
> Document the additional safety requirement for
> `Atomic::<bool>::from_ptr`: only bit patterns 0 (false) and 1 (true)
> are valid.
> 
> Link: https://doc.rust-lang.org/reference/types/boolean.html [1]
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/atomic.rs           |  1 +
>  rust/kernel/sync/atomic/internal.rs  |  8 ++++++++
>  rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 4aebeacb961a..2c998cbd300e 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -158,6 +158,7 @@ pub const fn new(v: T) -> Self {
>      ///
>      /// - `ptr` is aligned to `align_of::<T>()`.
>      /// - `ptr` is valid for reads and writes for `'a`.
> +    /// - If `T` is `bool`, only the bit patterns 0 (`false`) and 1 (`true`) are valid.

This line is unnecessary, since "`ptr` is valid for ..." means `*ptr`
has to have the valid binary representive of `T`.

>      /// - For the duration of `'a`, other accesses to `*ptr` must not cause data races (defined
>      ///   by [`LKMM`]) against atomic operations on the returned reference. Note that if all other
>      ///   accesses are atomic, then this safety requirement is trivially fulfilled.
> diff --git a/rust/kernel/sync/atomic/internal.rs b/rust/kernel/sync/atomic/internal.rs
> index 0dac58bca2b3..0e12955082e5 100644
> --- a/rust/kernel/sync/atomic/internal.rs
> +++ b/rust/kernel/sync/atomic/internal.rs
> @@ -16,6 +16,7 @@ pub trait Sealed {}
>  // The C side supports atomic primitives only for `i32` and `i64` (`atomic_t` and `atomic64_t`),
>  // while the Rust side also layers provides atomic support for `i8` and `i16`
>  // on top of lower-level C primitives.
> +impl private::Sealed for bool {}
>  impl private::Sealed for i8 {}
>  impl private::Sealed for i16 {}
>  impl private::Sealed for i32 {}
> @@ -37,6 +38,13 @@ pub trait AtomicImpl: Sized + Send + Copy + private::Sealed {
>      type Delta;
>  }
>  
> +// The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
> +// guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
> +#[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
> +impl AtomicImpl for bool {
> +    type Delta = Self;
> +}

I don't think you need this impl block.

Regards,
Boqun

> +
>  // The current helpers of load/store uses `{WRITE,READ}_ONCE()` hence the atomicity is only
>  // guaranteed against read-modify-write operations if the architecture supports native atomic RmW.
>  #[cfg(CONFIG_ARCH_SUPPORTS_ATOMIC_RMW)]
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
