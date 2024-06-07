Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15C9186295
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717757510; cv=none; b=F8mIFSZwJAJhqzBYG8kBUy5e887jsQjwRYC33nMqbPD3f2EU/CrmVYbRyalyGMlv5Gl3X2RZnQvyaHT/xSzzGkLtjailX80ndd4dSH4wFcqqKaREIgzaCXBEC4eStCeXZIu3nmc7LMyBR+cAcza1+KhJSkLi6Q5028a5nuOxl7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717757510; c=relaxed/simple;
	bh=FFbj21ozJQKf4i41vhO+He8GzAZG9POBGWSpHtgddTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHKr8ho+xRd9yYIqhd9LDob7JvFztNQ2WTALS8PfiNzP9uh9hYkpUTrt38u5DaorjjYyST09s0o4TssM0s9l8Nh85bhuTYlrVf5S5vNGRrxHr9cTNJSWRDLXjs7xx2hE1pugwYk4P6ylZsPqGlssyQ2tGaEmOPeFz5cGlyMP+Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ln5YiZc6; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ln5YiZc6"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso19834751fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Jun 2024 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717757506; x=1718362306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmeXUhFF655AvDeF8viECIcXvU5zP377LCGo+5Zcuww=;
        b=Ln5YiZc6E7N94HOps5slmYwc9HJA7Ba9+LauR5+WSsJFdeB1/iRMZEPKoD7NO8ajvv
         mGHMtcmji+J5fTo5hVYtcV6AzKYTJDluItgCGWyt7yGpxPrvmB/qX/uObZ4/AgRaf8fU
         W6Kxh+S4AaXzcl41LmkI+uVRGOV3J34hidxM/S5ym2zsHs45iWNpBpSxoYaJmqFA3lWX
         A6XGlNxINwrX5KBuKArVbh92vUuQVPMmesL+J/O7b7+cjlSYIF3p11dyV7l5jzE+w7Tw
         3WQXijnJQbjl+X5hFbKzogmnfHPc4+wHjl5h1tBZsL9Boqu5t+oKqpm1iSRQ0vJ8iggM
         +FrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717757506; x=1718362306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmeXUhFF655AvDeF8viECIcXvU5zP377LCGo+5Zcuww=;
        b=dUeQ90lfjq3AzQPNs03bj63eyKhnaIzTF1ttCWmmAB0sZ9YRMTN3EC2zGnF5dbxVR3
         qhvrjs2mmBMWVYMgxZKhm5jk46mDloXLz+/0fxmFD8iEN1z7x2cqKWJlZvxzW4NLnOXh
         KQJ4HzJU0GKv153R24hZGmJRYwyzbcIPqG4k43b1cvgQt2gRlmBTxFbtIGzhmTYvbP2W
         gA1bbFj81nlqgwMMrASg1Mwn9MEd7/TEDdxbCtrPoLdq7zCrEnu6jOQwi2766R3S5YiE
         mIZa/4wJnRkpB5ePWY8V1wxyL7RRpRCJrAVTPMwFoLdALgacfriuEwM1NUCn19s5WVHq
         /H1g==
X-Forwarded-Encrypted: i=1; AJvYcCU8m6zPBgJh4/pkLhkSIasSOEcIIDjn5KKz9kbn28OY7rt5Hc5zSzH9Zopmhom1WZ5J+J/EJqr0HfHhuMeLm7i26sY8ZcfFGYUdPZqkMdQ=
X-Gm-Message-State: AOJu0Yx3wOCCiM9Agwwkue2VlAwAhWJDBQaYofXq6qx7v1L8J62BZ+CW
	B2kIIwLiDv9+v5UlxdChR5fmneOUsO4EYE+sXWFVLlPl2ZlscvGy/SDMcXBCzCHtPOu4PKPH7QF
	kPd6yB4x11DT1nxR/MKJoJU0xELaFshCZSmJY
X-Google-Smtp-Source: AGHT+IEFeA+ZKzhPTRkU9THjSAXPFZL65kZKzyqLrJjbcP6cigRGWjQ8n8Uxp6WFaK9P/DGcdNOxRalnf+pNS3YoNsA=
X-Received: by 2002:a2e:88c6:0:b0:2ea:8291:c667 with SMTP id
 38308e7fff4ca-2eadce24b75mr13406881fa.13.1717757505728; Fri, 07 Jun 2024
 03:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1717750631.git.viresh.kumar@linaro.org> <e74e3a14e6da3f920cee90d32a023ba4805328a0.1717750631.git.viresh.kumar@linaro.org>
In-Reply-To: <e74e3a14e6da3f920cee90d32a023ba4805328a0.1717750631.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Jun 2024 12:51:33 +0200
Message-ID: <CAH5fLgjChZCtTUnHVHJat-sXFyLVE+MgDXrNDiUD0LNsUndpBQ@mail.gmail.com>
Subject: Re: [RFC PATCH V2 1/8] rust: Add initial bindings for OPP framework
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Erik Schilling <erik.schilling@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 11:12=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> This commit adds initial Rust bindings for the Operating performance
> points (OPP) core. This adds bindings for `struct dev_pm_opp` and
> `struct dev_pm_opp_data` to begin with.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

> +//! Operating performance points.
> +//!
> +//! This module provides bindings for interacting with the OPP subsystem=
.
> +//!
> +//! C header: [`include/linux/pm_opp.h`](../../../../../../include/linux=
/pm_opp.h)

Please use srctree links instead.

C header: [`include/linux/pm_opp.h`](srctree/include/linux/pm_opp.h)

> +impl OPP {
> +    /// Creates a reference to a [`OPP`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is valid and remains valid for=
 the lifetime of the
> +    /// returned [`OPP`] reference.
> +    pub unsafe fn from_ptr_owned(ptr: *mut bindings::dev_pm_opp) -> Resu=
lt<ARef<Self>> {
> +        let ptr =3D ptr::NonNull::new(ptr).ok_or(ENODEV)?;
> +
> +        // SAFETY: The safety requirements guarantee the validity of the=
 pointer.
> +        //
> +        // INVARIANT: The refcount is already incremented by the C API t=
hat returned the pointer,
> +        // and we pass ownership of the refcount to the new `ARef<OPP>`.
> +        Ok(unsafe { ARef::from_raw(ptr.cast()) })
> +    }
> +
> +    /// Creates a reference to a [`OPP`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is valid and remains valid for=
 the lifetime of the
> +    /// returned [`OPP`] reference.
> +    pub unsafe fn from_ptr(ptr: *mut bindings::dev_pm_opp) -> Result<ARe=
f<Self>> {
> +        let opp =3D unsafe { Self::from_ptr_owned(ptr) }?;
> +
> +        // Take an extra reference to the OPP since the caller didn't ta=
ke it.
> +        opp.inc_ref();
> +
> +        Ok(opp)
> +    }

I would recommend a slightly different approach here. You can provide
a method called `from_raw_opp` that takes a *mut bindings::dev_pm_opp
and returns a &Self. The ARef type provides a method that converts
&Self to ARef<Self> by taking a refcount. This way, users would also
be able to call OPP methods without giving Rust any refcounts. You can
compare to my file patchset, where I am going to rename the equivalent
method to `from_raw_file` in the next version.

As for `from_ptr_owned`, I would probably rename it to
`from_raw_opp_owned` or similar. It's often nice to use a more
descriptive name than just "ptr".

> +    fn as_mut_ptr(&self) -> *mut bindings::dev_pm_opp {
> +        self.0.get()
> +    }

I think most existing examples call this `as_raw` and mark it `#[inline]`.

> +    /// Adds an OPP dynamically.
> +    pub fn add(dev: ARef<Device>, mut data: Data) -> Result<()> {
> +        // SAFETY: The requirements are satisfied by the existence of `D=
evice` and its safety
> +        // requirements.
> +        to_result(unsafe { bindings::dev_pm_opp_add_dynamic(dev.as_raw()=
, &mut data.0) })
> +    }
> +
> +    /// Removes a dynamically added OPP.
> +    pub fn remove(dev: ARef<Device>, freq: u64) {
> +        // SAFETY: The requirements are satisfied by the existence of `D=
evice` and its safety
> +        // requirements.
> +        unsafe { bindings::dev_pm_opp_remove(dev.as_raw(), freq) };
> +    }

Is it intentional that these methods take ownership of a refcount to
the device that it then drops after calling the C function?

Also, why are these methods defined on OPP when they appear to be
methods on Device and don't take any OPP argument?

Alice
