Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C442C029E
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862709; cv=none; b=Xh1VVkJTMOThNt6VqkpGUEBzTCiouYePx/X4PfpGLKP/mIlUeoM8Zg+FVQH0j52OOKC68HC7zGdpq27Wc9/D2T5q8+gEjJa3bzeen1bqCRUHA5eN6URUs3hUGqjMre7j4xV4RMm5WN/dx/1D/uR9DFD1myueWVvB7fxNt1FhxVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862709; c=relaxed/simple;
	bh=tMxhlMKBLmpIIfChC9DTHzoovXoxaO2EHMeYyhq6xcg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q6iycaLwzwcsbghS2N+HsQCFAW+fK77T1IItm2Xt8CK5laXzwY44BQYbHfJHOcHEItHiPfFaSZ0oY2Kl5TxRhKq/jSZqiSWu35g7mfm89yrNmXSlGoNhHOUskIQ3nsxQfb5XS/66J8deMHSpeiNfkqu0cAVfJxeJRDl99uIaFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sb5yOi/0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sb5yOi/0"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1ad21752so9306025e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755862706; x=1756467506; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A273qVlEBYHcOts4QcIpb1RGk5Tm4PY+pm6KzVGfp2M=;
        b=Sb5yOi/0SyEz3ngUzy7kOMCLoEPaHzAxTPl0JmSbKgrXmAgNFpwtkiuolBZEN7eTUn
         WMXvDEOs1tcdMAWTiHKONi16XmoCw2XmZKEtfur9SYDK6oSfSydikpWcyqjLu93YbqQj
         0g9aE2raneDhWre1nkpseknZ07hlwYQplbR2CZV88zoHe6ftnPenUd9SBXBvNm+Nl+X6
         wFqpstU5nntqlmtU4rEOZjQC9AF/Wx2gOEP7mY+Bz/MFipkanC2FQnJ1QqoUAcSAbG1s
         Sw9mNzHeaAL9879n9EWgM7qpb9BLL6OlVADSzSxK913PxWxybFgeh1nySpGX5pNZjwLa
         bLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862706; x=1756467506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A273qVlEBYHcOts4QcIpb1RGk5Tm4PY+pm6KzVGfp2M=;
        b=EjlLQsiuObCy0BrqHiIfH1EhiPt82iQVDu9sTUJmM+9XmohsPRN966uVJJT5jjMW5q
         oBDTKSMyW4B4FzwUjb5B7fp3PBXsgnKvc544dd0BbRQbxKyyYGYhrZ0LMBOqht+R6gxp
         RmNJbvkIOZRiuhipM7cZeErfpXC0ET58EyTYPxNQGD4WOJwUSZB9eQRDg/uevcPe7NQY
         wA2FZGJYBAQ0gD2PxojToDRrERB+UOAGkuM8zidOcyLpFrvCdZqZKXeBbGYLJFAZOpV7
         MKJ+tomupTmwC6iReOp0V6YRJ6Ay82esMkI32Op1moGM7gT3oydGio7lUvVj/DzvpQia
         zsUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy79C7TKlUKof0mDOmZ85cf1hlJjaAVxrWmKNMuQMi74Tl7VUPIpfrSy20Tqvroqm5qNHlg124yHe5f4DcVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwxfWTPZOMCey1ZXpuox33DQMPrRiQi5T5g6bs3EjLV0zCD0++
	AQVxAio11OVH42T7GNqV/zWs8PSe6oEeLIkVqVMRBjfxB65u/YpDpJLgyyj6j11olfNsOJYeNqm
	d71QMHPpmq5CQTpCOtA==
X-Google-Smtp-Source: AGHT+IHBOY0x5pOW581j80jySeLBkGqP9CFfghf7g5ufsksr9301sU3ONM+Wh5YM+Yrq+v5Uo2ButFjZu0AysA0=
X-Received: from wmbfp14.prod.google.com ([2002:a05:600c:698e:b0:459:dd85:efda])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4746:b0:456:1281:f8dd with SMTP id 5b1f17b1804b1-45b51791e8emr25943255e9.12.1755862705847;
 Fri, 22 Aug 2025 04:38:25 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:38:25 +0000
In-Reply-To: <20250820165431.170195-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250820165431.170195-1-dakr@kernel.org> <20250820165431.170195-2-dakr@kernel.org>
Message-ID: <aKhWsTKUnFCG548g@google.com>
Subject: Re: [PATCH v2 1/5] rust: dma: implement DataDirection
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 20, 2025 at 06:52:55PM +0200, Danilo Krummrich wrote:
> Add the `DataDirection` struct, a newtype wrapper around the C
> `enum dma_data_direction`.
> 
> This provides a type-safe Rust interface for specifying the direction of
> DMA transfers.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
