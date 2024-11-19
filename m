Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC221BD9FE
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732011081; cv=none; b=Gb33y/LbuCZTEMI3aVqpgGNUcXHQOPwAKqtaAQ1vqFPJMmjbseEFIn5Fk7SFb3fjvV8eVY6nT3EFZXoN0BqQbukTKOo5lX6CPTWYwCDt9wcinkolVfMeMgoCEnXH7ZDEPrdHNckEo03l1LlyKOWOc6j8yJdPuZAEtPcpoSWqqdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732011081; c=relaxed/simple;
	bh=X/JMDAnNRv+tEobjnb5IhECr5UNDTKRmUVyZ+47rpEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqRSZVA2OKpQI3sgxDU7eGpJaAhF88e3O86qkSuNKauM84luqtc5wqF7RSbuejcrFYg0H9jIt33VMwfC7Q38oSOKF+kPYfSPNVWgbQr6DIBdCZazub8fVJwNo+furbjqU5rCqG+P4DWR1EtfT7hpG78GSK1m6NKngT8HFPIWMCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YSESYrin; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YSESYrin"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-382026ba43eso3299282f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 02:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732011078; x=1732615878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjxWMlI+sGw29mp15heJ5stcixtjNQJfb/Gxm0cRymw=;
        b=YSESYrinfQVJ9t0rkTnXN+r2TrKGImQG2tFSz+JfRC4pFD+9SluUfBDGH/g+tgFkiu
         gIgE/N1nQJKYPCQOwehg4jrLLPMWiX6ZTd9y4ObsfBb1p5vvE+IV+J1rf6XsoRuizMi7
         6HTyhzepmy49lVucpceCHQEHEBQahp61stsard54BYUBguG2rWMePhdgRjy0YJ6w3cuh
         APmUi+spggvB3VU36r4LQkOCNUfpz2OgsKCxbK31G5vHz/fc0pjlIfBaMcZdTaFl+eLt
         r8boBTKohjnLnKwdOuN3qxUbBDqJdf5mX+vHebW9eT01aqIEJNsbaaIBRYeVEH98+V0+
         NnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732011078; x=1732615878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjxWMlI+sGw29mp15heJ5stcixtjNQJfb/Gxm0cRymw=;
        b=FQpekqkG5uXdL8lAG/uOSELUzFBnqBYtclAUUZZPt8lTbLnI9Etig7roGmEUmw9v7p
         BBgAlKH7PBu+GnEH4jix+4Yljh2UoEn3mAfty/vwwoZDqAlYF4Dz3hamayby2cosCb5B
         ywOQ2P91bAp9TzhKESm4E5zpXvuVE7v+jzZGhcuszI/qn+80MxtOZAMLn7QsQq0XNxil
         YIuYuKpUwnB+BmBn5Komg/xd7lCoLLs5r2ZLeBI7WDI229xq5Pff5NkcHPcHrA4pNqBo
         rBNvYvsasmbAFXWFbZYlI0DzNSggkeyKqRTRZYqE9uYe1X0nWFqZfHbzjR/nrR1EMzoP
         1Zzw==
X-Gm-Message-State: AOJu0YwBn6Jcvi5tl/L4pUI6cmUYX13w3GcNpfSmbvxh8gcZi1I66hXV
	SHtsiRQYjZjjZjOlXLEpnm+dRb6Lk8doJvbROXeULlYpr51/fNHJ4WmM9Stb8sCsuleu90i9MgI
	1ettwcsWsNZGnJxeO2yF39/V0P0HLzYsWaTLA
X-Google-Smtp-Source: AGHT+IH9lD/Ywn8tfvstbL0te8l3MKKUD/KX5SCLKSAxrVuCTgNj6Oj2PjX/hN9uU8WPM9+N29Tys2btS7zE8xcBZAE=
X-Received: by 2002:a05:6000:1566:b0:382:498a:9cf5 with SMTP id
 ffacd0b85a97d-382498aa1d5mr4666513f8f.14.1732011078085; Tue, 19 Nov 2024
 02:11:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABgObfZSCA9uvSOXuDx8mvD1-gkcfeZxQQ5CVyx294Fy4Q1EgQ@mail.gmail.com>
In-Reply-To: <CABgObfZSCA9uvSOXuDx8mvD1-gkcfeZxQQ5CVyx294Fy4Q1EgQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 19 Nov 2024 11:11:06 +0100
Message-ID: <CAH5fLgg7Sq4QDFP3iU981Txuda885mZdaUa0CRtgjrZBbyPBnw@mail.gmail.com>
Subject: Re: pinned_init vs. miri?
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: rust-for-linux@vger.kernel.org, y86-dev@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 1:50=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:
>
> Hi all,
>
> tl;dr: while trying to learn more about pinned_init, I tried running a
> simple example through miri, and I found out that it breaks.
>
> The attached Rust code mimics a C component that calls a series of
> callbacks with a void * opaque argument; plus Rust bindings for it,
> that use pin_init!() to place a pointer to self in the opaque
> argument.
>
> The use of pin_init! is pretty simple, the only notable thing is that
> in main() I "inlined" Box::pin_init() to clarify the miri output.
>
> When I try to run this under miri, I get the following:
>
> error: Undefined Behavior: trying to retag from <1750> for SharedReadOnly
> permission at alloc877[0x0], but that tag does not exist in the borrow st=
ack
> for this location
>    --> src/main.rs:25:37
>     |
> 25  |         let owner: &'a T =3D unsafe { &*opaque.cast_const().cast::<=
T>() };
>     |                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
>     |                                     |
>     |                                     trying to retag from <1750>
> for SharedReadOnly
> permission at alloc877[0x0], but that tag does not exist in the borrow st=
ack
> for this location
>     |                                     this error occurs as part of
> retag at alloc877[0x0..0x20]
>     |
> help: <1750> was created by a SharedReadWrite retag at offsets [0x0..0x20=
]
>    --> src/main.rs:99:16
>     |
> 99  |     let slot =3D backend.as_mut_ptr();
>     |                ^^^^^^^^^^^^^^^^^^^^
> help: <1750> was later invalidated at offsets [0x0..0x20] by a Unique ret=
ag
>    --> src/main.rs:101:32
>     |
> 101 |     let mut backend =3D unsafe { backend.assume_init() };
>     |                                ^^^^^^^
>
>
> In other words, the pointer to the Box<MaybeUninit<PrintlnLogger>>,
> which was stored to be used later as the opaque pointer, became
> invalid when assume_init() changed the box to a Box<PrintlnLogger>. It
> is then invalid to dereference it.
>
> The cause of this is basically that assume_init() consumes the
> MaybeUninit<>; which also means that the same thing happens with
> std::mem::forget(), Box::leak() or Box::into_raw().
>
> This is not _that_ surprising in the end, but I was wondering if it is
> a fundamental incompatibility between the stacked borrows model and
> interior pointers, or if there are ways to fix it (I can't think of
> any).
>
> To test the attached pinned_init.rs, stick it as src/main.rs with a
> Cargo.toml file like this:
>
> [package]
> name =3D "logger"
> version =3D "0.1.0"
> edition =3D "2021"
>
> [dependencies]
> pinned-init =3D "0.0"
>
> and compile/run it with nightly Rust.
>
> Thanks,
>
> Paolo

You need to mark the type `!Unpin` so that `Box`/`&mut` are not
considered unique, which avoids breaking the provenance.

Alice
