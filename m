Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9547206A
	for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195861; cv=pass; b=BGun7aTwLGvWWCqxQeM6f8BvNsUX95jA3YePExVKMM3WkqKozaalKsBpgJqiOSqNNxds8SFe746/adci6ShATHWNhx+4Uj0qAE3HAqjPR5E3tKqC7yWwDmHHzNYDiq01+eQKGfZE6O4hOULVekSrLE8/F6d+97Jz5oX5aIpLKfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195861; c=relaxed/simple;
	bh=VeIm/m6wK3h90PKRx14hlNC6hcs5cXsaRzlxDGhe2Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IByzLlu6N285wmIM0LAobpaE7lhqMK06OCVv9qV6h77jXg42Ya5D7FrN61JuMxjl1ryMAteSoZYVatzbn4LOJbqMM0o2gFWTJ+juR9rLFix2WDjP3q/dvlhR8wmVLtzcVtHoZlh7iKLpBLPRqOckexAURoAIRjFQg8IVbDiWTR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=I1YP6xV4; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="I1YP6xV4"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66b32bb75beso3393551d50.2
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 10:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195859; cv=none;
        d=google.com; s=arc-20260327;
        b=oRfzCEa1nfNA3EX/NSyP1WVixqaqFhEt3JFdi5AFOamIhOTT0cV5+KMdJNEOLainao
         9gewSp9F4eUtfiBwyxyTxTpJx9SMUVKd1nyEB9yG++BIwRAa19EJSrmF8kN3NAXLZLt3
         S9u6wjEGWl9bKmGBDE7cNyy9mS0joa6kTatG5Hsa3CI934pDwb9ITeGeEZnuoV/7wK5o
         Y+lruuEaNTlgtyaykg0OvDbRHMqpw0TgFDxeY/6Kl7y4Q37CWd1HkeENF5FNrGTBT7Oc
         LKxYo90fZ5eWnvMloyhPX3vXcMdxnJgB0Tv4BevHqo/HjftYadvZ6aK5otWkCREbZC2i
         b4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        fh=gd+9bFCURdPkemcZmJQVGF9a/QYXDRAL18vZb7A+GOg=;
        b=U6ois47fbSXqt4XtGjPEuC6xRoWzhoQ6NHQj8cwCDltH57ak9cOTZgS17mQ7YMtMfz
         Q7VlGlJD7vjf6DAXSmOG3aJqLZXOMc70oqrt/UMeSyVQW6Y3A7CWZwxHjeMo+0VtLADn
         K4PSfk7ffTcDFRxTAj+jd8GaQIi9s8QucsWK0U+bfkuEEZGYOA5RknTE4JCIJoha82u0
         izRmqlkiQ+dr0cqcsTZzlRNRrh4RV90vU2wLmtmF6XnvFSzit/WRlzG0h9hpyGOaK9ZW
         FWsey7njMgdx5Occ+KZ/RQgT8axBN2eEJgHMCtcyDnHsOjAmbW06zyFF+Q1kv2U0eTZX
         t4Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788195859; x=1788800659; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        b=I1YP6xV4U6qxteWKhCgose8iubH3bAkKbX7/2mdpGfnvHzQDC93razNAa4ebhg6v61
         lzVNdecNXCF9KA433PueNN3TNZUiFmHC7puJP6lhnm7ebL7zrN2BuSbkiopLp1CL0YrD
         bf9tTDVCB/9tlRcACqGobBlVSnQDe+w2F9fG3Xi21KyV0Xa1JvbAhXlVVHr+MhJdAtZp
         ZkqVwbWcpYP0N/uV3n2vNwNWqrbhebuZ1PmhTl9Hyx8IEfKgAwS8S/cdXO96qjQT/32x
         suSOhkVCCNg6uJdZ9B2zEivluzxWUbOX66Pe69FHGa+Bq8EV/gsM0nVUW0ihziFPcwGX
         Fp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195859; x=1788800659;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        b=CJ/0mEd/HtI1vPZ9qpIyxxpEgGUlGuqf4dlFdBjvLHwV+KUreH5CwDTm0rWoAuzEqW
         FQ1vQtZ/6Bv4AVH0YD0urw9ifEvDiogtK18acs+WKCfmJkFeoCKyxXQr9c/toX/Yz/5a
         RMV9yjgWnYyLlzFk46h5b4oxtSBeaucxQ0aJ77LxDQE5TFUeO8NMNm/2XxbhYA0A8cOM
         HV5+OxTXqUunPPEXmbAWcHMkVQzGOIeDJdzt64IY0Y8nTD+YVRRD35Mu5rrkooz773yg
         Vlk5eRR7ADKLtjZNz9Bk6/J8r8g7TB+eh4eaKH1l5IeW0lNbXTL579okrfoiA+VzkKMN
         UPbA==
X-Forwarded-Encrypted: i=1; AKwUvBzE+5wiCr5SSbbCEqh8fKcmtEn88B6q7dc9DOFpwDfs8I31LkN3M3OCfTIXOpRVLZWZfBhb2mgMa9fMDoGDQQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJYggVpjUqjQ1+k2W/QoUauZ5UjvYSMkODC0eGdeqW0glyD5p7
	6yq5aoVca86+ZprXDDB4ULqDugtUahvptxE2B51PokEa6rMcEEflilWgyPcESZWer1n755H2Nqq
	vOVVYCr7HqulvDK0/J+Fqahuz4PWfnJqh4jArhjnH
X-Gm-Gg: AYBFou3eFuEbhDhRE/2sl8rjd4C9IQVPfiXf8fzXh0qJVFiAvFG1jIbkcBfaWpuh+m8
	TQsskHDNLKYGIRuOSYF4wId54zFpFTJFszFOnNFP7ysmIGDyKgEIx/DqD9DDcDr54EzCIslliT0
	D/wuOhKNr+dm6YOVkIRhpv2DQ4WTKdr4Wk+04MY0nbbOVQhjGTXL2ourbnOTTQ07SGY57gB4d0L
	mFzf8kZONa6xM87W+mQpYEAB0iPPhLGg81YtFl7tUZdIzOMeSx0UOkgcT5KySicVKlwk/niydXa
	qUB/5u9/W+mn2RkFoVreeNkXyLfmWaFt2vxZENC3EbLqbiz6+y6uBznQF/sPrkZBemtaK4dj7iR
	wP5sD2GvxMrahrhdOsQz/nZU2T3UpwfmS++4=
X-Received: by 2002:a05:690e:118b:b0:66f:8797:4049 with SMTP id
 956f58d0204a3-66f8797417dmr773051d50.17.1788195857652; Mon, 31 Aug 2026
 10:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163101.4168-1-mike@fireburn.co.uk> <20260826163101.4168-2-mike@fireburn.co.uk>
 <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
In-Reply-To: <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 31 Aug 2026 18:04:05 +0100
X-Gm-Features: AcwNN1XxcyYJm1eBwRWa78c6Pv6t6O5HEJXmbaliVctDsN19FsugaMX_VtVZTog
Message-ID: <CAHbf0-EzHGuQ720V1g84U8Ys8HS+Lpdfdu22zZmB42G8yU=dqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] rust: usb: add revocable typed interface I/O
To: dakr@kernel.org, linux-usb@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	gregkh@linuxfoundation.org, colinbrauncl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026, Danilo Krummrich wrote:
> > + /// Asks the driver core to unbind whatever driver is currently bound to this interface.
>
> What is this needed for? Where do you use it?

Nothing in this posting uses it. It's a leftover from something I
removed, and I'm not sure it should have stayed removed.

It backed a write-only sysfs file, /sys/devices/vino/remove_all, which
walked the driver's list of held interfaces and called
device_release_driver() on each. evdi has had the same file since 2015
as /sys/devices/evdi/remove_all, so it's a name people with DisplayLink
hardware already know.

I added it because unloading the module used to be unsafe. disconnect()
could deadlock against usb_hub_wq, DRM references were held past unbind
so every replug leaked a card minor, and one unload took the machine
down. Having one write that unbound everything from process context,
with each disconnect running somewhere I could watch it, made those a
lot easier to find.

They're all fixed now, modprobe -r is reliable, and the sysfs file got
cut from the series along with the rest of the development scaffolding.
The binding method survived the cut without its caller.

I'll drop it for v4 either way. The bit I'd like your opinion on is
whether it should come back later with the user attached. Against:
/sys/bus/usb/drivers/vino/unbind already does this, and all remove_all
saves you is knowing which interfaces the driver kept. For: a dock is
the kind of device where someone wants to hand the hardware back without
knowing that, and evdi has shipped the file for ten years.

> > +/// A revocable window during which USB I/O is permitted on an interface.
>
> How is this different or narrower than the device's Bound type state
> represents?

There's one way it's narrower, and that's why I wrote it. The USB core
forbids I/O between suspend() and resume(), and between pre_reset()
and post_reset(), and the interface stays bound across all four. So a
driver holding proof of Bound can be holding it when a transfer isn't
legal. Bound means the driver owns the interface; the window means the
core will currently carry a transfer.

> Also, this seems to reinvent Devres, which we superseded with Rust
> native lifetimes and higher-ranked types. Please use that instead.

The open/closed flag and the wait-for-quiescence are hand-rolled, and
they shouldn't be.

What I don't know is whether the lifetime and higher-ranked machinery
can express a window that closes and then reopens, several times, within
one bind. That's what suspend/resume and pre_reset/post_reset need, and
revocation as I understand it is one-way.

If it can, I'll respin on top of it. If it can't, then I think this
guarantee is USB-specific and belongs behind a USB type rather than a
general one. I'd rather know which before I rewrite it.

Thanks,
Mike


On Wed, 26 Aug 2026 at 19:59, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Aug 26, 2026 at 6:30 PM CEST, Mike Lothian wrote:
> > +    /// Asks the driver core to unbind whatever driver is currently bound to this interface.
>
> What is this needed for? Where do you use it?
>
> > +    /// This is the narrow, reviewed replacement for handing out a raw `struct device` pointer: it
> > +    /// performs exactly one operation (`device_release_driver()`) on this interface's own device,
> > +    /// and cannot be used to reach the device-wide state of a composite peer.
> > +    ///
> > +    /// It is intended for a driver-provided "release my devices" control (e.g. a sysfs attribute),
> > +    /// and must not be called from the driver's own `probe()` or `disconnect()` callback: the
> > +    /// driver core already holds the device lock across those.
>
> IOW, it must not be available for Interface<Core>, which due to the deref chain
> is not that trivial to model. So, if this is really needed I think this needs a
> an abstraction where you get a different device newtype from the scope where
> this *should* be called from that allows you to do this and can never leave the
> scope.
>
> > +    pub fn release_driver(&self) {
> > +        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by the type invariant, so the
> > +        // address of its embedded `dev` is a valid `struct device`. `device_release_driver()`
> > +        // takes the device lock itself and tolerates a device with no driver bound.
> > +        unsafe { bindings::device_release_driver(&raw mut (*self.as_raw()).dev) };
> > +    }
>
> [...]
>
> > +/// A revocable window during which USB I/O is permitted on an interface.
> > +///
> > +/// A driver-`Bound` interface is *not* on its own proof that a transfer may be issued: the USB
> > +/// core forbids I/O outside the window that opens after a successful `probe()`/resume/reset-resume
> > +/// and must be closed again before `disconnect()`, `suspend()` or `pre_reset()` returns. This type
> > +/// represents exactly that narrower state.
>
> How is this different or narrower than the device's Bound type state represents?
> Also, this seems to reinvent Devres, which we superseded with Rust native
> lifetimes and higher-ranked types. Please use that instead.
