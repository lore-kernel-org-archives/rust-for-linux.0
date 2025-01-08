Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E831A239D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339035; cv=none; b=fg+6+t67sKABv/huh6XDBefRbSj8napM29h8CiparkOr1fUUFgqOFZdydpwQJSkQokzusVBWefI2TkVaOw5p5sMYzgdqn/eUannefg9lRWui1Jkg2rrXbLiyDojYRTmeTjxJn9jESq9K9Pf6gLYIkKwXotSTlJn8bErSVnGnWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339035; c=relaxed/simple;
	bh=W+Ky88IoaecQHkU7rupS3RunY0vlqE024Hbqd+/fLYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQ/MgQnzygikafoSfJ5m349Il5fFHkNmmt69+V7kWlkzi7n6vvfU4EL8nJyFLn076dVdEGBaIRZ12gAQhOevlspjTQLzmno5AjoTLpCDFjRsp3l4FOOkmyWftfBYDEOPMbjmtshUViBK9GN4WJRhZ3C8cg7NSrRMd7JpYvk61TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RPct9S9i; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RPct9S9i"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361815b96cso111599835e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 04:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736339032; x=1736943832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=391Sv7NU5fh3eearmQN4bqLVD5+Y91N5nHLhoILJSRM=;
        b=RPct9S9iocqgkYecst6zoFAfryaH3AraAnrD+VScVctV4d+TKYeQVvSKi/knvhgbro
         dtywRAGWmmgRKCy87KB6yobJ28Y6qG7znb9jTBw4GXxymNlM2khCQrR6ITCqWqPaCjHE
         Q0yEchkyCJLlwKcnxkQZFL8gyXXrstUXUrNwXwtpGEB6SEXXz1nrlHIXAHy/weB1Ema9
         PwOSya0NFe8MCr/lGzuOhux0euUOA0BfJ0N2EvviUNT28IyAfLCV/7lMq8MDfXw6Hsyc
         11pA9+pcHG3aP11Zrnn9f/kXiNB8i8rSS/txQvGSIxZ8IDFFeCJ3PARiqv/nap4KV/xR
         E5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339032; x=1736943832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=391Sv7NU5fh3eearmQN4bqLVD5+Y91N5nHLhoILJSRM=;
        b=PUQ8/ZFCbZlzVUOxj9QBwXFBD4G4ykHTxj/0aNsKwH9FI7SVvlOGy/O2TkYYrtgA5z
         Sr4RVtK5qMpNXi+PJ14nuBnA3xfh0xXRTU7ZJLv8NCPn/sfCfDOIwtXiPKFkdeKTVE41
         Z31D8AYTca1jWebWFJi+CeHLCKFZihl5xfUwCxS5uOfK0SytpPECiCquFUrlpY6uLTVE
         05kKlV3o5cyNhCPq1PzSj1p/GUIDoGWPsN6bv7/p4ehdooldAheRG7xsUoFAxzmN7WEK
         4kNlnJh5bmY2QnwRaBX7kdh2yNyQfXW7YSLbA0E4GUhu47hBXD8bu4UCKKoIPtqzM2T3
         En7g==
X-Forwarded-Encrypted: i=1; AJvYcCVRmGpE7lfHowA4dY+kcWpMH2M7in9yPoSefJHQnFJlH1FMX6Y0KoCYknpkLrUs/afj7SkqWmydQZkZ/FhiMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNaZx/05QaOLhe3IM2/hdEVhV3BzzAtOG/dvtFyY/AvrvjND2
	EW0eZuXhO3hz+zieS3ivTZLxGAscFG5sd+1XYnkaH2Ims22e7JD2nwQmaETYYdQV0bCB3Wx77aY
	xmfImmf2JW4WOjoruOoWaNpl4do591XnbhnHD
X-Gm-Gg: ASbGncvPVHIsgnUomvcxCoTomwRG08TjOphifLUGqiUUQESHZ2Gekq+q6n1x+Cktwsn
	t/8WVDI8MRmAcaoKkR29Z8vjzEjOHVkGE33Elbkzc6cg32aWAFb46gRU4sq7150wiGwRb
X-Google-Smtp-Source: AGHT+IGkXEElDjqDXb7Yk2cSaX6czWL9OyEK2paIcAgYnvOLqGHSufIDf15wb86btJ20CU+W2pjlWna+iCbq1cDXEyQ=
X-Received: by 2002:a05:600c:4755:b0:434:ff25:1988 with SMTP id
 5b1f17b1804b1-436e27011f1mr18413995e9.32.1736339031650; Wed, 08 Jan 2025
 04:23:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <f8bp5f3T5_3_0LpabBpwjSarzhZTp1CbAvcTBI6lHlaKpPAAFiofsNI2iJxK9kuXwnqvTkky9uvpS0rqRpa_RA==@protonmail.internalid>
 <20241211-vma-v11-6-466640428fc3@google.com> <87o71bagpf.fsf@kernel.org>
In-Reply-To: <87o71bagpf.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 13:23:40 +0100
X-Gm-Features: AbW1kvZkAzYdBePaHK2AvZ_ZrK6Ypria93aLgo0EpVBoywEftdJ0OdK8Ra4frQA
Message-ID: <CAH5fLgh8g3d+v-am=VRdExZug6hTJf-3CWPoxxYCZLpyiXnKdg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > This type will be used when setting up a new vma in an f_ops->mmap()
> > hook. Using a separate type from VmAreaRef allows us to have a separate
> > set of operations that you are only able to use during the mmap() hook.
> > For example, the VM_MIXEDMAP flag must not be changed after the initial
> > setup that happens during the f_ops->mmap() hook.
> >
> > To avoid setting invalid flag values, the methods for clearing
> > VM_MAYWRITE and similar involve a check of VM_WRITE, and return an erro=
r
> > if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
> > the return value results in a compilation error because the `Result`
> > type is marked #[must_use].
> >
> > For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
> > we add a VM_PFNMAP method, we will need some way to prevent you from
> > setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Reviewed-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/mm/virt.rs | 181 +++++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 180 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> > index 3a23854e14f4..6d9ba56d4f95 100644
> > --- a/rust/kernel/mm/virt.rs
> > +++ b/rust/kernel/mm/virt.rs
> > @@ -6,7 +6,7 @@
> >
> >  use crate::{
> >      bindings,
> > -    error::{to_result, Result},
> > +    error::{code::EINVAL, to_result, Result},
> >      mm::MmWithUser,
> >      page::Page,
> >      types::Opaque,
> > @@ -171,6 +171,185 @@ pub fn vm_insert_page(&self, address: usize, page=
: &Page) -> Result {
> >      }
> >  }
> >
> > +/// A builder for setting up a vma in an `f_ops->mmap()` hook.
>
> Reading this line, I would expect to be able to chain update methods as
> in `Builder::new().prop_a().prop_b().build()`. Could/should this type
> accommodate a proper builder pattern? Or is "builder" not the right word
> to use here?

You cannot create values of this type yourself. Only the C
infrastructure can do so.

What would you call it if not "builder"?

Alice
