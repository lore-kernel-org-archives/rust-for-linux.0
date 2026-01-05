Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1B2F60B2
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616964; cv=none; b=A776Xu+6hZD/XfoQseC+LPHO3aXHgVcFJ0GiKhgjGolqp8plkP8fdSgCqT16AOMfrWTrdet2J7n0S2Fkut3Qf2K1gWzzckChIvgeuUlfifcspdw1ow3gMqbak7RqEeNusllc2oemrcoQsK34iRYG289W5nx7bvFgT1yuvrBg1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616964; c=relaxed/simple;
	bh=fX/OT0KxuelAn17AD+WlXN9/UYO4upe54GYZ5Z3XllM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VYp3/My+RuN/c0PuA1+G7/F38NFtud1CaLjL2t1rSThSYt2NuatTInOxvd/aepOG1x0BZYQj9yW0fiprKB38BPFKRg2gGbBRk9Tcq82+/lynl+acGO4hHi6dzm88/sMG4Otx+4dHemy7AGDkCvpT+K99HCufxtgpADbXa2znPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lscsIxXT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lscsIxXT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so113690575e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616960; x=1768221760; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RbMFsQgSUSIjgvkNgaycX/4+fNinqYCFCELf3lScW4s=;
        b=lscsIxXT0ETdg3MoGaUe5PRqSlfhepZcoLQtkBsIguO3QxFJV1b/VL9LVB62MF9opQ
         IHlFO4oqF2JOsj7W5onHLD6jHqbvad9op+jX2qHl3e/aJptm9x2D/AENvPjESza0wOGs
         Sk09EGkITKpcLLzvB9/iDbws05yRnbsnJNQucVdZEhing+YimNNgZB4kvF688wve1iiQ
         qn57cXBgk4NNpQTFREpI/zLhdmDkf/8UXpkPb7BpfQWXQsQL/fomUIRllTk48c0jI7/B
         ocb55cFf3+RUcuH9loVFrNiTCAdo9SOjtKnFEsqQ24JMLvmVlNdz2JBcfiFK/f159JKf
         01hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616960; x=1768221760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbMFsQgSUSIjgvkNgaycX/4+fNinqYCFCELf3lScW4s=;
        b=omGLovpdexpA3/9gE2yEmeCcWUu+Xp8aGilOvwRN2oSrwG9WwtqOuzQ/mZX9m5vxou
         8rAVYvRVw9vIRszqwd556rJjggK+WLiiyV4gz2m5md1TZzCQMRJ55N2XGR9CKW3N/3Ar
         kC0x1Zkgh92/CL9rzgPMaW0vy98QHXxnU36M2PkpHDtNgywywVvgKJCHM4mIdPTRYPnZ
         ymdBAN1qQBKHMUYC1xn3kJrKUR/U62nWDrW3o9xfBYaLXL2hDpIjsPMFKFnuY3zBkL3b
         v8a93f42iEDy2JbYbq+XsGAP7JBn95zMpt2EIcqRkKUSZnESm/Q1HLeXFr5jVlV13Vap
         yBMg==
X-Gm-Message-State: AOJu0YxaEjjogtllQe+xGY229m29OA/E0K/CAuhWotzryusAtMDO1Qzt
	SJTaF3m5lrXgx0YKPgSGgm65DFcJSt+GsOrmhnMpbhcTD/nF90PVxuw029bXrxRiF1Ql4yG6LMJ
	zbQ/u1lM3uOdx8rokDMuMiEaEP+tYDuZkheovUBxgnGJfD+jNqV/TYhafIL1ZlmUKPr2IjFBYRp
	UMEg+KrExSCVqVjDSG/Ah5+I3pVaPGGIQW7BcWjEKkHr6pTGEw8PrH1xVGMsMCqOA=
X-Google-Smtp-Source: AGHT+IGktPiwFvgH1mnMtaCch19Lhxi+eYi3QiApL99Z1yDMvwMh6qS0NxBX1UmJ57xnrTjJDJIzrCCYokygNHI=
X-Received: from wmph40.prod.google.com ([2002:a05:600c:49a8:b0:47a:814a:e0cf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3111:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-47d195aa79cmr582265855e9.34.1767616960192;
 Mon, 05 Jan 2026 04:42:40 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:14 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fX/OT0KxuelAn17AD+WlXN9/UYO4upe54GYZ5Z3XllM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G6wOg3FmQFbJWbgjDOFvqnSZe5HS89RUBaz
 Uhj3ohAOiuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxugAKCRAEWL7uWMY5
 Rm1uD/4v+mwSprx/IE+vzGmCmE4aVtnCvwfJj4U7vX8PPq8pd0L0tmKMzWMYE8+QSFXaE5pp9gW
 DKBZO0nYq9qwZlvu27OaEAKRXWAfa0J6/EPgNT6L8VXsK0erlm9czSH3/XsrjRN1jmMHJ1IQaMJ
 iYsQw5/rziEqLjNCRmQh2uVgnZ6ho6iplitrAbyg59ODrIomWI3kueFQGhTbgc+cDj4whJGCQW5
 gYVvJN4CwOq5hUT0Rws70/vz39RvD9laykeqiSFZEN7wtvwoEk7Wy0NAmdbpmW/GeQQBpXNgTCW
 6qHZYJYBec2SUbLmaWmlnTBKFOtG8cSdXBREGAV21zDPcobMJzUhrqgBc3RKMlrnVg6W0JdxeS7
 KljgHa7z5zkEfmojKOvC+uBwXWB0sVq2zUkIXw4FnW9+CVP+0OohwrEsHK978dw+jFW811iUkKq
 g3zKZqa5hn4LfmC4gw40KTsFcPPar0Vf+eqCMkIGVzJw+a7MScA6Mei9c5VrZ+rk2AB/rBQSM8x
 cDSsp1gN+wyPm6eXiUWMXTUJoaa8V15HDgdGIttr5lhwMFkgIGE02VZuwKUP50WsA0GAQJvXfHk
 h5UxZbfuEvJHpV219YrlXfDQYfSW1BbbFdavyrUCnxx7CCKX0hJ1HzC+lSV/BbKeVqeoS6IOAN+ U6SEV5mUEU5WpMQ==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-1-51da5f454a67@google.com>
Subject: [PATCH v2 01/27] rust: barrier: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Elle Rhumsaa <elle@weathered-steel.dev>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Elle Rhumsaa <elle@weathered-steel.dev>
---
 rust/helpers/barrier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
index cdf28ce8e5116728c97e24893cf12ef41578d3ac..fed8853745c83639c32f79335e40b9494db11e98 100644
--- a/rust/helpers/barrier.c
+++ b/rust/helpers/barrier.c
@@ -2,17 +2,17 @@
 
 #include <asm/barrier.h>
 
-void rust_helper_smp_mb(void)
+__rust_helper void rust_helper_smp_mb(void)
 {
 	smp_mb();
 }
 
-void rust_helper_smp_wmb(void)
+__rust_helper void rust_helper_smp_wmb(void)
 {
 	smp_wmb();
 }
 
-void rust_helper_smp_rmb(void)
+__rust_helper void rust_helper_smp_rmb(void)
 {
 	smp_rmb();
 }

-- 
2.52.0.351.gbe84eed79e-goog

