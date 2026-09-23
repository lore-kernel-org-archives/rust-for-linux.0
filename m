Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6333AFCF1
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152697; cv=none; b=OQH+ICMakp3l9pBhHsg659dXFjLEUXcuxCiKr3MCd3U2UZ1vUtfwySGjk1NdjuKgNKN2zx90s3hrliTYLyg/ei17fz/J2RuIgOOltpZVbndWkQEOdezF0DN3nkwglIArR23zCYmCG8YPAIbPT2kax2aLL8AAA2g3hVt9pkSDhTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152697; c=relaxed/simple;
	bh=S/auuJm0UMjhfFYs9rAptPbQY9NJImNXB0pxrGAXDow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iM9pIVob63i53ZbhWz8Zj2Jn2lgRBK6qG0KKSJZpecsICrHxtLJsM1pDShvNojQCeovymNCNXXT6Vy54xmbcix+4xslMxLuehNck1tieIYSjblEIVzSj/+D/LNdT8T7Lwp8zw0aZYbInhu4SydTLdX+4Dq8iB72SNf4r6LwWLZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a5J0YaIE; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a5J0YaIE"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fe3dee395so488795e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790152681; x=1790757481; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOQuxC7LVBVgFra/SLEL7xZErR13eeQQM4CHXuTiXLo=;
        b=a5J0YaIEgziHtFxUqO7RtXT+UXgkzWP6f6SDWKw2i3QRRnvufJ68c7DY+EFyES4GsL
         lQ7vcdQfc8b0tbDU5bxMiWNESNyAoflNkuLjSLsONkOTOaCwuIRVrfVe/J72igNU7/lm
         JoFkAa881fpiGF2rcOZaYob2oaAQe8q7PktE3SE/jLU5rZWdAZzvYm2aJXv6AXstrWRk
         Vij7V770YtShXfbwDgDZbRQw4N5xiITnRyRANSIl9pYok+UP4Twxevup17loLD5u1mcs
         lwuhP5oeHLHzz9zq9OQY9meWfiUpwa1vm7CX2Mpbr/3FKc7FO4ew2ppU6P3W/Kb3k8eV
         bvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152681; x=1790757481;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kOQuxC7LVBVgFra/SLEL7xZErR13eeQQM4CHXuTiXLo=;
        b=ZRcyhRblAUge8G6Z3gvbhoOEUpuUB5/+JNv6VPHwBAgB1Y/d3SisxLj0/i9i9zr1mH
         pfEGozfb703s94hVDGO4xqOJAdrEk+22Dlvzz2y9byMrwiHAENydipJKGqHTdVS8J23M
         oBAPkbYUCNUlGH/zgz7Pyl4QNwYDM+s/aKvwhR/IabIoIkwUZCHJKybvssmdu0mzl9rL
         +VOude+zfloqFBpxZtB+FswaHXolkNBvAWrM4y9WCS1Ur8+Dgrhkqk56ctyVOUZdUzCe
         g71uQlS6+hIQYRvMkoalLXOd12LcYvNB6TIu6PJEHOEjrFGXXkM+l8eGdog132EasiT0
         48yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvvUboD9qfkHzU9VebJidtwxHRDA6t+SDUq5X2zfGteHGSCIdA8LjeMscWbBJrPoU2Vm9LIbfzK9w/wmmxmg==@vger.kernel.org
X-Gm-Message-State: AFuF++knUBL8unvmQjBgr1y6eMQ8n3ZLBO63gxCDvm1aCxivJgJnh9Yx
	pw+B72r3yFwHZ7bdUleANs/QjtTwrSA2TsD9LVyEW6O46qhJDqi/HWj8PxN5V/KszTjuF+t453o
	E5qnbdWJOdUIK1GL6TA==
X-Received: from wmbb24.prod.google.com ([2002:a05:600c:5898:b0:49c:ed8f:b617])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1385:b0:49f:d6b2:4dfa with SMTP id 5b1f17b1804b1-49fdee0b74fmr19593985e9.4.1790152680354;
 Wed, 23 Sep 2026 01:38:00 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:37:58 +0000
In-Reply-To: <20260728-tyr-irq-v2-v6-2-15c90baed949@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-tyr-irq-v2-v6-0-15c90baed949@collabora.com> <20260728-tyr-irq-v2-v6-2-15c90baed949@collabora.com>
Message-ID: <arOP5iuLuj1aTiLl@google.com>
Subject: Re: [PATCH v6 2/2] drm/tyr: add Job IRQ handling
From: Alice Ryhl <aliceryhl@google.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	kernel@collabora.com, Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 27, 2026 at 10:01:11AM +0200, Laura Nao wrote:
> The Job IRQ reports requests from the CSF firmware, including global
> interface requests and CSG attention bits. Only the GLB bit is currently
> handled, as it will be used to check firmware readiness. CSG bits
> handling will be added at a later stage. The Job IRQ handler masks the
> interrupt in the primary IRQ handler, processes pending raw status in
> the threaded handler, clears the handled bits, and reenables the mask
> before returning.
> Add JobIrqEvents to hold the wait queue and the ready flag used to
> signal firmware readiness when the GLB bit is set, and JobIrqMaskGuard
> to ensure the Job IRQ is masked before its registration is freed.
> 
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/gpu/drm/tyr/fw.rs     |   1 +
>  drivers/gpu/drm/tyr/fw/irq.rs | 174 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tyr/irq.rs    |   1 -
>  3 files changed, 175 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
> index 47d25c901bd0..8162b9806c97 100644
> --- a/drivers/gpu/drm/tyr/fw.rs
> +++ b/drivers/gpu/drm/tyr/fw.rs
> @@ -69,6 +69,7 @@
>      vm::Vm, //
>  };
>  
> +pub(crate) mod irq;
>  mod parser;
>  
>  pub(super) const CSF_MCU_SHARED_REGION_START: u32 = 0x04000000;
> diff --git a/drivers/gpu/drm/tyr/fw/irq.rs b/drivers/gpu/drm/tyr/fw/irq.rs
> new file mode 100644
> index 000000000000..7dd894de18cb
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/fw/irq.rs
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +//! IRQ handling for the Job IRQ.
> +//!
> +//! The Job IRQ signals events from the MCU, including global interface acknowledgements.
> +#![allow(dead_code)]
> +
> +use kernel::{
> +    device::Bound, //
> +    io::Io,
> +    irq::ThreadedRegistration,
> +    new_waitqueue,
> +    platform,
> +    prelude::*,
> +    sync::{
> +        atomic::{
> +            ordering,
> +            Atomic, //
> +        },
> +        Arc,
> +        WaitQueue, //
> +    },
> +    time::{
> +        msecs_to_jiffies,
> +        Msecs, //
> +    },
> +};
> +
> +use crate::{
> +    driver::IoMem,
> +    irq::{
> +        TyrIrq,
> +        TyrIrqTrait, //
> +    },
> +    regs::job_control::{
> +        JOB_IRQ_CLEAR,
> +        JOB_IRQ_MASK,
> +        JOB_IRQ_RAWSTAT,
> +        JOB_IRQ_STATUS, //
> +    }, //
> +};
> +
> +/// The firmware events published by the Job IRQ handler, and the queue used to announce them.
> +#[pin_data]
> +pub(crate) struct JobIrqEvents {
> +    #[pin]
> +    wait: WaitQueue,
> +    /// Set once the firmware has signalled that the global interface is ready.
> +    ready: Atomic<bool>,
> +}
> +
> +impl JobIrqEvents {
> +    /// Creates a new, empty set of Job IRQ events.
> +    pub(crate) fn new() -> Result<Arc<Self>> {
> +        Arc::pin_init(
> +            pin_init!(JobIrqEvents {
> +                wait <- new_waitqueue!(),
> +                ready: Atomic::new(false),
> +            }),
> +            GFP_KERNEL,
> +        )
> +    }
> +
> +    /// Clears the firmware-ready state.
> +    pub(crate) fn clear_ready(&self) {
> +        self.ready.store(false, ordering::Relaxed);
> +    }
> +
> +    /// Waits until the firmware signals readiness via the GLB IRQ bit, or the timeout expires.
> +    pub(crate) fn wait_ready(&self, timeout_ms: Msecs) -> Result {
> +        self.wait.wait_event_timeout(
> +            || self.ready.load(ordering::Acquire),
> +            msecs_to_jiffies(timeout_ms),
> +        )?;
> +
> +        Ok(())
> +    }
> +
> +    /// Updates state and wakes up waiters
> +    fn signal(&self, status: u32) {
> +        // TODO: handle other Job IRQ events (e.g. CSG attention bits) here once
> +        // support for them is added.
> +
> +        // The GLB bit only signals firmware readiness once, at power up
> +        if JOB_IRQ_RAWSTAT::from_raw(status).glb() && !self.ready.load(ordering::Relaxed) {
> +            self.ready.store(true, ordering::Release);
> +        }
> +
> +        self.wait.wake_up_all();
> +    }
> +}
> +
> +// The Job IRQ, signalling requests or notification from the MCU.
> +pub(crate) struct JobIrq<'a> {
> +    /// GPU MMIO register mapping.
> +    iomem: Arc<IoMem<'a>>,
> +    /// Firmware events signalled by this IRQ.
> +    events: Arc<JobIrqEvents>,
> +}
> +
> +/// Guard that masks the Job IRQ when dropped.
> +///
> +/// To mask the Job IRQ before it is freed, this guard must be stored in a field declared
> +/// before the corresponding `ThreadedRegistration` in the struct that owns both. Since
> +/// struct fields are dropped in declaration order, this guarantees the Job IRQ is masked
> +/// first, and only then does `free_irq()` run and wait for any in-flight handler to
> +/// complete.
> +pub(crate) struct JobIrqMaskGuard<'a>(Arc<IoMem<'a>>);
> +
> +impl Drop for JobIrqMaskGuard<'_> {
> +    fn drop(&mut self) {
> +        self.0.write_reg(JOB_IRQ_MASK::zeroed());
> +    }
> +}

I agree with sashiko's review here.

This needs to happen after the free_irq() call in the destructor of
TyrIrq. And most likely, we need an atomic along the lines of ACTIVE /
PROCESSING / SUSPENDING in panthor_irq.

Alice
