Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1781390C85
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 07:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321601; cv=none; b=kd1hcuXTGZSjksmODo/Wx31MC0iAciVTWyVSQ0zTmZ+GxgHSi/PgqsRoD8C9jU0t2YJ7ud+HAMJEi9aaRjWW9ELvTMKLAhKOGLNDjqKb0FJ4ibeGL3uZn7SMFtw/G9BvfP+kVmZkR8xt31JI1FsaEDSmf4vf+W2UFDYv6OQub90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321601; c=relaxed/simple;
	bh=HMRJZjXu9lUfxZwXIfFFv1kzZwOLuiTKCr7F95p7Ghc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=By2e6zSzxhz0rSMrFXSi2rvynai9q7fRqN/fMhmXq7pAIZWTVJMg9dCVQVj1tE10VqLE8hvE7my95epGcG2kCjt5V8QV2SYNt50bLo1K9fj3q4KQ5kfK2xSLch22zSn2tuKB2Zy9HczQqxu63MP7tJBSbBwc47EunD0m0w6ouUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UlwLARGp; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UlwLARGp"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493bdf90adaso18947575e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783321590; x=1783926390; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyHthq/TXKUBbGgmKNKJBenTP/cGhPGWAdlFBx5a5pc=;
        b=UlwLARGpxy0X8jMgbHou5Vou28hzzTWdW/ulWsfSzcqhG/xshxORQsD9SlOIUtgEwp
         +TaeyyXGPvHjHN50k6HQ6ricLQ4DCWirnyZ+zKtrahm1rnLlU0Vh5TWQylyTahYFK7KU
         ck09K25jYPks9xgkGQr55cFrxPGB2SJrqa2hN+gpJ228DR5sGRHMzQmrkIwuSbmzyVc3
         r9YFBlXcgC6Or9F5E1Ap2R8b2YbJxEqYiIdQ4K4avH3LH9NOv+mB675GCoHlFSBMbKeH
         od6l5+1dzDqRUBLUdUiAQdmbCXrk7I1UTTW4ySLMdvbkKGjJTIGBsDYX0cuF173KwDHi
         UFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321590; x=1783926390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyHthq/TXKUBbGgmKNKJBenTP/cGhPGWAdlFBx5a5pc=;
        b=sIkV6ERk3/bWyJC4fU+yaIHSwQX9lPIuEeNKIM8PcHIbnrD8b2wJNPEu4Fn+ziCWwh
         Px1tmobHGOlRIRl33O42zYWPLEcZ2T0rUTFv6iDLTd9J+m8O6pa1UvC3eGt9nXlbWxuu
         BvP+RejD0YYYYHZufBPPmjjfLaJr/WIjJX/y4vmUPFlPUTlpH1i8JlQP1DPCGuakWQQW
         /QghijJnTOK0DxkFJjkCqCeurp0x/LbZ7A0xfp1YTk/0o0rJ3LGGoPB0/7fMMyIbLOyo
         h1WX1ZCalXBeHQiEVfFeEeZzXmUfTThu/hO3GF4gAGEMHVnb4pg5FKffF/UoVdWqzxSU
         F+uw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+zv/sNcBfhQamg/wz3fjok+K/ZDw9IFQgzWOtrF5/l+oNU0t2djUqB2xdDs9lnMu8FyoZDzhx1ufjTTcMug==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtg5gedDX65GK423Lqxpu9eM/No0rzirp15CzVMXt9AnDqxChz
	GVosyA96iiAjQMqcE9AWsN57/nQdI/Bews9k8cl0zBDUPN4xlbtNd5UYpEgznWfNliqc45wP7BG
	KeBbdWayGHxxXnbdkIQ==
X-Received: from wmjk23.prod.google.com ([2002:a7b:c317:0:b0:48a:5334:11e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3551:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493d11fb8a4mr96392185e9.35.1783321589699;
 Mon, 06 Jul 2026 00:06:29 -0700 (PDT)
Date: Mon, 6 Jul 2026 07:06:28 +0000
In-Reply-To: <20260703112108.3139558-1-vasilisalmpanis@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703112108.3139558-1-vasilisalmpanis@gmail.com>
Message-ID: <aktT9L_LazAl0iky@google.com>
Subject: Re: [PATCH] rust: sync: arc: use intra-doc links for `Arc` in doc comments
From: Alice Ryhl <aliceryhl@google.com>
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 01:20:40PM +0200, Vasileios Almpanis wrote:
> Two doc comments on `Arc`'s raw-pointer methods referred to the type as
> plain text rather than as an intra-doc link like the rest of the file:
> 
>   - `as_ptr` said "this arc", lowercase and unlinked;
>   - `into_raw` said "this Arc object", capitalized but still not linked.
> 
> Rewrite both to use the `[`Arc`]` intra-doc link, matching the style used
> everywhere else in the file and making the references clickable in the
> generated documentation. No functional change.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1240
> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
