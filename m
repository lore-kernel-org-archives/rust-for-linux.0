Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866B32D0274
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762204864; cv=none; b=QJULLuSg4r8rs5HJOuaYPb9tTSFxDI6+hi3ZAAgohVuqaqDK9Az1c7YsRC+ibmq5TZx6UMyYHrXQfa+qK2x1Igyrjdrb6Uql4NZfNZhSvuI4K4MR8No8mqCV1FOly4vqwjEnjGExa2GpNsKT5vmaFGnisln4ft/lL7xtawsarEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762204864; c=relaxed/simple;
	bh=i9NQQoG0WAodkG2cQoejmNP+ufomDOB66xEEdAsBtaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs19zOv2hBTPVkzGzmj3FEtchGoOS7MuNXTiE1ITe3ZjKyTVqz2lKxLj4bgHM/JbAGhmpBYuwe9bmf66XfWN9La0Yi53jKbSBUOwlblryknMHMUFDl0otQKlUNAcT4Edrs7x3Qnt1yDzRlCZ9qAw6alrMolrQVzzlXLnhMwNrQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8ZQJtmv; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8ZQJtmv"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88051279e87so18767976d6.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 13:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762204861; x=1762809661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+fyoi5TB82zTmtTdng+j8xd0Sq8XLzsS2JilniK7bw=;
        b=C8ZQJtmvIMGSgkqD6j/o+ECPYwo+RiZ1LjqakFikhMdkHnN7lRITnRHyLQIeueuqrv
         LNvE7zby+SwLOe67wu7TLICXZEGr6z1tSHkWVuk5tu2rx6usvN6oxaTRpguuncH3p66z
         yZkZnNBETnN++DkmNMFRo0ORgjOSA9gU0u0b/50Njy04SodUhsIfLiP7OjYBgcuj6AJf
         hzxnO9t22W5+lGPjoWebktj75fK7p6fHgg9Rg20uNkcxY/R6X414eMxryo6zunNyvR8f
         jmuGSwEbRXllzXxT8SNAwxLbtKJscyvit6PeXchVwdQ53zXNi7sLfjfSvo8wwGaVbJFf
         dtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762204861; x=1762809661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+fyoi5TB82zTmtTdng+j8xd0Sq8XLzsS2JilniK7bw=;
        b=EKfcCLExU4tT32OtyH0FsFzOH5Xz+63/xv7c1yfd9YaXZ/qTqS9yQ5NHpJdq83na6E
         AQzHJi5s/PCTF7zbnehGAEAQmEP3Fw8x9Rv+wVncbAqYpfkHkPtuOx85Tn2cawbJX4tB
         HdCwRHVyhib7Aeacrrz8/MFbbCNML+LSGY02eopdLKWwHyNua4mgQUIfTbfQYVzYKpZ5
         qCjFlUZiAXGy9qThimkFvTnm5MqSeLbHphoICGTNzlz59TLZBFEWhXSXM8H9OcbL7/fZ
         Fl430zWEU3WHbjvDIqFKC79sBFKyFN2QutIvakARzf8zqsrpOEKIP662qbF/1qqTdrWc
         L0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVz0DxPeHx/gkQ0lWtFkp0kTEEzJ/s+oVYHNXpqcA2nkArNDYDiP4gVk31P/q0w3dg4ICmUy847iLGc4o5fmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7kHdDjJUT1MemdxcF9xYq2axq7qiXlm3Mry9xt/ETZyk77beH
	4hrX+VioPWDpvVXxyZvDB10ODdPSSwPeHLXYqh8jvh+luEUQ/1IefN3s
X-Gm-Gg: ASbGncvDAOMnrlt2j+3peqV7KFj79k6QfWwkEPQatVdMHYqxzvpBkikRBVJ7D5Y/pd2
	mFrj94IMY76zHGNOgI5/lU2DMqMk/JIRC5cAPV64WLyyf/gx0sn5sn13iTBw+RV0wh588VMuozX
	zZmDKcNN+9ojUM6qS9oaq2PkyjWjGVOMLmnRN37aOfkjjEHxyVLCManwZRNysfSZ8L+0QxZSHai
	zopLJCiIGIbMNRWd2yy1Wxj1n3zVDU323DCAF9pNUUWQg6S0QSOVRky8mZ49K3P8HyKvVWehYxE
	1kqZJxNuW3d4Xf+Db7LXsMqswm++MrWRE1WQa9WVxVRAEjqFOE4cmSzq7wVaZtvgnyoxdTBHV3Q
	DLh7MMTXcknURgK0WEhxpWz8oY3coW81kdF/69EQbuqtCFm0iJkTnKCXAb9gPSvhDXq6B9P/dVw
	HnotUsT/I=
X-Google-Smtp-Source: AGHT+IHnaEAKMgi61yPbVWzk/Uif2pvSAYnMIcXNyjWts9mwpC/T1DSAOow3x1Mx9USJ5wUFa838bg==
X-Received: by 2002:a05:6214:3319:20b0:880:5cc1:6923 with SMTP id 6a1803df08f44-8805cc16b4dmr33476206d6.36.1762204861186;
        Mon, 03 Nov 2025 13:21:01 -0800 (PST)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88060db32acsm9101786d6.3.2025.11.03.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 13:21:00 -0800 (PST)
Date: Mon, 3 Nov 2025 16:20:59 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v3 4/5] rust: id_pool: do not immediately acquire new ids
Message-ID: <aQkcuwLWy5jIQKOm@yury>
References: <20251028-binder-bitmap-v3-0-32822d4b3207@google.com>
 <20251028-binder-bitmap-v3-4-32822d4b3207@google.com>
 <aQEOhS8VVrAgae3C@yury>
 <aQE6FOn_9Z84NMnG@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQE6FOn_9Z84NMnG@google.com>

On Tue, Oct 28, 2025 at 09:48:04PM +0000, Alice Ryhl wrote:
> On Tue, Oct 28, 2025 at 02:42:13PM -0400, Yury Norov wrote:
> > On Tue, Oct 28, 2025 at 10:55:17AM +0000, Alice Ryhl wrote:
> > > When Rust Binder assigns a new ID, it performs various fallible
> > > operations before it "commits" to actually using the new ID. To support
> > > this pattern, change acquire_next_id() so that it does not immediately
> > > call set_bit(), but instead returns an object that may be used to call
> > > set_bit() later.
> > > 
> > > The UnusedId type holds a exclusive reference to the IdPool, so it's
> > > guaranteed that nobody else can call find_unused_id() while the UnusedId
> > > object is live.
> > 
> > Hi Alice,
> > 
> > I'm not sure about this change, but it looks like a lock wrapping
> > acquire_next_id().
> > 
> > If so, we don't protect functions with locks, we protect data
> > structures.
> > 
> > If the above is wrong, and this new UnusedId type serializes all
> > accesses to a bitmap (lock-like), or write-accesses (rw-lock like),
> > then this is still questionable.
> > 
> > Bitmaps are widely adopted as a lockless data structure among the
> > kernel. If you modify bitmaps with set_bit() and clear_bit() only,
> > with some precautions you are running race-proof. The kernel lacks
> > for atomic bit-aquire function, but you can implement it youself.
> > 
> > I actually proposed atomic acquire API, but it was rejected:
> > 
> > https://lore.kernel.org/all/20240620175703.605111-2-yury.norov@gmail.com/
> > 
> > You can check the above series for a number of examples.
> > 
> > Bitmaps are widely used because they allow to implement lockless data
> > access so cheap with just set_bit() and clear_bit(). There's nothing
> > wrong to allocate a bit and release it shortly in case of some error
> > just because it's really cheap.
> > 
> > So, with all the above said, I've nothing against this UnusedId,
> > but if you need it to only serialize the access to an underlying
> > bitmap, can you explain in more details what's wrong with the existing
> > pattern? If you have a performance impact in mind, can you show any
> > numbers?
> > 
> > Thanks,
> > Yury
> 
> Hi Yury,
> 
> This does not change the locking requirements of IdPool at all. Both
> before and after this change, acquiring a bit from the pool uses the
> signature &mut self, which means that the caller of the method is
> required to enforce exclusive access to the entire IdPool (doesn't have
> to be a lock - the caller may use any exclusion mechanism of its
> choosing). In the case of Rust Binder, exclusive access is enforced
> using a spinlock. In the case of the examples in IdPool docs, exclusive
> access is enforced by having the IdPool be stored in a local variable
> that has not been shared with anyone.
> 
> It's true that the underlying bitmap supports lockless/atomic operations
> by using the methods set_bit_atomic() and similar. Those methods are
> &self rather than &mut self because they do not require exclusive access
> to the entire Bitmap. But IdPool can't provide &self methods. The
> existing acquire_next_id() method has a race condition if you tried to
> perform two calls in parallel.

You can use test_and_set_bit(), so that even if multiple threads will
find the same bit, only one will actually acquire it.

> But even if we changed it to perform a
> correct atomic bit-acquire, the fact that IdPool is resizable also
> incurs a locking requirement.

To address resizing, you can use RCU engine, so that resize is
possible only during grace period.
 
> The only purpose of this UnusedId change is to make use of RAII to
> automatically clean up the acquired ID in error paths. I avoided
> setting the bit right away for simplicity, but setting the bit and
> unsetting it in error paths via RAII would also work. But there would
> still be a lock in Rust Binder that protects the bitmap without this
> change.

OK then.

There's still no real users for the IdPool, so the above performance
hints make no practical reasons. Are there any plans to actually start
using IdPool in the mainline kernel?

Thanks,
Yury
