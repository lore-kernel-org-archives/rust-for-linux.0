Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B841E1C11
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733493454; cv=none; b=OEmb9dI08E1W5Aye14qpD8dJP7yL2GYkoItMxKpAL98EulVAum++OwoDAob0uY7YD4KqbqJSBRIzydnbefC7IRoKRnp12EKw2Ig59TxO8qwjnZtmUE5iCCtJhHEVg+kfiMnio268JA8bYB73XI24bK5sabx0hZ9OGjWk0QX8HIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733493454; c=relaxed/simple;
	bh=fiLpHl8kskZJf92XZBCQSNQh0EM/rPino4TCddjjNa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDhu+KtK6Swg/vwKx4r6tCVFtyXjci/E8wYlHIBpghb60O/3OFR6A3ZhJL3OBBRagrrLSlU39j7oONplJZ/CGcgCPFqzmfwiiZqfrtC9yx7DHDT1m2E9/7U4rpFg9/qq14vYGKWVTMZKArvNU3pJ3+mgKXDUMazKJxbat3pUT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AvYoSDKS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AvYoSDKS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so1709135f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 05:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733493451; x=1734098251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDyT0nGxXbja5Q8/labpY0AGckKUvtd7GbprKAY57M8=;
        b=AvYoSDKSCLxYr2qJ9WJYdJyxNdwdVzH2QpufLN34unghI9e48l4BdxZcLRoBFcWYcB
         cbLgeg4nMqqCFrq4Uin8fFmFtKSiiQWLAndZGnMw8jf8jcvA4c9uB8zezR61m85Xwjt9
         eAhkuUdh8u98jKE1CteId+lUsz8MCwORlo93OGUdd/Vi6Wq+U1bTDuWn2PE943AOmAzk
         BfMAXxWdiNiCYYBQo/DN94/UNZ0PdU9MeTd9KU7lx0llZkLJGpy7NaEs51bCdAVTkLf0
         jgBzRuZh8pEnBcWXeiayq+g08pYDKfRnUd/zAxkuyvZUfXd08R4R0WifhsEPLApu0HkR
         76Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733493451; x=1734098251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDyT0nGxXbja5Q8/labpY0AGckKUvtd7GbprKAY57M8=;
        b=gnoKbGKNIAxKCIWz7FOrErjrs844f/dLwYYKbpH+TFeMj8Otf0enJa5RUlqW3IYz1e
         6i2XzmVv44+oPxq+L7H4kjpHPOoTnE6iBMrqp4WOJqNoKa1j9W0CQLI7VcTQ00FfYWSZ
         9aSqCQkBdY2+u90umRmv21bZbFNRhEAw0Lj7PBWg33Mt+9NVPfibaw9Ze/p1MC0QPspU
         pPtZEVvVzzVvztVs72kezZ7CkScFGcR0TUXCpCKz2EhOS3/tVGj+5YT/epaB4p1PWssB
         Ms226yiRHevgMpDwVf9liySMtzwOHgmnXkB/e1bgD6DDX4QA7TojWuFDFGHwgN32wMYj
         upNA==
X-Forwarded-Encrypted: i=1; AJvYcCVv0PAc+5FPE3Ny5s+GDrtAMDItvuSZe4o+0nfCFVow4t9ByAnZakYDXP1HWhLpnBIUO8HzRsjpJDAdjkuWaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTpdDm+sesMNvdmw4FhSqTU6nuAmHBxI2OFZHtgQWwsbHnMWKq
	ejNjljlPN5moFCBoWEJwZvzL9WgtNHSlMQd6mOEWF5oj6WAN0MQNufxSo9jKXm2T44o6dLl4qye
	9a21JlmdkzwqSgSeOZ1/LVa8quHdGoxzsggTk
X-Gm-Gg: ASbGncu6T/v8o++rmgANM/KDibXhaxwTGDUQJf4raFnan85T1JNZD+d4yhFbkE+D9CY
	ooPSq6vdwGIGA52rkPnkNghp74gF+zq9I
X-Google-Smtp-Source: AGHT+IFVl6C+eSFuu9yGxEcfzxTahR7P+lh22t4H7dnq5rZTDhoIXpqQ/0j5yDdZDKZ/gkNWcTIdlAv15QqNAyld/Ak=
X-Received: by 2002:a05:6000:2cd:b0:386:2ebe:7ac9 with SMTP id
 ffacd0b85a97d-3862ebe7ddemr1414917f8f.33.1733493450776; Fri, 06 Dec 2024
 05:57:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205141533.111830-1-dakr@kernel.org> <20241205141533.111830-3-dakr@kernel.org>
In-Reply-To: <20241205141533.111830-3-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 14:57:19 +0100
Message-ID: <CAH5fLghRVFAb06YYfUbuyuR1pOK0cHzGk6A25c5hX3CyvMm+sw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] rust: implement generic driver registration
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, fabien.parent@linaro.org, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 3:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Implement the generic `Registration` type and the `DriverOps` trait.
>
> The `Registration` structure is the common type that represents a driver
> registration and is typically bound to the lifetime of a module. However,
> it doesn't implement actual calls to the kernel's driver core to register
> drivers itself.
>
> Instead the `DriverOps` trait is provided to subsystems, which have to
> implement `DriverOps::register` and `DrvierOps::unregister`. Subsystems

typo

> have to provide an implementation for both of those methods where the
> subsystem specific variants to register / unregister a driver have to
> implemented.
>
> For instance, the PCI subsystem would call __pci_register_driver() from
> `DriverOps::register` and pci_unregister_driver() from
> `DrvierOps::unregister`.
>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

[...]

> +/// The [`RegistrationOps`] trait serves as generic interface for subsys=
tems (e.g., PCI, Platform,
> +/// Amba, etc.) to provide the corresponding subsystem specific implemen=
tation to register /
> +/// unregister a driver of the particular type (`RegType`).
> +///
> +/// For instance, the PCI subsystem would set `RegType` to `bindings::pc=
i_driver` and call
> +/// `bindings::__pci_register_driver` from `RegistrationOps::register` a=
nd
> +/// `bindings::pci_unregister_driver` from `RegistrationOps::unregister`=
.
> +pub trait RegistrationOps {
> +    /// The type that holds information about the registration. This is =
typically a struct defined
> +    /// by the C portion of the kernel.
> +    type RegType: Default;

This Default implementation doesn't seem useful. You initialize it and
then `register` calls a C function to initialize it. Having `register`
return an `impl PinInit` seems like it would work better here.

> +    /// Registers a driver.
> +    ///
> +    /// On success, `reg` must remain pinned and valid until the matchin=
g call to
> +    /// [`RegistrationOps::unregister`].
> +    fn register(
> +        reg: &mut Self::RegType,

If the intent is that RegType is going to be the raw bindings:: type,
then this isn't going to work because you're creating &mut references
to the raw type without a Opaque wrapper in between.

> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result;
> +
> +    /// Unregisters a driver previously registered with [`RegistrationOp=
s::register`].
> +    fn unregister(reg: &mut Self::RegType);

I believe this handles pinning incorrectly. You can't hand out &mut
references to pinned values.

Alice
