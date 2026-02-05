Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9EC352942;
	Thu,  5 Feb 2026 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770286612; cv=none; b=s3Bye3Mf5OAXEedd86Y/A//Mpob4HbxLJ7Q/UpEFdtYGGuh7MYNWxOQ5PuR6Et26/6tPvQVf7sUec51sPXA7g/Enwun9WrXiyJtZ3JDA5plFOa0JJgV1KYKAoCMrE3PjQ73PDL3YCkXwAq/8/rIUEZ9Mlfy0mWNHSmHBUbJFpOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770286612; c=relaxed/simple;
	bh=l8h/PbGWTGwdFjdIFUZfnYw5NfbKYVIQJATv3Vq4Lic=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QTDSemvpxJK+f/fCMRBwDD2hnxXKSENqmpQkVcFzGEncu0r6tWBVcut7HB+Eb1qIxoDh2F+0QJzwYVWIICEU9xSFXkCeOJ2BYuHB58NpI4688pHrntoIGWHabqjM1WRNM6xhgygKpqoydfpF0cHo3d48AYbtOXVG27Am9h1sVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TaxY6A/3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TaxY6A/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770286610;
	bh=l8h/PbGWTGwdFjdIFUZfnYw5NfbKYVIQJATv3Vq4Lic=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TaxY6A/3WVAas5XoIHTWRYuthe+YRj7Rt7+53LU1C1JL3BotDfrfSS80El9W9MqUm
	 EHn35uVBnFbGN/KVHRgXSGw1y1rzi6NbZB2sgUa6xQa3zakDUMXiItZOX8EU4nSfTS
	 OZhBI2DHZaQ5iqV/fTGyHhJKhJp+9e6TyrBE76NW/VG6mv5blpclTyt0vDAKqYCHpb
	 vXG6EyPaLqaBZfKYWW4qhU7UO8Y50sw7rKw+uGAR8dK3NWSKsgNrdI5/p/OyeYUvHG
	 dRN3obaSPhXfVDAMtR0JLzRp4QeXxLr6Cy/lTkgaIRw3C2f2UtX0s32ipvd2tRAefG
	 6p57ts8Pqm0+A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA59A17E00A3;
	Thu,  5 Feb 2026 11:16:49 +0100 (CET)
Date: Thu, 5 Feb 2026 11:16:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary
 Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Message-ID: <20260205111635.5307e1fa@fedora>
In-Reply-To: <20260203081403.68733-4-phasta@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
	<20260203081403.68733-4-phasta@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Feb 2026 09:14:01 +0100
Philipp Stanner <phasta@kernel.org> wrote:

> +/// A synchronization primitive mainly for GPU drivers.
> +///
> +/// DmaFences are always reference counted. The typical use case is that one side registers
> +/// callbacks on the fence which will perform a certain action (such as queueing work) once the
> +/// other side signals the fence.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::{Arc, ArcBorrow, DmaFence, DmaFenceCtx, DmaFenceCb, DmaFenceCbFunc};
> +/// use core::sync::atomic::{self, AtomicBool};
> +///
> +/// static mut CHECKER: AtomicBool = AtomicBool::new(false);
> +///
> +/// struct CallbackData {
> +///     i: u32,
> +/// }
> +///
> +/// impl CallbackData {
> +///     fn new() -> Self {
> +///         Self { i: 9 }
> +///     }
> +/// }
> +///
> +/// impl DmaFenceCbFunc for CallbackData {
> +///     fn callback(cb: Pin<KBox<DmaFenceCb<Self>>>) where Self: Sized {
> +///         assert_eq!(cb.data.i, 9);
> +///         // SAFETY: Just to have an easy way for testing. This cannot race with the checker
> +///         // because the fence signalling callbacks are executed synchronously.
> +///         unsafe { CHECKER.store(true, atomic::Ordering::Relaxed); }
> +///     }
> +/// }
> +///
> +/// struct DriverData {
> +///     i: u32,
> +/// }
> +///
> +/// impl DriverData {
> +///     fn new() -> Self {
> +///         Self { i: 5 }
> +///     }
> +/// }
> +///
> +/// let data = DriverData::new();
> +/// let fctx = DmaFenceCtx::new()?;
> +///
> +/// let mut fence = fctx.as_arc_borrow().new_fence(data)?;
> +///
> +/// let cb_data = CallbackData::new();
> +/// fence.register_callback(cb_data);
> +/// // fence.begin_signalling();
> +/// fence.signal()?;
> +/// // Now check wehether the callback was actually executed.
> +/// // SAFETY: `fence.signal()` above works sequentially. We just check here whether the signalling
> +/// // actually did set the boolean correctly.
> +/// unsafe { assert_eq!(CHECKER.load(atomic::Ordering::Relaxed), true); }
> +///
> +/// Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct DmaFence<T> {
> +    /// The actual dma_fence passed to C.
> +    #[pin]
> +    inner: Opaque<bindings::dma_fence>,
> +    /// User data.
> +    #[pin]
> +    data: T,

A DmaFence is a cross-device synchronization mechanism that can (and
will) cross the driver boundary (one driver can wait on a fence emitted
by a different driver). As such, I don't think embedding a generic T in
the DmaFence and considering it's the object being passed around is
going to work, because, how can one driver know the T chosen by the
driver that created the fence? If you want to have some fence emitter
data attached to the DmaFence allocation, you'll need two kind of
objects:

- one that's type agnostic and on which you can do the callback
  registration/unregistration, signalling checks, and generally all
  type-agnostic operations. That's basically just a wrapper around a
  bindings::dma_fence implementing AlwaysRefCounted.
- one that has the extra data and fctx, with a way to transmute from a
  generic fence to a implementer specific one in case the driver wants
  to do something special when waiting on its own fences (check done
  with the fence ops in C, I don't know how that translates in rust)

> +    /// Marks whether the fence is currently in the signalling critical section.
> +    signalling: bool,
> +    /// A boolean needed for the C backend's lockdep guard.
> +    signalling_cookie: bool,
> +    /// A reference to the associated [`DmaFenceCtx`] so that it cannot be dropped while there are
> +    /// still fences around.
> +    fctx: Arc<DmaFenceCtx>,
> +}
