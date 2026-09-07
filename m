Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE8E4E56FD
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Sep 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789100; cv=none; b=mD0p9j+5hYsAQm4GSjux37lHLq/BlG4V9RumYMxarVmijmrXB0AY974HTnKKL9vub2fqZypxLcgcqSGrhERx8bv/ylpTfaIbrwW5gpbfazaxCO7oah//6otfEVgMcBp+Pq8/Z0HY5QI1uN5aHV9iXPIY1v+ls6lrT70SlZo0Ueo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789100; c=relaxed/simple;
	bh=xttc2vOfucoV3IA6F3qa+k3IZHlmqgnUex2GNR5o63Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sQga4/ddvSqrEoqvRtiaglLPsPpvz/8fO85pVvAMeDcFRhtVjGgDKHZLGH0NkQ6BCLf41IT5FD98Kie9j2uangrnSNTI7ZwKUS/yXHu1vgZPM9IhVjSgx0B9AUtPlQr9B2DIVxWVzUxf9LlzYRbEZUKWv94x2bHB4x7G7zD6pKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EN+DnWHl; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EN+DnWHl"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so24740365e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Sep 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788789096; x=1789393896; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRc0maF7oOjfW+WmBPefhnmOlBXT47molAodoF7dk4w=;
        b=EN+DnWHlsBRE92TsIurI1a2rZDcoDxpEQ0gUEOa+ISvWE7x1b83KVWSQvADMVg/kbP
         x6MMdq1hMJWDCLu7bvZ4daQ5zAzhYQXSqIrfh7MKIyBh1eYb6QQQ8eD64f7adtMPE0cF
         vKBs3bW2kXI0EEtyT3Y1tih//8GT8STZyxRJwxxF+aj91Q/wRoyQ8YeN9rtzMVpVTcZa
         3QjBeA5WXIjz6c0VJYWSsuDQAPctwZN/j3uHlGPWGwf9ujOIHtfTq27M2i+GU3zyiefP
         +t0vUiA6qpvpGq4VVSbKivfY6YeI33EOkIJSq436fFoxNSsDxZa97vOuS47sceNOycHT
         hp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789096; x=1789393896;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRc0maF7oOjfW+WmBPefhnmOlBXT47molAodoF7dk4w=;
        b=Vl+7HK+/D13Y3R0fsFH52g/1duxR89IMIvOumz/y+FIR6tDCcV+GmmdubwcAmcOJgw
         LSpVVBvjrcpH+dA6+cuZ0k8aZ6AAj4oSanHOT1Q3ir6lNcdGfzjQeyGy8UU7ilMdOI6n
         ZvJzODFf0h0Pd9BwsGnUTTXeqAfaDKlxQQlsXWWDIIHtGnPuV26S2qTzcU3G3OzFY9kP
         gte2Xt5G+4aRo9D9p4cVNdZjBcTCaIsFRrHBOc4HF7NdqlbI+eb+AanavRCTz3J5a+Xb
         FA4yfIx8Y69PQ90iMCpUafj/EI5Wr2HJRTuKhByISDm7sATiebS5qoq7laOPE49V0q14
         /9Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzRXHTWAChpUu9MsEKxA0TLNoU2jtyWRcEPq+QEEllrpz49DsaR5Xhu6NeOx2/kv5hR26JrZtG+ek7p9LWNCQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0dKGS0m4pkw+v7zDsOOAWeO1W4NvoonF4ZSRArDDAdd376U38
	Wx7uSeenyag5t1yqsCPHf+5sDHJsEgSQBWJxK82WHNJ9q/69W4J+nURqG8BSdRyGVlm8N+O2Zx/
	4zltVUz9OOHw2+GKAnA==
X-Received: from wmqg15.prod.google.com ([2002:a05:600c:4ecf:b0:499:aec1:2cd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr224746215e9.13.1788789096370;
 Mon, 07 Sep 2026 06:51:36 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:51:35 +0000
In-Reply-To: <20260907085139.65576-1-advaiv2@uw.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907085139.65576-1-advaiv2@uw.edu>
Message-ID: <ap7BZ2dqFs7hy-0E@google.com>
Subject: Re: [PATCH] rust_binder: add missing newlines to log messages
From: Alice Ryhl <aliceryhl@google.com>
To: Advaith Vecham <advaiv2@uw.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Christian Brauner <brauner@kernel.org>, "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 07, 2026 at 08:51:39AM +0000, Advaith Vecham wrote:
> The kernel printing macros don't append a newline automatically (with
> the way pr_*!() works), so the error message gets concatenated onto the
> next line in the kernel log during these warnings, errors, etc. Add
> '\n' to the end of error, warning, and debug messages.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Advaith Vecham <advaiv2@uw.edu>

Thanks! Unfortunately my patch series that changes all calls to
pr_*_ratelimited! already makes this change.

Alice

