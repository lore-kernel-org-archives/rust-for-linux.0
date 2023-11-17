Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RaFKD1dK"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5374AB7
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Nov 2023 01:39:09 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5c7045e972dso9708867b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Nov 2023 01:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700213948; x=1700818748; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IpT542f+phIKyvAyToXvA4pst7LsQBljei9NjXJWFY4=;
        b=RaFKD1dKmGWQ4gvltIBoLO8I2u3AfoO4/OK2I3pAl0Ig3QKD71PCH0iDvmPvqosr9m
         3Ec9srMthwSdKAQirKmuzM8kHKvVr/2NgvFUcD0rzPA6bMWnd/V0+AzqjZ+xydB2FoJ6
         QU/mm+MZ0rwhBFiOUqSF62Gx+AB2APIAA8xwuNKF8cyG79QEEBV9UkDE5iG4OvSVq9dP
         UnL/I6AVHk3fuoOF0m1Nhbd4/g1l8rJL6CgOXYFW94kI6wLr3daPwIVAeFhGhjQVBjMX
         x/gDPCAbodOcuSlALwHYeQVm2ht9+K0VRj8NfxMJyXKlvKokMmurooFCmVm4oAt8dN7A
         eIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700213948; x=1700818748;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpT542f+phIKyvAyToXvA4pst7LsQBljei9NjXJWFY4=;
        b=XA9hMMfPnHl+uNspHIXuHu+G5EZ2lRnewXhbXU53OkZQTu1ivZUW+yIk3USAJdJ8wf
         QbZKmNH0RJy9qXUsoRvYd82TaoKV1xPNbjoXZXvjTKk7iC19HizBUqVoCxC4YCIqDSkd
         Tq8GFGsVcELMiDTZ03nMbw5t8zhibVWGFtdN6wdRWNIMEvRxk7xYAvfWKuB9tyUwzeyt
         NhsL0nAHCasPaXYjg5ms7KvNSzISA+L3e1c4fjO3DesunyufIlboHBfQgAVm9F+KH+B2
         zvHPfZzkJrIOKf1/JxApC+ft1YBQwC1lWUSIn791hKGjlHWLQrpZLAnHbrvP/4o4rcBs
         95Aw==
X-Gm-Message-State: AOJu0YzmPmO6Ftf+YUq/dSgH0UyQom/GS8ilDS1WSxe4GJP5HY9EY1Y8
	dN7H4bh69i3OfFWbjmWB8TigYInpBNRwcHM=
X-Google-Smtp-Source: AGHT+IEYCWqXA585PlgRjcGto1ItBPj05lx45i7zVzrdwWlxdE91oadnFJjcOak+GdItx5loAACpojtArUUFVMo=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:182:b0:d9a:ec95:9687 with SMTP
 id t2-20020a056902018200b00d9aec959687mr460275ybh.11.1700213948536; Fri, 17
 Nov 2023 01:39:08 -0800 (PST)
Date: Fri, 17 Nov 2023 09:39:05 +0000
In-Reply-To: <20231026001050.1720612-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231026001050.1720612-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231117093906.2514808-1-aliceryhl@google.com>
Subject: Re: [PATCH net-next v7 1/5] rust: core abstractions for network PHY drivers
From: Alice Ryhl <aliceryhl@google.com>
To: fujita.tomonori@gmail.com
Cc: andrew@lunn.ch, benno.lossin@proton.me, miguel.ojeda.sandonis@gmail.com, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> This patch adds abstractions to implement network PHY drivers; the
> driver registration and bindings for some of callback functions in
> struct phy_driver and many genphy_ functions.
> 
> This feature is enabled with CONFIG_RUST_PHYLIB_ABSTRACTIONS=y.
> 
> This patch enables unstable const_maybe_uninit_zeroed feature for
> kernel crate to enable unsafe code to handle a constant value with
> uninitialized data. With the feature, the abstractions can initialize
> a phy_driver structure with zero easily; instead of initializing all
> the members by hand. It's supposed to be stable in the not so distant
> future.
> 
> Link: https://github.com/rust-lang/rust/pull/116218
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

In this reply, I go through my minor nits:

> +use crate::{
> +    prelude::{vtable, Pin},
> +};

Normally, if you're importing specific prelude items by name instead of
using prelude::*, then you would import them using their non-prelude
path.

> +#[derive(PartialEq)]
> +pub enum DeviceState {

If you add PartialEq and you can add Eq, then also add Eq.

> +/// An adapter for the registration of a PHY driver.
> +struct Adapter<T: Driver> {
> +    _p: PhantomData<T>,
> +}

You don't need this struct. The methods can be top-level functions.

But I know that others have used the same style of defining a useless
struct, so it's fine with me.

> +    /// Defines certain other features this PHY supports.
> +    /// It is a combination of the flags in the [`flags`] module.
> +    const FLAGS: u32 = 0;

You need an empty line between the two lines if you intend for them to
be separate lines in rendered documentation.

> +#[vtable]
> +pub trait Driver {
> +    /// Issues a PHY software reset.
> +    fn soft_reset(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
>      [...]
> +}

I believe that the guidance for what to put in optional vtable-trait
methods was changed in:

https://lore.kernel.org/all/20231026201855.1497680-1-benno.lossin@proton.me/

> +// SAFETY: `Registration` does not expose any of its state across threads.
> +unsafe impl Send for Registration {}

I would change this to "it's okay to call phy_drivers_unregister from a
different thread than the one in which phy_drivers_register was called".

> +// SAFETY: `Registration` does not expose any of its state across threads.
> +unsafe impl Sync for Registration {}

Here, you can say "Registration has no &self methods, so immutable
references to it are useless".

> +    // macro use only
> +    #[doc(hidden)]
> +    pub const fn mdio_device_id(&self) -> bindings::mdio_device_id {
> +        bindings::mdio_device_id {
> +            phy_id: self.id,
> +            phy_id_mask: self.mask.as_int(),
> +        }
> +    }

This is fine, but I probably would just expose it for everyone. It's not
like it hurts if non-macro code can call this method, even if it doesn't
have a reason to do so.

Alice
