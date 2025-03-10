Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A0816F841
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741598153; cv=none; b=V8M6RKh+l4yR6k1xt8kS9n0G0mqQqIrZsCyr+KOeYZsJYBDTNa2DFir07qoc7kcqvYrOcesemHZhMgatmtg/dpP3D+LXh3ozHkgWGcM7hTO8hUrE5A8i7l4EEvyv0d4n4RXg3id+Ug+t5ZmJoVqFPokEKJCbJVqNTpLVLKutBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741598153; c=relaxed/simple;
	bh=KjSoU6/mBbGahQ04HV4jjvNKb9ObDoSCk+0lV+80R4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fRwN7MsA+V9dWenR/U+wHPGk6KkBEuht5Z89jDtWGeSMJR44U/PGplnM2cq42l6Oqstv1C0gn8nD3Pq1x9KQc8PwqWWzqQ+eVAxI4AVp7cf66w+awKIzdzb9ZXHzLTHF8uE3GWbRlTL8gZsFLujdVisSECLJOmCkGhNYifh6hL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1hc1VQ9+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1hc1VQ9+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4394c489babso18279005e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741598150; x=1742202950; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9dwmLMGrJONvWdmLchB8OrIEYq2jjVi0+jpdkBizI=;
        b=1hc1VQ9+HImo9HXOoLOaEZ4Z2hS7xQpfWafecn9cL21vx40Ck9OzJp9L5FOQIrNG7+
         Shn3OySkR1iHegJt9I79hQOs5Tdli+sbiV1+kGUHsI4shJMBld0GIzWo94AGW0GpJ6AL
         LRVwpcp3WPjNUSK9lg5jjZ7VI2hOsaKpxVqViVQedrR3fBnIrpkMANaITQdWmgx4E+LX
         MRvJENo1oOjVngr+W8afvO9mIZXAsCPXpaAo2VSAubvaSD4M9FwhaP9HEfOf94zh09Jl
         32ivivoo2QhiK2MaJqDYLp9YPVyQ5UfQVYTatoEFi3ztVBKS7TfmAFcvSK9qT2KYnGEc
         P6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598150; x=1742202950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jC9dwmLMGrJONvWdmLchB8OrIEYq2jjVi0+jpdkBizI=;
        b=FHcjZOAEOC3D81ObJDUdwbqsNW3MhnAECn3TYKEgzkGqnVh8401gP6bNjqh/qYS5L6
         gebPO9M/cNeMvNfRnDyebgH1GC5MwLxOg1mXsEpMGuh0t9kR/0FVpkCtKvjcNq2B81fk
         zKvSvLCoK3ZzkEegTSV88UprJv5+MamycEDvOVf6MC1Ge3bcl46gB58hSVRmDWnSgtPf
         lTpTvBAS5zbWInZ2Y4AILutiIeszOLVwUkIZKFh9D1tvVl3cD7sk07+5yNalx51xrTlm
         OLRJhX0G9tFYsaFC3/+VoT96jhMoKxnDHQyG/2wtYT5OCLWGwMAcL58QWSI5WOoH4x1M
         bMiA==
X-Forwarded-Encrypted: i=1; AJvYcCUn9saKMq+a0xsSZ1iUDi6wvDI6uUMl+iyclAJFtm5JSjSjkO7vHltshtwM+TBIi6sBXbEhUOXwX3cs7PFPFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJT3+8Vk6zNMfMS+PGu3ff/N4qzjos2sMV56xckM8HG0x3GQoQ
	x3H3gAOo03tEDkLjaZq9r4nO8gE4Zb/w7zaQJYNVJRWgl64lXNTHuRxj8KnVbA3UY+UjiTmAkmv
	7gx3UKOyKL8a11w==
X-Google-Smtp-Source: AGHT+IFld+YMbPi6vF1aQtVy8e1i98OzUQUBy9QMXqfEE1Pf4Daw9v+O6rr7flwQQrudHMtNoS+bOOx/1S6RKQs=
X-Received: from wmqa4.prod.google.com ([2002:a05:600c:3484:b0:43c:fc61:959c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc1:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43c601d9251mr66339335e9.9.1741598150298;
 Mon, 10 Mar 2025 02:15:50 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:15:47 +0000
In-Reply-To: <20250308-comment-fix-v1-1-4bba709fd36d@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250308-comment-fix-v1-1-4bba709fd36d@posteo.net>
Message-ID: <Z86tw6ugdwfJCTnu@google.com>
Subject: Re: [PATCH] rust: task: fix `SAFETY` comment for Task::wake_up
From: Alice Ryhl <aliceryhl@google.com>
To: Panagiotis Foliadis <pfoliadis@posteo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Christian Brauner <brauner@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Mar 08, 2025 at 04:49:05PM +0000, Panagiotis Foliadis wrote:
> The `SAFETY` comment inside the `wake_up` function references
> erroneously the `signal_pending` function instead of the
> `wake_up_process` which is actually called. Fix the comment
> to reference the correct function.
> 
> Fixes: fe95f58320e6 ("rust: task: adjust safety comments in Task methods")
> Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>

Thanks.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
