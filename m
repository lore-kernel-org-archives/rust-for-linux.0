Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D4282F27
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 05:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779861482; cv=none; b=V8PdWueQOjzrnaOisXoXSCV5hB/ygKZ63elpMXjg2IQc07dKL9RHysEJfJJ7Yf48eKCbwQ5wZRcPf81lpPB20vlK67I1l/Zd5f4/qO9XsgYdb2hTGXRa3pYMdm4sb755WeU5VSMxYEj/FPtqzSKbuXQ0oKYHyNVeIlu7vrj4dNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779861482; c=relaxed/simple;
	bh=Ds858C8JSlwFv9V0HFpdGWu5Lwj48IBa8qLqXCeXhAY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SnWtkWsPY8Oddy06Pzg7rPyjqnpYy1YIPfeu6uYLn/s5HZ8IzDFHlZVJhkmTnwcY+5DSxyy4Q+nymvqAuYEEvWSCEe0Dbhyd+NWhAF09RbNiauJ/zerMboAYpYCpGGdgMrtBYzKg9kdP9tv54SleFr4lJeYk3MJT1qNYoWNRyCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oxRJJFRk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oxRJJFRk"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48d127eb013so54125965e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 22:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779861480; x=1780466280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QL+f4AZjX4KECcd9eray4sdH5Ebp4GC/Yod4j5/Zhjg=;
        b=oxRJJFRkBxDduVbp7uIBntdxsLgrcVOoEAJixTEJWZEB/yTPOw7eQpN1lZFtuH88Os
         1Uyu5av17pGfK4f/8XHY+80SaiHiAjP1ZLMg/2eCwens7E4pVEEQ9/bRWYAZq7CAOT7u
         AHJMbmT1H6Yag1vEUX+6q4rsfhnMBKe32Yjs6OD0kSBIEEj21heozv6GtFk96TwpCZn6
         ZZ7Ro6fEVzc78qYED1FDoVRWD4KXIh562R+zmNfX8ZFbEZX2fkHeioHSS1vY1mRfFCAx
         DEoxraE/4dYj+5Ktqzbi2l4hi1lplelHHDoru7vJTHmA/qW6jI3y7RH4mdeaXJkmopti
         oL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861480; x=1780466280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QL+f4AZjX4KECcd9eray4sdH5Ebp4GC/Yod4j5/Zhjg=;
        b=BD3pQ046ksm+910MdOr7fsea039Xmu0gcE5Ag+eT5TNwK59yHGCk9ze+yUPkyT5w5U
         CMBsSDQYY7UEkRlfwgf0HI1h1sJVeSmKwNPahUJc8MdODKTL926UOrJ4h6vmWrlCzrxr
         Q8njrjUl+DK7YQCxdLwC+QEhYwtcmct5H/lsGDBOHdnrsPhRQ/a42HxPjF8OVYVmVTLC
         twl64U9phbnBBk3F4sHr6+sMFdlHn9Vobynf+qnwUXPgClMusBDcQayiEl1Yc7WJrw3h
         JldK+VFOr2QzxwvXRCV+nByvCN/rXHSqXdPcXQsk+K9PDQ8w8pbVHitMrRtV/oWRRTaF
         bmUw==
X-Forwarded-Encrypted: i=1; AFNElJ/2hFq+DIW/TDBNQ7Qxs0xnRP8SI798tFixr/PAAum9SB8HSbkhm/LpHG9eaL/alb3bd6B51QOX5bTzKgmKKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LF5HcjzGQBbSihMXOSxBB+CupeXYRb8MZOkAHjc4tsjAwIYR
	pPAPZafeTbDwouhV5tY+7jhnaBjEYXhbwm8a5nuUol0dJUb7G7J93XGaTCqvLaXLrs+Khf2fJnY
	3csIhSpbfKuOVwMKSRg==
X-Received: from wmql4.prod.google.com ([2002:a05:600c:4f04:b0:490:3c15:7144])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c168:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-49042268d98mr377878395e9.0.1779861479469;
 Tue, 26 May 2026 22:57:59 -0700 (PDT)
Date: Wed, 27 May 2026 05:57:58 +0000
In-Reply-To: <20260521165622.279953-3-japo@linux.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521165622.279953-1-japo@linux.ibm.com> <20260521165622.279953-3-japo@linux.ibm.com>
Message-ID: <ahaH5k0yKi9IFvv8@google.com>
Subject: Re: [PATCH v3 2/4] s390/jump_label: Implement ARCH_STATIC_BRANCH_JUMP_ASM
 and ARCH_STATIC_BRANCH_ASM macros
From: Alice Ryhl <aliceryhl@google.com>
To: Jan Polensky <japo@linux.ibm.com>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	ojeda@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rostedt@goodmis.org, ardb@kernel.org, linux-s390@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 21, 2026 at 06:56:20PM +0200, Jan Polensky wrote:
> Rust static branch support needs the s390 jump label instruction sequence
> and __jump_table emission in a reusable form. The current implementation
> embeds the sequence directly in the C asm goto blocks, which cannot be
> shared with Rust.
> 
> Introduce ARCH_STATIC_BRANCH_ASM and ARCH_STATIC_BRANCH_JUMP_ASM to
> describe the brcl sequences for the likely-false and likely-true cases
> and to emit the same __jump_table entries as before. Switch the existing
> C helpers to use the new macros to avoid duplication without changing
> the generated code.
> 
> Signed-off-by: Jan Polensky <japo@linux.ibm.com>

This looks right.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Did you test it?

Alice
