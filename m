Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21C02FDC2F
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165652; cv=none; b=KrRceHjHML5gEtyfAqjFri6jdyMpRudFJgE1HTcr6CoLvKvEByeB9vWajK97X474NYtex3vqiGJi8CpniYi6WRUoU1ahOt7rSZJL4OUPUols+J7F1Te6uOgaG8qV0cF9uP94jsW6YoiyBO+LIUglB+Jsfffk5PehCN8V520GzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165652; c=relaxed/simple;
	bh=7d+yejdsrlH3QQoIfQu3T9oGfryOAb9jPCpBbY/QV74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RITKDxkvscrOWPpnPgLKRp7wJnW15C4SbBq926xQpKkTBmbscHIu1b6WU5YoO90+ztRxEqmC74BkdZ0SiDvGcO/09BBQY/pmFpAqHEBreOSonywOix+K7pNIF0nWo5BurPZzaod9i5dBsXGQ5j3vqhCyGHArmf7g6V+zUmUrsig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yOcK5tO4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yOcK5tO4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471001b980eso28559075e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 02:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762165648; x=1762770448; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JHB89kHBneKoONN1Bve8Z56wcJWNGQNkd4dI7+uRh8=;
        b=yOcK5tO4nuqej16kK7Atw9mDRG+3/2EeWS9Bngyk50vyOlwaMYJqtx3uxd2Ul0iD9t
         w8haVbJdFfY906UiQkucUBXFIFpnWeFXHCH5+bbZz2Ze695tgFwxtFoB/1ih1wV2YNe8
         qYnfE0v052voTOnwlY3CVhhZPgAh8pyzJu53RjD7vSJbUOwN8CyPCCok/nJvj65nczMu
         dQWvofyvIKbn/4WepyUrnHFcT5vOu/QJ30Cq0JR28c7fvkxPHVDPIiYVyV30XjIki14Y
         +cpx4uHAycK6Jhltqhv3iinvRvvOHPSDMnIpTal75jogSYmq+TtLAnKpULmdfUbV6YwH
         EAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165648; x=1762770448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JHB89kHBneKoONN1Bve8Z56wcJWNGQNkd4dI7+uRh8=;
        b=uyY1/lLmSA6tOQf9MlP3ecW7eHK66djK0+VcBBUSX0vpA1C1n4EtuIGcaWiTf31gwk
         /qV6pzqL1eUh3uhAH51l1p9Sv+NkKtqqtMSS6w/FC0FCrTPYTI7xNLT0aKVDDRzj+laG
         BwhP/gJCn0tUGO6Iwb4K7VwQZ4ClfEiUxU8CQQUErKf7cfS6OLZR1czSSfmH+oAZ+lpg
         takeG7AZuauEmzRWdoSx7MvC29XAS1sazcz+Hp8/1SpZOKqVlLtSoHsntORuaV77szGB
         bSW56yRBXlg8TRqkbAFCmdqwJgZSHtGMKZ8/zd3MIzGZP13Infm2V30DK43to0337BDS
         cOig==
X-Forwarded-Encrypted: i=1; AJvYcCWxPFwX7xgvcwm5eBBo05tyA6TPuaS9dS2mioU3lKRqxNZ2Xn9jQOgRoyegDqSRWxWXhnCowe7blXoLOIqTlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHwp1gPVCu2gcIgl0v2UAUzZspCpinAVnSEU7uPmIr5lJ/EUOh
	seM2mLtXom3PfLFi/UNIdLg4JzSzPuYIqx85kfG/tbfSan8kDZ/gwI8CuPfYX8O/58LuMym1Flc
	REhOoBHJWgyqQqe1a2g==
X-Google-Smtp-Source: AGHT+IEOG3seXsKMf1FLja+ssKrdPSGK1FgK6Bcd/d5/Kurpa+pvamoJuJNwVwnI8+e1f24CsMe+Xpt2EsZzMZQ=
X-Received: from wmlf12.prod.google.com ([2002:a7b:c8cc:0:b0:477:d21:4a92])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:538e:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47730890e99mr120076125e9.32.1762165647584;
 Mon, 03 Nov 2025 02:27:27 -0800 (PST)
Date: Mon, 3 Nov 2025 10:27:26 +0000
In-Reply-To: <20251102212853.1505384-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251102212853.1505384-1-ojeda@kernel.org>
Message-ID: <aQiDjuHK0qpgmj1J@google.com>
Subject: Re: [PATCH 1/2] rust: kbuild: treat `build_error` and `rustdoc` as
 kernel objects
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Nov 02, 2025 at 10:28:52PM +0100, Miguel Ojeda wrote:
> Even if normally `build_error` isn't a kernel object, it should still
> be treated as such so that we pass the same flags. Similarly, `rustdoc`
> targets are never kernel objects, but we need to treat them as such.
> 
> Otherwise, starting with Rust 1.91.0 (released 2025-10-30), `rustc`
> will complain about missing sanitizer flags since `-Zsanitizer` is a
> target modifier too [1]:
> 
>     error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `build_error`
>      --> rust/build_error.rs:3:1
>       |
>     3 | //! Build-time error.
>       | ^
>       |
>       = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
>       = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-address` in dependency `core`
>       = help: set `-Zsanitizer=kernel-address` in this crate or unset `-Zsanitizer` in `core`
>       = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error
> 
> Thus explicitly mark them as kernel objects.
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> Link: https://github.com/rust-lang/rust/pull/138736 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
