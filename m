Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0ED3EE1DB
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773693738; cv=none; b=tJ3tFa4UnRfULb7HyQ4hmz/59o8u2li0oiZHZ1kbwipCOvW6WH8Ir9sYwTE0oVD0irQ6/mXLmPcsiKqUBq4ZF3GMCbZANyA+dvYG1B33/kMiVZ56ApFplwolk8rDs7TtkDBRVlPNU+KO88mq5/A6WaGJeq++84a+Pfo/tbN95mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773693738; c=relaxed/simple;
	bh=CHo0HhcuPLyhVcfKGsyM/rsfREQquBRPxyb94888fRw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HLJ0WTRUUB4XdFGuLgNJemt3z9OxWGkPtDSf/2VZ3bjaIlwrubqVF23vaa+bgg4D6gr7LDty/bMgm2umsnaGZGUfs0U1A0Xp3XQvWdAISEml0NfCviah13urQdhfiUW/EUaCWPosv8lJ8uF/qWLmdvIGEc862yBCgDyLHG1UPVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IZKRygHw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IZKRygHw"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4852fbfc379so71245435e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773693736; x=1774298536; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnehdcYWB9w3tVl2LzZNjtYNnm+PGYt8SHrexd0l+qg=;
        b=IZKRygHwNkYO2IrKq5TcXnPSOyyOsX97oYkNSPGln5crPfRYPN8+nUVZbwA9Ql95FO
         HBMUCVoWwOCzYW1mKKn3U9erh322djp1/JLAsNJa43QhEfzNu60UCfO8gnNb2Z57OeaA
         SSy8SOIdLgGnNU+pXcyLlDK6JS4KW2nDIiiazVWuXqh8K0kEia/MGBgIOyqO1wz0Cng0
         6ZW4C5aMi/JovM9B47EFcVyCtEZs/84DFC3dfczVibxwSsOnOZUgkm5Nt7m+Sr3wr72Y
         YcKk2b7Apn49BT3L1msprif2+FkNwUco1Ocz8Bqfl0bUpn9uwPECRvDtxZqyXBWwQ/1e
         1WsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773693736; x=1774298536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnehdcYWB9w3tVl2LzZNjtYNnm+PGYt8SHrexd0l+qg=;
        b=fH2oKEW+3njgojm0IzVf997RryZ7J0oZhbvFrzNro5aDSYRKjd4x5tirgRDZDPuvai
         milO/QlUXPka5xEnn3a3joVPo5PJZ5kTEKNPY2CA3eGZvc1Mi3nI6ZzaoTdkcBm3O/wV
         pOwLp3VaDiWCGOSOuNFEOTpldypiBRLL+9deGLq0bj37CCjrK+9gfgogfW+LShD+UVpT
         v4NM7y/Tr17mBO9F7Ki3AkZGlznEDT4hLhyOpO039ZdDcmsSaNeHgIon3wphnXLZcr/W
         jxa4Hv4ipJpI6VYkj/kh2hhceS2PfIZT6PiUcdmCa8t0OFHsfVqnY2RvJL31KHOtrsGW
         KxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyx18vbBcVhsJpCeBY7aELX4F6Wuv7SBGpvnQe8rl7ngP4RnAr3W4/HfLbu8eW5fCMBlURRqsPgeewK3NKjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3p5QsQZ0/CgI9i5fK6sD1zq6iNtz4RLjFZpwtG9l2atj1txzj
	u9h1Gbi1WhmylJ7RUdKEpG0VWXzzwTgJQPMhjA8U85FeKLH/6gToczUzqmKDXeEKJV1SZCP1sDM
	tIU0OWjwPeBPNwvl20g==
X-Received: from wmjy24.prod.google.com ([2002:a7b:cd98:0:b0:485:316c:34b4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1a:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-485566cfb00mr242140765e9.1.1773693735483;
 Mon, 16 Mar 2026 13:42:15 -0700 (PDT)
Date: Mon, 16 Mar 2026 20:42:14 +0000
In-Reply-To: <20260316055736.1690546-3-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com> <20260316055736.1690546-3-ttabi@nvidia.com>
Message-ID: <abhrJgPEiIRCvmwe@google.com>
Subject: Re: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	mmaurer@google.com, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, ecourtney@nvidia.com, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 16, 2026 at 12:57:32AM -0500, Timur Tabi wrote:
> Add UserSliceWriter::write_dma() to copy data from a CoherentAllocation<u8>
> to userspace. This provides a safe interface for copying DMA buffer
> contents to userspace without requiring callers to work with raw pointers.
> 
> Because write_dma() and write_slice() have common code, factor that code
> out into a helper function, write_raw().
> 
> The method handles bounds checking and offset calculation internally,
> wrapping the unsafe copy_to_user() call.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` points to a valid slice of `len` bytes (i.e., it is
> +    /// valid for reads of `len` bytes).

I don't know how I feel about this 'valid slice' thing. The memory might
be dma memory after all ... just say it's valid for reads of `len`
bytes.

After all, in below SAFETY: comments, you also argue that it's valid for
reads, not that it points at a valid slice.

> +    unsafe fn write_raw(&mut self, ptr: *const u8, len: usize) -> Result {
>          if len > self.length {
>              return Err(EFAULT);
>          }
> -        // SAFETY: `data_ptr` points into an immutable slice of length `len`, so we may read
> -        // that many bytes from it.
> -        let res = unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
> +        // SAFETY:
> +        // - `self.ptr` is a userspace pointer, and `len <= self.length` is checked above to
> +        //   ensure we don't exceed the caller-specified bounds.
> +        // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
> +        // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
> +        //   failure (e.g., bad address or unmapped memory).
> +        let res =
> +            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len) };

Points 1 and 3 in this bulleted list do not seem to address any actual
safety requirements of `copy_to_user`. Yes, the function validates
userspace addresses at runtime, and this is part of why its
implementation is safe, but it's not a precondition on the caller.
There's no way to call `copy_to_user` where it would not validate the
userspace address at runtime.

> +    /// Writes raw data to this user pointer from a DMA coherent allocation.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// * `data` - The DMA coherent allocation to copy from.
> +    /// * `offset` - The byte offset into `data` to start copying from.
> +    /// * `count` - The number of bytes to copy.

This is not the usual Rust style for documentation. We would generally
just write it in words:

	Copies `count` bytes from `alloc` starting from `offset` into
	this userspace slice.

Yes, argument lists are *occassionally* used, but it's rare.

> +    /// # Errors
> +    ///
> +    /// Returns [`EOVERFLOW`] if `offset + count` overflows.
> +    /// Returns [`ERANGE`] if `offset + count` exceeds the size of `data`, or `count` exceeds
> +    ///     the size of the user-space buffer.
> +    /// Returns [`EFAULT`] if the write happens on a bad address, or if the write goes out of
> +    ///     bounds of this [`UserSliceWriter`].

Using a list to format the possible errors seems sensible to me. But I
don't think you intended for this to be rendered like this in the final
docs:

	Returns `EOVERFLOW` if `offset + count` overflows. Returns
	`ERANGE` if `offset + count` exceeds the size of `data`, or
	`count` exceeds the size of the user-space buffer. Returns
	`EFAULT` if the write happens on a bad address, or if the
	write goes out of bounds of this `UserSliceWriter`.

Please use a markdown list to format this, and check the generated html
docs.

Alice
