Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B117C9FA
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Jun 2024 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112102; cv=none; b=m414lcmsVW1aixgE7UWhxfZsgCgHzlNIitRCP2BZuDGLmu5bE9nuAuFFO0cGgT1hd5euns3qsaNJSXKDFagUkOYim2rfxkcZm7OWcXFE8HlyDK4ATXFSRkBhdaGPagsXY5Jjgktg4HByDRdw7d5B8VPCZlsK5XXVG33B5vTX4jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112102; c=relaxed/simple;
	bh=N9bbDuUtVI3n6modvV8e2C1xul8okVr+fDJnep69kXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TXNuqB6dZsWbYlooQwMlx6R4mGXUT6MJMgrs/ntJmoJ1KIwS7iyvIyiSeiQT29tauQ0a3QBS92o5XVEFsmsYHSuGyGw821Rhe87pmO/gnbE+KFhE4QkXiREqzjkUyaua5QRfnrst246b4CJxgbZ4bDqxouuKoVhkt45FHFO1FB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5DWPQfS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5DWPQfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718112099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIL3WzHfFsP6BI60s8nCj0qGjt3OC3BNLgftYsOna64=;
	b=Y5DWPQfSDECkQ7ihJmw9garw6wyk0RJmw0Fn7h+2KJmm+9M1nLuydZ+fEcg+bd8yGLnhLC
	U3miO60YB9brMnsi8mWloryL96PjXxItz9tEHubzk6ZsbTstkpblBcypawq8ySki6CMCBM
	HYa+dPFFz05fwV40uXEjZk+yHFncnJQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-LwBSc6OcMrGJXh8wePAP0A-1; Tue, 11 Jun 2024 09:21:36 -0400
X-MC-Unique: LwBSc6OcMrGJXh8wePAP0A-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-35f10585251so1700061f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jun 2024 06:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112095; x=1718716895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIL3WzHfFsP6BI60s8nCj0qGjt3OC3BNLgftYsOna64=;
        b=WwqKe6mXgbR+ps3OzBAdB3+CYBSp8ikH2ZeRM8lK3NEfGm6k/la3TW6XliK1iZayZH
         fhwvrrr8AGK9r7kUdsLTHlKez8vV07pUZtM1tc4o2YQNMGDdt2MrhDLnhgXkUJDGvK3x
         m1oS5S4Wm69vL9X5MGG25y6nxhF41x33jihir+I9IR/y3Pn1d7ssxJGxBgllS3eg1/WW
         B23Uc2CAIskPQR28O88yxpbdav7qOaDBDiK8ngiF/BmeAr3Zh7BwB5se956pvHeACJ1D
         Md5fyrykNl4EwbH78NcbyTj1rAE6dqm1JPds5wzzPX8QSUT2cj11WwWml3kZAgYlziHb
         GFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9ChiI87h7dkYnvXnFgcb2fBU/qBWdTFO6fbxUhASmwSqb6Tvm0KCvX/bF9eNhqI9uZdCx96tMDzlMDFvMm/QqsXtUKN41KqAfuj0OgG0=
X-Gm-Message-State: AOJu0YyMS9o41tky++vbBrBIstFhczSpxV+3tSok2RIqaQ6J/2lFWXJ+
	vfmgJ374udmjcokFMFocZNZWbBM+vhLJh4FE+EZbl3g1i9qQQOhorJvwgHZLJZV9a87hdQd9Ok1
	9LaeL/XnA49P0sN5mOxGs6A6GtzabedULGLri2epskTjj1jjeq5Y3DFxMwE/1N7zZ
X-Received: by 2002:a05:6000:1e92:b0:35f:2fd3:85c1 with SMTP id ffacd0b85a97d-35f2fd386f6mr603172f8f.12.1718112095110;
        Tue, 11 Jun 2024 06:21:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdrgyGSXnWsxnxLNMq9gvn3zIKYLzq6W4Ui2uJAaYYqihXeuvxSaXL/IXX8Ulu/RvLhy739g==
X-Received: by 2002:a05:6000:1e92:b0:35f:2fd3:85c1 with SMTP id ffacd0b85a97d-35f2fd386f6mr603148f8f.12.1718112094727;
        Tue, 11 Jun 2024 06:21:34 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1aa8d4f3sm8441598f8f.99.2024.06.11.06.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:21:34 -0700 (PDT)
Date: Tue, 11 Jun 2024 15:21:31 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, mcgrof@kernel.org,
	russell.h.weight@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, airlied@gmail.com, fujita.tomonori@gmail.com,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: add abstraction for struct device
Message-ID: <ZmhPW9yq7y6jbmIg@pollux>
References: <20240610180318.72152-1-dakr@redhat.com>
 <20240610180318.72152-2-dakr@redhat.com>
 <ZmdID8AlXtoxUfC1@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZmdID8AlXtoxUfC1@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 10, 2024 at 11:38:07AM -0700, Boqun Feng wrote:
> On Mon, Jun 10, 2024 at 08:02:27PM +0200, Danilo Krummrich wrote:
> [...]
> > +/// A reference-counted device.
> > +///
> > +/// This structure represents the Rust abstraction for a C `struct device`. This implementation
> > +/// abstracts the usage of an already existing C `struct device` within Rust code that we get
> > +/// passed from the C side.
> > +///
> > +/// An instance of this abstraction can be obtained temporarily or permanent.
> > +///
> > +/// A temporary one is bound to the lifetime of the C `struct device` pointer used for creation.
> > +/// A permanent instance is always reference-counted and hence not restricted by any lifetime
> > +/// boundaries.
> > +///
> > +/// For subsystems it is recommended to create a permanent instance to wrap into a subsystem
> > +/// specifc device structure (e.g. `pci::Device`). This is useful for passing it to drivers in
> > +/// `T::probe()`, such that a driver can store the `ARef<Device>` (equivalent to storing a
> > +/// `struct device` pointer in a C driver) for arbitrary purposes, e.g. allocating DMA coherent
> > +/// memory.
> > +///
> > +/// # Invariants
> > +///
> > +/// The pointer stored in `Self` is non-null and valid for the lifetime of the `ARef` instance. In
> > +/// particular, the `ARef` instance owns an increment on the underlying object’s reference count.
> > +#[repr(transparent)]
> > +pub struct Device(Opaque<bindings::device>);
> > +
> [...]
> > +
> > +// SAFETY: `Device` only holds a pointer to a C `struct device`, which is safe to be used from any
> > +// thread.
> > +unsafe impl Send for Device {}
> > +
> > +// SAFETY: `Device` only holds a pointer to a C `struct device`, references to which are safe to be
> > +// used from any thread.
> > +unsafe impl Sync for Device {}
> 
> These comments need some rework, `Device` is not a pointer to `struct
> device` anymore. For the `Sync` one, how about:

Indeed, I forgot to update them.

> 
> // SAFETY: `Device` can be shared among threads because all immutable
> // methods are protected by the synchronization in `struct device`.
> unsafe impl Sync for Device {}

Sounds good.

> 
> and for `Send`, I actually don't think we can easily say the generic
> `Device` is `Send`: you can create a `struct device` where `->release`
> requires to be run on the same thread that creates the `device`, and
> nothing is wrong about it, I think (e.g. making a thread be the sole

Hm, I guess in this case we actually can't argue that it's the owners fault to
pass a pointer of this device somewhere else. Since it's C the owner can't
enforce that someone else is not taking a reference and prevent sharing
ownership...

> owner of some special devices). Unless, in the #Invariants of `Device`,
> and the #safety of `from_ptr`, you mention that `Device` assume its
> `->release` can be called on any thread.

...hence, I agree we should indeed add to the #Invariants and #Safety section
that `->release` must be callable  from any thread.

However, this is just theory, do we actually have cases where `device::release`
is not allowed to be called from any thread? If so, this would be very confusing
for a reference counted type from a design point of view...

- Danilo

> 
> Regards,
> Boqun
> 
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index fbd91a48ff8b..dd1207f1a873 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -28,6 +28,7 @@
> >  
> >  pub mod alloc;
> >  mod build_assert;
> > +pub mod device;
> >  pub mod error;
> >  pub mod init;
> >  pub mod ioctl;
> > -- 
> > 2.45.1
> > 
> 

