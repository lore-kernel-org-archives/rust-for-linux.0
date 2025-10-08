Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFFF20DD72
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928498; cv=none; b=e1qSL1pgGoWIgQTAfZx8R5uttHk6vzX/Atq0T0J2Gt4FniBNhJJUjWq5yUC5+CM8ZpmIXbaNyPx/heEbKHHVRZJcETV67qmRM3EqgnTLBULzSlVHlHhXCqH1iqeCjE/3N38sXdUvrPRRAh29EiyriMtrfu61A5lKOm8j12dzdpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928498; c=relaxed/simple;
	bh=U8gluw6AjhGk5C4G3GGmOk26ZsDpNCj6rdIo4rIN0as=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LnFRBOhl9i+VgmOpDDW1cGK48AOihDU2RBPuBGUbOtE4SWfeHBbNehqxS3D+x1vOet5XJIi6WGyQmOcGu9+4WCO8ZuVuDldE8pDwbUKkNv/ImHJTO50jUUuD/BJaykijDTYYXOYVatNpQfn6+2VpFj0WINM7suuRLlzFSY76t8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IfzrqvhN; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IfzrqvhN"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e44b9779eso28276825e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759928495; x=1760533295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GegBdW6/vqVWwJUxJt/HTrMkbdqIQ76CzJgwPMuKcI0=;
        b=IfzrqvhN3k8D6tCmwFAOMXIZ3zUH1wfHtLoqS5Ycotmv2wVVC1liSJSKg6UcjPYrGk
         GejJ65Z1FTci3WtVkyIrzK7OOmACpsz+CIPDL8GrRTnnDVO5aS5eyMCtAGk12IMXaIg2
         k7SdSY2Ew0qmYJlwMlsh/YmVMQyHWh0fJaWOGFZSwvy97t+JLrkxkQeQMXl/0PhhiaD6
         6+xnH36AJHw/6QP4e9rv/A9Oz4JlOLuhSQRwPOeepWURUkr0dYYhLDIiElpwwd6GwIG6
         yf9YfcQ1uxC7AlSrybO/tGi+KlkWfhor0JePVMW7vSUNLFmfKCA2+X2K2fQMvo02JpjW
         wbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928495; x=1760533295;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GegBdW6/vqVWwJUxJt/HTrMkbdqIQ76CzJgwPMuKcI0=;
        b=Pt1qKR0bv6L6etDVPJsLh9H5NBluCu2LN0UfT84FMKV6p9hEskARJvMCMNfAm0MB7C
         wo/u9w3RYpyP9teIfKNjZ2Eo0OcG/5GmTeWD6arKeloVE6Tc2R+IcELdpJZvuOsuSLvu
         GOryI3lM6uLc5J/45Hrywy9FRm1qNQcTwXAMtpTUCwxIp9xQQGYUaZdQ6/zJ07tm+YjT
         aq1r993u93CXF0vVrEPu9ewe3Wr8TeqQoe3YWtzf52dN1koB6ty5hwtCrDgXwPCCid/7
         EfVQBH217nOf0PnO+kiSQXAZZbR6XK3GOkkPdajfBuxbzS2WPD/P39oPw0P0r7yfRzGL
         9/kA==
X-Forwarded-Encrypted: i=1; AJvYcCUa8q1qop8qHhz8mI/IAvbcXStIheabtfi0jO13ITqHmK3rtvzm/E9fX0hCpGgK+8ihvLxyhrkPPayjQrKBlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcafZWCyIA/PpGrFAfcTPer1be0x+TlKjBNB6BbF5N6O8ywxw1
	yuhoEDw9uHYQ8NyZfRgpL66+un5VA0cRcX1QLfx6ReKsGcE6Kd6xHJbN/rDFuXT3dvvwUemZ/CN
	0Roc60gk+Eu7kXEj1Rw==
X-Google-Smtp-Source: AGHT+IFOSiOdV5yhuZ0ZB6MFGcVW4EY/P9vvGB1lbHla91Nrf6b7CfBCTOLrpELNIGe52y3C6X6BGL/q+rKkFJc=
X-Received: from wmpu15.prod.google.com ([2002:a05:600c:4d0f:b0:46f:aa50:d6ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3546:b0:46e:33a6:46b2 with SMTP id 5b1f17b1804b1-46fa9a96a70mr22790175e9.12.1759928495174;
 Wed, 08 Oct 2025 06:01:35 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:01:34 +0000
In-Reply-To: <DDCV43KW9OGL.27I8HP4TSTQ6N@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006163024.18473-1-work@onurozkan.dev> <20251006163024.18473-2-work@onurozkan.dev>
 <DDBHMNEIU9HJ.68MGF28IF58I@kernel.org> <aOTyVzpJNDOaxxs6@google.com> <DDCV43KW9OGL.27I8HP4TSTQ6N@kernel.org>
Message-ID: <aOZgrhsNrKpxM_PW@google.com>
Subject: Re: [PATCH 1/3] rust: xarray: abstract `xa_alloc`
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:18:24PM +0200, Benno Lossin wrote:
> On Tue Oct 7, 2025 at 12:58 PM CEST, Alice Ryhl wrote:
> > On Mon, Oct 06, 2025 at 09:31:43PM +0200, Benno Lossin wrote:
> >> On Mon Oct 6, 2025 at 6:30 PM CEST, Onur =C3=96zkan wrote:
> >> > Implements `alloc` function to `XArray<T>` that wraps
> >> > `xa_alloc` safely.
> >> >
> >> > Resolves a task from the nova/core task list under the "XArray
> >> > bindings [XARR]" section in "Documentation/gpu/nova/core/todo.rst"
> >> > file.
> >> >
> >> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> >> > ---
> >> >  rust/kernel/xarray.rs | 39 +++++++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 39 insertions(+)
> >> >
> >> > diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> >> > index a49d6db28845..1b882cd2f58b 100644
> >> > --- a/rust/kernel/xarray.rs
> >> > +++ b/rust/kernel/xarray.rs
> >> > @@ -266,6 +266,45 @@ pub fn store(
> >> >              Ok(unsafe { T::try_from_foreign(old) })
> >> >          }
> >> >      }
> >> > +
> >> > +    /// Allocates an empty slot within the given limit range and st=
ores `value` there.
> >> > +    ///
> >> > +    /// May drop the lock if needed to allocate memory, and then re=
acquire it afterwards.
> >> > +    ///
> >> > +    /// On success, returns the allocated id.
> >> > +    ///
> >> > +    /// On failure, returns the element which was attempted to be s=
tored.
> >> > +    pub fn alloc(
> >> > +        &mut self,
> >> > +        limit: bindings::xa_limit,
> >> > +        value: T,
> >> > +        gfp: alloc::Flags,
> >> > +    ) -> Result<u32, StoreError<T>> {
> >>=20
> >> I think it would be a good idea to make the id a newtype wrapper aroun=
d
> >> u32. Maybe not even allow users to manually construct it or even inspe=
ct
> >> it if possible.
> >
> > What? People need to know what the assigned index is.
>=20
> The documentation says "allocated id", so I assumed that it was some
> internal, implementation-dependent thing, not an index. In that case we
> should change the docs instead.

An xarray is a map from integer to pointer. The allocated id the key in
this map. The alloc method picks the smallest unused key in a given
range.

Alice
