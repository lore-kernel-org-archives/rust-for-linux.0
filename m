Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0671BC08F
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666694; cv=none; b=Jnn4zLkGlcwQy48r3+K8drAaCIATJu1nfUxJW8Q55yOxc7fg/9xHqPmxZrqyJfj6fjermY/EtkSdTWJwUzsJB/W0HMT/wXY7T4GOUVmyHMrg9SE1/seqQUUPRYP2ll6pgZLo96qgKmw2E1cJvhHfh6wae3XughHWtN8ar7GDxmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666694; c=relaxed/simple;
	bh=Eo7DFhnAE7RKn0LcYMhh4NcM1gYKa2XxknWTpW5/6sA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I3FB5sh0awwpGETdYYvx68A1QyEAJ4wTW6E1rKe1kvJRpcCLdPXyCpkoC7tKbT5Oy31EHN84eqC3ckuvUVZxZk2alwjWdZPmVPtuNqBaayS7ZCmFGO5Sf0a9DN6mvWTMkzHgrVX78bNTIwtE6fPs5Y2jSlzt1uef1YJsNuiFYkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z9rmA9ft; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z9rmA9ft"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477c49f273fso51551005e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 01:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764666690; x=1765271490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LOvIHNI7MzU0j+TsPPOAcJWACtA74NjlNLtzJ+lAxKo=;
        b=z9rmA9ftBtC0m3vKXSPHUfNKq+2NFtus5/dnN4gBr1Od2du0PqCjAc/yO4K1TlatQu
         lvGVzKX5ebBYqgfLFzz0sQ16Mvb6RWtcGmXyHbkyLoeCc4FPjQMmlJBwMIrkgWhQAhwN
         02DU/dLxAxhVfDG8O2CLgYblWfn/eK0m3BzMJSfKngIBFUsG0mU6yxMJwKDVXho3wTAW
         zXARZWhKxuovQM1XBCO4e2Bte619MzFXAQAdM33ljtkIAP0deT0FFPKQ9hCHFTMWG5Rp
         pKEPK6eTjcw6OUrOd9nDCoQtDnWi5Ju8RnyYXdCqOdcdvJDWWe+tPXKl6fgtPpDxvFNL
         hAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764666690; x=1765271490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOvIHNI7MzU0j+TsPPOAcJWACtA74NjlNLtzJ+lAxKo=;
        b=kKmjxmwxGlbFUawRne7MMz3YZjiBdChQp+qXuzv4E+NgKOj8hi5i69WRmqv4vjTls2
         NvajsaZDADoE89ae+vbP3m6BWY121/+hV+PG/tF46Klz/3tiGIwOhrBRIxGSSakFIk2+
         pB6869pL7V+At3YwGoQS99XP8iWN5cUTJxziV6tkyLDsHklHu8ttHbHDly9lnSWsu5DJ
         WQw84kRcK4xRICfeBFh8nyy+liSVNjntx2p23T/8yzpMoDHGfuYDuWLYFmA0/ROvjo6B
         cEbsWvnjq4TuRVFSzFwp1olCF23HauKJMdNuNY5TFYx8P7hB+AYSquhs+GjIMYWL3xoy
         r8tA==
X-Forwarded-Encrypted: i=1; AJvYcCXSr9rjOLwq57iU63uRSoQf7JbUBY2WirNXPoLAjfEJJ9+vACrAuEchHFYE4yYYqmJWp/efQ/W3voVsG2oekg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHUu5/xj+krjI/YjxgDaDEEpLCT4JHFTW/B2XkhSJzTZa0pfy3
	NyY7ED63IlAhKILLt7cEXmCzgq0qhDjlekd0xNLgzvFh4DomnM7YKihWpNYabMJCcik+xQ8FDRQ
	3kdmrP3nG+Vq5ztGPFw==
X-Google-Smtp-Source: AGHT+IHWIN0YuGSOPLWLOEi5fZHz7mFlcCip2UWeGRVHC5HGPtIdyX2L/vf1Djqmp3KExq+e20Dc7WITCYj8+Ec=
X-Received: from wmin6.prod.google.com ([2002:a7b:cbc6:0:b0:475:d94e:4d5d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474b:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-477c01ee377mr415781115e9.27.1764666690595;
 Tue, 02 Dec 2025 01:11:30 -0800 (PST)
Date: Tue, 2 Dec 2025 09:11:29 +0000
In-Reply-To: <20251201152759.16429-1-atharvd440@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201152759.16429-1-atharvd440@gmail.com>
Message-ID: <aS6tQc8hPcignbjE@google.com>
Subject: Re: [PATCH v2] rust: drm: use `pin_init::zeroed()` for file
 operations initialization
From: Alice Ryhl <aliceryhl@google.com>
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lyude Paul <lyude@redhat.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 01, 2025 at 08:57:58PM +0530, Atharv Dubey wrote:
> Replace the manual `unsafe { core::mem::zeroed() }` initialization of
> `bindings::file_operations` with `pin_init::zeroed()`. This removes the
> explicit unsafe
> 
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>

Thanks, I'll pick this up for drm-rust-next once the branch reopens in
two weeks.

Alice
