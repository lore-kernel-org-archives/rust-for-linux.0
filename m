Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB02443ABC
	for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748429287; cv=none; b=XthUF7qSiq6qSt9cDLtNRRs8UuQutxDsbpLdgLmo0qIyP7O4AQLvhEr4CaXD5xHwBGc1ZphBADb3wumZwJlInDWdB0R9rm9+u3xNaDzYIJqMwBS6pYLIBcGWArpvdCoB0z9aQxyS6LuKrhiLXB8B144g2WWSoD0PcySjRqYYhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748429287; c=relaxed/simple;
	bh=GKChFsDcw+Y46MQjWaJov+IpvMaL2IyNBWTN7zSJxxI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TSJpyppNMy6igImNiZN5gsq/BbQR/c5DJyD3hOQ5/AxGDNpenG+oyeAhovBMOz7jTaXHeLMnzA/QpoByEN6Bijx+AumxK3MnCsMJyjBQswdu8GNc/kfPpXV0So/uTEAJmCteYqEvQjknfMyHtx3ZorSUuIIMz+U2XCGgzzwiHAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2V6dz8xQ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2V6dz8xQ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450787c8626so2914765e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 03:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748429284; x=1749034084; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MseXslWIESN5tHnFA2S5llFL1rLmy0VJKHTrQ87iTn0=;
        b=2V6dz8xQpTm9W4Zdfz36NRASbeZMVimF3VGsFiuU0rmILrLj02ydlC40JpYA2MNy90
         e7r4eBpU+zuOHUSOEims6bgdncy4YzNd6i+VjItp4l4RYyBkCp71ImcyeafZXEUKSgEG
         t/DEPl+2UMTICSqyPl9Aq5kuqMI3l3NTZEvDMg8ObwGFhkx16SCNLIdZUtBjdfLdiNFM
         4aobRmj/il9kKGSTPQTRC2Ge7tCwb4CBY8TPwzZuVZXhsI6+DEbXGTVu6szWRXpf2rly
         qX3xs3ncwK7vlyMa0ZVOdlPR6gioDTxzKkbmAkq8zJjr2OYsUMEoIRyBA4pw+BTi+UtY
         pAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748429284; x=1749034084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MseXslWIESN5tHnFA2S5llFL1rLmy0VJKHTrQ87iTn0=;
        b=Q3YY24Xzkj+aNHMG8h+dti7Rg5efHpPAx0YGZIOSZQsmgffwvvNk7vlj3EhxaN1hD2
         7v+/L/FyfvqKluTRpX9Vmem7Yi84ydC/q3Vk3RvOu63grorgpBWCt/phrNx//fpX4v+B
         0wAAVGG3WDPRN1jS1K+NxJibff94r7Cvu/rfOmtAJwK4clTNEUgSRxEPJjx8p9FDYmEg
         rgObmKr0R0h1ek1sMzRPlfo8UjBW9n58zs37NTTuuDZOHDVJLlqRgLCmhuztMzgLdAex
         h/NPJDNx5rGClZ5q21A+WHMenqx1shAdN+Zn9V7EsaNWSyj3Y6cpoimOY7G1gqdJ39Lj
         J1HA==
X-Forwarded-Encrypted: i=1; AJvYcCWKpYNI+p2Sz+G3NWXTHcfUUvzx1KDYgeqhD4TKj61vyFKPKYuO2Gp4tg/EiNmEcFf644C+dHSz8BW6oJKB3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbRyzbTpfOT9/wozcf5Mc6Gqc7w7r16axjrDCTi6NcMpb1TIG7
	fwORiwoBkLki/iDGyp6ccB/FPFeGGa1Qy4D7xvA8Reado3wIl2R84CcIJiuewpAFCZFKQ+zNP3m
	cI+rD/o47PFfiaLFGvQ==
X-Google-Smtp-Source: AGHT+IH6dVDytFvG9RgdBHqH+oNE14gXjCVnXTCeprhMgEvUiue8vfMvYXa7VW5hf29gWj7SAYZ68SQZZwyUhTo=
X-Received: from wmbay42.prod.google.com ([2002:a05:600c:1e2a:b0:450:cb8f:62cc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c1f:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-44c9141d8a2mr133464415e9.5.1748429283993;
 Wed, 28 May 2025 03:48:03 -0700 (PDT)
Date: Wed, 28 May 2025 10:48:01 +0000
In-Reply-To: <68364701.050a0220.48858.0017@mx.google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
 <20250527221211.GB2023217@ZenIV> <68364701.050a0220.48858.0017@mx.google.com>
Message-ID: <aDbp4cM3Dmv84bm8@google.com>
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 27, 2025 at 04:13:03PM -0700, Boqun Feng wrote:
> On Tue, May 27, 2025 at 11:12:11PM +0100, Al Viro wrote:
> > On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
> > > In C code we use sparse with the __user annotation to detect cases where
> > > a user pointer is mixed up with other things. To replicate that, we
> > > introduce a new struct UserPtr that serves the same purpose using the
> > > newtype pattern.
> > > 
> > > The UserPtr type is not marked with #[derive(Debug)], which means that
> > > it's not possible to print values of this type. This avoids ASLR
> > > leakage.
> > > 
> > > The type is added to the prelude as it is a fairly fundamental type
> > > similar to c_int. The wrapping_add() method is renamed to
> > > wrapping_byte_add() for consistency with the method name found on raw
> > > pointers.
> > 
> > That's considerably weaker than __user, though - with
> > 	struct foo {struct bar x; struct baz y[2]; };
> 
> Translate to Rust this is:
> 
>     struct Foo {
>         x: Bar,
> 	y: Baz[2],
>     }
> 
> > 	struct foo __user *p;
> 
> UserPtr should probably be generic over pointee, so:
> 
>     pub struct UserPtr<T>(*mut c_void, PhantomData<*mut T>);
> 
> and
> 
>     let p: UserPtr<Foo> = ...;
> 
> > 	void f(struct bar __user *);
> 
> and this is:
> 
>     pub fn f(bar: UserPtr<Bar>)
> 
> and the checking should work, a (maybe unrelated) tricky part though..
> 
> > sparse does figure out that f(&p->y[1]) is a type error - &p->y[1] is
> 
> In Rust, you will need to play a little unsafe game to get &p->y[1]:
> 
>     let foo_ptr: *mut Foo = p.as_mut_ptr();
>     let y_ptr: *mut Baz = unsafe { addr_of_mut!((*foo_ptr).y[1]) };
>     let y: UserPtr<Baz> = unsafe { UserPtr::from_ptr(y_ptr) };
> 
> passing y to f() will get a type mismatch, so the detection/checking
> works. To avoid the unsafe game we need field projection [1].

That looks pretty unergonomic. We can do better than that.

Alice

> > struct baz __user * and f() expects struct bar __user *.
> > 
> > It's not just mixing userland pointers with other things - it's not mixing
> > userland pointers to different types, etc.
> > 
> 
> In short, with UserPtr generic over pointee, we can have the similar
> detection as sparse.
> 
> [1]: https://github.com/rust-lang/rfcs/pull/3735
> 
> Regards,
> Boqun
> 
> > In practice I've seen quite a few brainos caught by that...
