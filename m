Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555A74C9F
	for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427820; cv=none; b=RDXzndr7sdX7zAlubKDftS7oQyu/vBEJG6B0YaniGA2k+UW4O+oDHNwvOjlxKxG1Txl8M2DhiRYvdxkPkOlM6d+XgniuaJHS32pc6z5C9jCOBIBBFeKMzhZ5XCnsJQPKE/5hqLddC7p2z+ti0hpks1wuD2iSWXXnqWZ7FBKNx80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427820; c=relaxed/simple;
	bh=MM/ozcOCXZ5d+VyTWQymctGaa9SnFX03kQYidoP+Ecs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R1YFZrXuRIvUJ3m3eVMfwTlBURLuYvaA8AGm97Az+PE5P2MnxnR8zwrZ4HYrkxR0Ykhyo0lXM3pxV3M4erHytmFmNhQjZI8ogNyNfW7SkFDgV6+/DAzMJJ4vE/P37cNXBu1OqoH0LIL1Q7cWVwt29dGQ651iLxC9hzVj3gwsHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHTRpn45; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHTRpn45"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso35937175e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 03:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748427817; x=1749032617; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOkwFKzz2wqGgEsUgo/sGUbk2ueBcmlhvGMY23/sxjQ=;
        b=kHTRpn45wVHyvyIrtziiDYxY1F5uQQ/Mnhzwd+4zObVGTKUnVVENnV+lWN8tgMsIEl
         owMliJvOYSOnEetNUuR6/rGqjQ1pxTstq/zf/e7MxGv62j/BEhB3x2/pVqBrSWO2u0fU
         HL6jogp12sEIUze4BZfH+INO1cMURFwGKDQQPqf87bj/lv3z3F0QFKKadYRW1RGZOQ/B
         fdF+l3GTDxJPCFlw+Tg9PqKvo22xzCeD78w6r8IMNFS6vk4Ap+Rj6RvkcOPrtSa/vh2N
         27aDuJKRlSzfHhixoNPOgtY2/OWOdsMsFzU10qVIn9uP0eHiVYfEvUZrqHoGLedb/dy6
         z6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748427817; x=1749032617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOkwFKzz2wqGgEsUgo/sGUbk2ueBcmlhvGMY23/sxjQ=;
        b=gdsjJkAIqjklx0E5hTeZ3lc/vgTnedOG6cczKuy3nkWduNk5ovz31pAeBHr7BHSx2H
         txwIcBX5jRv84ErNUh6uUg6rKT2XygKyL+N7bRIkcC4cSO8Cr2mq6zJN6YJP/HxRHVAT
         gLRaQs/fw56Pesxt5Wcg5Hdoj14Scl6J4+s4Fxk88h1+IPwKL5useAXps5Gu46HkOVMx
         +ldHX2goGMFsN4U6GW+/e2KIsIQVA74kgo9s4CbOErfWC9ITfVyljMmLmiSQDE2gp1oF
         IPupzkXxdBZKRHEc2tQ6MBNi6oYaUsIXY9967wWlQvoB4Hs5pv/h7P9QmXGtgQkyKpqK
         mnNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWex1byeSmrvSJNSmKTQayTg6u6yGbgkzH3NzlfOVtWlmf8Sw+ES6f4gzqJ6iasrqOt3W1aLZUWa9vssDxDvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPTb+9jswalxZyzCtXdxTeedevcRdoKocebEEKjecnibIV2wQ
	1r4mwD/QRokhxom9eB+8QtBrmb5q64WQKRRMGUJQBBxB3E9BgLI3g6o3eEo9pcFn5roUUcqrjma
	QiNWpzq4cHY7KX0+KPA==
X-Google-Smtp-Source: AGHT+IE/d7QvjBd9m9AiElll2EXSy/M+uGwax68KFlLRDUZEw5WjgchZ+RZlIS0fNhH6I9/raBwqDL4gIz57Ke0=
X-Received: from wmqe8.prod.google.com ([2002:a05:600c:4e48:b0:442:ccef:e0aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b02:b0:43d:412e:8a81 with SMTP id 5b1f17b1804b1-44c937d12dfmr114075975e9.28.1748427816674;
 Wed, 28 May 2025 03:23:36 -0700 (PDT)
Date: Wed, 28 May 2025 10:23:34 +0000
In-Reply-To: <20250528083431.1875345-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528083431.1875345-1-pbonzini@redhat.com>
Message-ID: <aDbkJhSA2SJphO7i@google.com>
Subject: Re: [PATCH] rust: add helper for mutex_trylock
From: Alice Ryhl <aliceryhl@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"

On Wed, May 28, 2025 at 10:34:30AM +0200, Paolo Bonzini wrote:
> After commit c5b6ababd21a ("locking/mutex: implement mutex_trylock_nested",
> currently in the KVM tree) mutex_trylock() will be a macro when lockdep is
> enabled.  Rust therefore needs the corresponding helper.  Just add it and
> the rust/bindings/bindings_helpers_generated.rs Makefile rules will do
> their thing.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
