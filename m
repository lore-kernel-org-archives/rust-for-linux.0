Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877D2D73B6
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201256; cv=none; b=lZ1dQvxMNRVh53onD8pdhKhsfhCX5m/Hb38NY5JDQuNeLzYdENZ6DyWQs4O3n/dbi5QaAcq/tw2UoMrAUBMVCHcNc9R46kO/chg+DqR2JWQkkk5ENCSe+bDOyoyoXDCQFs5tfVgJfNBUF+wnwjyXQqih4MdY9Tn7z/KAq65sDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201256; c=relaxed/simple;
	bh=bZp8zfSf0+0j2MuhSlyeDxaKsIo8xAezFmdEdikJQpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJNL1JMn5J7uomgwAUM1+TNWzplIm4CII14IP+b5Kv7Q3P+nVu+yuajYHhNGVFLjqbV+TKFK5gjdNl8mqow5L8FDZLbyASGRYg3NC16hVTnyRB6C6Eim1e2mYI6hW7rrNiShrMC1LLRh2Fa6Yb33ea6/nMPzeLAonzf7OgV9fZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcu63PrJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcu63PrJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b458ca2296so57458975ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201255; x=1777806055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edTE4+K3AUC8N+XPcCOjDXD3S338RUHsqJvIH7+h8+A=;
        b=dcu63PrJLWxZ4VxPmnLW2NCGNll1a6kDsdlbPuSmNNRU23Qpg2xlyrNyWp7brLDGWI
         aFyPMAmA/4bdn2/HUBb80dAZ692fYIvu/yxP8e6hnMZpPlnet3QRnPKMShSj+w8dCzXY
         qdX6M707ijQt7prxtHXb5BsbfWhq6ZFifDLE/kMEg+Od1gmjbiTI/KNdCE1YhOXvH1/Z
         UDvdvt6+qPWf4pCQ5ISAFRP652RPd2ciN1T/UvAFgo9IJWt9nflpQV46HmDghAedBvXO
         ZokJW8MbCLvG/QTdVgW1WWpjZQC2JlRWQegwRczFGJItNBDa0lcGPfvuqoA7Fr7L/gha
         IYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201255; x=1777806055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edTE4+K3AUC8N+XPcCOjDXD3S338RUHsqJvIH7+h8+A=;
        b=Yu52ChRI7ivtFfUrE8ntQYqM50JHILP0cG9BVtIgvzaCXsJsG1+VuEHsHb+CzgVzUz
         pN8UPpqZpD96MkDGq9yNZsguSlJRLEDBfVbuzHPWq8pFht1mc0N/E9/hjnMSBR+RWpMk
         TkQ/iRhj/XxgpVTQE6yPS82zgFGiSBUNTZi0x01rWD0DFoR5YcPlYHewhAIeJWbLIHr5
         2X1o9PEQChoHDEtqhGmkVAlhWpZ3Kx0WTzKg1MoabXiWdBOKr9tFsdbu52A/2/u0E2AA
         GuvutqVRryiLIYV54aVz+R0Lto0SkiETFE5A0RbKUHdZqidxsVmeafwoBNghpcqHb27u
         SILw==
X-Forwarded-Encrypted: i=1; AFNElJ+y4Xi3eWMfn5GSXv4H6ttRVZT4uJ6d2GIDkSaIfkYqSr3Y7XexspMdgCP1VoGpABmdNnzoBzvo2CA6D1c/Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YySlyfvMj5cDtND8DMjFdhankh7DJfgZKlpIKGrnCEQsQ7UfKL4
	L4QMkJhLN8pecTGuJ3hmA2G+MbWdGiB6dSzQD8UjvBViIXaY5q2cjLRN
X-Gm-Gg: AeBDies2jyw1oBBgwBkj39H4eHSPO3hiJM9K/TSQWxlnLMqWdIruNwSjf06JzMZdC/5
	EToRVUdovICqERV4tFWQuCUb9JerCicJDziLXzMuqzZeKwkTcpqwV6f5bpXcuBdDk7pqQUlIhcK
	ZbhCU6Qk5za/zOPteIaxf2tHbe+cSK26lI/vJfEhh7IXbR9ju7qs6dqZJgSGNMsrO2wvMDmTtrs
	NnFirAScW0zeKPyavFCQHyBhU86Zz99gAZkyq6cCPb+94uQNPHsTM+vuSEjg63Zg4Xy487rA/9v
	Vu8moz6tQmDqQmbdYK8bS1fE9amK8p+M88BqxpZV5dfF11EwgT7vMuDG9KPO32uvTuDbvavvcK1
	qt/n95JCumEdGUgYGZPhvRlei+SYFlSrjN0QdIbGknRKHQCmLqjefS8fdcbCgm+RwwS+IBwOeR5
	VedIDe0EgBG0F/hiwmWD52gh4KJRa6fcMIBrFCdyIainbKA8Ygh2fKcRZz1tzMUD7ma3UTV+dR/
	O1REK2FGdgksBw=
X-Received: by 2002:a17:903:2284:b0:2b2:5822:7a70 with SMTP id d9443c01a7336-2b5f9fcfc2dmr396373895ad.38.1777201254932;
        Sun, 26 Apr 2026 04:00:54 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:54 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V15 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Sun, 26 Apr 2026 16:29:30 +0530
Message-ID: <20260426105932.2270364-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
build on PPC32.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile             | 4 ++++
 rust/compiler_builtins.rs | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 44ec1634714a..d70fb186cae9 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashrti3 \
 		__ashlti3 __lshrti3
 endif
+ifdef CONFIG_PPC32
+	redirect-intrinsics += \
+		__udivdi3 __umoddi3
+endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index dd16c1dc899c..fc6b54636dd5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
     __aeabi_uldivmod,
 });
 
+#[cfg(target_arch = "powerpc")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __udivdi3,
+    __umoddi3,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
-- 
2.53.0

