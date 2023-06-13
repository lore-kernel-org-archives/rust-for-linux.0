Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531AFC88CBA
	for <rust-for-linux@archiver.kernel.org>; Tue, 13 Jun 2023 07:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbjFMHUE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 13 Jun 2023 03:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240579AbjFMHUC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 13 Jun 2023 03:20:02 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7907B8;
        Tue, 13 Jun 2023 00:20:00 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b1adf27823so62610041fa.2;
        Tue, 13 Jun 2023 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686640799; x=1689232799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBh6PWyNARTfmUBTKR7tMAZyxEKH0a/osaGt9kDyJ0Y=;
        b=Se3GUGVUA6+Lcp2HeZJ91rjx6WH0b+V2LF5VOCB4f5FHgQv+oCBFBaAc/IqSx1pwdC
         MNq+E40yr9nsBOG+au5dbFgPCScKeDlIx2p1JG5w1TQ1Fg/0JyRmorHWi8ozl0ibXRsw
         EtLO/vI8gxtaaZAGmSx9CObBZ4TeKWv1OaKEyNNSOekB8bXYXlVH0pAvEYqBr+ZaNOGN
         9uwgcVZHz5dhFdIX8X94PqFCl29W+1LEmCTA91Q+d5pargCcPjMfvdie4uY79UKRz7zg
         v4XNKF9Fvt396Jnj/gaVQIdKBlYs3mrVJs1KQ3DFOEDvwCTKzcNlLcKP3Ri/kpZ0diOk
         SKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686640799; x=1689232799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kBh6PWyNARTfmUBTKR7tMAZyxEKH0a/osaGt9kDyJ0Y=;
        b=ioTlCwGfayFXgkwR9iK6uLUwlckvrC2zA/GRfXTpfieB50cXBqtQWV01AYpwPREhs6
         iUYwXYjBx0A5Qfwb994aF2GPZJBu7wq9vCYOUCLyVm17SBVXXaT1JuKvgCTkd7gD08Fe
         z/OcGfy8p01vm4ZctDzYZzlxodAP2enxdaq7DSAq4FrnZ53df9mNbR/7F+5nUFz2ZdKX
         BVEDD1E9hEjSG4xjN42Vpuc4HMQ/s0XpedDER61jwk63T58Ba4RoOobZLDLFxY3U/2tt
         d0MihucNORkKPvD5I5N/dQtLTTfslBjMpe+JftQPpa9LsxX2+8x8fKTRFu790evOaek1
         yfFg==
X-Gm-Message-State: AC+VfDziH27dRJXEM9Vg6FSo6vwCLmEGY2sogijY/d2STsgZU64+FzPh
        GqvIEl+33uYfFoP53XHpa1n6cFf9l7K3F3jKVx4=
X-Google-Smtp-Source: ACHHUZ4K7gIeJWu0d6xvQ5SzVLjjcQoJZQerUcRwSapU1pSL2ms8rdh9+Zj3II4DZZu4wQTX88vWbe6g0T5YmDd7nyY=
X-Received: by 2002:a2e:93d6:0:b0:2ac:8f73:1f9c with SMTP id
 p22-20020a2e93d6000000b002ac8f731f9cmr3757377ljh.1.1686640798788; Tue, 13 Jun
 2023 00:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com> <20230613045326.3938283-3-fujita.tomonori@gmail.com>
In-Reply-To: <20230613045326.3938283-3-fujita.tomonori@gmail.com>
From:   Ariel Miculas <ariel.miculas@gmail.com>
Date:   Tue, 13 Jun 2023 10:19:47 +0300
Message-ID: <CAPDJoNu14HbXRkZo3A3jJMWtENwvuiVnqUQWksiMkW6Z35N=fg@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: add support for ethernet operations
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch,
        miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

You have a typo in the commit message: net_devicve_ops should be net_device=
_ops

On Tue, Jun 13, 2023 at 8:20=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> This improves abstractions for network device drivers to implement
> struct ethtool_ops, the majority of ethernet device drivers need to
> do.
>
> struct ethtool_ops also needs to access to device private data like
> struct net_devicve_ops.
>
> Currently, only get_ts_info operation is supported. The following
> patch adds the Rust version of the dummy network driver, which uses
> the operation.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/net/dev.rs          | 108 ++++++++++++++++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 468bf606f174..6446ff764980 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -8,6 +8,7 @@
>
>  #include <linux/errname.h>
>  #include <linux/etherdevice.h>
> +#include <linux/ethtool.h>
>  #include <linux/netdevice.h>
>  #include <linux/slab.h>
>  #include <linux/refcount.h>
> diff --git a/rust/kernel/net/dev.rs b/rust/kernel/net/dev.rs
> index d072c81f99ce..d6012b2eea33 100644
> --- a/rust/kernel/net/dev.rs
> +++ b/rust/kernel/net/dev.rs
> @@ -141,6 +141,18 @@ pub fn register(&mut self) -> Result {
>          }
>      }
>
> +    /// Sets `ethtool_ops` of `net_device`.
> +    pub fn set_ether_operations<U>(&mut self) -> Result
> +    where
> +        U: EtherOperations<D>,
> +    {
> +        if self.is_registered {
> +            return Err(code::EINVAL);
> +        }
> +        EtherOperationsAdapter::<U, D>::new().set_ether_ops(&mut self.de=
v);
> +        Ok(())
> +    }
> +
>      const DEVICE_OPS: bindings::net_device_ops =3D bindings::net_device_=
ops {
>          ndo_init: if <T>::HAS_INIT {
>              Some(Self::init_callback)
> @@ -342,3 +354,99 @@ fn drop(&mut self) {
>          }
>      }
>  }
> +
> +/// Builds the kernel's `struct ethtool_ops`.
> +struct EtherOperationsAdapter<D, T> {
> +    _p: PhantomData<(D, T)>,
> +}
> +
> +impl<D, T> EtherOperationsAdapter<T, D>
> +where
> +    D: DriverData,
> +    T: EtherOperations<D>,
> +{
> +    /// Creates a new instance.
> +    fn new() -> Self {
> +        EtherOperationsAdapter { _p: PhantomData }
> +    }
> +
> +    unsafe extern "C" fn get_ts_info_callback(
> +        netdev: *mut bindings::net_device,
> +        info: *mut bindings::ethtool_ts_info,
> +    ) -> core::ffi::c_int {
> +        from_result(|| {
> +            // SAFETY: The C API guarantees that `netdev` is valid while=
 this function is running.
> +            let mut dev =3D unsafe { Device::from_ptr(netdev) };
> +            // SAFETY: The returned pointer was initialized by `D::Data:=
:into_foreign` when
> +            // `Registration` object was created.
> +            // `D::Data::from_foreign` is only called by the object was =
released.
> +            // So we know `data` is valid while this function is running=
.
> +            let data =3D unsafe { D::Data::borrow(dev.priv_data_ptr()) }=
;
> +            // SAFETY: The C API guarantees that `info` is valid while t=
his function is running.
> +            let mut info =3D unsafe { EthtoolTsInfo::from_ptr(info) };
> +            T::get_ts_info(&mut dev, data, &mut info)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    const ETHER_OPS: bindings::ethtool_ops =3D bindings::ethtool_ops {
> +        get_ts_info: if <T>::HAS_GET_TS_INFO {
> +            Some(Self::get_ts_info_callback)
> +        } else {
> +            None
> +        },
> +        ..unsafe { core::mem::MaybeUninit::<bindings::ethtool_ops>::zero=
ed().assume_init() }
> +    };
> +
> +    const fn build_ether_ops() -> &'static bindings::ethtool_ops {
> +        &Self::ETHER_OPS
> +    }
> +
> +    fn set_ether_ops(&self, dev: &mut Device) {
> +        // SAFETY: The type invariants guarantee that `dev.0` is valid.
> +        unsafe {
> +            (*dev.0).ethtool_ops =3D Self::build_ether_ops();
> +        }
> +    }
> +}
> +
> +/// Corresponds to the kernel's `struct ethtool_ops`.
> +#[vtable]
> +pub trait EtherOperations<D: DriverData> {
> +    /// Corresponds to `get_ts_info` in `struct ethtool_ops`.
> +    fn get_ts_info(
> +        _dev: &mut Device,
> +        _data: <D::Data as ForeignOwnable>::Borrowed<'_>,
> +        _info: &mut EthtoolTsInfo,
> +    ) -> Result {
> +        Err(Error::from_errno(bindings::EOPNOTSUPP as i32))
> +    }
> +}
> +
> +/// Corresponds to the kernel's `struct ethtool_ts_info`.
> +///
> +/// # Invariants
> +///
> +/// The pointer is valid.
> +pub struct EthtoolTsInfo(*mut bindings::ethtool_ts_info);
> +
> +impl EthtoolTsInfo {
> +    /// Creates a new `EthtoolTsInfo' instance.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that `ptr` must be valid.
> +    unsafe fn from_ptr(ptr: *mut bindings::ethtool_ts_info) -> Self {
> +        // INVARIANT: The safety requirements ensure the invariant.
> +        Self(ptr)
> +    }
> +}
> +
> +/// Sets up the info for software timestamping.
> +pub fn ethtool_op_get_ts_info(dev: &mut Device, info: &mut EthtoolTsInfo=
) -> Result {
> +    // SAFETY: The type invariants guarantee that `dev.0` and `info.0` a=
re valid.
> +    unsafe {
> +        bindings::ethtool_op_get_ts_info(dev.0, info.0);
> +    }
> +    Ok(())
> +}
> --
> 2.34.1
>
