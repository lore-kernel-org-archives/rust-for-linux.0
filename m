Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63723A7855
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 08:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450294; cv=none; b=tywCuBns8az5bIu29IUSx4q5+u4LFx66hFQIKXEHI/w5CapP0OqFXhOLeb8Qho8CNYRCdMZbBtfJCzsot0n/IZ/FFbO0+5Zts+vKAOvYHjHf1+5ZAPGVkEbKiGR569cr9s4w8XJx+OXQuIq0y6hQbY0g1ylh5Hn5t6Wq8YX5EJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450294; c=relaxed/simple;
	bh=ko3LtTan+YBnb5IBwV2Fax/nNK6MsboBYeqY18CuzuM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HBusq6L6zW/nDE9TM/2BYYcZoELTsUgNVcyTezLZdnSSjXebiU/IVbRU8a3/NAqmdDVCX2aR2QcDfq5oFjB+ryBWZ1snWz1LcELomqsZ56eNkEHDZabgZFNxtc86WVsmofmVooo2ScqFg7VASt6oowWEox9GM/y1UHoJpejVqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJ3g9kL1; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJ3g9kL1"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-44696b11265so2192986f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450291; x=1778055091; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lr17Jge9GgkiGKrAiGt8x+/cqgjgJIF0Kac8aOzuZk=;
        b=iJ3g9kL12Z0L4R5lqmoMKyi4LFow6eWuSU44OG15aQ5C5eSKJR4enpXyDqExypXVRq
         JJxmyIQZNPtMJHPHxx7x2d8/jWH16OiLJJVaOff3weMoY8Ol3evQb1+Avc7hRK7hz22s
         QQs0BZsNaNLb52T46eo0iX4VtQOMIDjbW5MB84YDncap3Jt9H0rHFfVNEU2rtKQSY01F
         A87BmDmLk+JTRFX40xU7xxxxrSBK2PpM+xVMOh8RJTEP6P/2PXiO/OwI0cJCPKMi4auo
         3FF0e/xaxO0XuFeu+PcRv7c86keNK9EoZS/vrllp5/GzdvzaiGJNjR0nZrmVVP3FH/ZX
         qNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450291; x=1778055091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lr17Jge9GgkiGKrAiGt8x+/cqgjgJIF0Kac8aOzuZk=;
        b=cE0/eta4jPqIy7GICnbcIutCrkxvU4MtjO29L49vUP2AxxI4xQik0NLWEANsi4mvZ1
         XkFDKX+excDL/kOtu7ljWG1A17W3xCBxUnIyRyINex86tpBWJ9asAFjX4ruhQdWX0Vys
         S4LZzXS8MEe6+tH0hBhZ8pDjy8B02JKvK+GeorOld/SZxV8Uu0mM/6qcwSEA7ybmjrOM
         +jZy4N9KEXEFBzsPCXXpUgeqlCx+Rd/c8Sv3uSgKkKefzZPOfzdIVjHHNFDyLkq/pBtN
         FJhj825YdvZ2YrNReqcu632kJXr87mh6W8sl3M5AjsxPveJhJVjwMYZdRWbxS6FyvV4S
         GhZw==
X-Forwarded-Encrypted: i=1; AFNElJ8x9sFlixpJ/DkYHrlkzMbKIK1lyTQVuttMplmNvIs/ZyEMrAEKcoQKuviPMN0UVFlYpbDkjiLIudUp8iUfnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGB8xBDjJpUT2hDqJz8pNQPp0Q66xNFEYevXo1Fy1UzuoZK2GJ
	MCuIguS6nuKQPPo4hFWSnwXpunBA/IAFqU5Pg2P3ukUzlzfNpjauRtFXSPGddLSwknmZbL9TqHp
	32d63nd0nuN7uScERgA==
X-Received: from wrhm3.prod.google.com ([2002:a05:6000:1803:b0:43f:e56f:629b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186d:b0:43b:3d02:7806 with SMTP id ffacd0b85a97d-446494ea007mr11517494f8f.28.1777450290684;
 Wed, 29 Apr 2026 01:11:30 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:11:29 +0000
In-Reply-To: <20260428190605.3355690-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com> <20260428190605.3355690-4-lyude@redhat.com>
Message-ID: <afG9MTFxCbKE8OOZ@google.com>
Subject: Re: [PATCH v13 3/5] rust: drm: gem/shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	Matthew Maurer <mmaurer@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com, 
	Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	linux-media@vger.kernel.org, Shankari Anand <shankari.ak0208@gmail.com>, 
	Benno Lossin <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 28, 2026 at 03:03:43PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>

Needs Alexandre's SoB.

> +/// Private helper-type for holding the `dma_resv` object for a GEM shmem object.
> +///
> +/// When this is dropped, the `dma_resv` lock is dropped as well.
> +///
> +// TODO: This should be replace with a WwMutex equivalent once we have such bindings in the kernel.
> +struct DmaResvGuard<'a, T: DriverObject>(&'a Object<T>);

We will also need this in GPUVM, so I don't think it needs to be private
to shmem.

Alice
