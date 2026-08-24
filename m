Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A3246781;
	Mon, 24 Aug 2026 20:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604966; cv=none; b=iEyJWGuT0OGWQinHejb4m2iYOtfLmPiuyNUtvKkO8bV/hMNsuqZubzsIKRaosNk+y0PTRructylcV8k5b5za0OsePg25abwHEnIeZD8oaGSImBrzwKqGlHeMPu+B5rLhQ7eMP+IrPQDYi5XNRWHJl0+tgCP8OOjW24Q4n5+LYxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604966; c=relaxed/simple;
	bh=5KyQNCHyRpmyEfbE0+zrruH5c5DxpEd1+xOqJssmso8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrg6djptjnU+Sdf5VRb4HRA12jPDLixOLw8a/1iQtDKDVk9HTjdwHtgFcM2aCM+9zMqZkfas5Xtnmq9vZkZmph1XJMqClTlTigRYJTwEVn8g3pMOR57QXXgHDlMin1OWnn7itk2Td+8Ol+dYF0kbCOpsKGVsPc+8AzS7Lmmw86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9U43Ttv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9U43Ttv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568BD1F000E9;
	Mon, 24 Aug 2026 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787604964;
	bh=ID8tRmJx0mTc50vU9b3epIJ7qr0Pi6TP7Z/LEdh/C/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9U43TtvfiwgLEXgrMS99wtxxxr2PLjP7grrikYJffbdrc6MZhVmrVEizPCoW1Llw
	 F+Qowkn86+zGGuU4nICaTK8ev1g6tNC6MogWYMRPdWpVNBO+W0aTeUlsgYc5i5v4fN
	 3T6EXPJBsTJVTkBEH5NAcmZMiiPIUMQgX7g3nNz4xZKd0YiHLFAwStOZ9507eZ5XQC
	 0S+tHj0NPYNij1QAeOrh3MUVhR4uSfVrH9WS7tbHIIA9rgvXEh8mNePtJkI2kkogJT
	 ijfTFfWZLwc0bKeKZTyR/mKiBef9QyFfufdS04XmnDWhYpgt1VKQJyiQHBTmFxu1/Q
	 b9vUJ7KA1lNdg==
Date: Mon, 24 Aug 2026 21:55:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
Message-ID: <aoyvV5-ZqXoRDFaf@gremlin>
References: <20260218-binder-vma-check-v2-1-60f9d695a990@google.com>
 <20260824194808.216021-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824194808.216021-1-iprintercanon@gmail.com>

On Mon, Aug 24, 2026 at 10:48:08PM +0300, Artem Lytkin wrote:
> On Wed, Feb 18, 2026, Alice Ryhl wrote:
> > The plan is to introduce more vma
> > abstractions to avoid this unsafe access to vm_ops and vm_private_data,
> > but for now let's start with the simplest possible fix.
> [...]
> > (We probably still want to do both, but
> > the vm_ops->close callback will be added later as part of the follow-up
> > vma API changes.)
>
> Alice, is that follow-up still on your list, or would you rather someone
> else took it?
>
> I'd like to add the missing pieces to kernel::mm::virt: a VmOperations
> trait with open, close and fault, a typed way to install it together
> with the private data on a VmaNew, a VmFault wrapper, and a PFN-map
> typestate next to VmaMixedMap with vmf_insert_pfn_prot() on it. Binder
> would then drop BINDER_VM_OPS and the raw vm_ops pointer compare and get
> a close callback like the C driver has. Tyr needs the fault and PFN-map
> half of that for its user MMIO mmap. The first two patches of
> Collabora's Tyr series are the pgprot_noncached and pgoff helpers; they
> have had no replies since 7 May, so I'd build on those rather than
> duplicate them:
>
>   https://lore.kernel.org/all/20260507-tyr-mmap-v1-0-eec048a23c25@collabora.com/
>
> One design question first, for you and Lorenzo. f_op->mmap is
> deprecated in favour of mmap_prepare, where a driver sets desc->vm_ops
> instead of touching the vma, and the Rust side only has the old mmap
> path today. Should the vm_ops abstraction be built around mmap_prepare
> from the start, with a Rust mmap_prepare hook for miscdevice next to
> it, or is landing it on the existing VmaNew an acceptable first step?

I'd say you should build around it to start, anything that you need to use
that uses the legacy interface can be converted :)

I (should) have more patches coming next cycle to keep the conversions
coming.

One thing that might be difficult if you in some way rely on a driver that
needs conversion is that I am building out the infra as I go -
i.e. implementing stuff like ioremap, mapping kernels pages, etc. as
mmap_prepare() does it in a different way.

But on general principle - mmap_prepare is the future and building
abstractions around it makes sense.

>
> Artem

--
Cheers, Lorenzo
