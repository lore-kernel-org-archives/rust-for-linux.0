Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8FC279DB1
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765398; cv=pass; b=QyCiq86T6AmdmmBJJ8VGt5W4zrgH+i5bbBbupWtjhY2+28ru+O9p4P8bmaFDPAnEJ3RT+AJuqz+dyj90CI8wtpYLmILRo6Yl9IhR/DD01/GFu98qK/GWhqR7swuu+dMUPiPspJOqSbwvMbYG2TFu9+OQIFBiNix1ey20cDpcMhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765398; c=relaxed/simple;
	bh=YcWX4KpE5LzyFkGNlp0UmN6AScfsx8INQHNsRSOVao8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d75EI9Bl2WFJ9rpQsvx2ObaQvcIV/QJ3UvLf2GcZkOXO35Y9osfVIJ73XjQtweLDjc0hDsRyao2RvG6NjgvuckkwDYVJVxQ3qHxw4docUPzloScscdvFk/4MDD7TUGNZJFCefyt3TZyjdesR4RlS0ax1vYgeufGFK8CXJBQcQHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyVFMji/; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyVFMji/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ac37f8898eso149985eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 11:43:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765396; cv=none;
        d=google.com; s=arc-20240605;
        b=QEL/wsdl9BQLudfcna7DnW1oXeT0z8zmKrQ3eNdGlabdnoj0prvIg6rlPmxazh+ZB/
         9anTygZEi/i0L0d3NpAMQzQFRu3Et9z0mF/PWE4YprdZTwG1JdvbDh4ektsr/IK9MbaC
         dy4sgnm3C3/G0WUoDVNUJzX5I/O6GaAfTbUgpoji2Pu2r6Sb4LbwE5LCYFIDS+H1WWlN
         T0lJgNJLs5hU20FGS7Gv21PcF1EhWVOO9lPdUTyigixmXr0rZ077MnDIXIu+SwxfZrko
         3gjLcE4ERX7dsP/p8UP+E+elcfBYOC6fRkCPslHrODuF1fmj1Xogueoa0+P+bQNwqn6U
         LVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3WkwnRacVzZnF9+VHDBdh2NvGD/q/Isu1ZQKlvNDN0I=;
        fh=DM17q4h5IfdBM8HNLsWA0swau2XSSiiNT1Zu/H3oD5Y=;
        b=jvUTofAOqf+43/M3GsWZtLYRo2uAyRp/Rr9MfyfccK9YBOYHtfHknjAURZttc3nw7h
         4sEdLZBBClkWwVwhaklHMZy3E7xlk3IO+3EO1D/V1I/+GeKdNIt5zM4RsSFywFD8dAHx
         fIFp5wX8BBa3ljn/ggFBL7jrXhd1Y5ihtSCERFCifC6BJgnSMsk9vWBnBrPgnF/xS9OA
         zv3hmZU2t2o9STuqnKgdH3A+6umRE4xpZCQdeIiX7rSbTisdP/SSvg+odtB6goBiUjA3
         9oNvn9AxdKNZV0BZ9sqQdxg1YSgXDlwChQKCHMDkEOuoteufopmPPyqf8gnCcMFnQQ9M
         fbRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765396; x=1769370196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WkwnRacVzZnF9+VHDBdh2NvGD/q/Isu1ZQKlvNDN0I=;
        b=JyVFMji/c1eBg4LJmOVPcjNlcOenkPq7z/Ysjq3Hehh3n2JscrHBsQqoX0KD9dIj/B
         CgGK4f6ikRvaXkaNakJpb9IqeqXcI3liEZr9ApuIuJ7hhwPV5z1v06CjEzlOiDIsqC5r
         f9DM+zzkFTg170yiNciTf9IZoMPVzY6JrDPmytalgfSnVJga+bl9uIrIjSt70kwxPhWZ
         lgNubit1H/r/xahYemoLlOJ9rrd8PPy4jnmXsNubOrK45nhpSEI1syOxwxUadEJ+7HSj
         0CfCLjMTsvLkyG0lZgj8v3eDZq4Zn4N+/Kiy19W/8WQllIrTJ9Cbf7nkaUtuiES+e3iP
         de3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765396; x=1769370196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WkwnRacVzZnF9+VHDBdh2NvGD/q/Isu1ZQKlvNDN0I=;
        b=HOtHL0SJV6JEwMVJdzUJVBs7o+xC9dCjkMsfOzVLf7JzOpI2T9nFRC8UGJNcGT1ZaG
         Zo+OyJ9MOu44XkjELnUgyi2Tt5laNz7SdHJuj1SpAFb/3TDSOl6Gz+1hV/v8VxhqR1ne
         /3ATtWFLFE0J9NmRYmF/Jorv7nJ2oM4hkJFDUSLCD9j62G6XF+m3wbkqg/GAlX2kqJHm
         XELgDQr9eRwCkBCa0zb5YnveH6XkXX11+CLfSd9MJ+Oq1C8njhb5bnyShGem0KI6w76w
         l5IRrAlFpe7pVFsN/Qrj8Nof06gm3/X3Kd5X9f3mwmD61DhE2uFzRhogcnW2hiV22o5P
         E6Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXfOGkwGxroz7652Lru6BteiGLlClvkSszPTcAOZ1AYvLoy6ZR7JLQKFGhgvGWaHDsbTd9d3OHPl5MgfxtjrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTibjKO5Eyosy7EGxLJxO3BMdI6vwN6JeFCCYwv+f/Yqm4nt4
	rwgRLoHIJxXh1w8wJYVRGS5YqN+RAZ+jpg0CqV/6i0zC8sX9fyEOjJAAiTJ/S5Hh0sZ1uELgnKK
	qYM/vFJWqVSD6/OinUJhDCheEOlmgpUw=
X-Gm-Gg: AY/fxX6l9hIj14jNH6Y+OK7PUZX0mgDQh1qMBvGZeAFGo++ham6r3Z48lE76daLM06K
	EdKzQfN0AOTX1e4S/scpUjklTBh7D2UiC9bbKjk/UxhL5uIziMYtRyF4tfxArbAugzsi54SJEFY
	BILtDpcuaeG5w2K0eFZwtMiosBZDvO7VH9xFtxmdBbjLW7R1rlMFJ41pHVTHTJi6+cBLWiVCdaA
	I5Wb2sPADWNChBRJJZ7v2MJ+HPe/hy0EXez64G9jn6nectObql0rNJtY4dQcpr8vVNWlLSoipKm
	dcpfj+zibSH/6Pb6sZZHMkt9BgbEA9GwuDgiYWz4JrqrLwtNqzgXjqgCwQFckEDBLTGOsWNmi/f
	le3CQWuRdteMC
X-Received: by 2002:a05:7301:1f10:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b6b4114382mr3414544eec.8.1768765396119; Sun, 18 Jan 2026
 11:43:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115183832.46595-1-ojeda@kernel.org>
In-Reply-To: <20260115183832.46595-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:43:03 +0100
X-Gm-Features: AZwV_Qird-lwibLosQ8SVV1mDXaYy8TIK_gyKIQwJqqY-9VOd-kxYQI5T5v3RQE
Message-ID: <CANiq72mRB1Hhu=m26GsFHDTdiRTditNZGT4bRYWhWo_oBWsYXA@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 7:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `rustfmt` is configured via the `.rustfmt.toml` file in the source tree,
> and we apply `rustfmt` to the macro expanded sources generated by the
> `.rsi` target.
>
> However, under an `O=3D` pointing to an external folder (i.e. not just
> a subdir), `rustfmt` will not find the file when checking the parent
> folders. Since the edition is configured in this file, this can lead to
> errors when it encounters newer syntax, e.g.
>
>     error: expected one of `!`, `.`, `::`, `;`, `?`, `where`, `{`, or an =
operator, found `"rust_minimal"`
>       --> samples/rust/rust_minimal.rsi:29:49
>        |
>     28 | impl ::kernel::ModuleMetadata for RustMinimal {
>        |                                               - while parsing th=
is item list starting here
>     29 |     const NAME: &'static ::kernel::str::CStr =3D c"rust_minimal"=
;
>        |                                                 ^^^^^^^^^^^^^^ e=
xpected one of 8 possible tokens
>     30 | }
>        | - the item list ends here
>        |
>        =3D note: you may be trying to write a c-string literal
>        =3D note: c-string literals require Rust 2021 or later
>        =3D help: pass `--edition 2024` to `rustc`
>        =3D note: for more on editions, read https://doc.rust-lang.org/edi=
tion-guide
>
> A workaround is to use `RUSTFMT=3Dn`, which is documented in the `Makefil=
e`
> help for cases where macro expanded source may happen to break `rustfmt`
> for other reasons, but this is not one of those cases.
>
> One solution would be to pass `--edition`, but we want `rustfmt` to
> use the entire configuration, even if currently we essentially use the
> default configuration.
>
> Thus explicitly give the path to the config file to `rustfmt` instead.
>
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
