Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A6B35CB8B
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845827; cv=none; b=jBLimZiaJFFUa6hrcfxNmR7x/aYUd5oUxiOd5iYeZAFReAdAa3ExC8PSHr1k7wHH3QunmX/5f6aiziSqX+Wjk7HKeUWfU+uSO+BhdJV9GM0s1g4WBRGaNCl7TIeepPCIrOXqYVqoSiPPhmy38JLU7jH4pgpgeoX+aiW1JitXORw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845827; c=relaxed/simple;
	bh=nWimSMfoh0LM9JwVbRmZZAKSTbjL8JAXDNUEZYCzCQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aJP9Ds1GYscgPqQCDRndMu+1PykJMIZ6/T+zJfBuuCIJCoaKb+3qMfUYpkahdOnFhiUyu5jU/8/H+Nn+4A57QEF7c2f2RSzrDQoIPa6cTI8NEGlWu691iADr3T/F4ovISE7KaPWEMLI7nhX0r/4zP/R0tdgZil1AXBPcYOEYm70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zcHNqgAw; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zcHNqgAw"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836e35292cso35918045e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 03:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771845825; x=1772450625; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5sqVBklMNFd+AwWdw1mQppSBmesqWMHAjeKbhCCvH0=;
        b=zcHNqgAw33T7aj408isMKcJTxDThhaIZDBD5UWxcbH0fF7A7dRD8VaDAupr89gdTg3
         5JIwjALO4gIDCg/ebdUO2ERCtCPRagt6Hxp2WwI+5L4ObeFg4YERJ8gMRMXdR51X0FOz
         vdmqgGAiCOgORSbEgLAgp0Af9bEPM3o7J+K328qVhhrUovU08VM2GYXMrrNlqIE5AW6w
         YerOOS6sAQwKMNg9GPiJAvMcZjuuNDR+oM6A5zsf7p2fVyWh8qSuDd93m49JVY2PiAsI
         zp/tzN2+EaMNVVxvIZ7GLmCdMIdPjm6yIFwMBD83KYhH6ROUseFKAkgrbKb5OFd9En5O
         m8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845825; x=1772450625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5sqVBklMNFd+AwWdw1mQppSBmesqWMHAjeKbhCCvH0=;
        b=CL+qwonnE+wySheuNsOtEioWdnc5tHTPXf2ANu+be+Wrl/CuhKi2zu0DDv4dx8xSPI
         7yPtdbC9x6Nuu5MOWxaOhnfNYLGd7cZ1C4mjz5daqBCC4NTOERiXz9nSZhHa9uyu5HC6
         5X1ysPyb6M2dGLpFezahgx/+H+uH8MAk7BcRa2G0X0ymhnVg1ga9dSFf88G1LBMhr/Rm
         rQBZeByAVVD8hq0UFfskcA/JdEVsEjwxgMTMyUIEz2sL1ZBT8VsLimvpiOOEyZuhmzRg
         Cz3wz80/hA+ZNOESSZ5RZzQJKRKztblmNIeFb7PJ/COL8Vn+lOPLnZjqas5qmpA/oeak
         BWcw==
X-Forwarded-Encrypted: i=1; AJvYcCWEi8Hu2BchzYmcCfTvhggGf25JcWmyJJLbGapePz44/iiDdd5SNIz+A+pBWIoT83AVLzrjZfWy1/ABvoznPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Xp7V+CHuMypU8XVDrYONYmdonXsGfY8JORm0Jb1BiQ3jsxcw
	k0R99SaclZjDWScWFyA8v3SDVjVztFoRng2nbTn57FN1cir/PX2tbz61I/C6kloUtqoxZXxt/q/
	O5DxlpQqu+wj6rCFdFA==
X-Received: from wmbf24.prod.google.com ([2002:a05:600c:5958:b0:483:6c98:3d2f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a418:b0:483:b3d7:2e80 with SMTP id 5b1f17b1804b1-483b3d72f30mr25074315e9.33.1771845825030;
 Mon, 23 Feb 2026 03:23:45 -0800 (PST)
Date: Mon, 23 Feb 2026 11:23:44 +0000
In-Reply-To: <20260221020952.412352-22-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260221020952.412352-1-jhubbard@nvidia.com> <20260221020952.412352-22-jhubbard@nvidia.com>
Message-ID: <aZw4wCZWhEsvfkAy@google.com>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
From: Alice Ryhl <aliceryhl@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 20, 2026 at 06:09:35PM -0800, John Hubbard wrote:
> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
> equivalent of Alignable::align_up(). This uses inline_const to validate
> the alignment at compile time with a clear error message.
> 
> Add inline_const to rust_allowed_features in scripts/Makefile.build,
> following the approach in [1].
> 
> [1] https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kernel.org/
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Note that Rust Binder's ptr_align could use this if you want another
user.

Alice

