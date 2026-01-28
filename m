Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38C225390
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609401; cv=none; b=Tj0XLqL1o08XGzSkIGEfxwC8xgq4CkWkvZBK4KVDPABcKwOX7FiODfh+ziO1449B/ZiA5zFsvwDlachBNp1S0hnzSFVsxOVHjl5TTEoAIaT608Pk2mv6VkNknVaS1VGX89L1i1/ncmpOHohy56j8pvoZX1ftl6KLMNZ77mjAaps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609401; c=relaxed/simple;
	bh=KQKJ2NM5KpsdS5GxEPB0pajrRn/ulYpU5bm1MgBI35s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hvuJVMiGX6qXYsTwrld3trSZxE4SlkHc3FdML2LAXyaS8ZgqP2Vjy8oyVfWuVTaDT4H1VElicQeZpCTAlTCi8D31229WtKPDKqvhBDIRiSWf+XkIBCAa8AnX1qduoarlgvv5bobbGVYHg7J0WastgE7rcYtP/nNLvKLEpotiYD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UIksqpY3; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UIksqpY3"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4806cfffca6so12222915e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769609398; x=1770214198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nDxPAH4VjPZfkKt0GaEQRIB4+0j1195dNkEfbt0FWMQ=;
        b=UIksqpY3jymxCX4LSy5ZpQl+JvZiBLdcOeQ+wTRsV1soINVAvWo2pRkpJjvDGqsWnD
         KM4XwhXz08kKY8VcFMbGtZxQU26Tf7KdwzzKlJ00J1Y+NGfx1xNiQu3IQ64XfS8FMoF1
         TANKPU+mYjUNVMLwPF8d8bGLmukJMNklt13iScjzxG2dL4hLuBILESbJDynoEWgTBcII
         gdY7Rxgtonw43THaT/rMjPS5nOgEr0gSqfU53lC+6+3cNn4EBDSkMsCOklRiWX/HHu18
         IQmsrFhE7wBxE/xqWdYSiecx/2D323gj/FjIg1E0lxX+cg7ilLe869dVN/jmF7nWdIYq
         KBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609398; x=1770214198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nDxPAH4VjPZfkKt0GaEQRIB4+0j1195dNkEfbt0FWMQ=;
        b=TTTQftynuQ5lyLTQ9s81iSnnNy01DSkbXH2W5gO/VWLtUN+0Yby/L68MGGn0jeaGkd
         xBSFlg5H/j2CiPEj9mYcJN3gPHe08TB4ggCnJSj8uiYSVUViykCxbfOojAvXvh6ECg3R
         xpWpv+EOHRLRPq2W5Vzd4WiL8KfHQp+PxuwigMbDj/dnsKOEVq5QnQI3nPcqQgTWGF7i
         N8rg04eguyL26Zs+fm2ll9wWMksI2WssniI1lbIGOEwDN+Pso7Uw6KjY3J3ahzbXgU5r
         qesY3t8O0FJhEDUTWdHq4VHc56Pe1cBhvyebsaXIijFXBkmhTbanP5/n3BByi930K+Be
         20+A==
X-Forwarded-Encrypted: i=1; AJvYcCVCSqfsThaaZ9T/42khjtUrwm7Y0WOIzBFaNHrj6Mw4xJ9BTKC7qHeD9gsV7S+1QaCnWdez+VqEoT57LCRhMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ZchLKS2IARSpFmmuCb5teJW0NnR2Q10cfqccg0cJqlKegx+/
	9aST/nXXNIFd6pgNU645TSLtFHxAi5S8p6Xo7CYybCDIYTQa7BOAO8RkYkwbmYU8YLavxsmREfq
	COqysKxMT/J5+hdC2ow==
X-Received: from wmnm20.prod.google.com ([2002:a05:600c:1614:b0:477:98b9:1e26])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b13:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-48069c733dcmr72168595e9.31.1769609398180;
 Wed, 28 Jan 2026 06:09:58 -0800 (PST)
Date: Wed, 28 Jan 2026 14:09:57 +0000
In-Reply-To: <20260128123313.3850604-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260128123313.3850604-1-tomo@aliasing.net>
Message-ID: <aXoYtRFUTAzWVGiX@google.com>
Subject: Re: [PATCH v1] rust: sync: atomic: Add example for Atomic::get_mut
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org, 
	will@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 28, 2026 at 09:33:13PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Add an example for Atomic::get_mut(). No functional change.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

