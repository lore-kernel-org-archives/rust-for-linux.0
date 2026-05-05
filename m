Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54757407586
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 12:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982533; cv=none; b=RqbYDR4VCsj41wpqYaBVBxA4+er/pJiauWbpijW6gO1l68NC/OAzq6d5V8rwgTfREZsq3/hyJzXlkiN0WLQG+yQMhgBqc3FG9y0LiZnp+WBPEFdRJrQStSR8p2/2C6MtvK3qCilmY/dOWSE13aZQuLv7yF9C48UU8TovMcqcokQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982533; c=relaxed/simple;
	bh=LsAUKqaB+d0b9QKqXAkWuYwV2h73mUGFhIiDE82aK2M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H8iFjNDoEotQFOuYkv+lQEoEA/JzmgET42vZFM/nkGmIjoTj5fI5QWn5cUZZmTH7ecld0ATJSrDmZ7CE4k/cOBnJyXsEmauQb7Kmfhl1+iAhaPhprtJbPkR5Xa4f6hs6HF5LfCWNciXgmBEqG2CZuIvd64HTScX4lQSsz6WscaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HGoqc6z8; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HGoqc6z8"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48d127eb013so7805905e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 05:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777982531; x=1778587331; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LsAUKqaB+d0b9QKqXAkWuYwV2h73mUGFhIiDE82aK2M=;
        b=HGoqc6z8XMuLbAiD1qw00ryVYRXD3Vry2H9wT95+81a1Jen9dG6UQ5IwWX7WuxvEDe
         E2tr8Ci7uIF8NnMQ7bD7oZDvm1J8hTq+9TJfMjFp2tHx2o1tn2Wj7Vq/mIon/ape0eIw
         Sv36XNdKQaXMnB9u6uW02EXayCNH1OqGrtCYmPUkWHX0JFtbyHfLrmvak0W9HMdg2hpA
         dZNvLwJ3mlSQwisnc9oKJmwVjPLLx2SPL6tXsZ6pqsXKqM54BUD6QxDJsjxRRgktw6ae
         Kux148icuc3BPMSWOkUSnKnM0VIFkiOwIKPpDcMQhpafJ+BqcGo60OTwmuN1RF8tEfJD
         tSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982531; x=1778587331;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsAUKqaB+d0b9QKqXAkWuYwV2h73mUGFhIiDE82aK2M=;
        b=OacmhtlrdMrKfRqrOxY1muyTxLifInIT3L2CCpmCGC2DRU0PGeB5sP1nTLkZzG+SGb
         buqDIINQOR4KmUpHH90zVDpJVpRDDS+VCuwPBRyXn6szaNKqR1jAAymp7atWa36TlPMj
         urSSW9TZCtMBcmpRqcKL4FB5i+O3zaDsbt3iXUuPKZidjOXhKaY3PmHmHP8gC3sioaeb
         k+jYqS8xMjqiqXPT8Eu6GO7cKXJdbJCO9cH/zdE/W7zKxHHZbBF8azrArO2gmtLHaBQK
         TH2oYkiESQjZn7YKTar8kBJvakKfN1ZQq9fRzKIQkIWO2q0Jyz00vfGvLQPJ60KZuL4B
         jdLg==
X-Forwarded-Encrypted: i=1; AFNElJ8EUd+1XG+822/KszprF6TvmTtqk1hLLuYrtO5TakFzkZCXlyJoHQuEQwfo9M7wdZVU2o5gMQugYgl5oehVcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUF5f8DJI1piZA3O8rEdnxxMZXRGk6DUzYSjT6nFIEe5N0wLF
	oWv0ivbRjidhmmGg7Rtp+MdKCQKMyxqRClnvaHZrCTCVdJw46t2GM8bPsYAnTbgmpk9bpINW19d
	Qe51yoBMCREucQA7QHw==
X-Received: from wmkz26.prod.google.com ([2002:a7b:c7da:0:b0:487:37f2:47bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8903:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48a98894fe0mr157507635e9.13.1777982530471;
 Tue, 05 May 2026 05:02:10 -0700 (PDT)
Date: Tue, 5 May 2026 12:02:09 +0000
In-Reply-To: <20260504-rustc-option-cross-v1-1-09f2726b680f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504-rustc-option-cross-v1-1-09f2726b680f@google.com>
Message-ID: <afncQeU7-W-7T1sZ@google.com>
Subject: Re: [PATCH] rust: kasan/kbuild: fix rustc-option when cross-compiling
From: Alice Ryhl <aliceryhl@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, May 04, 2026 at 12:57:37PM +0000, Alice Ryhl wrote:
> The above scenario actually also fails without -Zfixed-x18 since the
> SW_TAGS sanitizer itself is aarch64-specific. But it's a problem with
> normal KASAN too because of -Zfixed-x18.

Correction: No, this is not actually the case. Despite being
aarch64-specific, the SW_TAGS option does work correctly here.

When rustc-option is invoked by Makefile.kasan, the
-Zsanitizer=kernel-hwaddress flag is present only in RUSTFLAGS_KASAN and
not in KBUILD_RUSTFLAGS, so it does not get included in the RUSTC
invocation. Therefore, even though KASAN_SW_TAGS is aarch64-specific, it
will correctly check the -Cllvm-args flags.

I got this wrong because when checking it because I disabled -Zfixed-x18
but not CONFIG_ARM64_BTI_KERNEL, which adds -Zbranch-protection. This
option causes the same problem.

Alice
