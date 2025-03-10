Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E12206A4
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598634; cv=none; b=YVlEzPtNVyhbjMVI3VZBkqed4Yb4Ep9dnZ/FVh1jMIYTGgfRr68fphucF7lmetfz6ILucHxL4Jnq6zk1fwjeR69rsIneMERNayrdfOZhlvhFLh05Q5w5b16S7r3v0paFwxeAiTHLP5vD8QLCd7d/0tPYAH+xRIePzoVGuRLhk0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598634; c=relaxed/simple;
	bh=NEZwdAcp8NlpW00clPwspaKYfG6ub3nrSf1XaFem7RY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LT+gTGlcdFCOS60SDfBVhQMPvKRcHsN/kk7Tw/ZqqtTlQDFVenMNVcStOSIf/kPGFonupceO5N3nwKzoeLUv90zL84p33mb8Uk+3BvCFJYVor+T+x+V/u3IJxGCUli4O/OP1JmqxUBsNgfUrjv01n8pdHhIT6/8xfReBaq66cTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mb9pilgW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mb9pilgW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so4142325e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741598631; x=1742203431; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Ey6YaeoGfhw7Uky6jLzAk41/zVhd3SqiNOIt/MFXw=;
        b=mb9pilgWs2SmHHSTcHGNpCYvg2a36DTtF8ICyOJWhOeAS9AAqE/URWawfKX4au8WLA
         9Knff1atYRGxZo6WbacAI5dqIKWwLGkbqrTgN5kibWSUM8Z/zb79dq3Uku5v1EDsBM1M
         YyPRy1++KHs2Sk+j/NJB9mQSeFqh/nX8PK6xBCOzgtxQqQqMRzutf7GsKll+Abzcbhaa
         rsnZim8fBd75RIsCpYxa2wm37tzAvqdRrgiX6ZSNLx9x/xtKdga60m5nSzBYTSZcmw3n
         lXHhQXiRa5DppCSjQR6m5g/YrF3x5wgtnUEGATkyIprpuNDTtHtXQZMnEeS5kQDyPW6q
         689Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598631; x=1742203431;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Ey6YaeoGfhw7Uky6jLzAk41/zVhd3SqiNOIt/MFXw=;
        b=ZNeZwGn66W0UjA0F4nsXzYBLL39YTglM6SLxHv8jqsW9OcMce4xjC7OO2YHmMKF2Aw
         vbyO23QRjXHdFcEtMih6eRbTpx/9s1iK0uL/WO5kpn3wXSTKgLxmQfZ2suQMaZWQoDP+
         jFhJrqP2+nMggc93slHA2POCwRC3APKo+PZQ7phziRU2SVUlLNo+kiNlh6E0qFpZtSK8
         qFrNjSwbyEdO/R/IArwfVF+WSRUMQ5aZItunWc5oZA7/GYIkJ6+rzfq0yW8wqlP4ArUx
         KG/TVbrKm3eSslY7CuDLotce/kauFj2MrpnFm6y2fNJPQ8bm/i25Ky0vZ0gmwe7qAWLg
         r1RA==
X-Forwarded-Encrypted: i=1; AJvYcCUNjpofNLFrTaJ2AvJkv4jhy4g5UAE87xxPnRNmJNycLWPm6tLInkyWHxpi3mKnxdeRzDoJC8I+SNFJK2Dzew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsm5U9IIpf8QaWEKy/r3foi/aLY6MLnU75mlOVs7DergyOmdg5
	xNpm6zV+O9BxkfLdVfbxxQdVLJx6VIVD8Y1XEd+1DtHyhiHMesDBIEBugD5Y+j7Yvu3ACSW9nSO
	tLzR7xH+IXORk1Q==
X-Google-Smtp-Source: AGHT+IFEp2UnHtcUmo45Bf247g24s/1cJE8+nXgglrMw+cHeJ5tpiviDxAGlDax67viBnDjPJP3vk0eAlr8/sB8=
X-Received: from wmbfm24.prod.google.com ([2002:a05:600c:c18:b0:43c:fae1:812a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc8:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ce9f7da7emr48713545e9.13.1741598631433;
 Mon, 10 Mar 2025 02:23:51 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:23:49 +0000
In-Reply-To: <202503091916.QousmtcY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250304-vma-v15-5-5c641b31980a@google.com> <202503091916.QousmtcY-lkp@intel.com>
Message-ID: <Z86vpQBMYuonWsM_@google.com>
Subject: Re: [PATCH v15 5/9] mm: rust: add mmput_async support
From: Alice Ryhl <aliceryhl@google.com>
To: kernel test robot <lkp@intel.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 09, 2025 at 07:37:54PM +0800, kernel test robot wrote:
> >> error[E0425]: cannot find function `mmput_async` in crate `bindings`
>    --> rust/kernel/mm.rs:143:28
>        |
>    143 |         unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
>        |                            ^^^^^^^^^^^ not found in `bindings`

It looks like the mmput_async function doesn't exist at all when
CONFIG_MMU is disabled?

I guess I can just make the MmWithUserAsync type not exist at all when
CONFIG_MMU is disabled to mirror that, but it seems a bit weird.

Alice
