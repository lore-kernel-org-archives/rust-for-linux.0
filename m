Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C583546F7
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782347899; cv=none; b=XJ43kFZY4NOd1tak9LtUv8afI7l5fiSbKpp6JtxTL5o+F23hf6TIRwIwbeats0o8moV0Qv+g12QtaGWAKWtbHuqThDdu57QeFtJvx/OmYjg4srG7gnY7MraB+0Jhxa5isrqC1lA3AD7j50Naj29h9HGRI0p6l07z/xiRWlLvlts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782347899; c=relaxed/simple;
	bh=rF/flD3pqclK0Zu17tb9hSmCxB7pV8J19y9rGUrF5uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEXMw7pqVy1C+fWT81zKtbeCgnR27Gwzbv1Tuvtqmj6FV2FtOP0hC7yiuHkZQAohECGSEiX7YMELqio20Z+Sj9T0fZp/eO4YhPvvfBjCzs4TyGJgcu1zI76BEv6hWI20C3AwV7+1h/obRScbesKX8c9BxU7CsRkf6pRwDcc31FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NOu0xVKz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NOu0xVKz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6a4eccab1so11865ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jun 2026 17:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782347891; x=1782952691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEUQ61U7bIUVYQGpc/J450ahEwyXnD6oLbaYe8LS3TA=;
        b=NOu0xVKzHGDmTq4cptAuWygSxMPrccXX5m+ID+ztgHFf9kVxzFtLIqrxodpf8quUIP
         CeaWf+EDH9KRysy9r9mBsJTBTTA5ZNakXKVpl0OJhXkve/yO8cx1G5A+VaJE3QUMlK/p
         1+vvRm0j2dZG/A4QV/XKZGdyjR9/Cft5IA4Ch+M6RQAmfSzf9OtPYwCwufwLvMbIey8I
         EvX1SbIfa4HztsXENUs4J89NH/ID459kKrPA4+pTho8521z035IvbyrtpcpT0rT/bF38
         X/bwfSU6Cqn+wXvrNCuYLWVVVOhTWYabRn7p45CFOx92vpPYf6L5gUPVlbIBShoijqDt
         Gzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782347891; x=1782952691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEUQ61U7bIUVYQGpc/J450ahEwyXnD6oLbaYe8LS3TA=;
        b=cIzt+Dm0csZy3d4daxLOXgqMesY0Ra79aWAlYRP8qgshtfLT58CpGkVCE8a10NCitU
         aSXBA6r0VJrKl2KoSfku1J2FLM3OHx5JXbvMysa81Tf5jYTX9uxWbJ9Kv2cGU69bVG3i
         fI2YguvdVnbll68wM5stRvZTiO/yUbIxHpNlWcAEr0IcNQ1EMyx/rteLvvvVuiRnfd83
         I2IGomOgFWjQoIhkKhBKJ6P1qPiV6+GDUA0iLSszaGtjDDOQDt72uGKhZj5o3WchwmZo
         +sKagTy1jJjI135v+b+voE5PxU7lcohkLqanmQVDb+3PVbUV+xDExARmBSumAnFkddzr
         aabQ==
X-Forwarded-Encrypted: i=1; AHgh+RriGq0bOY8PbEZtG23zK2lCYdc7aenTx5cLt6fas4iuIocsFX87LLUfAxRKZKXFCWM57Oq0mkQ9i243ejVwjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeuTX/k+wWixW8AF6Lk0079tXN2J/N8mhV4BH7KYlmf1f68KSP
	a42tc3Rd/uQNbUpEd5z9qLN63KWLeqyM9mrOPMsaCf/lCxXuCG1Z29Df6FVV5lMr6g==
X-Gm-Gg: AfdE7ckQdA0aGtc+hl1l1dHYL1OVfWiocj0XesLiWOFa8MkfWE43MseOjtwbN+GyAWm
	9cXyBs+T/Xr1C9t0j+Ewi+msUyXpiqMEomRNC2zqT6vIzyJdzggdkf8IuApU5Q9OBpJQgb2oS4h
	BoNBPHK+m+0Kq/24jMmrFkGjyHDl85NwCA55cF7aXMZdPHpnmBjmcvEPTkx2FVaj5LhxcwQz1R8
	nureRZTVdu1uwCB4t+SB5IXMfuzyHy3/RzHJAMkKESImWsR5T+h9zqGQ4KJzUxo64zBa7o8mFXY
	VW0v++jzV9RSS7faogSmMSa4bnJypUsSOzcgXIAvFs9VwhiBEorf2hN56lVeBnFpubzQTG8BqZq
	4U22cT8/1L1siedrT30xz70kioXlYtqCWukR2qaVcMIfFnMuI05l8mo4B2TqjPaXHRfLjmNoL7Q
	68mFSwIGJ3FQvHJ2z7TO6Fot42TGTBahKZkR+dIF6ZvXOmnhwcXjCmKKA5KMy2jerMHGYPb8uEQ
	rcHdVZVS++KYiqZXwQGPM/mF2p9kKlI5Gk=
X-Received: by 2002:a17:902:ebc2:b0:2c7:eba3:a827 with SMTP id d9443c01a7336-2c7f77940c9mr1136075ad.30.1782347890674;
        Wed, 24 Jun 2026 17:38:10 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcb9c14asm563221a12.24.2026.06.24.17.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 17:38:09 -0700 (PDT)
Date: Thu, 25 Jun 2026 00:38:05 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Keshav Verma <iganschel@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] rust_binder: reject context manager self-transaction
Message-ID: <ajx4bYtQRvBZp4M0@google.com>
References: <20260621210134.441-1-iganschel@gmail.com>
 <20260622145801.344-1-iganschel@gmail.com>
 <ajpv5xkakp06ArMj@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajpv5xkakp06ArMj@google.com>

On Tue, Jun 23, 2026 at 11:37:11AM +0000, Alice Ryhl wrote:
> On Mon, Jun 22, 2026 at 08:28:01PM +0530, Keshav Verma wrote:
> > Rust binder resolved handle 0 to the context manager node, but it does not
> > reject the case where the caller owns the same node.
> > 
> > The C binder driver rejects transactions from the context-manager process
> > to handle 0 after resolving the target node. Match that behavior in Rust
> > Binder by rejecting handle 0 transactions when the resolved context-manager
> > node is owned by the calling process.
> > 
> > This applies to both synchronous and oneway transactions because both paths
> > resolve the target through Process::get_transaction_node().
> > 
> > Cc: stable@kernel.org
> > Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> > Signed-off-by: Keshav Verma <iganschel@gmail.com>
> > ---
> > Changes in v2:
> > - Compare the underlying OS process task instead of Rust Binder `Process` object.
> 
> I would prefer to compare the Binder Process object. Rejecting
> transactions between different fds owned by the same process doesn't
> really have any benefit and makes fuzz testing much harder.
> 
> Alice

Hey Alice,

The restrictions were added in the C version in order to patch
vulnerabilities associated with this "self-transaction" behavior.
See: http://git.kernel.org/torvalds/c/4b836a1426cb

I haven't really looked much into this, but do we even need this for the
Rust version? Is this even fixing anything at all?

--
Carlos Llamas
