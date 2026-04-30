Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA134A773
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 08:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538505; cv=none; b=QrIqOUvyCh/zwvJ2CjKVyF58M7Ng5ZmH0Im9FUxZ/9TR2esBz7gyziU/Ipr9HmR4t+HL5J3NRFTl5i+1NPusI/0B59XXG0X8wQHf7n7PDzO05wIO8P14tlzgHh2SOccCHyxmkcjI/0aYB4sXvi4SKvFP3B4u9TQ47/0af7zwQvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538505; c=relaxed/simple;
	bh=YTfBXNJOHkEQLmNHuNG/+sg5jsgkk5pjjQgLhX+9u3c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=owTBKxw7WMDS0qqpd3zC2I1FdQ9K8qlmq/ZatBGcjlIxF/JNm4EaAXHHLgW4Q1m73jJZ4JWPAkYdSpBNa52y7eZg9Y+mVGH8lT7lTHibUgcoLOyCY6oN5901XHo+DW8ef16nGvrvBn6C18bcVNaIgmZYkR+20tQCCGWyrOLZ6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RquKJJ1i; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RquKJJ1i"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-488d9e1e61aso6589395e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777538502; x=1778143302; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSVKX5xpX7DJzb63X7moJdLQaJU2J+xXDx2pgcaTZqE=;
        b=RquKJJ1i65N8plwCM8vtWQjUJDc/CBrVJYYQpaqxiCPqAeDPduFxI+JkFUGrxkdUmv
         hWFZ1oCJ+wGacd74Yqzsb9JsiIPzSubEWAH8aOG7NHPIt4SEZwii1HR2rZQ221a/u272
         EHFK2axpjRcZdXhwuSCNAi9fF9Jxr+DNVJ+vBG8wuEG92hhU/P2NR8I/MmKkyvrsAPr0
         4GXI6ydaGbhCFR2cDSjPZnmVpZIxyVOr/dn7VtOuCbKPRCHqMOBZEoT1a8tZSk3U3iYO
         v9TxBHAekWZGSy9gci9Hrpw0ET8Ek1rgzwyzEGUTuzohwcU0fAlnMh7Ts7sIOBE4ghMo
         bHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538502; x=1778143302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSVKX5xpX7DJzb63X7moJdLQaJU2J+xXDx2pgcaTZqE=;
        b=oEyDKWqvrNjH4i3oDMs7iWm7ZVLwJ9ebeThpaKY9BhhiyijKH01ISFJ9BgB89jjfDO
         9HTuIKBXtXX5sl5DJ2X96pwkqeRLHYV/0CsT9FBbyNVYNZtFEKKF6qmaGdX6Z5lvxMgO
         KSrm9SQbmuz+ZcNkvDeRhAmaJ4OvBoqMLSTlDjLw/RbesXTri+sqTeMP5R82cn8Y2sg6
         P/Q1Op3mXRfJjl3C+o6G1EVefCy6irXSK3zyRklc1pDpb9cszykKKDCiBJXpcyJfJVey
         vZk8sXcGQ3Jy2OonW+yZD+dGZihEt6jN4RUbROvPQgJvtBiOagS74l8+a9HO4WIToMsT
         1KgA==
X-Forwarded-Encrypted: i=1; AFNElJ9VQeSYrnxpMNmutXjOpSJegAK7qA/Y3SGmMcNXWRbbRHZg/C5NRyrHWElnW6SFDWaFAShD3h0NAmG+awfhJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS6CsIzAT5IdGDtRoiCSo1V3jS9QMvPBWZIQ+rNVH++7p2WraO
	Xeig0crWyV/NgBGZeEbK5JKV5O55RIsae2KoJmQh1HLAugsEKbZTSlUXd1Dfzwsix9W/T0YJ8Ut
	TR/vwTWsK1nOAOufHKg==
X-Received: from wmgi12.prod.google.com ([2002:a05:600c:2d8c:b0:48a:58a1:abd4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f0a:b0:488:ae6c:42c6 with SMTP id 5b1f17b1804b1-48a84445b3dmr34533605e9.14.1777538502473;
 Thu, 30 Apr 2026 01:41:42 -0700 (PDT)
Date: Thu, 30 Apr 2026 08:41:41 +0000
In-Reply-To: <20260430071930.73696-1-sagartaunk2@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260430071930.73696-1-sagartaunk2@gmail.com>
Message-ID: <afMVxV9iVgfllkkE@google.com>
Subject: Re: [PATCH v2] rust: workqueue: replace SAFETY TODO for
 `WorkItemPointer` impl on `Pin<KBox<T>>`
From: Alice Ryhl <aliceryhl@google.com>
To: Sagar Taunk <sagartaunk2@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 30, 2026 at 12:49:28PM +0530, Sagar Taunk wrote:
> The original implementation left a `SAFETY: TODO` comment on the
> `WorkItemPointer` implementation for `Pin<KBox<T>>`. This patch documents
> the safety requirements that make this implementation sound.
> 
> The safety argument follows the same structure as the `Arc<T>`
> implementation and relies on three guarantees:
>  `__enqueue` strips the `Pin` wrapper via `Pin::into_inner_unchecked`
> and leaks the box via `KBox::into_raw`, producing `*mut T` whose
> allocation remains live for the duration of the queued work;
> `work_container_of` safely reverses the `raw_get_work` offset arithmetic to
> recover the exact `*mut T` that `__enqueue` produced; and the workqueue
> guarantees `run` is called exactly once, making `KBox::from_raw` sound.
> 
> Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>

Thanks

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
