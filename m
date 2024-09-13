Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F812C470
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726260230; cv=none; b=YdIi+ok37E+ooZw4vVUhOyZsa4jObL8Jpk4Nl4aXl6JIHrjznoFYqYv84T5ZhDkJtw07Uh7y0yT9D5rNEjhHxgdtR3jrJk1gBqG04CES3Y7fF2RZ3VmAe9GN3FmO8AIZn8tTGOXWxWUu6N2xtIW4N230icIuGRl2w4PjVZSyByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726260230; c=relaxed/simple;
	bh=S/p3aVAMiJ5riyAqW4au/bT09fMYwG3jx+BtvYgCkkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5OvpBFpKlaVl+8Zbm0vhmlPJr9x5LrMvwKtCyM/5lHN4LO7gKrhGmdAjyQueofaZzo6R+wTAa/7g3m8/1qKZJdf+NOP2CJz+42J2HnFP5BcVNpWaSzZ64R0A7uH55RyCU2wbcPwoKuAaStR/TNsQPyQG5FOGwlywjxhK3BZMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Ugsg5vx5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ugsg5vx5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so12199305e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 13:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1726260227; x=1726865027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lW734B6dGGqgi185LNhncOBlhauaYAtdEaPHNEq/yB0=;
        b=Ugsg5vx5aAq0YdYrCWScCQmRTiNk9zeJH0c1uo4T1PxfVSWWwCD1HcmhYS2+QOJ6S8
         Ie+j7ZJIwLDIY1jYyNc61rrMQLGdGjCEB5ci8vU0RueLmQfpf8fWSLjYgxrpdTtoSRKT
         u3o83Ub4O52UQ8+AxjP4uqSY6ubJmtN35hl60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726260227; x=1726865027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW734B6dGGqgi185LNhncOBlhauaYAtdEaPHNEq/yB0=;
        b=A9Lm6nRiyaODtYf/DgE1DvGNuJxF6aMX6yDpMHoIB+Doy8/M4UYj+ikHfBsj3llyaM
         0bkVazGFYOoAw1Fue9SlfPKaJI7xjapK93synGEaGFI/5v7+ohH8qodc9eL9YWKo34GW
         5LCAEBwanbw3mRR3PnhzQaKE9I5p2OVzVqkT3s/gt6gLPsBPjwefI2ftxYUC5WFwkHCI
         MrdePhjVf4ftqizmJNMYbVhN9udDWCv80B4meZQDZe3INCauv9EMvFzWFdIUvL5z/PoR
         54DllVsOBK7vIdG32umDiuTdVblEr9nIb64b7uSknAXYB6d5bIWfg4mFIDyso/35lJsA
         eH4g==
X-Forwarded-Encrypted: i=1; AJvYcCUKERapWsmhE4F9oJiPSJXFKpY84nYYEczWP4NpskbYdfb4+yJXRu1hI3ybEbOrzaX4yFQLRUfCb3BADPnEIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCCzm5Zv1/lJpmG//RzJba3x3OeYZ8C/QHZ9Bkj+gi1f5t75f
	nNxtZjhtKg7dwsub5hNDO280lTfwwN0fn7+RfPz0/yuSFIcYE2p03BVcqXzbck0=
X-Google-Smtp-Source: AGHT+IHD7Ara0zwFczKqh8iVJkwUGj598PVbMagxYJ5Cq42UbOjHet1lfQHOZ3ZQFCmFt0p8GU1haQ==
X-Received: by 2002:a05:600c:3d86:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-42d9082a638mr31724815e9.15.1726260226784;
        Fri, 13 Sep 2024 13:43:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da2426d0esm1730625e9.39.2024.09.13.13.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 13:43:46 -0700 (PDT)
Date: Fri, 13 Sep 2024 22:43:44 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/3] Untrusted data abstraction
Message-ID: <ZuSkAL8Ulmlx2Xty@phenom.ffwll.local>
References: <20240913112643.542914-1-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913112643.542914-1-benno.lossin@proton.me>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Fri, Sep 13, 2024 at 11:26:54AM +0000, Benno Lossin wrote:
> Enable marking certain data as untrusted. For example data coming from
> userspace, hardware or any other external data source.
> 
> This idea originates from a discussion with Greg at Kangrejos. As far as
> I understand the rationale, it is to prevent accidentally reading
> untrusted data and using it for *logic* within the kernel. For example
> reading the length from the hardware and not validating that it isn't
> too big. This is a big source for logic bugs that later turn into
> vulnerabilities.
> 
> The API introduced in this series is not a silver bullet, users are
> still able to access the untrusted value (otherwise how would they be
> able to validate it?). But it provides additional guardrails to remind
> users that they ought to validate the value before using it. As already
> stated, they can access the value directly, but to do that, they need to
> explicitly call one of the `untrusted_*` functions signaling to
> reviewers that they are reading untrusted data without validation.
> 
> There are still some things to iron out on the Rust side:
> - allow better handling of `Untrusted<T>`, for example allow comparing
>   `Untrusted<[u8]>` for equality (we should do this via a trait
>   extending `PartialEq`)
> - rebase this on Gary's patch to enable arbitrary self types. This would
>   allow me to remove one `untrusted_mut()` call in `inode.rs`. I would
>   expose the `cap_len` function even if the underlying data is
>   untrusted.
> - get more feedback as to what `Untrusted` should make available
> 
> In addition to adding the abstraction, I also provide very experimental
> RFC patches using the API in tarfs by wedson. They are based on his
> vfs-v2 branch [1] and I will not aim to upstream these patches. They should
> give you some idea as to how the API is intended to be used.
> 
> Open to any suggestions and improvements!
> 
> [1]: https://github.com/wedsonaf/linux/tree/vfs-v2

I forgot to add: If we do this, we should really wrap Untrusted<> around
all the copy_from_user wrappers we have in the uaccess module. That's one
of the main entry points for untrusted garbage into the kernel we have,
and it's already in upstream rust.

There's even a very nice TOCTOU example bug in the docs which would become
flat out impossible if we wrap everything in Untrusted.

Also, while I drop some feature requests: I think it'd be very nice to
have a macro or something to implement FromBytes and AsBytes automatically
and savely for C structs from the bindings which only contain linux uapi
safe types.  And also better contain absolutely no padding, since that
tends to be bugs on the C side too. But no idea whether rust can do that.
-Sima

> 
> Benno Lossin (3):
>   rust: add untrusted data abstraction
>   WIP: rust: fs: mark data returned by inodes untrusted
>   WIP: rust: tarfs: use untrusted data API
> 
>  fs/tarfs/defs.rs        |   1 +
>  fs/tarfs/tar.rs         | 143 +++++++++++++++++++++++++++-------------
>  rust/kernel/fs/inode.rs |  33 ++++++----
>  rust/kernel/types.rs    | 248 ++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 367 insertions(+), 58 deletions(-)
> 
> 
> base-commit: d077242d68a31075ef5f5da041bf8f6fc19aa231
> -- 
> 2.46.0
> 
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
