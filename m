Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0A51D6DB1
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 20:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734466252; cv=none; b=rNp7zrPSrum9LLDP42NpROo6kI99E1kE153ABVqZwoFz7U176gXfRCiwe2egs4uxMhhYxKnmPIX8G+KjmDUQDl2YyGepq5yvOn/EhHJTlz6HktD/MO4OFKsaZykXoVnxKHICt7g337q4k1Q7F+6yO3sjVV43XE5il31aVCL0+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734466252; c=relaxed/simple;
	bh=S9DoO5a3n3vU6X/je+MmroDxVIgCBKe2ddmDuJmV/mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoHYfAEXG86WNbB9kW7oPzIHQiyetfwcWB+Xi1cdqfmvPcIT/TxR5BY5mkRc0vSSifCDccjRjG8uZbiVVY1N0zM9kTJRyf+b8fb6pStMk9GDmZ8+Ay5vc9adupNMuATneLuEu0ADtvvbMwuC0mbULpBeQ8PPwxvUtXuTG6F9CwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SC9ukFpk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SC9ukFpk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43626213fffso317725e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 12:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734466249; x=1735071049; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ptCMEfalScg4HE+s2WF5iyeS7CJ5LoQymYStrG4iRVc=;
        b=SC9ukFpkLeX3Ab8vupeb/6U3Sa1A4Yipa5Mmdt8mtiVcxh+XXswWzrgJgXeHwePziS
         WkLJX04TvTtVL/MhOCQm6aoTqLiVxcYXjMl3k5LWGH6dA88qrBu9gUCGrNyfmKCUbfli
         vSzaWP202LoVtzqRWAu6fgcg+MirDJ3bzoZmcbVu9vMELpftpzrRI9r6OrjZQIDJwQVa
         ztTMtwqswcWWH6nQxzq+GpVSGFDsEGNNkTYYo5pBZPIdy6IdL5MpaRDcYuoRnJdthoPJ
         5yCFYmNgcvrebUTMuzfbL8FYmgiPT6br0zOM3IIXw5UklsLbIE25/qe5SK+otRuxwd2v
         okPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734466249; x=1735071049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptCMEfalScg4HE+s2WF5iyeS7CJ5LoQymYStrG4iRVc=;
        b=H0rq0wdDtrCESemZMLhR+5eIrhZCRR51a93o5uxq/9+UO1/I2epttyh+HCwqUagiet
         3a4mTNPI9f+7hgFq88JqX0TsELy9i3tnosreLIPHUZs2Qd8XqI1ddBQIsU3cnTUOKrbL
         vJSMQvl4ZGXbrzkho/XMRFhN9FAD0jAi2ugGI/dQ93OLk/4Wn7sGIPnaEZJsks516l7V
         B96VaT0JSgzax5q5gfkXFX1w8nJF+Poq8kEGt6CBVO3jwIu3793XzVAbb8Zw3cGp3Atw
         xlwHMOlv8uOGaBQo+mzSE9G5hKPP6Mj1vQ0Z+FkHOaewLC90rbYMQNwPvWAHvMkHwCex
         /klw==
X-Forwarded-Encrypted: i=1; AJvYcCUIM145e8habkqSC714DqShByb13dhz3pAbRxXRGRFA7VxeLX957CnH6Rk9qQ4TWNibA58k7HujzAZJ4yGiWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxIHsI9rYHpNma5S9ZGCIAFNIJWThvYyhjGqE2N4Dn6XSu+9x
	pkl7vj2eoAy1gNRqoLrsqfNovgsIAFgGRjOkADTTdf8i8Z8js65sFP86YPvboqXzij1XwUdprfX
	YpZsQprCgEoV6Clo66JLvaskjJX70XdBVpvQskA==
X-Gm-Gg: ASbGnctHFPx32NLkWwCovEYq6ZWM2q63z1xM7LWOX3G3+o4hRP8qm4dyA8WLGWy2V2F
	EYX09r6d2BJ/k7cvy2/VCgCvSv48V5DQl8CItRTAhJfDswi1qQUzRwN2+6Mx+Gcui2HhLSQ==
X-Google-Smtp-Source: AGHT+IGKGM3GSJM51xtpyhc2/6RhhD/S1kZ/YygELvpxDkqeIEk+YG5SrrmAjsx+Q88wsvntYUv7XsFnXak8mvmHL9g=
X-Received: by 2002:a5d:584f:0:b0:386:3958:2ec5 with SMTP id
 ffacd0b85a97d-388db294b60mr4487740f8f.28.1734466249108; Tue, 17 Dec 2024
 12:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212163357.35934-1-dakr@kernel.org> <20241212163357.35934-8-dakr@kernel.org>
In-Reply-To: <20241212163357.35934-8-dakr@kernel.org>
From: Fabien Parent <fabien.parent@linaro.org>
Date: Tue, 17 Dec 2024 12:10:38 -0800
Message-ID: <CAPFo5V+WOWzzXxN=-n+ADrFdkSV7C66Lq-+gitx+TnrsAzYJnw@mail.gmail.com>
Subject: Re: [PATCH v6 07/16] rust: add `io::{Io, IoRaw}` base types
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, aliceryhl@google.com, 
	airlied@gmail.com, fujita.tomonori@gmail.com, lina@asahilina.net, 
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, chrisi.schrefl@gmail.com, paulmck@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

> +/// ```no_run
> +/// # use kernel::{bindings, io::{Io, IoRaw}};
> +/// # use core::ops::Deref;
> +///
> +/// // See also [`pci::Bar`] for a real example.
> +/// struct IoMem<const SIZE: usize>(IoRaw<SIZE>);
> +///
> +/// impl<const SIZE: usize> IoMem<SIZE> {
> +///     /// # Safety
> +///     ///
> +///     /// [`paddr`, `paddr` + `SIZE`) must be a valid MMIO region that is mappable into the CPUs
> +///     /// virtual address space.
> +///     unsafe fn new(paddr: usize) -> Result<Self>{
> +///         // SAFETY: By the safety requirements of this function [`paddr`, `paddr` + `SIZE`) is
> +///         // valid for `ioremap`.
> +///         let addr = unsafe { bindings::ioremap(paddr as _, SIZE.try_into().unwrap()) };

This line generates a warning when building the doctests on arm64:

warning: useless conversion to the same type: usize
    --> rust/doctests_kernel_generated.rs:3601:59
     |
3601 |         let addr = unsafe { bindings::ioremap(paddr as _,
SIZE.try_into().unwrap()) };
     |                                                           ^^^^^^^^^^^^^^^
     |
     = help: consider removing .try_into()
     = help: for further information visit
https://rust-lang.github.io/rust-clippy/master/index.html#useless_conversion

Same things happens as well in devres.rs

> +///         if addr.is_null() {
> +///             return Err(ENOMEM);
> +///         }
> +///
> +///         Ok(IoMem(IoRaw::new(addr as _, SIZE)?))
> +///     }
> +/// }
> +///
> +/// impl<const SIZE: usize> Drop for IoMem<SIZE> {
> +///     fn drop(&mut self) {
> +///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
> +///         unsafe { bindings::iounmap(self.0.addr() as _); };
> +///     }
> +/// }
> +///
> +/// impl<const SIZE: usize> Deref for IoMem<SIZE> {
> +///    type Target = Io<SIZE>;
> +///
> +///    fn deref(&self) -> &Self::Target {
> +///         // SAFETY: The memory range stored in `self` has been properly mapped in `Self::new`.
> +///         unsafe { Io::from_raw(&self.0) }
> +///    }
> +/// }
> +///
> +///# fn no_run() -> Result<(), Error> {
> +/// // SAFETY: Invalid usage for example purposes.
> +/// let iomem = unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new(0xBAAAAAAD)? };
> +/// iomem.writel(0x42, 0x0);
> +/// assert!(iomem.try_writel(0x42, 0x0).is_ok());
> +/// assert!(iomem.try_writel(0x42, 0x4).is_err());
> +/// # Ok(())
> +/// # }
> +/// ```
