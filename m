Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316CE78F3A
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 14:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768659804; cv=none; b=KggWOUwxJATxPQ8Mum4bfNsqv/a2F2fB7L6WdV3MnnPVLWBtmkUdiSoXOkP8l0s1hxENXYfE/eRsweJ0YVAwVpBCHLhGUhFD2GS8fryYXk7McfKaKZByvRhOoRMNTxqCP+WARgoxF9z8qQftcoEMtAmr9requ6bhB2ukV3VhTQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768659804; c=relaxed/simple;
	bh=hwFy+Xj+aNPtgocIuwcKMs7980OO7I7rOEDovG/IHyI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WXHNQMvHeJdOuuDjvIORciPy/nsD6aaJaj2xw+trwGISPcdtzvt1DsOGiZrw1uziDLAQw5vRUNWXI361M7z61W02cRBB0MUYVOPYOI632gsr9MHhw5RIZ+8LEHZ/+Z4ZyywYlyn/OHE9hylNRzR4FngVb3iRkVSDq1QmfeyroQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pyHA8Q+6; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pyHA8Q+6"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b871e14de77so868507266b.2
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 06:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768659801; x=1769264601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtP5uzdWcGvvJD9r4XrRDlpVG1GSu8NNIFG2QNPypag=;
        b=pyHA8Q+64KZx/ah2aQPlD5oxvt9V48+yAz8EaaNLxRGpCc9cmWkG/i7EhFstft85uT
         2bWeuPDBbL2enGLIkZy7PKiAYuqd/p8L5rnthVer/yJYiiuCFBCIec4VK5OZ7FWer0+E
         r3cBUNtfXMmS3m7jheFw8grInZRLX1hBuYAfbOU+BcciFAj9qXbWoeW3eYHq91SbuoqX
         4VFwYicUqXPWLEkaEV5E/wtN3L3p4jd6MQXLUiI1ERIYQEvEcBQd2P+sepCXcc3l+n4e
         yn1uPK893Oh82wlO9oEvB7VZCLD1e3KqtAgHGSO5buUwicw5v5Ym+/OeX8ryeQ9BVtKz
         xAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768659801; x=1769264601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtP5uzdWcGvvJD9r4XrRDlpVG1GSu8NNIFG2QNPypag=;
        b=h9r0lD/xF/XU99ovi/gEVGLlxXvNN5LUhUh4DuKEe7U9lcCXKBCXGT2PirrVWYeiUP
         X2oD+GDty4CWmbxK3uQQr9N5VdjM7p+W9/MYKF6R6wyofA4NKtXOQ4Bhg3qcxcFl8uf3
         O0DUr/KjgMxk8IfGlOjYbQlUep2nw9gTjCN54iIAgX9k5FRZ7oEnyvRxTclJwSlRNxsS
         +mAon67zHHt5gw3z3W7zuIrKuKl+IuPA2zT33hMfyVqur6OhIxwxBT0t9txxet1csbeU
         lFAlQutWvAqDKipuyzHw1xua5HWGRZFDOQ7vZKBTIvJ5qdaCJGT77RpQ2dz2BOiLcgA0
         llIg==
X-Forwarded-Encrypted: i=1; AJvYcCVgH2gGAghWt6EwGxD+laeCJA1WNTgKIOWUKFucfq8fK9p6F3TMNCwiXFw0dC6NCoVvv9u5XH0Ml0racBWS8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGWsh+1IgdQT8zzJ33480DRQhQsQG+x91w6q1eFDu6ijv/TWq
	+KkYyF9SKOea2NDi8z2OgVuJ3HLRNvswcS903JcUij18pHIbNtq5gnZZ6RIVyfWx2bIUoIrYL3I
	ZG9NhiQyv+hhRj62zBA==
X-Received: from ejbot8.prod.google.com ([2002:a17:906:ccc8:b0:b87:1dc5:b346])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:786:b0:b87:12bc:24e7 with SMTP id a640c23a62f3a-b8793256e99mr598790466b.62.1768659801506;
 Sat, 17 Jan 2026 06:23:21 -0800 (PST)
Date: Sat, 17 Jan 2026 14:23:20 +0000
In-Reply-To: <aWuNbUywGRH1zo-0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260116214959.641032-1-ttabi@nvidia.com> <20260116214959.641032-4-ttabi@nvidia.com>
 <aWuNbUywGRH1zo-0@google.com>
Message-ID: <aWubWE4kstGI42P9@google.com>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add UserSliceWriter::write_buffer()
 for raw pointer writes
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Jan 17, 2026 at 01:23:57PM +0000, Alice Ryhl wrote:
> On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
> > Add a new method to UserSliceWriter that copies data from a raw kernel
> > pointer to userspace, without requiring a Rust slice reference.
> > 
> > The method takes:
> >   - data: raw pointer to the source buffer
> >   - len: total size of the source buffer (for bounds checking)
> >   - offset: byte offset into the source buffer to start copying from
> >   - count: number of bytes to copy
> > 
> > The method is marked unsafe because the caller must ensure the pointer
> > is valid for the specified length and that the memory is not mutated
> > during the call.
> > 
> > Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> > ---
> >  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index f989539a31b4..8bbb0084abb1 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
> >          Ok(())
> >      }
> >  
> > +    /// Writes raw data to this user pointer from a raw kernel pointer.
> > +    ///
> > +    /// This is similar to [`Self::write_slice`] but takes a raw pointer instead of a slice,
> > +    /// along with a total buffer length, an offset into the that buffer, and a count of bytes
> > +    /// to copy.
> > +    ///
> > +    /// Returns error if the offset+count exceeds the buffer size.
> > +    ///
> > +    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
> > +    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice
> > +    /// even if it returns an error.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// - `data` must point to a valid memory region of at least `len` bytes that remains allocated
> > +    ///   for the duration of this call.
> > +    ///
> > +    /// Note: Unlike [`Self::write_slice`], this method does not require exclusive access to the
> > +    /// source memory. The memory may be concurrently modified by other threads or hardware (e.g.,
> > +    /// DMA buffers). In such cases, the copied data may be inconsistent, but this does not cause
> > +    /// undefined behavior.
> > +    pub unsafe fn write_buffer(
> > +        &mut self,
> > +        data: *const u8,
> > +        len: usize,
> > +        offset: usize,
> > +        count: usize,
> > +    ) -> Result {
> 
> Why not this signature?
> 
> 	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;
> 
> You can implement `write_slice` in terms of it.

To clarify, I think this would be a simpler signature for
`write_buffer()`. And `write_raw_slice()` can be used both for DMA and
to simplify the existing `write_slice`.

Alice
