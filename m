Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE71DE2AB
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730127877; cv=none; b=StQGf7JQMqq3wb8L8h8yn9eOsLZMKyzt9fNMAYnNu6blEky3csmOb95NFZfRwacvKkqzIwRVg6hlpYBMX/42B8evHR3hdlmPaGoWMSP93/yaP4s/eSHb/Pc40JrMcgYLNUP4e1PKSvZ6krsRDF87uMlJzckYi8gWEjXkZrqybzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730127877; c=relaxed/simple;
	bh=cTowzmaONVuC1I92kLu5ccau6EoLxia4a/C38ho8BZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FA8JXVyVJDMtRSvWewPNe3c3bFoWyynDynqFgGOe8AgW/LZieAELHAG7Z58g4WTorPd4pNg4rHp7dPjtprhTsizTy5tAfjY//cBuT8M9tZ1TAD+UxAX1mQLUVWivsn/N2ZfEKpc4SmxawuT1+4H9YuV5sQj08xeLhaqswMy1eAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMUwqA3L; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMUwqA3L"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso33973751fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730127872; x=1730732672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJg9OJwyqLrTjc+750VfNd+RdZ64/blCoQMhXm7csU4=;
        b=ZMUwqA3LQLthsTmUYzWczn4OHZ2/DWp+QPXryrEhlSMnqgPVHKJWvjuZKeBLSGV/bb
         XXeIFKRCDQDFfIDbqjZG0pu+Ysg5rFRRwQg9BnI67GRa5OK025JfBX5/UnzBOoNR4K/q
         /6oR3tUCWMsMjyrY9KraWkO6J7jyFeCNd+I8MYTpUYkdcWul5S0lVto3hQM8d6gmJd2j
         S+b8GjH4TgNIufhFtVCJS92HuDYF9YzJvwbRof+yeMgDwXa6u3h28nGp/oW+egs+EZUa
         NplubifHhZtcwaZpcCmWspMgu3D6f0d3usfAPUGoTHe6J3WZbh0cL1v9Cl+msBL+joGw
         PoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730127872; x=1730732672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJg9OJwyqLrTjc+750VfNd+RdZ64/blCoQMhXm7csU4=;
        b=A5GEtebWcCRS8P62OK4CcfM/9KShdL/Zp0LqcUr1KIwLwKBm7ceX62YPS7kXqyX2c0
         Z6nzVcnKKdiN6KLO8gU0NcAsfz77O4na1LEQeCcRLWiexMNYEVmIypNDWaICpnH+cLZg
         GPO+b9uwSE07AQsO9PZejkJwADQywlmfYNxd7jTFJ4ztT4Xsc9Xkk5rzFSA13FDbysRG
         KxYkNuHYFzuajQfuIn5H9ymAZMQ9/JBiN1bdP9Q8eI138duMrqZLOi0Xk5ZO65YZOxYl
         MqkvnfQlYcIBoBxGOIr19YY4rumDAD10h3xUXhTYUZO14xkTr4/RWEJGAJUnyHVpHAjD
         HodA==
X-Forwarded-Encrypted: i=1; AJvYcCVyOiSIffyo8UW+5ofd8LJmx5hPiVJ1J2p58QmK12LjHlHzwV82oxGUPM6XfqGgDnwaf+h1GPvWX87gsSqmlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMIkTJdr2TBuPsw6kqB2wYGbhNwg+t2q+2IBM4lVn5Ye9UpQr1
	s9ZLPGpIjF4l6AC9VO1/BEaKHHQ2e2EB0l8nq4iblsYY0WNpgCwYhVGuySa6Fg2P4wVDGlbxfdX
	NVdvtg7xCAlVvrTdYZOEJM4r148gDCKAk
X-Google-Smtp-Source: AGHT+IFesyjYXyoqBmb3N3i50/3uEveptFX6QU+CPZgJI7WOetOXVjL3BNi0pLgAGBWHo/3CN2velsFzD2+O4+KTYQY=
X-Received: by 2002:a2e:b8c2:0:b0:2fb:5bd1:c288 with SMTP id
 38308e7fff4ca-2fcbe09fc14mr37884681fa.43.1730127872018; Mon, 28 Oct 2024
 08:04:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>
In-Reply-To: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 28 Oct 2024 11:03:55 -0400
Message-ID: <CAJ-ks9=-+GvfAkFxkmFdCrQ2LpjEzS5dn+-L8OU-tYZQrzxVwg@mail.gmail.com>
Subject: Re: [PATCH] rust: Implement fmt::Display for kernel Box<T, A>
To: JCKeep <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 10:58=E2=80=AFAM JCKeep <2407018371@qq.com> wrote:
>
> Currently fmt::Display is not implemented for Box<T, A>. We can
> make the following code work by implementing fmt::Display.
>
> let v =3D KBox::new(42, GFP_KERNEL)?;
> pr_info!("{}", v);
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1126

Per the issue, I believe you are missing this tag:

: Suggested-by: Boqun Feng <boqun.feng@gmail.com>

> Signed-off-by: JCKeep <2407018371@qq.com>
> ---
>  rust/kernel/alloc/kbox.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index d69c32496..5f4765800 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
>      }
>  }
>
> +impl<T, A> fmt::Display for Box<T, A>
> +where
> +    T: ?Sized + fmt::Display,
> +    A: Allocator,
> +{
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        fmt::Display::fmt(&**self, f)
> +    }
> +}
> +
>  impl<T, A> fmt::Debug for Box<T, A>
>  where
>      T: ?Sized + fmt::Debug,
> --
> 2.34.1
>
>

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
