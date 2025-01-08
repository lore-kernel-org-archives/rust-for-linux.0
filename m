Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840021F8906
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338885; cv=none; b=QHl7ZmunZpP+aNknwYg3CCeeQj4tzCQtz+ez3orPZ4Rw8oiVFoi1D+nrdjtxGpShENrtVuUeLo9H4ZHvThZ7Pv+qPcVQGtv7EKNiUcBzFKoFHxSvt8xY6Q32x4cYp2UGH3DpEm3dYDLRKqn9/ZDU9UDaFMrggGlhm3qHIp/E95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338885; c=relaxed/simple;
	bh=7vbuQMOCmE+0TzhK5aXnmIJ/BG7xNF7CfhplsOR9Ps8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9UNtDSjY9zhOBNSrFz0evfayQnhO6NdOc8tnpj6XBtcithnbJZNtQJG6HXTpqvduyT6aRQXZFnq1DWC+Jd1PxvHw6YtBxFVHuv1LzahAPkJh9ZUYrSAYlIPiWgdBG4AoMPxQpS2rgZ9/wSM0yzQMNyCtMQ11aFOmNRLUtzOHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0YKUHL6A; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0YKUHL6A"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so545479f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 04:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736338882; x=1736943682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xI2Qiim8gcdicwYWfir8MoYW/kVHDh3Rzufu5nMKjxY=;
        b=0YKUHL6ANcRiVZP7wqaG7EwGKX5uXIWiNCD2CzHRIdJ5MAhtRGIjV6Z0Xowl4R89iC
         4jsPEBi1ju318dZZUa/3qYdiuXYuB79FCOd7Im1XX/gCGZgsxmtThQNvPq25FfjBq38z
         33tRcPLX3XW5sfW6tjBymUSIjxK0EYzeU6C3lXqFSjFdvBMb5lTdAq28sY74Tl8ZWv0S
         GsnWx2TOIRQXuoIAiYSRGFDbyabPWUhiRjJN97MuNgTNVDVumc0w6cOIZ+ONaJoL0RML
         0OLt+nbg+D/zmU+XQR46ZEOCAWXdCOXk91evTjMj7F5o3Wxq47FzLJSrhDS8wqOiHxHo
         e1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736338882; x=1736943682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xI2Qiim8gcdicwYWfir8MoYW/kVHDh3Rzufu5nMKjxY=;
        b=H178U+4rdrqADsfec1mRHOBAkxKaUhpm3/kkEOFyMbr1+komLn5hE37AguyBNW6ick
         rnDOF9+vfTt/xl2Sd0YIN1HtUZmqFk95MWkv+LCtZ2bQZERU54/+C+QHzcnu46pcsXnJ
         OI+KvNx3DVuIn6tp/hxXN8Wn4GXu79pR7eGLea9OvijasS/r/Y4m7Hvjic0nBS+TQpyG
         q7oKqdClgKN/QBkToxEAj9JUaua0Fr4JkLYPkcJ4Mh5X161Xe9lZvtVhqe9bAbeHO5yA
         akG1niPtYiVqMN6DzrrJrQMJtuSYNyxNtQC4TgRBIxjPIWi/oAYQDmj0ak+5GngcWnBg
         Cecw==
X-Forwarded-Encrypted: i=1; AJvYcCXo6rhOk3p9dWAxDVM3StsLRrJh9vgC/4dkQnq7sRgOKPtHnBQnh+MIL65rDpZ7B/wX5FaG/M1xHN5o82NQ+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YykoTCdTkCBmoL2Y28t9onMd0mkmdOq3hXOfKrTMPKpVQPVYhhg
	l/fCRgaK5UlrrvjOoUT6/pJS5QWI0vAJBaRA3QggAKYYFl00Ihd/Ktp+K40BNC2ir9uHM83+f8j
	3AV1fuuSTAgk9CrRksxFIcmL9xCsbJUOAxa4K
X-Gm-Gg: ASbGncvDFPpmwD4L0JL4qXJUtmDcGw57FkXCihwzuLpBb2ZiwWjU+Lj/wxD3h3uF3gD
	Ef9CbgFR0iAKRxzkSFq/sidwbKhQfbc6GuQtPDk7N+Z7WxIpdOdlBffNqc/fEW5DstQHn
X-Google-Smtp-Source: AGHT+IHztojrzFSkFDAxKutyqCxZSmSFncOQRaBDo6xDYYMDtTeZFL+GYNfpCD1T8zBhKQ5iBqUzzDMNVBmrs6Rtz6Y=
X-Received: by 2002:a05:6000:1541:b0:385:fa30:4f87 with SMTP id
 ffacd0b85a97d-38a85ddc5bemr2800789f8f.0.1736338880225; Wed, 08 Jan 2025
 04:21:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <RiN4oxf3FtqzOa42iVF50yHiC7LgOLlBneneq5PqKrMSQTHph5qY1Vfm3lCY4BUyz_SqqRNWoibFUVuSfEPR3Q==@protonmail.internalid>
 <20241211-vma-v11-2-466640428fc3@google.com> <874j33ddxt.fsf@kernel.org>
In-Reply-To: <874j33ddxt.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 13:21:08 +0100
X-Gm-Features: AbW1kvat9FEGpb2nRkzTm_D0loLbXycItZanw6K__7X-P_mJksbydnGOPToUHeU
Message-ID: <CAH5fLgiS_=MiMcnyC2z8kXQW0Kpn36h6EaHs9g7Zaw85mLn2jA@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?Q?Bj=C3=B6rn?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
>
> Hi Alice,
>
> In general, can we avoid the `as _` casts? If not, could you elaborate
> why they are the right choice here, rather than `try_into`?

They're not fallible and will go away once we merge the patch that
makes integer types match better.

> Other comments inline below.
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > This adds a type called VmAreaRef which is used when referencing a vma
> > that you have read access to. Here, read access means that you hold
> > either the mmap read lock or the vma read lock (or stronger).
> >
> > Additionally, a vma_lookup method is added to the mmap read guard, whic=
h
> > enables you to obtain a &VmAreaRef in safe Rust code.
> >
> > This patch only provides a way to lock the mmap read lock, but a
> > follow-up patch also provides a way to just lock the vma read lock.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Reviewed-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers/mm.c      |   6 ++
> >  rust/kernel/mm.rs      |  21 ++++++
> >  rust/kernel/mm/virt.rs | 191 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 218 insertions(+)
> >
>
> [cut]
>
> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> > new file mode 100644
> > index 000000000000..68c763169cf0
> > --- /dev/null
> > +++ b/rust/kernel/mm/virt.rs
> > @@ -0,0 +1,191 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Google LLC.
> > +
> > +//! Virtual memory.
>
> Could you add a bit more context here?
>
> > +
> > +use crate::{bindings, mm::MmWithUser, types::Opaque};
> > +
> > +/// A wrapper for the kernel's `struct vm_area_struct` with read acces=
s.
> > +///
> > +/// It represents an area of virtual memory.
> > +///
> > +/// # Invariants
> > +///
> > +/// The caller must hold the mmap read lock or the vma read lock.
> > +#[repr(transparent)]
> > +pub struct VmAreaRef {
> > +    vma: Opaque<bindings::vm_area_struct>,
> > +}
> > +
> > +// Methods you can call when holding the mmap or vma read lock (or
> > strong). They must be usable no
>
> typo "strong".
>
> > +// matter what the vma flags are.
> > +impl VmAreaRef {
> > +    /// Access a virtual memory area given a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `vma` is valid for the duration of 'a=
, and that the mmap or vma
> > +    /// read lock (or stronger) is held for at least the duration of '=
a.
> > +    #[inline]
> > +    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -=
> &'a Self {
> > +        // SAFETY: The caller ensures that the invariants are satisfie=
d for the duration of 'a.
> > +        unsafe { &*vma.cast() }
> > +    }
> > +
> > +    /// Returns a raw pointer to this area.
> > +    #[inline]
> > +    pub fn as_ptr(&self) -> *mut bindings::vm_area_struct {
> > +        self.vma.get()
> > +    }
> > +
> > +    /// Access the underlying `mm_struct`.
> > +    #[inline]
> > +    pub fn mm(&self) -> &MmWithUser {
> > +        // SAFETY: By the type invariants, this `vm_area_struct` is va=
lid and we hold the mmap/vma
> > +        // read lock or stronger. This implies that the underlying mm =
has a non-zero value of
> > +        // `mm_users`.
> > +        unsafe { MmWithUser::from_raw((*self.as_ptr()).vm_mm) }
> > +    }
> > +
> > +    /// Returns the flags associated with the virtual memory area.
> > +    ///
> > +    /// The possible flags are a combination of the constants in [`fla=
gs`].
> > +    #[inline]
> > +    pub fn flags(&self) -> vm_flags_t {
> > +        // SAFETY: By the type invariants, the caller holds at least t=
he mmap read lock, so this
> > +        // access is not a data race.
> > +        unsafe { (*self.as_ptr()).__bindgen_anon_2.vm_flags as _ }
> > +    }
> > +
> > +    /// Returns the (inclusive) start address of the virtual memory ar=
ea.
> > +    #[inline]
> > +    pub fn start(&self) -> usize {
> > +        // SAFETY: By the type invariants, the caller holds at least t=
he mmap read lock, so this
> > +        // access is not a data race.
> > +        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm=
_start as _ }
> > +    }
> > +
> > +    /// Returns the (exclusive) end address of the virtual memory area=
.
> > +    #[inline]
> > +    pub fn end(&self) -> usize {
> > +        // SAFETY: By the type invariants, the caller holds at least t=
he mmap read lock, so this
> > +        // access is not a data race.
> > +        unsafe { (*self.as_ptr()).__bindgen_anon_1.__bindgen_anon_1.vm=
_end as _ }
> > +    }
> > +
> > +    /// Zap pages in the given page range.
> > +    ///
> > +    /// This clears page table mappings for the range at the leaf leve=
l, leaving all other page
> > +    /// tables intact,
>
> I don't fully understand this docstring. Is it correct that the function
> will unmap the address range given by `start` and `size`, _and_ free the
> pages used to hold the mappings at the leaf level of the page table?

If the vma owns a refcount on those pages, then the refcounts are dropped.

> > and freeing any memory referenced by the VMA in this range. That is,
> > +    /// anonymous memory is completely freed, file-backed memory has i=
ts reference count on page
> > +    /// cache folio's dropped, any dirty data will still be written ba=
ck to disk as usual.
> > +    #[inline]
> > +    pub fn zap_page_range_single(&self, address: usize, size: usize) {
>
>
> Best regards,
> Andreas Hindborg
>
>
