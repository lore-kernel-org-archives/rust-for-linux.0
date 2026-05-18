Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A7481FB8
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111695; cv=none; b=dd8LTXDkV5YuDiHwKdFPx9zP4+72mTMoBxbpt/qFSiqc9R45AisRakGKWsVA8YvKrW0DZzTP7EUPdb+EyIVJ9amk5P8MnA26JR4f3850k/XRaATrmZYvemkqyJeE5CjRmmzqhB/Ocy4ALc+zMmr/3LfiwwuvIbr8eycsgw86uWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111695; c=relaxed/simple;
	bh=0GMy557X2yIPxBvMxVdGjzD8em/l/TBASpj6hxhrv8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pJL3H4pXZG9dQWNjibiRmbmTC2Tvry5rbEW4g0UT95SH2bvzbYMN4bPcfDDeVDikThTzSsASYyjk6MfmRPTpA4mP0nxRwE5iez/jDnQfd6tD2+fzxxXoosj9i7IY35AQOKMGb9Wnso/1pOzuC6x2269PP4n0agpnuB2cHSeB3gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQt8fH/+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQt8fH/+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso968780a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111691; x=1779716491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ1AlD1AM21fm4X96F6F2/fw1jm8rVL0VNrv0bCYenQ=;
        b=OQt8fH/+sG0QcNDMPZMk0OAxRTbC97PmpYXNaoSCSq3B3RY2PzXPBcuy9AR0WYl4lL
         Wbf+ta2fK/+BV+Wxgx5fgYFVl6QqzMpBMC6poICpnIKrxRlSoyYh6LZE4Frj2biIFwqJ
         2MzN+nlgi7Mtffn3rqZOqDNxtAoCrLX2J4E2g7yogzrgc9H+vNEhMsQAKlxSBGItdel+
         eRjcrTqXaFqJASzrc48+1+KZgcA2U1yaQnLVt4XRIPY0Nh4+0gQ9OIHvRr1OYiWaOM1S
         mWNtxh6mHuPZ0FnfzBN7eZneGGlJKB+mmLZ75VmvuUyKApUaI5F6oTARa6MRHcJXFv1/
         43Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111691; x=1779716491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ1AlD1AM21fm4X96F6F2/fw1jm8rVL0VNrv0bCYenQ=;
        b=hnoaIuGSzYnxndYywIv28g6lX2ahaze2QnXEoU+kJrUibW126mbQsdBu3SwYBeMCQG
         RocKNj4A0g0ZxUqihdnOf4TjOAfwlkQVBfgg/ds2eBMHt/UIJDVDLYgy9qg88sRQTMm1
         O1QyIAgZBsvx9V+FdC3beStFKz8mBjoCTBC5UU3TAYpUGpRUZx/HYjNEY2ZIdXTkhYka
         Z5boeY29HGA5ioj48gZMUqc/bGapNmCrHE5VIVTnxyubBgYd1zi6uW5efn6gsqowQva9
         rjKRgZCxyZd6DqfFPEGO3QcMFvJg2gcvxYqRpYzW6Dw0IwY/2vrmoYZ2PMYqPH6kHvnd
         ymUg==
X-Gm-Message-State: AOJu0Yyxm/NhCalVI7V2OhqoZVZ5XsFotOGSsrCC4sIzWIiZvh87YGGy
	vUPSzLEoWWEMX0DOOGOsVLTkfr/Z9qhE40gq8btGQsaRgY9o3FZIGICbrLTyBD6Hokuk0stWIvU
	=
X-Gm-Gg: Acq92OEg617/9Rt6aQstUw8OE462Z8rj+7eZF6//6Yi7vAYfakwbztqx/y4hsPNAa+G
	ELX9VXMo1pTZM646N3ENQBUKmrQrdxRAdhBHkp+g1WGmGTbwK6OR2KT5LU2o8JjLZpV1mz286At
	+yM0TNNcsvHyRwCymbMH3queKxLwUjusbMeLH8k0x1Hy9r4/Hh0N1LnkHl/y2P5fLI0kQxsKMvt
	TXHD4elcfWGpku1BYGQIBv6+e1cxIj/UNIIjGAL545+1/OgovwMdgGPENPxnGm3VpZ0J6DBSdcX
	MnS+UjB7woiPmeWZ0FVxjzF7OXkWsU87LSb5uBJxHWJeZgl7Bf7jl2CFXE0q9QrDvQWL59oVtl8
	hamF0Zgf88xlxEWXCCD0t0dqM7q6bnoUBRpLFcDbyi1W3YVDMYqkwivu/PPa1gPHs4+IHOcYxEr
	PWBMjg5WoFLAYbEkw083wv3OenYy3pOsoV5RArWcKQKaUHQa2j9A==
X-Received: by 2002:a17:90b:38c6:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-36951b860a0mr15275923a91.21.1779111690695;
        Mon, 18 May 2026 06:41:30 -0700 (PDT)
Received: from localhost.localdomain ([117.30.62.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369512424b2sm10934575a91.3.2026.05.18.06.41.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 06:41:30 -0700 (PDT)
From: Xiaobo Liu <cppcoffee@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mcgrof@kernel.org,
	petr.pavlu@suse.com,
	da.gomez@kernel.org,
	samitolvanen@google.com,
	atomlin@atomlin.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	Xiaobo Liu <cppcoffee@gmail.com>
Subject: [PATCH] rust: kernel: module_param: replace pr_warn with pr_warn_once
Date: Mon, 18 May 2026 21:41:07 +0800
Message-ID: <20260518134107.4114-1-cppcoffee@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_warn!() with pr_warn_once!() in module_param::set_param() to
avoid flooding the kernel log when a null pointer is repeatedly passed.

The original code had a TODO comment noting that pr_warn_once should be
used once available. Since pr_warn_once!() is now available, switch to it
and update the comment accordingly.

Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>
---
 rust/kernel/module_param.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index 6a8a7a875..fedb709fa 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -62,8 +62,8 @@ pub trait ModuleParam: Sized + Copy {
     // NOTE: If we start supporting arguments without values, val _is_ allowed
     // to be null here.
     if val.is_null() {
-        // TODO: Use pr_warn_once available.
-        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
+        // `pr_warn_once` is already available, use it.
+        crate::pr_warn_once!("Null pointer passed to `module_param::set_param`");
         return EINVAL.to_errno();
     }
 
-- 
2.34.1

