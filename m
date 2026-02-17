Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C141537757F
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 20:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359192; cv=pass; b=R4D08shJi/VH4kCyOsBxiFl5sN9bdWGAiHdFbdxpc+Hpg7KngcCpFtDbxXvWCiGCJ19eOD6oluwVRTZQsfgbu5y15xKYwdBLodJPQlhum4pVvyPsA61HzPRa9wSS23qd1t2NBfESQMNvWN6a5FCRWNPDp2y+tp7FrJ3hwIiZO7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359192; c=relaxed/simple;
	bh=p4esf1iN4S1z1tKjNoPQadz/D3/X8dM90mV1Gls+vg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcYY4RADYjlLceRanw7Y38mykB9oEN4nz42DgYKTDqpoW3ztEF4PcnovvfADAs3HGUoCJNt/B+GIvAroZhnP3zsIYI+IYjmA0qfJB/b9OzR5NUuUj+CP7e2blGsPx5dWz4K5gqw9zrfQiuGKIb121KVe9N6Ua6V18qNe3mnezDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lgG/VSW7; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lgG/VSW7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48371bb515eso52557765e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 12:13:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771359189; cv=none;
        d=google.com; s=arc-20240605;
        b=TwNe3oUtxoFB8ueSQ6N5bTIy7vbHtULoPLZ0tqRAsRwJ/4JhoBnOwIZqDCto9RrUKv
         kUvbn25/5AbLuac1Tel1BbiY/MsujQoaAxR9agd81Ymt4STmtIDZJk9euKtVMIrL5M3y
         xDWS3D806iPPdjCdCtfnQYoq84TrvVmyXpKe5OFdpSSPI44Pr8R0wM6GTRZcsiSeQofG
         dTvdn0k9hLNLaAD5tI/PHRGRkjdacE3azai6Lm9t3xAU4tf8Gx4Ea37ZXhTFZ3qlzyvZ
         z5VoDHJQMMqzetsi2m+pCbhcWP/nTow4PvNyvH8QLc9FFwyxyVsNPVHep8jK1zDVa2UH
         6i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CvSItU0sreEL4B15MgR7qAnJZMB2EOXjlw60m4SYry4=;
        fh=Qe/wUecfRkog/NNBWnllqxpM54VU9SO4wCsyiiWxAns=;
        b=csS4tSI2zVgO8T1Vb31A/BT8vnImaj06wffrBxJDTOLQHEGoT4WhFRPINeAFG1bctx
         ZfUuBAPv90KH9MjMTTTtBY0rIWYDi5+gAtynUR+eb2kjcPiSD+WGALISeu5B/FxQAEwk
         8qR2iyXPHwXDy1qsqALLXDjwrlvl0MouhZfl5uhhzgjm6Naj9Lan87M/4cS+lnXHcBo3
         7Zv0J7EpSfMPgPphgrBIiyc/vt0Te4qJpQXbR6Xaj8podc9bsJrZS2sfK3H4opvPcgkn
         DxTSjixmrEDmQ30oCZBPJwpY/lhv814QaYUOzw76wHh+8ar2B0HM9gQE+wIwnb+d8sPs
         C/3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771359189; x=1771963989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvSItU0sreEL4B15MgR7qAnJZMB2EOXjlw60m4SYry4=;
        b=lgG/VSW7/2qyGe1oJvJZV4wVwr0KjhgvhlcGdZIGz99UmEQM8HBv9dfs7qBTwN+PH3
         nwd3FpZCBJqWQnf51JIbiJidAx8chKs9vE+7oZU2mG9oIshLsiQMfrcXBBHZ1uP9j6Em
         Pt6nrYTL7zHN47ul8CXkCTPf2ktG5j3JDERUBMMYezUJDAWYx+WjbleHhmaDWHnVfAqH
         l0yiThp/ksJrw0xTm3LAJcnecQXVw1q3iHSy+0m1sIQ1Diw5+/O/vN331+4DyYDBXnvf
         3nbmUtv+Eg/qyZ0ef85L9C9i0K0Ejl8u4nvcnfhD5ZLfnpjJP2NZ2P3ZDyEQVW2VJN5g
         8IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771359189; x=1771963989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CvSItU0sreEL4B15MgR7qAnJZMB2EOXjlw60m4SYry4=;
        b=e5FSzX83Xc6T9o5fg0EIALplGDggzmXjC/KoPhxJb263/D5Seq0h7qPrpiNkscufic
         JI0rAdp9A3Jop8kNQZGB5fPA7DSLd/s4WwP59qSu2b7r839Y4Mqr+3XUMts8ppZW6c2W
         M70mmb6avlb32V8Zp27WnKqv4qCT0euAT+BTYgy1Ke+COjz79M8fwXK/nxMnekTJuLhF
         43JacL8IGOR4LMQexiu41lrDgqd0Ervl8ksE3SxUROy/nrtM9ZvmsJsqkj4kTewrmXwh
         ZEpUJTvFgydxaRuADeFPSWZC8S9EyX5xZ/5o9b7BuXHDJzRdH/a318HO6K1Dm54+Yn/m
         W2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPGKOqiGSaFLEUtOPTOcRGdovW9cjvJddISCbxjt3oMO3463+ygomStc/RHhPZ/tusDkABdVNUAmX5hGwTkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfYhZD89Ac0AHbajB06q4f4Mf553mEo/ytMhCumvgX8wb9JJ2I
	Wv2T/wMjRcNGsq1zEOu8SB8H7EzcqwwlIC/JBxjW8YwwkSGfTwlc3HodqiFfPIDTY3gtRj6JmRE
	omfNfNX0k83AyLw7OZwDMnT3bPrX2kfhjuOdzpSez
X-Gm-Gg: AZuq6aIixWN9jGxFdvcnbnMZBoqW9h+SRjhNXTtyy5QyOQV194RNZhIb5aLv6sqU+d4
	L880av0tFExm+ouNzmRbloyUBgoNFMgJGurDNsJHnmp4ZTDbLMZrUKDAzisthqPLO446SzWG1tt
	xAhq9JpJR86CO5OCKHZyEqUWz1Wy+2R00G8EVBXM9yKZ8aBX2WfW1Z3ojePNyga9X6pjU1c5hJC
	bn6yIMR2b1/tCMKkCeo1SPtHbhxAjcEvet1dgLlQ3hQNYK4kccX7fxHoB0hgBBcE3Micpvkrv/M
	rFjYoMUF3iyqLI5Q4RZzxPmlMHDyIhcEQxiRQJ8PFU4qj1Ud
X-Received: by 2002:a05:600c:3496:b0:477:fcb:2256 with SMTP id
 5b1f17b1804b1-48373a5ba90mr257612055e9.17.1771359188669; Tue, 17 Feb 2026
 12:13:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com>
 <20260217-binder-vma-check-v1-1-1a2b37f7b762@google.com> <DGHC1OLDIXC7.Q4IAOOSMHIY@kernel.org>
In-Reply-To: <DGHC1OLDIXC7.Q4IAOOSMHIY@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Feb 2026 21:12:56 +0100
X-Gm-Features: AaiRm53IBeHjKaJgOILHNfxfP3AsdI88i44Wfx6908SXCYMlXXgAxRb7b8ZWSRs
Message-ID: <CAH5fLgj2+XUzsuAnvwL=dc=5yOZvXCapBWRbFGwJAX2v5Wk4dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust_binder: check ownership before using vma
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Jann Horn <jannh@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 4:13=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Feb 17, 2026 at 3:22 PM CET, Alice Ryhl wrote:
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
> I suggest to use imperative mood instead.

How do you propose to reword "I will follow up this patch with"?

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
>
> If you have a link, please add Closes: after Reported-by:.

There is no publicly accessible link.

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
> > +
> > +    vma.as_mixedmap_vma()
> > +}
> > +
> >  struct Inner {
> >      /// Array of pages.
> >      ///
> > @@ -308,6 +329,16 @@ pub(crate) fn register_with_vma(&self, vma: &virt:=
:VmaNew) -> Result<usize> {
> >          inner.size =3D num_pages;
> >          inner.vma_addr =3D vma.start();
> >
> > +        // This pointer is only used for comparison - it's not derefer=
enced.
> > +        //
> > +        // SAFETY: We own the vma, and we don't use any methods on Vma=
New that rely on
> > +        // `vm_private_data`.
> > +        unsafe { (*vma.as_ptr()).vm_private_data =3D self as *const Se=
lf as *mut c_void };
>
> Maybe use from_ref(self).cast_mut().cast::<c_void>() instead?

Honestly I think this one is easier to read as-is.

Alice
