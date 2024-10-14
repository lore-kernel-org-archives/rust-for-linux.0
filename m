Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1BF161311
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894509; cv=none; b=MWGjdx50VTDqpwVcYFpIvZT10TYinbh5sLS3WXhOVZzO85KqegvHq25kTzw0c/7p4fenOfezdfFmW6JXHLREWmqt9TYujx/llbrdqAxWwqv5us9akUKtL5G+zmam3Sq58gQ57NOEEHCa7TdlyzkVjtpEQxC3LwRQ/csxqT4kREk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894509; c=relaxed/simple;
	bh=IyuZvKIkgZQliVBNyPA4Jxtag3pcr7KYyn2TJY2A4ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RShgeO+xeeTcYHQTXajZ8bV0oRc8h2wJRsoZZ5lU76neq9AAAO9pbRe0GtVHlEwGGoQi9YZTfee0F5MYjh2g2jY0+opwPU26DZbm8gTcmV1QhjBe3mpGBZxYeOTXGdbweQNQIj6VxoMmIWfsbEMQp4BgMjgXLioXS+GKTzl9DTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J+4MgDxM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+4MgDxM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d5038c653so2422772f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728894504; x=1729499304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCeu5RGfQHD/7fNcARcJl4VtMP3O2J4piVgLgvXsU9c=;
        b=J+4MgDxM9/i4mer/yhAgwYV+nqMzjZh/Exfljh+h/cFjYesBJOPetaAJukZQAbSyw1
         gjRLqo62ateoGayC2gGrM+M/x59qf00gE3YYgIe0B/Dn/TjWqATfzTdo2DhNLgUryYV9
         nJp38XOQszqoGxjPg1uSDdiBBUdmJH8te3jVQIJXYoFn5nM9rV9+pBOPbtZHNmAJlLtk
         J0wYQfY91i/ZKDTIurYyuofwj6JcNAo/+HgWE568RuhJD+S3pVpna5GRDA96R2bOMCtm
         YcGne+5ctzIfKu9YBqIDptkMPgAp5b+ucWXB4/FDifw7RdLwATc8KE9jR2MgXUrnxIBD
         9Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894504; x=1729499304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCeu5RGfQHD/7fNcARcJl4VtMP3O2J4piVgLgvXsU9c=;
        b=JQXYDgRM9qLb8UUpAUIpC7WBlqfN6iWtNqvYsD5F4z7qD4SviLpa5EJf1Uh20buRlK
         CadB4fK/yMg/sNNIhQOq8A7sWfjumq4FEhMTkRvfcA2bIIMktyXsu5K8h+k+LeBuyT0+
         SOw/sWImtoKV5cuNdj/5t00mnRSNOvAA9MAYJiwm1DwAhZRSnQacGDzwdMGcIn+UoVYV
         LbJzpo9J2mzrIlfPUDCU0NEoPCTNc3LU8vejrd/syCwuiyeDSJyZhY2QUApOg0uw9Fui
         GwNDHRYEanscHhIFChgoH/cCexQnj3sGLozMimjZkvk5LO8iKy5iPMT8OXV+npeHX7Nd
         5Okg==
X-Forwarded-Encrypted: i=1; AJvYcCUZEmKWMlQvGNxZE1eyDLdzIzUf2hQy7E0BklsZ5sYkRplrY0xTnQV2e0wSoX6SnSFnAIIjPP8e3KuOa1S3EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFyayrs1bUu4/fiQ8yFso+N98KasdzMSpOl4/3+Ss80UEofVMv
	ZB7SPA0Y/d76eNj1WN/INq51VuXbZRpUJjkNOU/CzXglZpmxzflGJ9VzOIeIm/IsmYTwZ8cG/pl
	IUrZ8U1DFgj9o6nbKlXYhfSQwQBlQDMOpchTb
X-Google-Smtp-Source: AGHT+IH/x/JFM80zXRfmFjrcoV8VAzGeOzIVfGAemlXaYAsnGiLYKVvSO5aPsLFdNUh4pRe7OfNdBBVD2cxfPVqv4pg=
X-Received: by 2002:adf:ea49:0:b0:37d:5282:1339 with SMTP id
 ffacd0b85a97d-37d551d39b3mr6997806f8f.22.1728894503943; Mon, 14 Oct 2024
 01:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241012075312.16342-1-witcher@wiredspace.de> <20241012075312.16342-6-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-6-witcher@wiredspace.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 10:28:10 +0200
Message-ID: <CAH5fLghusTK7M4om9X=_R6tXC_Ytc1TG=NfDXMsQkmfQ5SWUEw@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 9:53=E2=80=AFAM Thomas B=C3=B6hler <witcher@wiredsp=
ace.de> wrote:
>
> Clippy complains about a non-minimal boolean expression with
> `nonminimal_bool`:
>
>     error: this boolean expression can be simplified
>        --> drivers/gpu/drm/drm_panic_qr.rs:722:9
>         |
>     722 |         (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D en=
d && y < 8)
>         |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#nonminimal_bool
>         =3D note: `-D clippy::nonminimal-bool` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(clippy::nonminim=
al_bool)]`
>     help: try
>         |
>     722 |         !(x >=3D 8 || y >=3D 8 && y < end) || (x >=3D end && y =
< 8)
>         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     722 |         (y >=3D end || y < 8) && x < 8 || (x >=3D end && y < 8)
>         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> While this can be useful in a lot of cases, it isn't here because the
> line expresses clearly what the intention is. Simplifying the expression
> means losing clarity, so opt-out of this lint for the offending line.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas B=C3=B6hler <witcher@wiredspace.de>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index 58c46f366f76..226107c02679 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -719,7 +719,8 @@ fn draw_finders(&mut self) {
>
>      fn is_finder(&self, x: u8, y: u8) -> bool {
>          let end =3D self.width - 8;
> -        (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end && y < =
8)
> +        #[allow(clippy::nonminimal_bool)]
> +        return (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end =
&& y < 8);

This should be #[expect(...)] instead of #[allow(...)].

Alice
