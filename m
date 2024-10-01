Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D4A1BFDF7
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782151; cv=none; b=aALbghWkHERxGykhj8icCDTl6Ntqh0w3baSkalMhaeqvg71UEQX+kprg+HjBKAcd+JYxEMYPKJDxpc/rQ6QlkCD62ARFGM/ULXKZDLmH/68VSOzI0bU4RWkqRvp+N047qtXL+ujuPvYg8NP7ZEE/8yBo+QNllHAkjzxOES9e/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782151; c=relaxed/simple;
	bh=wRYe1vcQI0lZ4YwSx4XKpg3rYqAFEJunm9v7pgh1H1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pc9ngRnUxHaYt8C7FYXDUMPZrUsLZcRoMzCvARKg/s+sS6A0g93vZFYrU6PS/aMJPhl86vjNaFiSJDq1hZdo7l2qx1EfiDuJPEiv2UAGmr9VzJkJcashoxj3V5inxvbGYNtb5KE5xtSRNXwDnbqYCGMlXbZPOgB+bUmxRaLyWU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=adaidGRe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="adaidGRe"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ccfba5df5so3485784f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727782147; x=1728386947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0EGqao/z/3uTPQ94VdscyZy2iIMPcbVgjbB5vcmiAM=;
        b=adaidGReAMjv7H+AYMtEOGAOHxoiIgw7QQZ/eKSOTS7vYtqAECZfnWBAb/DFkAQrjG
         F2vEgnsC5R8VjAO5m5ttTytaPM1quKVO857VCyX7GmOsH31GS1kD9L+A6hTuauRYN/DH
         Jyp62jAjEfKt74PB4blJtCyxNzLFHiRb5f46P/QTg9k5WgmbZKtnnyaC1SqHwM6e1oUX
         nNmVjr5hkuHJLOkXUYhNIxN81iUHzBuSCsQoW3o0Gvk2jRqglISsd+C/iWZNWdrOt2jB
         5/00aD9cVV2H7v9m78cp3SG3gYFQOfo6lBTTAxEsCF38EaezACk9YwuJ3bJAUTi4h6NR
         Nu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782147; x=1728386947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0EGqao/z/3uTPQ94VdscyZy2iIMPcbVgjbB5vcmiAM=;
        b=XwZgrljIo3D/JC0INLEjFh6mSs9/rdfztBUMRkkSVH+i3E6V2eleBzKLJFSJu54etj
         6LogufwLudQEDN77Ro3ddm3NhFp2hxOak7MljrdAUdaLFr+OHvoDGb/vzQMVw7XdyYku
         dxgv64NVaYdHsVdpUfnsSZbgOb9Vrt78ZrWodAhf137XTWTljuBwmzr2fXv/k6d6J0b+
         asDr3HNBB1NVg1xB2+FVLQnxWjW20mKfAnFpr9THjynze4R3fWfVNRSN23WykDiRtC5i
         4xx7/6iaIhISZXwBpUUe2SDOKV1nS7rFRNEDdvDTwKB/NeZhultFMkZx4lWOvobtyNnr
         cnFw==
X-Forwarded-Encrypted: i=1; AJvYcCXVsdjwEWuca4Wq4tNasVauZ3lu8ZBJE7+ngK0XqOAj0GaSQJ72+ZeLE1SESP2vSsAkt7XQFk3QthQrdrbVsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLh2Sid/wy7O62TR+XozHj/81Uk8lV8p69+sQmKNOrbB/OgBXc
	5ThXVpaNs/ipeTR4CZKw+R24QlvtscN4MVRY1tkOp9NU7cTMMJ0IlaC45l8NXAseY/HWfaHjknk
	kcDOvJIvXIH3VdDYJmeEXE85aeM7vh/ypn5RxVqmCLak07yliNeDA
X-Google-Smtp-Source: AGHT+IHdJuezNC+cQOgCWdRYkNZbxrqMXbT01e/SnhIAXkrXy+UEqZN+0xO+ze21oJFFoxqcCO/UzF62jVvVTatBwGI=
X-Received: by 2002:adf:e709:0:b0:37c:ccad:733a with SMTP id
 ffacd0b85a97d-37cd5b3cc45mr8866453f8f.59.1727782147358; Tue, 01 Oct 2024
 04:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-b4-miscdevice-v2-0-330d760041fa@google.com> <20241001-b4-miscdevice-v2-2-330d760041fa@google.com>
In-Reply-To: <20241001-b4-miscdevice-v2-2-330d760041fa@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 13:28:53 +0200
Message-ID: <CAH5fLgjCA77nAYqZLus7TWbW7mOKC1MKn+jJL-_tpQSR-h-r8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: miscdevice: add base miscdevice abstraction
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 10:22=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> +impl<T: MiscDevice> MiscDeviceRegistration<T> {
> +    /// Register a misc device.
> +    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error=
> {
> +        try_pin_init!(Self {
> +            inner <- Opaque::try_ffi_init(move |slot: *mut bindings::mis=
cdevice| {
> +                // SAFETY: The initializer can write to the provided `sl=
ot`.
> +                unsafe { slot.write(opts.into_raw::<T>()) };
> +
> +                // SAFETY: We just wrote the misc device options to the =
slot. The miscdevice will
> +                // get unregistered before `slot` is deallocated because=
 the memory is pinned and
> +                // the destructor of this type deallocates the memory.
> +                // INVARIANT: If this returns `Ok(())`, then the `slot` =
will contain a registered
> +                // misc device.
> +                to_result(unsafe { bindings::misc_register(slot) })
> +            }),
> +            _t: PhantomData,
> +        })
> +    }

Note that right now this can only be used in the module init function
if the registration is stored in a pinned box. We need the in-place
initialization change to fix that.

Does anyone want to revive the in-place initialization patch?

Link: https://lore.kernel.org/rust-for-linux/20240328195457.225001-1-wedson=
af@gmail.com/

Alice
