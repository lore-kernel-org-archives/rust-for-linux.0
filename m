Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725118;
	b=TnbZq0fcXEsqu/G6FaDCEw5eOKn/SSQfjzrbYLruWC+8NlLw0Mr/RdqQlDeAHgwnwInl
	 1S0zor88qMAIbiOJA5mXawhVqb243Ps4w4ZHBF0i2nFALexZh9E31Mv5drDE8vc6NPei5
	 gROKiIr8YxLuT+RtKWmpRhQuPCmryDdfr7TSqj9ZgOFwtOkuzCwLZ+VnzQ02yHqSFdAQn
	 YZghL0CDOHpJP4fznBzIphOW4hukFqsDiOpU4/mL5eONFYJ5n+qcfIBt9A5cAUWzs/Qcq
	 YNYgwaDN+cwFjyWQ4WEBTRe5ueDs7VH0Li/jExk3IOkE5cBUxEPiq4H6wp53TIe/j9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=k0umCR55BSt9OK4xfEBoldGppWLpZx+D4qipWGdBea4=;
	b=Hx4jFU1TOB2u1VwjpOBMr4XTjsM0FMppyPfJEZXQ9Pth0xfvxVfKbTOeH8gYKwMfC6IE
	 ask/6hmHNBjtlvCYbFyNz1q2u9PYbipIJ4ObZ4FQSZlnVdrY/+BI0w3B9aNKIIxM2kWX7
	 JPCYsLmPhxz+9cP1BmtEDRU30tf2SEeE5Gy+RPA+9KXEeoSrp1QuAnp7GOe+389MVbAXa
	 xrWzq2Sr6ndKqI/vQ7tnMAwlTA0feaKOlGY1ZQweTFW7/bs9Sv8roQdA1TwzYeOjlGmIm
	 xs4zvOpbxshaSMP/Un6JCG1EY49TlkUUQxkAOxGEwDvJH9T3UOMoWyl8UMAnWeNZ/qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWbowDIw;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ADA606A328
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16ADA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jWbowDIw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so31120955e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793725116; x=1794329916; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k0umCR55BSt9OK4xfEBoldGppWLpZx+D4qipWGdBea4=;
        b=jWbowDIwzPSLEcLC9iXx44y6KCkRAmRJu1XlOpG9l5kp8tpfyintBdhLmjp0pNGCBb
         ncqgHKugspx/WB+pRsZJFKHd6kGXUJfavEM3DLQl7D9Y8TjBwxbVb/rItL5LyG0XGMeN
         agHa9197uFtDvnGMRPg247ctBTZpuortWCW2ZkzO82wsIIUdmlqI7/vhD/ZZYQ/c4a5M
         lSC4KBOwiucAMyvuoppWHyzwLecIGhx4BtjyU5/tlOQCEUeMDr1ytd2Uf+8vDkpfk01b
         bkWJAD+FikHuPJUu9BFTzeKo+gqf91BaL5Bg9vH7VxzWkCAJJ4aP9mvnLceSSETP0tMa
         wN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793725116; x=1794329916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0umCR55BSt9OK4xfEBoldGppWLpZx+D4qipWGdBea4=;
        b=SYJddPYvfVeKaA7tNjWByaScuZfvAFvzsI3vbVRtZcQnJPKDrIICLlA2p/VqaVBCHL
         PFhSDQs1IKJltH0/dTFBlIKSkKwMd7Q9tWzhKmTNNctc/igBDlaR/HtIht1E1kJtnhjj
         +uFUTrzzt7M92C3QF6ma4AXgV7HUfMscNF9TA695XvHpTjgCqCLv3l61umaQC6r/bGjR
         0KCq13KkCDZPs7Cqy1C1IDvOjvEW16T86B3BHY/xnK2abhOUeF4d9JpQ/k1qU5J0A24d
         x6yjJZUUv48TYznzuCF7zBF0na+l5O7g5/fkczxBl8NnXEVaaWLt65BIuL1SeWVvYm/B
         9Vnw==
X-Forwarded-Encrypted: i=1; AKwUvBzCBK/O/bx6m45zjQoUjR9cpRUH8JBbOAvsHPjlIRzZ8RCZU0yS/40pc+uzuSizRyUD/BsjmDmu9GU6p2sROg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XfrhAgJB7l7mZoJn9gE7oG8jN52p48sKCLRz8BP8neg4R+ocN
	F4p61SnKpyOyVPMD26B9pmQ5Lx9e2c9HLHcDi6j0FOlBMbKC015CI00Jv7IuUPtdmgelcvcjIa9
	ihLy0J666HoJ2+w==
X-Received: from wmbh21.prod.google.com ([2002:a05:600c:a115:b0:4a1:fd11:6e58])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3484:b0:4b3:6900:280c with SMTP id 5b1f17b1804b1-4b36def42b9mr44046845e9.19.1793725116279;
 Tue, 03 Nov 2026 08:58:36 -0800 (PST)
Date: Tue,  3 Nov 2026 16:58:31 +0000
In-Reply-To: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <CAGvU0Hm04LXTywU0eL6KN4=SoOAC+LU3BKqENnLR-WV-sHsuNA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103165833.418845-1-gprocida@google.com>
Subject: [PATCH v4 0/2] clean up EXPORT_SYMBOL_RUST_GPL
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

Move EXPORT_SYMBOL_RUST_GPL definitions into linux/export.h and
prevent the emission of bogus type information for Rust symbols.

Addressing review comments, the first commit now ensures the moves do
not trigger warnings from scripts/misc-check about missing symbol
exports by extending regexes to match EXPORT_SYMBOL_RUST_GPL as well.

Giuliano Procida (2):
  rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
  rust: exports: emit ___EXPORT_SYMBOL without C declarations

 drivers/gpu/Makefile                      |  4 ++--
 drivers/gpu/nova-core/nova_core_exports.c |  5 ++---
 include/linux/export.h                    | 14 ++++++++++++++
 rust/exports.c                            | 12 +-----------
 scripts/misc-check                        |  4 ++--
 5 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

