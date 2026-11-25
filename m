Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618999;
	b=mbv1OZC9HH1D+t9aJROhqtkNsO92RfyUAx0KOmnD8RW3vD4sywXT025VJVC7lclLpRFw
	 6/96CzQOklH4YUagIEEi5S/P+AEJ+q4CCq9DK7mIAUHAqEgxwslgv4hnYY5zNttiba7v/
	 5OvGFx/P2pMaYf5TPMuCI4HTlzY3YYi+VgzAct9Whdg5XyIY7CmodiNiPsvyuNWiQKA73
	 4g0ojADfl9CSlH0X6iaxL1tnyjQ1T6n0lK5utYeYsxbpls/rtNIYl+Yku0+K6latDZpMH
	 2sPWb6j4IRLNnqk0ybZPv3R0hx1+p5/Xq1MrERIg0a/tXfv/5efrHU9iIGa/KHjkEkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
	b=C6qFvU+EY8WCabDXndMWtsvmIm9cwSkIF8N72Ycw3uNFkT/NhSz1Wc9v0SA6qkQUiiVN
	 jvAX72UWJua7q6oK6F3faVBlA1GUC0yu9+WF84Xg6Bs68sSd5qhq46ImRu+ukvKPCrQ01
	 01EmBwS2vQyevpO+fwpwuyPP6oOcqSw/WqLQQCzfptQ/jWn03qXmXLBDT8cQKZLQviJ4Y
	 UfTHv/l4gwEcbvF4c/9qLoFLsDcBV4b68ttbg+B2sMA024zP9+a3v5kX9kyswJGYH2gn1
	 /y040xhamwcZoExBt2psuhc1ECIXhRoMSdrMxWOYhTpLquCpHP4qzA/9Y1RigFyJroA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A78AbNie;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B559606A681
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 15:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B559606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A78AbNie
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso41752375e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618997; x=1796223797; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
        b=A78AbNiebNcNklyGszsJq8iPMepM+a6YL5fAZFdxaO9hs88QZZ/buRs4hMEgXNv+Zz
         ulEuzpfSlOsD9TFztYZ4HeQ6DOrR94+9N7Xs9SOaACCfJQ4banvsFCS3rN/KKZrxNksv
         5w7wG6TWmacfS1GFN6P1AGF97oRGT64FjuEMJTUiJRXt1xz1xbujYKs2izTINehVGc+p
         baKL/xKMIXxWSgSXnGZDYuin3Uxz0yBdqwnMziFh0e/84mnxNjU2Qn0KclZNeEGHyVBp
         FrVo0PmtvLzXll5Ktnb+qnuGp//Tmcfz681NGQTB0/Ccpnj1wQcj+sGCdcNKZg08s6zJ
         P3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618997; x=1796223797;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
        b=H1+D9tS2r6W0n0fMCEfzN8Kl5OvzHqD0vtcAJ/rp/erlOWa4JXqUiUyf0UlFP2gKm7
         Upn+AmkjfJLev85eGS+HvxdKWRx82reYS58ei5Z7rY4VAah+1p+IEg01ioT0Y1WoBL1X
         OyqX8kIrNFnI1ADIwPVccOmSgmPC1l+/f/WIollm4I6NKgMGUVzxCFZ06fqrh0sWEGCe
         ZmOm+KjmVMXWoWqVZRKOn4MypgKLreZKF02EaLYrrfzZRXb29klxRhy2dWgRl4Auz7s9
         6MoBdof5qkKzP+uhjgNyrnGBPl8k7Or4bu8NXNaqXAcgMnvxn4eRMG5NzNd00uLYzzxo
         Bi2g==
X-Forwarded-Encrypted: i=1; AL+hErE3ul1HXxVDiDtMu6eaNi+VvbmIvm6r2dCXXA/LRcgq+GSLnNb2x1uxeEKdjmxLZ4WeFLqI5i1XudoIzvcLKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8J/IjrLPRNqS9Sw5jNHvx3oonFWUri1AFvXaR4Hl5Iew8Z/Wa+
	J/LETcPIiQIBiujjC5LgFPH3yvshgIZetXoe2NK5ws88eKVD2vF/COpKJlPQCB/65CmmZ0kbsoT
	rNkOP9vsZ+AX1CwNFCw==
X-Received: from wmpr23.prod.google.com ([2002:a05:600c:3217:b0:4a2:e03:1f55])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d08:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb8882bd7bmr363816705e9.28.1795618996639;
 Wed, 25 Nov 2026 07:03:16 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:15 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-4-000f7a9ccb8d@jannau.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-4-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150315.1587936-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 4/5] rust: drm: gem: add an is_imported() accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 12:37:46PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Drivers need to check whether a GEM object is PRIME-imported.
> 
> Add BaseObject::is_imported(), wrapping drm_gem_is_imported() through a
> C helper shim.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
