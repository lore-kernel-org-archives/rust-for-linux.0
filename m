Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAAE38F949
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jun 2026 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903820; cv=none; b=oh1s9e9WMgRcI3uaJJXXvqBDw+gXeWQldk9vmbN/kuetDYmXc6iJLT/0o3LiMEwkvHEVYbcQcxCQ/D5YGB1C8vPxYybTFvEoOHDf1/lC/OuncaEDh7r9GI7mwKAAhwM9pqhw5lDvGafM3KHCiUD9udRwzIoOjNRDnp3vAjVrBuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903820; c=relaxed/simple;
	bh=OPCeGSdpkdFEUswHghRnq/hHphAUKp1cw6nG9eqYt8I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D3qCFfJIk6hZEagwLuBwuIKPiVTrC9ZVfe97agpNHBq0CWYNMxvKdoVtk5UZJ5WHVgEDGcud81lLrh6frw9sm1Fx8s7VAEjlSOkc92p5K+4EcCyw3AGve1b9pFmj17bvSfy6z5K2b6sXTLbATIME719fsbwk7PnDAhXWi3CQZ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vHtjGCGU; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vHtjGCGU"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso32304215e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jun 2026 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780903818; x=1781508618; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yuiR829mbWGoK1mdaXh1S2X6B32IwdZOpgdAXkzQ+xs=;
        b=vHtjGCGUhmwgyM7/K21xYcwON94VIA3qCBOwPRySvkZ8wBdF3BcZ5Hw2Scrz62+5ds
         osVcqzNl+UFcF8Nt8+hXeCoktfZ1rPMfL8ljo9PI27bPmrY6F1Yr+2CGtO+PQQZ2iRu4
         w5rOXCL1tHmTuv0EH8xx3gOUp/BugPZczAU7toNddlBuXyhhxryt/lbSto985QrU9YEi
         FAuhO+WW/huFBlc+yBc3Rhrl2JthtJwz8zCMo/WZWrGIl+mQ8L7npvRx562MxxMhW3Vz
         KcYubGKWwEHxVUbglU7rwNN/Orwctcl6O5qIPaeduu5GH10qJQbje8OPEAGSvJnJQ2MM
         E+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903818; x=1781508618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuiR829mbWGoK1mdaXh1S2X6B32IwdZOpgdAXkzQ+xs=;
        b=GJpx7zi8f7W5JJv/7exWtFFBAPpAgdnnD0vHBxjPNuPLWgK5Jxx/cZ3zfiKeQxGIh4
         LvSCjgJJTraT1rjV+QAfIRjFX7gWYo+Vv8Qx0DtcufwV/c8VPV8jSaEW0mB7nCgf1kpI
         Y4Cr5PrQ1Aoj/9VPSkrE9A8yG9UcDrfravzYXWjsGDab0LeR9fjcXJEXCIHO5jx8tTKc
         AOLgBqQgFhu0JYPVM3hbybbRtQjPwm8aOPSNltPjMOEH9DoqtRMd56tzO0IIcqvErxgL
         XaIV0nlJM1FecxOmpqzXJtO2cjXXkbzGtkAhW05CgqStHgM9izQ+uWdE1B88hr5ptnqU
         eBiA==
X-Forwarded-Encrypted: i=1; AFNElJ9d612FgO2W8J62qXUqxYePjZWyRBra4WvQu4HGv6lStgM/6ovQx2Q9HZ0sayxhB7AXWkA7/MOGn2ZuLW/zXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyARDjAhhMwW8xbaJ9Itscyr/uo8kF2+i+jmByYs9MkBu64dxgt
	grxdQIDZkuz6wiTo6DmxhWA7feqb8bmNQLE9t0KUzwkD/kdNSOjvfVmzfoiTk2yFwPiZ4DRYKhw
	fbsNJ2/60QpaFNBKSHA==
X-Received: from wmph20.prod.google.com ([2002:a05:600c:4994:b0:490:bd79:13cd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190b:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490c25ff35dmr249298645e9.23.1780903815159;
 Mon, 08 Jun 2026 00:30:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 07:30:13 +0000
In-Reply-To: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260605-unique-arc-as-ptr-v2-1-425476d2abdb@kernel.org>
Message-ID: <aiZvhYaXq1RlKkyr@google.com>
Subject: Re: [PATCH v2] rust: sync: add `UniqueArc::as_ptr`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 05, 2026 at 03:16:48PM +0200, Andreas Hindborg wrote:
> Add a method to `UniqueArc` for getting a raw pointer. The implementation
> defers to the `Arc` implementation of the same method.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
