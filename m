Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D131A563
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762789185; cv=none; b=pAo+i0fUASmnSG8tHH7QRibOYcnIM1dhUKpTNi/ZE0HQ18l/JvHvr+ovmbjxz/lz4Cp5tKpPr8ixI3qCICpckrZa72PDOG8DLOnWaWRrq7ij37P0uS9hAHBeM1acB0Y6EuIQQ/A4KTrv78kzrT3f+sUP0gJ9vt2dpQKDq8tcYQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762789185; c=relaxed/simple;
	bh=y8+oW4BpVSbnPDBWDAyNy/quFhwrkHTE4fZvjIexV5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACAL7M/kvyEq7mLXMJlTZDHxcQYnQyQSSY2iTITbixj0SBxEQIS41H/0A9P/u++79p6u+U96SI7/OUTXy8YgHticUzlOBgpwFA765aWb3AaHCEJCGV80xXb1ufIyzz1apnhFPBnAZhl9tMzVeYHS0J3UDa/1YdcfiQn0m8g6e/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b68PVF8D; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b68PVF8D"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63fd17f0cd2so2487286d50.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762789183; x=1763393983; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FASU4dx6EURy+M2e80Z0Nb9yY0ZSNLb5gz2QX4rhDlA=;
        b=b68PVF8DZMYMREQ7S0VUW7LKwDZQGfMvQt+ubsxDGeBhSKmWLcjGfulXxPyVzl44iO
         nGdmm09XG1lW17hIseQ8CDRQwQocEX8+srV8C0sBAQ+Ev+n6NkGRXjqO8zIBY62xHlho
         yAKdnKg0RNoOiAiTgVR3jb0071E1x3LPf/7QVbh92UIvywDxIN7EztHuluCXWkqM9ESa
         mamO1IJ1NWPDg7l1qRrpBjhw+1UwDRux1F1kc+n/f6wSVIhbNQSh7x8bj+N5h1B3IIUa
         pBNk+AWv4IXa08zz855t7aGihpLme+YYYRKe05LkFObtVXk40Z27GUL3LWvDzjpQ0yC4
         KIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789183; x=1763393983;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FASU4dx6EURy+M2e80Z0Nb9yY0ZSNLb5gz2QX4rhDlA=;
        b=n85G84qF+ov2cn5GETX9HicJ+//sTLyefx8LFOnxwfFOi4nYvGY2tuNRSH6Z3eJTN6
         4L+7CY7RXgKX9j2+MI+FJKetfwYMuynwz70fLKAqAl6U2YH4hIECdLMP0Bo7dWghinr6
         lbuV8UBSJyWqfoO7LUQC1fkxRRKXnImkMeK3HpPBGSaK098udQcNRg9hxVsel4E3Mzy0
         bUwqsZBw7RDXYC6La+tDsj2bF9vHdIVo1BgWq67aJO+EIxXMNRgj40syhHdX/2HbIrU/
         sxhLFofhN3A+koN95TOfWkYf8wl8UVaJ+JeI8n89p/W4d2SsWjPQJMLAwrI7v5kcIqA8
         GQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSFD1EC6z0kMAjlQXB+BZQ6aeJnEhL7fnbYVjMLeqC7dgIZR0jQQBJADgjf+p0qdj86W4u/Z1Fbfy+xoGXMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUWXWiThM7LJdsHhPUrKP3ylTTAzvnQmrMa0uOLbdMNd1M7iC
	UnKkoxpVjSdHOw1ujfvoACdpp+7wKjxvN7g/xCcqzi/y9LobNeeSDk/J
X-Gm-Gg: ASbGncspE0sZK2c85Bb5T2rSdrNKvM8BozuDw2RMI/COqh6+SAAHmXnhr4I0ksdVBQ6
	tkmXZlK7jq6rB8WWflA99gT4QBgxyQW7JK5iNRTYpbJTsG5M07RjEsAfgWlYch19I57BQcB4lVE
	CHtli+wyIxNCRdv9ZIAErUhAkK5wQiOtgGZa1qhmM96ZlObtD0K8ReVoQjhMxJIZ3uHRNbQwyQB
	gqioCuBVhUoc0dGA91v5q+sy+R7LxC68pdP6w/XFV8qsIZgTbddiH0i+Ceh9WebmMKPXYfloAFU
	CXaN6YdJZhyrggyxgL1UVJGcnQPC+orlrzyfjyT43jPrfFLAFsancxMH/01znY6OMNEPEX+JtqR
	0uqXR0ETGhoa8zibLWEmD25XKi9ch5HHsgZsmACcf4hIDGhadW0Pn8LCiYeBhQ5P9flsHrZq8pA
	GWR0UInmkiKvfr9BTR1Z4BWS7QaEvAvqBS
X-Google-Smtp-Source: AGHT+IGCUox57ngzJKqlz8EasfckHVK3H0DWRuy+AMjhHC6RYsh5rw1IdG+SJKTmex3hRuvNLSgzLw==
X-Received: by 2002:a05:690e:251b:10b0:63f:b4a1:5408 with SMTP id 956f58d0204a3-640d45cef1bmr6789933d50.42.1762789182727;
        Mon, 10 Nov 2025 07:39:42 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-640d31fc898sm2797916d50.2.2025.11.10.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:39:42 -0800 (PST)
Date: Mon, 10 Nov 2025 10:39:41 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN
 constants
Message-ID: <aRIHPX4d_CF-wfhY@yury>
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
 <20251110-binder-bitmap-v4-1-5ed8a7fab1b9@google.com>
 <CAJ-ks9kvMQ9tUMZyM07jRr8O+pJ6RRvCZodenB==tzDChhHT=A@mail.gmail.com>
 <aRH0oRU5JXKpAKpB@google.com>
 <aRH-ScufjvGYPx5W@yury>
 <aRIAp3LHs0NsEKvL@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aRIAp3LHs0NsEKvL@google.com>

On Mon, Nov 10, 2025 at 03:11:35PM +0000, Alice Ryhl wrote:
> On Mon, Nov 10, 2025 at 10:01:29AM -0500, Yury Norov wrote:
> > On Mon, Nov 10, 2025 at 02:20:17PM +0000, Alice Ryhl wrote:
> > > On Mon, Nov 10, 2025 at 08:59:36AM -0500, Tamir Duberstein wrote:
> > > > On Mon, Nov 10, 2025 at 8:06 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > > > >
> > > > > To avoid hard-coding these values in drivers, define constants for them
> > > > > that drivers can reference.
> > > > >
> > > > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > > > Reviewed-by: Burak Emir <bqe@google.com>
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > > ---
> > > > >  rust/kernel/bitmap.rs | 16 +++++++++++-----
> > > > >  1 file changed, 11 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > > > > index aa8fc7bf06fc99865ae755d8694e4bec3dc8e7f0..15fa23b45054b9272415fcc000e3e3b52c74d7c1 100644
> > > > > --- a/rust/kernel/bitmap.rs
> > > > > +++ b/rust/kernel/bitmap.rs
> > > > > @@ -149,14 +149,14 @@ macro_rules! bitmap_assert_return {
> > > > >  ///
> > > > >  /// # Invariants
> > > > >  ///
> > > > > -/// * `nbits` is `<= i32::MAX` and never changes.
> > > > > +/// * `nbits` is `<= MAX_LEN`.
> > > > >  /// * if `nbits <= bindings::BITS_PER_LONG`, then `repr` is a `usize`.
> > > > 
> > > > Should this and other references to bindings::BITS_PER_LONG be
> > > > `NO_ALLOC_MAX_LEN` instead?
> > > 
> > > Ah yeah it probably makes sense to update this in a bunch of places.
> > 
> > Yes, please. 
> > 
> > NO_ALLOC sounds a bit weird in exported API. Maybe NBITS_INPLACE
> > or similar?
> 
> Ah, good point. We started using the "inplace" wording in other places,
> so lets also do so here.
> 
> > Also, at this point we're really close to:
> > 
> >    pub const NBITS_INPLACE: usize = CONFIG_NBITS_INPLACE;
> > 
> >    union BitmapRepr {
> >        bitmap: [usize, BITS_TO_LONGS(NBITS_INPLACE)]
> >        ptr: NonNull<usize>,
> >    }
> > 
> > That would be a very useful addition for some particular scenarios,
> > I believe. Even if you don't want to make it configurable, let's
> > keep this option in mind?
> 
> Actually, one option here is to define BitmapVec like this:
> 
> pub struct BitmapVec<const INPLACE_LEN: usize = 1> {
>     repr: BitmapRepr<INPLACE_LEN>,
>     nbits: usize,
> }
> 
> union BitmapRepr<const INPLACE_LEN: usize> {
>     bitmap: [usize; INPLACE_LEN],
>     ptr: NonNull<usize>,
> }
> 
> This way, the driver can specify this by saying: BitmapVec<4> for a
> BitmapVec where the inline capacity is 4 longs.
> 
> And if Binder wanted to make that configurable, Binder could define a
> constant based on a Binder specific CONFIG_* that controls what value
> Binder passes.
> 
> Since I wrote `= 1` in the struct, you may also write BitmapVec without
> specifying any number and get the default.
> 
> It may be possible to specify the number in bits rather than longs too,
> but then we have to decide what to do if it's not divisible by
> BITS_PER_LONG.
> 
> (But in the case of Rust Binder, the value we want is one long worth of
> bits.)

It's better to define the actual number of bits. One reason is 32 vs
64 bit portability. Another one is readability - when dealing with
bit structures, it's better to think of it as a set of bits.

Those providing unaligned defaults... - you can drop a comment for
them. :)
