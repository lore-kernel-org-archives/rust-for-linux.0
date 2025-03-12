Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F53155389
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Mar 2025 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741762706; cv=none; b=jdhtW9bVhpI57NXJ2zI18UuNClsYJ8upXEVoCdjZt6fCh+Go4VmPtB6F5h+hjy11W776KyFotXS/5f9Cga7TBmNKUW6tS0r4HIjg3c5et9wa/WHKtQ07Cn/2na1lsPcMAfjYatjuU/25Evrpx0Gm/Gbak2j7YlNYpEYNipWynsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741762706; c=relaxed/simple;
	bh=FAxGjdwpzZ9kShu+5+deCiA4lOOPhlT7UhT5cCS3iz4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SxVMNdM/jMGLjaJJz3kKmbNeoadweHFFLXorBKdPLNAZABCmm4ox9N8rPm9GQ0x7ff16Cy0SPFd7BXYf0GkOWCeMlPqIHH3ADe6py59y+dO6bt4PcW+3b+Ne0ME8I+TALd+jRdLbsMXFCjtwRZf7zKMPIzmKJsOk+5HMtFORK4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O7bXy9Lv; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O7bXy9Lv"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so7319755e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Mar 2025 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741762703; x=1742367503; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=90M4KY+M05l/gc/aI9IBvgHDtaAxAtS9HDROuUEMRnA=;
        b=O7bXy9LvA9qzKO18a6gMLSCbuY5CxtotSca9kVyJOzYFGVygbatdxf2NKaFayJdLfD
         dlJn6yGAuhzoOAWItF5olffpTfOq+HarNY6UdA6V47FMNKPriCklN77vKiIEIW/VQxx6
         DPDWoLeu3xG9bAEa1qokg25X+7gqRiLOcfBDfH8u+W+Mgtmu46AKzCCzIi0o61wwWkA7
         W1+eEQgSQ0pYjQUxle2NwM9kGfr0n7Y6XiSPpgi1NoXICum6bJBbV6AKkzypA0zmlyGX
         iPTk519mNX9otf99dhBFe+2fazcLSOiorqBdjzYbHo9s46OLwL89VuTAxBwGqP1Y/UVN
         YdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741762703; x=1742367503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90M4KY+M05l/gc/aI9IBvgHDtaAxAtS9HDROuUEMRnA=;
        b=sWdz2ScIZavmEEDqQ1oqugusf/mJBzJ71CEPO5XYnZgdjhmODJqKQA1piKd5w7Z9cp
         StoNv1cXkZOQZ4SBoMwu/rvvyIkcul8I9kN3hVtvlcWHiIJKTgvRWoCOZDBx1oPNJYEI
         ir/oIeQlREGMx5W2voZoV+B/zsX2MochsLvM1ndN8AEkDoVGKCJb5gUSMBoA0BRlPSg7
         mLQFvlmQkz3JMJlLssyjUqCCuwMGhlVIBlNQ4jhyekrxu7nOeivHs964UsFx2NSGdapA
         LTmeFHgnvGCHdBVGxq0Tp+Epy4WI9kVfiYOrgHz+C21qK28Rm3azY4j8yNErx+zAkj1F
         sp+A==
X-Forwarded-Encrypted: i=1; AJvYcCUDMT/HAw0XN5QO8lfyFlWsOPQu2xIW8SzRgDLgTfzeLtG88cNblmwYgNIbnzf39cEDaXevn3P6rPUU3xtCXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrjwOqOuPDHrn50FkZsQ12EDuInurNgMyfw0ZyUMbrV3jxHeyp
	xqXsWGtAu3kXppw/sWVk0N10YZDIWB+dIHBTohy4mjSa74mbUesquEoPvUASJkjLVX9kBAehuwI
	EUme52pcEPAL5nQ==
X-Google-Smtp-Source: AGHT+IEImnzL1q/M+w7NyE4FN8UgVs3ouJf6qvKo4lrn3JJudPpasPaXb1WKmrJdEBMrury0dGMw8c9aQvFO768=
X-Received: from wmrn9.prod.google.com ([2002:a05:600c:5009:b0:43d:b30:d2df])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:402a:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-39132db8f39mr17318808f8f.50.1741762702966;
 Tue, 11 Mar 2025 23:58:22 -0700 (PDT)
Date: Wed, 12 Mar 2025 06:58:21 +0000
In-Reply-To: <Z9BJpq_qoECimNua@thinkpad>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250310161947.1767855-2-bqe@google.com> <Z88rhn5nVbd4-JSE@thinkpad>
 <Z9ALU7XVPt8JKKFR@google.com> <Z9BJpq_qoECimNua@thinkpad>
Message-ID: <Z9EwjVwsklGO4Q5y@google.com>
Subject: Re: [PATCH v3] rust: add bindings and API for bitmap.h and bitops.h.
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 11, 2025 at 10:33:10AM -0400, Yury Norov wrote:
> On Tue, Mar 11, 2025 at 10:07:15AM +0000, Alice Ryhl wrote:
> > On Mon, Mar 10, 2025 at 02:12:22PM -0400, Yury Norov wrote:
> > > On Mon, Mar 10, 2025 at 04:19:46PM +0000, Burak Emir wrote:
> > > > Adds a Rust bitmap API and necessary bitmap and bitops bindings.
> > > > These are for porting the approach from commit 15d9da3f818c ("binder:
> > > > use bitmap for faster descriptor lookup") to Rust. The functionality
> > > > in dbitmap.h makes use of bitmap and bitops.
> > > 
> > > Please add it in the same series that converts dbitmap to rust. This
> > > all is a dead code otherwise, right?
> > 
> > Rust Binder is not upstream yet. We are upstreaming its dependencies
> > before the driver itself, so there will be dead code no matter what. The
> > number of dependencies is so large that it's completely impractical to
> > land them together with the driver.
> 
> I don't ask to upstream all at once. But at least dbitmaps is less
> than 200 LOCs in C. Together with a test that demonstrates how you're
> using it, it would be enough.

Sounds good.

> > We can include a patch that includes the wrapper data structure that
> > Rust Binder builds on top of bitmap. We can also include a link to the
> > Rust Binder change that makes Binder start using this code.
> >
> > > > +            let ptr = unsafe { bindings::bitmap_zalloc(nbits_u32, flags.as_raw()) };
> > > > +            // Zero-size allocation is ok and yields a dangling pointer.
> > > 
> > > Zero-sized allocation makes no sense, and usually is a sign of a bug.
> > > What for you explicitly allow it?
> > 
> > I do think that it makes sense to allow a bitmap of size zero. We allow
> > bitmaps of any other length. Why should that length be special?
> > 
> > Of course, I guess it might make sense to not call `bitmap_zalloc` when
> > calling `new(0)`? But kmalloc does seem to allow them.
> 
> Without looking at the code it's "I think vs you think". 

The include/linux/slab.h file says:

/*
 * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
 *
 * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
 *
 * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
 * Both make kfree a no-op.
 */
#define ZERO_SIZE_PTR ((void *)16)

> > > > +    /// Copies all bits from `src` and sets any remaining bits to zero.
> > > > +    ///
> > > > +    /// # Panics
> > > > +    ///
> > > > +    /// Panics if `src.nbits` has more bits than this bitmap.
> > > > +    #[inline]
> > > > +    pub fn copy_from_bitmap_and_extend(&mut self, src: &Bitmap) {
> > > > +        if self.nbits < src.nbits {
> > > > +            panic_not_in_bounds_le("src.nbits", self.nbits, src.nbits);
> > > 
> > > The _lt usually stands for 'less than', or '<'. And _le is 'less than or
> > > equal', or '<='. But in your code you do exactly opposite. Is that on
> > > purpose?
> > > 
> > > Also, you can make it similar to BUG_ON() semantics, so that it will
> > > be a single line of code, not 3:
> > > 
> > >         RUST_PANIC("Copy: out of bonds", self.nbits < src.nbits);
> > > 
> > > And to that extend, panic message should be available to all rust
> > > subsystems, just like BUG_ON().
> > 
> > We could use
> > assert!(src.nbits <= self.nbits, "Copy: out of bounds.");
> > 
> > but using these explicit function calls would generate less code and
> > avoid duplicating the error messages.
> 
> What I see is that you generate more code - 3 lines vs 1.
> 
> Do you have any numbers supporting your statement? Can you show how
> exactly the messages are duplicated when using assert()? Can this
> assert() be fixed to avoid duplication?

The statement comes from having multiple string literals containing
similar strings. They might get deduplicated if they're completely
equal, I guess. Having many methods call one shared function ensures
that the binary will only have one copy of the string literal.

> > > > +        }
> > > > +    }
> > > > +
> > > > +    /// Finds the next zero bit, searching up to `nbits` bits, with offset `offset`.
> > > > +    ///
> > > > +    /// # Panics
> > > > +    ///
> > > > +    /// Panics if `nbits` is too large for this bitmap.
> > > > +    #[inline]
> > > > +    pub fn find_next_zero_bit_upto_offset(&self, nbits: usize, offset: usize) -> usize {
> > > > +        if self.nbits < nbits {
> > > > +            panic_not_in_bounds_le("nbits", self.nbits, nbits);
> > > > +        }
> > > > +        // SAFETY: nbits == 0 and out-of-bounds offset is supported, and access is within bounds.
> > > 
> > > find_bit() functions are all safe against nbits == 0 or
> > > offset >= nbits. If you add those panics for hardening reasons - it's
> > > OK. If you add them to make your code safer - you don't need them. The
> > > C version is already safe.
> > 
> > Ah, that's nice! I do think it's still good to have them for hardening
> > reasons. Passing an out-of-bouds offset is a bug.
> 
> Ironically, you don't test the offset for safety.
> 
> Whether it's a bug or not - depends on algorithm you're implementing. 
> Check how for_each_set_bitrange() works. For it, offset >= nbits is
> expected, at last iteration. It's completely safe, although out-of-range.
> 
> Thanks,
> Yury
