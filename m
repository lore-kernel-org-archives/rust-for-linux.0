Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768C523BE
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624023; cv=none; b=VQr5C+67mJVZRoQaQYTgbtA9HwY1cdHvyRmzzpt853cuxZ+g1yLb/YLwrgIm+WZm8bdGg5ptbqn7QSx8XTo8gdg2+hQCl7z2/rHbN44iD3WLtC0SjOza+eGReMZN9S03oEfjn4Esavt9nS7oRpdnIWm+Rcj+JAeDnEXVT4Ojtns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624023; c=relaxed/simple;
	bh=SYE8zTOIQIyqmP0m4Mfa8QEr9eB9uDvuPurhSONCzyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OM8ksRSc+vmF5HUCEwBMcsQnuJbfOzBVMeQgnC06S8g7GM0MF3HpmMyWBpsUVFiaT2iQBksyuJOfJcZBpwYa8L2A5kQDqH8W+a8iF8rCE8wGuw8f6nxkjLK0eg2wuxbjYOShPYNYeCBwD+wp/YJQ5Q1A7Le6vDJdoGtc+Fa8edA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoHUe4m5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoHUe4m5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-312efc384fcso399831a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 13:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750624022; x=1751228822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYE8zTOIQIyqmP0m4Mfa8QEr9eB9uDvuPurhSONCzyg=;
        b=SoHUe4m5H2tsFgyf4Wtbj/QYuYbG3Gp+ttorzMZCKyNvgM6wudziAhFieYjiFWJMzs
         dLfVEhUmtsw0KpJzEz5gedFuN3dYi/+1VzupbETiDKqbgOxmqDQOknfqbQ/PUl6eUBI2
         zB7z+TBf0dxVoT0Oi4pI1V624Uu2arajCRS0M2RY1m/+n4EfbrW7zqmj6nc3Cl15xfM2
         VJdsEuRqFxMZ5iHUQmn7A25inQCLRq9LhD/neF7HL11i+AM/8kICE8A4+eDtGh1ewHtF
         9Pbp+JndazhI3y4v5KfE9RjV3JxLuUnMayuj7f862c1gmx25aDmyx7qDP4hdcQCH/BEQ
         CCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750624022; x=1751228822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYE8zTOIQIyqmP0m4Mfa8QEr9eB9uDvuPurhSONCzyg=;
        b=ge/MVSYkDKPUTbwaUIZpIk5SpEfdEdKWR2b05carm/ZqyvVpNvkedXRnAf6SXNnxgV
         dlmDF90M17FTAD/LdDwvFyWNDJV0hZLQHS63MuCTGh6ZvtsjfGCFKFj62I212AEbZeN4
         ipwutjdFY8CqghAuz+AfaFiQ2yQDvs0C1tsR6vI0eLu+HKO2w2jHgIGJiqpnbX8yKHMQ
         +Ar/Tkz91ZeHzF2ukh+eaaNoOpFPkLqv9l7NhaKguBiN55e/qrC5/RM37YNbLm1/ZkaQ
         E1iQJ6UWIQ+Xs/sPoVyJo3/ghaxifxof+0bhLxVpaVp2vj7IBThOlPHoyajcOMkjPrrz
         8J+A==
X-Gm-Message-State: AOJu0Yxk96qQKrOTN2hqFyXWzNtrKptIpq1BawHzt6P7fuZbQrUjKu+b
	tGgeT7sCjO1D8vqeMkDjuutOah9OE5JGZjU/dZ5STdU7cGytDOChilwOXSKqnFyALsQiRla40Aa
	Bone4bTpPQUMn1/i0fyXRp6MT/V/O07A=
X-Gm-Gg: ASbGncvSqtrgeBDtwpAU9Wn93/YO71eQRfir4R41L1qiEyDgXUBjtAYXCfDkbyZ77MN
	ul5hotxDNSy+RCK2TVrzyrgF6diHqLjmdUG1Zwa7ciVTVMzyuNTfeBOCDaGiIHNeRKM+wgUNpsc
	HqWDr2luJ0RtqmFIWsgKPh9vQimODGw+cWCMgutujksPE=
X-Google-Smtp-Source: AGHT+IFIrfjoHEKrmZ6D5NplO1w9S1ZZHW3mDGhxKLXcqD7hiktfzDwqN/HpZ/mFUpLon68X4JCQSmXjvT22aywVMGk=
X-Received: by 2002:a17:902:e884:b0:236:7333:f1a0 with SMTP id
 d9443c01a7336-237d9a75160mr54443615ad.14.1750624021827; Sun, 22 Jun 2025
 13:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622110646.150701-1-shankari.ak0208@gmail.com>
In-Reply-To: <20250622110646.150701-1-shankari.ak0208@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Jun 2025 22:26:49 +0200
X-Gm-Features: Ac12FXzycH9l5jPhRigmWKVieG0iPcpvLBShwMLkOeXXaAlrzs9fN4qY1JKPW1g
Message-ID: <CANiq72mWQPbUQKqCve+FF63aayeMEPgYVSezLjgGft+1weMh-g@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: clarify invariant for `MiscDeviceRegistration`
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: rust-for-linux@vger.kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, ossin@kernel.org, 
	a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 1:07=E2=80=AFPM Shankari Anand
<shankari.ak0208@gmail.com> wrote:
>
> Reword and expand the invariant documentation for `MiscDeviceRegistration=
`
> to clarify what it means for the inner device to be "registered".
> It expands to explain:
> - `inner` points to a `miscdevice` registered via `misc_register`.
> - This registration stays valid for the entire lifetime of the object.
> - Deregistration is guaranteed on `Drop`, via `misc_deregister`.
>
> Reported-by: Benno Lossin <lossin@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1168
> Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Cc'ing Danilo and Greg.

> +/// The `inner` field contains a `struct miscdevice` that has been regis=
tered with
> +/// the kernel using `misc_register()`.
> +/// This registration remains valid for the entire lifetime of the `Misc=
DeviceRegistration`
> +/// instance.
> +/// Deregistration is guaranteed to occur exactly once, during the [`Dro=
p`] implementation, via
> +/// a call to `misc_deregister()`.
> +/// The `inner` pointer is never null and always points to a valid, pinn=
ed `miscdevice` instance
> +/// initialized via `MiscDeviceOptions::into_raw`.

These should be bullet points -- like this it will be rendered like a
single long paragraph (but please wait for other feedback before
fixing that).

The last one seems wrong -- `inner` is not a pointer. It should also
probably be simplified/merged with the first one.

Also, please use intra-doc links wherever possible, e.g.
[`MiscDeviceRegistration`] and for `into_raw` too.

Thanks for the patch!

Cheers,
Miguel
