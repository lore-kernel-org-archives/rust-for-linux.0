Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D144E2586F6
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 08:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397221; cv=none; b=snExvvwjO5MSK2SS9C3Qcpj3OHc6KQ4BrkMR6Cl47ucabbv/b+TCMjGtyRqXIRXKlZYjQJ+qmRgJmIf20wGrcvQojeNVESt3qawcYPg4kibUeHQuqxtMeyTBA65n8FLA68NVYBVTMlSnkpT2ctnC1il13O3Yn6E76JSwAu72wY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397221; c=relaxed/simple;
	bh=BUSjh0lFxXUIRIYg/SjVFXpaplWWU3J0vA9OO4StOEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StQo5aG3XMmD4AXCcpyuExSDFYxOOnwH+twsW69cJSIvZUiOhOIzG8wN0ToLwzVceq/oYxPJ8icQV63+R+3ginudFHwfUicwzH7x84NteUDAe7WHptt9/Zb62QBIg+BNwGxAMooIwBwW+43HB4UHlhNMpyT7YP+rL89wdDpzdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Klo2IEpz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Klo2IEpz"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso452832f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745397218; x=1746002018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdQA0CLkraq1AuvbxRbpE3fElw8sj3Gp+Oh8urZ3zAY=;
        b=Klo2IEpz8Ns2V381NDlhyTMAixC18dkFqlMiRojlM9p9gy9A3/uwwibseP6NGnhuq4
         +MHfA5l4AGzG45wOy6Bh5NEo/VDLndgnCIKdfabRHiY9GJlzrd8NId12upyq9Hl5fbtM
         60P8HYOAGNQncgIWqVizeVVUqQ1UYc54vAjEU+eSXpfRQEI8w0L3mIuC4vYUYGy9GdQe
         ZkN7bqOc6SrQq5s2azY7ZCJ9Xd7R5/jhxeyyZMQlLlzMrVafPXjYYtZjwP+peDjgh3ue
         EVLw9ct7ksTu8Jm8O7l4Z7QfdKzWgGVoEQj1n6796HmXVNJsxQ+iXbzs/Sqym1S1y1Eg
         obYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397218; x=1746002018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdQA0CLkraq1AuvbxRbpE3fElw8sj3Gp+Oh8urZ3zAY=;
        b=vyp1m/OkgxV4v3CGouCQWYirT3Lkvj3uWvc3Qz3NEvbdybFwMh4LdJeuq2gs3msXvr
         9KpdcSWwAPky7Inl6sU6flqmRh8f6lq/oiEDRBYWiiFMjWr1vKHheO5LQORhNG9kMbD9
         lqyo6pdHervcGFATAOecVXhw18QpeVnOvl7GhTBkr10kHTInFBW58mNCcbhOj4dgl1hs
         AtwHncC7fBB/Rs7GBFIJFeZw58vpUYa5+rfM1lcudLyu6jbpIffchSYdABpeAlHSi9Sz
         BZsAK3bmZdORnEuO9Tu9nv4ej8nWsnmC3GTGZpruTgl9nbpU8MejjisZKPVqOC7o0BAg
         L+GA==
X-Forwarded-Encrypted: i=1; AJvYcCXT7M724WDGWaZcWdheucpc3jhxOdD41atTeT8rGgfIEqw56HvrIB+uNcUHEPMLPK4El25fQbX8Wi1Uv4oGsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBgn6s2PuTCWdlQ5Wak/AuP8Bmhv3GXuXaw0p55FbdTeIIvYm
	laFUI53MDgCgVeqEQ1ImcXIdX3PiVJD4AIZxNrYkxA1U9Rz69z7tJyX084SUMl/4lOdSG0pXef3
	XEVaqcf5jmJ/5U/J9IkEmZtSkMewHAU4SlRgE
X-Gm-Gg: ASbGncsRmoQkpks/q+7FIdBgn72CrwiqCZOJ0Llnl7X2gy1V/xpV3+ODEkMllyzDpig
	+tTXURFX9tV9Xxd4LBOWRLDCyvnh8mD7qVLbJjG0lGBhyww9TsNZnGBttcvV6H4J8aNjtDjd30D
	rqlxwQKOKubVsLFK6Y8GsCc8yOJY9x1J4D/5W2DJiGNlxe7Mwc/qUKSvslPA/u/9A=
X-Google-Smtp-Source: AGHT+IG3tYu376KIhCsSndKDh5W5hvfIKvAUTboABKPK8G5/7XT+wdQFf7zoWZ9IBgLxtb98yQxMoxzc+s6IfZlppjE=
X-Received: by 2002:a5d:6d89:0:b0:39d:8e61:b6eb with SMTP id
 ffacd0b85a97d-3a067221366mr1544806f8f.1.1745397218013; Wed, 23 Apr 2025
 01:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-6-deff5eea568a@google.com> <6808171f.050a0220.393a1.5936@mx.google.com>
In-Reply-To: <6808171f.050a0220.393a1.5936@mx.google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Apr 2025 10:33:26 +0200
X-Gm-Features: ATxdqUGImfp2bR0xOD5HfkqMs7mwAWwJAreDXNjk4yPoS1Qm9cYgqXb66d-Sc1s
Message-ID: <CAH5fLgh=MCDw74XEYPh4_T9fryrdA=aBLioewe+=biJc8C2PzA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] rust: alloc: add Vec::remove
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 12:24=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Tue, Apr 22, 2025 at 09:52:21AM +0000, Alice Ryhl wrote:
> > This is needed by Rust Binder in the range allocator, and by upcoming
> > GPU drivers during firmware initialization.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index 2f894eac02212d15d902fe6702d6155f3128997c..2f28fda793e13841b59e83f=
34681e71ac815aff2 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -386,6 +386,37 @@ pub fn pop(&mut self) -> Option<T> {
> >          Some(unsafe { removed.read() })
> >      }
> >
> > +    /// Removes the element at the given index.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// let mut v =3D kernel::kvec![1, 2, 3]?;
> > +    /// assert_eq!(v.remove(1), 2);
> > +    /// assert_eq!(v, [1, 3]);
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn remove(&mut self, i: usize) -> T {
> > +        // INVARIANT: This breaks the invariants by invalidating the v=
alue at index `i`, but we
> > +        // restore the invariants below.
> > +        // SAFETY: Since `&self[i]` did not result in a panic, the val=
ue at index `i` is valid.
>
> So a out-of-bound `i` would result into a panic? Then I think we need a
> "# Panics" section?

I can add a section.

> > +        let value =3D unsafe { ptr::read(&self[i]) };
> > +
> > +        // SAFETY: Since the above access did not panic, the length is=
 at least one.
> > +        unsafe { self.dec_len(1) };
> > +
>
> I think you need to move this line after the `ptr::copy()`, right?
> Otherwise, you're using the *new* length to calculate how many elements
> you are copying. (For example, in your above example, self.len is 2
> after self.dec_len(), and the the following copy would be copy(p.add(1),
> p, 2 - 1 - 1), which copies zero data, but it would be wrong.)

Good catch, thanks.

Alice
