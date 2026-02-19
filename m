Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978D33EAE6
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771509164; cv=none; b=SEZ1QtPa8Yr4CFggDBdCN3xiZcrJNhf1EvwBKW+sDcK45ZKKK6OphjSXv7k1PQEBwE29WSxacMhh4tguPSuJ4bI86/bv/WkqeFCGuZMoKMYl0WZ0CnMpIUD4+b95U126VIi+49JeVWjYj/Yzxw8L32kOMkOJoCIG8h0oudjNUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771509164; c=relaxed/simple;
	bh=SFMND3DEeve6tpPjD7rNtzhxS/T9UUw/nJs8W9yZZls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QmckeC/VrcUHnbut2zoXOurVHDy+siKq6k8vs9d6BmVjKzat/rBdrLLSR87WBKPHBanRG4GB+WS1HmUPxhbs1vty1J1MSmynvqqap0w313hKdOA9jf5dDGzuV6EjS68p+/3IAn+7PsHlKwkNg3qOH6rehrVT9iXF9vthB5HATDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Msc0Oc6n; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Msc0Oc6n"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-435ab907109so677041f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 05:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771509161; x=1772113961; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RWjqSlp/CcvrD7GGLBgDCctAadn05McnuJql7rDrfs=;
        b=Msc0Oc6nILfLUiY5zFTD6iEkiHeLXqFmGntK5FKbh9q4j5xrchjNS/Ljt8kCc7AqK8
         jWtIJCIUOFoIoU4PvmIIPxDk3Y4cbj02Apr8JWdQ9l7wynzee4sxSJ0SCKxPJnX3KjiG
         3SYo1wWt34qlKotd39nUQrDrQ9GCaadrj7Jy93cxBrtEtY3TOgpqMaMc0FYepR31QM2Q
         Y8a3BmDBL+ReO0NNXToI8gtQ/ZHeveqriHEkk6BwQ6znG3dX/PTYzvuODpiFyX5rx7hC
         mahVhcaSAoqctXN5azy4AUXYJrPcp2sSmTLlYm8ID8UGVZ3ptQlyl766FbzX0nZMQj5g
         xuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771509161; x=1772113961;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RWjqSlp/CcvrD7GGLBgDCctAadn05McnuJql7rDrfs=;
        b=s2qeQmgSL6EIZyZct9cw1jo3YIT/VYuy+eO4szdUfCWD5yScyMVTn+gVs4oSFrJGmN
         faxCXJpp9+TKdC89OaStGdczMQ3enFO7cajAiuC3+F7AZJ7OdblG28Xif7TcJqTiHmzu
         jpuCCEPW/Is+yYaC+vaLUelvyxWCCMX5L5Bva7e6uYx0BbNXaRjGiDYetQKnxRlE8Fh6
         p5LDbI+Vl7FuT4R49c2TckEgz63+aQDPa0bsmYlWPDeBSOVTS/0oX5f/CGImhx+xeX3f
         Ux4nrweQw4Zcts+iVFVgABfvQPfvHYWsl9esT8LLiqvOB+WdW+Gdxv/Isw180UnF+cbv
         DtVw==
X-Gm-Message-State: AOJu0YwpbFN1O32/mx+FFTqXo+6Ox9yoR2K54LYPON8zXun6weqn9qbN
	KQT3wJV1g0TFw+nPie2gldXiG7gP9B1yRFne5QoTB64R23ZnYN3XCH4WcXc97w01kWwiKgyPrKP
	savCz39JZqCEiUcyA4g==
X-Received: from wmot5.prod.google.com ([2002:a05:600c:4505:b0:479:2d82:5535])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6091:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-4839e661d1bmr49574975e9.18.1771509161001;
 Thu, 19 Feb 2026 05:52:41 -0800 (PST)
Date: Thu, 19 Feb 2026 13:52:36 +0000
In-Reply-To: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=SFMND3DEeve6tpPjD7rNtzhxS/T9UUw/nJs8W9yZZls=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBplxWkA+Ihi+Yc9Z3Fxz9v5/2YwOZ5viDpD9505
 zYQX1qhT/WJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZcVpAAKCRAEWL7uWMY5
 RhkFEACmpbY8rMAYA/fYuRbPx9LtxpK1m31BC8sOD28hpemY7FWllIIT5iZ/KKyy/9hxzXk+ouW
 iEDilT0cCZF2+qBueQp1DFggHu3P/zdNM0uhn/Pug+mvU+xFOWCT1sNMiOmRCQa0DU650IroPxb
 JqLN3uhK0VzoNy3XUgjlFu8YbQx01vOkY2CmZ+pHPc+2C4hORack6zyhDmcPYnooI+F4uZXPASW
 RVHiS9erppItcbIbY4xjUUOEdRxUrugDwgdI7E7tqPtnQ6zazWHLMGAeRJiCsszDhL9tigrgMLu
 Brho5rG/hBVSAwvYNfl2FQxLxPYKrt3hD5QCfbne2I5j9vJtH9kBKcPwS/FIgM1T8WxT71ztpG8
 3dBPOJjvXcRhtMETEQV9in3oq5vEoLJ2wEec+iRLHlKqP3rL/quT6FeB3x5twQkWBOjtDFEJTnI
 qoGsiq1pknaC3slqA1/4ll/n6iO05e8t13v1Sckj0TiUboTqCmGyFeJvaHTr/zCzb7lSNRG60i/
 lUczaUlwN5euGi2+Suoj7fTdgf/yP+TFiRdTJE8A1Kn0Rl7ldQxsr5KCPSuHScLNBuqskkJ+HEi
 kzQhENxyQlQNWkdYZezyxKWRjBOSysvROsikEVVo7SgmQsuSE/y0rMJRBV0Hmicbn5GoLh32xCz zWrBfjWe3B0R4Kw==
X-Mailer: b4 0.14.2
Message-ID: <20260219-close-fd-check-current-v1-3-fcab8d8469f5@google.com>
Subject: [PATCH 3/3] rust_binder: check current before closing fds
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

This list gets populated once the transaction is delivered to the target
process, at which point it's not touched again except in BC_FREE_BUFFER
and process exit, so if the list has been populated then this code
should not run in the context of the wrong userspace process.

However, why tempt fate? The function itself can run in the context of
both the sender and receiver, and if someone can engineer a scenario
where it runs in the sender and this list is non-empty (or future Rust
Binder changes make such a scenario possible), then that'd be a problem
because we'd be closing random unrelated fds in the wrong process.

Suggested-by: Jann Horn <jannh@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/allocation.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binder/allocation.rs
index 7f65a9c3a0e58e07a7e6d4e7d7b185f73fb1aab8..31a42738a99dd8118c21bb15635f54ddd748787e 100644
--- a/drivers/android/binder/allocation.rs
+++ b/drivers/android/binder/allocation.rs
@@ -260,6 +260,10 @@ fn drop(&mut self) {
                 }
             }
 
+            if self.process.task != kernel::current!().group_leader() {
+                // Called from wrong task, so do not free fds.
+                info.file_list.close_on_free.clear();
+            }
             for &fd in &info.file_list.close_on_free {
                 let closer = match DeferredFdCloser::new(GFP_KERNEL) {
                     Ok(closer) => closer,

-- 
2.53.0.335.g19a08e0c02-goog

