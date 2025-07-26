Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED6119307F
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753546527; cv=none; b=G9yZx9ItM1hbANr7eMrVK31uHEM2SdkhrdUR48jktxQ5G5c7LXprJIHAYTZtmnV8SnwB4VGfbMFL6/wBxwP+eeo5DsXIVgVSfnmc8yYWTlGFK/ZPb+5LOifRATbQ701CbuICQcY1ZhL72lxa8i43F9HIWSIk2IXxUoe1WADk74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753546527; c=relaxed/simple;
	bh=/jh2NetYJEcS7y9hKl9u6ZhaS1tzUUoKm/tRaaJp65g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paE0exJDw3bTOPJh122bAGIcLSlq7yONDx/jj8iSSXBi02gRHQyjZyauuljClGwTgglXUnQyunBp/87cRweK/nBxr6CGEP30/gUYdHysma23v+RO6kOCVG4OkKBDy+jEibrFoqxrMR4EyaCQNyUrTO4L79AsF0LfLXgVNBkSzC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wPqGTQ45; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wPqGTQ45"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so22036195e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753546524; x=1754151324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjXI2/7oThbWzLYU7IbCDr+QFqFWddGsPEoOiITUQfo=;
        b=wPqGTQ45BzFbcz5Ts5xKX6X++SaO6E7Wqt6mKbjbPRLWC9N003UVHG5zi7fSIIzKyM
         yyv3bwV+2ST8X0cVZrbk4M7OWr0DrnpAULHKDcshfdDdGWB0W8HBGMu8Manv/lAVx0W7
         WJmqaVJhigeTmCDR8jxxu02PSch2cQnqVm8h/nqtzCWt69djHo6UX5oD9oFwbTvyf94S
         PpiPbHsWZxIsYNrepz2SdTR7k1btee3gRaHgxFyE2zZy9mIzaf9EW9K70PEi0RKp2J7n
         D6mvLRi2fWaUt0+CkBXaFT9cMIzVXw9mESS6zbZ332ueSzulGAA+gKi0ypdGwxJyEbFI
         q2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753546524; x=1754151324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjXI2/7oThbWzLYU7IbCDr+QFqFWddGsPEoOiITUQfo=;
        b=cbNFaOK1sE14uTEuX/Z2c+IvTyuL3SX0aT/HhpQWGBtckE42Kmw395MtqygUtdssMP
         iSsG1iOscLB0lACsYpN9u8tNXb5LGdxrn7tXL9qrkrWTrzYrEEbwzvNR0SdtU9y5y2nl
         nMYB58ectMmyQISJHx6LnUIwqAHPUsaXa11J7y5bZeMKSfdcmmEvlpPamtY59UVW/ZGu
         FeYApPy2G6fiSg9V5lOYHEgJmp+b+UwjLMkVQLXIpEQLa9+VdoZoS0YeALWycUHtcQpp
         E3myLBbqVYuGimFaOm3foMRIVvPVV3ZhoiU6TyJjccJOjxBLWCcvejruBO24wH+Ssb+T
         jAkw==
X-Forwarded-Encrypted: i=1; AJvYcCVO5NMYxszfrZnTTNDxSpSNJ+Zjv3esYime8rp1YAvr3MQqlyc6PEf7KgUIQzfSQ6GSZsuM6q1X6+CTYByrKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1h9x0g8A6NSHZA58f2OkZLKTFH99q6MYVS9EYvkjsD3aAiT1
	jyXIdjy5t3zMXg1qj5h+kRk7/gmyp+hfgZ1sZqvzN9Olf06B9L944zo/16ggSycfTwZyqbnpfkt
	Ry+m5p9TK5XsqpESs35rn8YsIq0NamvqJGjqJBj3k
X-Gm-Gg: ASbGncuUJqJib2wULPKW4BT037gPbkLKySWsMH5xet1coguRZKkCithHMHWPtozZ7Al
	jaHrWxpE7guY3gOD0XpHbUAtPp015U5EEajeMzq7BUJuOtmQ8vSKjncpas5bH3BY+b6jNKF6lpS
	0GYyNuM5B81i6JGR+r9fDDUvTCuTP8aPbe++KyUgj4VJNfniGS9mvxKc7JwdAdizaF6nM0Zn01+
	UdeyjUi
X-Google-Smtp-Source: AGHT+IGq6r0MeHgvQseFz5cMv43K6MbZdaH5JloddQpsWGT5eYrYGrycXYiguGwgXRqrUoDt0sDmanBfxCMNYLu8MmY=
X-Received: by 2002:a5d:438a:0:b0:3b7:8154:aa36 with SMTP id
 ffacd0b85a97d-3b78154e3camr932195f8f.7.1753546524220; Sat, 26 Jul 2025
 09:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726-maple-tree-v1-0-27a3da7cb8e5@google.com>
 <20250726-maple-tree-v1-2-27a3da7cb8e5@google.com> <20250726165020.46880c31.gary@garyguo.net>
In-Reply-To: <20250726165020.46880c31.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 26 Jul 2025 18:15:11 +0200
X-Gm-Features: Ac12FXzISFN9wsDXMX_LgKfYNxwErnQbej7ZyIa_oJ8UfCOGwdNe7zdwJtk0UtI
Message-ID: <CAH5fLgi-3oT8+5Krzrg5JeagJMm6-8FNVr5G-UAszuhi0qZ1xA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: maple_tree: add MapleTree::lock() and load()
To: Gary Guo <gary@garyguo.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 5:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Sat, 26 Jul 2025 13:23:23 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > To load a value, one must be careful to hold the lock while accessing
> > it. To enable this, we add a lock() method so that you can perform
> > operations on the value before the spinlock is released.
> >
> > Co-developed-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/maple_tree.rs | 94 +++++++++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> > index 0f26c173eedc7c79bb8e2b56fe85e8a266b3ae0c..c7ef504a9c78065b3d5752b=
4f5337fb6277182d1 100644
> > --- a/rust/kernel/maple_tree.rs
> > +++ b/rust/kernel/maple_tree.rs
> > @@ -206,6 +206,23 @@ pub fn erase(&self, index: usize) -> Option<T> {
> >          unsafe { T::try_from_foreign(ret) }
> >      }
> >
> > +    /// Lock the internal spinlock.
> > +    #[inline]
> > +    pub fn lock(&self) -> MapleLock<'_, T> {
> > +        // SAFETY: It's safe to lock the spinlock in a maple tree.
> > +        unsafe { bindings::spin_lock(self.ma_lock()) };
> > +
> > +        // INVARIANT: We just took the spinlock.
> > +        MapleLock(self)
> > +    }
> > +
> > +    #[inline]
> > +    fn ma_lock(&self) -> *mut bindings::spinlock_t {
> > +        // SAFETY: This pointer offset operation stays in-bounds.
> > +        let lock =3D unsafe { &raw mut (*self.tree.get()).__bindgen_an=
on_1.ma_lock };
> > +        lock.cast()
> > +    }
>
> Could this return `&SpinLock<()>` using `Lock::from_raw`?
>
> I guess it has the drawback of having `MapleLock` needing to store
> `ma_lock` pointer but the guard is usually just all on stack and
> inlined so it probably won't make a difference?
>
> This way you remove `unsafe` from `lock` and gets a free `drop`.

I ended up going this way to avoid the extra field in MapleLock, like
you mention.

Alice
