Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5B33321BD
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101278; cv=none; b=EDD5wz+lqqLPdJv+9ORw3e7oKCZo0FvD78+9MoRxEVpk3j/X1tSAxUCNX5o5OSmOxbsVP3DUN9vZdh0lzbebud7gg+FzWWHXU0ZXz17zSCZxf6gPnLgxBahZEJWbCWlGxTMZ1Sj0FAzN4tDmqX/Gk95AX3kKEGcMSk6Vv3z/HxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101278; c=relaxed/simple;
	bh=TbZi1MbwhQltQFM5pKHqcADDb5nmjIMAmUBf255JCWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hmb8lavsuaW9VyJJWT9KnaVhAkSHrwqMSDIEtK3SjSerXJkkCnyWeItm8vu2QcJ63rThzxjnkFP1dVkhhJykIY6RZ/bgmWTn2rv/TvHHbfTyvzDC23FE0JIPyq9FRqMFMXpoMqpUqnB7vf3nF4WCR68joQ9l1kepoQiM2t1BZNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPLI0dzp; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPLI0dzp"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12db2e415a7so850407c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 03:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101272; x=1779706072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+1SpA4orJK3lLLlU0ZTtdxmVVGa75mJyXOYMf26B9d0=;
        b=MPLI0dzpYDzrRnzYXnwOnu4+mDBKVxskBkU4fu1hibHAwZHijGeGDBnBoBvdnljzMr
         kQpYt5M14KH2DBT4E5t06LxJV6P718mfNRZLGJsewyIq1xo3BhOLi6WhvBwyx4QxEqo7
         Ho9WxnUjSFNcuK6VRd3EBUz2u4uoDbBUFrNXSTiLwfPw/x8hIF3DCriOuufGb6FLe9Er
         LvoPTB5INa28zttTHk2LVEYPTF9pOQh7CC4enO9nRypdgiwCF6mhBMt/gUBM9vv3w1XG
         FyDI6pMfllZVej0yPyJpuAx9qED3JQXEzqj7Nmvzl6icw8y7sX7LkzyoMBateGnDUy6H
         IPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101272; x=1779706072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1SpA4orJK3lLLlU0ZTtdxmVVGa75mJyXOYMf26B9d0=;
        b=Ns0nDnLoOxmKgRTAe9xjQbEiY4ajerebfDRqn7ut1roto/hr/mIBoSk5+ERd2CHBLD
         Pho78LvejEiphVoxDlWpwfdersgEZIYtddJqQqUKc1up9EThxNhKeYEyTjt+HISDqP6H
         kPipj07S5Hf5l/AFViAUmYSZ0+JkWDAfPWc0HFi0Mw4Ltk/rXDKp4xA9cceyJ1jKfle+
         rgJvHXYrhCyLS6Hht0V1GPfSuVnS2H/KxPmlzGP1Ks3cbhqH7aydw+1fLPB38HZqjuWq
         efuyl2NNDfqqWYpqPH2uMGSBIueUzZ99Tce/RkfaouMwM6mAYcFaDKZ0HYPO6hueDPpR
         9iPg==
X-Gm-Message-State: AOJu0YwT7/WNOiDmCRyxtHu6R4QOxt8+YwDflwR5e18w19MizQdYJ0vS
	lAnMlZ612jxE3fEt2bO5WIHjzsDkgWTXLPZCccS0GnxOUN6byA76U2imj++kM49GW74mVOsy
X-Gm-Gg: Acq92OEiPn3x0u+E1KLTsXuw8GqNod1OUQyDnkN0WerjozCqGQ4El4+IYUzCAmXpI7t
	tMYQr0BKL/LL9sZs5AOvDsEAhTqWmmUyY4K5XoNeSMgITuxJLTTnX8mU/q/9qQaGwDkY7Z+XJP5
	9Vy2/7YGJZ/OzURca/J5NEmWDMTsgcChhmi0KUfXn5wI+zMObcwIpCDdgX9s+W4emBEw6Qpjj4D
	EL2JGKhI0tLewp5B5O1I7LiRK9CzVIHbYccJPaRd2j9QtkEaxa3Gkb8FWz1pEiZeD1rrDLM4EMq
	TTBcnUt5CkkqFI8eA3CGJlE0wMPiCsFu42jecFbz+9PrtVt0e9hauVS6Wh0yA8IpIyBxe6WCezT
	NTn+gO5f0e0m+v8LxD2rrLtHW6G8IrW0XKoe+E0vhZ1g3u9r38XTimsj4RCdxlWat3X0yPUwGEJ
	6Q0uPkNgJYjUZ2UMeLuj2IZqwF2jbwdoryUvCjIw2KPefWaw==
X-Received: by 2002:a05:7022:311:b0:12d:b396:eaed with SMTP id a92af1059eb24-1350440ae04mr6279368c88.9.1779101271435;
        Mon, 18 May 2026 03:47:51 -0700 (PDT)
Received: from localhost.localdomain ([192.204.47.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm16703237c88.15.2026.05.18.03.47.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 03:47:50 -0700 (PDT)
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
Date: Mon, 18 May 2026 18:47:35 +0800
Message-ID: <20260518104735.34906-1-cppcoffee@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
+        crate::pr_warn_once!("Null pointer passed to `module_param::set_param`");
         return EINVAL.to_errno();
     }
 
-- 
2.34.1

