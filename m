Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833F9372B2B
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359317; cv=pass; b=HpybW5rIJ9fuLY9HgVQR93frWWDkOFYsBBuAvmcCtBcw+1ZZW103EZBsssOQQl6EvTFTcHuRCgqnuHOgqEA81FevbbH8rHlL0FPkU3adxapMlLFPbyrmp8ddKNtuZQwA++Io1nKQ4u3mEqBBx4PKx/oMQxbe8d+VPxu89OZaduo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359317; c=relaxed/simple;
	bh=N5ehEfbNmaxsIIR8T/bjRK1FaxAJ8SmNoujSELJvGq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZl4HN8yUW7FJt7sZg+0IO7Flq9pZmG1Ard6VVJJGcr2J36eFqPbk0xmAg5ZDs36R0quk5VmFMbclUXwmG7suNWxtA5rirSN0lr+cq5fojstwhbH56pT3cKambrQlLLOzQ77nAKYw3/UihGseUc2NXXiYwi0uYgrcmpDmHGG/j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tI5Dth2d; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tI5Dth2d"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-436356740e6so5463470f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771359315; cv=none;
        d=google.com; s=arc-20240605;
        b=b9KaqxXXUu5Ja3R9zeQshhQXwr0DwX0X7vHKJNU5zb9GK5TsNBTuxdv4+s9AY0T5Z6
         rzPioLWVsk3ynktCPXyYK1cI/36kyv7Kw/r0yXk/iWzybvUB+hYsPSgaEzPXdzFP4FIs
         OD5j3f80HIwhZ/TXiR1qZ3cmpGrZJuL26MFysYgfH7aNIFW5XPrzwktyep/+OBYwnDgf
         6FRrPsU9aTUFEcdX8fTpLY6erIU1m7C0YeYMPAp3tmGOjAPG+SlcvFkaW1ZZ59in/DU8
         xU6NVG69+2RY7KHxIX99YKrd9ZS957O680WmRinwWSL1ifn/6ADS+QPs8VQD2QtLNvfo
         v9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9zMl2Yu1W1bveqwK3ZOC1P/exlFIcqbtGooOQsCvJX8=;
        fh=8aPSOB3PMlSVwKcBd77A/M7tzezuKkiH88jmWbfsASU=;
        b=X/nxYzghRIqKDrYIKCOeYx6MwlEEGu94Blc5OeZsJMEaC0GGxESLnWAK2RO3zS+aEM
         2iEDYDhRFRqHMnBjg0lvF/++7wMbHZEYKAeqdxpY2sOiCQ6TLYyVBE2pMg1ldPIuBvrd
         QDGsoUL8BZ+yo+JJJR1lM4cmM91ZapdBJ8bOpmIKiIIUmEjr5+YNAHnDgcLEQ+uBL2BS
         6+X9TcggVnhFgK5eXRakMI8aV9aBHF4fJLCZ13DCEZoYr9Q/UIDJDJAAcA6wyx1hMTFY
         cRB4S8UFuMkgb0/4029JuDSsCP2HngsKlp8jLHexh2qxaNUQZ9mMAot8DGqF6xUd25wS
         mzVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771359315; x=1771964115; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zMl2Yu1W1bveqwK3ZOC1P/exlFIcqbtGooOQsCvJX8=;
        b=tI5Dth2dSriFi3vgPTwoUYG39+oTsDv/HNXmkm+d0EOf8WvNbv/Qyn0hft/bRnM8fe
         20IMUA8ZezN68hFN8NVJ1ruzv8lBM+lkcT2wCt2bCwiUZXV5hCaQIrHvIb1R0zIDtTru
         xXf8JJU9Y965GCI5pzdEeMuVj5bW0/9U0UeJc4qns1itIa7W8zAs37eSB1uT55CiIb6T
         c/lQCx12xPk/Lgr9ZmM8quc//16pHSXDnSw8jgVLNfVUAz53qDtJ4czwGlTnnaKRwWAJ
         PZjl016HNoNCHsNVWzP2E0jTVSK72u8Y2kroA5mozmKw19AdVqVNuVo3yZKt0gDQJifQ
         Qkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771359315; x=1771964115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zMl2Yu1W1bveqwK3ZOC1P/exlFIcqbtGooOQsCvJX8=;
        b=UEAPlWDLT+IbqHLk5FU3jjj1TX7uSDUVM5ooVeS1iclAPWk++940sJHU1EFmUDBueY
         hwasdQeHmunqKqOaW0bXPKeC92M0a4+bEDUespHaIm2DE3ekXLaauXwZrVqY5a883EhN
         GGqaDYW+lTmygkDOZQpjo9+81E+clYKNtDXW70Z6zCtgWQfYIeBm1Eubsuzadp6BQREc
         UzEwJDolenUOaD0OLpBOl5xcuproGMcMVT8SvYy88qONzOjUPZ+fl1h38TvZFAL3Q3EB
         8adsiUO6GbxSGQxhDQuw2vqqCHtVhS8Jsecm+b9Sjl7gQaVVSik7UuxiLNasAfBH4A6K
         5u0A==
X-Forwarded-Encrypted: i=1; AJvYcCUkTu7kOnqkWf+WWhPqU2aNb7iCvf5ccDm7YfUQv9MoHxYFVpTrX8eu9A7Y4OxY1SJthWkQM5oKKVUfobEqzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF5m90dIuEF1HSYwRew6H1xzXKhdJokbVoOQLRRxKjrpC4b50T
	sPVds5wvyQWERU74wb+1ZHdl6dcNx5zYiBCMJSRl6zev4C4/PyLjeyh5gjqQRCTsEsjwYkkxbo0
	lps9neRjBo/FYJmI0HfZ/ZwqnNapaMDOQHaMCzETa
X-Gm-Gg: AZuq6aI+kIp6DIKo8Jb7HnhEBQOfSc13tcSIxmMDpCSTWc+767x8rsYFlDUBfxLGN+x
	0PSdDWE81+X6mN0cEiGobOgbUTI1YqKFP6tkPN5CKIoeAXC4aF9TBIoWywehOBgC9ox5G+VZt0o
	2wIwB3BAhbWrur3EHUd1YrMRhqk+cNCgBW+RTxMzpDoKiXlc+SUpQqNVsPoouyZwRkhZ9LxYNCs
	j1m9h4Wk+mwSVyyeL45eXrk2myo+olNA0VEoj9NqNU5rAJcMy3psab+LJ5vjbUYoiAo6S/iq3PJ
	N939a5xtDC+9QL1gG1S0k8iBHg746Xq0oIsnAA==
X-Received: by 2002:a05:6000:2906:b0:435:9d3f:92eb with SMTP id
 ffacd0b85a97d-4379db31ac3mr21538377f8f.1.1771359314340; Tue, 17 Feb 2026
 12:15:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com>
 <20260217-binder-vma-check-v1-1-1a2b37f7b762@google.com> <CAG48ez2mUQ-D3jpPbvdZzcOz16LMXRnzcudOZsfdoftBF5yvPA@mail.gmail.com>
In-Reply-To: <CAG48ez2mUQ-D3jpPbvdZzcOz16LMXRnzcudOZsfdoftBF5yvPA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Feb 2026 21:15:01 +0100
X-Gm-Features: AaiRm52lAtTK24I1jWSIFWbocsxLAqep13HDwqT0r-mfbjL1WzrnLQsvrZePKok
Message-ID: <CAH5fLghCCAvOi+xRtPnD4ToQmyignjkn-PJ6xG6Y1DAUHgBKVA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust_binder: check ownership before using vma
To: Jann Horn <jannh@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 5:55=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Tue, Feb 17, 2026 at 3:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > When installing missing pages (or zapping them), Rust Binder will look
> > up the vma in the mm by address, and then call vm_insert_page (or
> > zap_page_range_single). However, if the vma is closed and replaced with
> > a different vma at the same address, this can lead to Rust Binder
> > installing pages into the wrong vma.
> >
> > By installing the page into a writable vma, it becomes possible to writ=
e
> > to your own binder pages, which are normally read-only. Although you're
> > not supposed to be able to write to those pages, the intent behind the
> > design of Rust Binder is that even if you get that ability, it should n=
ot
> > lead to anything bad. Unfortunately, due to another bug, that is not th=
e
> > case.
> >
> > To fix this, I will store a pointer in vm_private_data and check that
> > the vma returned by vma_lookup() has the right vm_ops and
> > vm_private_data before trying to use the vma. This should ensure that
> > Rust Binder will refuse to interact with any other VMA. I will follow u=
p
> > this patch with more vma abstractions to avoid this unsafe access to
> > vm_ops and vm_private_data, but for now I'd like to start with the
> > simplest possible fix.
>
> This sounds good to me.
> (Userspace could still trick Rust Binder into accessing the VMA at the
> wrong offset, but nothing will go wrong in that case.)

Vma is tricky stuff.

I think if I add the vm_ops->close callback this one isn't possible anymore=
?

> > C Binder performs the same check in a slightly different way: it
> > provides a vm_ops->close that sets a boolean to true, then checks that
> > boolean after calling vma_lookup(), but I think this is more fragile
> > than the solution in this patch. (We probably still want to do both, bu=
t
> > I'll add the vm_ops->close callback with the follow-up vma API changes.=
)
> >
> > Cc: stable@vger.kernel.org
> > Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> > Reported-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Reviewed-by: Jann Horn <jannh@google.com>
>
> > ---
> >  drivers/android/binder/page_range.rs | 78 +++++++++++++++++++++++++++-=
--------
> >  1 file changed, 58 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/android/binder/page_range.rs b/drivers/android/bin=
der/page_range.rs
> > index fdd97112ef5c8b2341e498dc3567b659f05e3fd7..90bab18961443c6e59699cb=
7345e41e0db80f0dd 100644
> > --- a/drivers/android/binder/page_range.rs
> > +++ b/drivers/android/binder/page_range.rs
> > @@ -142,6 +142,27 @@ pub(crate) struct ShrinkablePageRange {
> >      _pin: PhantomPinned,
> >  }
> >
> > +// We do not define any ops. For now, used only to check identity of v=
mas.
> > +static BINDER_VM_OPS: bindings::vm_operations_struct =3D pin_init::zer=
oed();
> > +
> > +// To ensure that we do not accidentally install pages into or zap pag=
es from the wrong vma, we
> > +// check its vm_ops and private data before using it.
> > +fn check_vma(vma: &virt::VmaRef, owner: *const ShrinkablePageRange) ->=
 Option<&virt::VmaMixedMap> {
> > +    // SAFETY: Just reading the vm_ops pointer of any active vma is sa=
fe.
> > +    let vm_ops =3D unsafe { (*vma.as_ptr()).vm_ops };
> > +    if !ptr::eq(vm_ops, &BINDER_VM_OPS) {
> > +        return None;
> > +    }
> > +
> > +    // SAFETY: Reading the vm_private_data pointer of a binder-owned v=
ma is safe.
> > +    let vm_private_data =3D unsafe { (*vma.as_ptr()).vm_private_data }=
;
> > +    if !ptr::eq(vm_private_data, owner.cast()) {
> > +        return None;
> > +    }
>
> (And the ShrinkablePageRange is only dropped when the Process is
> dropped, which only happens once the file's ->release handler is
> invoked, which means the ShrinkablePageRange outlives any VMA
> associated with it, so there can't be any false positives due to
> pointer reuse here.)

Yeah.

Alice
