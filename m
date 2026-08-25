Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE211394EB7;
	Tue, 25 Aug 2026 10:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787654678; cv=none; b=hY1BIZNzxeWC+TyQWrFR1Ap7veaXATLi0NBosKnK6nyPBLVmMZJath7GYr1DHlz60jKYbC8ii76JWlsFVg0G5yjoEyV/id23rR9Qzx0ysrNYkfKy8T78uMPLEeAkvOIJtzP/3qN+p20Idj2XM1y5ARIfw3HmhQASjvbma+qyu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787654678; c=relaxed/simple;
	bh=pOwsF/IiXayY/b2ryueQug8CFBqi/bda6y7cX6oDfhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDVSaexr90oraxZFXtf05JNk388hhTzsR3/qCI9XTjxi8jcEfqICdWIyC2CS7TWiHUQAMdVk2TFg6AF/UX4ba/XSYlI+Hbi5PD+DVMKMAkJluacmTg5uakwMeGdsVJHKWrr1qxXUhpmK3s0BcMPJk6QZY7DrBAYEnrVdOg2JiSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnbPkSUg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnbPkSUg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784FE1F000E9;
	Tue, 25 Aug 2026 10:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787654676;
	bh=AdMg1fd/nLmt54Fd6YaLbChI//Uem2/WNbMOl8JDKdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MnbPkSUgtNYDc5Btnke6OSE5T/lysSA0MMRliw5RkFFRI9xTVDdyA+Jj00+qTNZOu
	 SEEoXy5myd9kgbC4XO+jZyGtBwnMpH0J+EHpiDOh1gnN0PUTzPZO9DB1/f1IQopk8A
	 2dZWHgpzD21uwffcQ/fVfWBL+HxLdKv+SzQaJvCLufKrYkcBILTl+7lCeyl+IC2SGp
	 +o4cC1/w5ryYqFF+Fd/c0FGFJKryPdKTxTXj3Py+QiykBmck3uJoY5cSg0G+iTRspX
	 G8/p7fhngiSdd6x7GRfSIYM8Ll2YkJGcgjzPfLUajHSP41pLs/eHh+xIgAxS+fxQKF
	 sE1v9i2GBULlQ==
Date: Tue, 25 Aug 2026 11:44:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Artem Lytkin <iprintercanon@gmail.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
Message-ID: <ao1KrhWs7m1aTy0l@gremlin>
References: <20260218-binder-vma-check-v2-1-60f9d695a990@google.com>
 <20260824194808.216021-1-iprintercanon@gmail.com>
 <ao1E_6yo9hE17e2E@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao1E_6yo9hE17e2E@google.com>

On Tue, Aug 25, 2026 at 07:32:15AM +0000, Alice Ryhl wrote:
> On Mon, Aug 24, 2026 at 10:48:08PM +0300, Artem Lytkin wrote:
> > On Wed, Feb 18, 2026, Alice Ryhl wrote:
> > > The plan is to introduce more vma
> > > abstractions to avoid this unsafe access to vm_ops and vm_private_data,
> > > but for now let's start with the simplest possible fix.
> > [...]
> > > (We probably still want to do both, but
> > > the vm_ops->close callback will be added later as part of the follow-up
> > > vma API changes.)
> >
> > Alice, is that follow-up still on your list, or would you rather someone
> > else took it?
> >
> > I'd like to add the missing pieces to kernel::mm::virt: a VmOperations
> > trait with open, close and fault, a typed way to install it together
> > with the private data on a VmaNew, a VmFault wrapper, and a PFN-map
> > typestate next to VmaMixedMap with vmf_insert_pfn_prot() on it. Binder
> > would then drop BINDER_VM_OPS and the raw vm_ops pointer compare and get
> > a close callback like the C driver has. Tyr needs the fault and PFN-map
> > half of that for its user MMIO mmap. The first two patches of
> > Collabora's Tyr series are the pgprot_noncached and pgoff helpers; they
> > have had no replies since 7 May, so I'd build on those rather than
> > duplicate them:
> >
> >   https://lore.kernel.org/all/20260507-tyr-mmap-v1-0-eec048a23c25@collabora.com/
>
> I have a draft for the vm_open callback somewhere and it's still on my
> todo-list, but I'm not actively working on it right now. I'd be happy to
> let someone else work on it, but it's somewhat nontrivial, so perhaps we
> should have a call to discuss the design to work out the details?
>
> > One design question first, for you and Lorenzo. f_op->mmap is
> > deprecated in favour of mmap_prepare, where a driver sets desc->vm_ops
> > instead of touching the vma, and the Rust side only has the old mmap
> > path today. Should the vm_ops abstraction be built around mmap_prepare
> > from the start, with a Rust mmap_prepare hook for miscdevice next to
> > it, or is landing it on the existing VmaNew an acceptable first step?
>
> Lorenzo, where can I learn more about this new mmap_prepare API? What
> are the main differences?

Luckily I wrote up a guide at
https://docs.kernel.org/filesystems/mmap_prepare.html which should be helpful in
general! :)

The TL;DR of mmap_prepare is that the mmap hook is problematic because it gives
a driver access to a vma with much state that it shouldn't touch and it does so
at a point before the VMA is mapped into the maple tree (or locked) but after
merge attempts and quite far into the mapping process making failure teardown
problematic.

mmap_prepare fixes this by:

a. running right at the start of the mapping operation
b. getting a pointer to a descriptor whose fields you update to affect changes
   you need
c. being able to do actions such as ioremap, etc. by setting state in the same
   descriptor, in C abstracted by helper functions.

It's idempotent in general - if you need to set state like a refcount or similar
you should do it elsewhere (the VMA might get merged or an error might occur so
it's not the right place to do iit).

In implementation:

In general, looking at the file_operations struct in include/linux/fs.h:

struct file_operations {
	...
	int (*mmap) (struct file *, struct vm_area_struct *);
	...
	int (*mmap_prepare)(struct vm_area_desc *);
};

(file->f_op)

struct vm_operations_struct {
	/**
	 * @mapped: Called when the VMA is first mapped in the MM. Not called if
	 * the new VMA is merged with an adjacent VMA.
	 *
	 * The @vm_private_data field is an output field allowing the user to
	 * modify vma->vm_private_data as necessary.
	 *
	 * ONLY valid if set from f_op->mmap_prepare. Will result in an error if
	 * set from f_op->mmap.
	 *
	 * Returns %0 on success, or an error otherwise. On error, the VMA will
	 * be unmapped.
	 *
	 * Context: User context.  May sleep.  Caller holds mmap_lock.
	 */
	int (*mapped)(unsigned long start, unsigned long end, pgoff_t pgoff,
		      const struct file *file, void **vm_private_data);
};

(vma->vm_ops)

Basically instead of getting a VMA you get a struct vm_area_desc:

struct vm_area_desc {
	/* Immutable state. */
	struct mm_struct *mm;
	struct file *file; /* May vary from vm_file in stacked callers. */
	unsigned long start;
	unsigned long end;

	/* Mutable fields. Populated with initial state. */
	pgoff_t pgoff;
	struct file *vm_file;
	vma_flags_t vma_flags;
	pgprot_t page_prot;

	/* Write-only fields. */
	const struct vm_operations_struct *vm_ops;
	void *private_data;

	/* Take further action? */
	struct mmap_action action;
};


You get given a pointer to this on the stack, you read what you need to and then
update mutable/write-only fields (the guide goes into detail on that).

If you want to take actions such as ioremap etc. there are helper inlines for
that in mm.h, e.g. mmap_action_remap_full() (you'd possibly have to port these
to rust) which makes doing a PFN remap really easy, e.g.:

	mmap_action_remap_full(desc, desc->pgoff);

This sets state in the descriptor that tells the kernel to go do this work
itself (a nice byproduct of this is that any buggy stuff drivers did is now
replaced with one code path).

The VMA mapped callback can be used to set state in vma->vm_private_data (you
are given a pointer to a void *vm_private_data on the stack which is assigned to
the VMA afterwards to avoid any driver container_of() abuse :)

BTW if you're going to LPC this year happy to chat in person about it if that'd
be helpful!

>
> Alice

--
Cheers, Lorenzo
