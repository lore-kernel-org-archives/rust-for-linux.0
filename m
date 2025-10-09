Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118DF2C2340
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Oct 2025 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008674; cv=none; b=LpV3cwXtjLv9mr1mdmF4JQEpGHwMLLGDIqEUkizwnAGvbLKR2h825AqcflA5k4kVY6waa9lWPNF6r3WMTa4WGc1mKqtclhPrLsKO09RMjGBXrFJidteX6GTgc9o+5JzZHgO+mzqTh57Utu/nBZpbjGJ2Ui29MvHLoA2Nc95zeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008674; c=relaxed/simple;
	bh=WCD/CAfB1G/FRBM8fWx7yMrkRvfIIG1WNz92HG5xPeQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MYLRr3fbgkbH+zaCiNjfS17avFzGzhAwYBrq0AD3Moe6nZRdJXTGmosvcw3+lYh+e+ocwstE9ZD9Lc7fiT0wyAu/2/k7uKdIgp+ZHP47kNSj+vHTkVh9o99Mto7k3KdcF5B1QVcu3Zmekt+EvVDXG3e5IdQ2YoZJTUcIE5+ht9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/Bh1hRY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/Bh1hRY"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e3d9bf9e1so4985465e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Oct 2025 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760008671; x=1760613471; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9V+rmx7EVh5VI0c3HgYqM0kYENxMSiiGZS93FmTbvHY=;
        b=h/Bh1hRYFwCy//G9bitEyswKpWz6jclO5gwlOMlAErhNWutwR9pMiUFhDEVplEva+O
         yNh7RrDWpU42iqZp07U14xmPHz4aLVBTWfE4doBgLL72rjH7tyEwOTlG36gNhMdSv/5o
         7W1PwvphuDrKEpSi71RtQD222H245pzI2OXRNd6/fytAMqlEIt8UZ3g8zpEjO42is3wn
         t6XJVuuqEqyGdrdt9z8T/URUZwhHL1Ya6wlg3zXi4hC24Bzy0tSb/Y6KAaJ3WzEr/Ja0
         JhKpP2wV4mfel41RUqwWO6YOz+dr6lhJYoryiJglcK/W8CEMTJQn3oxxTXWOzotD/xy5
         wEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008671; x=1760613471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9V+rmx7EVh5VI0c3HgYqM0kYENxMSiiGZS93FmTbvHY=;
        b=VJfVJUcZn2XqYCRpMR7Azou+eC1AV38NK812j4VmAiLCLqzqrN3BwpbzDQ/ARI9yHG
         D5KLB+jXxm7kN6nxbzRfG/uc6A3M5/iROUSX8hJJQl8ZO28N2D13Swpa56K6pkE7OQaj
         p8XJyo3Q99mAnM1IUY+GcEoYPU7LdDD6XoDPy7/oZe6nm3U0C+NOvAMJY+MLVdqdwg1T
         nBJj4lPDpkcZaKozDND3lLXbGScYdbqqjYYEngVqIVJFzhxkii6HWt/QqsUCqZ71QF+i
         pLYptPT3N0hu9+uPQvvUBicRryFL7Dmyjw7zljJckWrm1hAO+zpLunVqCpxgE91HYHmG
         vsfA==
X-Forwarded-Encrypted: i=1; AJvYcCXVBPdo22V0BDGZw4ap++GUe68UIDn6w7tl4AlbXqAxTPaYRSiU+pchFPC8EM/ecVjjgW8n4Yoa/kgjqSulJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1sm06yM+dl+J8K4zSCmARZrPHMBeblkuo9jUxP2ll/D8EoH8a
	5kkPqkT5qNqLFA6/v9sP97Rkyoxsgi4miBCW36Y6M94MPBBNYy4BTB2efFZKdcc0LlBtlpNilf6
	YfhAO5qbaMLmZ4s6R+g==
X-Google-Smtp-Source: AGHT+IHQw/K1TucPKWkYddnQPYm60dywH4XygHGaugmTTi9j0hJVxv8XQQDUDwaI/iz2G9F3qXxpGXrzXS4lbaU=
X-Received: from wmcm4.prod.google.com ([2002:a7b:ce04:0:b0:45d:cfa4:ce19])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:502c:b0:46e:3d41:5fe6 with SMTP id 5b1f17b1804b1-46fa9a9ebb8mr46744985e9.9.1760008671266;
 Thu, 09 Oct 2025 04:17:51 -0700 (PDT)
Date: Thu, 9 Oct 2025 11:17:50 +0000
In-Reply-To: <aOaJlHEPzHcAdcUx@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
Message-ID: <aOeZ3ho6SHjmaw_2@google.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Tejun Heo <tj@kernel.org>
Cc: Marco Crivellari <marco.crivellari@suse.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 08, 2025 at 08:56:04AM -0700, Boqun Feng wrote:
> On Wed, Oct 08, 2025 at 05:15:54PM +0200, Marco Crivellari wrote:
> > The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
> > respectively the futures replacement for system_wq and system_unbound_wq.
> > 
> > This change introduce system_percpu(), that use the new system_percpu_wq.
> > 
> > system_wq will be replaced in a future release cycle and should
> > not be used.
> > 
> > Suggested-by: Tejun Heo <tj@kernel.org>
> > Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> 
> If we were to expose the system_percpu_wq to Rust, then we should also
> add queue_work_on() API to Rust, otherwise it's kinda pointless IMO.
> 
> PS. We can use the CpuId abstraction:
> 
> 	http://rust.docs.kernel.org/kernel/cpu/struct.CpuId.html
> 
> and have an API like:
> 
>     ipml Queue {
>         pub fn queue_on(&self, cpu: CpuId, w: W) -> W::EqueueOutput
>     }
> 
> or maybe a different new type `PerCpuQueue`?
> 
> Regards,
> Boqun

How is it ... can we cleanly separate queues into those where you must
specify the cpuid, and those where you shouldn't?

Alice
