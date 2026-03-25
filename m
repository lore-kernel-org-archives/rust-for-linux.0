Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6773D4102
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439268; cv=none; b=l4uXReXv2NnXMxL6gfDdGL8hxq+R4xP7L7NYrlkRpVWDq+ipolWjh8nXEvTOE/GdYJjR8VetPte3LZlZQRlN4vGJhTxuf25eOawvpOTJXVha40ExTwipuvQg2DLo2/tM60XRN4r+CLlVVg3QsJdyD8gnJGnXL5LFRAQg+LrfhMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439268; c=relaxed/simple;
	bh=0K6B12aTG+/k3pPsn5A5hhd0vy7DI5R4voSHQA8rf80=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YH9LoTuT5/WCaUkff3W4nZNUDVXMax6DlcvnGwMXTkxTJTVXzfgjKqPvYOXyIAKIKhKpcOj5fIEY52LM75Uh5JQN+KQ7FCOuegk+t9FTMingEYWH1UkMCeihVrwVFnFBtUCjMjPS6tcjMLUqbM/cOVDp+LLxcHDBEUBfejxsd4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BKv1f5NG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BKv1f5NG"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486f89b7f69so49082305e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774439266; x=1775044066; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uhEowmiK4u1R/mIRCHEDC4FJAoYu6BzZ/HSFgx4p0A=;
        b=BKv1f5NG/NbvANiAB8rFkkolW1/wCYBZPym9U0JwJy3qaqkpzUmJlJjQkyvwIaCf03
         9rpsOYKh2c2VqFlz6Ih6Qx4PDsLORBT8BFGF+e1Mmm9aCYNVHwxoKi//RNKxwWPvN/Jz
         og3ID/Of59EiJamDt+tZkea0MzQhv09jHEQz2o2rePTXyGEzxJgrI/FchhYZAvr5zwXG
         bdwJTwD61/Yvjfj7Oycal0JFsqZd0IsxJnSWLbBPlBVsPSCfPuirNYxveHBg5Q+ECdyv
         edilN5F5y8QpsE8K3l2PdIihPfPB6HPa7g8U6u7yV1vP5+QexYUd5eBLUM3C1jZMZfFZ
         xVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439266; x=1775044066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uhEowmiK4u1R/mIRCHEDC4FJAoYu6BzZ/HSFgx4p0A=;
        b=oBf2ZVuFpoSOuLA87HFP/qklppsx4dRbL++zyUU7ifjqEy0Gk6+2VQjL8PpdODP5EP
         dg9gdfDEtK4rHNRaXjhEW5q/KOJMfPy6OLo8sxxxrs1MZe0KxgwIOhL+waIrTTIxmd2o
         f/F/jCXvYO024Nfla0ByWkBlVr7UvkCG+5FOd1TAvMMw/UVmO7SAdOBOoPg/E6Wx+JAc
         82MYad6pCplrHg/Ye9cUN5jpbpg1sP7ZXRHUacRYfHwAzHLtsGpgFBYiXxohva02JZaS
         zNf+NrGW9ArxXq35QsYOv88GITpi5ysL4x/f5gUbPxPYF67DnVOi800pMPEPKvEAlXQ8
         ufNA==
X-Forwarded-Encrypted: i=1; AJvYcCXwXiWYDLEa0TJpkv0ExYz7zSOretDZvqzUpSxyuhOeg+YXvYWtAZNvghkPB3WYI+zuy2Q/HIAe4xS97/CVkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxVNlR4OX4n9S4xGRYsX8CKBkMCdWb6BKkUuUf2pLLX+teTKWt
	iBviGnw7OgWSSpQvtC1aKaF6BxeGmKOtoSwqZwWU7B8+DUV4KlYElX34Td0ne5+L2/JXUuPkSgw
	SJ69OSRku4nFHW+zI0g==
X-Received: from wmlf24.prod.google.com ([2002:a7b:c8d8:0:b0:485:29bb:91fc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1913:b0:487:1fc:14f9 with SMTP id 5b1f17b1804b1-48715fffe21mr46309925e9.15.1774439265917;
 Wed, 25 Mar 2026 04:47:45 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:47:44 +0000
In-Reply-To: <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
 <20260325-kasan-rust-sw-tags-v1-1-7d3a765a72aa@google.com> <DHBTCP3NHE62.3N96AD6O1L7CK@kernel.org>
Message-ID: <acPLYM0HtGfW1Q6X@google.com>
Subject: Re: [PATCH 1/2] rust: kasan: do not pass -Zsanitizer-recover
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 25, 2026 at 12:06:50PM +0100, Danilo Krummrich wrote:
> On Wed Mar 25, 2026 at 10:26 AM CET, Alice Ryhl wrote:
> > We do not pass -fsanitize-recover to clang, so for consistency we should
> > not pass -Zsanitizer-recover to rustc. Thus, remove these flags.
> 
> Isn't this because clang forces it regardless? Is this true for rustc as well?

I forgot to mention this in commit, but I'm actually a bit confused
about the situation here. If clang forces it somehow, how? I don't think
rustc does anything like that, but not sure. If it doesn't, but clang
does, then maybe rustc should too? Depends on how that happens.

Alice
