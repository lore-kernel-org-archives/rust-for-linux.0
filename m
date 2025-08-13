Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF182D5C6F
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069487; cv=none; b=ZWnW/qkeb9rqCQGKZvJoKjt8qBADsc2DBRDU8nc610FSGQyOhP81/QrOGVhMKzTBpKCvuNvqvYu1o7RuXwrMlXIqJkZbaoWlCRfYJC66M2KNKO/l03uBLGyqZvJe4QDEvv9MMoo0j138jB/IEKU4Ia45GUmEGMiGEjZwQZOUYSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069487; c=relaxed/simple;
	bh=sPWPCpPwShzFiMT6CKlCXRbcuSDh5ua57E9eE9f66x0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZBFbk2vwIBVeKBz47Clr3cQ60l75zciJR3Zxwcb6fWIimeFpKFyXUv9lL12+QT9RrZM22LTeAiq3gyoTyYIA3dt8hYFCOithROTsCrYCr9gnPjxlxPOWFtIbtaF5LX4JHUFaCt2jL8PF1G4LE67pzRFQ1w6So5A3Y40cGnrPYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bbipfT0Q; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bbipfT0Q"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b788e2581bso2979614f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755069484; x=1755674284; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzwpjQYxEeh146hCNuF74/A9Awy7IkKcC2sZoitYFXY=;
        b=bbipfT0QRMoyHXIAdg+gd9Lds5zGi05nUUt7uAzLIaV9D3OHLYWle2/uBLaoHnGlk/
         6XKOknYCBszvL/1M5cHGU4ZpVAEG/khjdmN3OGI158+0rtGzovmYogGMSqDtjfnfEs+t
         y127uxWdQOdBwMTx7k0aznKSY0H3XOXjTiJPhKGf/8GsJoHYjk8OOGOEB5dwK7mR06Y6
         OaM/Xd9Wej5tg3XnzgQ8TQkyfK5zj0RzWLObTd9YtybfKNXbxM8PaUOFr3gtKs9ulcaO
         hOehA1fRES/axMFglhzOuTKQUZMB5+TkIaV5ioQ1vY0TZoawujgMu9lPazT9HQ0m+ZZj
         xGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069484; x=1755674284;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzwpjQYxEeh146hCNuF74/A9Awy7IkKcC2sZoitYFXY=;
        b=aAaX8j/6fROgEeteVHd6KS+mMYQIwZAtmvkXLZEDIjv614n06LojgzQFpvqMXlrmrN
         XhuKoPJdfC97+mWslu9TEH7VZM00NdB8pSavdy4dQR/TAxnpNoMdJmYY//cF7jAB0gGc
         h4KGvqdRIoRehdPykbCdmrqjVmcv+6nIt560OIoKLynj0AcjYYJK/tzo+fOpzTWt72At
         oTltptM7zkw4H4KtR5zloEF8/9aeUJTOWE/qs9PkcpwsLlVwwP23t2fB/m07/Nd7IsaH
         qy5chzKwK0JyPIGEnwzPUphCiGT1iYRJvLXK/IRKz6g71i49nmimSddwH6sFe36qWaso
         h9og==
X-Forwarded-Encrypted: i=1; AJvYcCWsowVYgfomxJBt8XvSOO/qxQO9NPmZpbieJOPzgPkQ3kM6RlQTlawnVABw0CBN5S3OS+ApFlKOwva4cvGkvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfhXn8XASfqDACqIw5oxqjG587Rq9krLtu9yZM69gOSC8KDQtA
	/YZz2N7YzSRkoCptwxFeH8+bA2j3zvYqBy4Ke2acBiWzogNo4uhximi35BtZBzGIlHjVQUZhwtv
	Waxfs4VEnxNgSoOh9VQ==
X-Google-Smtp-Source: AGHT+IFYBSCuYTUdmry4oLbAzZ+PQAZNZZrLb+T/c83Ca2zlX+gpWOhZSckyieIV2C06E1FjAI/637OzgaaH4Oo=
X-Received: from wmbek12.prod.google.com ([2002:a05:600c:3ecc:b0:459:df6f:4ef2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4305:b0:3b7:7cb3:1124 with SMTP id ffacd0b85a97d-3b917d2af6dmr1509508f8f.11.1755069483927;
 Wed, 13 Aug 2025 00:18:03 -0700 (PDT)
Date: Wed, 13 Aug 2025 07:18:02 +0000
In-Reply-To: <20250812-rnull-up-v6-16-v4-2-ed801dd3ba5c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org> <20250812-rnull-up-v6-16-v4-2-ed801dd3ba5c@kernel.org>
Message-ID: <aJw8KiOJfrGAVVBD@google.com>
Subject: Re: [PATCH v4 02/15] rust: str: allow `str::Formatter` to format into
 `&mut [u8]`.
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 12, 2025 at 10:44:20AM +0200, Andreas Hindborg wrote:
> Improve `Formatter` so that it can write to an array or slice buffer.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
