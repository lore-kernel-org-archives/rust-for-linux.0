Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6BA37D120
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800198; cv=none; b=NozKIcqqov68P6Bk0iZpLIk2MtCebHy2yYJo1iE9rdo2cx0Qm02YN9FGAx7rD0QKX6/6Iirf8XpApdhjfPrdhInAStpzx5Rroapg61TDXjkZrZUYmkZxSOtbXcHoofoADE9rneBG3qLYqc1/GslrojOnIVvNRPCog6kbjd5ysAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800198; c=relaxed/simple;
	bh=rqr00ROJ95wA+SlzKHac8dzpku2iyfKmIncU+/cy7Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRp1zrAAXMgCX+1RI13rqgD45+jy8OF3y3jnJ778zjHSjqEMuc8uhjfvAXzrL4DeKmmV5UNTM5hE3HmTsmfzFJ6d2OLnc3UoyKe979ydNgxbMjj/8aTYsCdhu5ZF8nYqwHiF23wK7OOQN8uZ6hz3uzRvjEptJYGXHN2xTU+ujrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBF7vxKc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBF7vxKc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso15012655ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800196; x=1775404996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFobi584Ko0XKuKylhtkyLR5aYVs05x6vhchjMWGRW0=;
        b=tBF7vxKcg1R9GnmuKIV1mxQeTdFB9xCzVPWwPKrx5eVXHSB/+J+xla3zB+m6qBL01a
         q9kLbx6n16ZvmL3wcvusbprh1/G3QLHELlYaw5JGmMsc9z+wOuSmjY1JQ+lorEe80HfS
         wV2RZQFVkW3MTLrynOM4hsjsyrhf7p2WvaMyyrPm5jZb0mMe90y/XkB93ibSFUjTClJP
         TH3nqnZOwIm5enz9wnrdn+SPfcQH6VaKy6RmNLAFEpPe1baMLN7+2bqmNJyijy0YAqFo
         k9rNuEXTH6kOeMyZ2ikecWh7SQ0inNqJf/G8GpFvLLsHupG+ftAzu3DcplYtTYBACgdV
         2JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800196; x=1775404996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFobi584Ko0XKuKylhtkyLR5aYVs05x6vhchjMWGRW0=;
        b=dFEBFPmOnGeeVM9qb8/7D2qqWO6KK1tOSns1SGvqDQX1brtww2PCOtjbcnLW+286hO
         iOyvx9ioPIUNcFz4f4BVri8YZaLAaE1N+9UiIHFNX8T6nELuxrtQva3hAxQs7aDLSX3q
         oB5erEKEudgccbifw7+JGOcequMCNPp2LKjmolPuo0YtF65sZYgY3YxJFaTN7lHWHvSa
         d0zz4BKov7pWv9biY0HX1qwhep+vQEB0nTrm7rLUWlOOR9X0HNrK2fX0rmbaJBngiXxZ
         deZdGnjgwLuXHr/qwJ6skD61eL8ocL+LPMkLzFhJSJqnCAKuwowldQmi+fTp3Ydl/spk
         QtGg==
X-Forwarded-Encrypted: i=1; AJvYcCUH7Ce3oOlvb5GFPQAu9WM3WxfkK+rnSGznEmxUxnitdAlrmOgqmZbTqjxXQLyYcxo20BMDI5/gwav+zjOGCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCQk990J3mLQoKq6oZl8I9a/dXTD4JBB/FEefBALvBaYMaGrg1
	ews9Tpa5PLhazdkLUA/E6ZeS27ZlyZpolCQk49AsXavHuLO1F+2zZS69
X-Gm-Gg: ATEYQzx2YHdn39gUSbGsvS1gVps2IVNDS8LTWTq6mFn46CYh9OSNz3srV+z6czgccLS
	VE1iwfvajMhT63z2MUzxJ9vABadBtxc58/FZUE/x4REUlZ1Jqr9Z3+NnGJ16DXj/1jvys/DGWHY
	tJQ60kXtOYxt2A0/TgeXLHSjg0V0WVJUfID3/XmDsvSO1Dzo0gxExrqIpmYZczYuAFXtgx4gNwi
	Rey7ON7ZdxASEoTj4wOl/lTIQVyXjBlUBNOBldGMlDxFS43u18PUJkTyczC11tgB6G5ooRUeT39
	dfQZKniV3ilyaY9XOrDa4KWZyaIDYs+BaIijMDG+2UajUXWNOZMnFDNw7c+TfSb2+XeTTLPyhhp
	0ZlSqTSqL4/SVDBg+3BfzD5VxpTOrICSfTJbvufkakZak6Mxim+dIHyzxA9sg5gP9ozSo9yLJI5
	ZBiWbaPO4d0NblgS8iO5CmzUEHL394W36DhFTLA/IxqWnu1Qtk1Yk/gCFJXrv2BVCtfng1zWtel
	x8=
X-Received: by 2002:a17:902:e802:b0:2ae:b991:a46f with SMTP id d9443c01a7336-2b0cdd1a6b4mr106203235ad.42.1774800196182;
        Sun, 29 Mar 2026 09:03:16 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c176fsm52521175ad.77.2026.03.29.09.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:03:15 -0700 (PDT)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V7 1/4] rust: Fix a race condition in Makefile
Date: Sun, 29 Mar 2026 21:32:51 +0530
Message-ID: <20260329160254.2592207-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329160254.2592207-1-mkchauras@gmail.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When compiling with -j1 flag in powerpc, the libproc_macro finds the
libcore.rmeta both in toolchain and local rust directory. libproc_macro
should use the toolchain provided libcore.rmeta.

So for this, make libproc_macro2 libquote and libsyn dependent on core.o
so that libcore.rmeta is generated after these 3 files are done
compiling.

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 9801af2e1e02..8e62f6fcf94f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -650,7 +650,8 @@ $(obj)/core.o: private skip_flags = $(core-skip_flags)
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-flags)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
-    $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
+    $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE \
+    | $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_rule,rustc_library)
 ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
-- 
2.53.0

