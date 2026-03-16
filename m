Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A638D6A9
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773658224; cv=none; b=hmQubvK0vBrJGRjM0yO7XWVa/3WyGtKTOubo+rb2h9ZYvyXuBB03TuLeH2dBMpZxKzAs/1ufU3stIIjkwhVhIki4rZGsxPnfHoNXk6KihC4NG8BIlD6h305KeJbAnqM23sAk3geHFia/RXZDP1zi6UUTepBAE6Fwqo3JXQMvB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773658224; c=relaxed/simple;
	bh=/GSWFR/pM5/df7HwMsjGIPrNXwbMBghAM7Fw9l1aLJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jHcQFZ+QNqisH98/juJsHglQhN+2/fVH4RTm0bMTf8W97plxhG+5tYx5gC0MJeaD5qkuAKbrI+Yk0PQttD+9qHDNbYjY7Kmg8aQcFicgvjo6xKTqW9rqJEzwL9xaom2gF1jOWoWYxUXfbOC2gVm0yP7tQsVGFi0ldyT6h5OWFQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HVzvsqQW; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HVzvsqQW"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43b468229e8so290800f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 03:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773658221; x=1774263021; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CN70017b9XscXy7JbJrHaMQDBe/xTJqIeRZ6kPNoH6A=;
        b=HVzvsqQWoaa24CprDq11YBa0EJK/H9aExVa7hZIE4acQ+YtHqzOvwdVQRmU4D/F9tA
         3xjsriRm/CFpES/RsDZgLyZ2GFnjxmrJ+iUI2LFTeCH90pXnTgE3JC469urplOZBwvgh
         FbjumMn6Bb5WYEALg5PdXKE8YrqMXtX4JfIqGwoDFJjvj6d7bqH/h4rA4S1UgdiHzldd
         O+hHI/paAaYQIxWxi3/2DROBl8beOBsuSP7RrfXdYuv+325hR1eC4BhxqfyljyqtH0fy
         OdQPq1EwEMAxvMRNI+JDPelj8gV5QZuHMztJY/D6AvOrqyppX5OkHqBQxy24BFmWT0iv
         7mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773658221; x=1774263021;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CN70017b9XscXy7JbJrHaMQDBe/xTJqIeRZ6kPNoH6A=;
        b=nOTQllbX80f/MmNjo6Ca2zafwAR/Goow+eBRdSVAVZCmil50e9JK+QDyXekhiNnMXC
         qQGmn/qycN9wROznXfWpYUlzEeU+/wRoeDoxGLVSb3dTLtYErVuv9VgdzHpQOPvsb1vP
         kqKnDdq8Pyo1fpI6bf8M/Tk28e+nJ8/wgGJlMDiaCkljEuA+G7s8EnNqRcHy0EwyAW9s
         K+47It4WJ4gO48odDQDGp/KJz0i+Wczc1RXrakGtd3be/DoKdXnzVgpNX9BH/RzzM3YZ
         ex6Ft863ZXmKgJQOrvetMvUbt1Gs+i9qiwVfGlYRPm6bWZXL0u9u89rxSTaOYZU4J+b+
         j6Bg==
X-Forwarded-Encrypted: i=1; AJvYcCU28k/qbJCI8Fthq6tfT3MF6XNE1sKUiuqcFSgaD8gt31JZivC15zZFCEi64MMXZ69iOaLCDGmxbPWtuIcE7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwRjuloecljjS1m/wwHxsq2EZTe3h5ALMvUIe8FHobF8nY5QbJ
	QC0ajSX9aGK+EjCh5rMK7pRcNBvA9kbC6AJ9TQQYSbQpFn0riw8wB1x2ecJjJSg0nDcLa/JDFP4
	Deneic+lMakFWHOBhTA==
X-Received: from wmpo26.prod.google.com ([2002:a05:600c:339a:b0:480:6c91:3efb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4514:b0:485:2f6a:6ed with SMTP id 5b1f17b1804b1-4855670b701mr196241325e9.28.1773658221003;
 Mon, 16 Mar 2026 03:50:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:50:20 +0000
In-Reply-To: <20260216-rnull-v6-19-rc5-send-v1-19-de9a7af4b469@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org> <20260216-rnull-v6-19-rc5-send-v1-19-de9a7af4b469@kernel.org>
Message-ID: <abfgbBjloS39qrbM@google.com>
Subject: Re: [PATCH 19/79] block: rust: mq: add max_hw_discard_sectors support
 to GenDiskBuilder
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

On Mon, Feb 16, 2026 at 12:35:06AM +0100, Andreas Hindborg wrote:
> Add support for configuring the maximum hardware discard sectors
> through GenDiskBuilder. This allows block devices to specify their
> discard/trim capabilities.
> 
> Setting this value to 0 (the default) indicates that discard is not
> supported by the device. Non-zero values specify the maximum number
> of sectors that can be discarded in a single operation.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

If 0 is a special value, then it could be slightly cleaner to use
Option<NonNullU32> or even a custom enum

	enum MaxHwDiscardSectors {
	    Unsupported,
	    Supported { max: NonNullU32, }
	}

But I'm also ok with current design, so:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
