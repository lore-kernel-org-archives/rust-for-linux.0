Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECB370D56
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322010; cv=none; b=Y62FJ6zsGGNe4N/gLHa5MK+Pr94KCRoPMPuvZMr/Q9i9HU1dJz+LsZ3aTy4YX/m7kd9CYlXK81GCsc8QQvR6gIeld450RmdThmkXrqmoaS+TtE5fIJWZVkqSAN0Y01SzQQvgaofBj7gWWfWKxUY/RF7xBUoXGt/8vsR8pMvneCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322010; c=relaxed/simple;
	bh=YaJGQbpQ6MjSMX2sNG9+jirJnxmiHYUlmisNX7tDnn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=caG4rsJddfXsAQJ5oYJF/uzzTqvowv63NUAN5f1ByqFEoc7UNBJlvcTy4aH3ZHdDMmiZAHKy0BfRuI0qC3s5vR3itIRhQYUqaqlELoFVRxoAIqWOaM0JUAPR4NvgK3IzUPzEQCNfJOBq8fNeg2+jFymOU35AJHp6/4/t4ZXc9K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHUErDSM; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHUErDSM"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c648bc907ebso6956572a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 13:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777322009; x=1777926809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8ukke/PuH0j0OqYXoJI9DvAjkySK0Nck/KzrZl6Qp8=;
        b=fHUErDSMj1YmKoHnNiEvOR8zNwS7xhmTNal9kF1s54JuQ/ecvkhkbnJCLMkyv2VhfX
         G0qu0xlqrccyLlaexLHvM+R6C9Y12d4pCIuC2Rz8+E9rtjUSp07MFWKUA1dNi6RXpFEu
         4/4wY1qhjE8iI0wlZRyrWkmqe/SPrs8wLKu0Lq2zbkEr6ZTEwunLKAxYhHOv0gOBb0HV
         vbm+pxO5ub9h2zwthNevD0Cn5U72/IjexQZi6eDehjfyeaTUnsgESyzDTQ1F8GaiWoQ7
         VNbGcarPr2xx+b1nNT/nMA/lW48kcZWm3g7utIIEALVXioHeUxDACjxHXDh+6qjWUvkj
         tnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777322009; x=1777926809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8ukke/PuH0j0OqYXoJI9DvAjkySK0Nck/KzrZl6Qp8=;
        b=ovLYpRVdyo+SeX6eAnL/mELEc1JxNkhzZpbNqBtr6t20pOoi6WQ3MXgo216iLSeg6r
         K+2jtItaJi8HJFdoufhJpAN/A1EX1Fn1aGFPy2iqrUww0BcaMoKAefxs8LdMjJ9QJ7bY
         XB8TfoFTpBMq6ciKc0EhGfUh1X18iYuNf0OLRG7T8G2OveD17V81mAVpe3/KAVka+z1Q
         S8WV5DzrQ1fqYkRUp8QIorOy5W65JA1j/BKQSxdsijRPpH3rFdoN/v7SBDy/tsLlt31W
         34rn5cUiOkyp0JMe+6wrv+Kq0JRHFPw64Ax/oRonb+nV/5ApxB5ZYn5/h8RfvkIWpmfU
         AITg==
X-Forwarded-Encrypted: i=1; AFNElJ/Y1KAJWUEnFnMo4X6eXtz20rHDKd1SyF/4IERQtuPhZ7Kcp/NbIV/aZzjGcoMmwsGF4ia14Wep/1ZwUdMtgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB5j+EhWsZx1hVjD0bDwrk1DPRQyjNizlWaOnsgUQ8HwxOX1wi
	YXLGVCyQUGZz1ZyQY5YLj1+BMPf8jgDlH5kdhRDyXOtvRnhglnuUXDVM
X-Gm-Gg: AeBDieuJV/oeA4r5+sPT/m/s5rcZ+TgET5Xnuw7GO402O9GWpCE6wLyjzqBLXd1zaUB
	YE49g8YW/3ZEICqbgcoCaQdOHwX6fwMExkBpik8iHH7KqCMvXS9iJt7wPMdCFakeKCR+k6MOJUk
	9wkV3YIawigCG6O32dhlZ/o5Zyk+zjit3+PnrZjL/O7YH6gq/S7cfvN3XZMSLOm+IUCFksxYyA3
	ATUdUURgAm6w4pBc/XtldLI+wIm5MK478xp4sggw94RujUrZwABbCBCtnvtB8F2fO7qTY0l7Wvi
	N+mYPeO514FahEIUIyI9rl432sW5nbI09DByIlnv/8Ub+JqMXpi2Ij9RHCi5YKcN1piXHh+zGKn
	wW9x05mNbJ9829Tn5EwtNaTsoispMVmblOphWq5Mqc7cBGAf4QGD03QQ4EDs29a9VxtKXXvfJfg
	+YRUHX9sq4xxhsIXPQNNldm0n0md8gHYyl+8rx7+Iy+eLxDP6IFSg=
X-Received: by 2002:a05:6a20:548d:b0:3a0:cd5:82b7 with SMTP id adf61e73a8af0-3a39c46a108mr222749637.55.1777322008821;
        Mon, 27 Apr 2026 13:33:28 -0700 (PDT)
Received: from Nighthawk.localdomain ([223.178.220.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae00c58sm386080b3a.3.2026.04.27.13.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:33:28 -0700 (PDT)
From: Sagar Taunk <sagartaunk2@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	lossin@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagar Taunk <sagartaunk2@gmail.com>
Subject: [PATCH 2/2] rust: sync: atomic: clarify AtomicAdd safety comment
Date: Tue, 28 Apr 2026 02:02:58 +0530
Message-ID: <20260427203258.22148-1-sagartaunk2@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous safety comment for AtomicAdd was marked with a TODO
and contained a grammatically broken sentence that was difficult to
parse. Rewrite the safety requirement to clearly state the actual
contract: calling wrapping_add with a delta from rhs_into_delta()
on a repr obtained via into_repr() from a valid Self must produce
a bit pattern valid for Self.

Signed-off-by: Sagar Taunk <sagartaunk2@gmail.com>
---
 rust/kernel/sync/atomic.rs | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9cd009d57e35..b38d9a17f9e8 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -127,10 +127,9 @@ pub unsafe trait AtomicType: Sized + Copy {
 ///
 /// # Safety
 ///
-// TODO: Properly defines `wrapping_add` in the following comment.
-/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
-/// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
-/// yield a value with a bit pattern also valid for `Self`.
+/// Calling `wrapping_add` with any value of type `Self::Repr::Delta` produced by
+/// `Self::rhs_into_delta()`, on any `Self::Repr` value obtained via `into_repr()` from a valid
+/// `Self`, must produce a bit pattern also valid for `Self`.
 pub unsafe trait AtomicAdd<Rhs = Self>: AtomicType {
     /// Converts `Rhs` into the `Delta` type of the atomic implementation.
     fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
-- 
2.54.0

