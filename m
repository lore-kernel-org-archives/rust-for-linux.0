Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4CC3D6F
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742159470; cv=none; b=b0YGjGmSNWy4VtIrvNthRnGZQMZ04jvyqWTp2fiBIunK2iWLOolkey++Sp5fNfen0zHvJTW4jffGuTBT2fB295V95AiznOC4dlFCal/kYQ7O38Mujj/k2SX4q9QY6f73qPCNG9Rt8f/7E2aAJVCNWbaDvD+lCiaFpZvNyuxBYRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742159470; c=relaxed/simple;
	bh=5oaLjtl5Qm4M+Mtamv6ntn/CJG+iDxYO+JAUMLwBtBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHOqbZmKtNtGh71+HUz/T4jyCb8GwqqFPfZnT7Y53y2G0DYqdbW81ciaTPnOjr5gYQPTCoyg6SlCWX4QVuS8Kv9x0oA/2zikWhAIrj5w9xdxbZL2N+xexNDcLrAur5xjeb92hqM1gJ1rzTRE+HVCOWQS0j5268A4oETECUIOUzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcSj7ahg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcSj7ahg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54996d30bfbso3391694e87.2
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 14:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742159467; x=1742764267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RN46pX56KDrV9VJcH/nEicvBVrtYgD35bZyWaZW/i4=;
        b=UcSj7ahgo/YmOwhvIr/guLZWwowQ4Ygq4oPl3fKA9WqXZQpkmaI2u/cHxItPyJfqfH
         CS2Pv7r2DQADuzsoY7SsGd/7zofx+N3hGhYMe/r41nK0EtGAz0Mkwpz8liYV091KAd3F
         cgjwcJRx+Az76vgZmsCmQpVLtipeKvT1BoSbgppwfakqOSXhZg48O7uyeI9Ph59cksZ+
         TZX4TQrrWAcJu+hLLykPApxQJBTqPCJC1xONNtpIWAR+vjP23VxeLDEK6JckLX5tm9SR
         TpS9oAN6bA7huqcbWX2HqGI8PaJfusd4gEDv6IjVOCTSjcaF+YWbpzALvwbFPaR2tmEG
         4w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742159467; x=1742764267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/RN46pX56KDrV9VJcH/nEicvBVrtYgD35bZyWaZW/i4=;
        b=rtt/q65MRy48+H1eJjjt7Z2Om8bAeAA/7WWSQ6x6U1COxx1T8zmnnyGu2LppX+hWLe
         ubu212WAY6DPmzkTgyn1QfrGD6QnodOgmeLPDOSRq6IrFJOmBAuOdgDGItFyCAainLUI
         o7LI4iN6+yoDOzOgbRd8NXIJCx3nujGvDmGzSrqAbhaXBVFIw8gAfzQsvlnY68wqn8V/
         a2x8N10xXSGBwezuK/revtsjOF2SfeaMXYAZ1B+zpSK1jvJzDvcY/V4rkgTN+d6IgG3V
         xJsPDpRqJ9Kdzr+dLS5ifjipKxduP/s/qsNDZB1vAU/hErNdyyPdFQzOPjxXpHzuCFGe
         OrJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOl3bGJ6MKUk+U9IAypS19Ok+WzL2O0HyatHM/yPzl5gUh/aJ43oRhgjqxBOA8HGznnPv10zAlUunD4yC1UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJDU7tO2trD9tXjQK9wAOMSNqpjWzv37ucJLeCLSWfuF+JWg6
	DKTBB35tP4Pvi3rbcNn6+qOwkAIc1NYTWtCmJZhfr/56Z6008MhZRd0e89rNvGQt43byKtfPgOG
	Hpt8D33rd3TXzIEf6lVWVv0Zt/t0=
X-Gm-Gg: ASbGnctKMae8twkF9BR7Aey3QLA8BM9O8eBNyK4b8kqSJaIg47xpf8fj1br5ni0LGl2
	ORYNg+pSmTyCPmvVT++mUG5WUQ4Db94d5lg2IMCNxz9zB+Sa5Ytv0wOz83lLNJiQK4a6CIwUyFB
	O1wodRFvXAk1qRqY6GZf3f8hwV0/Ou37gY7+UTff5m+aIJn2KQtYA5NRBEd69o
X-Google-Smtp-Source: AGHT+IG8MVmEldBZtgIES2vl9Yl6/XPxABzSv0Eu2GflMkmpdtDJwRXblvmGtsg1CKqrGF29T7eNksT2SpTu9uS85NI=
X-Received: by 2002:a05:6512:2823:b0:549:9143:4c5e with SMTP id
 2adb3069b0e04-549c38f5590mr4021447e87.11.1742159466755; Sun, 16 Mar 2025
 14:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D8HL95D099MI.2N779RERY6DAE@proton.me> <Z9bEosVk8-0sgSbw@pollux>
 <CAJ-ks9nxTkZJa9Okq7ztZTrFvaKd4ovw5SLd3c9q4Kye23RfNg@mail.gmail.com>
 <Z9bLtgJa3PNB0bkf@pollux> <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com>
 <Z9bWODCNNEq3xI51@pollux> <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux> <Z9ch0fgUI-V-rlGr@pollux> <CAJ-ks9=b-uMCLMMKT-9emgrrUXeaA50DBSEAWjSD+uHHZu-i9Q@mail.gmail.com>
 <Z9c6e8cbdFMTT6K0@pollux>
In-Reply-To: <Z9c6e8cbdFMTT6K0@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 16 Mar 2025 17:10:30 -0400
X-Gm-Features: AQ5f1Jq_V7KDuPfaiQ7ZuHAharWhe3-TC4EFGualPbPyPI0iOZYoNkWCxIU1Xd8
Message-ID: <CAJ-ks9=J1hsnFvKzAOwi918UiP49-mmSki=aH2dhiSr7WAqrPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 4:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun, Mar 16, 2025 at 03:30:27PM -0400, Tamir Duberstein wrote:
> > On Sun, Mar 16, 2025 at 3:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
> > > > But let's define it then; what about:
> > > >
> > > > "[`Vec::set_len`] takes (or kepps) ownership of all elements within=
 the range
> > > > [0; `new_len`] and abandons ownership of all values outside of this=
 range, if
> > > > any."
> > > >
> > > > The caller may take ownership of the abandoned elements."
> > > >
> > > > I'd argue that giving up ownership, while offering someone else to =
take it means
> > > > that it implies that otherwise we'll just end up forgetting about t=
he value.
> > >
> > > Btw. I'd still prefer if we could enforce that the caller has to docu=
ment what
> > > should happen to the abandoned value. But I acknowledge that the safe=
ty comment
> > > isn't the scope for it.
> > >
> > > It'd be great if e.g. clippy would give us a tool to do something ana=
logous to
> > > safety comments.
> > >
> > > It think it would be useful to enfoce some additional safety document=
ation. For
> > > instance, I think the kernel would much benefit if we could enforce t=
hat
> > > mem::forget() must be justified with a comment, since as mentioned in=
a previous
> > > mail, it can cause fatal bugs, for instance when used on lock guards.
> >
> > There are other examples; ManuallyDrop and Box::leak are two that
> > immediately come to mind.
> >
> > But focusing on Vec::set_len again, could we return a mut slice to the
> > tail when new_len < old_len? Something like:
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index c12844764671..e5f857d723ec 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -191,9 +191,16 @@ pub fn len(&self) -> usize {
> >      /// - If `new_len` is greater than `self.len`, all elements
> > within the interval
> >      ///   [`self.len`,`new_len`) must be initialized.
> >      #[inline]
> > -    pub unsafe fn set_len(&mut self, new_len: usize) {
> > +    pub unsafe fn set_len(&mut self, new_len: usize) -> &mut [T] {
> >          debug_assert!(new_len <=3D self.capacity());
> > -        self.len =3D new_len;
> > +        let old_len =3D core::mem::replace(&mut self.len, new_len);
> > +        match old_len.checked_sub(new_len) {
> > +            None =3D> &mut [],
> > +            Some(len) =3D> {
> > +                // SAFETY: ...
> > +                unsafe {
> > slice::from_raw_parts_mut(self.as_mut_ptr().add(new_len), len) }
> > +            }
> > +        }
> >      }
> >
> > Would that sufficiently communicate to the caller that they should
> > deal with this memory?
>
> I think that is a good idea. I'm not sure I like that this is useless whe=
n
> new_len > self.len, but it also doesn't hurt too much, I guess.
>
> Feel free to send the corresponding patch. Also, feel free to add the
> corresponding comment about ownership while at it.
>
> I'd just drop this patch then.

Looking at the usages of `set_len` that we have today (excluding the
pending nova patches for truncate and resize), they all amount to
`v.set_len(v.len() + n)`. What do you think about replacing this
method with `inc_len`? In the nova patches the only need for
decrementing the length would be in `truncate`, so `dec_len` can be
introduced there or the length can be decremented there directly.
