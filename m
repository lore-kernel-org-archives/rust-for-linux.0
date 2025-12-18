Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21317B425
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045226; cv=none; b=O0qzclaHdf0ogdDLy483DbAlJAVC6/EZ8LcgMZfNKxAMGkUfKRUDk2xzjX17O0dC55PKXJeffLIxFetkNeD/+k5NJlqk2bRUbU5IPSS/j5zGRRU0B8dKZSDc6F5g+IX6LFKhsX9lrLUagrF0QfqkrCQ7GhRFt2WLOy2PQpzGtxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045226; c=relaxed/simple;
	bh=Ni1QS7SkmeOk+2RpwNu0by3JH/+6qH7OcFryLnjFRJ8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jMuERI2+SDv8vo1HRWfRabv4DR6SZr2BGG2mgjLWHc0+8SNyQk5T/16nxgB1vj2KcVcaWfzRlP5MfbqV8amLHJcg9XyhV3dt90cIGX1hE+7x7SmC8Qttz0ie2gqtUaOilJymkEIdK6GPtldW52haW746nkvdSiIm3dX5Cxe1Cfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZ+fkPI7; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZ+fkPI7"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430f433419aso238460f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766045223; x=1766650023; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qg1cGDg/XcEy9MbpLdRERFNOIZJLJnBwZuR0lpXVu+U=;
        b=yZ+fkPI7dlfZZu9aOyB7roxKOMCnbfOwoolOSZU0lY2Bd1cNcXrNMLVSjULY8VYyZz
         qrZxqqb2tAUn80CtC7s4QSZXTnN5TkEeNhzYVLRuJ1QpKE16wzEB0rejLp2gBHQ5Sqbf
         eHfbxTnj22+WIJg0BVtivAr/QF2tPsw898UTcCodEub8bMXWyITGZpNTF4w0PJW/5935
         t3jC5N3oKxVEdWnZMv9HFE+henMzX0QKY1tNfWW/D7c/EcCWWQjxtuwPCp+kAfZTe29x
         qJyOyHBqnovHn/VaZ0hm5uvgdYOY2lRJeVndZIBXigxtb63lEuborGrslRort0k54lbp
         WoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045223; x=1766650023;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qg1cGDg/XcEy9MbpLdRERFNOIZJLJnBwZuR0lpXVu+U=;
        b=o9IvF6JaOsoQj/w2dJEy+kiLqB5jXE9xqgeru+aEKnHCUe5OxNBqmhY5p8qTQpk3rD
         7yo1Fx7hvNCtbTiGOxzqjK69iuSiawV4PYHzhWoknME6FRkFoHUsX15dnZvmoMDeTZOm
         LIdZNAnLF6mfUrgDU9DxuIB0viofZ7x9nbqjiD08McX4b5EpUnMTztqJ3W6XaO5stydv
         e09UNflYhMAqSC/mSgzAjMEGy8SYKI/STr/J7wlslJEgpqxb8bLjzndgtcPk0c+plaZq
         IUhJe0nFLAT8xsQLxfgUWdRl11Ow7l02185frallpvoB4MJY2lHfOg+KPOhoPVzM6RKU
         Zkyw==
X-Forwarded-Encrypted: i=1; AJvYcCUVRz07y5uwad1JFnn+dtCnReRz8vQLGIYT9LssOFlOXQfipdUhFlOlAFUVqegeex1C+iekDEfJTP3uG6gnzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzly5CnOSTz0fIcQQyn7lWSrN/e8NsebQ565fhXdp7yV5bbkI7O
	LOQkoRi6t9f5JbTWlzREVNsGrfr55uNsnWzdYnUcqOJ1B137u/cdVcfYwSPgAiBh0nO5CAhcU/D
	ywn7OW7Sug4M+J3GMrw==
X-Google-Smtp-Source: AGHT+IF5w6LVSb0ax3/S2dVmFVgIUXrG0XjB1uE3WTrfcwrF/0IBI/cW/AbG+aiSiwbTIiCF7VOsHMCPE5It4r0=
X-Received: from wrbdr16.prod.google.com ([2002:a5d:5f90:0:b0:430:f277:2ca0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:430:fdfc:7dd3 with SMTP id ffacd0b85a97d-430fdfc7f4fmr12849438f8f.50.1766045222701;
 Thu, 18 Dec 2025 00:07:02 -0800 (PST)
Date: Thu, 18 Dec 2025 08:07:01 +0000
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com>
Message-ID: <aUO2JZR6soTBLtLQ@google.com>
Subject: Re: [PATCH v3 0/9] gpu: nova-core: expose the logging buffers via debugfs
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>, Matthew Maurer <mmaurer@google.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 17, 2025 at 07:39:01PM -0600, Timur Tabi wrote:
> GSP-RM writes its printf message to "logging buffers", which are blocks
> memory allocated by the driver.  The messages are encoded, so exposing
> the buffers as debugfs entries allows the buffers to be extracted and
> decoded by a special application.
> 
> When the driver loads, a /sys/kernel/debug/nova_core root entry is
> created.  To do this, the normal module_pci_driver! macro call is
> replaced with an explicit initialization function, as this allows
> that debugfs entry to be created once for all GPUs.
> 
> Then in each GPU's initialization, a subdirectory based on the PCI
> BDF name is created, and the logging buffer entries are created under
> that.
> 
> Note: the debugfs entry has a file size of 0, because debugfs defaults
> a 0 size and the Rust abstractions do not adjust it for the same of
> the object.  Nouveau makes this adjustment manually in the driver.
> 
> Based on Linus' repository, not drm-rust-next.
> 
> Summary of changes:
> 
> 1. Replace module_pci_driver! with explicit init function.
> 2. Creates root, per-gpu, and individual buffer debugfs entries.
> 3. Adds a pci::name() method to generate a PCI device name string.
> 4. Adds a lookup() method to debugfs, so that the root debugfs entry
>    doesn't need to be a global variable like it is in Nouveau.
> 5. Makes some updates to debugfs core code.
> 
> Alexandre Courbot (1):
>   gpu: nova-core: implement BinaryWriter for LogBuffer
> 
> Timur Tabi (8):
>   rust: pci: add PCI device name method
>   rust: debugfs: add lookup contructor
>   rust: debugfs: add Dir::empty() for no-op directory handle
>   rust: debugfs: fix Dir::scope() to not borrow self for returned
>     lifetime
>   gpu: nova-core: Replace module_pci_driver! with explicit module init
>   gpu: nova-core: create debugfs root when driver loads
>   gpu: nova-core: use pin projection in method boot()
>   gpu: nova-core: create GSP-RM logging buffers debugfs entries
> 
>  drivers/gpu/nova-core/gsp.rs       |  66 +++++++++++++++---
>  drivers/gpu/nova-core/gsp/boot.rs  |  15 ++--
>  drivers/gpu/nova-core/nova_core.rs |  29 +++++++-
>  rust/kernel/debugfs.rs             | 108 ++++++++++++++++++++++-------
>  rust/kernel/debugfs/entry.rs       |  49 ++++++++++++-
>  rust/kernel/pci.rs                 |  37 ++++++++++
>  6 files changed, 259 insertions(+), 45 deletions(-)

Adding Matthew as this touches debugfs.

Alice
