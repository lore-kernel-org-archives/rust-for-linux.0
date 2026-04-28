Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884B3F20EF
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 10:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373783; cv=none; b=CUWOl+GgJ3KtxEfkNkqa2XdkCOK2cTMshmeIvkvmwd0vcMEv8dpE84ea65R08uJVV1XddQbWXHrAmeo7CMXoWxwMgYqVstXvnPnFff9tOUf8bt3rX97WMfpCrj78r7D1uaYS6/1Sgz8h3VwLq3oRYiCMfNOnbqq6TxH2r6+S6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373783; c=relaxed/simple;
	bh=+4xL0STsZbfJdvR5pxm5h4wqvsMPSPOczXIaeoOQbjw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z+ES5quAdA5QPnreeh9UJm1D9GobsNDfVoGumIcyG4rurNrrN/U+jR4qQjYUwleoXPJPdu9KEdA7fHaxV46nF+VMEgW15Eqkfuwo7GiTFokZt7daC9ul5ODR3WeEDSaeb0eKr7kROOR412K2dYRZGb7MvW6mCsFqoPwqnWBuq2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tALQneQr; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tALQneQr"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48a55d82e0eso59128605e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777373779; x=1777978579; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=skvItkywmwm64idEbCIVWYyh8/nR+fu703k8dUmR+9k=;
        b=tALQneQrXJgf7AEYMVzAy9wT9n5Rq87L7ycL6A4fbLIOdMStaccFmdTE0GLyxD3cz/
         Tlf55IhTRZjnUKHmCYHTPFlbwLcuVPdBBRzAlfqUJXxMHe6EYdavK+6MhUR4fgzPRChb
         h/Txfwa5MFy0sscquOtvTzwdM35EhGjaD+gBgoE7QgArlQPu0z9aY9A7yFxleE7yljAT
         o72yA66Ef75o8clLmuSdS6MRp/mEE0y7ouwwDf9QXnCJ8QKi0YPuUQbU0xSX4Vxy+HIs
         OHGS6mrk/dq41XOd5Dxrs0vGbQqQhnQWeIdzl0GcRzEaM+n04l+CAnUfDKUvFszDp1N3
         EtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777373779; x=1777978579;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skvItkywmwm64idEbCIVWYyh8/nR+fu703k8dUmR+9k=;
        b=r9kYL8yTEJlNlnzoZQCqH2uHxLV5DMCaVP+JZbIysEebK31NLW3ZN50UUbI9LL15BF
         Tlsz9Lh9hvKatgAJ8ebweEU2MDWbydfB3DTC3Jf4WUJFM+19HfxbBhovVOCBSDF3N7Sh
         P/eEAgYTwPPcqnDQ9tPIb9Ic4kPwgwLD5GrIEHDMYkRo/FlcWBbhhPTd2vzDQXJUfOn5
         QAQzqoIG7KiqUusv/qBEStXshut8FsqrokoNpA7keaZ/MYBLv1JcaSN8zzvhhvzbunrq
         AKTe+4uyRsNRjG1S5APA9+VKs/xTDYABnlueatb8Px6chh6gu2kdQNg4wvLxT/3nyEXq
         qCwA==
X-Forwarded-Encrypted: i=1; AFNElJ++ruNGOUXxxUQWAnA60bDFzR3gkbcEENsU2t5bTIc8dUOC1/wnwiMDUTLDtlwdO5QILZufkQLKoi4N5Wnx8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+f9A6yqGIMFZwjQ80qT/sGNrxEIjC6EUrxvCVqrHYHVs+pRT
	PWbZlg27w6YiFbOTGS7qSaTaPiq9rlajPDCCCWTh2gshRKg8xfcJHwKt3tZt6/4VKyLlztw6gY/
	X2Q9ePcuT0+47asAuJg==
X-Received: from wmbz10.prod.google.com ([2002:a05:600c:c08a:b0:488:c127:b938])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c5:b0:488:c744:49b with SMTP id 5b1f17b1804b1-48a77aed600mr40391315e9.7.1777373778671;
 Tue, 28 Apr 2026 03:56:18 -0700 (PDT)
Date: Tue, 28 Apr 2026 10:56:17 +0000
In-Reply-To: <20260427100704.02190859@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com> <20260427100704.02190859@fedora>
Message-ID: <afCSUYIbV2ibZuOM@google.com>
Subject: Re: [PATCH v4 00/20] drm/tyr: firmware loading and MCU boot support
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
	work@onurozkan.dev, alvin.sun@linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 27, 2026 at 10:07:04AM +0200, Boris Brezillon wrote:
> On Fri, 24 Apr 2026 16:38:54 -0700
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > This series adds firmware loading and MCU boot support to the Tyr DRM
> > driver. It includes:
> >  - A parser for the Mali CSF firmware binary format
> >  - A kernel-managed BO type (KernelBo) for internal driver allocations
> >  - GPU virtual memory (VM) integration using drm_gpuvm
> >  - An MMU module and a generic slot manager
> >  - Shmem-backed GEM support for Tyr
> >  - Loading firmware, VM activation, and MCU boot at probe()
> >  - Initialization of Command Stream Frontend (CSF) firmware interfaces
> > 
> > Dependencies:
> >  - [PATCH v12 0/5] Rust bindings for gem shmem
> >     https://lore.kernel.org/rust-for-linux/20260421235346.672794-1-lyude@redhat.com
> > 
> >  - [PATCH v6 0/5] Rust GPUVM immediate mode
> >     https://lore.kernel.org/rust-for-linux/20260409-gpuvm-rust-v6-0-b16e6ada7261@google.com/
> > 
> >  - [PATCH v6 0/5] Introduce DeviceContext
> >     https://lore.kernel.org/rust-for-linux/20260320233645.950190-1-lyude@redhat.com/
> > 
> >  - [PATCH v5 0/6] drm/tyr: Use register! macro
> >     https://lore.kernel.org/rust-for-linux/20260409-b4-tyr-use-register-macro-v5-v5-0-8abfff8a0204@collabora.com/
> > 
> > Other Prerequisites:
> >  This series also depends on additional prerequisite fixes not included in
> >  this posting. The full stack (base + prerequisites + this series) is
> >  available here:
> >   https://gitlab.freedesktop.org/dbrouwer/linux/-/tree/dbrouwer/fw-boot
> >     
> >   Development history / discussion:
> >    https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/56
> >     
> > 
> > ---
> > Changes in v4:
> >  New commits:
> >   - drm/tyr: program CSF global interface
> >   - rust: time: add arch_timer_get_rate wrapper
> >   - drm/tyr: add CSF firmware interface support
> >   - drm/tyr: validate presence of CSF shared section
> >   - drm/tyr: wait for global interface readiness
> >   - drm/tyr: add Job IRQ handling
> >   - drm/tyr: add Wait type for GPU events
> > 
> >  The existing commits from v3 remain unchanged.
> >  - Link to v3: https://lore.kernel.org/r/20260413-b4-fw-boot-v3-v3-0-b422f3c03885@collabora.com
> >     
> > Changes in v3:
> >  New commits:
> >   - drm/tyr: remove unused device from platform data
> >   - drm/tyr: use shmem GEM object type in TyrDrmDriver
> >     
> >  drm/tyr: select required dependencies in Kconfig
> >   - Rename commit since the dependencies are not limited to DRM.
> >   - Select new RUST_DRM_GEM_SHMEM_HELPER instead of DRM_GEM_SHMEM_HELPER.
> >     
> >  drm/tyr: set DMA mask using GPU physical address
> >   - Use register macro to read pa_bits instead of separate helper function.
> >     
> >  drm/tyr: add MMU module
> >   - Switch MMU code to typed register APIs (TRANSCFG, MEMATTR, STATUS, LOCKADDR, etc.).
> >   - Use MmuCommand enum for MMU commands instead of raw constants.
> >   - Minor cleanups and renaming (MAX_AS, AS_PRESENT handling).
> >     
> >  drm/tyr: add GPU virtual memory module
> >   - Extract VA/PA bits via typed MMU_FEATURES register.
> >   - Update the VM code to match the new GPUVM v6 and shmem GEM v10 APIs.
> >     
> >  drm/tyr: add a kernel buffer object
> >   - Reject zero-sized KernelBo allocations up front.
> >     
> >  drm/tyr: add firmware loading and MCU boot support
> >   - Use typed GPU control registers.
> >   - Pass iomem by Arc into Firmware::new() since we store it eventually.
> >     
> >   - Link to v2: https://lore.kernel.org/rust-for-linux/20260302232500.244489-1-deborah.brouwer@collabora.com/
> >     
> > Changes in v2:
> >  - The whole series is rebased on drm-rust-next including v7.0-rc1.
> >  - Each patch has its own changelog.
> >     
> >  Link to v1: https://lore.kernel.org/rust-for-linux/20260212013713.304343-1-deborah.brouwer@collabora.com/
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > 
> > ---
> > Alvin Sun (1):
> >       drm/tyr: use shmem GEM object type in TyrDrmDriver
> > 
> > Beata Michalska (1):
> >       drm/tyr: set DMA mask using GPU physical address
> > 
> > Boris Brezillon (5):
> >       drm/tyr: select required dependencies in Kconfig
> >       drm/tyr: rename TyrObject to BoData
> >       drm/tyr: Add generic slot manager
> >       drm/tyr: add MMU module
> >       drm/tyr: add GPU virtual memory module
> > 
> > Daniel Almeida (1):
> >       drm/tyr: add parser for firmware binary
> > 
> > Deborah Brouwer (12):
> >       drm/tyr: remove unused device from platform data
> >       drm/tyr: move clock cleanup into Clocks Drop impl
> >       drm/tyr: add shmem backing for GEM objects
> >       drm/tyr: add a kernel buffer object
> >       drm/tyr: add firmware loading and MCU boot support
> >       drm/tyr: add Wait type for GPU events
> >       drm/tyr: add Job IRQ handling
> >       drm/tyr: wait for global interface readiness
> >       drm/tyr: validate presence of CSF shared section
> >       drm/tyr: add CSF firmware interface support
> >       rust: time: add arch_timer_get_rate wrapper
> >       drm/tyr: program CSF global interface
> 
> This series starts to be quite big, and it seems new features have been
> added to v4 (interactions with the FW). I'd recommend that we extract
> the uncontroversial bits (I'd say patch 1-2, 4-7) or have them applied
> to drm-rust-next right away. I know it's tempting to add features
> between revisions, but the more you do that the longer it will take to
> get the foundation merged.

How about I pick up patches 1, 3, 4, 5, 6, 7 for drm-rust-next now?

Otherwise yeah I agree it's better to split up work and have multiple
series that depend on each other, because then I can just pick up whole
series on their own as they reach a finished state.

Alice
