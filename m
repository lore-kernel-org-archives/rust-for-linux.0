Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0164346A08
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693667; cv=none; b=EKIymC1x1sBy1loD5dSZQN40LcmfU+6O3OvWOEvprSdLxaH267mbz2jRe8mzRX1776zXdY+02OUCkNFBZXWHdsXf/UKXtMAGnDOhg+z3inMfNEv22gAJo/oBccgDGa0EYt/YdF4AODPMDT4qoCHJkC1YvvSNg9PPhZD3U2g7EJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693667; c=relaxed/simple;
	bh=YEG54FXZqI/1KLY3tXJ7rHla6Je6lHhbzWeOJELuXSQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QzD3yvvvDAykDHzPQhEay9eo6g1qU8d981M5bhlQ5R9AJkAXlDnRNgGH9b/aZrpBJC8+TSx+iH3g8a3zCIT0gcmC0mivwLOm28Xmk54i3cLrWdFz4K/33LZO/IvfSjFbq+zWBJQdy1hIASG59folAl7W1B0+Rzi1o1JPFlDxcww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FgpB4sTx; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FgpB4sTx"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-698b899b53cso1153814a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783693664; x=1784298464; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZJxWnguOTe6CKBDsvGkeHPaaIWVYmyS6i3squ7Maq6Q=;
        b=FgpB4sTx4EcOFW2efrWjV4o5XoozoMEu5aYaM8CnLjVnvqm88yrRJYeF/y1/iZkrT7
         u2hDwwjcaAv39gh3fvCaESoFEEOxYGal5UhjnDVgldMluvXOaJt6na4I/5vgP/PQUpjN
         g5H5aZqP3bz6XpuK4wv7aCirQFPhefGBF0gUkmlRBc3BJoCsPxSRPTck2ptsbuqP/wtK
         ofeXERQQZOJgVHQf2N7V8xXsGE6UBFr45zNrZERLnGDoOWjXmytTOpvZuzCI7Jba+4qD
         utJEFWhZ1evYptfMthypXJnlqRdeVZsKOnbWQ1IDXEUnq/e/YAtlzNr/uIJbwrFOkSmW
         EZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693664; x=1784298464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJxWnguOTe6CKBDsvGkeHPaaIWVYmyS6i3squ7Maq6Q=;
        b=c42xZ9/nwnoGMVXGv1JkiXMpEmlmEmYLREEjQH+pws1FeG4YdEUqTb+VX4hl1LAeV4
         b6gWsEi2xTKDY8GunN3arfGuuP95iVprzQbKELx6oFLjL5TsWf4F1qTRDjbhXaZWEpko
         uiXoVYB9uMcSY87bfdfMOoX7n/Hvz3mbIb3IV+Su8I80k1NVWCDN5osvpJGI+t0Fxr2q
         NM3KPoTCajLSm3JAh3rIKbDHS/cQfSITYTXC34ix59TRwmjNiJPUQFIeivhOyUuOSfOI
         4f0UhDtSqtPT94ZV3WQjWNdm55or148kgnrtZPHfUBmiQ+2nUy5pQmwXr9rvn5gioVgq
         pgeA==
X-Forwarded-Encrypted: i=1; AHgh+RpmnLhxQRAEiEruVTVUh6vRzD1htu1uQ35xok8QErIhMm9BEMCjQXoMZTIhQwwRmJRxHTqgYjhQb5vcHqT1gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6jk60QB73iG41NJrcPTyWFRvcGM644bIB5HY2Pkcmii/jxTY
	5DIL2Qm7DoASefW8JCFBp9Q3o/6bZ4UOvqg0W+VO9bUvLp0EnsqcrmEb9rbyZUw2hRsG/EjQYGJ
	o2nu/gRl57fTg31ndnA==
X-Received: from edqi22.prod.google.com ([2002:aa7:c716:0:b0:698:c0bc:3a7f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1f0d:b0:698:663d:d7bd with SMTP id 4fb4d7f45d1cf-69ab446e0a8mr4806641a12.11.1783693663712;
 Fri, 10 Jul 2026 07:27:43 -0700 (PDT)
Date: Fri, 10 Jul 2026 14:27:42 +0000
In-Reply-To: <20260709-fw-boot-b4-v6-4-ca391e1a4108@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260709-fw-boot-b4-v6-0-ca391e1a4108@collabora.com> <20260709-fw-boot-b4-v6-4-ca391e1a4108@collabora.com>
Message-ID: <alEBXhTk2th3aENc@google.com>
Subject: Re: [PATCH v6 4/7] drm/tyr: add GPU virtual memory (VM) support
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	boris.brezillon@collabora.com, samitolvanen@google.com, acourbot@nvidia.com, 
	alvin.sun@linux.dev, laura.nao@collabora.com, work@onurozkan.dev, 
	beata.michalska@arm.com, steven.price@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 09, 2026 at 02:36:44PM -0700, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add GPU virtual address space management using the DRM GPUVM framework.
> Each virtual memory (VM) space is backed by ARM64 LPAE Stage 1 page tables
> and can be mapped into hardware address space (AS) slots for GPU execution.
> 
> The implementation provides memory isolation and virtual address
> allocation. VMs support mapping GEM buffer objects with configurable
> protection flags (readonly, noexec, uncached) and handle both 4KB and 2MB
> page sizes. A new_dummy_object() helper is provided to create a dummy GEM
> object for use as a GPUVM root.
> 
> The vm module integrates with the MMU for address space activation and
> provides map/unmap/remap operations with page table synchronization.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I'm seeing some build failures on 32-bit arm:

error[E0308]: mismatched types
   --> /home/runner/work/linux/linux/linux/drivers/gpu/drm/tyr/vm.rs:572:45
    |
572 |             let mut sgt_entry_length: u64 = sgt_entry.dma_len();
    |                                       ---   ^^^^^^^^^^^^^^^^^^^ expected `u64`, found `u32`
    |                                       |
    |                                       expected due to this
    |
help: you can convert a `u32` to a `u64`
    |
572 |             let mut sgt_entry_length: u64 = sgt_entry.dma_len().into();
    |                                                                +++++++

error[E0308]: mismatched types
   --> /home/runner/work/linux/linux/linux/drivers/gpu/drm/tyr/vm.rs:581:26
    |
581 |                 paddr += skip;
    |                          ^^^^ expected `u32`, found `u64`

error[E0277]: cannot add-assign `u64` to `u32`
   --> /home/runner/work/linux/linux/linux/drivers/gpu/drm/tyr/vm.rs:581:23
    |
581 |                 paddr += skip;
    |                       ^^ no implementation for `u32 += u64`
    |
    = help: the trait `core::ops::AddAssign<u64>` is not implemented for `u32`
help: `u32` implements trait `core::ops::AddAssign<Rhs>`
   --> /home/runner/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/internal_macros.rs:61:9
    |
 61 |           impl const $imp<&$u> for $t {
    |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::ops::AddAssign<&u32>`
    |
   ::: /home/runner/work/linux/linux/linux/rust/zerocopy/src/byteorder.rs:316:9
    |
316 |           impl<O: ByteOrder> core::ops::$trait_assign<$name<O>> for $native {
    |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::ops::AddAssign<zerocopy::byteorder::U32<O>>`
...
720 | / define_type!(
721 | |     A,
722 | |     "A 32-bit unsigned integer",
723 | |     U32,
...   |
735 | |     [U64, U128]
736 | | );
    | |_- in this macro invocation
    |
   ::: /home/runner/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/ops/arith.rs:786:9
    |
786 |           impl const AddAssign for $t {
    |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^ `core::ops::AddAssign`
  CC      drivers/base/firmware_loader/builtin/main.o
...
799 |   add_assign_impl! { usize u8 u16 u32 u64 u128 isize i8 i16 i32 i64 i128 f16 f32 f64 f128 }
    |   ----------------------------------------------------------------------------------------- in this macro invocation
    = note: this error originates in the macro `impl_ops_traits` which comes from the expansion of the macro `add_assign_impl` (in Nightly builds, run with -Z macro-backtrace for more info)

error[E0308]: mismatched types
   --> /home/runner/work/linux/linux/linux/drivers/gpu/drm/tyr/vm.rs:596:65
    |
596 |             let segment_mapped = match pt_map(context.pt, iova, paddr, len, prot) {
    |                                        ------                   ^^^^^ expected `u64`, found `u32`
    |                                        |
    |                                        arguments to this function are incorrect
    |
note: function defined here
   --> /home/runner/work/linux/linux/linux/drivers/gpu/drm/tyr/vm.rs:731:4
    |
731 | fn pt_map(
    |    ^^^^^^
...
734 |     paddr: u64,
    |     ----------
help: you can convert a `u32` to a `u64`
    |
596 |             let segment_mapped = match pt_map(context.pt, iova, paddr.into(), len, prot) {
    |                                                                      +++++++

  CC      net/core/tso.o
error: aborting due to 4 previous errors
