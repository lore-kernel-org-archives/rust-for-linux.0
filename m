Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D97A2C08DC
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769412900; cv=pass; b=FNMAteQpQ0OqVoSWcOhdIyDVcRltjlBbPOAe8eqDhiobz2MjYFZAjsTtwB3QBjSj7XpxYsm7FNHbzTNmLSGTNOxcwL6EMddiYFRSClp02KCq39mdzKiOUl6HL81TDfyE87oxB6p3l3ItupPUlBQ2llQ5Az1wsaq2FSjMc0MacbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769412900; c=relaxed/simple;
	bh=THFcxiM29iAxgbEd4iDhi2mIwhQRXAH4YxKo/5qMUGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgNau8g0ywBXE4QX8XZiye5FSKEJnSQuQgol033TGxVXFIagPk2E06f1WUXuzkkr3yNg8XiYs+X7CTT0LTQ1NIiSR0YoqzWZdWrSHzNRH8YIvIgNyxglkXdgunPjcuOLoQ3vNmUxPNOAFoGoJVb1GVHhm1sk4KB7oaym0w9GnkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpxJ20vg; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qpxJ20vg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4801bbbdb4aso34691445e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 23:34:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769412896; cv=none;
        d=google.com; s=arc-20240605;
        b=e2JCgM9DfwBpANFL08G1vVCCQkMH7lHlv+Ovf34zsILmES7SdzzrajBQBU2Cp3v4lS
         a9Hzn2J7RQlzKhumpV34YA/N2pY2y5QsfAWsAE7dw/9RXFQi06yfX4v4ngvXIXFJ2d0z
         9DLGRJyoHWVH8AL8Un//c6HuAEobiNpOzpomCanT4lUSz/a8CWJnrSqE/5xz6RGKNPh7
         mKTAA3e9sjSGtrDb0WmKJiqF2FiPgae+yAg2VoFRt2jBQXKxG+i2Yqv1u7CCXrFOwwYm
         /FWA0Ti6O2EfY/aOyWXwqNQKlJ1eDo2e5tAJz9HTDQTAqXPtL7z/4PSlLHub9LZlGcYf
         U9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TW8SDHm4wY+72pZI5lkyEknmq1cQQbn7gnfEPgF9Cow=;
        fh=KeD0we5ATQETdj1KZqlm2ffoLgMxEKqXr2/ZLVAKCqk=;
        b=YdbsXsRLnWRFA4Qq2yQlUTfeKkc8dN2sQanrOzdRAgTqCvd7uErO8RV1PJo+56r6iC
         /TVXI8zop3/QbLgqSBGuKUvFxdFpCtlouklX1biuFlYL3Qz0QUNXZz0oFWHGxuQrd1de
         A0H4a43Lfuffpk621aj3HO9+1/Gg7iIQBoDc0mf2/tEX3zRjT1iOPLzIX7GBoqBhZeqA
         MJNkyeOBgyEbuFE8zwIisKSgZ7RQfTQZjxa1UTcX/u+uK9VOPSyhA5zfu3GuRYfOufD1
         cXlB5+Et5kQUH54aXRNEIjgOO8Xc/LVnRYzb0rUT4SCkd+qJCBe+J6s63ClXXxCv7jfB
         cviw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769412896; x=1770017696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW8SDHm4wY+72pZI5lkyEknmq1cQQbn7gnfEPgF9Cow=;
        b=qpxJ20vgtN50a+Br1oIWFXebWiWG0+esShJwAhPhcY3Klm3GKpq+sbcPifr5F8aMYe
         2IEN6F6Bb4q+dO8BWW/fZZeDrlNbtbjDvKDNfiS28uO9yxZ/qXA5vrux0xAQjW7U9jGn
         XgS9/EGqqAQO+5I2KSradkuLe8ZcwFTTRy+1C7/Ar+HSKv4R24axgAnEQ7zeI5XM9yR8
         Z19rhs8kOIIkmsGwp1i6XceUn9FwIck1xSrlW8FisYSG1NnNCvc3nzbs9Eo/fm87qOq6
         GHk0jbA+eH3VCHw2aRL2VqnGJOlfiH/6tZVPMYLlYRP89e+MWG8rkTNIwGaqVI/yZ3Wz
         UadQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769412896; x=1770017696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TW8SDHm4wY+72pZI5lkyEknmq1cQQbn7gnfEPgF9Cow=;
        b=LlANtXodb2xli8fNv1ljOdppISkb1uiefs+eQ4KC+5S03JE3qgDhCJ5S7oVnVbIzTk
         qzSfv1jYQQ1onJ0cpQpu6Qvs8PBWJiYHwNZ9RxKRIbd83Hr5m2Cm6MqPgRnNpovXAfaC
         +nOF5WM033KS4bUlxEWl94KV72cAzYsWubKTAk436AbwkC7F3MKutC+uC4gvjYulMwXI
         D6/8QR2jZMJFmWlUeBB5oAh6O9uahsOQopdfBW47KlKlGhG60hmTxnf5YkGI8dV34Fyn
         2UboOFyyulU0aZg1gBQTQEEfCRPHOUvzonRw3xEJaZeU4VUUB0V1FnqPaC9abN/kiIMJ
         FK7A==
X-Forwarded-Encrypted: i=1; AJvYcCUmjBvn8dwBuDjIp47lxA1kOjzDAwnYHWtH+SI+8uRY2y9XciwYkY+QdDh6NCHTAHwQu25GEm4Cjws1stk6og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDdnAGeeeUdhViyknRAPp5VHYpj8WLUoSQi/ItqsmMJcSNR6ap
	iAMJfpxfqIhWw3i/jYE0Um9VT49MoWNpjzNTfeOoWh3Q/zSFXe1grX97lM587vcaIgAThTOOEFq
	jH28+rkI7Pf/+cB2ROmZk3Yt70rDvzf1IUVuthH3z
X-Gm-Gg: AZuq6aLn5s7Ep2cZYT1qT9UMP6g7UyYYwRCFwCE8U9bOODFnIhzaXvCVlfgQLm1Bv/c
	7E+41nxlfMizgI/M6w+pE4uGJvAp4EIegrDBbkj3oyXT3dZemWyvoBA5M0otqqFIrYAOyr87oeo
	FcnFwBhSmSXSBd6oBMYE0G/9ovALUc3zaqP+fGuk/DAXmP19nS3/gS6tGlR8oUPmgPHlpZgBGeZ
	TepxT9WtDnZwUDWJG+mqV+WpykIYrSYO4mN9XjEMctOxUqbqTx3pDQG8FmKuFuiYweRXAbMvZi/
	VLJZptJ7La+S/oVvtyGEmCjUrA==
X-Received: by 2002:a05:6000:1acd:b0:430:f2ee:b21f with SMTP id
 ffacd0b85a97d-435c9b29d89mr6070418f8f.22.1769412896418; Sun, 25 Jan 2026
 23:34:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124160948.67508-1-ojeda@kernel.org> <CANiq72=3+==Px50E+EA0fhe3pxVAGzRRt+6d+qze3cdeEBjyoA@mail.gmail.com>
In-Reply-To: <CANiq72=3+==Px50E+EA0fhe3pxVAGzRRt+6d+qze3cdeEBjyoA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 08:34:43 +0100
X-Gm-Features: AZwV_Qj9ldnC_uCDqYFEUEUQ3iDRZ5FCfEYSggcx9Mg02uPkev3eBUfDJsHByaM
Message-ID: <CAH5fLgiRvAvoJkpLmkSZwo82=VwQZUjZxCROc_0LZ0YkzZhj5w@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: depend on `COMMON_CLK` to fix build error
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:10=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Jan 24, 2026 at 5:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > Tyr needs `CONFIG_COMMON_CLK` to build:
> >
> >     error[E0432]: unresolved import `kernel::clk::Clk`
> >      --> drivers/gpu/drm/tyr/driver.rs:3:5
> >       |
> >     3 | use kernel::clk::Clk;
> >       |     ^^^^^^^^^^^^^^^^ no `Clk` in `clk`
> >
> >     error[E0432]: unresolved import `kernel::clk::OptionalClk`
> >      --> drivers/gpu/drm/tyr/driver.rs:4:5
> >       |
> >     4 | use kernel::clk::OptionalClk;
> >       |     ^^^^^^^^^^^^^^^^^^^^^^^^ no `OptionalClk` in `clk`
> >
> > Thus add the dependency to fix it.
> >
> > Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali =
GPUs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Applied to `rust-fixes` -- thanks!

Thanks!
