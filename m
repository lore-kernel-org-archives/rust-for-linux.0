Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22701EF13
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711539333; cv=none; b=j6HsCniBWynI+XnPhE7sCkiJPZMDftIC+YGQNBMeuM4xXSQCVukdmBU9Wf5GkhZbzKLgVjYjYDoRXsiSEePphM+Dsc/K2t1bkMhmSsLgtmjBa0VKplPgeJG2LxILI+s1Zrft+bWGC/23T0cvPCM4vCm/grSDarreKCcg9+pXkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711539333; c=relaxed/simple;
	bh=wuZEbGBBWEhSCgmnsKzymOYEpYZZBAUgrjgYcO+fsZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=B1n6VuEOWRUEvz9E+Pk8SnJNt8JFwbNe96VLRmCvWou1TxvIUbB/1ONd7oDKFMxW7pMwBgq7Ms/EyB81vyKZJOeo1MLusjMYKsHg0U3JZfp3JdCtHyMowlKbMKr7/g1cjvq2HMGLkqpNMWMkMmJshRbxmaoNf+2MOAE8fbcejqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ucp3pCL0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ucp3pCL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711539330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TMx4Yf87psdeqHlbuuQ7Jv+v7oNzI3uzggvCBPMDHvk=;
	b=Ucp3pCL031abqgoEymtHAU8/wW08GYAOS+ULULnoKsRHB3yr3MSPxJU7RBgDP2FHMpREMu
	6ySP/IVQzSX42jiczgfH4M+3RSiw3ui4sa6LMh1zMXTSRg5khlr4sBvljqmFKMu8kTVdOW
	ldJNDunyxYJ6C4+/uaPGYSim7C3AKIY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-rCvNy4tpMkOI1b8esymGLg-1; Wed, 27 Mar 2024 07:35:29 -0400
X-MC-Unique: rCvNy4tpMkOI1b8esymGLg-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-515943d45feso5603466e87.2
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 04:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539328; x=1712144128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMx4Yf87psdeqHlbuuQ7Jv+v7oNzI3uzggvCBPMDHvk=;
        b=SJ9wp1UNGNrPTnJKh0y8Dr0IgLEbiioic2hlz66/x1/lgnYR9iJZ02leKp/k9Sp6Ip
         iaT8CRYrcKOZqJunEycBOfqybuLm6PblAn9NayYN1B0Wf4gYTXSNaXT7kC6ru/lVwc0h
         z0uNWtro+4GpbHSy5fycm/8onxoe431SVRNmmgobGUcPtnT4k/rvWpYGd4gnvVp0xImD
         DZEBa75bZ93TwmlI5s71zXJTytHY2R+BKaRQNsAn94SA0rPXA7P28R2tAkHKx0f/Kzq9
         fyKH5858W9ot4fa85jx20GOljnjMxcWErgnQWDE0gm/3Kn1lpEvLyuL4ZW812Sx9+qp7
         Bdvg==
X-Forwarded-Encrypted: i=1; AJvYcCX/pY7uPKMFxCj7q7bTUGAVbC5C1izxZ7kGFB1/pBhDq1Qn/MQLEO7ESgX4mgqtoOkFi6EPCdD9Eon8t5FD39u8LIIfbdfmO1gnr0pbxLY=
X-Gm-Message-State: AOJu0YxZgHA3rHDfUvGIFs/3o4pA5jfIqnf7dnbLiBrthbDbvgJLlrBm
	TuAB0pkjKPYWq0q++udjAVXdn2E5pWYoopPDgAxpkkpdtFXOQw044vZiXvHTIyOuS996xBxKUY8
	I/XRV85Vl3JSaXxzJB41DcimKSx8LeDJCY75cjdWbsKajrSxn9PuaRfiR1RQr+iqB
X-Received: by 2002:a19:914c:0:b0:514:d262:4086 with SMTP id y12-20020a19914c000000b00514d2624086mr751890lfj.55.1711539327781;
        Wed, 27 Mar 2024 04:35:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTtMHov7jE3Rmu6MoLktbYK9eeBlet6uqycES7KWveJqckDvSdY1lLyo874BZ1wncGnpT1JA==
X-Received: by 2002:a19:914c:0:b0:514:d262:4086 with SMTP id y12-20020a19914c000000b00514d2624086mr751851lfj.55.1711539327395;
        Wed, 27 Mar 2024 04:35:27 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id cw10-20020a056000090a00b0033e7a102cfesm14695239wrb.64.2024.03.27.04.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:35:26 -0700 (PDT)
Date: Wed, 27 Mar 2024 12:35:24 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, rafael@kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <ZgQEfCFWN6zNbuiz@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
 <CANeycqqQjSqA8CK66wyaNnSckr2GNDtfEUv_Tm29WbzAs7Njzg@mail.gmail.com>
 <2024032703-mobile-perch-0a55@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032703-mobile-perch-0a55@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 27, 2024 at 06:22:36AM +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 10:38:49PM -0300, Wedson Almeida Filho wrote:
> > On Mon, 25 Mar 2024 at 15:17, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> > > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > >
> > > > Add a Device type which represents an owned reference to a generic
> > > > struct device. This minimal implementation just handles reference
> > > > counting and allows the user to get the device name.
> > > >
> > > > Also, implement the rust_helper_dev_get_drvdata helper.
> > > >
> > > > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > > > Co-developed-by: Asahi Lina <lina@asahilina.net>
> > > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > ---
> > > >  rust/helpers.c        | 13 ++++++++
> > > >  rust/kernel/device.rs | 76 ++++++++++++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 88 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/rust/helpers.c b/rust/helpers.c
> > > > index 70e59efd92bc..1e40661a33d1 100644
> > > > --- a/rust/helpers.c
> > > > +++ b/rust/helpers.c
> > > > @@ -23,6 +23,7 @@
> > > >  #include <kunit/test-bug.h>
> > > >  #include <linux/bug.h>
> > > >  #include <linux/build_bug.h>
> > > > +#include <linux/device.h>
> > > >  #include <linux/err.h>
> > > >  #include <linux/errname.h>
> > > >  #include <linux/mutex.h>
> > > > @@ -157,6 +158,18 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
> > > >
> > > > +void *rust_helper_dev_get_drvdata(struct device *dev)
> > > > +{
> > > > +     return dev_get_drvdata(dev);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
> > > > +
> > > > +const char *rust_helper_dev_name(const struct device *dev)
> > > > +{
> > > > +     return dev_name(dev);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(rust_helper_dev_name);
> > > > +
> > > >  /*
> > > >   * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
> > > >   * use it in contexts where Rust expects a `usize` like slice (array) indices.
> > > > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > > > index 9be021e393ca..7309a236f512 100644
> > > > --- a/rust/kernel/device.rs
> > > > +++ b/rust/kernel/device.rs
> > > > @@ -4,7 +4,7 @@
> > > >  //!
> > > >  //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> > > >
> > > > -use crate::bindings;
> > > > +use crate::{bindings, str::CStr};
> > > >
> > > >  /// A raw device.
> > > >  ///
> > > > @@ -20,4 +20,78 @@
> > > >  pub unsafe trait RawDevice {
> > > >      /// Returns the raw `struct device` related to `self`.
> > > >      fn raw_device(&self) -> *mut bindings::device;
> > > > +
> > > > +    /// Returns the name of the device.
> > > > +    fn name(&self) -> &CStr {
> > > > +        let ptr = self.raw_device();
> > > > +
> > > > +        // SAFETY: `ptr` is valid because `self` keeps it alive.
> > >
> > > How can self keep it alive?
> > >
> > > > +        let name = unsafe { bindings::dev_name(ptr) };
> > > > +
> > > > +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> > > > +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> > > > +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> > > > +        // by the compiler because of their lifetimes).
> > >
> > > devices are renamed all the time, I don't understand how this can be
> > > true here.
> > 
> > This was discussed before:
> > https://lore.kernel.org/lkml/ZAnB%2FDozWsir1cIE@kroah.com/
> > 
> > I even sent a patch (that Greg applied) that fixes the C comment that
> > lead to the safety comment above:
> > https://lore.kernel.org/lkml/20230406045435.19452-1-wedsonaf@gmail.com/
> > 
> > The decision then was to remove the `name` method until some driver
> > actually needed it. (We had no plans to upstream the one that used it
> > in the rust branch, pl061 gpio.)
> 
> Ah, I thought I had reviewed all of this before, thanks for pointing
> this out.  And sad that nothing really changed since then, I'll just
> ignore all of this thread for now someone figures out how to act on
> review comments that are made.

I was aware of the previous discussions, but I read them quite a while before I
sent this series and hence I think I forgot to mention that this is, partially,
a follow-up. Sorry for that.

However, the only relevant outcome for this series seems to be that you agreed
on dropping RawDevice::name(). I was considering to use the PCI device name in
Nova in the context of debugfs entries for the GSP firmware, which is why I did
not drop this function. Again sorry, should have made this transparent.

> 
> Ignoring them for a year and resending the lot just wastes everyone's
> time :(

Except for the above all the other discussions we currently have doesn't seem to
be repetitive and I think we were making good progress. I think it would be
unfortunate to start over on them in a v2. Can we please continue?

Besides that, I also think that even the dev_name() discussion we have is worth
to follow up in general, even if we just drop RawDevice::name() for now, which
I'm fine with.

- Danilo

> 
> greg k-h
> 

