Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712D23D3318
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643141; cv=none; b=ehDjGeau0mWdx01S23XKJ49sdPi86QS+RrRJdkp8wAsYz+BF7wtqRSQh/3orVLFYXp4rfM/Xk+ueryd2DI1C4bN98ip86yVE+fDl6Vl8Sjmbcm6rfX7hRQF0MK4/Ec8yfWllkLSkLcHhNH9k/5UwukCnAzVGcLHzvFEpgMycteM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643141; c=relaxed/simple;
	bh=VcteyUEPg69zFQVEYgZE+Zkx1ffh70br8qSfWl03BfI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qzmLsRwb0KAg/ZcGxW7FMIzzvI0IyZcmmJaEbdGtjK85sLATmcc0bzoryeHa6KKrEodoUn21NEfKAQRd+A9W+WOjAzta5Dy8ypSPH2vdB64vX18cXJpq5IcBdi1VWrw8WOsUkmtfquyFIVX7ZpKD2WIiinF+mtsrHzLR0pcxiys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VP4N8vmr; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VP4N8vmr"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2192261d79so498191166b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787643138; x=1788247938; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gc0l75ZBOgJa/54BUKdQtQYXjBIwPQDc3JRV2G9xqCo=;
        b=VP4N8vmrlmxtGKcyRngsMZJLbTgdrG/2S0xUIg8Yfl16CQNrUHDwqzdd/DWezhb1wt
         mpx4g+cz/va5TkPzG+2XwipM8reul22tc0xTNknRBxiDwpLGfdmUimwNkqTnn5GK6TPd
         dgoKLsdF+OLg39DX5g+8d8qSsBbrq5xBb/q/ESy3vP3PZ8OYQh7ZVhnue9FbUH32Yh1T
         GxooGLKUkatNUz4Tlq8KlD2KhfHoLusqMp/AW2fzUTMEuHTFq5wRQVGo7PopywCLxhkf
         dTN7NSHmOTKk0NRRb4JfB4tu1o5Xx3Udc3NecZ5gwxzXEk0tNyDhXiJcN/XzXz8SHBNu
         7ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787643138; x=1788247938;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gc0l75ZBOgJa/54BUKdQtQYXjBIwPQDc3JRV2G9xqCo=;
        b=Ah/MR6Yqk8QIC2T+sP0yw6qN06PhW//9W7sTMF+O0M9CxeIzKdYQaoEz146/+24W7k
         ITorjFdnrkScuLLHaMt4xiQvcm5xrMYnbz9I2rwQsNMCu1pMmETR6BHPWDNQRncUUEVX
         1dzHZeUKCqsFL35PwKQ0tOugQX3YWlSOVORP1rveeu/ePsFT3htQuAL8FTugEWeoYSLN
         xWu4PpYjH2UMCCsFlDkrPFDGHmeNR7qNfNox8jqLd9oDoq4kZv+ND1VHIZ1OZ07p0Bfm
         MizD+jRzDbvLDswl0G/lxY16p3oJEey/fMRlj99K+SiZoMfY3bjTi0yL1uGo43SWz/y3
         bH7g==
X-Forwarded-Encrypted: i=1; AHgh+Rqeq953+UAKmuk1o1DCGlOkLv7zeUqpSV2GaQqEsOH2e5Y4iVotsn0EVOxjqCpU+cQ6mkX5O7x1xaNB2nlC9w==@vger.kernel.org
X-Gm-Message-State: AFuF++mJXmq2SU7h3kzEyJbV2T2LK94cbdSS225f7ZYTsho7BrtBO6NL
	gJh154RaKQIiBn3oX+qq8jn37j+uJ3qhatAyUbZIpjdWFy2GXmuviIDeGFtotK54HDZApAg8XMz
	Oe2UuE5bzZ2OcZ0XIng==
X-Received: from edwy24.prod.google.com ([2002:a05:6402:1358:b0:6a0:3497:f2f6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:52ca:b0:6a1:4fc7:94b3 with SMTP id 4fb4d7f45d1cf-6a5c40cdb68mr5068957a12.1.1787643137356;
 Tue, 25 Aug 2026 00:32:17 -0700 (PDT)
Date: Tue, 25 Aug 2026 07:32:15 +0000
In-Reply-To: <20260824194808.216021-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260218-binder-vma-check-v2-1-60f9d695a990@google.com> <20260824194808.216021-1-iprintercanon@gmail.com>
Message-ID: <ao1E_6yo9hE17e2E@google.com>
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
From: Alice Ryhl <aliceryhl@google.com>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, Carlos Llamas <cmllamas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

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

I have a draft for the vm_open callback somewhere and it's still on my
todo-list, but I'm not actively working on it right now. I'd be happy to
let someone else work on it, but it's somewhat nontrivial, so perhaps we
should have a call to discuss the design to work out the details?

> One design question first, for you and Lorenzo. f_op->mmap is
> deprecated in favour of mmap_prepare, where a driver sets desc->vm_ops
> instead of touching the vma, and the Rust side only has the old mmap
> path today. Should the vm_ops abstraction be built around mmap_prepare
> from the start, with a Rust mmap_prepare hook for miscdevice next to
> it, or is landing it on the existing VmaNew an acceptable first step?

Lorenzo, where can I learn more about this new mmap_prepare API? What
are the main differences?

Alice
