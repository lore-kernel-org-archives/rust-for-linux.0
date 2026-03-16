Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9F382370
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653260; cv=none; b=o5TJuEkKIHjTB1xAFkBP0BKU4Fq9XGEpGmZvXDCDNkFAbxmVp/awBZApQP0AeoE30HGr0o1LwU7mCNCUcLyhGkKeRBOLlSj8GHYGzHLqYl+XN0eGki89M7E0zKA80Chse7nZawEGVm1Cus/pVfim4DmCZ2HvcpnweRdAqwvjkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653260; c=relaxed/simple;
	bh=fG/m/7watyEcbnXXgUUvv88DMlrRh0CMAuXRlm9LWmU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D8bDX55P0BxBJgWee82LYecRyvuXemjd8GYZ85h4p6zDzQ367/OiRD/Ob/EXC/XFxu6TuMfqu5ojQAMoZ6W6BPALZlgg3PTI3cY11D5oBKALV+XzvAKARN1WcX9/QbONTEOw/DyLdPm6A7iTrpr7m0Gisrd2Nrsj20YdB6DD5f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ImwZ6zht; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ImwZ6zht"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48542d5aa9eso35788955e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 02:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773653258; x=1774258058; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7q6QzcmG6dxnzbKj8eqJeASThBGQ4nQR5hfoFgOE7Lk=;
        b=ImwZ6zhtkxAg1VMUevaTo0kja1miEFr9LvFz41rvWgv6MS875qMBO3P9zGO5M1HQzv
         2l1mz8eINjBTla0VQZzDO4SfhHRiPhehuq9qUd/mBBvQ0RTHmHtfwY2FMLgjbPIVV35w
         jknzjcNOJBAjO1I13jZa2OLhGKKJU3UJiD+Hc8lpEnTqzNktnYQpqMxm0Waj3v5KDlMX
         a59MtA8zM5cPcA+c2uOqfxu3fBskBpNRkHozn4gduiSirZbVLUoOoJWBG12uAsWwDE9N
         0aar0dSChJ7egQ56mAlxZtFT9KZtxGchf3WuIRhvQMVF0X1FS5vqjezaL5wS3Eh0UHgq
         mIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653258; x=1774258058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7q6QzcmG6dxnzbKj8eqJeASThBGQ4nQR5hfoFgOE7Lk=;
        b=NhGYn8o0lgD68PZ3quU3MDAojcYxl7wgFgjcfVtH/UhsItTEFmJGBz+WPuZly6r03+
         QRHl6L/Vg+y2t8TOmbyF+3c0RbBgYY6z/m7XORr8I3HwZ9Gq2o5+m7fqJ+ZZAIUOMjC+
         Lq1yqhHR/g8NQyf/ZSa5K4rj3Hvp+BgrT586oFwHk8KSDq5Qwa4/Hy7mlJagGyZvjDlM
         t5TeFob+/PqU3mvyNti6kk13UcPGWmuiDsSvRlBSLwsf1iZcGlW5zPzuq7t9pKCHlS88
         0686sSRG6FL0QH5GigcmyWW3N5q6LSwBB9CytAD3QMJWpmgeYS/YQBa7nw0yGOT/+IUW
         pd/w==
X-Forwarded-Encrypted: i=1; AJvYcCXX9j/1zhesvMFJA1J77Ne2c3GtfPmqK6sp9FpRAF2NfreQ2sUaX/+KCNMkUGShLgCmEDKEEwLtQfEju/Xy0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rCcsZZ6g9ZihrktQfLVPrsHJRhEcGPcKa4mDIlMIhEVtIHt9
	J+lCT9KDpteu0q7/adXollufNS0S/w2uDOuwtlxoUAnSGgdzHPIzvJsQCYe8Vv3YWkKytAiqVrr
	ljeUm9R0E3TTxB7sfqg==
X-Received: from wmbg26.prod.google.com ([2002:a05:600c:a41a:b0:485:385e:a8c1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c0d1:20b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-485570ce1cfmr145458085e9.4.1773653257588;
 Mon, 16 Mar 2026 02:27:37 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:27:35 +0000
In-Reply-To: <20260216-rnull-v6-19-rc5-send-v1-4-de9a7af4b469@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org> <20260216-rnull-v6-19-rc5-send-v1-4-de9a7af4b469@kernel.org>
Message-ID: <abfNByL15D4s69Al@google.com>
Subject: Re: [PATCH 04/79] block: rust: fix generation of bindings to `BLK_STS_.*`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 12:34:51AM +0100, Andreas Hindborg wrote:
> Bindgen generates constants for CPP integer literals as u32. The
> `blk_status_t` type is defined as `u8` but the variants of the type are
> defined as integer literals via CPP macros. Thus the defined variants of
> the type are not of the same type as the type itself.
> 
> Prevent bindgen from emitting generated bindings for the `BLK_STS_.*`
> defines and instead define constants manually in `bindings_helper.h`
> 
> Also remove casts that are no longer necessary.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

It'd be ideal to change the C header to use an enum, but that may not
work as I'm not sure you can specify the integer width you want for an
enum.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
