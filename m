Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2549C38D6A9
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658100; cv=none; b=EYPB6ZxzT4R/zDrZVNDyVqRWyM5fewR1/2041JrCEDyJvAREjzSqbQJ+f+4gVpz/M67Hickgl3qOM0YplAhQqrL2mTMPZDZAvy3SfG+3iwplY9XlzjIrXhcgDpzc6C+ipYknNOHLMCpgf4nS/K+UkJnumdlmwHI6muLPpOJpKeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658100; c=relaxed/simple;
	bh=3bxLVrLsrCrvMMhEGWK87vHhkr0D8+7PFfhtA+bwGjo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I8cLHRUIMge91JD4rx/wk+VGZj/cuNz9Kn8Bxh1weQiYQFm5V4YM3xS+69RRiAQB2Qu3+k1T8TmZFrE49XF1OiWWTHXGSl48ToAE9EDtw0I+lwYovDc6qORaOpDgkgdGR9MqZ5Qt2K+zOEg1/zGiSCnxhW8YiNV2vn5QhmNzyKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxsbdkoQ; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxsbdkoQ"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853b5b0fafso55415255e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 03:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773658097; x=1774262897; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cUOGpPWcKDo+U5VR1NrHCLemu1A0Jfaz2D2lBYpe4+s=;
        b=fxsbdkoQwXd2PIakKzBh1iw7mDbWkyrqVbjZ3tIPkZ46MEKZI6f8odoPjh8afGrTsS
         8zfYkn7s6+UpS2rACsolMn3Oopc93two/2veX6L6BmBndYtilN9VziX6+FqPZ3mBGDld
         8MUumEFQvaOadyuA51dVTJVoIfNHHnAViFSgzm3dYcNrHW8D8DFuYdzhzdK5q7LfB/O4
         0Xv6t9wY8UAx2cQrjvTAMDFewuV5lk1VzyOGVcFOaqz9LGLzpTQbF1lmGEHUborbc11G
         OFVbNyrnQyQRoikNMSH+ClM1K5q8NSDqRmB/J4BQRiWVExo2d6l/9vGqwldpKmc2Fomq
         3NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658097; x=1774262897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUOGpPWcKDo+U5VR1NrHCLemu1A0Jfaz2D2lBYpe4+s=;
        b=dC8HdSjkz+xTZO9/nKGls8v6arsg+FWD6PXQAED/addW+IZtknEhCNqRBR64u1GDiZ
         ppRQhn85aYfq67D4t49HQDkWuwArNoMZ9DjbDrzTBx6G6FeDpgGYa69ohE/UKN12LcIU
         hSkvYI5Ahq93a2ne6S770PVUAI36O2zC7KZqU6oaiJDNC757QO4i2YKziclKsB4/DfVm
         lhzHt3IH4KlvJ7pod4LrGqXFpVBaHEjaXkMY/2ZLNQ6m81nvYaNZma6JyEltFz0SDp8y
         z5cGRSYgZP0wMueA67uxRclSkjR0kw/6esmhZpcNJkS1u1F0UFWYfcQ1W46BLRcxy5Vk
         69Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVXkUCBacRYmPbXZXzPxYRnECjK6KqNMrQY/BRJQxrYjAR3sp6qWAyi70qMabYVEY/jEyeAv3b5fdXjzeAeUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKt9e9l3ldITb0LduRLt4fh0HHJfo8km/ht7fvh7DQKJWZyWie
	Pq8VGOOHOYeaaR5t9D+soDrqWyDnB4vvs4cE+rVPz20LEZYFxG2wYz8VJW53F8NkAseFWpRFO6S
	lzdw+AdKV+FV/+wBdtw==
X-Received: from wmco2.prod.google.com ([2002:a05:600c:a302:b0:485:3b4c:3e34])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b14:b0:485:3f1c:d8a4 with SMTP id 5b1f17b1804b1-485566d6e54mr215274655e9.9.1773658097378;
 Mon, 16 Mar 2026 03:48:17 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:48:16 +0000
In-Reply-To: <20260216-rnull-v6-19-rc5-send-v1-18-de9a7af4b469@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org> <20260216-rnull-v6-19-rc5-send-v1-18-de9a7af4b469@kernel.org>
Message-ID: <abff8Hb4FAN1e39U@google.com>
Subject: Re: [PATCH 18/79] block: rust: add Request::sectors() method
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

On Mon, Feb 16, 2026 at 12:35:05AM +0100, Andreas Hindborg wrote:
> Add a new method to get the size of a request in number of sectors.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
