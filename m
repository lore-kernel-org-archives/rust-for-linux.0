Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36D3E8C70
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361103; cv=none; b=X5tuHvHqaJ47/ryc2+qZHLk6EqUJIdajw3coLcJNOITVj2ATTyuC7Ya7jby/SaamRDk35LuBuWGUh2TmUt0/Uvafcq9UI9IF7AWkv2ooobV7ffKmkOKASqTVLpWXwlY4QVxpHCwKUgNnpsxQBP45+/tmVPbCkn9bGTw6xgdJP0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361103; c=relaxed/simple;
	bh=LX5pLfBgJOfNpsO9FijmGFyFM1foRZCPvIIhllinNRI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VvherKFKFhkiwC6iOVAw6sZ7QcrWpywifhtDT3vA6IQaoKPoHRpcwZYBMu49fcbPNFuGl6YCB2M7kvMCvfyg4TUjtHZyHREo8gVX7sCsJB6N8TLrVS9OXdC2RRKY9Ryjgwvf47vlxiDZl2Mip8g+E9a6NAWC7Pq1wq15W/Xhx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qITnXv2W; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qITnXv2W"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b934e96af9dso1161795666b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777361101; x=1777965901; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ5yFfShBWBYpMcznSUsRaXS61QWv/Z8/quc22j7qLg=;
        b=qITnXv2WcqClnyG95lM05OlY72qwC8hJit2NvcPpo4Q6ZMiWSIvPTbUTKEdpSxiMDg
         CJN525DFIh8dTTzFsy8mqXZ6R9MHKwRvKtnKcpL+PAmPzpAR6k6/KQirETGa74eE613S
         LaqF3wKLLyqcG5YJjkucesmfuKg2HCD7jiT2sS7nc3WqOWTmQ2+zgIS9NQGDo0QEa/Dw
         uUNjDshEphdj+Pwx2GOnln30/sqhtVHR45LhmooGvJhkJlTQX8NXqVMJtRRISrMLn48e
         SOpAQ3xYJ/yY9IxsrSHyNe/S0QG/pnHc66/p5xSWvnPZXfCbA2/W3066mceJ7I2TBx7v
         s9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361101; x=1777965901;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ5yFfShBWBYpMcznSUsRaXS61QWv/Z8/quc22j7qLg=;
        b=MTz+Xh68sXPDegcCguHySHjVnDz7bg5kpqPxYb480JmIG/lDToaDOIne16Zy7k9HGk
         fVDF+0FRfU1MpI3l5qXiQhZz94XHUpLWrNUFlCkkaANvRBR8jExCp9zisSlbkOcpVi6L
         oQJ8Y1M2GBIwknxdhHbYdaB53XWT4OFClfL2dmgOijP54p/TYQQE8+8w1jhZ1no67XcP
         lCA8AulFyDalZVvnvx1aC0VALYz56KEzyzyXguEi+UMTmJBwXrkLCiISk24T/ym87cL6
         A0jGfpu7Orem3nqPb8SjPrEF3W0yD8i/iBBKSDJ/W1d+OS2V2KGngAOKDwK6PBc3lvC0
         Q9ww==
X-Forwarded-Encrypted: i=1; AFNElJ8WHOVo+2tlom+/qVEZ1rrhuvA6UJK55HeyH5isGD5U0fXTR2UDzAlrhlH4aF689NyNVcMfQU6n68BA9q5QqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZlF6/vL13d4CzcBYvxS2mmvB8hDEJJMK43vp09LqG1NFDq0l
	jbYxiQWSaEjjEdpHpz0ydrxS7YqXeoo+zWk62yFkl2VY+bsv0oeAHH/HJgki31gQIbY3r1U6irO
	xzJ01NB5v/ZrSK4bZkg==
X-Received: from ejcgl16.prod.google.com ([2002:a17:907:3c90:b0:b97:914c:2968])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e9c:b0:bae:642a:8712 with SMTP id a640c23a62f3a-bb804728367mr108142566b.26.1777361100566;
 Tue, 28 Apr 2026 00:25:00 -0700 (PDT)
Date: Tue, 28 Apr 2026 07:24:59 +0000
In-Reply-To: <20260403-lockhold-v1-1-c332b56cd8ae@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260403-lockhold-v1-1-c332b56cd8ae@google.com>
Message-ID: <afBgy7x4Hui3Rzpp@google.com>
Subject: Re: [PATCH] rust_binder: Avoid holding lock when dropping delivered_death
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Matt Gilbride <mattgilbride@google.com>, Paul Moore <paul@paul-moore.com>, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Apr 03, 2026 at 06:18:58PM +0000, Matthew Maurer wrote:
> In 6c37bebd8c926, we switched to looping over the list and dropping each
> individual node, ostensibly without the lock held in the loop body.
> 
> If the kernel were using Rust Edition 2024, the comment would be
> accurate, and the lock would not be held across the drop. However, the
> kernel is currently using 2021, so tail expression lifetime extension
> results in the lock being held across the drop. Explicitly binding the
> expression result to a variable makes the lockguard no longer part of a
> tail expression, causing the lock to be dropped before entering the loop
> body.
> 
> This was detected via `CONFIG_PROVE_LOCKING` identifying an invalid wait
> context at the drop site.
> 
> Reported-by: David Stevens <stevensd@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")

I realized this tag should be:

Fixes: 6c37bebd8c92 ("rust_binder: avoid mem::take on delivered_deaths")

Greg, can you fix this on apply, or do you want a new version?

Alice
