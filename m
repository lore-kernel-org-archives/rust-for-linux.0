Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05741FF5EF
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 13:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985358; cv=none; b=cIi/lbkGQ4LI9pI3sfp2RQcVGNnXnYZuGmgUepzM/Vgaw9dz9SEVch54Mab5jscDRg49FHvU6Fv3cIlI7o73801WcnJ2dmmZ8fxMqMSaabJqOaLkd88a8kdym2+rD9I/Q7KaZ4FDBe6UBf6ViSCvWWVcvAtsYUD7dJ9SOLHe+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985358; c=relaxed/simple;
	bh=6Nq3I3ITKZv0IXgcOLjXZuLwpx/EfYVFVeHWV7yUXEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=datFr5lpNhVAWvKcAHP8r7C6Iv4EnowALLoB0z7CWFwzgdverPtUQH1u9eJyht5DAU+nRh2Pr17Ojx/GqEzgJggtVofdzvgVQqsfNFROWg0IRl3dRYVfH5zH2YKulWbyoCS8z0FE/WGQyCDzroSGk5RGDcFMC/MQYUVXI+pQymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4y3VOPEG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4y3VOPEG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e06af753so2392858f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 05:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737985355; x=1738590155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiRgqKCmPUOuLqzynS79+3g8qS12Jbff6lOqEXSlZGM=;
        b=4y3VOPEGElXtyOGPwmdJqnoxsJRATwSK3SzZIb3h8CuCDAqd3eD+Jr8BsfcjQ38Z/Z
         DBSo9sxOQRMwCBnldmd0h/n+CxjGELTHnh08MTSqFv7ElcnTAYpMIKzvQwx0vuWYkrxR
         iEufGCCj6SiMeNZc5baJ8e4dv8if0ZscLSVNeU6ArryUCKKEM6M0dNwIdpIL0I4JeoP7
         JXPyJZBchKdLHiqeoZToPaFVwHGfbXcmrAooCj7FsMD7o1FBv4M+PC3v83RJVS7i6ATp
         UWFnZeRh7yry/sm+9hrWpLvBSJGCx/XGUOQl+Te7K7NhwnZKemluxVN0IC+LYAwhta07
         7EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985355; x=1738590155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yiRgqKCmPUOuLqzynS79+3g8qS12Jbff6lOqEXSlZGM=;
        b=OYxVCFT8NT3CpJNLRRkWYh57POo3E5z3o2nnntVWN3WYn4HktPJc1dxACMfRjEKEDt
         Y15A/TY8tGHpGuyv5AjSVhajU8qulHoykpmoyD1luLjALME/ZIovVMlP8D4fga8NTDV3
         KjAM4hsN2LqDQvmXxB8dKtVLS2iZquv1sN6Fbh1+x5L8Obpf1hTABclbQao1iwAFLqXm
         uvx4FlAQ8pldZASY27ZR2P1IRa7x3CU3EhDmvZqDbq3dowcceVoNxZn2nvudm69oUApD
         W7ekB+f4gWnmX5KUUU2XJFiokQ2rCCcOwX6KBkeQQMQiqNQltPZ32LILEvCISQy8GRjD
         LoJw==
X-Forwarded-Encrypted: i=1; AJvYcCXreTlD8nJS9qK3KEXtw/HolFO2lUz6fXDXx18jyTxx91j3aq1ASc7oH9x+0nDuAo8KNSZWML8C+MpBIn7efA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjjLug40NVqdrfUf+bWYWzJ92VL5fokx+Hnk6hTuR4RgQPasU
	l6OMZPpdFbbx03EcxW7dUyqkr4RdY518TmeTrlJBiIXOUZJ7465wJgtcUSNy3w38L0Io9Ilxasm
	8ms1Ujs/t6A0mBs4zRN4BXW+vdZsVpkNDQ3v2
X-Gm-Gg: ASbGnctvsLqKE9Xxl16RwOTz56IfBGHwPKyBN/kVpjgDbkJ5vmAessgghm4th1XYPpZ
	163tTLHeqzK3S1S+25PVcU1gjM68x8C9r7K8nT8sJArjK8LOXrjOfJkjan9WdP2sSbKH1n+L5bk
	3Dohr1MoV2vKtaw6sZ
X-Google-Smtp-Source: AGHT+IEDdRxzS7lECtfoCpXJHhVlK5dqs5kfhvGEGKfcBDzyrN4yu3hY7kXP7mKLvtkEgZHwRihj7dep3rkKlWCdiWY=
X-Received: by 2002:a5d:6d86:0:b0:38a:518d:97b with SMTP id
 ffacd0b85a97d-38bf564d0c7mr34827729f8f.11.1737985355145; Mon, 27 Jan 2025
 05:42:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123104333.1340512-1-abdiel.janulgue@gmail.com>
 <20250123104333.1340512-3-abdiel.janulgue@gmail.com> <CAH5fLgjL0aGGwkjEfXH08Jopwin1NfkLzp9vQWKcHPEum8jV4g@mail.gmail.com>
 <Z5dh6cSnNxwbefJX@pollux> <CAH5fLggMSiHZwHJ3md0eH7smyDNVL3L=Sre7F0SXSSnPrJiO-A@mail.gmail.com>
 <Z5d4lMlvA17M004C@pollux> <CAH5fLgiQcJcR+DYr7g3AfRPufAmM_4ZqHraGsYz7k1vU7=TZ-g@mail.gmail.com>
 <Z5eLXn2jo-r4WgGN@pollux>
In-Reply-To: <Z5eLXn2jo-r4WgGN@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 14:42:23 +0100
X-Gm-Features: AWEUYZmupmN4NNintStX_BjnDRmCPBi9oujsttUbNkR9bOBpGsEbFa2-gDK6oSA
Message-ID: <CAH5fLgiV3++zZ6xNOhy7Je+qQ7Lh2mo2C4erYTZhGWvZZ0mpFA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] rust: add dma coherent allocator abstraction.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 2:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon, Jan 27, 2025 at 02:25:03PM +0100, Alice Ryhl wrote:
> > On Mon, Jan 27, 2025 at 1:14=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Mon, Jan 27, 2025 at 11:43:39AM +0100, Alice Ryhl wrote:
> > > > On Mon, Jan 27, 2025 at 11:37=E2=80=AFAM Danilo Krummrich <dakr@ker=
nel.org> wrote:
> > > > >
> > > > > On Fri, Jan 24, 2025 at 08:27:36AM +0100, Alice Ryhl wrote:
> > > > > > On Thu, Jan 23, 2025 at 11:43=E2=80=AFAM Abdiel Janulgue
> > > > > > <abdiel.janulgue@gmail.com> wrote:
> > > > > > > +    /// Reads data from the region starting from `offset` as=
 a slice.
> > > > > > > +    /// `offset` and `count` are in units of `T`, not the nu=
mber of bytes.
> > > > > > > +    ///
> > > > > > > +    /// Due to the safety requirements of slice, the data re=
turned should be regarded by the
> > > > > > > +    /// caller as a snapshot of the region when this functio=
n is called, as the region could
> > > > > > > +    /// be modified by the device at anytime. For ringbuffer=
 type of r/w access or use-cases
> > > > > > > +    /// where the pointer to the live data is needed, `start=
_ptr()` or `start_ptr_mut()`
> > > > > > > +    /// could be used instead.
> > > > > > > +    ///
> > > > > > > +    /// # Safety
> > > > > > > +    ///
> > > > > > > +    /// Callers must ensure that no hardware operations that=
 involve the buffer are currently
> > > > > > > +    /// taking place while the returned slice is live.
> > > > > > > +    pub unsafe fn as_slice(&self, offset: usize, count: usiz=
e) -> Result<&[T]> {
> > > > > >
> > > > > > You were asked to rename this function because it returns a sli=
ce, but
> > > > > > I wonder if it's better to take an `&mut [T]` argument and to h=
ave
> > > > > > this function copy data into that argument. That way, we could =
make
> > > > > > the function itself safe. Perhaps the actual copy needs to be
> > > > > > volatile?
> > > > >
> > > > > Why do we consider the existing one unsafe?
> > > > >
> > > > > Surely, it's not desirable that the contents of the buffer are mo=
dified by the
> > > > > HW unexpectedly, but is this a concern in terms of Rust safety re=
quirements?
> > > > >
> > > > > And if so, how does this go away with the proposed approach?
> > > >
> > > > In Rust, it is undefined behavior if the value behind an immutable
> > > > reference changes (unless the type uses UnsafeCell / Opaque or
> > > > similar). That is, any two consecutive reads of the same immutable
> > > > reference must return the same byte value no matter what happened i=
n
> > > > between those reads.
> > >
> > > Undefined as in the sense of anything is allowed to happen?
> >
> > Yes.
> >
> > > I thought undefined
> > > as in you might still see the old value on two consecutive reads.
> >
> > That is the optimization that motivates this being UB, but it's
> > defined as full UB.
> >
> > > Do you have a pointer to the corresponding docs?
> >
> > Sure, it's on the "behavior considered undefined" page:
> > Moreover, the bytes pointed to by a shared reference, including
> > transitively through other references (both shared and mutable) and
> > Boxes, are immutable; transitivity includes those references stored in
> > fields of compound types.
> >
> > https://doc.rust-lang.org/reference/behavior-considered-undefined.html#=
r-undefined.immutable
> >
> > > > If we manually perform the read as a volatile read, then it is
> > > > arguably allowed for the value to be modified by the hardware while=
 we
> > > > read the value.
> > >
> > > From read_volatile() [1]: "In particular, a race between a read_volat=
ile and any
> > > write operation to the same location is undefined behavior."
> >
> > I mean, ultimately we are a bit on our own here. In C code you just
> > use an ordinary read / write, so we could use the ordinary
> > core::ptr::copy_nonoverlapping method to mirror that. We've been told
> > from the Rust project that we should just do these kinds of things
> > like we do in C - technically these things aren't okay in C either,
> > but because LLVM will try to avoid breaking patterns used in the
> > kernel, they shouldn't break in Rust either.
> >
> > But using an immutable reference should be avoided because that gives
> > LLVM optimization hints that we are not giving to LLVM in C code.
>
> Thanks for clarifying.
>
> I think we should add this as a note to the corresponding code.

As for whether it should be volatile or not, we should follow the
kernel's guidance in C code. I notice this sentence:

Pointers to data structures in coherent memory which might be modified
by I/O devices can, sometimes, legitimately be volatile. A ring buffer
used by a network adapter, where that adapter changes pointers to
indicate which descriptors have been processed, is an example of this
type of situation.
https://docs.kernel.org/process/volatile-considered-harmful.html

Alice
