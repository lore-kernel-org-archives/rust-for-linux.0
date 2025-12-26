Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C9B1397
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766777908; cv=pass; b=YxyZpMG1WgsLCY7SzeWyA9IqkNDutQKq2+x4gsoK1DpWflRVUWUTqh4UammmAtSmAekv4FsunKnqSEH8DhdmEmHqTcj3s0qF4eQAUIY4ftWehykIFiqCRPPEgHy230la9ahyeU9Li/NWC9T3oZ0KEMwmslHSPvwoSPPZBX7wJU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766777908; c=relaxed/simple;
	bh=7cCh73I1Z+S0oS4VbVG1zR9QEn96lq2c0g2DQH0uD1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FuJ4g6xjpErlA+iRMUwIqAUNIiuE+qOUuuPZ5ADA+arWmberwwHTJtHP/YelPwUpFIqt6xKlmwNM0w7hj24swgnPm9mNe27CyRXuabHagtrO2s50N2BZAvI0RmWG6NDHwUTuC1sgQfbohEwRYNw49w7HxsS41FOtjAvfLd0e71M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nIqo5lpa; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nIqo5lpa"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b5b56d72fso63475a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 11:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766777905; cv=none;
        d=google.com; s=arc-20240605;
        b=dO3KHDmPSH+xHIgSqr9CSLw93uhLrkyEj7P6bs6m2BqI47yi9sQ3MkC+M/wSrjFAy/
         GiV81DwvjCVx+BCdz7XQ/+34rRf7CrOZ1vBJD5X5+OsivoaYfy+J+Xeh0RXeMESysRvO
         phVaKcl+Ot4q4lf4OZ0s6vDF7gz98B2plcW+3xiM/sgBN3+Oj+0SSSBAckgc8cATbnbL
         bFeDPuZC40fuR0HGE5x3kIMM62fhOb38b2T1mA6Q34dbUc/xdQqU+mjaX3TiktMWgX2X
         Ibsd8oSYQrPVz/bioGgBJgD+QUCxujYkORGC451j5/MJEbAAmjFoWsMtuZa8m3K/O7DZ
         lFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+s+eLHHRuh+v5owJcGG9AAATmsUmeeZF2zFQkBy6Gg8=;
        fh=43WAECCr4WRT4OksLB1R7hKRUKM84o7CH+xhJ23k44g=;
        b=GPAdiqF0WFKnd21e0MfFWlHyGK1SFWlMlXFavAdVpQRuBugMq0me2nJvzkHFVrmvM4
         gl2Ho95uBVoMqFf7Pvxs+Z+VABx3iwobb+d4/YeN/nvY2CRtWiMFSSAtw3CSEPZevHCO
         latKp6tfBLcFtAn4dthfPJdzNGI7s6Tg2/qGga4R2Fv8OHGe5Cw/+SGElFcmy8hi+IJa
         knGWt4MZPZeP/KRFPJGRSp/s4XBggHOv2lP/wLEsEx1rfoG/U5V3GvJV6yCTojM4fbFK
         JzPAkArFpZsEGkpOTk61McjZqD9eIJn+VsFDtnnaZPCVR+0ncwFDc+t9ussAGbBynqdi
         FfVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766777905; x=1767382705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s+eLHHRuh+v5owJcGG9AAATmsUmeeZF2zFQkBy6Gg8=;
        b=nIqo5lpaHorkaLK30qcqWkVHk8Jp1+yz1C3Gfmq/JZbeBzhfZ+hOYyN/a3/nOdGTJe
         26Jw02PQr706kpGh4TQG+kVWd5qYpqKcYFkwjxwXZvgoY5iyvpUK3wSxzbBefSOMYopL
         G+7eqPmg5wZyfcI9kVWOYq4U+6J/lvoHBXFGqqULpuXturzbOF3TxeATXJBaeJG1rLUe
         9UzcPi/REjBjYgB4Iui90rrXq5ATcauO5RvcTd2pXHI6HFSRzoQgpIRVt8GXc9xAi7ss
         jJqrZ1U38/E1SN0IIGFyl4RA4HLJKrN77tDmZAhjhA2C4Ocp6JXlXvDinAZjiUn9yzYB
         JNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766777905; x=1767382705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+s+eLHHRuh+v5owJcGG9AAATmsUmeeZF2zFQkBy6Gg8=;
        b=G4eczw+oCrUf5b5Izb3LqvkY63DOjpM1wxa54Nhoh9fHx6TodnIXWCPaRp0ohU/s2b
         MVsdXyLOYF0puhgag4Xl3e7all6sQmtcdyQfI86AtiSLgsY0snVWaWi2VjLGD5GfqIuO
         bP+MAZt/Cd+FQGSvZbFrJ5whz+wmGi8ABNkvg6FeXovug9D4UaHjgIMmwZK43rRjLJKU
         wGpf/yGduAZnWcS15LJuaw2eqUFuX0yz8jnLrfEoyhV6xbLkx9VjGQTEoKWUPRP0nSkS
         Qq0aO/sPyn/8Wy20etTTwGe+I56ydC1oOCuhbeUrvhLp59FoXQxRnYteJhFBKXHxdbg9
         8T1A==
X-Forwarded-Encrypted: i=1; AJvYcCWS3fkfQLXzt042wZ76vrOPwqno0jYJg9vUDdKYw6lbBTRmIw2HupnpnPI07wG/AMmrd6i3v8nrmWKFKnjovQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/Y5diC5/tfcczy3zEDbT02cR5fz6KGWWAp/PaCK0u72QN3xv
	yoqTHyuB9/AOiT/6rnH4FSszmIiQDB9HqwTvTXpesxosFtVZ3bG6idfuqF+0IOV9RwEpjqtur8m
	zJ8ypGdLz+U1ejPbeD8S+VTSW3IIJB0077DcZ0TKg
X-Gm-Gg: AY/fxX5kBJ1UCL/481HoQk/7mrZWjn8q5wdi7Mn1oHxmn3XZ5wAm7N/iyFxo8UettbR
	iVKEg7DZtmGaJsVHQB9MwzZUPdpWRa3+gl4z7cDx3u2cUnAbEK//LBjAWTV3pG7ZzcqATzpyISE
	YYPvafsoQMxQaXXLzj37GV1qE1zsDVKRWVASRS876TL1Z55a0NBPI2W2VNXy40ZibZ8SsiE299x
	BkvjiYeLbUvUPZKQEVIcSJ7GytKwnFoTKzREm3qxFD9P60au9KUEbtm3G2HD4+FAf66zLMavsQl
	PBQLDvEJJN7Zqt+AIfBy2kfefw==
X-Google-Smtp-Source: AGHT+IH4G4O84J4ghLVfid+KL2KGyz07oLaTCBCMLk4CTx9pDnRuw/yKKsTpMkA/Oj5SXFTPnEaMnP4sjyMK23bi0rA=
X-Received: by 2002:aa7:d290:0:b0:640:4aeb:b4d3 with SMTP id
 4fb4d7f45d1cf-64ddb5e5a6emr53537a12.2.1766777904838; Fri, 26 Dec 2025
 11:38:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
 <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com> <DF050MST4PTF.DFB7FVBD25I7@nvidia.com>
 <CAGSQo0173bon2kGo5wGFXo-1x+LL1NpH376Z4GcshKaGVNLHXw@mail.gmail.com>
In-Reply-To: <CAGSQo0173bon2kGo5wGFXo-1x+LL1NpH376Z4GcshKaGVNLHXw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 26 Dec 2025 11:38:12 -0800
X-Gm-Features: AQt7F2o3IFRkE2k2M1DJECcJpg_ry5fTlJ7nn1iP9O-mjDb9UKtLPplwq-C2y9I
Message-ID: <CAGSQo01XL73n7rjst-YYoOpGEv4rB9C6dv5k8uSEgL2QY3YC3A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: Add soc_device support
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 11:26=E2=80=AFAM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> On Tue, Dec 16, 2025 at 6:31=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
> >
> > On Wed Dec 17, 2025 at 4:24 AM JST, Matthew Maurer wrote:
> > > Allow SoC drivers in Rust to present metadata about their devices to
> > > userspace through /sys/devices/socX and other drivers to identify the=
ir
> > > properties through `soc_device_match`.
> > >
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > ---
> > >  MAINTAINERS                     |   1 +
> > >  rust/bindings/bindings_helper.h |   1 +
> > >  rust/kernel/lib.rs              |   2 +
> > >  rust/kernel/soc.rs              | 135 ++++++++++++++++++++++++++++++=
++++++++++
> > >  4 files changed, 139 insertions(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index c5a7cda26c600e49c7ab0d547306d3281333f672..4ff01fb0f1bda27002094=
113c0bf9d074d28fdb6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -7700,6 +7700,7 @@ F:      rust/kernel/devres.rs
> > >  F:   rust/kernel/driver.rs
> > >  F:   rust/kernel/faux.rs
> > >  F:   rust/kernel/platform.rs
> > > +F:   rust/kernel/soc.rs
> > >  F:   samples/rust/rust_debugfs.rs
> > >  F:   samples/rust/rust_debugfs_scoped.rs
> > >  F:   samples/rust/rust_driver_platform.rs
> > > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings=
_helper.h
> > > index a067038b4b422b4256f4a2b75fe644d47e6e82c8..9fdf76ca630e00715503e=
2a3a809bedc895697fd 100644
> > > --- a/rust/bindings/bindings_helper.h
> > > +++ b/rust/bindings/bindings_helper.h
> > > @@ -80,6 +80,7 @@
> > >  #include <linux/sched.h>
> > >  #include <linux/security.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/sys_soc.h>
> > >  #include <linux/task_work.h>
> > >  #include <linux/tracepoint.h>
> > >  #include <linux/usb.h>
> > > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > > index f812cf12004286962985a068665443dc22c389a2..6d637e2fed1b605e2dfc2=
e7b2247179439a90ba9 100644
> > > --- a/rust/kernel/lib.rs
> > > +++ b/rust/kernel/lib.rs
> > > @@ -138,6 +138,8 @@
> > >  pub mod seq_file;
> > >  pub mod sizes;
> > >  pub mod slice;
> > > +#[cfg(CONFIG_SOC_BUS)]
> > > +pub mod soc;
> > >  mod static_assert;
> > >  #[doc(hidden)]
> > >  pub mod std_vendor;
> > > diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..0d6a36c83cb67ef20dc1e=
3d3995752f36e25ac9f
> > > --- /dev/null
> > > +++ b/rust/kernel/soc.rs
> > > @@ -0,0 +1,135 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +// Copyright (C) 2025 Google LLC.
> > > +
> > > +//! SoC Driver Abstraction.
> > > +//!
> > > +//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys_=
soc.h)
> > > +
> > > +use crate::{
> > > +    bindings,
> > > +    error,
> > > +    prelude::*,
> > > +    str::CString,
> > > +    types::Opaque, //
> > > +};
> > > +use core::ptr::NonNull;
> > > +
> > > +/// Attributes for a SoC device.
> > > +///
> > > +/// These are both exported to userspace under /sys/devices/socX and=
 provided to other drivers to
> > > +/// match against via `soc_device_match` (not yet available in Rust)=
 to enable quirks or
> > > +/// device-specific support where necessary.
> > > +///
> > > +/// All fields are freeform - they have no specific formatting, just=
 defined meanings.
> > > +/// For example, the [`machine`](`Attributes::machine`) field could =
be "DB8500" or
> > > +/// "Qualcomm Technologies, Inc. SM8560 HDK", but regardless it shou=
ld identify a board or product.
> > > +pub struct Attributes {
> > > +    /// Should generally be a board ID or product ID. Examples
> > > +    /// include DB8500 (ST-Ericsson) or "Qualcomm Technologies, inc.=
 SM8560 HDK".
> > > +    ///
> > > +    /// If this field is not populated, the SoC infrastructure will =
try to populate it from
> > > +    /// `/model` in the device tree.
> > > +    pub machine: Option<CString>,
> > > +    /// The broader class this SoC belongs to. Examples include ux50=
0
> > > +    /// (for DB8500) or Snapdragon (for SM8650).
> >
> > Formatting of the comments seems a bit off (also appears in other
> > places, please reapply formatting globally to be sure).
>
> I have just re-run the `rustfmt` target on this commit, and see no
> changes. Is there something specific that you think is off?
>
> >
> > > +    ///
> > > +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may =
be a JEDEC JEP106 manufacturer
> > > +    /// identification.
> > > +    pub family: Option<CString>,
> > > +    /// The manufacturing revision of the part. Frequently this is M=
AJOR.MINOR, but not always.
> > > +    pub revision: Option<CString>,
> > > +    /// Serial Number - uniquely identifies a specific SoC. If prese=
nt, should be unique (buying a
> > > +    /// replacement part should change it if present). This field ca=
nnot be matched on and is
> > > +    /// solely present to export through /sys.
> > > +    pub serial_number: Option<CString>,
> > > +    /// SoC ID - identifies a specific SoC kind in question, sometim=
es more specifically than
> > > +    /// `machine` if the same SoC is used in multiple products. Some=
 devices use this to specify a
> > > +    /// SoC name, e.g. "I.MX??", and others just print an ID number =
(e.g. Tegra and Qualcomm).
> > > +    ///
> > > +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may =
be a JEDEC JEP106 manufacturer
> > > +    /// identification (the family value) followed by a colon and th=
en a 4-digit ID value.
> > > +    pub soc_id: Option<CString>,
> > > +}
> > > +
> > > +struct BuiltAttributes {
> >
> > Even though this struct is private, some short documentation would be
> > helpful - actually the explanation about the relationship between
> > `_backing` and `inner` belongs here imho instead of in the member's
> > documentation.

I don't think I should do this unless there's some kernel-specific
style guidance I'm unaware of (I checked and couldn't find anything,
but maybe I missed something):
1. These are comments, not documentation. Documentation is intended
for a user of an interface, comments are intended for a reader of the
code. The information in these comments should not be considered by a
user of `BuiltAttributes`, even an internal one.
2. Usually the reason to provide documentation for a private structure
is that it is available for use at a larger scope than the local
module, even if it's not accessible outside the crate, for the
purposes of helping developers engage with the type either through an
IDE or a local reference. That does not apply here - this is an
implementation detail of `Registration` and should never be used
outside this file.

That said, I don't care that deeply about where this text goes, so if
consensus is that we'd prefer it to be in a doc comment I can put it
there; it just seems wrong to me.
