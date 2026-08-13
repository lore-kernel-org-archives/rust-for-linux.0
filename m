Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C98B3B4407
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786617880; cv=none; b=RjfTjzlBG82oiEt38XXC4KZmfRw5J0pL/lwfECi/3TPH9RFvInPDZrvxg6raVnzE8keij8x3IpIrWjwiOPXpCyJMqGvo02SjR5GYdf9ioNepvucsBXrZJd39tTPOl5vmrwJ+Bd4hfV2rvRcOf0i+7AMxBfdOSjZAYCuevmIvdfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786617880; c=relaxed/simple;
	bh=f620hvyXPCGL/uxNApOHGdvi/wX5f7xc6L68aofgPLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1cGCYdC2maJW5vWu6zWiIxHthZiEFG7Uyw8KMeqsUyZQ6nLbGs0cLwyntJFcrgpFItpfn0eKcXJSeYpTCzwAghvFMHMK5i9gD4sq0hSw8ts4zaDQ4DfO/GRIpn2rDBAp/jG5tH7c2jcVO1Db+ddHhNYRaeNfhOKO9TqkzAOggg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=IgxHuxCM; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="IgxHuxCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1786617874; x=1786877074;
	bh=+v9o+NRXK5CCGWPth43KlQ7r3Y+hk4xRaz/0tYZOqNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IgxHuxCMmWAV7xoey9bZVA8vnSwSYcqFn4Im6nheM0os2z9QY6FfTrK1p/0lXDNHX
	 mv/OAuQDyRI6AfrTxVCCRj2FWQd/8s4vwmb3i9ubZIEp5VMXqv3+Dl0UdvUC+yz7pU
	 YRJcbiVhCssN30Fe1DASLZHWIP1dpKm7NNo9ivLlZsONpCtB2lP/qbEYD2S5V2kzo6
	 OfEQzsopgOKvCUQBxc4Rm7Ee4WCP1EQ4/1Q414nyE4+rtowwVeTXodd4B+OfVNgwwm
	 /aGZoLGga4IIkl2tPR/BfNZmL7cIld+550Cuj+W16AHfRYHpkMemzCuCb+u0eTRBsZ
	 HAGEJtHkr+isQ==
X-Pm-Submission-Id: 4hLMRz6VQcz2SchM
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
Subject: [PATCH v4 1/3] rust: workqueue: impl Send and Sync for OwnedQueue
Date: Thu, 13 Aug 2026 13:42:04 +0300
Message-ID: <20260813-tyr-reset-impl-v4-1-b36fcd0805b2@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev>
References: <20260813-tyr-reset-impl-v4-0-b36fcd0805b2@onurozkan.dev>
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
