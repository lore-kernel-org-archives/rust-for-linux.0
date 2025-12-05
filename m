Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1130101D
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764926499; cv=none; b=sL22TRVelfTnj38W0scClVQs/WC4Eb0+PhpbuZbNdxTW6qT9292nrTGeJRhC/JXIktvDfoDI0mqyXfrmREXjy+65A67SoFwjvYDtq5Hd3FAi8HvGaYM+T9w8UOuMrzbcMzghUHCcmFYrnBDtXBbX+x4NjlK8HCRChZRhT0iapGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764926499; c=relaxed/simple;
	bh=WeZL7gjH4qq3vpHT+XY7uk4tIfWGj2VCXghd33pYTF8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BSJytErU6EpFTR6d3buPAUQ+GD0oG9ayRUnAZ3j6Nx6F28p6KJlD1c/s7zUQTeY8ftMk+Esz0PhlIShC8q6zPj+cbWCeF3N0vlj4XeRU7vwkXab630fk16HNmcEX/WZCvJvMtDQ5hw5SKg8dIs1j77oZQW2iNsALO4IPgccOrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YTdoM6AE; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTdoM6AE"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b79fddf8e75so110020666b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 01:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764926488; x=1765531288; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kCOYvdjwvkQnAHYPxUoyYrt1O+kKhaIhM6Xm1u67lrY=;
        b=YTdoM6AEZDPgTikbNCirdP8qQaf+CdSF5zNvlMqVIBhIgvveNw6ZKyvqh8j45dQ7bd
         4iWyHqMcuOOvd+G+tZZs8jw0ERPEasqQhHd3SUQgI0qoVm38WoBygEl10ClZJDLGfpvt
         jueWQFRSSqmFJyV/S79+xzwNfuOtkDMbp7zs7qlEaPHxma9V7/iXSbIukyEJNO+mTQZN
         ZMQnjZAgEuo7/vunFUXq2XQuXo+5flSMh6rY1pRx8H/v1nJ1xvWlzNlwvG2xqxVxXswp
         eedl4uqxoRA8mOZ1Ze1gDyUZSQgZ2CeS2bm/WgjCzdjeb9Fv37e0ypIzoX4ihXvQFG44
         5IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764926488; x=1765531288;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCOYvdjwvkQnAHYPxUoyYrt1O+kKhaIhM6Xm1u67lrY=;
        b=Da4WTsOocjXwQ8Q/XdZcIrH0LxjgPvSbONXHjIXshv3P/TboJFdfMNxJ3LOr6BarXh
         BDM/yIcuPOWlgOoQD7DUvKJx2Hp0B/pLzq46+TRWBw1t0/KSHnvdanpxG0tJSdZAKgu4
         uDR82ylp9IEVFgVtwYHBxoMp044g7uP3kVUmo/2RW1wQ9gPbAcm6GrLi9LIHDGLMHCdZ
         qWks6BA/P43H0Ms12jpwBuSbG76aoJiwZpJ9CIefx1kiy0vNgJmbv8jRC+KRy4TFaMg8
         KQ1EYrQCymgEZukftGCnlGmCGolxtrM1dCkGylaDYhjfgALQJG4u2E/QRTOOF2VJXdzu
         MWJg==
X-Forwarded-Encrypted: i=1; AJvYcCUUTIp2o3JfBTnaJOEoe19TX8Kf0IULQMUxcBiDNIhWRwqf2ChoftOBNeAh1G8cbhgxprTtSw6FEpVicSVsgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJvqHOycxb2V7pSv2z8Qd5LgxWuGvI3GaxqUVUKTWfvh68BazI
	ZSrpgWhDUmGOiKy4f57+3RG5C045AfQYOQe6dp450E6qsSn3N2dftLFNK60XTJbhj2iQiAtEkyv
	ugPde8YsK0zP2K6L9mw==
X-Google-Smtp-Source: AGHT+IHR4I7raBUnNDRki4wuAoNR5Lc6mjXiesdj2YcHZTcCYu/OKId1WPlx5KkgauE4ovFpTHzk7wL6601wIHs=
X-Received: from ejcli3.prod.google.com ([2002:a17:907:1983:b0:b79:bc09:513])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7f16:b0:b40:6e13:1a7f with SMTP id a640c23a62f3a-b79dbea9b0dmr863339466b.27.1764926488736;
 Fri, 05 Dec 2025 01:21:28 -0800 (PST)
Date: Fri, 5 Dec 2025 09:21:27 +0000
In-Reply-To: <20251204160639.364936-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251204160639.364936-1-fujita.tomonori@gmail.com>
Message-ID: <aTKkF_hpmtf_VrAD@google.com>
Subject: Re: [PATCH v1] rust: Add some DMA helpers for architectures without CONFIG_HAS_DMA
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: dakr@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org, 
	abdiel.janulgue@gmail.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="utf-8"

On Fri, Dec 05, 2025 at 01:06:39AM +0900, FUJITA Tomonori wrote:
> Add dma_set_mask(), dma_set_coherent_mask(), dma_map_sgtable(), and
> dma_max_mapping_size() helpers to fix a build error when
> CONFIG_HAS_DMA is not enabled.
> 
> Note that when CONFIG_HAS_DMA is enabled, they are included in both
> bindings_generated.rs and bindings_helpers_generated.rs. The former
> takes precedence so behavior remains unchanged in that case.
> 
> This fixes the following build error on UML:
> 
> error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
>      --> /linux/rust/kernel/dma.rs:46:38
>       |
>    46 |         to_result(unsafe { bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
>       |                                      ^^^^^^^^^^^^ help: a function with a similar name exists: `xa_set_mark`
>       |
>      ::: /build/um/rust/bindings/bindings_generated.rs:24690:5
>       |
> 24690 |     pub fn xa_set_mark(arg1: *mut xarray, index: ffi::c_ulong, arg2: xa_mark_t);
>       |     ---------------------------------------------------------------------------- similarly named function `xa_set_mark` defined here
> 
> error[E0425]: cannot find function `dma_set_coherent_mask` in crate `bindings`
>      --> /linux/rust/kernel/dma.rs:63:38
>       |
>    63 |         to_result(unsafe { bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value()) })
>       |                                      ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_coherent_ok`
>       |
>      ::: /build/um/rust/bindings/bindings_generated.rs:52745:5
>       |
> 52745 |     pub fn dma_coherent_ok(dev: *mut device, phys: phys_addr_t, size: usize) -> bool_;
>       |     ---------------------------------------------------------------------------------- similarly named function `dma_coherent_ok` defined here
> 
> error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings`
>     --> /linux/rust/kernel/scatterlist.rs:212:23
>      |
>  212 |               bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr(), dir.into(), 0)
>      |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_unmap_sgtable`
>      |
>     ::: /build/um/rust/bindings/bindings_helpers_generated.rs:1351:5
>      |
> 1351 | /     pub fn dma_unmap_sgtable(
> 1352 | |         dev: *mut device,
> 1353 | |         sgt: *mut sg_table,
> 1354 | |         dir: dma_data_direction,
> 1355 | |         attrs: ffi::c_ulong,
> 1356 | |     );
>      | |______- similarly named function `dma_unmap_sgtable` defined here
> 
> error[E0425]: cannot find function `dma_max_mapping_size` in crate `bindings`
>    --> /linux/rust/kernel/scatterlist.rs:356:52
>     |
> 356 |         let max_segment = match unsafe { bindings::dma_max_mapping_size(dev.as_raw()) } {
>     |                                                    ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
> 
> error: aborting due to 4 previous errors
> 
> Fixes: 101d66828a4ee ("rust: dma: add DMA addressing capabilities")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

should this cc stable?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
