Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1D734F247
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 06:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046557; cv=none; b=uyfGZQaB0xPa8gf5mgAOZXcJ+LVB8SPN+LILDF4qse+EImZ3a3BZMcdfZfEd0jUy3iO3wAsh0Fvrj4UrJn1RammyYAB0wFIjXONPE0Pybsl11h2Vo9jcgfGyojBgdvL7a42B6+cjt+Z9JDgHUwBN9YGdccWlpSjwTfbCAeui8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046557; c=relaxed/simple;
	bh=OOsw1LQmGMrXPMNqpjpR3qy/lhxL/13QuEb6ASM8pn8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e1vEBwTxv9fHDxHuDBwfXWDXTa/I2pCF9nlW5Xz0izgs2HSFPM+fCjozWIDGtizsn3eUHQ7qZfs/veR0UbKK+RatDkRW3YCYPDWgKSE5ttsm3yUKeqfuI931HoNpyNCW9GQebufypB2sR22KFAEesw75JPuTbEIZoOsIx7gRvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SBnBSdU7; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SBnBSdU7"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49953abe51fso36872555e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792046554; x=1792651354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OOsw1LQmGMrXPMNqpjpR3qy/lhxL/13QuEb6ASM8pn8=;
        b=SBnBSdU7d+Dkvyu+Eu+O3hvca8nyrob+pHLZDz/x2RENZnJUyCIzCRB8E22kCZrSQO
         uxGS++yEAVEBlsQc9n+qA1pfK5XlHtCblU7mOVbHu+M8eoH+bQnNAoa23zXYHIdI4MG9
         qDdCD1HJPADysP/Yt5K81GGou5ZDpe0PhPXGYS/lz1tNqrt7EFp/h7JLpGVAt1oycPyG
         x62weTKzQPFwSoKtEeiUMVpBxJNuf3CUsRCEm/AjE2aiXVmpsFx1uhLt4CUy1pOhfJqC
         k5MEH4CEzgbfc+HKDweCCEhTgRI26swM9ksxg2gMI8GQPMdOJnhf8gtu5qA2iCtXeKy6
         ZpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046554; x=1792651354;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOsw1LQmGMrXPMNqpjpR3qy/lhxL/13QuEb6ASM8pn8=;
        b=zmrXNlPvPKfrle1a6u0dH8dONTB9cPVhQZSdFuLedzzHqN7dWbXMvXfhtxO6kYZVJR
         XmCQtGSR0s2t6FflyLfgYN1ZsoIVCSx1UqGXS8NkuOP/nJ8onj9z/RLwq/AxU8U9h8hG
         sU/7x7WEfSrK30geXk1/QvmdTfUODK6mL7CJwAx7sebhCreSKkNdtWbP5cwbVFkJS8zz
         bHhiVG8e7+VWLznovvZBoLPFLEOVRZU2q2lgOoXuIGIQOD3O6LkG3mVZjv9AnjAK6EwG
         fwLLIBOn8VS3UU/Fwy4T3q445/V/hQ4DhzlHej+7d0kqtEzlkWfcmzVHam7vioQcHEb2
         RxAA==
X-Forwarded-Encrypted: i=1; AKwUvBx6DyGcQuZXA0LfZOm4AdEpP74NtTT8STyDXx3PBZt9uETT6m1rZCDnuXiqVUFJcdXwP7RU55p1rt5fdRuHiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJjMTxmLWFK2VR07nVt4mzlfKBk0uMFSgu4inRFcbnx/C/GFhsd
	4e1O/vHuQROdThFgUPkzgChuFan4qeyg0+X+SXYG5nZImCx671M3zfzW8Tsy56dD+Qw5ZOnkEQt
	rJ7lu8x+ixrAmBH162w==
X-Received: from wmbg12.prod.google.com ([2002:a05:600c:a40c:b0:49f:fd3d:3bd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f06:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a18e4a3bfbmr382470915e9.8.1792046553480;
 Wed, 14 Oct 2026 23:42:33 -0700 (PDT)
Date: Thu, 15 Oct 2026 06:42:32 +0000
In-Reply-To: <20261013-rust-x86-rethunk-rebuilds-v1-1-d2042a72640b@weissschuh.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013-rust-x86-rethunk-rebuilds-v1-1-d2042a72640b@weissschuh.net>
Message-ID: <atB12Dve5tdS_lJk@google.com>
Subject: Re: [PATCH] x86/rust: avoid duplication of RETPOLINE_RUSTFLAGS in
 recursive kbuild
From: Alice Ryhl <aliceryhl@google.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?=" <linux@weissschuh.net>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 10:42:26AM +0200, Thomas Wei=C3=9Fschuh wrote:
> Currently the only modificiation of REPTOLINE_RUSTFLAGS is an append.
> There is no initial (re)set of the value. When kbuild is invoked
> recursively, for example through a top-level `make pacman-pkg`
> invocation, then the inner instance of kbuild will inherit the value
> from the outer one and append the same values again.
>=20
> Switching between recursive and non-recursive invocations of kbuild in
> the same build tree the command line changes and Rust code is rebuilt.
> While this is harmless, it is slow and unnecessary.
>=20
> Replace the append operation with a regular assignment. This avoids the
> duplicated values in a recursive kbuild invocation and therefore also
> the spurious rebuilds.
>=20
> RETPOLINE_CFLAGS is not affected as it is always reset to a fixed value
> further up in the Makefile.
>=20
> Fixes: d7868550d573 ("x86/rust: support MITIGATION_RETHUNK")
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
