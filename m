Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B0116C850
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Nov 2024 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069468; cv=none; b=A0L+QLu3vb5kveDjJ5cq94N4KslT+kV4m3YaKmaPdsOsN2A+7L2H44JLS09Dc48F8uUP4V25RGJnoAqAA2ccjOEL+iKEwpWPwrV6ksNKnT7jwEeUPnlazHfPT6528YXnf0TQgBKpQjDutX6h8d+IL2+XUopKf5WaqKiYgN/oU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069468; c=relaxed/simple;
	bh=3hRiYMNKL2rlk9OfrmSXuFoemrmVhvI087tdQ0bmX1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtXdC25pC2MSLSEIrI5176A01zZ4ZgMnyt9hzvzo2C5XoMkSM+qiPcUL5eJNADAo/5PHlNpSYG10nTH4oZWcJfr+k3zVrFvOjsz6otGyOgA3EM2bddmvOT0hkKIInT1Vhp1xD2ojj/ZzpFbfHEqj4aB7+0y16IOK1SqC39V/qeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=et7gIF/j; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="et7gIF/j"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso1814517f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Nov 2024 04:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731069465; x=1731674265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEEI2hdw6EeKS40KZ7XpWp2TtHfkib4JXKZPiDzGo7Q=;
        b=et7gIF/jJ3p3BnHsHCOzrl1NcKJXB+29gisIwGjBdzV0uBpG12veDPoa1q7QasNgHj
         8/PpcziikhB92zyqcYfe9jfBOabs+0SlaCltf7LMhfNEZgEaL5+dtC8tfsV9IrIABr/b
         k4tcC5B2uvv9JvEG1PpQvL03BZ3r9TxOeALVhKSL/RJTBMvjMf+epj9l+D3esDoK3M5/
         wC4Br7d8UqxWG+3ITRB8Cj/d1ImqcXDKy0L3P++yQc/wFHX4cb7RcGXvtzDZTjTdeuYt
         k6SrfdKvgFxGi9sshNIXZYYQQJKl1xLUm1r/Q/8LeAALL3LTGExH/l3qimkr8/uCnorG
         smjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069465; x=1731674265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEEI2hdw6EeKS40KZ7XpWp2TtHfkib4JXKZPiDzGo7Q=;
        b=UCFg9hvIl/NyQtS5yVRuTFDRmDPufanJynYBAcs8joHjGozajWOaiwZ29661zR7URU
         MpoIcqPoCS4mjN8O8FwrJ75W8a3OrcHFmAl5kvxyveoTDEBXLm3q90Sn1VYSZxrWh4ue
         /HF+FKff1vwFb47km3hFjfrHRFr/fIEYWdj6ayVeX1UydP3v2Nx7IoSwmh8TeMbUzmdD
         Gic3FwyW4yJ/c2bhK3mdF0VnSIvAkdwaxrNafjBNKSxRr4KvRkImLK1STUaJNMb+YDW3
         8zmpKHEwC71fR04yTCLb5PHswa9l8YjcMxZ4ooOLtJLUF1Qq3zXl6zvvw0oy5mJs68dJ
         yiuA==
X-Forwarded-Encrypted: i=1; AJvYcCX7+dgQwUXEyfKNE5ykrOnooAnCXw1JWRepPmdzyaEXHDX3J//ia2/ymtJVNTj1r00OYo04jPaHfSuCHtyqww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7bLzq6UNGAgzO8MPJ9hj5Yv2Gt3IK+LIwEenqlaIVp2Isb6+x
	qWU3v0NgbOD13D6guSPv4l7hoA8MR7SmnZh9Tm+wAo8aHU670ioc+7gNRDSXH9vHhhDBnN64lmN
	geN9eBolOasHG2gE6tG3mSsgkplXWRU7UMb1D
X-Google-Smtp-Source: AGHT+IEQq3fvjVc0Pfh+o4nbT9M7AYxhKf9RFYQJk4AHn9mRdQ+iwK0Ztw5o55NOr3GW/QktNrTuxR0ggZycWjziGRk=
X-Received: by 2002:a05:6000:1868:b0:37c:d1ea:f1ce with SMTP id
 ffacd0b85a97d-381f1871ae1mr2592768f8f.25.1731069465450; Fri, 08 Nov 2024
 04:37:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104-borrow-mut-v2-0-de650678648d@gmail.com>
 <20241104-borrow-mut-v2-3-de650678648d@gmail.com> <CAH5fLgiMHE5GXQv8pSR_KYWsa44zr1o_FNrg1mj8QuTvNQmXhQ@mail.gmail.com>
 <CAJ-ks9=Ej0St7XnmvTysdnjPHh6O+4XdYFC6LouwEJR9GpUPNQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9=Ej0St7XnmvTysdnjPHh6O+4XdYFC6LouwEJR9GpUPNQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Nov 2024 13:37:33 +0100
Message-ID: <CAH5fLgi=n-v5C4hH-+uozbiwwWCU_QGzhxfdTXfTyyy2ejJR+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] rust: arc: split unsafe block, add missing comment
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 1:30=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Fri, Nov 8, 2024 at 6:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > > diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> > > index af383bcd003e1122ebe1b62a49fe40279458e379..9adea755a5ad1a7b03f7f=
c30a7abc76c1f966c6c 100644
> > > --- a/rust/kernel/sync/arc.rs
> > > +++ b/rust/kernel/sync/arc.rs
> > > @@ -377,10 +377,14 @@ fn as_ref(&self) -> &T {
> > >
> > >  impl<T: ?Sized> Clone for Arc<T> {
> > >      fn clone(&self) -> Self {
> > > +        // SAFETY: By the type invariant, there is necessarily a ref=
erence to the object, so it is
> > > +        // safe to dereference it.
> > > +        let refcount =3D unsafe { self.ptr.as_ref() }.refcount.get()=
;
> >
> > I would normally prefer to avoid creating a reference to the entire
> > ArcInner, but in this particular case it is okay due to the specifics
> > of how Arc works.
>
> Note that this particular line appears also in the Drop impl just
> below. That said, can you help me understand the concern with creating
> a reference to the entire ArcInner?

Creating a shared reference to the entire ArcInner is an assertion
that no &mut exists to any part of the ArcInner, even though you only
access the refcount field. In this particular case, asserting shared
access to the `data` field is not a problem due to how Arc works, so
it's okay, but the pattern is problematic in other cases.

You could write `unsafe { (*self.ptr.as_ptr()).refcount.get() }` to
avoid the as_ref call.

Alice
