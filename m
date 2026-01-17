Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6E9548EE
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768656242; cv=none; b=I9iHIA2B9T36Jc9ATmWq2xf8tI5CXOdyAQWpr8Yie5Ba3VpD60jdG1BtRchwn762Maokz0JcZRWeRh8tuSrKAEVoy7TOHmdyZYcerTimuRq//xneKSLnpajX1YMbK8PGvCG4gFAovuenfJyYCHf8oGkUb27SwWE7VLIiJ/ohftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768656242; c=relaxed/simple;
	bh=DSMHF5eKLAizGkDCjH+lbmFgU1GQrIz9ne8+7ZQuy04=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qIM5Vgfuk0LScNeh7CXdZ5dCxIy8e8pWt2rWGVG2cFuJD8U/g926dIuLsFUnQ0cyE6nF+jpfjmjE8K8APEtq7JZlv8c44Rl/8t4Ey3qmY/gEW7r0jvuxyyG3PU+6wq/voOpYTtDsVab94bEjbBITAX6kbgQxU85exYm6nCeQRVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3D3EC07C; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3D3EC07C"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-431054c09e3so3096093f8f.0
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768656239; x=1769261039; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fP0C9/mdoawsiTgfKMSE2aqwxjrv7ADD8bBCZi3o7ok=;
        b=3D3EC07CY1GPrlNehhipmM78xVflDInHeJIO6B+4utZLvitHQSonzHChHXFS18ggPi
         Ik8VQE2wdl+oKCpK3jeVSmVgJIuyB1f1lx91ZmuoIl/d73V1UC5imn8reWJjD9OHL8bu
         +LxIIlzfNFtH3XD4MVO1v5EXifTAzkzttgxLQW1ytpQrgv7t1d8sx8JVMxndaGSqD0O/
         usnmuTGnl6p0m+NY2G4m+4PhQ3b58KP8L32DsNnl4v782RrVltJ+63qtWDklvsMtsBiP
         MpzWDYKUJ2mgMPZA5EbMwq5i9i24XPVfF/NPDHBvxfzgWx6MsBIJ8AEInuTdKvO5FwXI
         wNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768656239; x=1769261039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fP0C9/mdoawsiTgfKMSE2aqwxjrv7ADD8bBCZi3o7ok=;
        b=R6me/24/vbvjeR5vE7/NX6uBw3m+2TPpJcU5SCIGTeEeBbPFyGrjNPd4Jfizw4PbAm
         iWq9sMGznqFEIwPKPe+q9TvpTRJfuwHSR3ItGBPIj//d4e4AfEydE9+t5EGQEoYxTD+8
         jI9du7hbLLCDkcjMjsWUrNjdmwnGJFheHcnF7qsMTssQxaVewrchaCTzN0oydNDJsD3R
         TBgqLvU6OCS3Ryxif5rilHyvir/iVqSack5mhtWBm+9i+CtwiSUz6dggpYJkTJMiwddP
         LFfvVerlUkD3FD+U+6/D0ymq3PeYdjY6Oq/VH7T0gIYpP5AIkwPnujiBmHgMy604qEj+
         fe4A==
X-Forwarded-Encrypted: i=1; AJvYcCVM16kLr9lKUsnZsCtJ3cvAZ63rJlY49Ba4LcFxQUtpeBRvGPrGed0q70nhzblx7DIFgcarz6Fg4ldnRkN56g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6XpHIv7hlp6I2/JM9qAkCtfcg9AmaF6rqTF6kXq9BXIrZBun
	qU0MCbsQLq7j7O7O+r+4ggNFvsL8qUvBBl8FjISBCoV0vFhKuS/FdwaIapatrFcKJcKmgU9yhR7
	kRXzZCQ5upWw68AArGA==
X-Received: from wmbej6.prod.google.com ([2002:a05:600c:3e86:b0:47e:df88:7cfe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a1a:10b0:480:1f6b:d495 with SMTP id 5b1f17b1804b1-4801f6bd602mr49343665e9.32.1768656239044;
 Sat, 17 Jan 2026 05:23:59 -0800 (PST)
Date: Sat, 17 Jan 2026 13:23:57 +0000
In-Reply-To: <20260116214959.641032-4-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260116214959.641032-1-ttabi@nvidia.com> <20260116214959.641032-4-ttabi@nvidia.com>
Message-ID: <aWuNbUywGRH1zo-0@google.com>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add UserSliceWriter::write_buffer()
 for raw pointer writes
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
> Add a new method to UserSliceWriter that copies data from a raw kernel
> pointer to userspace, without requiring a Rust slice reference.
> 
> The method takes:
>   - data: raw pointer to the source buffer
>   - len: total size of the source buffer (for bounds checking)
>   - offset: byte offset into the source buffer to start copying from
>   - count: number of bytes to copy
> 
> The method is marked unsafe because the caller must ensure the pointer
> is valid for the specified length and that the memory is not mutated
> during the call.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..8bbb0084abb1 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
>          Ok(())
>      }
>  
> +    /// Writes raw data to this user pointer from a raw kernel pointer.
> +    ///
> +    /// This is similar to [`Self::write_slice`] but takes a raw pointer instead of a slice,
> +    /// along with a total buffer length, an offset into the that buffer, and a count of bytes
> +    /// to copy.
> +    ///
> +    /// Returns error if the offset+count exceeds the buffer size.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice
> +    /// even if it returns an error.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `data` must point to a valid memory region of at least `len` bytes that remains allocated
> +    ///   for the duration of this call.
> +    ///
> +    /// Note: Unlike [`Self::write_slice`], this method does not require exclusive access to the
> +    /// source memory. The memory may be concurrently modified by other threads or hardware (e.g.,
> +    /// DMA buffers). In such cases, the copied data may be inconsistent, but this does not cause
> +    /// undefined behavior.
> +    pub unsafe fn write_buffer(
> +        &mut self,
> +        data: *const u8,
> +        len: usize,
> +        offset: usize,
> +        count: usize,
> +    ) -> Result {

Why not this signature?

	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;

You can implement `write_slice` in terms of it.

Alice
