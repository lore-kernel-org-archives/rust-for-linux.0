Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E237135A53
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766777200; cv=pass; b=Idi9ScxEhsA2jkSZ44n8eBhv1cevBpXsT4VouhbLvPsfFNp8NowCZ2qRAAkCK6YfrH6pKBJwb2/tzqdWuUEgIW6tiu96wVU4nqmWuWHk4eJmPJGks2ac6hwlCC9RrGDE/SUDtVhdLj8gy98sLieOfkWNmumSdYmRaIk/TrItsl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766777200; c=relaxed/simple;
	bh=q9+Maa6REnGAK3t0Ok2E2JbDWpdXd/Ceq4QoBQCDNQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMNb8kprVTEpB+D45DIpGiI4YYEsEnINTdKk++iNtn2NWCJgP7aMFZ7SbANICkYforbLmnxwPzz/Dfk6zQWoXWX0wb4y1Blw2glmHZrSRrXLkypSU1ZMw+rQra3HlAbOqQ5b3uvn27/6iM/kpczMlYj1//9xrslrtL+g6DN3M/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YkIfpGvc; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YkIfpGvc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b72793544so65076a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 11:26:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1766777197; cv=none;
        d=google.com; s=arc-20240605;
        b=lB73jxhhGwi52MzOsAH79FcnFKhKX/ySZdz2d7sUmZlSjZZtBkJ9Q5n6rS4vuXbIQu
         tzqxoJZAFa112WRNR/JmBUM4GAK0WTUR0azxsFmoro5Pn7RSG67pRdkp+KnZHTDqK6JZ
         CSivGNsBd2Sg0Ef/9zxhQA4VtH2/hc8TpzhvgGlVg7pfANMFocdpP58/VUnAn+/RcPs6
         abYHw5dduHNyRG5xxgrl8JWd84h5PHiWKtzeIJ54veuEhjtrl1inayMumXTJJUcGH9Fx
         HVqpwNU+KtHQ/E2s0M0MReA5X3tndzAE1nrxjKiUkZYjIiTanjQdT/3ZZ1hh/bEpt8+B
         17mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAHKHTjCRmKRciXyIy/AUg1RLP+rAIBnF+dfBwvNEdY=;
        fh=8QrsLVvaPsbkH2EmIbZaVtd2mDQPwwld8pTnorf+Q0s=;
        b=ImTXGWsxjNhbb+6J8AirInp0Da/FZQUfw6s/5RDyLYFjsoP93VmwAujAx7Uy4uzN6N
         KGArCGvSWiR/KBOUeowUsqDvfCnY+cJQjRwVYIhLeU3860IwYGgIHOm9rPm5PsmCQinX
         6nz4NJPDipxcMRfbHvrQOcAzZS//uE+I9QtvQwn+tLFE/PX6aRrmtzQVitO5e0lBItY7
         roGJEOu9SuzLEFVra+3Aj0X2N3c4HOJ3bb53jehnRFpxilBUoWycKBpjkmG9N7HWtUvF
         Dr+OZrPz+a3FXogBEdlRaC57C21ZEcN4+EkF3gizrrEP62AMkJmm0C1dBiIkEatc1vpV
         FFgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766777197; x=1767381997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAHKHTjCRmKRciXyIy/AUg1RLP+rAIBnF+dfBwvNEdY=;
        b=YkIfpGvcI7VgsEpvf4x08FR/1RzJ5B/LbvAyUktI5FEk+PWLwr5BL4B01QDdnCOPbK
         H3/bCW7J5f2kD9WoUKFnU5tBc2TX7qUSV6aDz0I4oiyIzqh6hzGAqEQ4m813351Nkg+D
         VeLcbJeQfulf1tc8Pqk896JGRM3dHkpzhwYW0F5NXIflazRYhT5Zg6AhUmpBpLhMZjFF
         IqMj8pikmFJvSLc5QcaJron0pYEN4sjjty+6CiXP75fEoB0Yj8HyFQMBcKYhrDvPHqPp
         2f+vSKjzU21oUsr2++aCMUDdFZbxULsnue5S2OPtwEFB7Gd4WA98Kf235jInlp83QhH7
         OFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766777197; x=1767381997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jAHKHTjCRmKRciXyIy/AUg1RLP+rAIBnF+dfBwvNEdY=;
        b=ti5Lm171lVe0AvXbJWrxp3I7Ml4qJqdoaYO0UOOtAud4R70Y8D8zcspERKUfxXub0L
         a1GIhdlv0XBtQNpX1KOujk6mxJ0E1rkv/XMgymQksbk8DdR/FNPcQ5KDiUQS5rUZkZf7
         yxDDXFJSzipt55BDSpaZl/3dRQm/TGm9REpqT//36a9IHIJ/QYD+Ai2jwnY04q3Yumha
         Zb3kRfpdjK+YOZoJuBhQ4JWku3oCsGPZUPmxg28/VtIJAm5nbKRbNaf6c9zb2EgGo+TE
         aOKuhZ1EfGIHoprpTvVL6U+5fT7BF4ukcz8EAzy74MCT1i6Ntplr2craqXZYOPsqdDIk
         nDzg==
X-Forwarded-Encrypted: i=1; AJvYcCXA1L0apxsFGCm+mSDHUe0SmhTuAdKWH43XCfP65ty2fgcIUDSaa6ywQ4CpTwWNmZtje6ij12RRveD5yOmeHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyztNAmFxgPpZYwbbs2lRIgZVpqaZUC5eqTHjMfJPFa9CA6W4ZM
	WmeKXbrkNwga09zFlOdnYumJseA4AH3dSZIhpJykv5Pc9pOt1TQ/OcXquZrBSS9vD/CsFeflMW5
	8wAcwpl2PHFR0WI9LLIPSvkiTNiSr2rjeJmzdQ5Aw
X-Gm-Gg: AY/fxX6wIGWxg08LOA6THsz+sfByLPH+jLc8L4O+LEkEx+Dolx1aAWUQlMVWk4lZDKk
	O/SoweFWAE/smuVskvgCqMKJ+W6oskfWoWiowg6PwGG7dApjE99BbWk1/8B/OhenhLKz/MZq/lr
	aWp7fxuZERIMgVoGIewwz2l7rv4B6dcDAIL9Ne6iPcyKQHk+BhawRHifCB1//kpaVj9k4UDryfU
	DPNa+B1OmF1MYrDRU+o5czhktm9FEmmyIatRQqEgZrxTzrruOznvQzc8kMW68AX3AYtcNeni7Ok
	iFDuw7+GqT3nJx1PA7BnKysIjmf7xBDc/Nrw
X-Google-Smtp-Source: AGHT+IH024TepFV3XG2IpD++VcdEZslKxXp1/6Agle87MlNBevqQaCMfXH33hoPhm6fxPSDXOs/mzd9ub3NCODdAeV0=
X-Received: by 2002:a50:fb10:0:b0:643:e9f:2e5c with SMTP id
 4fb4d7f45d1cf-64de1177ee3mr44408a12.9.1766777196673; Fri, 26 Dec 2025
 11:26:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
 <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com> <DF050MST4PTF.DFB7FVBD25I7@nvidia.com>
In-Reply-To: <DF050MST4PTF.DFB7FVBD25I7@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 26 Dec 2025 11:26:25 -0800
X-Gm-Features: AQt7F2rs62zGzefraHrgtW3rQcLehPWxozm_oIVodW7Osh4qDU055tLrtjDYFZ8
Message-ID: <CAGSQo0173bon2kGo5wGFXo-1x+LL1NpH376Z4GcshKaGVNLHXw@mail.gmail.com>
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

On Tue, Dec 16, 2025 at 6:31=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Wed Dec 17, 2025 at 4:24 AM JST, Matthew Maurer wrote:
> > Allow SoC drivers in Rust to present metadata about their devices to
> > userspace through /sys/devices/socX and other drivers to identify their
> > properties through `soc_device_match`.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  MAINTAINERS                     |   1 +
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/lib.rs              |   2 +
> >  rust/kernel/soc.rs              | 135 ++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 139 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c5a7cda26c600e49c7ab0d547306d3281333f672..4ff01fb0f1bda2700209411=
3c0bf9d074d28fdb6 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7700,6 +7700,7 @@ F:      rust/kernel/devres.rs
> >  F:   rust/kernel/driver.rs
> >  F:   rust/kernel/faux.rs
> >  F:   rust/kernel/platform.rs
> > +F:   rust/kernel/soc.rs
> >  F:   samples/rust/rust_debugfs.rs
> >  F:   samples/rust/rust_debugfs_scoped.rs
> >  F:   samples/rust/rust_driver_platform.rs
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> > index a067038b4b422b4256f4a2b75fe644d47e6e82c8..9fdf76ca630e00715503e2a=
3a809bedc895697fd 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -80,6 +80,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/security.h>
> >  #include <linux/slab.h>
> > +#include <linux/sys_soc.h>
> >  #include <linux/task_work.h>
> >  #include <linux/tracepoint.h>
> >  #include <linux/usb.h>
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index f812cf12004286962985a068665443dc22c389a2..6d637e2fed1b605e2dfc2e7=
b2247179439a90ba9 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -138,6 +138,8 @@
> >  pub mod seq_file;
> >  pub mod sizes;
> >  pub mod slice;
> > +#[cfg(CONFIG_SOC_BUS)]
> > +pub mod soc;
> >  mod static_assert;
> >  #[doc(hidden)]
> >  pub mod std_vendor;
> > diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0d6a36c83cb67ef20dc1e3d=
3995752f36e25ac9f
> > --- /dev/null
> > +++ b/rust/kernel/soc.rs
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2025 Google LLC.
> > +
> > +//! SoC Driver Abstraction.
> > +//!
> > +//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys_so=
c.h)
> > +
> > +use crate::{
> > +    bindings,
> > +    error,
> > +    prelude::*,
> > +    str::CString,
> > +    types::Opaque, //
> > +};
> > +use core::ptr::NonNull;
> > +
> > +/// Attributes for a SoC device.
> > +///
> > +/// These are both exported to userspace under /sys/devices/socX and p=
rovided to other drivers to
> > +/// match against via `soc_device_match` (not yet available in Rust) t=
o enable quirks or
> > +/// device-specific support where necessary.
> > +///
> > +/// All fields are freeform - they have no specific formatting, just d=
efined meanings.
> > +/// For example, the [`machine`](`Attributes::machine`) field could be=
 "DB8500" or
> > +/// "Qualcomm Technologies, Inc. SM8560 HDK", but regardless it should=
 identify a board or product.
> > +pub struct Attributes {
> > +    /// Should generally be a board ID or product ID. Examples
> > +    /// include DB8500 (ST-Ericsson) or "Qualcomm Technologies, inc. S=
M8560 HDK".
> > +    ///
> > +    /// If this field is not populated, the SoC infrastructure will tr=
y to populate it from
> > +    /// `/model` in the device tree.
> > +    pub machine: Option<CString>,
> > +    /// The broader class this SoC belongs to. Examples include ux500
> > +    /// (for DB8500) or Snapdragon (for SM8650).
>
> Formatting of the comments seems a bit off (also appears in other
> places, please reapply formatting globally to be sure).

I have just re-run the `rustfmt` target on this commit, and see no
changes. Is there something specific that you think is off?

>
> > +    ///
> > +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be=
 a JEDEC JEP106 manufacturer
> > +    /// identification.
> > +    pub family: Option<CString>,
> > +    /// The manufacturing revision of the part. Frequently this is MAJ=
OR.MINOR, but not always.
> > +    pub revision: Option<CString>,
> > +    /// Serial Number - uniquely identifies a specific SoC. If present=
, should be unique (buying a
> > +    /// replacement part should change it if present). This field cann=
ot be matched on and is
> > +    /// solely present to export through /sys.
> > +    pub serial_number: Option<CString>,
> > +    /// SoC ID - identifies a specific SoC kind in question, sometimes=
 more specifically than
> > +    /// `machine` if the same SoC is used in multiple products. Some d=
evices use this to specify a
> > +    /// SoC name, e.g. "I.MX??", and others just print an ID number (e=
.g. Tegra and Qualcomm).
> > +    ///
> > +    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be=
 a JEDEC JEP106 manufacturer
> > +    /// identification (the family value) followed by a colon and then=
 a 4-digit ID value.
> > +    pub soc_id: Option<CString>,
> > +}
> > +
> > +struct BuiltAttributes {
>
> Even though this struct is private, some short documentation would be
> helpful - actually the explanation about the relationship between
> `_backing` and `inner` belongs here imho instead of in the member's
> documentation.
