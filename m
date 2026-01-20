Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011AE426EA4
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912758; cv=none; b=DuZpod1aJ3DKMaumTmaJ6K4mEiUMaDUFNhLYFMrI8serDKQBrXuyhzHU3OGRMiEo8iINv/op6a1JIhotq4kAL8IBdSfpXFIP0ZuImhWHzKpm4dcMaAwg8ntKM4ak6hIGKaomfyirizXNB+lSJIuWIeHorTX76eKpXcNfEOJ40tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912758; c=relaxed/simple;
	bh=4hQ5wthGbRwK+tJ8j7a8ZpnaN272v9XF9TyqQHVeT7M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qxa5ohhaNqOMQ8ZPH4Sbo+0p0RxJcf/aW97EAseO1R1KxIoVLlyWa+dF2OxLEokQQot2sO0itQfK/LXyDYHnWfVauL8jFfRH7+tXE2GmdlElt3wMZJqeqnQZomNv5vEpDfinlxV3yW5jaMni13JTJcv8Y0TLaQUDrsvFBX/Bnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SINlgYNR; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SINlgYNR"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430f5dcd4cdso3019434f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 04:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768912754; x=1769517554; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aC20Vi3ua6RNxinQI5h1askXn9iFU0ocrDNDebQDeNI=;
        b=SINlgYNR2tMUaMhpKlTrBu24v2h7sDtC19jXJFpl3psVbL8Kzxm6+vO/x7W0/z4HxD
         eaB7ohKK8yTpqOjVFmNqyfzWZ9BL9JtcHuHJHx2R2yOilpBTpQL2XApTO4d31ptnVMN3
         E3lWP/DJZEVWV34g5BPZWHPHPOWWzEtEU0n+kj5ED+FAIPyhEAUMFVK0o4td/w2Iszne
         LJwa/XtQwmsiXyb6bp9fZzSUQiKaMq7RM74YsdVaP3GXFYf8Jau60ucY3LGE49C7iGjI
         wyKeZH6S36RzTf8NVLSAKaN8MDmupPMra+Tt51T42NZvAvynocg6Dz+VY3Jt5RGvjOIT
         zv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912754; x=1769517554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aC20Vi3ua6RNxinQI5h1askXn9iFU0ocrDNDebQDeNI=;
        b=Gg95RM4uCDZeW/8zzI7WqKG5R2VQUQJvovhm7fonYRHR72vgS7p3eExDZgdwvZep3U
         JsN299+D3KJ7l8HTUCXx38JtX9ZyDfCPEL6RsRCIkmKBIBiUelSCL0xdWkkQyhCl7lht
         li/jtwrBcJijJpftaHSDI7nionPkUDpZXVEL+HQE98VErOaZE3kCSoYCBy3nC5Qd+4wJ
         NUtyjRh5FFylNaAqXkh6AuvGdsEPYiH8OxKca4+SHhUMUsyj9hsUNwSWMWbJnW0xWef8
         h7KdcagaX3sTcG6skLH4lia0ylzn+rz40zrc6HYbOJ31WzNyxO83FPeT2YZu2x4d+4nf
         0zBA==
X-Forwarded-Encrypted: i=1; AJvYcCUuIuEc4jABtnTo/dQOWhqAW3Q532m63zAx4w3r3f1cFbcKY8tnbHcXhuvvT7U9gzSeCmz/7ZthF5l7juGObA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8n43U7VsE43bsYyi0OtDOikJDylctefldZC6JnhqXY6MJ7bBT
	GMnkyJQPI+v9+oCZgOLQirrB9uzzM1qHx8/xNVKKmZfjedbiERfHkGIoKX5keHkhBkESHnFQCt7
	SwfquhVSj6LJ26KGW+w==
X-Received: from wmig10.prod.google.com ([2002:a05:600c:140a:b0:47a:9f70:c329])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:811a:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-4801eac0cfcmr156081605e9.13.1768912754423;
 Tue, 20 Jan 2026 04:39:14 -0800 (PST)
Date: Tue, 20 Jan 2026 12:39:13 +0000
In-Reply-To: <20260120115207.55318-2-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120115207.55318-1-boqun.feng@gmail.com> <20260120115207.55318-2-boqun.feng@gmail.com>
Message-ID: <aW93cQq0Cyd9ivpE@google.com>
Subject: Re: [PATCH 1/2] rust: sync: atomic: Remove bound `T: Sync` for `Atomci::from_ptr()`
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Marco Elver <elver@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 20, 2026 at 07:52:06PM +0800, Boqun Feng wrote:
> Originally, `Atomic::from_ptr()` requires `T` being a `Sync` because I
> thought having the ability to do `from_ptr()` meant multiplle
> `&Atomic<T>`s shared by different threads, which was identical (or
> similar) to multiple `&T`s shared by different threads. Hence `T` was
> required to be `Sync`. However this is not true, since `&Atomic<T>` is
> not the same at `&T`. Moreover, having this bound makes `Atomic::<*mut
> T>::from_ptr()` impossible, which is definitely not intended. Therefore
> remove the `T: Sync` bound.
> 
> Fixes: 29c32c405e53 ("rust: sync: atomic: Add generic atomics")
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

there is a typo in patch title

