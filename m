Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA36312E68
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Apr 2024 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713833267; cv=none; b=loSs1tJXTI/s4gPvnVNFgaOw7Xd7+GsCQcPmF6iczPpY3GbPjWpzo2tYL6VcBMxVJBc5tFGp8D2saqkHV2Wc5/cE+4fqjxmZiEbTnAl3eUMi6C1MIesCPJ0Mj4svPqdgU6ZXm75RXFzaqO9y1akkmqBkqmMw9W4kVf/CCEnrg7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713833267; c=relaxed/simple;
	bh=A92SZOgCI5PMVzE8FF2A3KVAYTeaCJQTpoLPaYJbDzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cieq/Kb8aHvqNtnSEaO/GK+/rZuH/xL1Si5wNV+iYOh13e2DYP1AWBfhMP1T7z5UBY2PgEnsqofNeKQu7wbtyXxNgKVsGhGG1+i6wAdQ7hg3dCyrPDJqjxpuoSW3ne+1Mmgsdvx4h5E0moEeChJLMiB4Dt1DNukRI7xI+LH16Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fV/ILaIc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fV/ILaIc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2a7e19c440dso3521341a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Apr 2024 17:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713833265; x=1714438065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXC02160E+1Bx2EfaArOofPARSw4CizVq0wlGSNvaj8=;
        b=fV/ILaIcsQ73dqLPgA3U1NWr+QJN4zNzCg6R57NSKLNUWTjgfW2cVymFPHDKesieTJ
         nlkCsEcN5n1rRxulajxow7NSRI+742BH1BUS2YBYGUiPcFrzcx7pwyI3M9IDu+bN8xqW
         m+wOYZMRfSWSZOCikFVh/XbsZU9T7gMNB2I0XfviKuVC6o7FUZdDpkwpLrod6vhPDABI
         cQK04a9nGWXdEBzaQ1J1Me1vovKNYCb2D1XSHwop0/w7WPTM/hUpxgtesnhPHBCcNr24
         FJlgz0fUlnA5SjMLvhbfsgROrdq3LT7KPwqaTmwHhWcKU29nblMAvG8bLNEeQYdoh+Fb
         2EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713833265; x=1714438065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXC02160E+1Bx2EfaArOofPARSw4CizVq0wlGSNvaj8=;
        b=EywqARmMAb6RLeD2csvzBe4Y0S36qD43u7NvJfHummSmpi20nCW/Xm1AnKbuSnMgYJ
         3MkwtNJptaSl2nsmUPK/b5ZN3FaNoJXN8Pwoo5ypE0IrMt77Y4QOxpcAVbwnzO5H8Zmm
         jZzmjWPlLdGPmz+kQ5S9snn9fW+zPEtG2wtTZaWUPZAamRttL5hODn/KzGbj5EVqfCWk
         Xv/cjZCyS6bF/w2iOTEQNW3L1K3ai3kSuwRq1Ojj00CX7hmNSF26cy/mpgz9SUEbXUvk
         wSiR2J6hMLWDbLkiOhUYd15BT4MaFSqfAa7pkReVZYRuDC7+tM+lIX39F9qdzFVJbFoE
         wsJA==
X-Forwarded-Encrypted: i=1; AJvYcCVxY+xt/u0D7/NdzxhlVlgDfX3A2b2EDNuzLNMMaANcrhEHFZrBdYiqENEb7GlnrDPRQgJNuxDcP2uDvMGpUOieILuwbjhW5Y+8sZNGS+8=
X-Gm-Message-State: AOJu0YyboySKiVGvAWbzfXfnVVdsJ3WLQAQwQDU6yHoChKmUNOG5INWM
	+pYvVcbEeXBXRD4c1Ul6C0kZ4txhIiJpYf7LZ8Glju0QMxd9z+LWQCh8LrKGA03qvwEbuEhe2vr
	x8ZdWdd8Z+WqScggtrslhMUWdy1I=
X-Google-Smtp-Source: AGHT+IFnF3loMr3fVmIxBsG8RHKY1/SA02k6IcQlEQjc9swaG5GFEkNA9lytW+ZiJM0mAQPcJmgsw4fSxppsmIbOHvs=
X-Received: by 2002:a17:90a:df82:b0:2ac:360d:b36c with SMTP id
 p2-20020a17090adf8200b002ac360db36cmr9656854pjv.33.1713833265379; Mon, 22 Apr
 2024 17:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419215015.157258-1-aswinunni01@gmail.com> <20240419215015.157258-3-aswinunni01@gmail.com>
In-Reply-To: <20240419215015.157258-3-aswinunni01@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Apr 2024 02:46:41 +0200
Message-ID: <CANiq72=g4f60n8x=-fCxqQ4QzD2eOrEb=vEXgoNidY-N4omN1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: fix datatype in docs for `module` macro arguments
To: Aswin Unnikrishnan <aswinunni01@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 11:50=E2=80=AFPM Aswin Unnikrishnan
<aswinunni01@gmail.com> wrote:
>
>  /// # Supported argument types
>  ///   - `type`: type which implements the [`Module`] trait (required).
> -///   - `name`: byte array of the name of the kernel module (required).
> -///   - `author`: byte array of the author of the kernel module.
> -///   - `description`: byte array of the description of the kernel modul=
e.
> -///   - `license`: byte array of the license of the kernel module (requi=
red).
> -///   - `alias`: byte array of alias name of the kernel module.
> +///   - `name`: name of the kernel module (required).
> +///   - `author`: author of the kernel module.
> +///   - `description`: description of the kernel module.
> +///   - `license`: license of the kernel module (required).
> +///   - `alias`: array of alias names of the kernel module.

I think the original intention here was to document mainly the "type"
of the arguments (given the title of the section), i.e. the kind of
values one can write for each key.

So it would perhaps be best to give that information, e.g. "ASCII
string literal ...". Please see the code of the macro to see which
type is required for each field (e.g. is it a literal? Does it require
ASCII? ...?).

This should probably be considered a fix, so could you please add a
`Fixes:` tag and a `Cc: stable@vger.kernel.org` one in v2 (since it
does not hurt)? See e.g. what I did for your other fix I applied
already to `rust-fixes` (but note it fixes a different commit) and
https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es.

Thanks!

Cheers,
Miguel
