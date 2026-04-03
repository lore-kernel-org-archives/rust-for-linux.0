Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA23822A7
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210759; cv=pass; b=FI4/IAt1L1eZcg3cJO7hZ7YHjL8X3yT1tDJnojpFmiCRNtfRRYzkyV6bNIy9VisBQj7iIbuK3gvmd5zJw5104GBA+PLmt4v6uAKtlvwQbGZlk8SPKIuyZI3dPikU82Kt5upxrLtDqbu8R3LKs1jfDiSmnKJ+JY3pWyTeAN361Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210759; c=relaxed/simple;
	bh=TkNHPhEzkYABSHJOXb7SAdPNsQYeQkyZZ0VQuJR8jrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eY0OudiBgcSR7I/0SSnK8Lw4puKLbKmuYHTl6KGuCEVB5aGYolMxccsba+jE5PZRJWgq4McuBC0VA2VCnM+s5721cEgwOa5RhSHOuqUpCgakO49Miw4z2TWEQouotLoodaL5aCF1hWMTK5HFnPO4yMPwPvYty93E8hQyFC0Z13Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSDI/J47; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSDI/J47"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38be3a161a9so2954401fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 03:05:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775210753; cv=none;
        d=google.com; s=arc-20240605;
        b=hRl0cditwmQ1+Fvra9CswHcqeceBayjO4XYDIYj489jeIlnM5EAWcza9CXk89qpVVV
         qSEOCG3ugDb02ln7SoDGLWQonnAXeoUQCBJX4TrKWOP2RYQ7MOBLA5Ig/bsp6F7td3QS
         4SMlHcVQS7fAG7E3VpY7sZJOahWBknnXMiB1kCjOwslwAbtJ9A25fi2fKCZqQUtKmIhc
         7LK+dHoqj7ZwoMSnlgLxDiB5XduQjEdb1sr5tbDHEO3oJU0aoC9sDUqKW+W0Ldg+bYtg
         yTDQDSOpYqf8YFmRVppqd8wpYIfSHJLbfSKcOO+b6CgRLoRN5oLUQMD9Ov89KL4nFxRt
         QcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YLbD9NBLa2cA8RkwMY9FXgR3GMGSqJQ4FhLm9zSjhgk=;
        fh=gAcea8IIxi+pf8t0E0ej2eaMvIhueRAcLWnMEV2NArY=;
        b=TbGcfiy/B1FYe4POBtnvlyIcgTLGnmWNjl2OPpIYDM5fveLyBxuKC01e9SRzUoL7jF
         9sw1SQ/Mp1vuryYd+WlLI8kaojZdnTzk5iutp7lBDddxY5TGyDIJ5V7A/ZhsP7DH/Tn4
         41Y8SXkgfRHNP+mctthbtN1AEt+96xR/RkBALpID9r7ke4PKcv25dvJQMdqSwm1nY63A
         O4UQN/fz9OCYLZ5OotdokprNRVjJ98OSb75+ScSmR6/Vy5NiR96EShM/SfX/8zB8kr3p
         R2++6wP8u+Znq4ubCckI06IwG7pveGxvfmJMMNJ8Fev5dvKl/drSb24HNdgmJy1fV1wO
         Ss9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775210753; x=1775815553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLbD9NBLa2cA8RkwMY9FXgR3GMGSqJQ4FhLm9zSjhgk=;
        b=CSDI/J47bzw5ypL572cmdS0hUB6wuUXqxQ9ilVaJGFV+8pj8YU+Dw9c6azuiR3iXrq
         3M5FGa/1vTv8jEXmFwQ8PSY2rdxZLZIhDz5DwtBA/M8C70hxbsNYg2vDz1vbN18R4wyy
         XaRf+Ab7Tpduntv4jpw9t3HJ3fcRsgOnyql+i+Xihz6ZNlnbASufMc2aHl90CIdoOTSd
         4jTL5iX4MW13wmJQUvKCqs4DQKgWTjg7GN4V44SZJvxmm/5m0Y+xShAzp1DzSCzvgybq
         x6jNhnSDK+CdjoBh7Md9G9mb6dPxWJgIx8hck+6VZ7N0rCOd+r9hXOh8iNv1Qsh1nL70
         pzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210753; x=1775815553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLbD9NBLa2cA8RkwMY9FXgR3GMGSqJQ4FhLm9zSjhgk=;
        b=jWt3uxkRNLv9u2bdynbT1aLKVs7pkTiXBCaxHieZ8h3bCwbO3MFuUvmqmSiXxKHGBy
         EIPCOg2PMvywY5kEbUW8t6Rr4LCyHAtl50aDLNr8mRPxkcBvdBImUDTpvAVPrH9cKM8J
         2dqeZaXi2zuPmel6s7UVOfw9GMFppcCWt0pH8hoK1LHtBKP+o4aTlNN6SferRTQNpJ92
         govfaZSol0+NXtDgBTY1smDTKbmFjz4GR9zPjOCWFUkjFel7CNO1QTPoWWLcb3rla+nb
         LJ26F3f6+qNyTW3n1MN+Vg8ZTgADEdAwgVKWE9Ih2D8Y9gvbiXfrgD+0dFo4GoYgef7h
         WxMg==
X-Forwarded-Encrypted: i=1; AJvYcCXDQ3OLvgRIEmhMXUjUEFyY8o876B0HakKw0pcLqSGCgYAxNqgoEoUby0t6WQMxTaaK57Cb5/wkSVt3gFOdJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzodiefPr3Jb6M88berY0IjkPo5NIQREovm8XMZIJNNwhIY8/P2
	6HsGLM9WkGIQzGsaS5/7mNOxV3veB+bXwirokoWzsFuUY+uC6346mzZPSlzq0hI0qYyEZByc6Ju
	7L7BMwyoVBHhMAIxDBkcbAXcwY1cwfDk=
X-Gm-Gg: AeBDiesb1UC3gshLCVmSSiJyakRjYcuzBHacc0NuPfgTnRS/bE8eL5r0KdpAQpd3gEz
	w8NtVfJWav5Dy/56iKqTO7ECgMOqsk32K7aay2P4PcJ29F/Mqyik5q3rQdvDYVAflbNBql0tcnN
	tQC7skMX13ZILfCOGQBbbwtxIJGsw7jr0ZMTEreFtwGaWFxe9l53LhRZ2Q2l1xG+SW9uf9P3+7g
	J+fT87OBIpg1w3PuFbJM4VTRSXPYJNeZg7U0w4svsThhVynRa5gRhB/ryH1z0NPBd5u92l/507x
	VQ8iGVd6nGKRtcJwZjqo3Cryrj2Wx0H0can8LEXXcJi5tdI76Ix3d8MzPyo57dHUfWQAhfJNo6G
	9zUI2bJpqqN/4mJNvVOtQ9BM=
X-Received: by 2002:a05:6512:1393:b0:59e:5796:f6a with SMTP id
 2adb3069b0e04-5a337593b79mr427224e87.7.1775210752684; Fri, 03 Apr 2026
 03:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
In-Reply-To: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 12:05:33 +0200
X-Gm-Features: AQROBzAnNIt6naIfeMeK2ac4VVmYdgIa33310K-kkQ3XQGTeDriWEK03F-TXqlA
Message-ID: <CANiq72ng_gJpgbT9vV2=-t2k60fKvC89r22fk+_=ewRTqtHR9A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Change Rust Binder crate name to rust_binder
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 12:55=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Currently the crate name of the Rust Binder driver is rust_binder_main,
> but I'd like it to be called rust_binder instead, matching the .ko file.
> This affects e.g. symbol names in stack traces.
>
> Thus, allow use of the #![crate_name] annotation, and set it for Rust
> Binder.

Applied to `rust-next` -- thanks everyone!

    [ Applied Python type hints. - Miguel ]

Cheers,
Miguel
