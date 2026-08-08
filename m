Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D230194A6C
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786159329; cv=none; b=KSkXqcmPfOZ/vxG7+7JHzBsjbrHodRLJCmXoWR8mVqTHiwfw6mJljZvuDPzbMeoJAE/aqfp8mvQ7arDLiFheI5TfV/aUp86tzgluyp2fREvjyqAZbHlIIDYVER2IDeRAOIF3NabdGR7msUdpWFxcbDZjktUL+jLhnvCUc+VTIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786159329; c=relaxed/simple;
	bh=XY92FPm8CgMtwV9v50zUyh6AXSZ6A9wydtKKZtxj/oU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JRx7PwWnrhKEXh4lUt6f10qnGVIb4Jb7TBkZIOgqIo4Z8UCsGyHhR04pKoBAlA+MpaS/XDO1Gg8yraPsbKXq3YUk6gRK7BI14naMne4RM2x0tkvBdp75rtDQVJO4PyBtfYsG0WT393vsiEsmtzVqg9l4P9CLtU5YsDIE6cGl5Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeLONZoG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeLONZoG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39266382df6so188306a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 20:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786159320; x=1786764120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNXfsscFcsBx7GiXXV8Ydg8/2MbO5H0rQoaglQZ91nI=;
        b=DeLONZoGGqGyYTwXOSUTZG4xcSCqtzXzDmoog3ruSvKv2GG0UmDlTykXPonI+IlpL2
         yuJNBg58NSzBn9XNOfZjjrhbgvkgyjCr3ilgwwaYcU27bJAvI1pFgHbiNHPmOMt7gyKv
         8JVfloweg0ocqTb9u/6QAhS3usbbz3XVxd2tbPknAFih9HiLccj9HarPfl4HNvlYUNsw
         NakPBU3+TAPLE+RhCeQjYu6et1VtRgqOw71c5fwCI0MrviBdU04fPSjlheWXRPfGWz/1
         Qc3q/PFRtf4i6gNNEkQdHwWJypgj92MgyUef8TcM3MJbIBj7fZhLm16ujPp5Fwn0ZPH0
         XKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786159320; x=1786764120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNXfsscFcsBx7GiXXV8Ydg8/2MbO5H0rQoaglQZ91nI=;
        b=PsC3iOfEvH8KR3Me7E0torzlJmyTz5EjpTiDLk/sAw6yP/ZpoYpj/k0CuvVqqiscPd
         8LH2Ycr2kQ1lKGJA+P1K/HKhs1fwLPO0gv3gpeOJlDW9dGEsacW48YREOhTw5VKIphV2
         /f1OzrBdUfhp1+zqK7AZYfPZ3/E3x+Z/3yGlHPclvD60MB6KGvOmjOa2OkQi8ndVWh4K
         Ti6ADLT+sp951AeOUCTTvwtBbM1EKBOXOt4d9TaUvL45UKQz1ZiQZ03PTQj3eCmscMMT
         NxlVp1S69aL/gOztK9adhZMgstN181/mejtd20lX/owcj+R07l8+jHB8qPgdzQPrunzj
         jkPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbNmYiRwTWNPA5bcmgtTz3fTtFMi+715khZRXkWZFN1/1/CeEiUJmyPqOqECqZySxUeUfAbRn9WQDfKOFZNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP0Qtg91P5qNU3X5QXHLgMbDozE8tYLDp18225ONmFEnBLvBPE
	PdPqwudTNZq4JSstaRyqVrqi/MpTZvfa3EYxrAmwYlwBO1VwSzmXLWqb
X-Gm-Gg: AR+sD11cCwVKayFKm4g8wVDz+ixYBTkabclEiWgSiDMnj8pmRVgQhBq+VcELlFFSbP4
	tHUgNxs9StRFJJB/xoRg4g/nmAwPLtztDOdgfjFjHqfLXZzmA2J2adLez8dmgoE8FMGWZPiswtv
	fwwqCCe9E/E72+r4YPeHnyWpHN9XTD/uSEjO3ubcwAD/yIaReeIeskI3hxVHsGtlveQNf7uaHKw
	19iO1JCfaUfANhxG4YYRYnzj2dEBF11gYpxVAaL7YFSb3wfTDyze9hEqt/0jdHgmBYJCxXhoHpl
	fSvkxqHlZUzKNp4ku2wI37joxrY7FMo29k0UaPlEEW6YIQ7duzSBNg+1xGMy7YYOvyUOkIZTimP
	1XFnjol+0fVPNBpWCVVjtRbqbuDntVh08c7rSM5YmsfgAzOK3dnvVrYMzdk7r3UYiss4D1oI/bW
	4vkFta55F736XpeYf6I/f/QszSj9qziffhjnbwZbJ5SG8xHLaS76W6q6mnwos6T1qzaD/s+1UEg
	KbLZ7iXN85rwsEOTT9Svfx96BfT0TuGNUajEWbQrA==
X-Received: by 2002:a17:90b:264c:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3903c59936cmr29436120a91.8.1786159319550;
        Fri, 07 Aug 2026 20:21:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.166.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm13817468eec.16.2026.08.07.20.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 20:21:58 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	wedsonaf@gmail.com,
	mattgilbride@google.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h
Date: Sat,  8 Aug 2026 08:51:43 +0530
Message-ID: <20260808032143.2767112-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rust/uapi/uapi_helper.h was directly including <uapi/asm-generic/ioctl.h>
instead of the proper <uapi/linux/ioctl.h>.

On powerpc, <uapi/linux/ioctl.h> pulls in <uapi/asm/ioctl.h> first, which
defines _IOC_SIZEBITS, _IOC_DIRBITS, _IOC_NONE, and _IOC_WRITE with the
arch-specific values, before falling through to <asm-generic/ioctl.h>.
By bypassing that chain and including <asm-generic/ioctl.h> directly,
the arch-specific overrides never ran first, so when other headers in
the compilation later brought in the full arch-aware chain, Clang saw
those four macros being defined a second time and emitted:

  uapi/asm-generic/ioctl.h: warning: '_IOC_SIZEBITS' macro redefined
  uapi/asm-generic/ioctl.h: warning: '_IOC_DIRBITS' macro redefined
  uapi/asm-generic/ioctl.h: warning: '_IOC_NONE' macro redefined
  uapi/asm-generic/ioctl.h: warning: '_IOC_WRITE' macro redefined

Fix this by replacing the direct include of <uapi/asm-generic/ioctl.h>
with <uapi/linux/ioctl.h>, which is the correct arch-aware entry point
and already maintains the intended include order.

Applies on linux-next.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608050618.9dekfjtF-lkp@intel.com/
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/uapi/uapi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 86c7b6b284b0..489748ef642c 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -6,12 +6,12 @@
  * Sorted alphabetically.
  */
 
-#include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
 #include <uapi/drm/nova_drm.h>
 #include <uapi/drm/panthor_drm.h>
 #include <uapi/linux/android/binder.h>
 #include <uapi/linux/android/binder_netlink.h>
+#include <uapi/linux/ioctl.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.55.0

