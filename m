Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640623F417
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766218; cv=none; b=ol+264S7ke6AZhlytaV0ukgTSSa0aBzwKuJmW9rxR1gVfb224w/ZJrgPOyBKiv2yrTiC1rbqK0LO6WbeVaM3LCL8VhUspgWskDqrgz9wgW4T0W/pRXW8phUHSYtCDO0Uwa7H8LaiCGplaKWLCa624+oGjPczEw9chIoBT4eCZCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766218; c=relaxed/simple;
	bh=tCq206NdGSXhHhkxeyivxiNaMMGS4bP8iHd62J1xHE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uWADuisnBbnp97pDF6SAE1hv3WVcVDUR4mpON3xbuo9sCHxNG30vDOJo792cgUihfSJnaKKEypPPJbJAHwbY6JHrkT+QHa895UJyYuEQfu5ftTvlooSU7T5vOJKdPUsRvEZyPZfdqDzVa7vHU29JWu3b+BRBdwhnJpowP+fZV9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FND1wwhq; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FND1wwhq"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4777885a071so5813935e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 01:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762766215; x=1763371015; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DCz0mrUxydHy6qjTOATBcYgT6UozKbC5ALC3SvZaJg=;
        b=FND1wwhqnhZoLnIgASlyTbkw/PrUltyKmDwLE9+sMv3/BbYEiJFIdvYt5CxGZUSo0z
         Cxq1uYnBXDYnPmsXEkjPT/h05LpRyfozG/8IK17tzJG+qhjHgtVj60srIeK9yiRJYqlt
         sNSB4wi6ntGnr/Pj6wvrQnMVGg0UB6NeF90ICtwE0Qo8W3NCHcRknaPwKMygb2b1SOVp
         x7r5SyqaWTruibsv2a8NLmyeoLsmnSga3i272FEH59lYhuUHIZ5VA43QZxbocZR/ghGL
         u4T30tQLw5mDWNX2yCgo7O2UUfkHRo4PNqCX44ntUkOKF83w1jHKbVUhxmGwM1vgl5Yu
         EhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766215; x=1763371015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DCz0mrUxydHy6qjTOATBcYgT6UozKbC5ALC3SvZaJg=;
        b=F+NAb5s84HAgTYVR/Pb4XDPmcDS1ZaeynuH2Dc2XE+6A33zfOzP8p5sHpYT5zz2Nfo
         CdMb1GP1LH2r2y1FyOpxngOi/C34xJ8Fz4u4CeoH5h2SptcJRg34amKmG3tsaTdJMwsz
         bz9GHTZcGNQf1AgXw6clq9vF5VgJvmxlBpNo737AFUS2roVFGz4Fm9midRu5Jt5Q0MBk
         7KSfLSH8nvKn7o4EzCNf3Plr/wHzAd/hOSKm0yJeOnocrO/unf+i+B54/Wr5P6n+ROC0
         Rrgs+woj3mNJCt7UgTaoeUL88vfU7oDV6ROgToVtOacv2qsKv7rRW94+WxLWWkoENvCW
         11Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUd2FpwyWT+6afQQjeJUGyz3rlSnvwr7eo1+XpdThk2fKMm2XsBOGKUASzyBgmr6eEVzev5697xDqims9Hz1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzegjQ63nwQ2FI2f7eoe/B84SKMtAbtl4sIS2jNc9RfNudk9yHP
	A3h70uuT2u5Y1LpRT2NRyljtP7qv2CX0ciqqtXLKR7RIw/UvdnSCeDowdHr6Lf9gHABuaIkMLcl
	ge3vRlHd45i7lg6/udg==
X-Google-Smtp-Source: AGHT+IHJ0Wfc0oAyeXl3CzhYOpmTVuUwWYrw7MhcHKSK7WmFvUCgdXgPO3lw0ZhkywgHCWYQIR+SztdrcuiXOf0=
X-Received: from wmbjj18.prod.google.com ([2002:a05:600c:6a12:b0:46f:aa50:d716])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc7:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-477732834e3mr43391405e9.26.1762766215290;
 Mon, 10 Nov 2025 01:16:55 -0800 (PST)
Date: Mon, 10 Nov 2025 09:16:54 +0000
In-Reply-To: <20251107202603.465932-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251107202603.465932-1-lyude@redhat.com>
Message-ID: <aRGthqv1efOU3Ic_@google.com>
Subject: Re: [PATCH] rust/drm/gem: Fix missing header in `Object` rustdoc
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Shankari Anand <shankari.ak0208@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 07, 2025 at 03:25:56PM -0500, Lyude Paul wrote:
> Invariants should be prefixed with a # to turn it into a header.
> 
> There are no functional changes in this patch.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Applied to drm-rust-next. Thanks!
