Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629131F37DA
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jan 2025 20:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354567; cv=none; b=InWhadL2OEflQBxe5kWWyeKG0isEVdSM11O3f5RneF+9CwSN80/rNycD/oGZNIsC9Gju81HZcg5D5MUPmUmQZSFlp/mO97/aitXPUZuBpsrwczTrVD2NI3KRphVQVwsdLsvuYlrB2UCsDULOFYxWVwE8RoUQ5lpfv8e0WwYbsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354567; c=relaxed/simple;
	bh=tIJDx3MGb8/u8yuG0YkbXmNQifDGVxb6LKspQe9uvXM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nUn5UAsWHn09mMzB7cckw3+xJD9qTuuUCx/zfuNKMcKGr3M6y8cUXUOWCCYrcC1wbIIu/6Nw4Q2O00FZ3qZOF6Ww/4XjjGPhcs7gfwPZ3sUKy2f5wfTCyfOry4CpYvwE1uTD4a8fscimBFo98rlHpkDD1jaGcM49YFPlKSuxqcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tjSha3Yv; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tjSha3Yv"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38a684a0971so1009493f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jan 2025 12:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738354563; x=1738959363; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wE6V39i40d6NuTUP/8PV2tcJv+y8Kf5+SgzZFsCF0pc=;
        b=tjSha3YvJTfdhaUn5NI2LYluOmxUj3+OgcJmwJfkT3Deeqis05mKg3qxqY4CLQ0oW6
         yvhRb/PJzi0ee44v8+ZRS8P8nWLMuGCvb0dU5lhHAmmaU4H3eKylCu86biYRw6EuxBJG
         ArJEcpsUtan1ciiTAik1TKi02wGKpqCnFZDlYjRS8r4CEYvawL5ADoNNcqLImwYtmgaA
         TcJHG/BIGQyvfhnem/YuViH6VqCwTSJC4dS7Q/T4qA0Jc46OFyRJwnKJfupsZH9p1tZb
         Z+QSe87Pt69QyGMWER/o+CuvQJO4nrbjNInwpl8wmQVE28yxYQ443GOWqWt10g7j+huR
         7SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354563; x=1738959363;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wE6V39i40d6NuTUP/8PV2tcJv+y8Kf5+SgzZFsCF0pc=;
        b=SUqgjL/JjWMr6HckMcRGtjIEfmCmqQ4WIayE+tRTLK1AKxVpXcY3dyaV7djnx7rdET
         t8fjlmBrULDSrnDJwG+gPGXUj8R8rYY32a9vKJ6TJ7cNPEXXqsQgTJl1rdhbKFNAvQKC
         3TK412oQ5JzEFqjLUBslT8RTFtrSbUUwD+nk/hNhQInDs4x4OBc6hAy3aDKDAguXjHZn
         zUJqWrfKzCqQbexSfGZ2BEnMQ5SFJsn+bF6hQ5WJCxu8FCw4EP2Wxqjj0bLdWjwUqRl7
         16NtPmQHzp/vEzyqbmffddga9vbx2xe/MbFzqtp7UVuCEssK/VUmTne2aVBmCsz6WzEp
         Sp9g==
X-Forwarded-Encrypted: i=1; AJvYcCXjv5nAi2s3kNsla6lhhO7pKDRAYHztBp666myfuaTeJ/Q7w59p1HZaSJ+fYG9d5RHcITyC2ZsxPJI8dVJlxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ1vT52aLlAieSGX64HUfWSAvEnsTuoQiJiVDhKZ5wKo7ml62I
	j4DF4ouc0axRmwy8goAOVwxC+jBL9UbXMnQ5LWva4/Zp7gY6tRVRZTR9Co2vMje4eGkg9aLMHY6
	iNdk70LcFxHE1+A==
X-Google-Smtp-Source: AGHT+IHdZRSPnylky1cQaVOLb3uHYm9KoKlk1DX0c8hbcjLUvGhulR+Xs+vVmbcnVpig7x/2iQC1+PRt4CV+/aE=
X-Received: from wmbbd20.prod.google.com ([2002:a05:600c:1f14:b0:436:e748:58a3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:4348:0:b0:385:f1f2:13ee with SMTP id ffacd0b85a97d-38c520b5646mr8375424f8f.46.1738354563744;
 Fri, 31 Jan 2025 12:16:03 -0800 (PST)
Date: Fri, 31 Jan 2025 20:15:49 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHUvnWcC/2XMy07DMBCF4VepvMbIM76GFe9RsfBlklqCGDklB
 VV5d9wKpICX50jff2UL1UwLezpcWaU1L7nMbZiHA4snP0/Ec2qboUAFAgyPH3UplQc6X4hmDlo
 FSk4PhJY19F5pzJ/34PGl7VNezqV+3fsr3N6fFOr/qRU4cOEGkBaU96Sfp1KmV3qM5Y3dWiv+e
 i0AofPIBYeAKiZprQHXebn32HnZvPd+DMn5EVTqvNp72XnVfAzCmMGlMKjYeb33tvO6+dFG6Vx EaRT+8du2fQPFjJ8MrQEAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=tIJDx3MGb8/u8yuG0YkbXmNQifDGVxb6LKspQe9uvXM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnnS93qDya932/5lX79+rSAq3zqOZrEQ+tQlTBp
 L5AUbF0WTSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ50vdwAKCRAEWL7uWMY5
 Rn0UD/94CFTNdK9ET1r40OvEqWVfd4fKxLmRbdI7Maja7esva9fOCPxToCFY2Qonc/5aR09qe8D
 E6M4vd5GNDSr8Uwn8T/0kj022fEyHsScH1BAcOnmYwBdTgmgQEnV5Ya1dRAr2CQ/lXth8fyxeef
 94VvO//OU006MsDP+cEl9bTKnKbV2/QeLlagHLLNncMxaYfDfbTJDk7Y+9+xl024fRdZkwvoRIY
 idMcLIwc7/AzNOBpeL2BToA2Vhb2DAGddq/stVTqSYGfBoHdW/m+esg/hLxzzHUFuULJwjUSasF
 TRY1vaJxdq9j9nnd39kJ+Egb3btG+J7N/BqG1oAT2CO2+tDFBl9FlXvQ7rvHqq5eev85NgR6IcG
 4I6FOrMn7jpNnEkRTNDt9WPZSK+g7hDYCbSJcGQVL3xEm2aFpsGJHiakxULHBJLw26m491DGOds
 CL7NGaMLFYgLg2ohyDUNMgM4pDuswYFi/22O6C0yatg5H+Hec2h3fOyGOFdU1sQSKAMBnjvzq2p
 5vVwhhcqVXD0+9/dg0M0uo9rooDlPoaEVHtUArKOSaLm05EI2qkMYc4KquX7ojoF0ke+VbZWrmR
 HRjbVLsjvuurzR+fyJLuJAUW4tU4hYBkry7IDEV2IFfej4ye0fiUK7z7t4mAUtxl+px/reSc5LO A0stcKtjvKicmAg==
X-Mailer: b4 0.13.0
Message-ID: <20250131-cursor-between-v6-0-603bdc7d4449@google.com>
Subject: [PATCH v6 0/2] Make the Rust linked list cursor point between elements
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of the last patch for more details and
motivation.

I was testing an application using this list and discovered a bug, so
I'm sending a new version with a fix. I also added a new method to make
code using the cursor less confusing in a certain case.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v6:
- Fix bug where Cursor::insert_inner does not update `self.list.first`
  when inserting elements at the head of the list.
- Add a new `Cursor::insert` method. See its implementation for
  justification.
- Link to v5: https://lore.kernel.org/r/20250127-cursor-between-v5-0-f7c388c23642@google.com

Changes in v5:
- Fix list / list2 in example.
- Add remove_last function to example.
- Link to v4: https://lore.kernel.org/r/20250123-cursor-between-v4-0-cb06698db94c@google.com

Changes in v4:
- Actually call the example functions.
- Link to v3: https://lore.kernel.org/r/20250122-cursor-between-v3-0-aaafbd8af14d@google.com

Changes in v3:
- Fix `CursorPeek::deref` to use `self.ptr`.
- Reword comment on `ArcBorrow` in `impl Deref for CursorPeek`.
- Link to v2: https://lore.kernel.org/r/20250121-cursor-between-v2-0-1b24cd377618@google.com

Changes in v2:
- Extract insert_inner refactor to separate patch.
- Make move_next/move_prev not wrap around.
- Add some examples.
- Link to v1: https://lore.kernel.org/r/20241025-cursor-between-v1-1-08913714aae5@google.com

---
Alice Ryhl (2):
      rust: list: extract common code for insertion
      rust: list: make the cursor point between elements

 rust/kernel/list.rs | 471 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 379 insertions(+), 92 deletions(-)
---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20241016-cursor-between-154bed859e27

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

