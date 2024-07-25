Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC3F143738
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 23:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721949704; cv=none; b=EQEOLdUW/jNOb/lyexwgRx+pBrcgQklDtIjLtSM5moq7SEOgZwdn2S280CWqTWNQy9AvZ8igjnehMn9zfnUcka663dcSLnlbZjBktzNEi1cnlQ56qjZ713HIK08Y88bpKb05vwW8x3eokV1IOG/8PJJuJ6Pg5ckCWRS9wmXWOHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721949704; c=relaxed/simple;
	bh=7x3vu+csCr30x1Vr+lgRWZfd/Py6AsuVqa90LWznOO8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZNFl0qkfTd5M/aWhhByc0r5jJhwuSmM0G/hS7GVKjN+H9HPYSiGHOWj7QXs85onGNbHMQ3NBEEj7WdJgb2w7cnMriAGPcxar88wnvVWA45oLNHJnS7Vk40E7AyIdvUsf5m2YZEtPPAUYW9bScryC/TKLPtEjz8a+mJW4SBYC3/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jec7qQQ8; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jec7qQQ8"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-672bea19c63so39466497b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721949702; x=1722554502; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FJ1LO01T/i1llNRTZp023NbVH2yKge4RNDbw7bFZMGg=;
        b=Jec7qQQ8vaY41Gfgo/Gv4bgcjvlVirCNz6gEFedl4v4cawQ8ExYRlVf4pdmd2Z2vZK
         0bQMPS1nMzVhFkUJV4L3FnKaPkMzAUj4ZWXt0mwDoRPxir4Z04a5bl19KBL2DwHasiwp
         NpzGnMx8xlJzlSio38TwBZHBX5zBYnocW5ARWajxSGVuqgJE+F0hIPZ2WKXkb16cvaFB
         J0xur7jKurlz9yuFF0ooyNxsj3MfR+LAPiEVSwRiyNyxzFx13+RM2DG1vIPKQRxNuUBr
         rZBm3v/3EJqbiVRvjGA9fjrVusanVANVnRbH0gsAIG9rDORxUB2cWNMyLZ6v1E63reZI
         ojKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721949702; x=1722554502;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ1LO01T/i1llNRTZp023NbVH2yKge4RNDbw7bFZMGg=;
        b=UkLidlpqWcX+4wbTX2zb4bAIs6Z3IXQVvm8ZrqeQ4WcPXXD9sfbHNO7W/AShd7zz8e
         Oep/lauVieXWvCyTHKe6XZFRA0u+nLQaqnV201kYCwQyCyw3wDBsxQkMFxOJEAHe0s9c
         CqN3X5swils+6yZr9fDluG/JvAW+bsCqqxbXir27B1xO01kIk2WvBaPK+MmfoNMypmCz
         TXDwtOPncoYWSFtN/pgq1QUaJsk8nwRgOkvXyxCxNNGiTDJyimoR9aQMOIvETQfCO1+9
         y8nuWrwjNitFMEmpuBEBo0drnRC5rruvqL7bYWYaRDEfX9LdhkQ1c0/rJuGpUBkT1t9w
         a8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXamgYqSwncluMWIE+CXPEcenlA50FBB1xRMtgcM5EAziM7+1Rw+7+5Mig7aCsoW16es2hU4RO9tsg0USdxJfgSfsbL8lfK6QsZj2cZhNo=
X-Gm-Message-State: AOJu0YwGji8vAOaE9NLniMmXR/teCxNucgnq2Qep8SJiycYp89/UAKz/
	kEk0wBz9CQkDSCE5jiupT60idJF/nUxAbZSKj6WJx1pGlSi1/ecGYqV+4Mt/+Wszi/hkDSXCv+r
	tmbomdw==
X-Google-Smtp-Source: AGHT+IGMAu5S0sfL6zr/Lp7MkrJhPg+rwTqWtMSnxzzkp+QA4qRkML9VkAlaF3MqfqfNvT91dBcVmWzOIng6
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:c13:b0:e03:b3e8:f9a1 with SMTP id
 3f1490d57ef6-e0b2ca202b8mr14613276.2.1721949701550; Thu, 25 Jul 2024 16:21:41
 -0700 (PDT)
Date: Thu, 25 Jul 2024 23:20:45 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240725232126.1996981-1-mmaurer@google.com>
Subject: [PATCH 0/2] Rust KASAN Support
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Right now, if we turn on KASAN, Rust code will cause violations because it's
not enabled properly.

This series:
1. Adds flag probe macros for Rust - now that we're setting a minimum rustc
   version instead of an exact one, these could be useful in general. We need
   them in this patch because we don't set a restriction on which LLVM rustc
   is using, which is what KASAN actually cares about.
2. Makes `rustc` enable the relevant KASAN sanitizer flags when C does.

Matthew Maurer (2):
  kbuild: rust: Define probing macros for rustc
  kbuild: rust: Enable KASAN support

 scripts/Kconfig.include   |  8 +++++++
 scripts/Makefile.compiler | 15 +++++++++++++
 scripts/Makefile.kasan    | 46 ++++++++++++++++++++++++++++++++++++++-
 scripts/Makefile.lib      |  3 +++
 4 files changed, 71 insertions(+), 1 deletion(-)

-- 
2.46.0.rc1.232.g9752f9e123-goog

