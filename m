Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7932B981
	for <rust-for-linux@vger.kernel.org>; Thu,  7 May 2026 07:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138329; cv=none; b=s7lm6slT2xf4Se1gZmyJQ1VK77SjgepB9dQmsb7nqeT+iTYrBQJd7mDRW0spwKFK70ODtderKQ6tZop3hMuXL/KfehRWYSv7Yu4bChkfYpCBhWEjOnAdsNmOIAyf2YuejsIaUdU9Q0bXefy1O31VxAdct/n0Lxz6YI/uPtg46Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138329; c=relaxed/simple;
	bh=1ArEdGwJd4akLgQ+SZ6Un1i7sYoRraUekLjZXcwXaWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UjWYA89fDsmXr4DZqm4KqPMfc+Hsug/UErU+aX//ZEHjQEkaCvwO0ukBRj4mh28y5PYZT88wH0nnWrpVMC7mN7t2OYSmtQKHpCfmJZmOq7fBHm/qfoAD2tEZxWl7CxNhtf3tmqUWLgA2mRplA8x3wblYUV75daPrnN65NPrlF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jc36E/pG; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jc36E/pG"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4497a0e3acaso431877f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 May 2026 00:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778138327; x=1778743127; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=STH36cS/F87DhIyaZ+8OVzfArrGCDV+Ojd5JS20sYwA=;
        b=jc36E/pGmC39UkJUJNndAyekhU6asksxweNoIOt6W9GwjHdiKUZKVEODySSxDoRSXj
         EemefrI5O/A+X42a78LLcrFbrXCO7sUOubUlk+dKts2hPN/sfL0/gT+VF6ACn3lyvn2E
         YrNbAnNyYgzjmGx47LGPazloL7S36M0a9Qe8Q/Bo5PAs0PIvwppFUDXOBWA4YNLamr2h
         lDs5DJtYBau7z6hGXwub8UR/VJBa0KwR2s6zWSmOlGN1ZsyAFlPJa/yAmx8M1mV2cBM0
         CN1hizGVuKBLQ0c6j4x9AMFP/iCKMCxdflWCNHhYNLFZ55EE0qT7JVMDmu2u/zsQ/+8G
         LpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778138327; x=1778743127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STH36cS/F87DhIyaZ+8OVzfArrGCDV+Ojd5JS20sYwA=;
        b=jBtJ7krT4y80nDFJzwiuJl5yG2mIFmB/eUeG+q1vilyQn5rSRhPc9fMvkKGaIJQb+a
         JSt+wuGwWQzOwzpY6rVjg5F4vQctxuLa4mi5uZpErUYnM8rdRZ4DaooXEabXjBVIYZxt
         eav34y6Z8DPNrwKFsD4GWYhSpqyRlV7poAsKTnVLzHGCIXuNKflSxC1Ktd7RGVX4dKc+
         zGc5OGimmwV+pqhdl7fkEDapbFSF6hSZ3X0qoznNkC6vCBzI+iirFnFDQs/FxlokvKYs
         Uq6HClWC3fhu1uRo9Sr8ieoh485GLo0vQKRpchWyEAVFNwBozHR+twWbkPIFVXbdJhI3
         /J1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9E0eQp+5Gvr+fWVKSG00y67CTmNQETN/QV7SCQ+GGm9Rwv+3e+dDalEShTpX7qxLnfynJ1SmHFvOj74UIR3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2PZ1+DRzBFhzQSNpwBpQfBJCku2wisFUFXnZDwMzlfbAeIxgI
	XoVbNvU62tIA8UcQnZ5rqiZ7EJacjklyyoay+QdyJ24xGu9Wq9WSQq8apM3Vv7vOyQyNVQwoq2M
	v7z4Ox3ce7A2HbAjvyQ==
X-Received: from wrqr6.prod.google.com ([2002:a5d:4986:0:b0:43c:f906:ae85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4381:b0:441:247a:e98e with SMTP id ffacd0b85a97d-4515ce1c738mr11025046f8f.24.1778138326535;
 Thu, 07 May 2026 00:18:46 -0700 (PDT)
Date: Thu, 7 May 2026 07:18:45 +0000
In-Reply-To: <20260506135122.GA1432412@joelbox2>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260506135122.GA1432412@joelbox2>
Message-ID: <afw81cVYyF6hRhkj@google.com>
Subject: Re: [PATCH v2] rust: maple_tree: implement Send and Sync for MapleTree
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	Nikola Djukic <ndjukic@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 06, 2026 at 09:51:22AM -0400, Joel Fernandes wrote:
> The C maple_tree struct contains a *mut c_void, which prevents Rust from
> auto-deriving Send/Sync. Following is an example error message when using
> MapleTree in nova-core's Vmm.
> 
> This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaCore,
> causing NovaCore to fail the Send bound required by pci::Driver:
> 
>   error[E0277]: `*mut c_void` cannot be sent between threads safely
>       --> drivers/gpu/nova-core/driver.rs:77:22
>        |
>   77   | impl pci::Driver for NovaCore {
>        |                      ^^^^^^^^ `*mut c_void` cannot be sent between threads safely
>        |
>        = help: within `MapleTreeAlloc<()>`, the trait `Send` is not implemented for `*mut c_void`
>   note: required because it appears within the type `kernel::bindings::maple_tree`
>   note: required because it appears within the type `Opaque<kernel::bindings::maple_tree>`
>   note: required because it appears within the type `MapleTree<()>`
>   note: required because it appears within the type `MapleTreeAlloc<()>`
>        = note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to implement `Send`
>   note: required because it appears within the type `core::pin::Pin<Box<MapleTreeAlloc<()>, Kmalloc>>`
>   note: required because it appears within the type `Vmm`
>   note: required because it appears within the type `BarUser`
>   note: required because it appears within the type `Gpu`
>   note: required because it appears within the type `NovaCore`
>   note: required by a bound in `kernel::pci::Driver`
>       --> rust/kernel/pci.rs:294:19
> 
> Implement Send and Sync for MapleTree. The tree contains no thread-local
> state, and all shared access goes through the internal ma_lock spinlock.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
