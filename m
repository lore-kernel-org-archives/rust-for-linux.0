Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4817A3932DB
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772574202; cv=pass; b=gbzvHlONpE4HodNdFac5XcLVvoLLIjnQNlIHQIKpnxatQut+IWNlWNMQTThyYPN4fTWPlPvr7LdQxcOdv0uMUqNsbef79xTvMiOicmYW3mJG2yXP7rF9HcfG8XoU8xxWn+oVdWjgAkW5uIZV+KtN2FP5VJ2d3+bbTUupzENW5rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772574202; c=relaxed/simple;
	bh=RxaHiU3dp4ImnK3ZT7YKJ/FcCTzzlwWWCg2Cv/Y4Dj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrZzWAwPgdnvGWYAF9hX+EYQigqqOOi2515Lt55NA1WY2CBtpEsWLQrLZRxiiaNvq5EGkg0iAlxA5ZDxzKzmTGrGaoXklYjy7uAVcOz2L3GiZFwtfMPHaDFGAc2vPhk3UVxBxniL/PyI5jUbtwgmkB0k6gDkysJxKlOeIKIV38U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwOjXfmU; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwOjXfmU"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89a018cbbf8so26862256d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Mar 2026 13:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772574200; cv=none;
        d=google.com; s=arc-20240605;
        b=hBlii3EHXSKyieQuaF2p+PSD+WP3Mm9ZHz2HMQybECNF/NF6+1Gf9tpk8FPxBQ0tEs
         Rc9Y7VmFMJGnVJk1Z4/0dvwCIg3zUp+waT9qUuTEW2mgmC4BAo4ZapR5sSV5rlqwwo+L
         7Q1Pl8XK6zNEsHKUZvAAcWAqZAhzOVJHbF4UFIfosyPwErlRl+BLj2JeWJfw9tlH1uId
         Zh3q7MEM4nREZS7wYDHjs6IKhBv1Ws1k1QSwbeCwBB6UV5jmWVF6lRUrYQDNlhmCUb9L
         1yQHhskHu+nmpBKFwi1Tiy195WoHHWqpr4P7FhNJ5Z/7qRdhKwb8NNxM6mxN4v3P1Ho7
         jiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
        fh=mb0QzXXGGI2WsTnxy1kNn5pHD05XK0nmvzXoISKbTXg=;
        b=XVJdffxnbJ/PkI9l770WDOqwaD5v70ZVi75Y5J+TWreroXHM4DNEReBeHQW7txK8NL
         gZdef7t7Ws5Idedystx/fxZGhNfIzMLZnER0RcBD1KdQ2JGiaPmDuWf/aL8ZQ8i5HKq4
         HPZiYUsC4lPHzFhU45OSljkc/NnSqHVR455la2VFu/CzqTO09Z3HewenJHsJ/H9ydZuJ
         rCSwhtCOgHRUB+hT6+JsNzVo5sS7DgIPQnrgIfAtphvMfUva1OcHt25oY7MPk02PbM6Z
         S98ZoQyqxZ0KYKE1dV+6opnRd5wwiQ1rZ63JQplv1BJ2RslJ9DevQ995BnEGG6XE0kGN
         FxLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772574200; x=1773179000; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
        b=BwOjXfmUSt+BYckSfAxqr75c+NhWhDM/klG8jaAxVV1G/yDkEYTZYdQIrivGTUdcSl
         Geh9hAe7h9R4NXpBpAuf4yoxJeN/we5bdvNQ1oyWhJtRWAAm7iRI0Aog4gNmsy4nVXom
         Qkfzlh/bWSjqliw+6yfbQ2HqVmXyQwzrGLAPu/65MCPZw6eGZ3Jk+z5NGhK3IC0WB5Rf
         v6Awe7MK6QTMzI94XMHcfOxvbvIUmW2wP+Ur8cMPzlHoUAmWYgiSWVJm4OyklW0B4if6
         7VaEt+hIi76rfF0udIT5G5BHJ7o1ZCFWcnvIOyMvNbzD9HiPT1NDlFrn3Ss+jD2fT+W+
         xT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772574200; x=1773179000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
        b=h6EaX/2g+QNf+4JvvOknYfS07tQtEmIzfvtmnQ8U/gkMRIMsaJiZOViVjz36MdrkTp
         VCO0To9oojEs68V0/AzY8UyS6iIhSeBQRbPgYn8C0vr21v8uPPSDpQvetpmii9cOuFQc
         doYGQLoo5fSPk9UgCkEx5afc3rs+MjNU1NCQX9Xc3NkkCRq9NA5YyKYTc1auaURF/95I
         TTRxmdEN+Ca2c5gXRKW9u3PcXPqFDoYnzYfMUUPqjIkaaU8UI/rNE2LdV56NrEb/44HE
         bNlnbx4KUx0MXtRSGxTLpTcjqzgFKXmilsMi/dRXlq36Qp2CjJCsIQ3rKLwfXbflQ0GL
         WB/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMdjvutl2Iqwh+DdkqTsTvZiQQtANMnYic+Qx1Zj8tBELVmfFJNRVvbj2oBrFB0PDUn/UizzkQOQsxqE1rXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYSi7/lfzD4W8jTWCtHpsETXSKDR4fcRe1WjwTiR/PMFvYB3w
	a54hjSFCMniN+hWsLOzNa2gO1y0ZZPxW1fnOAZGe5w8gvgaidu1Dl9GNJnFAvACps+y2vzOcOVH
	Ht1MK2XeQ/arLb8wI58EYieurA36MtNE=
X-Gm-Gg: ATEYQzyBXk569eS2XdJcihza5va8HfLfdvhYa31aHNBUiSIu5ZCr0rIIpzvZQYuFPtN
	gowgTSeJgl3uwyHtjyUmbwW8S2wl3L8FdvmEjMP+nDWYyyIZjzxssmy4g+Pddz6TtlNRb7y8voI
	eTK3TojXiahaK34dt5TC1BJJWi8b0EkBzuo97BCXsIaZbNCulxth1yCrQZrd+oq+w4Y73HWh4R8
	2ykkonBlrSOFZIvo5dxEUN6vOK+sHaW33PjdW8GipDxfV7gQiDk0SjtuIo/PRL7UTw1G7U/wOeq
	vhak5NNTm8JNSqPLrVZ0/iN02t1TDCM8iRCeOnT2HEHhmpvMvO0X5kbgzMAloIydsIk=
X-Received: by 2002:a05:6214:d4e:b0:89a:424:984b with SMTP id
 6a1803df08f44-89a0a92c184mr46978966d6.31.1772574200143; Tue, 03 Mar 2026
 13:43:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com> <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
 <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
In-Reply-To: <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Mar 2026 07:43:08 +1000
X-Gm-Features: AaiRm501GK9n8VvFP38XoGBcDXH4aTIuBWI3dYVSffrndOj8CyH9AOfQu1dTQI4
Message-ID: <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Alexandre Courbot <acourbot@nvidia.com>, arunpravin.paneerselvam@amd.com, 
	joel@joelfernandes.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Mar 2026 at 07:19, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
> Hi Danilo,
>
> On Fri, Feb 27, 2026 at 12:30:20PM +0100, Danilo Krummrich wrote:
> > >
> > > +RUST [GPU BUDDY]
> > > +M: Joel Fernandes <joelagnelf@nvidia.com>
> > > +L: dri-devel@lists.freedesktop.org
> > > +L: rust-for-linux@vger.kernel.org
> > > +S: Maintained
> > > +F: rust/helpers/gpu.c
> > > +F: rust/kernel/gpu/
> >
> > What about adding this to the existing GPU BUDDY ALLOCATOR entry? Maybe you can
> > offer Matthew and Arun your help.
> >
> > Also, this wouldn't be a subentry of "RUST", but the rust version of GPU BUDDY,
> > so it would be "GPU BUDDY [RUST]".
> >
> > Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRASTRUCTURE
> > [RUST]" entry.
>
> Both these additions sound good to me. Just to list all the options below
> so we save time on what we all agree on:
>
> 1. New GPU BUDDY [RUST] entry.
>
> 2. Add it under the existing "DRM DRIVERS AND COMMON INFRASTRUCTURE
>    [RUST]"
>
> 3. Add the rust files under the existing "GPU BUDDY ALLOCATOR" and add
>    myself and Alex as R:/M:
>

Number 3 please,

Dave.
