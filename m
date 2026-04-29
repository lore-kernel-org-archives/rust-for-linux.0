Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A423AE19D
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777450854; cv=none; b=i5tR36I1Akxz6sIEeT68WdvvSWSHbQHcAPQej6RVUMvkuGsbNO3e+ZtFQUPpkRB/zKwOGvZxeB8oyTxGfhcPmTOnHXr4ZIqypftrR9M2eZFtu2f/z2awUFzoZAKgvKN3u/ooRXiYH5505529IG1XLK/qkEoQYBy3E/xcj33PIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777450854; c=relaxed/simple;
	bh=fVGwnQ5XTAj27PIO+qUAY4W+0Xj8D8hQSdjk13P6L5E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bICy444pQiQdbCLNcqgDmh5uIoRbl8gVFyg2f+Kgg9Q5UjWSJPQt4YgOmdJCk4rUhQg5amfvNrEaqKnn9vGv3HO2JOAKCT1KMnWAlK3CcbgLqm59KZvys6KHJoky2mLBEF83fKWF0w7hvGzlYzBTJtOmrQlbmKsfFYN49wk47D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QsrWEjd/; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QsrWEjd/"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43ff19e54beso7644112f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Apr 2026 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450851; x=1778055651; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bluhmjXcTfIn97yUd3T09g1X3EwLW9m0vPzh6yHpaDs=;
        b=QsrWEjd/AUA/CV0amcqJDBBmdBRBhz3a1kGJvYYphCrJXr3j1+Z42oBgW2Pr5P0wc9
         Bx5jz1F0O71RFCJTG36VqeflbFBLXW6ZWAs7PJps/ql62k2WXnydKLDMCpU5mGZup21S
         ZMhhl8gQGZaafhTY3GqTdp5Pu9ramOB+rRGDqcNq+ieXpjSTYqfqM/eWCI2jlG4s9LZ5
         Xx3ezwhYyRKKPoLNzrtKd1o2fB1jyRcYVFHdm2XIwjVlHXxicL31yaA/kZDrPWG0M3Z4
         jip7GjxOP4ZTKA5HiPUtxkUTO7xWXQVzwo/JtyXyW7TPLW+VW9uuqzG86H49I6RTVmAd
         gjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450851; x=1778055651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bluhmjXcTfIn97yUd3T09g1X3EwLW9m0vPzh6yHpaDs=;
        b=KZoqm3zTSDhIE97rBOwjYqx02WLYbSwCn7mwH6d44Vu92OttsFDTyGG5dbKyw9Kb2w
         xUjxemzKQ8gr5ZouMaGhZgieIaMGWs0Y4s1HWcA/3fvpKfHA1E1+AGD6xl0U3bxqrDqh
         4Qv8lLUCVSFpLCceRe8+e6jOWyyCNIh9Un7TKb0PPrw1o6AelPTaf1jrYo1kvNYQ/jZx
         0vGNNj5NokvxdV1MuNMtuo0pmLeAU36hkKxgOKO9BSEtNAIK9GQ1lTmCDnYuEl6ELdWK
         xnZMtFKyeQ0IEXUEwe70yRCAn++DH89w5N6/ZKW9d9xN8qs/XVfw6v3IppxWO6IDnBT5
         6qww==
X-Forwarded-Encrypted: i=1; AFNElJ/+3latAuVG6RulTDE9wljXkr/tRnEy8bjyNGWuqQu0kUZGWend9HZ29SZPAcrkpqUh7hVbZc/zG0Hx1IjrQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYLEgqK5TcyBkJhLsicBORfyPaR7gbmVju+UxDEjCghdNmt5AC
	D8qCGaekh+5tE/ChXbwYbpO9XGcgP6T86R/AjtpkmuNamdPaIESo3Ev7YtHGIv0xpGSL7v8IoTT
	O5N878u1zwOAja5CTfA==
X-Received: from wrrm1.prod.google.com ([2002:adf:fa01:0:b0:445:168d:28e9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d11:0:b0:43e:b0f7:9ce9 with SMTP id ffacd0b85a97d-44647dd17c1mr11460659f8f.14.1777450851050;
 Wed, 29 Apr 2026 01:20:51 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:20:50 +0000
In-Reply-To: <20260429-fix-drm-device-comment-v1-1-d8876b44d688@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260429-fix-drm-device-comment-v1-1-d8876b44d688@gmail.com>
Message-ID: <afG_YvuNAk26YLnV@google.com>
Subject: Re: [PATCH] rust: drm: fix incorrect type name in `Device` doc comment
From: Alice Ryhl <aliceryhl@google.com>
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Maxime Ripard <mripard@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 29, 2026 at 01:08:14PM +0800, Hsiu Che Yu wrote:
> The invariant documentation incorrectly referenced `struct device`
> instead of `struct drm_device`. Fix it.
> 
> Fixes: 1e4b8896c0f3c ("rust: drm: add device abstraction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

LGTM
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
