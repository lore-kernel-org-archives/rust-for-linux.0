Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114CB3168EB
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933201; cv=none; b=Lpsd02+jEgAiPep3YI5VrdynSCT8mjb5dVyKE4jUMG1nrYM0qatq3R3yOyk1w5H9dxH/S7gOaI1cDBYE6tI/g4nnOb+KU4Gt75TVKxCmGOA1w05DwDmFEKWuUnkkPZrxE6nyPcgJ96PauQfSBM4IZLVc4d2SILZpGzwA86CggqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933201; c=relaxed/simple;
	bh=qTBzb2ILROYw31tCgd2A/NyLodFrdfF+xyib5RCJ5yc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i5L9w5mNiMyDNrhbDvPUHEjcfWbMc95QlWIx23T1CroxTWfJSe9DY6NZNFuWWNFfxYm1OzRyiARLnnHd5MEbS9gwR/iHM4XXfkrHL1Q9VAEnLfwkjMbkUpocOkCFaVv0lqOaMsCI94M51u/B9MdkBPVA2LTCAgNDyztUWsy19CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vt9bQZDF; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vt9bQZDF"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493c55d5ce5so15589715e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783933198; x=1784537998; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13ph25RP+6ZWPmb7iW0lzQYI/Ll3M99P1qJ4r6ze0mg=;
        b=vt9bQZDFSOOoEHCloP+X1fZxpFSuiEVjSy+qjWaxq76I0wCfIG0MFTkPFKNmerukjF
         ROk2ueLYAPJZbyPD2FUfX4N+IkRCvdR8PIWDr8awXlTs1ud2LXfZWa2nfRj+D2bqk1n0
         9CU8ResynJzeB5MkRw5/9saxXiO883gXZS+iVBPa1zHp3hLEgyTRCaIGhCVe8cpMO6qR
         OHCkCwoVa8Y55SC+TIc793QA5c7+85WhKdaznrbbClWHLgDr1/0E0sVJJRFMHOVt4jxV
         lUXtI17mVcEqvKutlN/c9QBBKXTQFvMM3FqFT8zMVTK9DvnqYRr5j84dxCk9oVVyqnYv
         ZAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933198; x=1784537998;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13ph25RP+6ZWPmb7iW0lzQYI/Ll3M99P1qJ4r6ze0mg=;
        b=Fd7s0iSZJ/8kPOiFvyjmGTDtAwu5KNNRCLaVbPl/VmOXFL2XXSmdVVkH4A8tEqvvXj
         xZaIy0VYYjwuT77jF9jbNxQDBKKhVMd8qGwJaa7ATfgSjEioznApXerXcgF0tGVTv6bY
         4cpOjWACL0lA2y3/RM49uAaQaiWmin0T0RB6WEpamLbNh6eNeNCYJjuQRU9UbSrYOfbX
         8o+pc6mbr735LDdJ2SQ3sTMEg7gVXLje8e8y5jIC2R4hFsFKM4ydoKPzyTIlxy1pVcHG
         XAUzIvwnfuPmc1epuRkA+dR5GbbadOW3UGIeeegAvKEWYfE0lj03rpWuzLf7j+SsDEqa
         ZDyA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7fCKbWrKAhFDS03u9apb/8/L93dTv4UD3Co5svjVh1T9X0CS7kOFLdrVVAludEmdu9SSLce6uPv6x0xq+fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN/490WzE+FzE/el4xphqlll9YmJWBzh1+P/itdjiRmJ4vZqGP
	Ft5YGl0SPvo7yy8nnPUgE5iO5sFwS748aN8hKxkSQo5mRQwTc00q5OG/A7FtMSsf8hVUSe6KW8v
	/BCZty23TFQ8wHsPXdA==
X-Received: from wmg12.prod.google.com ([2002:a05:600c:22cc:b0:493:f7d7:4b2d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348e:b0:492:40a1:1e16 with SMTP id 5b1f17b1804b1-493f87dc629mr81057725e9.8.1783933198144;
 Mon, 13 Jul 2026 01:59:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:59:56 +0000
In-Reply-To: <20260712235246.3069713-4-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260712235246.3069713-1-tomo@flapping.org> <20260712235246.3069713-4-tomo@flapping.org>
Message-ID: <alSpDAILCIIU4q7u@google.com>
Subject: Re: [PATCH v2 3/4] rust: workqueue: use Delta for enqueue_delayed's
 delay parameter
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, arve@android.com, boqun@kernel.org, 
	brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 13, 2026 at 08:52:45AM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> enqueue_delayed() took a raw jiffies count (a plain c_ulong alias with
> no type safety), so callers had to know on their own that the value
> meant jiffies and convert to/from it themselves. This mirrors the
> issue already fixed for CondVar's wait_interruptible_timeout().
> 
> Switch to Delta, the duration type already used elsewhere, so the
> unit is part of the type instead of a caller convention.
> 
> Use as_jiffies_ceil() rather than a plain truncating conversion:
> queue_delayed_work_on() treats a delay of 0 jiffies as "enqueue
> immediately", so truncating a small nonzero Delta down to 0 would
> silently turn a requested delay into no delay at all.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

It seems unfortunate that a caller might be forced to convert jiffies ->
nanos -> jiffies if they already have the value in jiffies.

Alice
