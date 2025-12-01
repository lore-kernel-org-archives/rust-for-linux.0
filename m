Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB42301012
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764583141; cv=none; b=cGCvgKToJWzJAkUgOgqeU2xi8c538fs5zCFckeQAaIn1v+AwYoyy8schTmqxmx093Rad88V8hPnpFVPd0ekIK9rhcTW2iTr7RGgtjIiW8UKD6mfC8B+LENtf6q/GxODE7TDlEtBn3UtKCl3tTjzbXtKj/4cJGWBWCwgImXYWS+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764583141; c=relaxed/simple;
	bh=keELoSXdcRxYPMixzvjMTmBazd/emMmOTOerZnIjbgo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rov1cRqAe8Lgr66ydM3Eo97MsCtIP7DpOSy/PON5H/ZBveaiS43kxMD/raX1zrgsOlJcSaoDC04M+4cn4zovnkVBS8nshRR2fTA5UggdcFec0bEF+FEXKjdKMVrrHIygGWcNygUVf8YOCxGNEi96zJG2/Y/WgvBli2layOialDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DViyZQxz; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DViyZQxz"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47775585257so28239485e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 01:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764583137; x=1765187937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a8n92NxyNaQcFOv77Y1KGrTuD03BcJ0jos8t6qKohZE=;
        b=DViyZQxzGW/1Q0Kd3U5RpPlrfzWnCSQM4yh9udtqcoNZWlBU+g05FF3Tu4/6w6dH4D
         9d1EprWIPFD0an00IC6vE5bZ7A5MhDwU1c+vU5qwytSLoOHPYMQFf93O0iUlYqt+goxZ
         1fTZaRDYMJiI0UuBXdHZQSQ4uvymAJ6SFpv1mIi8rjOnz5hrtv1IiusF75mPF6S6fXzZ
         crmY5JyPLjt+TOIWERN//+u1j5jDRgulIKPA0gGMtcr9hnynT1buS4kJTmJHdfHxN31N
         BkqEiBqVuMl59bhsiX4BtenKqDUsi10r/zHnFcjHulz6eJsigQxPHcUdklBdIaB5WWIw
         TD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583137; x=1765187937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8n92NxyNaQcFOv77Y1KGrTuD03BcJ0jos8t6qKohZE=;
        b=jbjJEFd3pl3RvjUzWyCITTMtgm1N4qmmfg6wDjIGyPaZ8egAzjTEGkRMpsgQqr6DJk
         Jvd0rc0dXdsN9Md5z4WDwH8V8lynp9/7/8vSzoMeTlnQ4+A+itDdJyva68gTGmL/4Utw
         +brvWqsuQbo3Ql4lLznSzAvY+KqZ94rgW7LvUun0sLvPnL/J8g1oJ56bSxguG9TG0xZL
         LjxVahRyOXcPr8AcYO/x+X01SwsmFBOPciC3bxYcBWySsLg4tPUbVWV2lLsHoa2ujPim
         u/5Jgmt/qLsTwxBL4cm6y7KrCUw/+T6D1V0mYqpCHGyH7V1V6eIYbx91brb+cvefRLM9
         EA1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX64KLuFquo2xcCCIYjLMnGfyqz4x47eq4BRD2AdVx3EkN4QNi2uco7BSosOcWKWDlPSaYUZ23qE84yA/YXUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7xjzb7gghrwd3tNJEaV+lRooiZUD3Igj2AyhnmVXcLf4GGI0
	EpD/osRUPeBNZkdO9cDXSUmHTvLw4X6CyAkHqs1Q49NGz95ex6KOT6AJ1UGW3wR+aTV5Q84tN5O
	wh7W0g+UFUkGnA6saPQ==
X-Google-Smtp-Source: AGHT+IE30ug28B+UD0DWj7O+zjLWxPTqpE2raQjUVcci0EVV14naheaFBpit1w3aaTTXqjlC41pTF7QjzuYwcvg=
X-Received: from wmcn10.prod.google.com ([2002:a05:600c:c0ca:b0:477:afa:d217])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f14:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-477c10c802bmr381654045e9.3.1764583137353;
 Mon, 01 Dec 2025 01:58:57 -0800 (PST)
Date: Mon, 1 Dec 2025 09:58:56 +0000
In-Reply-To: <c8229530-ab87-4b51-8f2b-6199a01095b3@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-io-pgtable-v3-1-b00c2e6b951a@google.com>
 <12d99a54-e111-4877-b8cd-cb1e58cd6d30@arm.com> <aSmVQDMXqwc8ctDf@google.com> <c8229530-ab87-4b51-8f2b-6199a01095b3@arm.com>
Message-ID: <aS1m4DawouC1utSj@google.com>
Subject: Re: [PATCH v3] io: add io_pgtable abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 28, 2025 at 04:47:52PM +0000, Robin Murphy wrote:
> On 2025-11-28 12:27 pm, Alice Ryhl wrote:
> [...]
> > > > +    /// Map a physically contiguous range of pages of the same size.
> > > > +    ///
> > > > +    /// # Safety
> > > > +    ///
> > > > +    /// * This page table must not contain any mapping that overlaps with the mapping created by
> > > > +    ///   this call.
> > > 
> > > As mentioned this isn't necessarily true of io-pgtable itself, but since
> > > you've not included QUIRK_NO_WARN in the abstraction then it's fair if this
> > > layer wants to be a little stricter toward Rust users.
> > 
> > Assuming that we don't allow QUICK_NO_WARN, would you say that it's
> > precise as-is?
> 
> As an assumption of use for the Rust API, like I say it's fine - it's still
> not really "unsafe" if a caller did try an overlapping mapping; the call
> will still fail gracefully and accurately, it's just it will also fire a
> WARN_ON() since ARM_64_LPAE_S1 without IO_PGTABLE_QUIRK_NO_WARN considers
> this indicative of a usage error or race in the caller.
> 
> If we do end up wanting to support more opportunistic and/or
> userspace-controlled mappings by Rust drivers in future then we can relax
> this expectation as appropriate.

Yeah, let's just say that it's an unsupported use-case. These bindings
can be expanded in the future if anyone needs QUICK_NO_WARN.

> > > > +    /// * If this page table is live, then the caller must ensure that it's okay to access the
> > > > +    ///   physical address being mapped for the duration in which it is mapped.
> > > > +    #[inline]
> > > > +    pub unsafe fn map_pages(
> > > > +        &self,
> > > > +        iova: usize,
> > > > +        paddr: PhysAddr,
> > > > +        pgsize: usize,
> > > > +        pgcount: usize,
> > > > +        prot: u32,
> > > > +        flags: alloc::Flags,
> > > > +    ) -> Result<usize> {
> > > > +        let mut mapped: usize = 0;
> > > > +
> > > > +        // SAFETY: The `map_pages` function in `io_pgtable_ops` is never null.
> > > > +        let map_pages = unsafe { (*self.raw_ops()).map_pages.unwrap_unchecked() };
> > > > +
> > > > +        // SAFETY: The safety requirements of this method are sufficient to call `map_pages`.
> > > > +        to_result(unsafe {
> > > > +            (map_pages)(
> > > > +                self.raw_ops(),
> > > > +                iova,
> > > > +                paddr,
> > > > +                pgsize,
> > > > +                pgcount,
> > > > +                prot as i32,
> > > > +                flags.as_raw(),
> > > > +                &mut mapped,
> > > > +            )
> > > > +        })?;
> > > > +
> > > > +        Ok(mapped)
> > > 
> > > Just to double-check since I'm a bit unclear on the Rust semantics, this can
> > > correctly reflect all 4 outcomes back to the caller, right? I.e.:
> > > 
> > > - no error, mapped == pgcount * pgsize (success)
> > > - no error, mapped < pgcount * pgsize (call again with the remainder)
> > > - error, mapped > 0 (probably unmap that bit, unless clever trickery where
> > > an error was expected)
> > > - error, mapped == 0 (nothing was done, straightforward failure)
> > > 
> > > (the only case not permitted is "no error, mapped == 0" - failure to make
> > > any progress must always be an error)
> > > 
> > > Alternatively you might want to consider encapsulating the partial-mapping
> > > handling in this layer as well - in the C code that's done at the level of
> > > the IOMMU API calls that io-pgtable-using IOMMU drivers are merely passing
> > > through, hence why panfrost/panthor have to open-code their own equivalents,
> > > but there's no particular reason to follow the *exact* same pattern here.
> > 
> > Ah, no this signature does not reflect all of those cases. The return
> > type is Result<usize>, which corresponds to:
> > 
> > struct my_return_type {
> >      bool success;
> >      union {
> >          size_t ok;
> >          int err; // an errno
> >      }
> > };
> > 
> > We need a different signature if it's possible to have mapped != 0 when
> > returning an error.
> 
> Aha, thanks for clarifying - indeed this is not the common "value or error"
> case, it is two (almost) orthogonal return values. However if we're not
> permitting callers to try to do anything clever with -EEXIST then it might
> make sense to just embed the inevitable cleanup-on-failure boilerplate here
> anyway (even if we still leave retry-on-partial-success to the caller).

Is the only possible error -EEXIST? I could encode that in the API if
that is the case.

> Note that it does appear to be the case that io-pgtable-arm in its current
> state won't actually do this, since it happens to handle all its error
> return cases before any leaf PTEs are touched and "mapped" is updated, but
> the abstraction layer shouldn't assume that in general since other
> implementations like io-pgtable-arm-v7s definitely *can* fail with a partial
> mapping.

Agreed, I will update the API accordingly.

> > > > +    }
> > > > +
> > > > +    /// Unmap a range of virtually contiguous pages of the same size.
> > > > +    ///
> > > > +    /// # Safety
> > > > +    ///
> > > > +    /// This page table must contain a mapping at `iova` that consists of exactly `pgcount` pages
> > > > +    /// of size `pgsize`.
> > > 
> > > Again, the underlying requirement here is only that pgsize * pgcount
> > > represents the IOVA range of one or more consecutive ranges previously
> > > mapped, i.e.:
> > > 
> > > map(0, 4KB * 256);
> > > map(1MB, 4KB * 256);
> > > unmap(0, 2MB * 1);
> > > 
> > > is legal, since it's generally impractical for callers to know and keep
> > > track of the *exact* structure of a given pagetable. In this case there
> > > isn't really any good reason to try to be stricter.
> > 
> > How about this wording?
> > 
> > This page table must contain one or more consecutive mappings starting
> > at `iova` whose total size is `pgcount*pgsize`.
> 
> Yes, that's a nice way to put it.

Perfect thanks.

Alice
