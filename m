Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B36C136672
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755087422; cv=none; b=jkMv+vC1MxzRg7McMm0rkn+FwT24WL6ACGkMFol3SlM2NQjBmfNnxK++WUP1viaKh4dv7ZF4q0Pnp3L8OCwEjZaB0vGnZe6XTt9dbgysdaYHmJOH5oWlOX2a1nQLH/ysyo6H2GUvaezZOjpe1LS5XMOuJUH4PD8EkH/HHYsNWvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755087422; c=relaxed/simple;
	bh=wAo2VqlFlJopjFFfSucdmHCi26JHGsyjifftNs9pg7Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oe2WlvEO8/JabhhPDDlYC9gUbXvkgrmYStNPJtHgYmAyTiYXpzBzprwmnvX02nRxIueK9kpzgfH17fZlbkgMggsa8c9ipQgtNB2mtaNPmEbHFvJGXrtUH4KnMiLXqi7bTk9o8HzcDbP8XEpG7T1g3gIJsE6z0LQJl1hEhF2MA5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJ+2Aba2; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJ+2Aba2"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a15f10f31so4732455e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755087420; x=1755692220; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=azHdJtvoWCo9lbLQNxh8/rKwr+/it+wez+K7ot8lNP4=;
        b=oJ+2Aba2kBOqSoEqwcCZLtzLiRlti6Mky55NLlI4vqcCq/3CGh9EHQC4UCk6rxlCHs
         81Nub0WmJhCtZFm1dTZAgqM9KNtk8X0deKYUoz6nZLcxwoK8wDTRtZkJify9kWQ4waJn
         9T71kO+Z7V4Bpcdtw2X5uQoGxz4y3xNNWhpkxD39SihQc3akA+cBLSysYanZ3gEB5Gul
         2UMTv4UEyLYrs95JXUlhBS2vhIKsOrFWjQNoycwFvCJfom7VvRIb2M/RwJ2DOyMjzMfV
         ICaY4/SeM3sbmBDBvdi9f2AgX449eW+rcPmATny2IAZJSoPDJoosmOkxAald8lGJnHa/
         8X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755087420; x=1755692220;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azHdJtvoWCo9lbLQNxh8/rKwr+/it+wez+K7ot8lNP4=;
        b=tSu9vQRrYwRIx4bfG8aZKHyOY/8ybYNTuaiAAHpFBnZQB7hEv9o0MvAxFw1ycknP6G
         f6MibAA3pVrmfsiz+PjwkGPRnpcnHn2CnSwAdt5jpi1DTntJG0a9IAx6+lz1vjle6pY/
         9P4i6gqLRcJOsEQIl+sN0DiLODSLUEHQvdMtSikgzqHC9ZihHHyQJTOcpkHGOBd7h7eA
         g+j01biInYl5TU6ky83HL4V/XqXzuhzG7Jznmmc+Lkv+7MyeXv/lW7POK95bGw4BSwCK
         NAdXTerVgvs7tOvct1dlvNPyyqJ1dDzmjD5dR42HVb66buRPWq7ieCGOFLlYJ80UqhWG
         BFCA==
X-Forwarded-Encrypted: i=1; AJvYcCVfm0Hu2QEqUxXmD56t9ewu2Cla/bBBMP79M2Jim0jPXxuZp6lN/fCcAKlmEC8UnZaIolcedCM2zs3f1KbcjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxGgWkdxYGCXsIkcCgrA9DYqdPc6sphNT0uSz5i3XTFmwj++0e
	3iJ3Ghpna48j1Yvd7AaattED9kp2u0f8mwVG+Jlehv9uIF1pLy9yDKqZZDaE4ZsYXXy89vfO3Ph
	wSJ14RaYrKAugPBM42w==
X-Google-Smtp-Source: AGHT+IHjmy+UviZ4eW9rsL27U2fQ6FLiqNhcpr1Ge5BkDRbzHCvmzxNi9aapvYSs1nGodQf/yqh86ceebrZUDl8=
X-Received: from wmbdv5.prod.google.com ([2002:a05:600c:6205:b0:459:dc8a:ec9f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40cd:b0:3b9:13a4:729 with SMTP id ffacd0b85a97d-3b918c15ae8mr1790773f8f.7.1755087419665;
 Wed, 13 Aug 2025 05:16:59 -0700 (PDT)
Date: Wed, 13 Aug 2025 12:16:58 +0000
In-Reply-To: <DC19RGJ4EPSK.1QRTOMYUKY34@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250813-iov-iter-v4-0-c4f1932b05ef@google.com>
 <20250813-iov-iter-v4-3-c4f1932b05ef@google.com> <DC19RGJ4EPSK.1QRTOMYUKY34@kernel.org>
Message-ID: <aJyCOstIjMuvzLwH@google.com>
Subject: Re: [PATCH v4 3/4] rust: miscdevice: Provide additional abstractions
 for iov_iter and kiocb structures
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 13, 2025 at 01:39:12PM +0200, Danilo Krummrich wrote:
> On Wed Aug 13, 2025 at 10:27 AM CEST, Alice Ryhl wrote:
> > +pub struct Kiocb<'a, T> {
> > +    inner: NonNull<bindings::kiocb>,
> > +    _phantom: PhantomData<&'a T>,
> > +}
> > +
> > +impl<'a, T: ForeignOwnable> Kiocb<'a, T> {
> > +    /// Create a `Kiocb` from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The pointer must reference a valid `struct kiocb` for the duration of `'a`. The private
> > +    /// data of the file must be `T`.
> > +    pub unsafe fn from_raw(kiocb: *mut bindings::kiocb) -> Self {
> > +        Self {
> > +            // SAFETY: If a pointer is valid it is not null.
> > +            inner: unsafe { NonNull::new_unchecked(kiocb) },
> > +            _phantom: PhantomData,
> > +        }
> > +    }
> > +
> > +    /// Access the underlying `struct kiocb` directly.
> > +    pub fn as_raw(&self) -> *mut bindings::kiocb {
> > +        self.inner.as_ptr()
> > +    }
> > +
> > +    /// Get the filesystem or driver specific data associated with the file.
> > +    pub fn file(&self) -> <T as ForeignOwnable>::Borrowed<'a> {
> > +        // SAFETY: We have shared access to this kiocb and hence the underlying file, so we can
> > +        // read the file's private data.
> > +        let private = unsafe { (*(*self.as_raw()).ki_filp).private_data };
> > +        // SAFETY: The kiocb has shared access to the private data.
> > +        unsafe { <T as ForeignOwnable>::borrow(private) }
> > +    }
> > +
> > +    /// Gets the current value of `ki_pos`.
> > +    pub fn ki_pos(&self) -> i64 {
> > +        // SAFETY: We have shared access to the kiocb, so we can read its `ki_pos` field.
> > +        unsafe { (*self.as_raw()).ki_pos }
> > +    }
> > +
> > +    /// Gets a mutable reference to the `ki_pos` field.
> > +    pub fn ki_pos_mut(&mut self) -> &mut i64 {
> > +        // SAFETY: We have exclusive access to the kiocb, so we can write to `ki_pos`.
> > +        unsafe { &mut (*self.as_raw()).ki_pos }
> > +    }
> > +}
> 
> I think this should be a separate commit.

I can split it.

Alice
