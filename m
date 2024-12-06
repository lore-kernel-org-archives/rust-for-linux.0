Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810A207DE7
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733494410; cv=none; b=XTx+VBakKJkKjtflVVJCTCfRyiQFEZl/aGd3tnlp0w4Uv8Qj5Be43aUoTOkKexIdmJRk7RjDVN9YHaoinnbbDJfuUkUvFfItRqAZ0CMSlf8JsPwtDc+8KiTiaeiUsiJtwOGlkypNegroJPGBNmd++m8qU7KwQdOORfRSFhIvtvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733494410; c=relaxed/simple;
	bh=1DF44BAXCAedUfJU1fvmYW3s55YCLMM/4Pv6fBs7ZVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FoQTfjlGIJm1GJY7PbDGtWVCtLy1BLiw2v0D3nGTa2GFVdfwrSNfjNVN7FRIW5Jl5Ywb6cHzL7rwhb+tbcEaFTe7OCssAJzgPGm/IRtg2JhFPd12VsdFTZwG13knLl+NzxT0S7M/aXxPynu05SSbF7KDa4H3AZ2ZbXzjTk7p1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lMJt2KLF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lMJt2KLF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434aa222d96so24152325e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 06:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733494406; x=1734099206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=invAFTZMnZvuIAIS0gW4T2jxGGD8MCPvZg9vdT55zVE=;
        b=lMJt2KLFKDPuiqp29DKcPD7+qYIgWANazhBMqqjxwlbxdhtZYqSamYmL6L7ovrZnGk
         6Em23nR4qSRhzUPA7U1BtTZ/eJu7etisq/arcQwdNC/wHeIgCoK6ojHdoBizJs5EU2ym
         OKIdioKBT0nTOSdlPvtZN98CQXPkUwm4laTdmIuO+epSbFX3a96+c/9DM/4V8VhX4uJI
         FYFIhwsib9wdEEGcAlkRksrcrpv0BrP4UxFBTl9cbUjcxtlUshpKtYzTjO6K6jCnPdHi
         P4vSVXOmeD5KrAOhuom7z+C2IMsP8ImTxOZsJYi58p8RuKYhnYOlWsXuDYf0fI3lOnzB
         BMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733494406; x=1734099206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=invAFTZMnZvuIAIS0gW4T2jxGGD8MCPvZg9vdT55zVE=;
        b=Vr6sYZz1Cg2GGwdWmBmmem8cJSIulGvd9JtbGmreYzrS8wlvtS5iQ4PenQV0U2A6bn
         y2Dv5DD4CPC0H99xUBEAYCQA3amSoBB76JP+ql3O9mpMdHJonDMXmqnG4CTr2854A6yy
         rMBrhnOzf+/7SpdxoxsnnPD0MSVcMcQBpZZ+Wgiik1LUhfO9W8akNBTl9eMWKimJRVjX
         y/NfI6P7GE+FMqqDYR+VmERj/Ukw+8PwEaTnR/CzAP996o7lBYdzAU69+RJxe4JRvFVj
         vqC5fwUJxs09KIblfbQXViFEynQhk6K2XXoeooRdb80eHYfSE8dURZ/mo721Q2vZKa7g
         t4xw==
X-Forwarded-Encrypted: i=1; AJvYcCWuXqJFKSO0cLz6KawUystNQjsxTPreeyIYjhAfqyLHcx0rvpZy3ZYZ3XPHS0IF+LwRhZQaKTObuNrvk7N4gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqHBOhV7CFWqU2Jer6SQREqr/3YpUePoITuizmm6phwSmnHvW
	SLxfy7JcCUcFlO2V5oGeor7yiMf2phROfBEp29o75AVHwFOv0rpQ8EKDY4UYN3coVEYgOieX2Zl
	3QUSC6D7aBOE55BTYsLNNpgbNykGvCZMVbTe+
X-Gm-Gg: ASbGncs6cLhy/bDgd22V3ahjFdC3l7nT4pjN3EYme3Rfe7xqXunOZ2GXTA03n/HAujv
	lopAR5xCNRsG74yZ1IUUQVMChGkpg+ak2
X-Google-Smtp-Source: AGHT+IF75B2Q9PZzE+uP3SRRKyAqlTWeSijFYxXXRaaA7vpUlEcJ9S0YdWujapsIeVT3nm8E9Iep1XrnCeRltZPDi+0=
X-Received: by 2002:a05:600c:3b08:b0:434:9fac:b157 with SMTP id
 5b1f17b1804b1-434ddeb5eddmr33010655e9.13.1733494406426; Fri, 06 Dec 2024
 06:13:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205141533.111830-1-dakr@kernel.org> <20241205141533.111830-7-dakr@kernel.org>
In-Reply-To: <20241205141533.111830-7-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 15:13:14 +0100
Message-ID: <CAH5fLgg4wxyar_2uPfUJ=Bcc5=SVWOoYWvoC3ieVd9ayakiopQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] rust: add `io::{Io, IoRaw}` base types
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
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 3:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> I/O memory is typically either mapped through direct calls to ioremap()
> or subsystem / bus specific ones such as pci_iomap().
>
> Even though subsystem / bus specific functions to map I/O memory are
> based on ioremap() / iounmap() it is not desirable to re-implement them
> in Rust.
>
> Instead, implement a base type for I/O mapped memory, which generically
> provides the corresponding accessors, such as `Io::readb` or
> `Io:try_readb`.
>
> `Io` supports an optional const generic, such that a driver can indicate
> the minimal expected and required size of the mapping at compile time.
> Correspondingly, calls to the 'non-try' accessors, support compile time
> checks of the I/O memory offset to read / write, while the 'try'
> accessors, provide boundary checks on runtime.
>
> `IoRaw` is meant to be embedded into a structure (e.g. pci::Bar or
> io::IoMem) which creates the actual I/O memory mapping and initializes
> `IoRaw` accordingly.
>
> To ensure that I/O mapped memory can't out-live the device it may be
> bound to, subsystems must embed the corresponding I/O memory type (e.g.
> pci::Bar) into a `Devres` container, such that it gets revoked once the
> device is unbound.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

One nit below. With that addressed:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +impl<const SIZE: usize> Io<SIZE> {
> +    /// Converts an `IoRaw` into an `Io` instance, providing the accesso=
rs to the MMIO mapping.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `addr` is the start of a valid I/O mapp=
ed memory region of size
> +    /// `maxsize`.
> +    pub unsafe fn from_raw<'a>(raw: &IoRaw<SIZE>) -> &'a Self {

I would use this signature:

pub unsafe fn from_raw(raw: &IoRaw<SIZE>) -> &Self;

Otherwise, you're saying that the returned reference is allowed to
outlive the IoRaw instance, which wouldn't be okay.

Alice
