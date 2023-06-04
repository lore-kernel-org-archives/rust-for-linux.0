Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E45C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 12:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjFDMrl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 4 Jun 2023 08:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjFDMrk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 4 Jun 2023 08:47:40 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEF7AB
        for <rust-for-linux@vger.kernel.org>; Sun,  4 Jun 2023 05:47:39 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-514b19ded99so2528840a12.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jun 2023 05:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685882858; x=1688474858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B6xUWbc/QvtkDBMZMA/OigIIspsObMz1W01WIeXjuDY=;
        b=YYg8pgM7IBIae22tIhKkBowVdh+Qz5XpDbUGMqMaOLWGEq4vhVvBKxDb7/kIe8GMtD
         abg3+B0G5JZnfF0TCSKuiugOiXqaKMAlgCOQo9nRzAKP3WBb500uTPJgVNQiI7y2AmYL
         QaO2sA4cqsejJJan0GuTkvrsEsgm0JCRKefwpLg7IQSLZ+2iP4JdRGu2DEjzYR4++p4W
         h4CY6HDtdqi0xSrfs/60zmtnfMg+2VpCiEzZZ0ypEsD5oecirOwXDWh/Ueo37V8rzUt0
         cfhBfFOAdOGHvs+TkQoxS2y/G3p0p7V/zuk22+p/S6/NBu1fqCr3p6r5I5MBJx6IidGJ
         fQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882858; x=1688474858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6xUWbc/QvtkDBMZMA/OigIIspsObMz1W01WIeXjuDY=;
        b=Fc2rYCpRctz/pluYMmUxRVvAtw45C9St4cwVYt+bMPPtnDzHx5HJrX6HPM+Wn9JTzm
         UAAyrpq9JdXhvrn7LoJNmfJaFyC/4RWgNIHlOKgrCSOUhiqZqT3hd+VAKd2ZQshtwl68
         HrI5U5PD6w2o4b2tZglo8YaOKI+D6MWeXceXPZGXNsmbTswWOM8J7+lAsjW/UACqOl+E
         lj94xCf7rwbnP8oYP6w6ajXGMNgBAjo3kyJj47JAc3qRzwm5ggOpHDfqSPx5VxIhN5KR
         j+MRzr/a6s6/w53aNGCQeCFWSzPvo4udSYgqBL1VMQ9F8pBhy88LQiTUEWDRJmGuMGkf
         VO3Q==
X-Gm-Message-State: AC+VfDyLnCamuxCHNqf2v+3Aagm84Lien6BzGyTtIwP2SvwTfHRDeCi+
        Z33cUmIP7qK7sjZObEqQt88OEZsaR69zbCM=
X-Google-Smtp-Source: ACHHUZ6GSKHXTvwIlRHGVYBK/3Y9faRaPHrB/HVXm7AiJRKbAMvSPmxG9DCM80vdjVmSIBZUxpxO3UJsu8yVj+c=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:8ada:0:b0:514:9386:f857 with SMTP id
 k26-20020a508ada000000b005149386f857mr2871718edk.3.1685882858091; Sun, 04 Jun
 2023 05:47:38 -0700 (PDT)
Date:   Sun,  4 Jun 2023 12:47:35 +0000
In-Reply-To: <01010188843259bd-eaff4dc9-c029-4da4-8c5b-2489fd34ffdf-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <01010188843259bd-eaff4dc9-c029-4da4-8c5b-2489fd34ffdf-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230604124735.1378859-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> +/// Corresponds to the kernel's `struct net_device`.
> +///
> +/// # Safety
> +///
> +/// The kernel uses a `net_device` object with various functions like `struct net_device_ops`.
> +/// This object is passed to Rust callbacks while these functions are running.
> +/// The C API guarantees that `net_device` isn't released while this function is running.
> +pub struct Device(*mut bindings::net_device);

You don't implement `Send` or `Sync` for this type. But maybe that's
intentional since you don't know what kind of private data it stores?

> +// SAFETY: `Registration` does not expose any of its state across threads.
> +unsafe impl<D: DriverData, T: DeviceOperations<D>> Sync for Registration<T, D> {}
> +// SAFETY: `Registration` is not restricted to a single thread,
> +unsafe impl<D: DriverData, T: DeviceOperations<D>> Send for Registration<T, D> {}

This does expose the `D::Data` object across threads as far as I can
tell. That type is required to be Send/Sync, so this is still ok, but I
would mention that here.

> +impl<D: DriverData, T: DeviceOperations<D>> Registration<T, D> {
> +    /// Creates new instance of registration.
> +    pub fn try_new(tx_queue_size: u32, rx_queue_size: u32, data: D::Data) -> Result<Self> {
> +        // SAFETY: FFI call.
> +        match from_err_ptr(unsafe {
> +            bindings::alloc_etherdev_mqs(
> +                core::mem::size_of::<*const core::ffi::c_void>() as i32,
> +                tx_queue_size,
> +                rx_queue_size,
> +            )
> +        }) {
> +            Ok(ptr) => {
> +                // SAFETY: the kernel allocated the space for a pointer.
> +                unsafe {
> +                    let priv_ptr = bindings::netdev_priv(ptr) as *mut usize;
> +                    core::ptr::write(priv_ptr, data.into_foreign() as usize);
> +                }
> +                Ok(Registration {
> +                    dev: Device(ptr),
> +                    is_registered: false,
> +                    _p: PhantomData,
> +                })
> +            }
> +            Err(err) => Err(err),
> +        }
> +    }

This method can be simplified using the question mark operator (also
known as the try operator).

```
pub fn try_new(tx_queue_size: u32, rx_queue_size: u32, data: D::Data) -> Result<Self> {
    // SAFETY: FFI call.
    let ptr = from_err_ptr(unsafe {
        bindings::alloc_etherdev_mqs(
            core::mem::size_of::<*const core::ffi::c_void>() as i32,
            tx_queue_size,
            rx_queue_size,
        )
    })?;

    // SAFETY: the kernel allocated the space for a pointer.
    unsafe {
        let priv_ptr = bindings::netdev_priv(ptr) as *mut usize;
        core::ptr::write(priv_ptr, data.into_foreign() as usize);
    }
    Ok(Registration {
        dev: Device(ptr),
        is_registered: false,
        _p: PhantomData,
    })
}
```

Also, it is unclear to me why you are converting the pointers into an
usize. I would recommend keeping them as void pointers instead.
Especially considering that you're using a void pointer for the
`sizeof_priv` argument. You can do that like this:

```
use core::ffi::c_void;

pub fn try_new(tx_queue_size: u32, rx_queue_size: u32, data: D::Data) -> Result<Self> {
    // SAFETY: FFI call.
    let ptr = from_err_ptr(unsafe {
        bindings::alloc_etherdev_mqs(
            core::mem::size_of::<*const c_void>() as i32,
            tx_queue_size,
            rx_queue_size,
        )
    })?;

    // SAFETY: the kernel allocated the space for a pointer.
    unsafe {
        let priv_ptr = bindings::netdev_priv(ptr) as *mut *const c_void;
        core::ptr::write(priv_ptr, data.into_foreign());
    }
    Ok(Registration {
        dev: Device(ptr),
        is_registered: false,
        _p: PhantomData,
    })
}

impl Device {
    /// Gets a pointer to network device private data.
    ///
    /// A driver in C uses contiguous memory `struct net_device` and its private data.
    /// A driver in Rust contiguous memory `struct net_device` and a pointer to its private data.
    /// So a driver in Rust pays extra cost to access to its private data.
    /// A device driver passes an properly initialized private data and the kernel saves its pointer.
    fn priv_data_ptr(netdev: *mut bindings::net_device) -> *const c_void {
        // SAFETY: The safety requirement ensures that the pointer is valid.
        unsafe { core::ptr::read(bindings::netdev_priv(&mut *netdev) as *const *const c_void) }
    }
}
```

> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
> +        ndo_init: if <T>::HAS_INIT {
> +            Some(Self::init_callback)
> +        } else {
> +            None
> +        },
> +        ndo_uninit: if <T>::HAS_UNINIT {
> +            Some(Self::uninit_callback)
> +        } else {
> +            None
> +        },
> +        ndo_open: if <T>::HAS_OPEN {
> +            Some(Self::open_callback)
> +        } else {
> +            None
> +        },
> +        ndo_stop: if <T>::HAS_STOP {
> +            Some(Self::stop_callback)
> +        } else {
> +            None
> +        },
> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
> +            Some(Self::start_xmit_callback)
> +        } else {
> +            None
> +        },
> +        ndo_features_check: None,
> +        ndo_select_queue: None,
> +        ndo_change_rx_flags: None,
> +        ndo_set_rx_mode: None,
> +        ndo_set_mac_address: None,

Bindgen is set up to generate `Default` implementations for these types,
so you can do this to omit the remaining fields:
```
const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
    ndo_init: if <T>::HAS_INIT {
        Some(Self::init_callback)
    } else {
        None
    },
    ndo_uninit: if <T>::HAS_UNINIT {
        Some(Self::uninit_callback)
    } else {
        None
    },
    ndo_open: if <T>::HAS_OPEN {
        Some(Self::open_callback)
    } else {
        None
    },
    ndo_stop: if <T>::HAS_STOP {
        Some(Self::stop_callback)
    } else {
        None
    },
    ndo_start_xmit: if <T>::HAS_START_XMIT {
        Some(Self::start_xmit_callback)
    } else {
        None
    },
    ..Default::default()
};
```

> +impl Drop for SkBuff {
> +    fn drop(&mut self) {
> +        // SAFETY: The safety requirement ensures that the pointer is valid.
> +        unsafe {
> +            bindings::kfree_skb_reason(
> +                self.0,
> +                bindings::skb_drop_reason_SKB_DROP_REASON_NOT_SPECIFIED,
> +            )
> +        }
> +    }
> +}

What are these drop reasons used for?

Alice
