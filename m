Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD33F44CF
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111666; cv=none; b=HYrkhGsMJjQYzV40S3vPYI6yptH2d/G2n4vej/ojIS8kRsXPmTuGYIplq1aFy4QdfvwaxaAjD7H1ibun4rX+0VUN3V+R1PuClM1ex6DPBwptyfluVzlqepFaoR7TY+lb80D3euDuhd9DiPA4bC6REec9aTgrB8MpLMC+SviRqJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111666; c=relaxed/simple;
	bh=0GMy557X2yIPxBvMxVdGjzD8em/l/TBASpj6hxhrv8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eVGmUfs1wJe6ltZrgI4fBESOFS/ChxhvJYnX6s/hvrEurjlgoKlDcO4cI9EnXphPGqXfC0tm5j6sMXShL7pBpLdpe86vaORiVo0+czZOmKqmy0ybrTOOU9m3zFfX7Z1NaeoB9U+qyHwXhWBmQxRv+lexSuHqhFsOalmR8PVXQ6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Huw7mbZ/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Huw7mbZ/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba17c8cfacso22718405ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779111665; x=1779716465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ1AlD1AM21fm4X96F6F2/fw1jm8rVL0VNrv0bCYenQ=;
        b=Huw7mbZ/5fKzJKKAH/8JY0q0tGNw7zo5vqe/Mr84yo5S0jljTHI1h+crJU6REFAGou
         Z8RU3P7A1e0OjnKFosQg5HhPV2rzgJCTJeYp9AdKpdhQrGOoalCosI6vQ3/8Lr5bwF9Y
         Bme2057FtCi6/LP38myo902Zx/6975WbHW3eudt3z9gYSR79iW1NpeHVOikQAu8AsCEm
         JKRCblF8kQ9omVFXFQWM2Q3ARbbMAae6xEWlsUAHNJT+YSxgOwPCvC+nyqpbTnxCPllP
         zsVPVXa9neKyyQziKmCU1tqCjTq/wOb7jXBqgUDUBysiFX9t+R0xocxBZN3JufjuwvLD
         Lndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111665; x=1779716465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQ1AlD1AM21fm4X96F6F2/fw1jm8rVL0VNrv0bCYenQ=;
        b=s9jxc6p9F1K+ZjhqB6e9GRotOdJqf/xPdNxT4tERJVXxhbG8M/+fyf/JyWMxQe35JV
         dCFPvy/B19C4GHTDsK2D77XMGtRh/Rx3Mg5c4v9jqTokauFKaq6f+x/9iaLV9V6FeC2k
         iuQYHz1uvasD5s/0rldE0wtASBOAuwdcV0QFHiKimAezwmDChW9RZ51ygilpdMYG6jp4
         4KTRVYZyTes+Qp5KA1uKVPC+y5e050MIBvzQ7XwQJ6PO47PJ5SiEmxIexMFqBjwAnyHD
         ZBn5Kjm/3rfyxLZNQFf5IUN0n0gE2bLBawBxKhwDjZOccSN6xBHoekvO5iEMJtaznF6k
         Ifew==
X-Gm-Message-State: AOJu0YyGtu1qVxzPMnT3yOMqNV3k0J5y/Skk9smVUHtC3I4dVLUfliVV
	DapVhHVUOjOI3SWgHH2/RUj0JkxcNabjMVPuhMYCPwTlkqlQDuoDXPbHuIx8kT2aIzm0bWbh
X-Gm-Gg: Acq92OH3PKX8Mam8OpvTzNCGLk3sEfUaCzpSMki+tbWuG+zFbTo2XBmmsKYrov/jCtU
	+oD5RIyy3vgKpS0BEsJhGq5qWcKL1m++WHHJzTh8X8sSWpc1VVQDYQakwCmOk5Fvtw3D103Jsgn
	nNyqeeIMBSBkerfmOVR+ulTrUQO4hvgysUKHRNIFuuFuvYfgOgs8JnLjTV7TyAo4wpPmi9d7uE0
	6f/Zf/fTKQ9Y8a6Ago8EZbsTX+4u73JLLTLmWhwv23N0YzUMHfvLidumWdunprebR+rHWHztif5
	RrCXEwbC6sOrDRB9Vh63jfz0i3Xyq14EiEuaru2xKsEexlKXV2jjwNYMlaFxIVmaJo2sXHOYRs5
	9xUrkI8qsFWsb+iddQsUTKUELsIbgEf9eeRMOcyeqt96OGPsSCgJH7ZX/4WZrS8ZCsdTc+3yAas
	1mB7tO4zzcQxJcPUpFX8F82Z1IdguSgFSgsKz8H6Vu+bU6V1xpjP2iesxKAxT0N1gNEK+GEf2kt
	5AcM8nstxrjLwaRSah0zs2jUb1p7IrHxgMJXzVkgM51/Txn7A==
X-Received: by 2002:a17:902:c948:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2bd7e8423a7mr173026705ad.14.1779111664551;
        Mon, 18 May 2026 06:41:04 -0700 (PDT)
Received: from localhost.localdomain (ec2-54-199-123-161.ap-northeast-1.compute.amazonaws.com. [54.199.123.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm148500135ad.1.2026.05.18.06.40.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 06:41:03 -0700 (PDT)
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
Date: Mon, 18 May 2026 21:40:53 +0800
Message-ID: <20260518134053.4078-1-cppcoffee@gmail.com>
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

