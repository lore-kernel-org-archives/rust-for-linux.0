Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41CA2C9D
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Mar 2026 03:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773373475; cv=pass; b=T4FcA2HKR5L8p7aU8MnYt086rPL00J0citrBi8CEFACCmIh9zNxq6BpE+w4q8yWzYBNy3Ph8ML+kmC8DelFrJjrDBhPtVukBtcwxV6l6LpXKz/CHh1V2uWk2wJGNPjBFvwgYjv6w9lSZV+rQV/V8Ug3XOeKy2n+VmE4ZMtS/iIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773373475; c=relaxed/simple;
	bh=z/SZmd63NAsIgkleYYPkULZwmMuC37+dqhe/h6A+kkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4icJ8FzgdRk0SeDYtcOAkW3lHxXoWbKuAZXJiC2y+jrNhHzufp2ZQL0F2xEwCFFvuoNnOgQhrvLhCF3kWqUbqCBay7zeyfW/Qyo7gmq2U+C0WCBq1ks+hQU/YC5lQEpYBNDiFf9Mq++FzRzIRDIi2grxzEmcY/41jP8wFwgOE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiZO9xGI; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiZO9xGI"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so2135070a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 20:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773373471; cv=none;
        d=google.com; s=arc-20240605;
        b=ClycZN2D27sMnJxVi5DwHzZz9FLnr0tRDq1A6735OXmlxABtwQRQOZOP2yjLZyTUzf
         33p0uSdQC7dc0OywtBNbbHwkN25MkB2fNu/XWm5RStaezHWOXKFNCY2buHtRW8k4tnif
         EMwTgOz13PCiM26MN85FQhFOzqJkf2u5elfzn/tYaVmfFdHZA5h94wkc0m4I43E34MJc
         6n6ZzUt7BX5vMHaAysFo9Az+Gk/mcnEGRJa7KIegtbzomQ/lxbYcld44kP9he/Dn9wBQ
         LQJwT7QgtWXptSfoXnSq2S3SJONTNliRtqezqruXd6hdz4vDOkV7kuC+FvAicT2sQlXB
         0y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IeBB2tGWQC/AiZ/UQlcRvgZ/p7KtlMw7yTpNtqSURXM=;
        fh=y8GjOqKiWleqCgSOg7B/fZWw+SmZPZ/Wi4JG/rjy004=;
        b=Yybygii9nMJmB+wwY+SnC1go8bY5U2p8yViO5I7t11gLyZ981Bk8p2951G6llN5U+M
         QDMSYrw77sLzLdDDmOxj6StYoE4VVP0hMQ1YE1yDoSpCmw9TP1rD/71bWdTNMe6NMSfH
         EX1mYvtVDFQ3KP3QieYiNDQMExW+YKUG/dgPccWFm1+k0odVKWeNXvlvNoOjDRdEypjq
         2fIMLcilzulV0UwCjhGxe6De4T+N58nbt2mzG+hS0MJw937ZD8rSVSvN8Tu/6RHrJB0i
         QEGZ+HAKTutp1ZGyRk1b5bxraEgSfm7HkZ2a1dTZ2itihRbXAmyHfnSqbOlbstE0mVsT
         0KQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773373471; x=1773978271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeBB2tGWQC/AiZ/UQlcRvgZ/p7KtlMw7yTpNtqSURXM=;
        b=OiZO9xGIImA6DWroK5dCBEzAhxdoXOxJkr7GWc5pmdZJ1Q9BeKWo0ax30JYI5ZUBA1
         T8qFMaKSzK2NNC4AtQw+Gtr7kdo4cr9CUm5lJgtqgsOeIkwAtYIdD4gWHI/5TVNmimTi
         BIe262jXtMFBVu6AlMGllagJzIzXKAZvgz7sXIzMbkPG9o+Ey+oCIVJvYdI/zsiEuLW1
         lIZp1QtYvE/9Ur/mY4YqIJA1TnckTC2IKbK7Y+9OxOlCm7X3vJuTwxDHKAwZKeD1tlyH
         G+q1VFoOUtzm3L16GQoE1BkEqtBsiD86o2DEMCCwoeJSQfWGdZmEgYp02wCDH0GD9V1L
         8hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773373471; x=1773978271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IeBB2tGWQC/AiZ/UQlcRvgZ/p7KtlMw7yTpNtqSURXM=;
        b=Vg1B6YcrX9Gqk/dquaTAK6Qh9DcYfH/w7CO5bIo0Kmkxv7AZfPhBeOOIZSKkRJRJ1d
         u54P15KRPeWi9ploPggxemFzpEBgHm7eKiVMF8deDTcC1TwZtTckWXIAhoVShjAI7YWF
         8PzJ6RK+S78feTufug7Fuu+dg1Zp5vOp+vE4LSiyx4Fv59ZIooITqXYIyFRO3DjMS7hb
         s58guic2h+xXL+IBxe/Y9M2WqKaUWysnfgJ5QEXbzmpfNdtXNDnD8jJiZ/mc/oHWO2/W
         KtiyVRl8oyngowcDCW5picvbdYDwtgE9Viiu8pKlXGjaX7ZxYlKbIHzllZk4lKh2oM1x
         SQjA==
X-Forwarded-Encrypted: i=1; AJvYcCWRKsvHVCMpNyhEe5/NIntc400MtEzpGZJigOzXGaVIle2GhGUACt86hIIWjHV0pD8c44k37/PkEHTrR9ze7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWOf7hMpxgcEMrlPripA7QfBbBI69AgOFcWHGQWDhqayVkf365
	3g28Yr+vey2DWE0Cz0fI52P+TNGoeORuw17vA50sm83P2C3ftrIQDuchs7xZJInNvEw1yHGtJMx
	f1Mb4l4M8vW7lyFIJp3ZdsgrpGBY+OYg=
X-Gm-Gg: ATEYQzxjvHLo8BuQcw/FAogW8pQC2bBjEDt08vkWHpDgw1c2rDmOh+wktlh1CHkkFZ0
	fVfgrmw8s9n6Uq0H9v3ox8zjuXmdTJ5bVdNZLuvLI/kuuNqf948O8SgmoLCKpFgjQqWOMcLxv09
	Db4c8jwv+7KsUPo5AMLC9dO9uIslhihaMMDivVCkWjrTU9LINTSrRDnJ2LDaYwyo+1uP641N64+
	yJnZtJtYCUdetCJQKCJBSjx3XZtw5DzaaUSQhuCBPvSwLLsHGurMOrydX5+t/asVTbG9AQrZ7LE
	wWIB8nfDkZJZMVS3c0BUiY+my5LdvnzXnKk1Sw==
X-Received: by 2002:a05:6402:1466:b0:662:ac7e:aacc with SMTP id
 4fb4d7f45d1cf-663babf0a4dmr1046571a12.20.1773373470679; Thu, 12 Mar 2026
 20:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
 <20260211032935.2705841-9-alistair.francis@wdc.com> <20260302170933.000016ad@huawei.com>
In-Reply-To: <20260302170933.000016ad@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2026 13:44:04 +1000
X-Gm-Features: AaiRm52V7auffLkdXYKOjGopVCkKllA1QNfNyH63N0AXbxKVq3RcyocdmcxgyMA
Message-ID: <CAKmqyKMznD4RiHe5w2s5RDasG3XMdMwU=L6xDS=70d84FVodUQ@mail.gmail.com>
Subject: Re: [RFC v3 08/27] lib: rspdm: Initial commit of Rust SPDM
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: bhelgaas@google.com, lukas@wunner.de, rust-for-linux@vger.kernel.org, 
	akpm@linux-foundation.org, linux-pci@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, boqun.feng@gmail.com, 
	a.hindborg@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, ojeda@kernel.org, wilfred.mallawa@wdc.com, 
	aliceryhl@google.com, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 3:09=E2=80=AFAM Jonathan Cameron
<jonathan.cameron@huawei.com> wrote:
>
> On Wed, 11 Feb 2026 13:29:15 +1000
> alistair23@gmail.com wrote:
>
> > From: Alistair Francis <alistair@alistair23.me>
> >
> > This is the initial commit of the Rust SPDM library. It is based on and
> > compatible with the C SPDM library in the kernel (lib/spdm).
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> The comments that follow are based on my very limited rust knowledge.
> Hence may be garbage.
>
> > ---
> >  MAINTAINERS                     |  12 ++
> >  include/linux/spdm.h            |  39 ++++++
> >  lib/Kconfig                     |  17 +++
> >  lib/Makefile                    |   2 +
> >  lib/rspdm/Makefile              |  10 ++
> >  lib/rspdm/consts.rs             | 117 +++++++++++++++++
> >  lib/rspdm/lib.rs                | 119 +++++++++++++++++
> >  lib/rspdm/state.rs              | 220 ++++++++++++++++++++++++++++++++
> >  lib/rspdm/validator.rs          |  66 ++++++++++
> >  rust/bindings/bindings_helper.h |   2 +
> >  rust/kernel/error.rs            |   3 +
> >  11 files changed, 607 insertions(+)
> >  create mode 100644 include/linux/spdm.h
> >  create mode 100644 lib/rspdm/Makefile
> >  create mode 100644 lib/rspdm/consts.rs
> >  create mode 100644 lib/rspdm/lib.rs
> >  create mode 100644 lib/rspdm/state.rs
> >  create mode 100644 lib/rspdm/validator.rs
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 149deedafe2c..a5c4ec16081c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23693,6 +23693,18 @@ M:   Security Officers <security@kernel.org>
> >  S:   Supported
> >  F:   Documentation/process/security-bugs.rst
> >
> > +SECURITY PROTOCOL AND DATA MODEL (SPDM)
> > +M:   Jonathan Cameron <jic23@kernel.org>
>
> Evil way to get me to learn rust. Ah well, I guess I can't put it
> off for ever.

It's a great excuse!

>
> > +M:   Lukas Wunner <lukas@wunner.de>
> > +M:   Alistair Francis <alistair@alistair23.me>
> > +L:   linux-coco@lists.linux.dev
> > +L:   linux-cxl@vger.kernel.org
> > +L:   linux-pci@vger.kernel.org
> > +S:   Maintained
> > +T:   git git://git.kernel.org/pub/scm/linux/kernel/git/devsec/spdm.git
> > +F:   include/linux/spdm.h
> > +F:   lib/rspdm/
>
>
> > diff --git a/lib/rspdm/consts.rs b/lib/rspdm/consts.rs
> > new file mode 100644
> > index 000000000000..40ce60eba2f3
> > --- /dev/null
> > +++ b/lib/rspdm/consts.rs
> > @@ -0,0 +1,117 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Western Digital
> > +
> > +//! Constants used by the library
> > +//!
> > +//! Rust implementation of the DMTF Security Protocol and Data Model (=
SPDM)
> > +//! <https://www.dmtf.org/dsp/DSP0274>
> > +
> > +pub(crate) const SPDM_REQ: u8 =3D 0x80;
> > +pub(crate) const SPDM_ERROR: u8 =3D 0x7f;
> > +
> > +#[expect(dead_code)]
> > +#[derive(Clone, Copy)]
> > +pub(crate) enum SpdmErrorCode {
> > +    InvalidRequest =3D 0x01,
> > +    InvalidSession =3D 0x02,
>
> This is reserved by the time we reach 1.2.1 and disappeared somewhere
> in the middle of 1.1.0 (present) and 1.1.2 (reserved)
> Probably good to leave some breadcrumbs for what spec versions could use
> this error code.  That will reduce confusion for future readers.
> You have this info in the parsing code, but I'd like it here as well.
>
> > +    Busy =3D 0x03,
> > +    UnexpectedRequest =3D 0x04,
> > +    Unspecified =3D 0x05,
> > +    DecryptError =3D 0x06,
> > +    UnsupportedRequest =3D 0x07,
> > +    RequestInFlight =3D 0x08,
> > +    InvalidResponseCode =3D 0x09,
> > +    SessionLimitExceeded =3D 0x0a,
> > +    SessionRequired =3D 0x0b,
> > +    ResetRequired =3D 0x0c,
> > +    ResponseTooLarge =3D 0x0d,
> > +    RequestTooLarge =3D 0x0e,
> > +    LargeResponse =3D 0x0f,
> > +    MessageLost =3D 0x10,
> > +    InvalidPolicy =3D 0x11,
> > +    VersionMismatch =3D 0x41,
> > +    ResponseNotReady =3D 0x42,
> > +    RequestResynch =3D 0x43,
> > +    OperationFailed =3D 0x44,
> > +    NoPendingRequests =3D 0x45,
> > +    VendorDefinedError =3D 0xff,
> > +}
> > +
> > +impl core::fmt::LowerHex for SpdmErrorCode {
> > +    /// A debug print format for the SpdmSessionInfo struct
> > +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Resu=
lt {
> > +        match self {
> > +            SpdmErrorCode::InvalidRequest =3D> {
> > +                writeln!(f, "0x01")?;
>
> No way to get a string from an enum value in rust?

There is actually, this is unnecessary

> Having to check these against the enum above is a bit tedious.
>
> > +            }
>
> > +        }
> > +        Ok(())
> > +    }
> > +}
> > diff --git a/lib/rspdm/lib.rs b/lib/rspdm/lib.rs
> > new file mode 100644
> > index 000000000000..2bb716140e0a
> > --- /dev/null
> > +++ b/lib/rspdm/lib.rs
> > @@ -0,0 +1,119 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Western Digital
> > +
> > +//! Top level library for SPDM
> > +//!
> > +//! Rust implementation of the DMTF Security Protocol and Data Model (=
SPDM)
> > +//! <https://www.dmtf.org/dsp/DSP0274>
> > +//!
> > +//! Top level library, including C compatible public functions to be c=
alled
> > +//! from other subsytems.
> > +//!
> > +//! This mimics the C SPDM implementation in the kernel
>
> The one that never gets merged if this goes according to plan ;)
>
>
>
> > diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
> > new file mode 100644
> > index 000000000000..68861f30e3fa
> > --- /dev/null
> > +++ b/lib/rspdm/state.rs
> > @@ -0,0 +1,220 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Western Digital
> > +
> > +//! The `SpdmState` struct and implementation.
> > +//!
> > +//! Rust implementation of the DMTF Security Protocol and Data Model (=
SPDM)
> > +//! <https://www.dmtf.org/dsp/DSP0274>
> > +
> > +use core::ffi::c_void;
> > +use kernel::prelude::*;
> > +use kernel::{
> > +    bindings,
> > +    error::{code::EINVAL, to_result, Error},
> > +    validate::Untrusted,
> > +};
> > +
> > +use crate::consts::{SpdmErrorCode, SPDM_ERROR, SPDM_REQ};
> > +use crate::validator::{SpdmErrorRsp, SpdmHeader};
> > +
> > +/// The current SPDM session state for a device. Based on the
> > +/// C `struct spdm_state`.
> > +///
> > +/// `dev`: Responder device.  Used for error reporting and passed to @=
transport.
> > +/// `transport`: Transport function to perform one message exchange.
> > +/// `transport_priv`: Transport private data.
> > +/// `transport_sz`: Maximum message size the transport is capable of (=
in bytes).
> > +///  Used as DataTransferSize in GET_CAPABILITIES exchange.
> > +/// `keyring`: Keyring against which to check the first certificate in
> > +///  responder's certificate chain.
>
> Given the discussions, seems this will go away (for now anyway).
>
> > +/// `validate`: Function to validate additional leaf certificate requi=
rements.
> > +///
> > +/// `version`: Maximum common supported version of requester and respo=
nder.
> > +///  Negotiated during GET_VERSION exchange.
> > +#[expect(dead_code)]
> > +pub struct SpdmState {
> > +    pub(crate) dev: *mut bindings::device,
> > +    pub(crate) transport: bindings::spdm_transport,
> > +    pub(crate) transport_priv: *mut c_void,
> > +    pub(crate) transport_sz: u32,
> > +    pub(crate) keyring: *mut bindings::key,
> > +    pub(crate) validate: bindings::spdm_validate,
> > +
> > +    // Negotiated state
> > +    pub(crate) version: u8,
> > +}
> > +
> > +impl SpdmState {
> > +    pub(crate) fn new(
> > +        dev: *mut bindings::device,
> > +        transport: bindings::spdm_transport,
> > +        transport_priv: *mut c_void,
> > +        transport_sz: u32,
> > +        keyring: *mut bindings::key,
> > +        validate: bindings::spdm_validate,
> > +    ) -> Self {
> > +        SpdmState {
> > +            dev,
> > +            transport,
> > +            transport_priv,
> > +            transport_sz,
> > +            keyring,
> > +            validate,
> > +            version: 0x10,
> > +        }
> > +    }
>
> > +
> > +    /// Start a SPDM exchange
> > +    ///
> > +    /// The data in `request_buf` is sent to the device and the respon=
se is
> > +    /// stored in `response_buf`.
> > +    pub(crate) fn spdm_exchange(
> > +        &self,
> > +        request_buf: &mut [u8],
> > +        response_buf: &mut [u8],
> > +    ) -> Result<i32, Error> {
> > +        let header_size =3D core::mem::size_of::<SpdmHeader>();
> > +        let request: &mut SpdmHeader =3D Untrusted::new_mut(request_bu=
f).validate_mut()?;
>
> Why are we treating the request, which doesn't come from the device as un=
trusted?
> Just for convenience on checking we formatted it right at the upper level=
s or is
> the idea that might ultimately be coming from userspace?

Just for convenience, it's just a easy way to convert it to a
`SpdmHeader` and perform some simple sanity checks. Your right it's
not actually untrusted

Alistair

>
> > +        let response: &SpdmHeader =3D Untrusted::new_ref(response_buf)=
.validate()?;
> > +
> > +        let transport_function =3D self.transport.ok_or(EINVAL)?;
> > +        // SAFETY: `transport_function` is provided by the new(), we a=
re
> > +        // calling the function.
> > +        let length =3D unsafe {
> > +            transport_function(
> > +                self.transport_priv,
> > +                self.dev,
> > +                request_buf.as_ptr() as *const c_void,
> > +                request_buf.len(),
> > +                response_buf.as_mut_ptr() as *mut c_void,
> > +                response_buf.len(),
> > +            ) as i32
> > +        };
> > +        to_result(length)?;
> > +
> > +        if (length as usize) < header_size {
> > +            return Ok(length); // Truncated response is handled by cal=
lers
> > +        }
> > +        if response.code =3D=3D SPDM_ERROR {
> > +            if length as usize >=3D core::mem::size_of::<SpdmErrorRsp>=
() {
> > +                // SAFETY: The response buffer will be at least as lar=
ge as
> > +                // `SpdmErrorRsp` so we can cast the buffer to `SpdmEr=
rorRsp` which
> > +                // is a packed struct.
> > +                self.spdm_err(unsafe { &*(response_buf.as_ptr() as *co=
nst SpdmErrorRsp) })?;
> > +            } else {
> > +                return Err(EINVAL);
> > +            }
> > +        }
> > +
> > +        if response.code !=3D request.code & !SPDM_REQ {
> > +            pr_err!(
> > +                "Response code {:#x} does not match request code {:#x}=
\n",
> > +                response.code,
> > +                request.code
> > +            );
> > +            to_result(-(bindings::EPROTO as i32))?;
> > +        }
> > +
> > +        Ok(length)
> > +    }
> > +}
> > diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
> > new file mode 100644
> > index 000000000000..a0a3a2f46952
> > --- /dev/null
> > +++ b/lib/rspdm/validator.rs
> > @@ -0,0 +1,66 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Western Digital
> > +
> > +//! Related structs and their Validate implementations.
> > +//!
> > +//! Rust implementation of the DMTF Security Protocol and Data Model (=
SPDM)
> > +//! <https://www.dmtf.org/dsp/DSP0274>
> > +
> > +use crate::consts::SpdmErrorCode;
> > +use core::mem;
> > +use kernel::prelude::*;
> > +use kernel::{
> > +    error::{code::EINVAL, Error},
> > +    validate::{Unvalidated, Validate},
> > +};
> > +
> > +#[repr(C, packed)]
> > +pub(crate) struct SpdmHeader {
> > +    pub(crate) version: u8,
> > +    pub(crate) code: u8, /* RequestResponseCode */
> > +    pub(crate) param1: u8,
> > +    pub(crate) param2: u8,
> > +}
> > +
> > +impl Validate<&Unvalidated<[u8]>> for &SpdmHeader {
> > +    type Err =3D Error;
> > +
> > +    fn validate(unvalidated: &Unvalidated<[u8]>) -> Result<Self, Self:=
:Err> {
> > +        let raw =3D unvalidated.raw();
> > +        if raw.len() < mem::size_of::<SpdmHeader>() {
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        let ptr =3D raw.as_ptr();
> > +        // CAST: `SpdmHeader` only contains integers and has `repr(C)`=
.
> > +        let ptr =3D ptr.cast::<SpdmHeader>();
> > +        // SAFETY: `ptr` came from a reference and the cast above is v=
alid.
> > +        Ok(unsafe { &*ptr })
> > +    }
> > +}
> > +
> > +impl Validate<&mut Unvalidated<[u8]>> for &mut SpdmHeader {
> > +    type Err =3D Error;
> > +
> > +    fn validate(unvalidated: &mut Unvalidated<[u8]>) -> Result<Self, S=
elf::Err> {
> > +        let raw =3D unvalidated.raw_mut();
> > +        if raw.len() < mem::size_of::<SpdmHeader>() {
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        let ptr =3D raw.as_mut_ptr();
> > +        // CAST: `SpdmHeader` only contains integers and has `repr(C)`=
.
> > +        let ptr =3D ptr.cast::<SpdmHeader>();
> > +        // SAFETY: `ptr` came from a reference and the cast above is v=
alid.
> > +        Ok(unsafe { &mut *ptr })
> > +    }
> > +}
> > +
> > +#[repr(C, packed)]
> > +pub(crate) struct SpdmErrorRsp {
> > +    pub(crate) version: u8,
> > +    pub(crate) code: u8,
>
> Maybe document here that this will always be SPDM_ERROR 0x7F
>
>
> > +    pub(crate) error_code: SpdmErrorCode,
> > +    pub(crate) error_data: u8,
> > +}
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> > index 0075c4b62c29..5043eee2a8d6 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -84,7 +84,9 @@
> >  #include <linux/slab.h>
> >  #include <linux/task_work.h>
> >  #include <linux/tracepoint.h>
> > +#include <linux/spdm.h>
>
> Smells like this is alphabetical order. So move it up a bit?
>
> >  #include <linux/usb.h>
> > +#include <linux/uaccess.h>
> >  #include <linux/wait.h>
> >  #include <linux/workqueue.h>
> >  #include <linux/xarray.h>
>
