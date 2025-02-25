Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C04918C91F
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 16:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500727; cv=none; b=lLloMHF5Du4bVt3jp+wFbLVH9KT0MdsL3Q3h4ee+JGDd8ryecxOKhhADTimAFf6hwYHd0IgNMaX3Mb6pDB0KhKPjGRH45pdrmSXbpoldPDBArnB+bs+Ofc+4IIgF68E3trPOG1iSI/KOvPWN/cB7Rqk8qqZk9+AiqPk5278QDms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500727; c=relaxed/simple;
	bh=JKe3mTg9NjACJAebdmc0vAEZvPQt6d7vSJJ/iXEv0qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCbgcAPo7l5/OEpAvI6zjDDS6+Xx8cpHRAIM2/9b6AdA3GKq1BA6488WVSQkIvqW67STYChPyEHQ/6jVPAby+vN0ehyl8BlF59gxZgkr5b2vFE7tXagyCbJd51MQSuDUHrG8BUUXfIeFGW1CqPAqO6raRgHoopydGW1NXg1VwYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mszWsEjE; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mszWsEjE"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so3062146f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740500723; x=1741105523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLxFWJr5SBm2uwG1aose8lFaFsHP1M9jCT6EPEpJIsU=;
        b=mszWsEjEUHt0Oopifc7O0MeWBCZMyQvnCof/YJGaTqYYo1gvpz+EaHpgt9WYshhhj3
         vckQ7lyUodrzHY4aVQxdrGRui3XT6fylwgKtFq1YjLo4tjlfQxTTOJ3+bbWKFRnrqj8W
         OeKImyXyIpIHaYC5JKZD3htGN63ts37cHWtRN6JHE2RY5wcE+5WwkE5w0vHLbQ0ZZiU+
         565l4xii7WQNCCDAiPg5J9hoWU8zUNVcsTGCsdVPbfwksTBoaB+Y+xJPbE/XNuTY2M4U
         u5F8nOkP/UF2zSaTeDSBEUxHAY/bSa2+0cagx60nxWBSmpYCPhj41Vkr1NPfuKW9Immc
         jkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500723; x=1741105523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLxFWJr5SBm2uwG1aose8lFaFsHP1M9jCT6EPEpJIsU=;
        b=MhSKm4yHbulNVQNze1T/r/0aqljLY17SDUqBh8gTMfNSB7NdpwuhBESI8T2GVy+SyQ
         PrPbIS71cKnfdtb940E9V31O7CX2ogDjIzLNLNwY7Etj6O5hgGo97ZUvqV51FwmI5PWz
         zILILxexilNeIW+m/G0xrcnSLsWXfA46AN6Ib6/mz/mFDQcEFL/FmtveQUrWv/t8I7Fr
         bvsIW+2hAAT0tpCD8Le1HbzykpuxFK974k2BElGwgpD6V5qmD3cParLerzdZ6rQ2GoDB
         qpHNkLMzMQrgx+4kPul8J9c+6fyS4X8pA34aA3yk7nCQ7GSW43oaBDwx1dr4CGUCUq3k
         V4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaq6tFbpdYIFsSdA0fOKWh/9wrebX/KFYVY/OI3hIaylQpcAp+Y9jxUopfD7bdY/gEBEnOzzYHmqrwKipYtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymCrL2dcgi1Eatn+otoI6igouDh/3bFcio4+Ew/JprPeNCPRc8
	sMUpurF1oZ5vtHxv7Qu1+IZunQT5DxLWKtDPN6NFJDaFvvfPegcNW//G9jSgvB6YKu+BxYtSODg
	Ibd/kAj8ofRW7Ca1SNqRBRHydIy/Nm0UKPnsT
X-Gm-Gg: ASbGncuG3bIiZk9zM9kTAjbZ6amv5bwBOxIqFYcsjUepF4bPIAqOMAGJBn4SXNndW+8
	e4sG6nSjIUfSTLFw9L+1I64MdGFasnsMwF41DnnBFMoJsEHEQPrOy5bX+QraLHx6XjppMTqAY2V
	weUmtmVOAI4U3wPoNvd99xDK2c7fT3gm5uns6++w==
X-Google-Smtp-Source: AGHT+IEL/VAlIzC/72gt6UlPgqwmOgVfnvRRlHIzH2wOPjqxna9GiiQv4vbpSwWWRe3ewdVZoSIlBFaXfkrlmy6v6H0=
X-Received: by 2002:a05:6000:154a:b0:38f:4251:5971 with SMTP id
 ffacd0b85a97d-38f6e753b0bmr14003071f8f.6.1740500723345; Tue, 25 Feb 2025
 08:25:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-vma-v14-0-b29c47ab21f5@google.com> <20250213-vma-v14-6-b29c47ab21f5@google.com>
 <20250225162400.37187f22@eugeo>
In-Reply-To: <20250225162400.37187f22@eugeo>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 17:25:11 +0100
X-Gm-Features: AQ5f1JoEC3x9WNKgVd-On0faB1EZd0DxKFqSTrzCe8bV0fCShAQBPXTzoaNz4yc
Message-ID: <CAH5fLgh-OKgpom+F30xON3hmiWzS_g-BqK0r9mdVoQdGZoO0ag@mail.gmail.com>
Subject: Re: [PATCH v14 6/8] mm: rust: add VmaNew for f_ops->mmap()
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 5:24=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu, 13 Feb 2025 11:04:05 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > This type will be used when setting up a new vma in an f_ops->mmap()
> > hook. Using a separate type from VmaRef allows us to have a separate se=
t
> > of operations that you are only able to use during the mmap() hook. For
> > example, the VM_MIXEDMAP flag must not be changed after the initial
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
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: Jann Horn <jannh@google.com>
> > Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/mm/virt.rs | 186 +++++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 185 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> > index 3e2eabcc2145..31803674aecc 100644
> > --- a/rust/kernel/mm/virt.rs
> > +++ b/rust/kernel/mm/virt.rs
> > @@ -16,7 +16,7 @@
> >
> >  use crate::{
> >      bindings,
> > -    error::{to_result, Result},
> > +    error::{code::EINVAL, to_result, Result},
> >      mm::MmWithUser,
> >      page::Page,
> >      types::Opaque,
> > @@ -198,6 +198,190 @@ pub fn vm_insert_page(&self, address: usize, page=
: &Page) -> Result {
> >      }
> >  }
> >
> > +/// A configuration object for setting up a VMA in an `f_ops->mmap()` =
hook.
> > +///
> > +/// The `f_ops->mmap()` hook is called when a new VMA is being created=
, and the hook is able to
> > +/// configure the VMA in various ways to fit the driver that owns it. =
Using `VmaNew` indicates that
> > +/// you are allowed to perform operations on the VMA that can only be =
performed before the VMA is
> > +/// fully initialized.
> > +///
> > +/// # Invariants
> > +///
> > +/// For the duration of 'a, the referenced vma must be undergoing init=
ialization in an
> > +/// `f_ops->mmap()` hook.
> > +pub struct VmaNew {
> > +    vma: VmaRef,
> > +}
> > +
> > +// Make all `VmaRef` methods available on `VmaNew`.
>
> Are there operations that can't be performed when VMA is still being
> setup? If so, using typestate might be more preferrable to Deref.

I don't think so.

> > +impl Deref for VmaNew {
> > +    type Target =3D VmaRef;
> > +
> > +    #[inline]
> > +    fn deref(&self) -> &VmaRef {
> > +        &self.vma
> > +    }
> > +}
> > +
> > +impl VmaNew {
> > +    /// Access a virtual memory area given a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `vma` is undergoing initial vma setup=
 for the duration of 'a.
> > +    #[inline]
> > +    pub unsafe fn from_raw<'a>(vma: *mut bindings::vm_area_struct) -> =
&'a Self {
> > +        // SAFETY: The caller ensures that the invariants are satisfie=
d for the duration of 'a.
> > +        unsafe { &*vma.cast() }
> > +    }
> > +
> > +    /// Internal method for updating the vma flags.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// This must not be used to set the flags to an invalid value.
> > +    #[inline]
> > +    unsafe fn update_flags(&self, set: vm_flags_t, unset: vm_flags_t) =
{
> > +        let mut flags =3D self.flags();
> > +        flags |=3D set;
> > +        flags &=3D !unset;
> > +
> > +        // SAFETY: This is not a data race: the vma is undergoing init=
ial setup, so it's not yet
>
> It is possible to make this API `&mut self` then?

No because of pinning. And taking `self: Pin<&mut Self>` is obnoxious.

> > +        // shared. Additionally, `VmaNew` is `!Sync`, so it cannot be =
used to write in parallel.
> > +        // The caller promises that this does not set the flags to an =
invalid value.
>
> Does `VmaRef` has to be `!Sync`? I wonder if we should explicitly mark
> `VmaNew` as `!Sync` so this is more explicitly correct.

See above.

Alice
