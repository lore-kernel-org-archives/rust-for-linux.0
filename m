Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3A1DAC51
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Aug 2024 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722591650; cv=none; b=uWG/8G9sUPEqyGZ2QyteASDuiiuQeE2T0w33XWPSfylPJFOCrIVXKbgq73HWCaAFVEIl69mV+fxMr2H0Vho31B50TLwxgKA3lO94Uvp114TxNQB0c++me4Bz3T9IkOywk/nO0hT7BILgHM1BwD1KrZKMCGgkv6Pjv5N5ArBanCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722591650; c=relaxed/simple;
	bh=u+BQdwSK8imeK2KT1z1hjqymdfIaAYLVmkvghpNXsno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/s6qAny7TH/5hq8i0SSj5FOa+B5qkn1M34kbP3ZZVhmyLSoY2vbPcGGXt2g0nE2X0iUNjLYmYweUwv1/TXo4Qkslw6WrXjfX53ATG6Pv3/5jeHZ0Oq4YAS57Kw1GuMJhJZHDu6cZ1ii6l5SylMDaDDOea4StHqQDRdjet7jPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qXpxuY05; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qXpxuY05"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3687fb526b9so3872067f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Aug 2024 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722591646; x=1723196446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3cnmNQwU8pb9rtU5fDhbpatDtKkxxtawqVfHyOA0XM=;
        b=qXpxuY05QFs9Hk6/DGl6fSPx7CIWscO0nYqTwpR8h/649CCKfsUq+acCfwjgl884jH
         j4r8dPhmfeqwh/jRFpDGCw1pQNPGdNJL6z8BrmLPpgJLKH5k2KrTrV3NeZUil4PbAFzE
         p6pKYRK6/Q7NustmR9FNRVNKnWqz6oQ+Dji2QyI57vN1rhU8F/gPs3rp7j4RRzRQzA46
         nqHfu/teeXw/pw5tbYILCuJmWuk0C6qiM5DTiDKvBD/Nn4orLyeIGJxkSqXMXnAL7z0S
         kk6XhZquxlK3JjtnDPCTDtAUgQHxKUQePJ8OdJ5kc1bB9rscGYZgA093109eOcvCGuxH
         Wy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591646; x=1723196446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3cnmNQwU8pb9rtU5fDhbpatDtKkxxtawqVfHyOA0XM=;
        b=TSFqQDYSAnU8d0TFfMU3b4GxXIl6ZA6732AEYfiy23iivuCfTMnJEVFZ20eBULHOqm
         D2hNBVB4tH6jcClvqYYawgeA1ypCujKS3w6ua++PojmFd70QvStDkR2ofBK0UeiRnSxO
         uf5ds35qrKVgYRJuDUSbSkKhMwfZVBIH+H32PfT6efBsjhpHI7mejmhVVwykcFYI8GUQ
         uI/URDrNB42ODR6cGHyI0Ey0IP6SOWeUrzNPF8J/3Br7AaFaw9t4/7NKpxIKt6cwOWCQ
         sHShJ8CpsSOAMjgwH74Q08smVZhr21YURsCbX42MnjBsjeJkpjL7TDsfDTOIFM455ga8
         5cew==
X-Forwarded-Encrypted: i=1; AJvYcCUNyVdlex39IU6LrfeK5PKWiPHws552B9sKsdKbRivin4o0LJyIHdrEYdwJO7Ujlu9DHXtiAFcGtsR7Mzs/Kr0jeEBwmRrdTJeYU1PV5aE=
X-Gm-Message-State: AOJu0Yxy/+G5ioAqSw1EnuQeaP+NRxr6F87ByOgfy47A8VrF9Wgo02Hl
	dnAyj3kYfzlcxz+TJsc7OLq2ccWRpcIKTnvOi1hSKzjHC4MhmTb+Z+xYK21kvZap1HyuCHHDDgX
	MMj+YwCJGJNBzn0zAHmr9WeifzIFs5wlN96wBnBGzCIlEUUdtLdhH
X-Google-Smtp-Source: AGHT+IHM0pPYtPqBjGxEPDHbGbmOT0OVxMOnrmAq18Ps5yNxY4TkpjbzkRsvr91o1g46ECl3PRnOq2ueiV5z85Rov2I=
X-Received: by 2002:a5d:664c:0:b0:368:6650:fd16 with SMTP id
 ffacd0b85a97d-36bbc1bcea9mr1780954f8f.38.1722591645457; Fri, 02 Aug 2024
 02:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802-vma-v4-1-091a87058a43@google.com> <7f31fa8b-d788-4067-b296-9cdf23df65c7@proton.me>
In-Reply-To: <7f31fa8b-d788-4067-b296-9cdf23df65c7@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 Aug 2024 11:40:33 +0200
Message-ID: <CAH5fLggpERviqXQDBwPOqgMieXKOvoPi7xcq4JcO9DJ2ZFqDOQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: mm: add abstractions for mm_struct and vm_area_struct
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 11:39=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 02.08.24 09:38, Alice Ryhl wrote:
> > This is a follow-up to the page abstractions [1] that were recently
> > merged in 6.11. Rust Binder will need these abstractions to manipulate
> > the vma in its implementation of the mmap fop on the Binder file.
> >
> > This patch is based on Wedson's implementation on the old rust branch,
> > but has been changed significantly. All mistakes are Alice's.
> >
> > Link: https://lore.kernel.org/r/20240528-alice-mm-v7-4-78222c31b8f4@goo=
gle.com [1]
> > Co-developed-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> I have one nit below, with that fixed:
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
>
> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> > new file mode 100644
> > index 000000000000..ec8cadb09626
> > --- /dev/null
> > +++ b/rust/kernel/mm/virt.rs
> > @@ -0,0 +1,204 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Google LLC.
> > +
> > +//! Virtual memory.
> > +
> > +use crate::{
> > +    bindings,
> > +    error::{to_result, Result},
> > +    page::Page,
> > +    types::Opaque,
> > +};
> > +
> > +/// A wrapper for the kernel's `struct vm_area_struct`.
> > +///
> > +/// It represents an area of virtual memory.
> > +///
> > +/// # Invariants
> > +///
> > +/// * If the caller has shared access to this type, then they must hol=
d the mmap read lock.
> > +/// * If the caller has exclusive access to this type, then they must =
hold the mmap write lock.
> > +#[repr(transparent)]
> > +pub struct VmArea {
> > +    vma: Opaque<bindings::vm_area_struct>,
> > +}
> > +
> > +impl VmArea {
> > +    /// Access a virtual memory area given a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `vma` is valid for the duration of 'a=
, and that the mmap read lock
> > +    /// (or write lock) is held for at least the duration of 'a.
> > +    #[inline]
> > +    pub unsafe fn from_raw_vma<'a>(vma: *const bindings::vm_area_struc=
t) -> &'a Self {
>
> I think this also should be named `from_raw`.
>
> I took a look at your conversation with Christian Brauner and I
> personally don't see the benefit of `File::from_raw_file` over
> `File::from_raw`. To me it's clear that this function takes some raw C
> structure that represents a `File` and turns it into a `File`.
> In the situation where there are multiple ways of creating something
> from different C structs, I think we should include the name. But if
> there is only one possible struct, then the name should be `from_raw`.
>
> Do you think we should re-open that discussion/start a new one on a
> naming convention for this?

Oh, I actually intended to rename it here too. I just forgot that
VmArea also had a from_raw.

Alice
