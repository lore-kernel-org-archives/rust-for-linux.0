Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29D3BBC9
	for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 07:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716363459; cv=none; b=rooL2YAD9e+FOQqLTPlfyURjlqA8LHLpWPRwvXB1GH7vOwJeCdmggWdudPftS9v06zhRP9O2NnYb9Z1gWg0YD7psxwHkE51eieb/PIUHbdC9w6IwcIOO98Rg1KwgoHNTRUj/lhDV/VvPneQJF3mdKLwFkc0RUAkSXYUpUbaeFic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716363459; c=relaxed/simple;
	bh=8aHWlEgygkwA3tRbeqByxQNqA067pG4KDVYSLn8mH9Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mB6Ntyh6S/c+TfNA4LMR8dwWKFKoX4FgEq8kL33VctJ96mD1Jo6v5eICUco/OtD/yOTnIYfA0lnKZMcNeb+QFmRF2zY4CoG8g30c7uHMIvqeapui7QODg8MFg4IU+U6kKUM9djVSzgQDaKv8blZ2cgXpUtX30fgjxE8ufp/26Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iFUh+Bo4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iFUh+Bo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716363456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aHWlEgygkwA3tRbeqByxQNqA067pG4KDVYSLn8mH9Y=;
	b=iFUh+Bo42r8y+NmVT0LDUVOsrPw1+GuzkaoXKVMDj3VMm3ltK4Ou0adm64XW4Wuehj7Fhn
	9iDsri5Xr/7XPuv8K0wyjj1smes3rrudEEo893W4932fkVJ8XTKM8NBLUbEh/BioJh0Y0I
	qTcrC8h80/3snI+sK4JghL9mC0UNxIg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-EGX0oHNbO9K6Y44e_AwSxg-1; Wed, 22 May 2024 03:37:35 -0400
X-MC-Unique: EGX0oHNbO9K6Y44e_AwSxg-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-792db20313cso267483885a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 May 2024 00:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716363455; x=1716968255;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8aHWlEgygkwA3tRbeqByxQNqA067pG4KDVYSLn8mH9Y=;
        b=beu5GPHCRPoeBlDouXO255agktKzmdmw9dc6/yqKtj4lN1pHsQiwqBQgnoTrEoqFUN
         qwY+pofBzQir7c/R25EaEzvd76HKPDw8WwjaGDIZH3LCMng78PRi+4pltKkQOQtchWNZ
         E7LHFN43Eaorh5M9yMLpPuoTlxLJtQ0HBb5XBqyw2GxbkUWuPGHuDqqXl0lPVdv0eSai
         wWeWT0klV71jYocHI4SuZM3WZqwRU0qZJIopbsLqyjjUZWEQPIkSqXin0ME+0eVF909k
         AkKTpJTDwMCvZeI6lSfu0tLlWeOQSLXPFyrOXx9WTzi7/Oq+2XWW/Rif8iukcfENZF+b
         pVtA==
X-Forwarded-Encrypted: i=1; AJvYcCXEAiIUzgQ1yoH2iPrUNmHxA6eQ+1GDSeve+dykpU8rQ0xKA7npGcsP2useZ4Wd+W1vlM4uWfiyk83s6vS03cfBo5H5RmlEnSH3uQRU6+o=
X-Gm-Message-State: AOJu0YxXLP/x6WSKsP0clm9nRYZOOp4NXOhFLAO7rnuhRs6ff2BfH676
	LsctdoM0Z24JoNHg8+OYhXr/Idjfg8qLtA3K0ct38UsYRkKJsWFGXVJ5FT6DwKAIkQRYVetyylA
	P0cScXXL0nShLuIdvsj4Ek5JJRufC9aXlLaVHI1QFSIdLcHAfiXdNBa4dM0jsR9eJ
X-Received: by 2002:a05:620a:4491:b0:790:fbf5:e31a with SMTP id af79cd13be357-794994a9433mr122622685a.3.1716363454676;
        Wed, 22 May 2024 00:37:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtHk4to1dfo+BAJjETLLTN0cBCNnEmnRqv15MBpg+2BkTIqUUVEK1If53rgActa2EPcK5xJw==
X-Received: by 2002:a05:620a:4491:b0:790:fbf5:e31a with SMTP id af79cd13be357-794994a9433mr122621485a.3.1716363454268;
        Wed, 22 May 2024 00:37:34 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79481013155sm320794285a.115.2024.05.22.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 00:37:34 -0700 (PDT)
Message-ID: <35fef820ed6e67f2203e78735fc9e15248436221.camel@redhat.com>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
From: Philipp Stanner <pstanner@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, dakr@redhat.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de,  airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com,  wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net,  bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com,  aliceryhl@google.com, lina@asahilina.net,
 ajanulgu@redhat.com, lyude@redhat.com,  gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Date: Wed, 22 May 2024 09:37:30 +0200
In-Reply-To: <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
References: <20240520172059.181256-1-dakr@redhat.com>
	 <20240520172422.181763-4-dakr@redhat.com>
	 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-05-22 at 08:53 +0900, FUJITA Tomonori wrote:
> Hi,
> Thanks for working on the firmware API!
>=20
> On Mon, 20 May 2024 19:24:19 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
>=20
> > Add an abstraction around the kernels firmware API to request
> > firmware
> > images. The abstraction provides functions to access the firmware
> > buffer and / or copy it to a new buffer allocated with a given
> > allocator
> > backend.
> >=20
> > The firmware is released once the abstraction is dropped.
> >=20
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> > =C2=A0 rust/bindings/bindings_helper.h |=C2=A0 1 +
> > =C2=A0 rust/kernel/firmware.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 74
> > +++++++++++++++++++++++++++++++++
> > =C2=A0 rust/kernel/lib.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 3 files changed, 76 insertions(+)
> > =C2=A0 create mode 100644 rust/kernel/firmware.rs
> >=20
> > diff --git a/rust/bindings/bindings_helper.h
> > b/rust/bindings/bindings_helper.h
> > index b245db8d5a87..e4ffc47da5ec 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -14,6 +14,7 @@
> > =C2=A0 #include <kunit/test.h>
> > =C2=A0 #include <linux/errname.h>
> > =C2=A0 #include <linux/ethtool.h>
> > +#include <linux/firmware.h>
> > =C2=A0 #include <linux/jiffies.h>
> > =C2=A0 #include <linux/mdio.h>
> > =C2=A0 #include <linux/pci.h>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > new file mode 100644
> > index 000000000000..700504fb3c9c
> > --- /dev/null
> > +++ b/rust/kernel/firmware.rs
> > @@ -0,0 +1,74 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Firmware abstraction
> > +//!
> > +//! C header:
> > [`include/linux/firmware.h`](../../../../include/linux/firmware.h")
> > +
> > +use crate::{bindings, device::Device, error::Error, error::Result,
> > str::CStr, types::Opaque};
> > +
> > +/// Abstraction around a C firmware struct.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just
> > like with the C API, firmware can
> > +/// be requested. Once requested the abstraction provides direct
> > access to the firmware buffer as
> > +/// `&[u8]`. Alternatively, the firmware can be copied to a new
> > buffer using `Firmware::copy`. The
> > +/// firmware is released once [`Firmware`] is dropped.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// let fw =3D Firmware::request("path/to/firmware.bin",
> > dev.as_ref())?;
> > +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(Opaque<*const bindings::firmware>);
>=20
> Wrapping a raw pointer is not the intended use of Qpaque type?
>=20

What is the intended use?
As I see it, all uses wrapp some binding::* =E2=80=93 but a rawpointer to a
binding shouldn't be wrapped by it?

Maybe we can add something to the docu in kernel/types.rs:


/// Stores an opaque value.
///
/// This is meant to be used with FFI objects that are never interpreted by=
 Rust code.
#[repr(transparent)]
pub struct Opaque<T> {



P.

