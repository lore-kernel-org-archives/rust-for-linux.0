Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83E7D3F0
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jul 2024 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720438129; cv=none; b=JjCgEmfuIZE3GenIomLSM7vrB04AfHM3Y5qRLAqeUhi0AS0XZ04hbe+ANHMYCyut/cTe+KHMD9EaLzo6MiIzOAMPkhnhQmq5Pqw+g1J+9gTvyTEvFI9fAWriXvR6H+hqFqpZpDl7AMOizpLrwkVIAs8maNz6sd8+/RI3b01krjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720438129; c=relaxed/simple;
	bh=YLEz2nxMe8+wpWlmygRPdtARH+mr6uUxXFx2jMYYd8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=E2f6L232cA+Yog+lX+95MIKwps7IyMD6fvlSYGMEgFXYK0chWhgaSbxo8cdw8W1krpk2oXGPkOpLYhGvgSSSM7cVT6Pi03DIasjUaPwg2GbirqgDRGrOFyxLJveAAus7Wg3nwxmS7GlkCpldTKOG4o4Ay2c8vYi33wUxo/F7jno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhM/1KHn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhM/1KHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720438127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ggF5ejO/txQzvQN281lQIDXsDHvIvFc8LKda5u6H7Cw=;
	b=BhM/1KHnvmuLy8fe5dh1RNe152bGZvExkY9PLV3vQZMWTinbrpCV2xhu4ntXTMZGVSZwQQ
	b7Yl5QhGJIB8RoWuC7eu0rejQCq7t72/154njQTnGt+KJ8sPznQvfmDPkkHykVjGdYkPaw
	DShNMppb9dNcvKEQb3Mp2yEX0aWPWp0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-mCHIK3WvPT227pOJb0otoQ-1; Mon, 08 Jul 2024 07:28:46 -0400
X-MC-Unique: mCHIK3WvPT227pOJb0otoQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ee890f0cecso41004051fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 04:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720438125; x=1721042925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggF5ejO/txQzvQN281lQIDXsDHvIvFc8LKda5u6H7Cw=;
        b=DSOpifpgZqzrk8o7Alvh1Km7R6lBuqV5gcLDp0cz0f/GyG6Gs8nSq8Cr8iJQrGprBI
         S2eB6k5RublQwbhKNZtvuJtNPHtMqXLUuYxL8V1IACdGsF7nRY7CYiaHPfS/29t0dY0I
         0kvB3YvN/EZ12HiTABrCXomdw+qH2yKy4d9e9GJciyxVbnzS2DZ4yNw4ALVhvdZrTBcA
         u3FHu5ETlmXV55FwHi4Kp79xvscQ60yHWKWGUI+22FbQ8oZRfRmMW7A0mE4N5PjUN395
         FtY9t8J6r7VWRMwqT0KdlUe8NuYE5g6+acKE8QeV2atmBKSZLY8IOheb3OkLlCkXybAC
         Hfjw==
X-Forwarded-Encrypted: i=1; AJvYcCWH7ITxRTM19w0rFi+v3fYnbO4KK+iNEOGy1sqqkwcYdXwweqTGdjIlXqjvUYWh5gFPYbBEr2hXl8cVFzBcWnIWQmZQjB2N5Y+gBNdLno4=
X-Gm-Message-State: AOJu0YyJ7ao3X5Gt8/ss8OQ4dlILDQcOqgg8UfmD9zY20LJ+8/ULQeOI
	Aeko7s0cjoIY/ZL15LxRQF6cpR+Wzynao38wh6EQ/D7r4ccg/s7jrha/BTC5Pd/J7meeg/Q46pH
	drszCKZ614Q2g5XsNoRIiBR1IXZ4PlnXq+kvmTwqZ+CFDJECxYLU8b2ZN65YiXyXT
X-Received: by 2002:a2e:818d:0:b0:2ee:8777:f86b with SMTP id 38308e7fff4ca-2ee8edd3edbmr75131691fa.35.1720438124878;
        Mon, 08 Jul 2024 04:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH1Nsdje5001n1qOWAw4XX9RASw+K0ZvlbBfsk3SL/6HvLcu8zL4MIKOBiacj2ApWr0nCz3Q==
X-Received: by 2002:a2e:818d:0:b0:2ee:8777:f86b with SMTP id 38308e7fff4ca-2ee8edd3edbmr75131551fa.35.1720438124455;
        Mon, 08 Jul 2024 04:28:44 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2518f9sm162467895e9.31.2024.07.08.04.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 04:28:44 -0700 (PDT)
Date: Mon, 8 Jul 2024 13:28:42 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: mcgrof@kernel.org, russ.weight@linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH 2/2] firmware_loader: fix soundness issue in
 `request_internal`
Message-ID: <ZovNap1NBusREw_-@pollux>
References: <20240707003835.69090-1-dakr@redhat.com>
 <20240707003835.69090-2-dakr@redhat.com>
 <dd56a9d9-08fe-4bd4-83e2-dfdc44f8c637@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <dd56a9d9-08fe-4bd4-83e2-dfdc44f8c637@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 07, 2024 at 10:57:31PM +0200, Christian Schrefl wrote:
> Greetings.
> 
> On 07.07.24 2:38 AM, Danilo Krummrich wrote:
> > `request_internal` must be called with one of the following function
> > pointers: request_firmware(), firmware_request_nowarn(),
> > firmware_request_platform() or request_firmware_direct().
> > 
> > The previous `FwFunc` alias did not guarantee this, which is unsound.
> > 
> > In order to fix this up, implement `FwFunc` as new type with a
> > corresponding type invariant and unsafe `new` function.
> > 
> > Reported-by: Gary Guo <gary@garyguo.net>
> > Closes: https://lore.kernel.org/lkml/20240620143611.7995e0bb@eugeo/
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/firmware.rs | 32 ++++++++++++++++++++++++++------
> >  1 file changed, 26 insertions(+), 6 deletions(-)
> > 
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > index 106a928a535e..d765ecc85d38 100644
> > --- a/rust/kernel/firmware.rs
> > +++ b/rust/kernel/firmware.rs
> > @@ -7,11 +7,24 @@
> >  use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
> >  use core::ptr::NonNull;
> >  
> > -// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
> > -// `firmware_request_platform`, `bindings::request_firmware_direct`
> > -type FwFunc =
> > +type RawFwFunc =
> >      unsafe extern "C" fn(*mut *const bindings::firmware, *const i8, *mut bindings::device) -> i32;
> >  
> > +/// # Invariants
> > +///
> > +/// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
> > +/// `firmware_request_platform`, `bindings::request_firmware_direct`
> > +struct FwFunc(RawFwFunc);
> > +
> > +impl FwFunc {
> > +    /// # Safety
> > +    ///
> > +    /// Must be one of the functions listed in the type invariants.
> > +    unsafe fn from_raw(func: RawFwFunc) -> Self {
> > +        Self(func)
> > +    }
> Why not write methods that construct each possible FwFunc?

Thanks, this is a good idea indeed, will send a v2.

> That way the code that needs to know abut this invariant is only inside a single impl block.
> Something like:
> impl FwFunc {
>     fn request_firmware() -> Self {
>         // # Safety
>         // As per the Type Invariant `bindings::request_firmware` is a valid vaule.
>     	FwFunc(bindings::request_firmware)
>     }
> }
> 
> > +}
> > +
> >  /// Abstraction around a C `struct firmware`.
> >  ///
> >  /// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> > @@ -48,7 +61,7 @@ fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
> >  
> >          // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
> >          // `name` and `dev` are valid as by their type invariants.
> > -        let ret = unsafe { func(pfw as _, name.as_char_ptr(), dev.as_raw()) };
> > +        let ret = unsafe { func.0(pfw as _, name.as_char_ptr(), dev.as_raw()) };
> >          if ret != 0 {
> >              return Err(Error::from_errno(ret));
> >          }
> > @@ -60,13 +73,20 @@ fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
> >  
> >      /// Send a firmware request and wait for it. See also `bindings::request_firmware`.
> >      pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
> > -        Self::request_internal(name, dev, bindings::request_firmware)
> > +        // SAFETY: `bindings::request_firmware` is valid by the safety requirement of `FwFunc`.
> > +        let func = unsafe { FwFunc::from_raw(bindings::request_firmware) };
> > +
> > +        Self::request_internal(name, dev, func)
> >      }
> >  
> >      /// Send a request for an optional firmware module. See also
> >      /// `bindings::firmware_request_nowarn`.
> >      pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
> > -        Self::request_internal(name, dev, bindings::firmware_request_nowarn)
> > +        // SAFETY: `bindings::firmware_request_nowarn` is valid by the safety requirement of
> > +        // `FwFunc::new`.
> > +        let func = unsafe { FwFunc::from_raw(bindings::firmware_request_nowarn) };
> > +
> > +        Self::request_internal(name, dev, func)
> >      }
> >  
> >      fn as_raw(&self) -> *mut bindings::firmware {
> 
> Cheers,
> Christian
> 

