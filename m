Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A5392C36
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824348; cv=none; b=sO87nNzrp0NiHampDNmizOhDgVc5Q3fJbq0XBcpxDOckvyo7U62NG9Svqtde1Ro+/TVH632Xkc5Cv4S5WPkvMRrr6p2CULqwSIIF1slIUm6rCMFWNJHnG2gEpyrgwnVjqGPzGhbdAy84PUY3+2b7H3W7/eSEG6Ge+a/idav5xz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824348; c=relaxed/simple;
	bh=v6SC+ajia4ywcXC3D+3PFfCLKayQwMnlunvdHFv1PYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qtDLu8RsOVXxiFwRRwBMttrUMeAOKZfA0LuJXEMKQZQBESoTQElS6uvxDTV3yaqtym2dP3uacrR8NH4e+u5mOogs9FQ38V62o8nHbob4OeSdFijZw+5g4br0M7b4FBOJ5JjG4dvSGwZejWc0ENjGtgklUnnsLYh0YkMlAjtgTYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GmmurQf9; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GmmurQf9"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4853b00f9f5so69743125e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773824345; x=1774429145; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MXY9EHBXCnPWVfnYnREpBujBITTjaoQ0F5qTzNSzUus=;
        b=GmmurQf972ft6P/cl/PgqarKeOw5/yelcD2bc4xGrycCsV9DjatrA43y+1kYah9yHm
         iuQpO1fKOvDFAxj/Sh3A67ZBgMRH4odNYUy5oZh62e241sGknUplqeKb+QDya3K+8ok8
         MHc4RcAqaLDqgGC8RYOpYObP4GKkdCljXXeYYDtyL8ivtJNTiLCHg/x++7wUQCnKPBzX
         9ngAvvZEtpe4D3rl9cPJn/RytOTy1ZNoeDt7hbbZgC2ZbF/GPCm7cxeNHj8IV3wvcYE9
         pSzl6E0toXtl/Pb10XGHzauFdM7JyQXVNyNwF1KGVBkRFFj5k/erYHmOoO6v7cMSim4z
         FVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773824345; x=1774429145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXY9EHBXCnPWVfnYnREpBujBITTjaoQ0F5qTzNSzUus=;
        b=gAQw5pMC0rIvTc9ROIeUAv0IN2tkZ8zEOLCWFdBqEKzH8nspI9A7Z/FXG1UsUQtVuV
         rNWg+TCj6a/4VD22B4pURyGcZeVSCay+W6ArXKthP7agJKNKFHaQ0FKbhzt2fAbg6cOs
         FUpLFjqdZb5YWKybwCVfeFpsLFeC62T6zQkyB1szJ9AGUx7g87h6iPeb51orcziai3nU
         EKqcIUdoeOlDt9/E/3AuO2yiqe88KAYcBen3+6yEfJ1fdpX44PHV/kuefi4C7RtHG5xn
         mBK9q5XhqUX5HphBfkxcNaKy4cFX1WUVHvkYrogg60dKXSBXLKv/5Z5rRARGGKGiaNb4
         XHVw==
X-Forwarded-Encrypted: i=1; AJvYcCW/V3SbRDvbFWP21YHn4Uza/uyIu3X89kgNGCrogpuOkP3Nh8bqR0YI5UIjEWgpaOYDjYOQtpIe7cI5jNagAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Qg7UjhbXvelUdD5sr5Tu++PFW2x2+6pA9QqVr449BBDOmFsS
	XyO8YyJ+iWb6m8m5jtHREB9eBAjEwJAhViKYOZzhoGCl/7YYBWwHGYPwPhan4pxHiCei5Bb7O7V
	BKzYMdApX83+S6JsIWA==
X-Received: from wmqe14.prod.google.com ([2002:a05:600c:4e4e:b0:485:3539:bc05])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a20b:b0:485:3bb5:92cf with SMTP id 5b1f17b1804b1-486f4422300mr29381305e9.12.1773824344660;
 Wed, 18 Mar 2026 01:59:04 -0700 (PDT)
Date: Wed, 18 Mar 2026 08:59:03 +0000
In-Reply-To: <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
Message-ID: <abppV3e91iVzplcv@google.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 17, 2026 at 04:18:46PM -0400, Joel Fernandes wrote:
> 
> 
> On 3/17/2026 4:17 PM, Joel Fernandes wrote:
> > Add a new module `kernel::interop::list` for working with C's doubly
> > circular linked lists. Provide low-level iteration over list nodes.
> > 
> > Typed iteration over actual items is provided with a `clist_create`
> > macro to assist in creation of the `CList` type.
> > 
> > Cc: Nikola Djukic <ndjukic@nvidia.com>
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> > Acked-by: Gary Guo <gary@garyguo.net>
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > ---
> >  MAINTAINERS                 |   8 +
> >  rust/helpers/helpers.c      |   1 +
> >  rust/helpers/list.c         |  17 ++
> >  rust/kernel/interop.rs      |   9 +
> >  rust/kernel/interop/list.rs | 342 ++++++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs          |   2 +
> >  6 files changed, 379 insertions(+)
> >  create mode 100644 rust/helpers/list.c
> >  create mode 100644 rust/kernel/interop.rs
> >  create mode 100644 rust/kernel/interop/list.rs
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4bd6b538a51f..e847099efcc2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -23251,6 +23251,14 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
> >  F:	rust/kernel/alloc.rs
> >  F:	rust/kernel/alloc/
> >  
> > +RUST [INTEROP]
> > +M:	Joel Fernandes <joelagnelf@nvidia.com>
> > +M:	Alexandre Courbot <acourbot@nvidia.com>
> > +L:	rust-for-linux@vger.kernel.org
> > +S:	Maintained
> > +T:	git https://github.com/Rust-for-Linux/linux.git interop-next
> > +F:	rust/kernel/interop/
> 
> Sorry, I forgot to add an additional F: for the rust/kernel/interop.rs file.
> Danilo/Miguel, do you mind adding this when applying?

I think you should consider a mod.rs file to avoid this. It's tiny, and
just re-exports submodules, so I don't think the "mod.rs name in file
view" concern is that big, and IMO having files related to interop/
inside the directory is much better than having them outside.

Alice
