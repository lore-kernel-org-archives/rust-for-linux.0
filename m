Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875F15530C
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 07:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023342; cv=none; b=Y8y+7IOuJK76edlkryT3ztA4WzR9hLJAcWLi3d30IlrWky0jePFdSiS0IiWboCKrpYgLkMn+n8QqXdPsPFrD5HorfDXolcJdzEQAWfI5uoXqlQbyTY4Sllj1EM/Oiet0Ayr/AT4+hzJu/BmEfzbA6FAxxNtg595nnuK0xihU0yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023342; c=relaxed/simple;
	bh=Y91tevR+W6PcM+zpcBt8Z9NKZ5dKqVTzohjnHawtCfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdwG+mhxLmYqnRUSZkgq1WNczL1P9xSF85ILPsE/V2gatpYesJpqXl7d4zUsMMbiyMb8DcLEFq93ifUBfLUEgiXmjNyhwv7r6iSqNLE/4GSZWV3d5LPY+EQ7R3LR+Lm2rtzbCPUjPOpiSdFmaK4ex2B4lkuVwZunzHeAIa2a3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u89felaa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u89felaa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0ac853894so5960167f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jun 2025 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749023339; x=1749628139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2JrrLVXtWq0ZlEcT+ggQ7B1+aTqnF51jgo4AjW5G5g=;
        b=u89felaa6rJPLj2BXSVEpXoWCc/3bh8E9mlwe4TwkNOOTH48hcnECupGO/Sz5w22Dq
         fqe9ovah4PUKJdl1Pb+CFDnjSoB4ZbZmzIpfwKzsQC8VnzvMY7u0gG1/ZtEuhthTBNQT
         eY6cJZPY68RHEvipIt89OqeN145D/OMKk3WOMMgSa9pcNsUTs2LK408Nvr6SVzfOLqLx
         9cqqG7L4HZuVQSRA2S/wXNDntSRKvi44Bj8UC44C8YJFGRjUZZY0m+rPMxl9W2/kuOWF
         O0nK029BVEu4qHsF9+rnqXE0RYtIno8zq6Y2GEevQI2JZnCTsxmGVYxvKbVAsre951Vb
         LEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023339; x=1749628139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2JrrLVXtWq0ZlEcT+ggQ7B1+aTqnF51jgo4AjW5G5g=;
        b=P+D7wE7QL1Qo1K18I7jHPdtvy6F1fOFJ1P4LdbvGxVIWWVKe2wmxvhSyhzqfpSCIpv
         9cDbSzfOhF0jD62Usz+MRRsYv+ELqsaRhgUHeWX2F9miuafntBVHXk2lHj26TqDVBlPi
         2k3LqvqdA7kRmtp4Yh8+dnQk8Zm+P9SUrGF+7j/SnRM34M2TCot7n8+6xdTyc01gA8Ei
         yhb30w419jm8BszGUUoGTPCx0swR5UCbmsMJ1i8HQ0C6dEO548O3xHMonkhSxx7QsuVK
         vWEqsEnnpElVxbzIVZxXw9QpJ67HEC8CNRYp5ipRdKrm53NrXmT+V/1C+oXunFboiAXI
         SGxA==
X-Forwarded-Encrypted: i=1; AJvYcCURSLdOTzsuzCWrFxenYxaXveVGUhpCnNLNh0vsTqwn3VJ0EJLDqCrra2z4pZqxmCIy/pduzZGxwAWH63lRtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5w/HQ4LpkKCzDaBFA3+honhvRnBIgpl8RttSo/a6gYvvvroy
	5gpJVLALHQj8dSnXJ+q73cI8AHKX8kz1GcRaKeSj0ZDSxxk9RYyAfOTCF9rhkD7oc0FC56N6jch
	zj4o9Km8E3M9YQq8IsecISLnFcUMBhBP4WVV6D7B7
X-Gm-Gg: ASbGncsUWDCyuXI0b6H1LVy9OiNKYMD1Bas9Gdmosyror0/NPNb5NiY+/3zBwmqTbFy
	GrwW0E3uy3fyzH8cdBwnFqyEcxM2+NboiK7uV0LA/6NAddm5DJ2h8y2+JrAcR2A7Cepu21O/KQc
	k/e+dA3obvgMjUXqzdVw5ztsd1NU3F1TpGd5D6u3VE+3gTp4xCCFOnI15A7pUntTOWlQr7QfKd4
	g==
X-Google-Smtp-Source: AGHT+IG5fofWbTd+9m+cs8Z7tCQ3tl+PCcjzqzka/RHMWIN8bFHJ9Sf5raaS3fFJBTe+KjOTZgpIqj4KeLulT47o4j8=
X-Received: by 2002:a05:6000:430c:b0:3a3:648d:aa84 with SMTP id
 ffacd0b85a97d-3a51d9244abmr1399593f8f.5.1749023339205; Wed, 04 Jun 2025
 00:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org> <aD3BN7-MAyYq2NAX@google.com> <DADKRV2K4A5I.3UAZF5O9EW6R8@kernel.org>
In-Reply-To: <DADKRV2K4A5I.3UAZF5O9EW6R8@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Jun 2025 09:48:46 +0200
X-Gm-Features: AX0GCFsuec_TXyVmEM9CpLpMb7PLpxoI4bzL_Ly2apsNuRiv8yFkcxrhqPX8rOQ
Message-ID: <CAH5fLggaX18dAzWqLLkn9ii+hpu14u4aY5vd=kSCkk6LvsW-eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 9:37=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Mon Jun 2, 2025 at 5:20 PM CEST, Alice Ryhl wrote:
> > On Wed, May 14, 2025 at 10:04:43PM +0200, Benno Lossin wrote:
> >> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
> >> > +                )
> >> > +            });
> >> > +
> >> > +            if res.is_err() {
> >> > +                // SAFETY: We are returning an error, so we can des=
troy the slot.
> >> > +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*sl=
ot).handler)) };
> >> > +            }
> >> > +
> >> > +            res
> >> > +        };
> >> > +
> >> > +        // SAFETY:
> >> > +        // - if this returns Ok, then every field of `slot` is full=
y
> >> > +        // initialized.
> >> > +        // - if this returns an error, then the slot does not need =
to remain
> >> > +        // valid.
> >> > +        unsafe { pin_init_from_closure(closure) }
> >>
> >> Please don't use `pin_init_from_closure`, instead do this:
> >>
> >>     pin_init!(Self {
> >>         irq,
> >>         handler,
> >>         _pin: PhantomPinned
> >>     })
> >>     .pin_chain(|this| {
> >>         // SAFETY: TODO: correct FFI safety requirements
> >>         to_result(unsafe {
> >>             bindings::request_irq(...)
> >>         })
> >>     })
> >>
> >> The `pin_chain` function is exactly for this use-case, doing some
> >> operation that might fail after initializing & it will drop the value
> >> when the closure fails.
> >
> > No, that doesn't work. Using pin_chain will call free_irq if the call t=
o
> > request_irq fails, which is incorrect.
>
> Good catch. That's a bit annoying then... I wonder if there is a
> primitive missing in pin-init that could help with this... Any ideas?

I believe initializers for underscore fields would do it. We could
potentially abuse the _pin field, but frankly I think that's too
confusing to the reader.

Alice
