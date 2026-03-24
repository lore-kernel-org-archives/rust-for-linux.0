Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBDE2459ED
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382444; cv=pass; b=sQqhk0ahInx/J0fs05RBrAwfDIRO4SBmIUZilB1vHhsJWpxmuYiJLvHufZjJJxxdtBfmU1zsvI2M5cA87HJ6SppeVhHWqj7QQaLd+HrRVTFSD5yliWvxgnV+sT+MEGeCqO25iiSOrhYeowJw5SrSuEDGToplekDzDNEQoNoHjF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382444; c=relaxed/simple;
	bh=apjgTDH0CpUWEuryTBR6S8FovciONGraeN0W4SBRyD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCjtAey/r7oPQK+sKwyGvansaCRUdvrx4uWNyeInn5o5nMzJJ0P5njuyeGlnH4qzRRHu6zrGMXH5kaEOqQOiDlqhSQTOES8wSor6O+aqf/6DtmAgLmEqFsgpZ7qjq4w3l8KnuPUw9SlbfRW8uOrtoN1ISC6JRE/F92EFWsnLd2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tW3/bV7v; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tW3/bV7v"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b88b7ca76so174142f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774382441; cv=none;
        d=google.com; s=arc-20240605;
        b=HTAGRbF+JuEPEV08gEZLnkcx8TSO5YgiMUpZLrivI46+Fgr3B1ZU9SyKBAOtr8eE15
         fuFVnKGyT21QE2PKfpi4pE63ctE2233D82/MW02HyI32jfTQlGYrRvfqfitLx8IhVITf
         j23NbZ2EROr7AOHhliI1SAxSSPeV47+aaNI8iyUyiIc+Uy6VL+d2Qgp2M+Gy+YrD03B7
         prI4WERQUZccikdxhw2tc8fi7+1tEuZ2UdfOZGMhl+AyeY18OdtMRrStBazv6tO12XDa
         7GfAK7XBi1sxn9oe3HoRnmLwLsYjg6gHfJ9lFmXUUvW3wLKOzhp7X2uS5B8rbhsG6gw5
         sq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwO6DgSVeYT6hpg3FFTK8bqSIyJvGzb9D1+RwWdUOKM=;
        fh=FrUQvaAc+Eyo9tAhk/5Uw7VgGLZP0qevTZ8722Wksws=;
        b=N644DnuAG+gBnQGVcPwYSnQRuez/fpx3WLx13G/PvcstmrCBuxH8k0KDyX2jATn281
         w7sJwaTUC0JG67Mjvt8ubC/zB8i2MYm6WWoLRS2yvZ1xhNeeIPUYH25DAIlCHsYvmGQy
         G6uyU/OAKv7NrBCP5R5I3uac/Hg663pU7nb8AQP79nnT/G+97z1eg/bhk5rFUlVZ4J2K
         CQFyWlYAZ/+agemaQB9sJL84ESQPzN9vWWosXpIgPkfC0DBWkNugPNFXyGYQpOt0PhZg
         tM94wIGQtrB8r5oleQ44Z75Y7Y+5tYUrq2q/vB89eJ3G8jEV/PBVQ+7WxuSOXCtzoPI4
         MvHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774382441; x=1774987241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwO6DgSVeYT6hpg3FFTK8bqSIyJvGzb9D1+RwWdUOKM=;
        b=tW3/bV7v6nVX6aPrInDgqeUzt7zjmXjQyT2VD+0AWOUytT1FNj9wr/5YMSNxlOnekP
         v2pEUp5krw3PpTlaI0A29iUemP+25mfLOUHhBQudFTehXiURF/QmJwTRyee5mRAQFHA6
         FpZ/+q5WOn0Z4pGxsTZDJEhXYFBhqm4QWcE5h2pbJLiricz4o7nSHnVMTdRN+1BNgyrz
         xQuZyo6CI0Jo73p6iM1KA5SSB2ievOJ9vNsoFZwXzDE8fPMqlNFR+4GdeQonOiYCcaZd
         v+sVr7n140S2Wb9uwAqZOPTOOhxsqkbhnPZNsbeeoDnX0rdZMobdQ+yaFXyQjxvZSuUW
         4AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382441; x=1774987241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SwO6DgSVeYT6hpg3FFTK8bqSIyJvGzb9D1+RwWdUOKM=;
        b=j9J76eKXH/nolGfGqXcV8uvxk60Nfmcf4IAOXG22t0pxUQCdmtT4leEWl6WZ1nqJLV
         cnSBjT/53g4F2uiEvb+gS4lTn32IokBeP77CVp+FeypFZA82Gxg4TMdlOaD8jRU936uh
         G5xPvJ4JLtiicKZnZZm1AaAxvrq3ynDLkMHyRla8cLsML5MxT0hB2T8yeQULraOb5h1Y
         ih5bGVVIHn4V8BPKI5CtZCbjDVWOBYZyBUEgA3M0Pwpe2ifLVkeZfpjV1q69e50GxU/H
         CtD/cW+r+D4hSpaeiZ2htujc67354WCi4YsPyu67bCN0hJTLPN/CPx9Ci6OX2s2NI73u
         uY0g==
X-Forwarded-Encrypted: i=1; AJvYcCVwyOh9QWYhuZsE8gu5HOch2/9xvFFHBOuEIccL+cvLqfxJmKl5iAUsKll7/yc02NSqx7syJJyS55TR2w74dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpSLgMiD5xdwmNKs7GD2izjCf3XQ6DE0Gx2ZMrgGrsf4oXxl0F
	tG4Sle9YnMEcAQ5e2AcVpkZfcOEYjrBoTy6ITn+GGygC+lVnp1doKgTIrWRtKmVkTZEhcDtN4za
	rvjZfSYMeiaxQql89KMhEdDxQsXDZZrbSF4ZehPQ4
X-Gm-Gg: ATEYQzy5QamxOEEsd1mhZbYmS0JhzM6tXpD66K60u2Tm/hKBRgJFLYXM86dNLwe0gxr
	TBTU7ImUbLkheZ29kxqSh/tKrj/II5BPiy0794n1lwhU0ZpaY1afPW6V9jeDcs5ecDxWKkRC8md
	BviyTu4LvEy7AUNY17GqAOblenS5Wj2wjeG846QMkIL4EoQcZMVS+7+5IZtIO4Fo7V7aN8a8FRY
	Ol6Ty6qX65+gza1t4Wvqd4xYw2Nkrhqpk8ZIPBZCvmDOMvyAv14NzAi/afoAJDlbco4zbTYksjb
	BFLOnSXex+KpFT4ad7Qb7rkri8la8r0W6eBAoQ==
X-Received: by 2002:a05:6000:60f:b0:43b:3d44:6624 with SMTP id
 ffacd0b85a97d-43b8896cf00mr1140421f8f.2.1774382440953; Tue, 24 Mar 2026
 13:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319212658.2541610-1-ttabi@nvidia.com> <20260319212658.2541610-3-ttabi@nvidia.com>
In-Reply-To: <20260319212658.2541610-3-ttabi@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Mar 2026 21:00:29 +0100
X-Gm-Features: AQROBzALZUi29WfU1a-jACSNSYdcFGoimkObIS8041H6z-4zeP3LaMZWYzdRJTE
Message-ID: <CAH5fLgjmzHXaMtdQvPPB1DnBTE-zgKGkLn03wSyEk=Zu8KTD4A@mail.gmail.com>
Subject: Re: [PATCH v11 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	mmaurer@google.com, John Hubbard <jhubbard@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:27=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrot=
e:
>
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u=
8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers=
.
>
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
>
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Tested-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        // SAFETY: Caller guarantees `from` is valid for `len` bytes (se=
e this function's
> +        // safety contract).
> +        let res =3D
> +            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), from.=
cast::<c_void>(), len) };

Please double check if formatting needs to be tweaked for clippy.

Alice
