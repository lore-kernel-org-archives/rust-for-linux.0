Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611552F83B7
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 14:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512084; cv=none; b=R7YvCDeFYyzP7tyuOn3wC5uK5/lxUaxK4c4TrimD9J9rwwHUQ75eaAnvYiDLuFYM1+cwmGA6BCMjz+WxbYzlRJLeH2EGITzOgZIem8y2G8nYkbC1u3NAcriMeeOUmR16UeKUD8Rh/llB5eFljiydgnN20VCMXdDNlJ2YrqzJfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512084; c=relaxed/simple;
	bh=WWelOfQPCba99MBdckNCnnmErRgNizYsdHM0xeMgEuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OdKec4OXgcVy16c5XxOS+y/kuZBwXrKLeB0yzIsFo0BDQxNQmsuZLHALD4fC1h/RoooEuM1obJJ1tFub2B43p5oUGfPpDVlhdIE3jNPM/9xVoRzzG7vPV82uDqoGXvr1p27/YM+1sKae/gwnTCzGScskWqQdO8ZONwa0pDpAL2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MAl9XGKn; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MAl9XGKn"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836fbfa35cso6306855e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 06:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771512082; x=1772116882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TGMsbouB+cZggAg/zANDRLfVVNeSj2+9Ku1uvYNuqOw=;
        b=MAl9XGKnGX41bpGZL7rpQDq5AAsslTcuNMQ9JolSeALf2z0jYutViuteHr0DltQI54
         1WlSefs4Pz0SfCadEsVyDyL7QWpxskLO2qvm7kefowflLsdGArZ95m1BpL9QW9770+Nz
         hSoT10lxbL549keELYDQFxUGik6J4JIZs0RfZB6cQPfG4LpEu4NnqpPv+GdNhjGD0eV0
         Q6Yigej4hHG8ERglmeJP3zRjQ8XyN6FXKsmuXERycWfH8LzIoxhxI+nbiag58gzT+NEY
         +zSkT/SfPP/kNIgr5stCODLwNHfTULIrpQsSfQNGC7ToIcN9y213gCZTQqbs0+73jKGR
         hW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771512082; x=1772116882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGMsbouB+cZggAg/zANDRLfVVNeSj2+9Ku1uvYNuqOw=;
        b=tobilxF36RODT1CVW2mBc3/xlpusIxqjl2UAij7I1buku1P9EuTFUhTSMdFujBC/iO
         FjSQ/DrtSzdJEpn5SYXg6gWKUKEqQO5r4UU/EFcomUo2u9FSs9quPLVt3KAFky6LOBBy
         zgnhSNuHCQziTNNnkXbOeH62uqHVOk9+LNPAgRy+H4VClNFtahyq5z61e/WXjsHtakTO
         J5xULObo/IWJLfz854WUAMYBSl0IurTKnJgBcd2l0r0nkXa5Li9wFpzm80hyyQK59ewp
         JQzimbTngD71+Cs26m1QAN4fK9UhE/5mlxx+BbZmR3sYJntuTfSQi+MsunKo5JJKeJwI
         q8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjWWKgT776qIhTFR2lmweTiGFzJyiLzaMON7sN+eSU+Xbyga4irvRFX97x6AiSO4y2Je9H06EP6MntrKwjeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztrRrvypXLi4hIOY226lap8CDZxlC+ZKjkG/7M2KYyMIBjJKN7
	rKcPpEgm0FI+TwhV8efwMrVYWYbf7d4pmqCvE4NQW0JwSG4a59CaiTKLe4dhPUpTraMq9yjY2/0
	9M9wXeo2I/dj1tjJMWQ==
X-Received: from wmpj41.prod.google.com ([2002:a05:600c:48a9:b0:477:a678:a39a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c174:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-4839e66f689mr56234015e9.35.1771512081534;
 Thu, 19 Feb 2026 06:41:21 -0800 (PST)
Date: Thu, 19 Feb 2026 14:41:20 +0000
In-Reply-To: <DGJ0IL3LLZRW.3JC9RY1GDIJA6@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com> <DGJ0IL3LLZRW.3JC9RY1GDIJA6@kernel.org>
Message-ID: <aZchECrW8mPbZMq8@google.com>
Subject: Re: [PATCH v4 1/6] rust: drm: add base GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 19, 2026 at 03:36:20PM +0100, Danilo Krummrich wrote:
> On Fri Jan 30, 2026 at 3:24 PM CET, Alice Ryhl wrote:
> > +/// A DRM GPU VA manager.
> > +///
> > +/// This object is refcounted, but the "core" is only accessible using a special unique handle. The
> > +/// core consists of the `core` field and the GPUVM's interval tree.
> 
> I think this is still a bit confusing, I think we should just rename GpuVmCore
> to UniqueGpuVm and rewrite this to something like:
> 
> "The driver specific data of of `GpuVm` is only accessible through a
> [`UniqueGpuVm`], which guarantees exclusive access."

But it's not really the same as e.g. UniqueArc<_>, which implies that
there are no normal Arc<_>s whatsoever. This one is just a special ref,
but there may also be normal refs at the same time.

> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a Self {
> > +        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuVm<T>`. Caller ensures the
> > +        // pointer is valid for 'a.
> > +        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), Self, vm) }
> 
> I'd pull the Opaque::cast_from() call out of the unsafe block.

I think that's a bit verbose, and all existing uses do it inside the
`container_of!`.

> > +/// The manager for a GPUVM.
> 
> This description seems a bit odd. In the end, the trait makes GPUVM aware of
> other driver specific types. So, maybe a better name would be
> gpuvm::DriverAttributes, gpuvm::DriverTypes, gpuvm::DriverInfo or just
> gpuvm::Driver. My favorite is gpuvm::DriverInfo.
> 
> We should also change the doc-comment accordingly. Maybe somthing like: "This
> trait make the [`GpuVm`] aware of the other driver specific DRM types."

I mean, it doesn't just do that. The type implementing this is the type
stored in the `core` field, so you really do get more than just some
type relationships from it.

Alice

> > +pub trait DriverGpuVm: Sized {
> > +    /// Parent `Driver` for this object.
> > +    type Driver: drm::Driver<Object = Self::Object>;
> > +
> > +    /// The kind of GEM object stored in this GPUVM.
> > +    type Object: IntoGEMObject;
> > +}
