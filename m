Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE85328629
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764332868; cv=none; b=oKPyqHpZQHTo0zrk8f4fi+7WO6JqzbWn/pkFyC5glgzodIGsRPtZ/DZoXDY9cVtFx7BtFYv45vAoy2xsGS0q6tnUfK8tT0t0z1PMK1pXxN5jVpdFeURV+S/2JI5cMj6huP5KBiXrbDo7OhDqT5sOF3E6AJO2dIxeqnmpi1BCxD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764332868; c=relaxed/simple;
	bh=7CxlEtFNw6Z9MWHmL142nU6wGKtsXjNk6kzJMyfvIVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DyJVWoeRHVdo/pEAnlowR43Jd4An0WNeRuvIB7gIRtuTDd7Ofp11KwIBsTjAqXj+prASeZE4l6RAhh/5XYsrjndB4w7489uqMP/BY3K/Xm8LvBOIlcCTV8KhXE0gJiUj9kZkP4l4xc8JlxV2ffq+EDqYc1CzGIyJa9FiLB8UzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cfxdZqMP; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cfxdZqMP"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-429c521cf2aso1538422f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 04:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764332865; x=1764937665; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2GrxI73IH1zb/tqoEbLnFEuvsfEsSAbtldPLm3aL+m8=;
        b=cfxdZqMP5YuJulD+lP9SKOfNzZ5I3WPesFmJNA+bNlKKGIqOXeeb3IPsPRGSmTj0z5
         4IBYwYrn7tnsswXvmQGz4Xp3g4FPROQ1nADleC2o6m+Xxb4r7vl4y4eFuOa9WHng5rv2
         zWYJuMD5PPEJaeDgYCTE69xvPC/KtunKlorrj9IA2TL8UiYoD1U30QRbuiUoIb6z8MRz
         xIGOXxdvEzO1edrKKfKMY9YIg7OOOqT3r/UAegg/iuP3AQ93LVQCHMP0400a8SVMYqiZ
         0DK9Pq63iiz+kZfmhEAIawxkGJ0nkgYx3/+POG+wKl58Qzvn7igaXb2fMUZW1OD5yZ7Y
         qYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764332865; x=1764937665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2GrxI73IH1zb/tqoEbLnFEuvsfEsSAbtldPLm3aL+m8=;
        b=fB168egwf0+s6IsE7RqdEJnUd2WaZi/0PO1ZJ0lzc82eWhyfkm+hxgA0sBmCGSfCq2
         Gc7PL0FJN6lD7olYErQ90/0CmKt7ltk2PxUfXH+cbECqjusgK/aOHiugmSY98rP8kqOP
         EKF8fiT/kXyHCxJ5iV5IlUtzC/jLNOHIm2AuTNtxVY1WjaAm84+Z/+RShmJF9u/23OYQ
         JA5m+5y+iR3BUVC4p5x6DIR7ZQgyiG7uXeMu4y33jg3aPfLvP+P81zJhJhoVBioZCxu7
         /JnL09S6IK/ceWkGfgl9YnEyu0DE9UaiWgKUG7V4DCVBbAk17mP77UNkUPM2fE2m9S1K
         mp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgjIjFYVNTlO1OEy7qqbV/A0GGkS2C/JA4AwJxo8HYy4bClk4ktjCTYuKTGgPa3ejoPryg8pNStndga+6tGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTebjUcROS6+iSEFC8ni5JK+ITgZw84U8I/2zHHIis/XJrRz4
	0SPGnXKZOhKGHmhb/iwHbvaxd4FLLOA7jlzyBNdW6w4J7mv0fPvdUp9Fi+trsOdG0NvQlVORCt1
	zuoC84y9F0rPsRrnIVw==
X-Google-Smtp-Source: AGHT+IFrzQE9ShhEH+O/A+uGYvOpMCgB1tV6y31i20Qgk7dHyiQa17sa62hxuRWbws3zq/cXPMCUdX8VRnAvG8o=
X-Received: from wrqj16.prod.google.com ([2002:a5d:4490:0:b0:42b:b28a:6747])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2410:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42cc1d199cdmr28747644f8f.40.1764332865299;
 Fri, 28 Nov 2025 04:27:45 -0800 (PST)
Date: Fri, 28 Nov 2025 12:27:44 +0000
In-Reply-To: <12d99a54-e111-4877-b8cd-cb1e58cd6d30@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251112-io-pgtable-v3-1-b00c2e6b951a@google.com> <12d99a54-e111-4877-b8cd-cb1e58cd6d30@arm.com>
Message-ID: <aSmVQDMXqwc8ctDf@google.com>
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

On Fri, Nov 28, 2025 at 11:56:17AM +0000, Robin Murphy wrote:
> On 2025-11-12 10:15 am, Alice Ryhl wrote:
> > From: Asahi Lina <lina+kernel@asahilina.net>
> > 
> > This will be used by the Tyr driver to create and modify the page table
> > of each address space on the GPU. Each time a mapping gets created or
> > removed by userspace, Tyr will call into GPUVM, which will figure out
> > which calls to map_pages and unmap_pages are required to map the data in
> > question in the page table so that the GPU may access those pages when
> > using that address space.
> > 
> > The Rust type wraps the struct using a raw pointer rather than the usual
> > Opaque+ARef approach because Opaque+ARef requires the target type to be
> > refcounted.
> > 
> > Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> > Co-Developed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>

> > +/// Protection flags used with IOMMU mappings.
> > +pub mod prot {
> > +    /// Read access.
> > +    pub const READ: u32 = bindings::IOMMU_READ;
> > +    /// Write access.
> > +    pub const WRITE: u32 = bindings::IOMMU_WRITE;
> > +    /// Request cache coherency.
> > +    pub const CACHE: u32 = bindings::IOMMU_CACHE;
> > +    /// Request no-execute permission.
> > +    pub const NOEXEC: u32 = bindings::IOMMU_NOEXEC;
> > +    /// MMIO peripheral mapping.
> > +    pub const MMIO: u32 = bindings::IOMMU_MMIO;
> > +    /// Privileged mapping.
> > +    pub const PRIV: u32 = bindings::IOMMU_PRIV;
> 
> Nit: probably best to call this PRIVILEGED from day 1 for clarity - some day
> we may eventually get round to renaming the C symbol too, especially if we
> revisit the notion of "private" mappings (that's still on my ideas list...)

Sure, will rename.

> > +    /// Map a physically contiguous range of pages of the same size.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// * This page table must not contain any mapping that overlaps with the mapping created by
> > +    ///   this call.
> 
> As mentioned this isn't necessarily true of io-pgtable itself, but since
> you've not included QUIRK_NO_WARN in the abstraction then it's fair if this
> layer wants to be a little stricter toward Rust users.

Assuming that we don't allow QUICK_NO_WARN, would you say that it's
precise as-is?

> > +    /// * If this page table is live, then the caller must ensure that it's okay to access the
> > +    ///   physical address being mapped for the duration in which it is mapped.
> > +    #[inline]
> > +    pub unsafe fn map_pages(
> > +        &self,
> > +        iova: usize,
> > +        paddr: PhysAddr,
> > +        pgsize: usize,
> > +        pgcount: usize,
> > +        prot: u32,
> > +        flags: alloc::Flags,
> > +    ) -> Result<usize> {
> > +        let mut mapped: usize = 0;
> > +
> > +        // SAFETY: The `map_pages` function in `io_pgtable_ops` is never null.
> > +        let map_pages = unsafe { (*self.raw_ops()).map_pages.unwrap_unchecked() };
> > +
> > +        // SAFETY: The safety requirements of this method are sufficient to call `map_pages`.
> > +        to_result(unsafe {
> > +            (map_pages)(
> > +                self.raw_ops(),
> > +                iova,
> > +                paddr,
> > +                pgsize,
> > +                pgcount,
> > +                prot as i32,
> > +                flags.as_raw(),
> > +                &mut mapped,
> > +            )
> > +        })?;
> > +
> > +        Ok(mapped)
> 
> Just to double-check since I'm a bit unclear on the Rust semantics, this can
> correctly reflect all 4 outcomes back to the caller, right? I.e.:
> 
> - no error, mapped == pgcount * pgsize (success)
> - no error, mapped < pgcount * pgsize (call again with the remainder)
> - error, mapped > 0 (probably unmap that bit, unless clever trickery where
> an error was expected)
> - error, mapped == 0 (nothing was done, straightforward failure)
> 
> (the only case not permitted is "no error, mapped == 0" - failure to make
> any progress must always be an error)
> 
> Alternatively you might want to consider encapsulating the partial-mapping
> handling in this layer as well - in the C code that's done at the level of
> the IOMMU API calls that io-pgtable-using IOMMU drivers are merely passing
> through, hence why panfrost/panthor have to open-code their own equivalents,
> but there's no particular reason to follow the *exact* same pattern here.

Ah, no this signature does not reflect all of those cases. The return
type is Result<usize>, which corresponds to:

struct my_return_type {
    bool success;
    union {
        size_t ok;
	int err; // an errno
    }
};

We need a different signature if it's possible to have mapped != 0 when
returning an error.

> > +    }
> > +
> > +    /// Unmap a range of virtually contiguous pages of the same size.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// This page table must contain a mapping at `iova` that consists of exactly `pgcount` pages
> > +    /// of size `pgsize`.
> 
> Again, the underlying requirement here is only that pgsize * pgcount
> represents the IOVA range of one or more consecutive ranges previously
> mapped, i.e.:
> 
> map(0, 4KB * 256);
> map(1MB, 4KB * 256);
> unmap(0, 2MB * 1);
> 
> is legal, since it's generally impractical for callers to know and keep
> track of the *exact* structure of a given pagetable. In this case there
> isn't really any good reason to try to be stricter.

How about this wording?

This page table must contain one or more consecutive mappings starting
at `iova` whose total size is `pgcount*pgsize`.

Alice
