Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BB3EBF09
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077876; cv=none; b=p02ww411PXdXoReQQHfEm+K1Jku0sxH0khbLFCw41Yn6bb+WG1eHmuOT/I5f/IXeu+OqrjDMfpJlebXHZN8enwfmQAyDmUlTM05CsjzQm7GeCES2UPvOEshN8bIA7/W5dqOl+63J7FmMmptSiftwNtjzVSfu+31AW51OEduRGl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077876; c=relaxed/simple;
	bh=ZJVy6cPRC9mVjPwe70OyZwHOLgx0hBKchie2Ey+56o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BacOzDT4ou5nPLiHyQ988B+ONbfpYKS+Y4/+QQfWPRYuJR6vliOTHSxAsbFRYvPmqSij4g6TJNwdCckv653cyNFVMr0IUOLhLYkEdX6yvPjPED7oFk3XEFEc/gT2QF9p4TDE9Mi5HEPKfkTFokSDiSZdGwO+PsrbDc6D3RN15aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4h5okCy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4h5okCy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a09d981507so1789165ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Feb 2026 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770077873; x=1770682673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ1ws/HZ3fMtoPm4mMzkQZSOpt+7LENYkmppWHzFdqA=;
        b=X4h5okCysoBz/QiSq5/mM9++K1C1JQlcJxa107X0FYoJkks62N4Vo91K0uWw4MnW3Y
         8e363Uw0SZ5YUckuF/CxOl97e9bS/2c1nm/qXPbEgW/NTN3genVWNb9eDDDXPvu1aLel
         5W9fwyTBlskb0vjfws3Ccjg3eCQUuwmgHlaAOi4n5+soluSYXIzBfXVrWA4Dtl+sCcZU
         6OxN/plGs059h4hIfKWlyXlRT6H/fgkz9qf25aACVQscHoTlAUBnp6tsP00Tm6vzgHqK
         /5+chZvsJkeDiYPwU0K5QMHeXbWpQUtEVft7JOyUsXG3DXvEljLqB+9tBhNIUM77hMpX
         M2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770077873; x=1770682673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZ1ws/HZ3fMtoPm4mMzkQZSOpt+7LENYkmppWHzFdqA=;
        b=ZWZxevjOenX5DVhY4RpLnHzX03PQ0RqADMUSs03HeP/odSkGUZPhdyWb68m9UGRo7c
         s28WrZLVWUBgjqY9Wss0kMDcTvSc2bEHhHQ3r5ytFZDMhcgJ+f0gmzUFsJ9B7vpQLqDe
         GXEL9UOihn/cSVS6ZnJzguNmRDDhs6ow9ZUjcfCcB3SLpFLp0k1ZZ5xH9HBgSu9p4rzY
         XMnrZvo7vpnTu+vusrj0ViF1pc3wV/VKo0A3YTjtsQfGhlGZxbfSUcv/YedFyWAxRGrU
         Q5XHSYdGpJTs2nTuZ+4gab9halYgdwQPvwq+g2a5zN7EmWpf+on308p+tSan2AMBTv8r
         HjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0kyT73itz1vohQnpz5nzPgJpdb4XJb0yWGb2iSZpeBRUsG7kjrxLvh4e83K1v33+jdxG82Vm29rY2bhKZww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1FQtpiBB5pA0aDbtnxz+3PhBMs5EG0Fldp9/cNuAK2IwwOhp0
	bhp74L/rEgTcUb7ZDyl6SKJYzR+3wG/n1g8MYSpKJY9STQiXDDjesLpA
X-Gm-Gg: AZuq6aKZDfYnmTn6jNdZzMceP18JiPEde11OewZKUP0QHcFsjCjb088T8zbCkY//DSH
	hRG5YHg3edGuUYb2yAhYt0y/MmOpYwL0FFQqicTNVOf0lcjV06Nu0f2pY9Z0S5FusTjQ5LYnj6g
	pZi1MfWh3UvZGlxun2YpZ/VwWExCebAVGD5CTm8iMuryAClbYz/xhM5HJDmd0/+YRRKY9GrZdRs
	2RdC53w9cWga4w7Ken2JXEXo1JWRHwxc/Hv3Zs5+HxW/h9LrRMOZ0VPmbPB/2Apq/kbKbUf3yG5
	84X2muO599hae4JrR1CdwcMKELWntttjXsmnQLBAe9kUWSJiw0Io4vtkhweXQY0HYg5hxhbwkFd
	GsDAaqKkpeEdjgzfL46sYrVk3y8hsHYQnw031l2gb5G77v5tcMZ1RviB0ELBWisKaEx0xU6apkw
	Hgqr0=
X-Received: by 2002:a17:903:2ecd:b0:2a7:b412:6cc8 with SMTP id d9443c01a7336-2a92458de40mr8592055ad.1.1770077873450;
        Mon, 02 Feb 2026 16:17:53 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4110sm149973765ad.84.2026.02.02.16.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 16:17:53 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	HeeSu Kim <mlksvender@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] rust: Makefile: bound rustdoc workaround to affected versions
Date: Tue,  3 Feb 2026 18:17:31 +0900
Message-ID: <20260203091731.2731080-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
References: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
handle a rustdoc bug where target modifiers were not properly saved [1].

This bug was fixed in Rust 1.90.0 [2]. Restrict the workaround to only
apply for Rust 1.88.x and 1.89.x versions that are affected by the
bug, preserving ABI compatibility checks on newer compiler versions.

Link: https://github.com/rust-lang/rust/issues/144521 [1]
Link: https://github.com/rust-lang/rust/pull/144523 [2]
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
Changes in v3:
- Remove Fixes: tag (this is a feature, not a fix)
- Use full URLs with Link: tags instead of GitHub-style references
- Add Link: to lore.kernel.org for Suggested-by attribution
- Add Cc: stable for potential backporting to 6.18.y

Changes in v2:
- Change approach: bound to affected Rust versions instead of ARM64-only
  (the flag is simply ignored on non-ARM64 architectures)

 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c0155b83454..55e2dc865207 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -136,7 +136,8 @@ pin_init-flags := \

 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
-rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
+# The bug was fixed in Rust 1.90.0, so only apply for 1.88.x and 1.89.x.
+rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),$(if $(call test-lt,$(CONFIG_RUSTC_VERSION),109000),-Cunsafe-allow-abi-mismatch=fixed-x18))

 # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
 doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
--
2.52.0

