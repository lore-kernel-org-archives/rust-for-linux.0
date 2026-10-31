Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793463216;
	b=qCS2oQGIXmo6kJv06cXLCvyRacx3Zzem19pFI1a+baLiEIdJKE8ci64RvV+eGAu/3Iw6
	 /I0n3S470QN2tiLa01WHEYt5or/v7dAxz60jY20m7/GbhcXxS9ZhE1tMYvWnNOw78if+h
	 iiVRnzJvyFjmb1Ww0xEy1+qPie24wEM/Vr47nHDHNDxrTpp0m96K7yFshPSUeZFgwgr0X
	 eyxQZjJuxV2GESiNR6ArtTqi1jB46zmAcsSqeV2SE8p9/DhmX+srLMrm4bPl3/QZk3C3D
	 LOj6zpLt0alDnBbcArFflzJzAjd9Dcsz5TFoe7vsFPgY/D5AYI02fw9qPu2qJVgsDvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
	b=It1bKgtQOVFSmDiPEEe45gxut3ufoHaACXHf2TqkduMkX0hmr4+uXQmAdC7M54/UriJX
	 q2IAq6h3zWCBTQ0YxsuSbFITy+OOl/gftehmSmRR+yD/017GDpPWIcrx0SPYMqZ0Re1Rc
	 FEecvF+5ZNW0SIY990R4m6bAk5XM8VmCdBEwiG57biy8FNknbT2c4S05jZeq84NXtRHAP
	 zZwWk+0R1JrvS4kuBkrFqV8PKtdDM03tAh1gfPfdzX/bWz2xMR8PJ0+hUtGrMiLfTTzJ6
	 QGYaDu0GFJbpxVRYb4UqJGVMdzLcql9ofH40WvWpc2IGMqJASxA/ui7TLuVZ1LG7ahQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oXnQbY19;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D812C606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 16:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D812C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oXnQbY19
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so14707745e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 09:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793463214; cv=none;
        d=google.com; s=arc-20260327;
        b=sboqXFp946t8qribnzmDKvTCfxnxHGq4qnRXd4rcKeidg7pUb822D3Ho/rqL8CqHs9
         YmOVrifTwThsNxBhEmTrmTrU6jN43JGcOAeY0CEWFFu1araz/3QjaV1aAsAMEz6dDPHx
         oF1YlGo3R4xshtP0Ksc39ajMbHMT2quy6+PcdtdC0NGcfZnDio2ajV+kcx+PatPg6Wch
         oS41QVsp/6a9WS7sqU9/ZI9Cwhuojnz8mG7MxNB0M2XNETxAnJ5TaAVXpTZ/7EnIJHNZ
         6YBF9rSgvB7Xq+ntGsQIHdRNSxzK5ctfWj+A4ghVuIyfGImEiCEbzZJ6QPq+ln539xYS
         vRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
        fh=O8DFxLvBTm8YE6PDW7ADV9uvlMmpg0zsGNBLZIuxFQY=;
        b=GAWpxSYDOOWUXwJoP+nXP0N2DDjjuYK4TgGSMtLjBV+5JZTi6VwSIoIuOa00jEoT7h
         cBhIoWjrCLf+RrfqbUa4qsM8jD3+fFTpjatPwq71XDaFHCNQlaMPps4LOsPgqt+XXGkp
         OCR/N4UuD1PkNFdtFlWvAmlEvGIMUUigvLIVQ5jnB6V73hqwC/5zBEmMtQpBf2n8d9Sl
         nZvyZommmogSSMY4KslF6HRytkKAdW9DK0BnXLRuRA2NkE6ppTK+skyxWMV5VyBRYJOp
         L3wbHk7bjQgOwnSD8K1t9Igw598EcT9pOpFXaEdqnMQagFmWWrZgHVZB+6IK6pSH923U
         4Gyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793463214; x=1794068014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
        b=oXnQbY19S7mqPdMforuEPHv9pzUoIcdSwcm/soYtICkrQFY6YieRL96mpvxdrzy6h0
         Alb2LMED/LNMuw2OYEDVd993QpgNLhTdEUo+DK0shsFb68/3huXLkCtMpahatYBoN71e
         96EsbiBY1gjv9x8s4pOKAs8HjOEVjUnpBro3m7uF98DFk/Y86DAUThoTSNfS4IGUmX4X
         xfxwwtn+P/e1bnjYvvCMhcfkM1VeptQwf54SJQPYZZvx4gRJxLQr9v6NFSyxdGfs8MG7
         CqkAQ8e8zW1EuxXPzjSGK8y/vcU5sGssPAaIFwRbmDTIg+YmehDQwuvmd9XgjNfJFOII
         A14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463214; x=1794068014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
        b=xZDT9G8HPcZjJJ6eghPW8D3FQfOvsI2ghfeN/59kxLjs8iy06OzCtYQbafGZBsMN9k
         SZbZxf4Hv5mAZ0PxUY82BgL+ZGVpGlW58uba0CeyL8Tv7HH14xJuShsp50XVrKNxFxQi
         awffcQkK0FwOx8fjS62XfrMk3Gu99mhnOAGj9l3yzcrEtcxkF73bAvGPMXXcHBZk0eKN
         lgvc3xGbqVgeZcd31k5a7d4EwP4hgBdTsw6gE6ebQIQQevyrJJjYZeJFWpcM/DZ8+5aj
         uLxYuvwZgwGT+Wom/Jec0BPQ0FArKz/tG9hwFkLvVIHz/7tlZzoyQtK5ju/kTHJMocQ2
         YJeQ==
X-Forwarded-Encrypted: i=1; AKwUvByIqLRMnbGoqKCtMgGR5Hwr9ijv7LZbGQQadreDctSSDomF00jYfs2KA4FvD75ow5Ztoo1DrU3wbRpdvQ3nww==@vger.kernel.org
X-Gm-Message-State: AFq9FYJykloSHzhKkc9fPcE9F/k7GH6voPOzl04gGKzOiOMRKpb/i1nU
	1Lqm9AY4uQxx/0f27NUwsFusuL5Ypo0f8nA5yIg9eBd8d78yxLfAH4V61q/coYX8Ym2GO/5Imwm
	VIOLnZ6oyNzH3ST82OGKG6JvQqgbderbqhIBpR1LM
X-Gm-Gg: AYBFou2sGwqdxqkGTb58f6QCfudAIYlYhVc+FOopkbBeIn0lesJJN0Ai/WRxEzdLvWY
	fjewJD4TyOT7o400oXMvOso7aDwYle4G2llaWyEprifZsAPseiQM5cpnby2INxd5dfiDR+Z8nqe
	AJJoHnc+vrJUNXS3aZHPcNLLdrZYFVfrThU+qgZq28Z0fA8JT6IffbwEdwQb3qF2m4K0ucQwbc8
	hD4358ZCBA//R31CRQNEdSgv7UeDJ8wtL743BLhHVV4EUQnZq8+h2b4qxvCREZbffMSZ/VEOMAS
	X5Mc4bo9IQajcV7POKyaoS8JfQ7C6ntRszP7ei9SLTahX3ZMs+7isNZsAHncQlKUoievZsg110H
	49kVyA42QRVC/VGLdZW0ledoKoXxHT/+1I7tsONIchQgLrKfRTAsCST2Qtq5glGbqMm7XamS1Vd
	dZGwOzTnWd1Wt/LASNblGaBc9kBoezbYQqqXfy
X-Received: by 2002:a05:600c:4687:b0:4a2:10f9:37db with SMTP id
 5b1f17b1804b1-4ac16fa4dadmr127607515e9.7.1793463213791; Sat, 31 Oct 2026
 09:13:33 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031030801.4100693-1-jenhaochen@google.com> <20261031150909.3807811-1-jenhaochen@google.com>
In-Reply-To: <20261031150909.3807811-1-jenhaochen@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 Oct 2026 17:13:19 +0100
X-Gm-Features: AclHuK9cQssAXrj3fEwvmCJEbC0IXVvertX9-PYXintpQHs6O-tVHhXTY1nDI9Q
Message-ID: <CAH5fLghJG5x3G34FHFDswp8GxuPuo322Jk9fqcW0TKX8Wzt43g@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: use Atomic::add() in BinderStats
To: Jenhao Chen <jenhaochen@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Qais Yousef <qyousef@google.com>, 
	Ben Wei <benwei@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:09=E2=80=AFPM Jenhao Chen <jenhaochen@google.com>=
 wrote:
>
> BinderStats::inc_bc() and BinderStats::inc_br() increment command and
> return statistics counters on every Binder transaction and reply using
> Atomic::fetch_add(1, Relaxed), discarding the returned previous value.
>
> Because the return value of fetch_add() is unused in Rust but must still
> be produced by the underlying value-returning atomic RMW helper
> (atomic_fetch_add_relaxed()), the compiler is forced to emit a
> value-returning atomic operation (LDADD on arm64 with LSE, or LOCK XADD
> on x86) instead of a non-value-returning atomic add (STADD on arm64, or
> LOCK ADD on x86). On arm64 CPUs with LSE, value-returning LDADD requires
> a round-trip response from the L2/interconnect to populate the
> destination register, whereas non-value-returning STADD (encoded as
> LDADD with WZR as the destination register) may be executed as a far
> atomic without waiting for the old value to return to the core.
>
> Switch BinderStats::inc_bc() and BinderStats::inc_br() from
> fetch_add(1, Relaxed) to add(1, Relaxed) so they lower to atomic_add()
> and emit non-value-returning atomic increments. This also matches the C
> Binder driver, which uses atomic_inc() for these statistics counters in
> binder_thread_write() and binder_stat_br().
>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Jenhao Chen <jenhaochen@google.com>

Acked-by: Alice Ryhl <aliceryhl@google.com>

Greg, please pick this up, thanks!
