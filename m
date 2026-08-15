Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24A33DDB02
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 10:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786789542; cv=none; b=lmg4++7YovLJTt37k73bsEOLT9+g+6VFKeGBTIXIiaBmQ9TDvcLrSNxX2PNgZMGyxT+O6FSVJjY1tmISsB7VOFgsj6l4tZseyTF6CoHHtoRV++UMeWzKrLQR+/S6l2Uruv2EDb8z8eo36uLsuZB2Gmf5dlmDTB7Cc2nbGOb406s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786789542; c=relaxed/simple;
	bh=f620hvyXPCGL/uxNApOHGdvi/wX5f7xc6L68aofgPLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJJD33SqcMWodEFbPRGnrdRxxJhlzZO8dlpm9/HWGlKPV04q3mRjr1LUUAroVJWNSz3Z+4MTba4829R26woRYfQU+kZv6R1kYrtbkQoxCfT/BBVXbFJN+7VicL5cMWMUtgZ9CaLr/vbj3BYKEh8Zrvl8qKVimzfpSgDE8X+XqNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=YoVENFNM; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="YoVENFNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786789528; x=1787048728;
	bh=+v9o+NRXK5CCGWPth43KlQ7r3Y+hk4xRaz/0tYZOqNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YoVENFNM/6GiXMCKoKVf/e8x5o4OFa0+8WpY0bLj3FsNsFUNuD+0yNZEj+ikg//Ep
	 d7h8CycnaDLbGDi3JkH+NAw97lLbkfliYBkk2xmlZOQwMMJg5/b7kADUOY5jh/K4ua
	 kXI9fFsztOAEAQAzEOtDwa8IMkxXIRk/D+WXTWHRmNM0zVEkVLRR9+I7MRlmJkdY/V
	 6yuHLyV+oBbQZBkcs7NYpzDXMqAg7W7N6XJlv0fyERJ+zND1GvOFI3yuVfLBs6vKac
	 GLUhuPYXoDnGIfuU699Ad0NIXoTAOK6+hlMr+cpp7PXZy/PHvLDHBhUcFP+T0ZOSoQ
	 gDiW2L+/yNcBA==
X-Pm-Submission-Id: 4hMZwx5vMnz2SchQ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v4 1/4] rust: workqueue: impl Send and Sync for OwnedQueue
Date: Sat, 15 Aug 2026 13:23:57 +0300
Message-ID: <20260815-tyr-reset-impl-v4-1-578df9a5e576@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260815-tyr-reset-impl-v4-0-578df9a5e576@onurozkan.dev>
References: <20260815-tyr-reset-impl-v4-0-578df9a5e576@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Allows OwnedQueue to be used across thread boundaries which is needed
from the tyr reset implementation.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/workqueue/mod.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 933032fc4a85..d766cd9b9175 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -383,6 +383,14 @@ pub struct OwnedQueue {
     queue: NonNull<Queue>,
 }
 
+// SAFETY: `OwnedQueue` has exclusive ownership of the workqueue and accesses to workqueues
+// are thread safe as documented by the `Send` implementation for `Queue`.
+unsafe impl Send for OwnedQueue {}
+
+// SAFETY: Shared access to an `OwnedQueue` only provides shared access to its `Queue` which
+// is thread safe as documented by the `Sync` implementation for `Queue`.
+unsafe impl Sync for OwnedQueue {}
+
 impl Deref for OwnedQueue {
     type Target = Queue;
     fn deref(&self) -> &Queue {

-- 
2.51.2
