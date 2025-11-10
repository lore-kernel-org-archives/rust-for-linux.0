Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D830CDBC
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784421; cv=none; b=cG7u/pH/isBimjwfnobNj2vgaXcMCIXt96OibGVFtqIpN2rmVtAegNy/dzrw5w6xZfV0QgJ5LO/qODOVDu/Wpzb+6ozqhav3ocl+vexU49ykKnRRVbTHNmmdWrcGRL0X4sV6IPgfwLRmeiA8LV+4jikxF+/ImySFhR5Jj9eK1sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784421; c=relaxed/simple;
	bh=qOe6RlsRxbbpjF5yUGUHA1xvBuskgAyFDmfx01XXhAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dmgGe+NgbHnxx1DCK8eA5bAPpawbOCGrYKr3ezhRWQIt1VYg0yA6oprlF25mhZC9bOexCe+xyeGw7DhOrtY1tMinEtsLaIW3T370tFMd3Dj0+dISfwe4bt8IACCpG6IlO5T3GRw0LORuH89fOKLCnDXBmArzrJdDx+dAGhz86Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o8wPV626; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o8wPV626"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2ffe9335so1266490f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 06:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762784418; x=1763389218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psMAW+A9N493zhAMdvYWcZIn1t44bxjpvUHDwOK81aM=;
        b=o8wPV626NgQ2GpWxaojClOj7FUfOEzVml/oAEJVZDlT2W4Vu81DjzBPHhALFM3I4iI
         f8H4EB9W+9hoWlxsMakpf0uFpJJxtCGqKlym38K4IC8u8IiHPPJjeAQoj7QKtnExKpsb
         eQvSNsB2WNd56hyP6rEAQAmfR9N/8zKhQeDGt4BkunLAzJ3cwmVCOlEfYCPcXRywpunk
         hKFa26vICNHDH0nYa8OL6Q3jUzHPCyF6QRoKUFDczSzC+orpUOpWONvS46yaxj3n3hgQ
         ZYY5T4/1g0xpUACH3gD+fxC09fHq+7ak9r65SNli3byWFCPUmpPShJ0alV79ilU/4ibf
         jkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784418; x=1763389218;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=psMAW+A9N493zhAMdvYWcZIn1t44bxjpvUHDwOK81aM=;
        b=w/b7AQOdVWrwkVW+4p9JPn2KmgVu6fZN94eb+DTtwumqCCYVnOPq1m38T1sxffg/j2
         7JWomwKXcbE5QnqU/wMA9JL4zIXDJTJBoNM+96ANCvLqP6sOPYSW4R3+6x+S2QMky2fT
         gzqr8UV6aLVQM/HEK03OI+TGwcSBIFfXjcKhDdljiqId7Z8X2HiAE1tTVpgA3ZrWAL9O
         QnRxxdF78x06om8WXT01xc/aaUFp9/B1P6MjL4ANXhBJtNu6ZK2XZpwKZ+rWBhTFQb3E
         fIkemCqxjUIyNbpXN0jWxRE9oNTTvzVfwO2SjGOKho+8BcQLcFDJ/S2a9yGPDTTtUyMa
         Kw+g==
X-Forwarded-Encrypted: i=1; AJvYcCUgVhs/otj6ih5TJW+sHCVt3iV+O1IEeJo8zrPhAiGec5XRvLrfOsfXh+LIs380TT0w4xL4hVJ8R3jUBAIA+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuPA504NPOxGGm+eaLvI5mKve+jjDNnV0A95S7tt8Tb4lz6x10
	3aXXsx0iNG6mzOYuQq1QVNhEFfoT/w4IyQ9Pl4X1rj4U+TIPj7k3/Ls3vWtuVsstN7txKJGkdY5
	ucGLsHCUJZPtXblnoFg==
X-Google-Smtp-Source: AGHT+IE7lZKYOZxQK4wSJWQnJ1H7sAQgindPi4gfJiLl8K1QY12SP/r6PQCMmeTdn9tCxq3wOp7gpa8Kwy9YvTw=
X-Received: from wrxk16.prod.google.com ([2002:a05:6000:50:b0:429:c767:a6f5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186e:b0:42b:3d9d:c605 with SMTP id ffacd0b85a97d-42b3d9dca2emr1761165f8f.49.1762784418053;
 Mon, 10 Nov 2025 06:20:18 -0800 (PST)
Date: Mon, 10 Nov 2025 14:20:17 +0000
In-Reply-To: <CAJ-ks9kvMQ9tUMZyM07jRr8O+pJ6RRvCZodenB==tzDChhHT=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110-binder-bitmap-v4-0-5ed8a7fab1b9@google.com>
 <20251110-binder-bitmap-v4-1-5ed8a7fab1b9@google.com> <CAJ-ks9kvMQ9tUMZyM07jRr8O+pJ6RRvCZodenB==tzDChhHT=A@mail.gmail.com>
Message-ID: <aRH0oRU5JXKpAKpB@google.com>
Subject: Re: [PATCH v4 1/6] rust: bitmap: add MAX_LEN and NO_ALLOC_MAX_LEN constants
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 08:59:36AM -0500, Tamir Duberstein wrote:
> On Mon, Nov 10, 2025 at 8:06=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > To avoid hard-coding these values in drivers, define constants for them
> > that drivers can reference.
> >
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > Reviewed-by: Burak Emir <bqe@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/bitmap.rs | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > index aa8fc7bf06fc99865ae755d8694e4bec3dc8e7f0..15fa23b45054b9272415fcc=
000e3e3b52c74d7c1 100644
> > --- a/rust/kernel/bitmap.rs
> > +++ b/rust/kernel/bitmap.rs
> > @@ -149,14 +149,14 @@ macro_rules! bitmap_assert_return {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// * `nbits` is `<=3D i32::MAX` and never changes.
> > +/// * `nbits` is `<=3D MAX_LEN`.
> >  /// * if `nbits <=3D bindings::BITS_PER_LONG`, then `repr` is a `usize=
`.
>=20
> Should this and other references to bindings::BITS_PER_LONG be
> `NO_ALLOC_MAX_LEN` instead?

Ah yeah it probably makes sense to update this in a bunch of places.

Alice
