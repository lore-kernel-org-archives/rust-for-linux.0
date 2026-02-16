Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526881EDA2B
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 09:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232470; cv=none; b=QKaMpwKZ5a15RT9sdYTBGNJ8TjKjUVEglGqfKkf6o1dTk4AXH+GT5d57bHD9jhNqTtJ1uXYyvy6eHx8ugxHgCzTj/V2zWJikj/X4OGaP9e0pBH2Sqv5HNqNSigIp+Vh5+jZLNuEg9gkP6/1bSvvrq5mZaz7wFubkodot9X+GFMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232470; c=relaxed/simple;
	bh=uESNrQehw2PaWEb5/sJSYw2DgDRBw4jYVJ7Ut3+F63o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WfmWdheo/GVM1fRXtgf3oJi8jDWH4BpPKdvxFWCWC/6Wi5N0RFzITPPvsHA3+I3vvv8RCNFXclNGNfKz3nsmsK0cigKLK+hviZwJVetDuIvv3pAL8nyZdvI0Oblfw4VsoaXwRfIGD+/BGiM1c2qOCrUlg9JY6eKZmrXtmRME8ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B7yCFdxm; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B7yCFdxm"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65813cc7ef5so2131439a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 01:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771232466; x=1771837266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=APVmnuexgYlYm9KOiPuEkrUPvIg2mrqcImpeCDaBBkU=;
        b=B7yCFdxmT/XQly+crMsVmUOnmwfRZMk/ks67qiUZM/QZD7X920+mFvMTUVRX79Y1jK
         G+bVtBM6ExQNb2OBO+PjHa5EVSsXj0LUsI37qmvn7YLhmjgrG45Zx584xRpnT7ofZ0M6
         /oiy2X3pNowYBoJ5Qtn6uVrWrM7A2JMzIhF9oIJYMU2lFiIbDbrD2NXLVelHyWoMCQRx
         YGB0XvIEeNdjxZGvO8u8Kv15patXVH8D0kt6dO3XNWjAKC/3yvm0x+VPX3vtbjzEEyqw
         08dFBVRrqLFVLqx7A+uthbaqwofVC84R6YAo5BMND0DFiKwmcqAu66i5zEiq9/1Vpl9n
         xCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232466; x=1771837266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APVmnuexgYlYm9KOiPuEkrUPvIg2mrqcImpeCDaBBkU=;
        b=i5AbADgModJxKPSEvcNix0koegdIcRdZ7cetw2b37lLIiuhYk4T2nk1WHgitSdrnij
         kbEulC92K5d/MncNHGsMTSMFPeckejF7ke3nIApUsE4F4TJOoFvH6m+E6Rg1UqAuBXy5
         /8qFzVlPVdsYJIheh1u+c8riqSWXuw+CJhLm8Iv5JS78A+xZaHllSpGIc7J4qgzjwRfj
         mm1USrdzcaKaNwOaA8Pq0PBAwYcP0tfIkeLDAwC2ClAp6z+ek9M33h+HsoWaQ0XxluIO
         E2CPeCW6M2UgKKO8H6t15HSP+DkjrbL0yrNqmFPX1PJpr8gW8GCaVIpN3K9wmYkDac2X
         jLAA==
X-Forwarded-Encrypted: i=1; AJvYcCWmadFUfFqGvpxYzP7EPiQwKTZsnm6XHhKbKOaDfO1BbMgAsyCyyvxhwj0W+YR5DVbvalcgoxmjNeHgvih9VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1wi2xCm5WSLePlGFa7dDT5xZNgUfVxkK68xjQZKuySQrR8ur
	BH4m97begrY0Dk5WARYC4G1QCQnkhC+itr3Bnm/yKlpzW8foSyLly6SyWBtCOleaEYsrH7TxDMc
	hrJD1LMl/J7/Ac0Da0g==
X-Received: from edxf6.prod.google.com ([2002:a05:6402:14c6:b0:65b:9daa:35ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2549:b0:65a:3f4b:947b with SMTP id 4fb4d7f45d1cf-65bb112f4fcmr4663313a12.15.1771232466462;
 Mon, 16 Feb 2026 01:01:06 -0800 (PST)
Date: Mon, 16 Feb 2026 09:01:05 +0000
In-Reply-To: <20260216-register-v6-5-eec9a4de9e9e@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com> <20260216-register-v6-5-eec9a4de9e9e@nvidia.com>
Message-ID: <aZLc0YMHd8C0bVD2@google.com>
Subject: Re: [PATCH v6 5/9] rust: io: add IoRef and IoWrite types
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 05:04:41PM +0900, Alexandre Courbot wrote:
> I/O accesses are defined by the following properties:
> 
> - For reads, a start address, a width, and a type to interpret the read
>   value as,
> - For writes, the same as above, and a value to write.
> 
> Introduce the `IoRef` trait, which allows implementing types to specify
> the address a type expects to be accessed at, as well as the width of
> the access, and the user-facing type used to perform the access.
> 
> This allows read operations to be made generic with the `read` method
> over an `IoRef` argument.
> 
> Write operations need a value to write on top of the `IoRef`: fulfill
> that purpose with the `IoWrite`, which is the combination of an `IoRef`
> and a value of the type it expects. This allows write operations to be
> made generic with the `write` method over a single `IoWrite` argument.
> 
> The main purpose of these new entities is to allow register types to be
> written using these generic `read` and `write` methods of `Io`.
> 
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/io.rs | 243 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 243 insertions(+)
> 
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index b150743ffa4f..6da8593f7858 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -173,6 +173,160 @@ pub trait IoCapable<T> {
>      unsafe fn io_write(&self, value: T, address: usize);
>  }
>  
> +/// Reference to an I/O location, describing the offset, width, and return type of an access.

In the next patch you implement this for usize, but here you say it's a
reference to an I/O location. I'm pretty sure usize is not a reference
to an I/O location.

> +/// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`]
> +/// to work uniformly with both raw `usize` offsets (for primitive types like `u32`) and typed
> +/// references.
> +///
> +/// An `IoRef<T>` carries three pieces of information:
> +///
> +/// - The offset to access (returned by [`IoRef::offset`]),
> +/// - The width of the access (determined by [`IoRef::IoType`]),
> +/// - The type `T` in which data is returned or provided.
> +///
> +/// `T` and `IoType` may differ: for instance, a typed register has `T` = the register type with
> +/// its bitfields, and `IoType` = its backing primitive (e.g. `u32`), with `From`/`Into`
> +/// conversions between them.
> +///
> +/// An `IoRef` can be passed directly to [`Io::read`] or [`Io::try_read`] to obtain a value, or
> +/// turned into an [`IoWrite`] via [`IoRef::set`] to be passed to [`Io::write`] or
> +/// [`Io::try_write`].
> +pub trait IoRef<T>: Copy
> +where
> +    T: From<Self::IoType> + Into<Self::IoType>,

Prefer to use Into for trait bounds:

where
    T: Into<Self::IoType>,
    Self::IoType: Into<T>,

Alice
