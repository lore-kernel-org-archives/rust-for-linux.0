Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87B0277029
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 21:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768771693; cv=none; b=iQat9dGZuXLlQE68k/DadV+bnmAuLAlAuLNaIbR8ojnwiv1ZvzRGmgjLwih5V5jmqemmtaKzXRCX4lta0BpLwZCgmtomVA5j3IkqtWVOlyRPZjw0oy8wYDdg/khpHhkVqFi44VKQS+rjE9GnhKcHo4HMr8u8fTlrVzdmefiMU/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768771693; c=relaxed/simple;
	bh=vMjNC2Tecqsx8qX3k0bRveOjlS/EXBttTZEBqFc2UQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TsSiQJx42xEMc9Xn7fFFC9tFZ4lFVCr/1ZaGHgJ4noqcc4A8mMKdCHT3yw4fIGnOvPojJ4fVRbRM+u+nzs2u5VRUajEKkr1nuoCoJaONGmleTWOSAtZHmcKZFoDsN15+XD+XFOur7nidRHL8gfC9gCOBt1Mh9XhTmDStIbd7EfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l7IBoFct; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l7IBoFct"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4327778df7fso2196064f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 13:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768771689; x=1769376489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDaH472bfnhCIqyZjen1yWQU/ijPpbhjthhXvYN1hIc=;
        b=l7IBoFct5PFbMFortsr/kHXsgdv3btxnTCNp/CiM7j8lrV55RQEcNuEhwcOtc8TMoV
         vBPmYK3Eu1ndYOqpPJ0IlX6orYyWz3LaA/iRG4wKE+3bDvqY0GffxyFArC3xhBh0oD8I
         T6ErERViLhy229ny3s2y7+KDXmnEG67CCwIFVhvOnywI1Yj9ufRq0hufTJCvP6YZ1NtC
         xG69Th2AZiCp+O+0+C5bbJjuF4wZxDDUK1N8H7VZuRQU6gfxAvH7fXPqkjOO9NzcG5No
         RmzdhdLg1DhIXX8W15B6ZPByo6E6iFeJSTJHj+x615EiEGgKKEgbU7Oe1Xf7YZ+CtSKr
         IU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768771689; x=1769376489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDaH472bfnhCIqyZjen1yWQU/ijPpbhjthhXvYN1hIc=;
        b=IcLfSmaAh19puFaBRstPPCC3/T0xzdCjIZBy9DExK+gh57zQB4rwPqUiUdOyUi+QQg
         2lUfpo+5YFCgdb4OE+vOxYoY/DYIgEXi9Tsj2O4vnEasCaOh6rCiU4t9YdAAismmXGgj
         4rhGtt2byIA+K3SnG6frckk5+TQlXmkzaDD4Srk/9G5JwUVZQFJP7afzVFDLAk0Oppp/
         9Qc+Kk8KAl0m72u/Tw2InQPVVRWIHwrRaeZpcIxwZu151Q0Piyqr/Yy9j3AQwOovJusb
         hoWMBquKK/JuxLEGATHnJlct+0L/AFERQI6IhIT7cghqIDu98Ob1sh/45vhiHmvWa88g
         Xbqg==
X-Forwarded-Encrypted: i=1; AJvYcCXEF0mCgdWvjM2XvbssIcBUtTySSl2O6dM6un6mwAPsWko2baZYM22LXJgB8TaLzrE4IRixxqFmANWqDL1P8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YjFadKdnYBeqm9s4jRdCHrqJ1ly3gu+QZH2H6U2C/hlN/yn2
	jvgA+UFmHqAboZX4JcQtLCuTK7h5WO8O/990GKxzWLRnWbbOFNsbg8HtTEwhBcipFD7KpJuiuYt
	+1534O06oovEIDEh9mN4JeK7HGTIvQbs6nAhCJqJf
X-Gm-Gg: AY/fxX5QOUB5IME8jlVE1JNH+t2YOxt48jRJne9GEvGEZ5AaWKEF5sTXazJVea1Afq+
	g4AKAuY1elkKGn04ZYaDBZXSvCvZo00JnMtK5Z7ppSiYPAM1wHYawpS1kQrCQNDbmj8kZrJLsOy
	ac72N00HdO1PPPBgnM+4Vot9pSeUHvWebSdXBTfQUBm8ClAvi/nGBV2mvB6+Hu8vL6iZBS1fpbq
	rUivGNjCvXHtTI2kutLZGqbqKvjjSMu29xxIbNyIVWLXsDJeKC3I3V+suci/LyRPchPTzAWGRO8
	0L3thytP5Vq1czbuvBijDhWfIedcdaCzY5pa
X-Received: by 2002:a05:6000:2913:b0:42f:ba09:aa7c with SMTP id
 ffacd0b85a97d-4356a060c90mr11483919f8f.54.1768771689026; Sun, 18 Jan 2026
 13:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115183832.46595-1-ojeda@kernel.org> <CANiq72mRB1Hhu=m26GsFHDTdiRTditNZGT4bRYWhWo_oBWsYXA@mail.gmail.com>
In-Reply-To: <CANiq72mRB1Hhu=m26GsFHDTdiRTditNZGT4bRYWhWo_oBWsYXA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 18 Jan 2026 22:27:56 +0100
X-Gm-Features: AZwV_Qh4FAOBZN8AyV-kWC5X51-KWGqGLoI6xIRuEElZkOxwPw9uZwBLY87FHhU
Message-ID: <CAH5fLgg+TOAWQAJ+KMyZBe4E70i=qy9TbFiB1ydH7YzOG7TWGQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 8:43=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 15, 2026 at 7:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > `rustfmt` is configured via the `.rustfmt.toml` file in the source tree=
,
> > and we apply `rustfmt` to the macro expanded sources generated by the
> > `.rsi` target.
> >
> > However, under an `O=3D` pointing to an external folder (i.e. not just
> > a subdir), `rustfmt` will not find the file when checking the parent
> > folders. Since the edition is configured in this file, this can lead to
> > errors when it encounters newer syntax, e.g.
> >
> >     error: expected one of `!`, `.`, `::`, `;`, `?`, `where`, `{`, or a=
n operator, found `"rust_minimal"`
> >       --> samples/rust/rust_minimal.rsi:29:49
> >        |
> >     28 | impl ::kernel::ModuleMetadata for RustMinimal {
> >        |                                               - while parsing =
this item list starting here
> >     29 |     const NAME: &'static ::kernel::str::CStr =3D c"rust_minima=
l";
> >        |                                                 ^^^^^^^^^^^^^^=
 expected one of 8 possible tokens
> >     30 | }
> >        | - the item list ends here
> >        |
> >        =3D note: you may be trying to write a c-string literal
> >        =3D note: c-string literals require Rust 2021 or later
> >        =3D help: pass `--edition 2024` to `rustc`
> >        =3D note: for more on editions, read https://doc.rust-lang.org/e=
dition-guide
> >
> > A workaround is to use `RUSTFMT=3Dn`, which is documented in the `Makef=
ile`
> > help for cases where macro expanded source may happen to break `rustfmt=
`
> > for other reasons, but this is not one of those cases.
> >
> > One solution would be to pass `--edition`, but we want `rustfmt` to
> > use the entire configuration, even if currently we essentially use the
> > default configuration.
> >
> > Thus explicitly give the path to the config file to `rustfmt` instead.
> >
> > Reported-by: Alice Ryhl <aliceryhl@google.com>
> > Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Applied to `rust-fixes` -- thanks everyone!

Thanks Miguel for looking into this.

Alice
