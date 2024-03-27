Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FD51C11
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 09:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711530361; cv=none; b=cA6qzzi1u2/ZxottyM96pQ7ZfdEiIrMt0WlXE/dZT2XF//GF1HxX6APuxab0+hu4VnUJPyYOlS4xXsJGgtaX2mmEumAbOG/XpX4hT3c1SC2WQYW5+MyH5eED30tuAoFAx3BF/CjOZE6GysYIiUjSzIw+brmv5FzADL086medCR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711530361; c=relaxed/simple;
	bh=WLaEkAGCDjvfT5YYhuXLqles+QHg7m9liQAfwYYULIM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OyDax5O5DVk17GuXg4FgiO7PINHKSicuLo2dRfpq4em8DG+rmunS6mdjc5e5kAiJKRMVxTHoWf/c2VEWMD/+9ddaRirJK/qk8BWDziJr6N+FIV1ILtNe9HodYGvKzylBcmGf2v0p0VQlSxnUz2Gu2tmfuKug6tf8fwDOUBC183M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XMMdv44j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XMMdv44j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711530357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WLaEkAGCDjvfT5YYhuXLqles+QHg7m9liQAfwYYULIM=;
	b=XMMdv44jbEsqNX06hZfyGWekV1FEfi4I7xzEXiPROyFsBdPJd1m7oorQWdCM5VrxJe9ePM
	wQos1EhMfp5EwzkL+mWSu/peEwGtGZpbW8/hssQFZtL+rB8BsXNUhpdJnct03WP+VM5e47
	0HtlJB/QS+/Tkntrdt+qyhwGfZPVF4w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-V_MpEvkEO_ybwAZ8EKR77Q-1; Wed, 27 Mar 2024 05:05:56 -0400
X-MC-Unique: V_MpEvkEO_ybwAZ8EKR77Q-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-341d0499bbdso589066f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 02:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530354; x=1712135154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLaEkAGCDjvfT5YYhuXLqles+QHg7m9liQAfwYYULIM=;
        b=YYNhXp4zewYY+uB/VK8pmk5jnX+jGVCwj8w2DuwFC/CusbK0dMOd92kCjAGoVNg+8A
         ld90Hz+dsZ2GB3EnNPWw/1MwhZ9XRyBCxdvg9pYoiBY19ZKtFcP2UNlu9sa+4Rhyqvax
         5Om9xPzE/b/pblNgGRsUPCCIhcUqiw5nIZKbStxAFng8bbH+yzg2mjfuGW1pHbdIBx+B
         p9t/1AmphJ9edSBtz2lgeA0c3Dom9qny0fi+oXUNoEe9xsrdZAOHYitqBvUyChrfdH46
         ks3OeeQsTOOEc2ms2j91UD9DrHuy+YW6p5gGMNZUvUhdYt59vutAca+D0arLNZ8WXxgG
         5/GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCRdzB0GhKoeJxaOodOStkKZACiAJLz1pqLAFLeS6wVvKzk6nboF6/gOe1o731NAkyFK4M+e4lgoq0MlC1/kx19L2K0iRWHE9YtcPWmy8=
X-Gm-Message-State: AOJu0YxYSbPghafE2JzK6Vd2Yy1+4bFhCcaxt2LKk8SGRF4gLf6kaycO
	KuCxxtRp4WLXWtSNbakXefWVGxeqxSdNgKxlIKVy+PNKY9GbjhC4Q7YgTlpzqHwG5NvUwpVOriS
	rBiOfkURc8fhys4wCsaFrH0aMhScco1by8r828gcs7ukebLTsu6ZZV4e8rfjZOUVp
X-Received: by 2002:a5d:6708:0:b0:33b:48ed:be63 with SMTP id o8-20020a5d6708000000b0033b48edbe63mr7262385wru.7.1711530354372;
        Wed, 27 Mar 2024 02:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyA2B7ippE81/ExTWF3M/dlAjiz8+yldzZ5oHYvLBDmSl+wvQ/GtdEPgUPC/XvpaG6KSS7lg==
X-Received: by 2002:a5d:6708:0:b0:33b:48ed:be63 with SMTP id o8-20020a5d6708000000b0033b48edbe63mr7262363wru.7.1711530353813;
        Wed, 27 Mar 2024 02:05:53 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id bt17-20020a056000081100b00341b5cf0527sm4174629wrb.11.2024.03.27.02.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:05:53 -0700 (PDT)
Message-ID: <dc21d9dc9be739122e60caefa0f75ac29bd2a3c7.camel@redhat.com>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
From: Philipp Stanner <pstanner@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>, Wedson Almeida Filho
	 <wedsonaf@gmail.com>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org,
  alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
 aliceryhl@google.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
 dave.hansen@linux.intel.com, rust-for-linux@vger.kernel.org,
 x86@kernel.org,  lyude@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
 Asahi Lina <lina@asahilina.net>
Date: Wed, 27 Mar 2024 10:05:51 +0100
In-Reply-To: <2024032703-mobile-perch-0a55@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
	 <20240325174924.95899-4-dakr@redhat.com>
	 <2024032518-swampland-chaperone-317b@gregkh>
	 <CANeycqqQjSqA8CK66wyaNnSckr2GNDtfEUv_Tm29WbzAs7Njzg@mail.gmail.com>
	 <2024032703-mobile-perch-0a55@gregkh>
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

On Wed, 2024-03-27 at 06:22 +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 10:38:49PM -0300, Wedson Almeida Filho wrote:
> > On Mon, 25 Mar 2024 at 15:17, Greg KH <gregkh@linuxfoundation.org>
> > wrote:
> > >=20
> > > On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> > > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > >=20
> > > > Add a Device type which represents an owned reference to a
> > > > generic
> > > > struct device. This minimal implementation just handles
> > > > reference
> > > > counting and allows the user to get the device name.
> > > >=20
> > > > Also, implement the rust_helper_dev_get_drvdata helper.
> > > >=20
> > > > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > > Co-developed-by: Asahi Lina <lina@asahilina.net>
> > > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > ---
> > > > =C2=A0rust/helpers.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13=
 ++++++++
> > > > =C2=A0rust/kernel/device.rs | 76
> > > > ++++++++++++++++++++++++++++++++++++++++++-
> > > > =C2=A02 files changed, 88 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/rust/helpers.c b/rust/helpers.c
> > > > index 70e59efd92bc..1e40661a33d1 100644
> > > > --- a/rust/helpers.c
> > > > +++ b/rust/helpers.c
> > > > @@ -23,6 +23,7 @@
> > > > =C2=A0#include <kunit/test-bug.h>
> > > > =C2=A0#include <linux/bug.h>
> > > > =C2=A0#include <linux/build_bug.h>
> > > > +#include <linux/device.h>
> > > > =C2=A0#include <linux/err.h>
> > > > =C2=A0#include <linux/errname.h>
> > > > =C2=A0#include <linux/mutex.h>
> > > > @@ -157,6 +158,18 @@ void rust_helper_init_work_with_key(struct
> > > > work_struct *work, work_func_t func,
> > > > =C2=A0}
> > > > =C2=A0EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
> > > >=20
> > > > +void *rust_helper_dev_get_drvdata(struct device *dev)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 return dev_get_drvdata(dev);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
> > > > +
> > > > +const char *rust_helper_dev_name(const struct device *dev)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 return dev_name(dev);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rust_helper_dev_name);
> > > > +
> > > > =C2=A0/*
> > > > =C2=A0 * `bindgen` binds the C `size_t` type as the Rust `usize`
> > > > type, so we can
> > > > =C2=A0 * use it in contexts where Rust expects a `usize` like slice
> > > > (array) indices.
> > > > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > > > index 9be021e393ca..7309a236f512 100644
> > > > --- a/rust/kernel/device.rs
> > > > +++ b/rust/kernel/device.rs
> > > > @@ -4,7 +4,7 @@
> > > > =C2=A0//!
> > > > =C2=A0//! C header:
> > > > [`include/linux/device.h`](../../../../include/linux/device.h)
> > > >=20
> > > > -use crate::bindings;
> > > > +use crate::{bindings, str::CStr};
> > > >=20
> > > > =C2=A0/// A raw device.
> > > > =C2=A0///
> > > > @@ -20,4 +20,78 @@
> > > > =C2=A0pub unsafe trait RawDevice {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 /// Returns the raw `struct device` relate=
d to `self`.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 fn raw_device(&self) -> *mut bindings::dev=
ice;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /// Returns the name of the device.
> > > > +=C2=A0=C2=A0=C2=A0 fn name(&self) -> &CStr {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ptr =3D self.raw_de=
vice();
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `ptr` is val=
id because `self` keeps it
> > > > alive.
> > >=20
> > > How can self keep it alive?
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let name =3D unsafe { b=
indings::dev_name(ptr) };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The name of =
the device remains valid while
> > > > it is alive (because the device is
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // never renamed, per t=
he safety requirement of this
> > > > trait). This is guaranteed to be the
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // case because the ref=
erence to `self` outlives the
> > > > one of the returned `CStr` (enforced
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // by the compiler beca=
use of their lifetimes).
> > >=20
> > > devices are renamed all the time, I don't understand how this can
> > > be
> > > true here.
> >=20
> > This was discussed before:
> > https://lore.kernel.org/lkml/ZAnB%2FDozWsir1cIE@kroah.com/
> >=20
> > I even sent a patch (that Greg applied) that fixes the C comment
> > that
> > lead to the safety comment above:
> > https://lore.kernel.org/lkml/20230406045435.19452-1-wedsonaf@gmail.com/
> >=20
> > The decision then was to remove the `name` method until some driver
> > actually needed it. (We had no plans to upstream the one that used
> > it
> > in the rust branch, pl061 gpio.)
>=20
> Ah, I thought I had reviewed all of this before, thanks for pointing
> this out.=C2=A0 And sad that nothing really changed since then, I'll just
> ignore all of this thread for now someone figures out how to act on
> review comments that are made.
>=20
> Ignoring them for a year and resending the lot just wastes everyone's
> time :(

Hi,

I'd ask for some generosity here =E2=80=93 as you might have noticed, there=
's
now a "new team" dedicating their time to these efforts, in addition to
those who have been working on it for longer.

Danilo spent a very great amount of time just collecting commits,
contacting the authors and coordinating with them, gather all the
downstream branches, make sure they build warning-free and work with a
test driver, try to understand the existing code base etc. etc. pp.

It's really a lot of work and some things might be looked over. It's
not as if anyone "ignored [the feedback] for a year", it's more that
it's several parties scattered over several companies, with some of the
parties having dropped out by now.

With that being said, your help and feedback is extremely valuable, so
keeping that process going would be neat :)

Regarding the feedback from the thread from a year ago: Assuming we
implement as much of that as possible, could we get back at you with
follow up questions and discussions here in this thread?

Thanks,
P.

>=20
> greg k-h
>=20

