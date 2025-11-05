Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E9B21ADA7
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 05:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762321663; cv=none; b=ff7sI667i/kwCeM+WqIy2xq18NR1207qk4dCBepOT0QJJe/6w7DW/zM0z96DLvlXoF9ruIc8sXYZbeK11D+jLPGjhDR+W03LxIbKDvhGw765sk/71YX7HYHNQ2Jo2Cd3YGDELWyRyvr6WV0xfMCfR6Up1wCdNDvEQglRt6IPxAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762321663; c=relaxed/simple;
	bh=ROWhJemST0QoRojBuQVfRpuY+WAHOczzfzo/I48nVdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BrFx5V9MBnh6G65lCugXafbuAkrTEe8QE1LzRSnuoReGR3sTxUMhF70TMIG9eRBOmo2HltxIMcxak1lJJT2gyWe52v+2LhkkpHH9RqhBptW/UG4DB5Ax/bVPYE6kwkGhW5iYuzDDREcmLe9+BYC36GgUCy84gZ4ye+YduQlXr2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8MzEaBw; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8MzEaBw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27d3540a43fso63587705ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 21:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762321661; x=1762926461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r+deaj4X01dKlQ8XZUxyjUkNiJ2iAQWuhJGxP4FDa0M=;
        b=Y8MzEaBw3u2t2RgSQg1E9NQbBOdIiiWY6K5NGb1dFnTP/3EFbFgunWRTX4UnV6+tJh
         KGw1Do5/m3Xo/9ZJsj/czsZCFsgKt91Tk/if+sKUmmLwSyg+SmVIaSy3PHAC8WPOg48D
         of7Z1Pl2kRXgsJYuy4tKvtEH1MuiofIN7C7GyiGLFFnGJDYXDhnI9MxuQ8xCjZ5kI75T
         swIb5irQKUdFufj19N6rX4vE4acjglQq9nemzO7tuJSP4uMFXiZ1BWKOoCPhPy69ibA+
         92Y83AsZJxb02QIrRzIdds4LvuYW5kGHpB8mRMNEQkmw7GSw0PhR67VWne4urBfTVzA6
         AVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762321661; x=1762926461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+deaj4X01dKlQ8XZUxyjUkNiJ2iAQWuhJGxP4FDa0M=;
        b=Dahmziyv42dFsIHtoW9hoNAdMF22iiH5xogxzFBdc4sWZGDo22Exl8CQ8o3dqqmTjx
         kS65EzUX0dH9YaanefuzX76L+QDIQzTbpJxLaHh8bk7NXC2rPFCjN/lkRIHhoSl5sfH+
         AAdNBsFXa1yL1Eywu81h0AWNcxjVMrYdOR8afg7zR6tNEhBs2SoqtC+iRPq72qNnJWpL
         C9/fUNHEAuqaC/igwiwBthMooBbpFyeLlx61nxi/835hn7rGJX0N3Lg2OP8HKCztJoGl
         U6fyiP5UKwI14+ir0R/vcqFn+FLzG4yhenjwjD57BfwsHGHiEQOGVmBM/U3VUBnLCfBC
         AzJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqjTqRY+BieHid3856f565v7O8wLC9P1EfQ/ssiww4iDlTNwMnkS02XnIqoMFNK6w8eYb3awhuNYSHabsnSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDkQotKafcIIWL8/lCOsRLYPm7UtMmYHtSH87HTXO7t3+teovH
	uVUEnu8gxvUq8XYafZtYlWRgmQpSCMyBSPIBmXQ43h0sjDKnekUMe6PN
X-Gm-Gg: ASbGncvU8xAk73wMFYd0PMoCz+hM7jKaJzgQig0Q33THX066TxIJ1zu7R2o2w88sZu2
	fOnHMJD4P8ODioI5mN3AgjDB7Lj+vXubXWi/gsEypIBVAS4ixxuRcN9vsUc4hcQNnbTeshJl+ru
	rCQvZ9ydyMGkJ3vH0jHEPCY8kIaxUKt/Qhq9A0n12DLhZgPkZu9ln//YrpxvbAsXWgPAw3H5h6V
	GFvjxClNOiqewAQD3sxbhV5GNxst77PXNUFl3Zp9+DpJlFyl79bv4A0suQtDRr4Nax0X80scixJ
	Fd2ga3e75Smn+EK5trvmnbuZ4/YEeE4PQCFW+COHYqdjvaoQOD0kQlVmtdRK1wnse+w9Lfsd+an
	/LJnudCcRHvYLO37ZQHTy8frUVuDG+X7DaPGyrXtXzTS9SotTZrPbFdwBXCSfPUOYOggMKxyAW8
	Mv7AnlHfKT4uca9+ZHeY+pjyIqiPwBwzQrQ76b2XblulYlahrc
X-Google-Smtp-Source: AGHT+IEMLb2dbu1OmIfeCcljLPuepnJfTyBTnLgHeFFf6MWYNBzmtF5b4qQBlIgdH7SWFflKVCvatw==
X-Received: by 2002:a17:902:db0d:b0:295:fbc7:d282 with SMTP id d9443c01a7336-2962ad4305dmr30600545ad.27.1762321661508;
        Tue, 04 Nov 2025 21:47:41 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6824811sm4913219b3a.64.2025.11.04.21.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:47:40 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	jens.korinth.tuta.io@kernel.org
Subject: [PATCH v1 0/2] Add support for print exactly once
Date: Wed,  5 Nov 2025 14:47:29 +0900
Message-ID: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
pr_*_once macros.

A proposal for this feature was made in the past [1], but it didn't
reach consensus on the implementation and wasn't merged. After reading
the previous discussions, I implemented it using a different approach.

In the previous proposal, a structure equivalent to std::sync::Once
was implemented to realize the DO_ONCE_LITE macro. The approach tried
to provide Once-like semantics by using two atomic values. As pointed
out in the previous review comments, I think this approach tries to
provide more functionality than needed, making it unnecessarily
complex. Also, because data structures in the .data..once section can
be cleared at any time (via debugfs clear_warn_once), an
implementation using two atomics wouldn't work correctly.

Therefore, I decided to drop the idea of emulating Once and took a
minimal approach to implement DO_ONCE_LITE with only one atomic
variable. While it would be possible to implement the feature entirely
as a Rust macro, the functionality that can be implemented as regular
functions has been extracted and implemented as the OnceLite struct
for better code readability.

Of course, unlike the previous proposal, this uses LKMM atomics.

[1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/

FUJITA Tomonori (2):
  rust: Add support for calling a function exactly once
  rust: Add pr_*_once macros

 rust/kernel/lib.rs       |  1 +
 rust/kernel/once_lite.rs | 71 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/print.rs     | 70 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 rust/kernel/once_lite.rs


base-commit: 3b83f5d5e78ac5cddd811a5e431af73959864390
-- 
2.43.0

