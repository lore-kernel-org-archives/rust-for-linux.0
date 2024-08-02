Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057D15AD9C
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Aug 2024 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722582543; cv=none; b=kraxTshD+XP4zVjHFqV/ym1DXoGRfoGNj5M6mJPAliVJFrl4wm7cQ3wkZevHsyFIF/tZbJxVHkBoTQ7HF2EQPJP4+X/+w+XIDSAl+ftDhmsO9y7T2LC6jZ0X2BXnO7alcpH563BvCSJ9VAFqrPu+oVPqEEShWg3Jr0cniFrzeXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722582543; c=relaxed/simple;
	bh=w8f4bWfv8QMMf9HK5zaz2GGGR5xiCaSKzaQ4cb6MS+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAQuuClk9pkitKn/C6s/Ke9m8MSdHP9JEVRXJuv94rB8XjdwwXmsSxAfgYrKGENycnWADaZtblCqOlZxffjePE6MqKeSLENZY+CFPZX7sMHoypYduNxYImLxoSZp6C4DSPlMFHKj0gXzCWeywKk+BDOY2zPCC7ynyLFOo9bgm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rmQtq8is; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rmQtq8is"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so10936185e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Aug 2024 00:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722582540; x=1723187340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGGv90E4jZ/60vEt7thNxFzM/O5YoMdiSJ9S3TB3ycs=;
        b=rmQtq8issg0lQ+a05XyK0j83eRAFqSHf13W5Gy9sNhhbgkWa4OzI4cpLyrGbkZUVQm
         xVY2NyIHpiKLipLQabtZw+0v6aePnGzBR++g6kk7OoSf8fmYpvia/I3QFcaRehDXE1fF
         D4o6gIIVRxVaAQXG8wDN5VHEBy5PG6Uo+LSewCpV2cQAo0CJJLu5/2S+cqT/1DZCOgcG
         AirD5AxXltK63j4gtOZUdBErS61lMvdb9doS1x3NXsMZ8q8xOgZZXdOzKDfMSxhfe/lY
         R9FKtDKhgaIyHWfFihB023axRTY0YoG6uHzheFzl2MiXX5uguL9ONVt7oVGnOD9og6hz
         9iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722582540; x=1723187340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGGv90E4jZ/60vEt7thNxFzM/O5YoMdiSJ9S3TB3ycs=;
        b=j4wg/ZsqQ7NdR3qkmhAqKMhtihU2TbjX8BNOEYb74Ffum64pYf6GkaSvBZQENTnC/O
         5hr/nR3G+LG2NWBd3P/8p9tNmEAf9p31WGdQtMneZB2XD7IuCCw0lXCcRtFju6m4pBaR
         xyjCOOUxho6UUX/UxZx3jsNpv7OpRELM1RI7Q5cCphR+GMfVa2/0KwjdkuUttgISXJYM
         jB+J1VESXCrxDC9fQzCq7ShQrrBLXahHGcRvN9nezK1EQRFoJckah29K4bY15BAsrxxc
         7nE+FSLkyHjDLF52zWyIq71Wtqa0zsuoyyHUwidhYzTOywc9pPMV2Lokgre2dq0ifx3a
         sJog==
X-Forwarded-Encrypted: i=1; AJvYcCXxrNTV2bKB/9IxNiMZtOA97wix76MVFO13QFDEkMqfZslr+rO4gmdqnJ2JPqGkirnJtxjS4GYnHzSoiiZTpCMXSO+5HQ7cWk/PsYS3lZM=
X-Gm-Message-State: AOJu0YwkCtWsiyb+3hbFqK51W/Wo9EXXQC9Ci5x+Poc0zajuvm1eH210
	2avNugIJJ3PDp3u12xtDop5r+D2oVnSa6ejqOeah3JlrIyaUmpX2lOVG5xRg2W7OPMXVuX4VDtV
	eUV9wF2Fo7u1Wj8nWQnJGi70tiUbkG2w6QMYF
X-Google-Smtp-Source: AGHT+IG4BdlPACpAxMAkuvrmIrybwbaSNbWlzp5aQ/dx8NtGyv2vSVHH4dIGcI7nj1JZdge7zE3p9UjbZS2U1WFmAAE=
X-Received: by 2002:a05:600c:4f0f:b0:426:5cdf:2674 with SMTP id
 5b1f17b1804b1-428e6af7070mr14285565e9.4.1722582540093; Fri, 02 Aug 2024
 00:09:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-18-dakr@kernel.org>
 <CAH5fLghO8v0wn-uCx1u_zojPLdDH_RMn4BXxLB1ZMJjfpTkbAw@mail.gmail.com> <ZqurvdyDD6bH4H7Y@pollux>
In-Reply-To: <ZqurvdyDD6bH4H7Y@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 Aug 2024 09:08:48 +0200
Message-ID: <CAH5fLgga9TOtZBcJNJBgzRGSrX5JuvdbSrvdYV3w8b7gOAncPA@mail.gmail.com>
Subject: Re: [PATCH v3 17/25] rust: alloc: implement `collect` for `IntoIter`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 5:37=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu, Aug 01, 2024 at 05:10:22PM +0200, Alice Ryhl wrote:
> > On Thu, Aug 1, 2024 at 2:08=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > Currently, we can't implement `FromIterator`. There are a couple of
> > > issues with this trait in the kernel, namely:
> > >
> > >   - Rust's specialization feature is unstable. This prevents us to
> > >     optimze for the special case where `I::IntoIter` equals `Vec`'s
> > >     `IntoIter` type.
> > >   - We also can't use `I::IntoIter`'s type ID either to work around t=
his,
> > >     since `FromIterator` doesn't require this type to be `'static`.
> > >   - `FromIterator::from_iter` does return `Self` instead of
> > >     `Result<Self, AllocError>`, hence we can't properly handle alloca=
tion
> > >     failures.
> > >   - Neither `Iterator::collect` nor `FromIterator::from_iter` can han=
dle
> > >     additional allocation flags.
> > >
> > > Instead, provide `IntoIter::collect`, such that we can at least conve=
rt
> > > `IntoIter` into a `Vec` again.
> > >
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > I'm not convinced a collect implementation specific to IntoIter is nece=
ssary?
>
> For the reasons above, we can't implement `FromIterator`. At some point w=
e may
> want to implement our own kernel `FromIterator` trait, but that's out of =
scope
> for this series.
>
> For now, I just want to provide a way to get a `Vec` from `IntoIter` agai=
n,
> which without `Vec::collect` would be impossible.

If you have a need for a collect on this particular kind of iterator, then =
okay.

> > > +
> > > +        // SAFETY: `buf` points to the start of the backing buffer a=
nd `len` is guaranteed to be
> > > +        // smaller than `cap`. Depending on `alloc` this operation m=
ay shrink the buffer or leaves
> > > +        // it as it is.
> > > +        ptr =3D match unsafe { A::realloc(Some(buf.cast()), layout, =
flags) } {
> >
> > Why would you shrink it? You can just keep the capacity.
>
> What if the vector was pretty huge and meanwhile as advanced by a lot? I =
think
> we don't want to waste those resources.
>
> Ideally the corresponding `Allocator` implements a proper heuristic for w=
hen to
> actually shrink. For instance, krealloc() never shrinks, and it's probabl=
y not
> worth it. For vrealloc() though we clearly want to shrink properly (i.e. =
unmap
> and free spare pages) at some point.

The Rust Vec never shrinks unless explicitly requested. But I guess
it's okay either way.

Alice
