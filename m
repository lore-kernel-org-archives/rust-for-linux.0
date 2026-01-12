Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0B22F177
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209419; cv=none; b=rDhqpgzxVAAwv6lEq6zVKeq78QsX0jAbei0zf7tJ84SLAqvA4Lj79tPhuj5fUtIuuF3+Of4c2shjv9b7O5yYkSnBjctYTuxDA191c1OXKdEBgbn73xDfaBmIlfF7J7swRU+hzRhNNvNw1jX9mnYanYHAHqhQmklMEYEZCcTVWX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209419; c=relaxed/simple;
	bh=XlQgmWHL+VwfIWYujX0gYJzwukWaya2m4vZeXZkne3A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lI/rEq5xPyJOM6Ij6rRDfYplNkJJPs3k7sQDZ5Ce2HDkqzVtEvfja66jSap1DDmIScnZwwIrQ2rkqx7Gh8Cp6VXEHNdOmipkJeoBo1VNO6tMZzxWf/v8TSS/iN3rbGAF2gC/TKNZ1BCuDgwkRiZ5z3m/Z+iK5x4Bjz5IPXHlCbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DKTRLgqb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DKTRLgqb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3c4468d8so39697895e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 01:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768209416; x=1768814216; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRATGLkjkJz5x2h30tkpyIcfPP9UF70VaNros8ZZEVI=;
        b=DKTRLgqbH0e+qBZZqC3CttlvpJbBbjFTDgWt/nSSSLcw35DEZjLny/5VhtjqoESEWl
         6ToLXFxDG+hk7UWBzohCnwZAivNywRMhMip9hP6cq9B6cZHdF2v/H75V2y4vMw70iVSO
         WrxF8D5AVqk53CYLtm092NTljCFMa2qHlPYjv+XcDj0ZH3/2XOUY8owItRip4w7nLca2
         g+dLxAUuPSwrj5BdPOST1C6uecJLvmuthewdrhMdIdNBIbODYNB9UmaeeIskOszxERo6
         X57RxlRCGl0psPYF/n4gNnUYWNKDcdsJOZFD+nBXJiDQ5CXJV5huA2tz/BQttT8wfqU/
         3fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209416; x=1768814216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRATGLkjkJz5x2h30tkpyIcfPP9UF70VaNros8ZZEVI=;
        b=l9DYdtWaOJE+LEhKNqBxAOU8yMp+raPrZbNP9UfpKH2NwZGh3JoW1HwzAVyZkt6mt5
         ctR6joExcUHzp+MvVokcJjyXJfkYke2uquwQP7RDoyyLm6zYf0ZPUIKJH4inW1eEg9ub
         wMFydfs8DGlSwY9MeZkywpveTiVb4G2MxS+yh4yKkYuQnrtuLsHFCX6uAeJj72c+AA2j
         51B9VqFCzyISBDApjdm5a8vjEzM+dx5ssbTS0YSt6+muDPefdy8ReD3ODgpYjQAyDBS7
         17ZWDS9QWgbzGPjDeyQTGW0qH62HUQXLi5+uR75XolimBZHiCz7kTaJR9ZwNmOooTg8+
         TrgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrRAaaDV8bL4KLr+kF+LQEg5Dcf5RBNkx6S69mdqjtVxhRI1y2Z43j7lPD/7CKyTl0hg/5DiQb/QRg3EIAVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyquJ6npkWaPqj1wLxU00UUldDY1kXtQ3m4jf2mMDkfz4MY5s1S
	5u+GBW4TVKwm4iOipmydG5hEvZR52cc718S5fPvk6x9lRJp/+FOwbesSETipJnQa53ycJoAJtvv
	iiKAs8GKP2KABBc3z1A==
X-Google-Smtp-Source: AGHT+IEJsGrY879Avt5zDpyar2eYMUART82nkkxZtN3Okf0x8F6X23dTn8urw6sRcy760yklbeh4TbmK9a6Ng4k=
X-Received: from wmjs4.prod.google.com ([2002:a7b:c384:0:b0:477:9945:466d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5306:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-47d84b0a992mr151351335e9.6.1768209416074;
 Mon, 12 Jan 2026 01:16:56 -0800 (PST)
Date: Mon, 12 Jan 2026 09:16:55 +0000
In-Reply-To: <20260110115159.2313116-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260110115159.2313116-1-alok.a.tiwari@oracle.com>
Message-ID: <aWS8B5KxrRtl5oK3@google.com>
Subject: Re: [PATCH] rust: platform: fix remove_callback invariant comment
From: Alice Ryhl <aliceryhl@google.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: rafael@kernel.org, dakr@kernel.org, tmgross@umich.edu, 
	a.hindborg@kernel.org, lossin@kernel.org, bjorn3_gh@protonmail.com, 
	gary@garyguo.net, boqun.feng@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, gregkh@linuxfoundation.org, 
	alok.a.tiwarilinux@gmail.com
Content-Type: text/plain; charset="utf-8"

On Sat, Jan 10, 2026 at 03:51:56AM -0800, Alok Tiwari wrote:
> Correct copy-paste errors where remove_callback safety invariants
> incorrectly referenced probe_callback().
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
