Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF6C463B8E
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Oct 2026 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193671; cv=none; b=MZXT0OYdrkq/oqRWkd+JrDCqbr4pnaEwssJy/TK23ZC9sWqs4xEAPPOcz4K7+2hftcBGFefttb9eWrhbExOvNzk0g2v4f1atTiQpr4B2FTwPH8Pjlw9QMuKwsr18FVYpPrnSUcteWIfZ+GQs7MBiQR3wAi5PrYL8fSMF8ez+Uh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193671; c=relaxed/simple;
	bh=C/HalkpVc/aaLPRcuY8K3fmDX5xNBnpE2HlADon4V+4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NVErDepS6SL5uQGH/uElGR9Isj27daC8yhhkpHdJ9nUtKga+8y5GVshOOqDEXAIW0trnpkQLb9AXjMtBFwhAE+Oi2mfkNy/rkbQxHeGKryMEuK/y5mfypsVOgFXPfp7PiFl5GvCVvOcJbYCHEJY+TAV2euAWGEwW1EcG0lTEjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SBf94Xq3; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SBf94Xq3"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c415561aaso1005103f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Oct 2026 02:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791193664; x=1791798464; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbsBB7teGYK9VKfbxNuqfeRouM1sExnVepBnTLGc54E=;
        b=SBf94Xq3RDkh/2auYXT3fbWcadjJC6vDOa82FcbqK9VBd85xGBwwdDVJ26VbHZu1hD
         cAveRO9FJMVjUISgtHFrJivbhF3N2KGmnKsdTquGdLbzF8pwAdTRmFpBvQYUh1Q/5eVP
         18jFn7cK3O5Y4v5xdXUwndbVAcZb7E1Uglx9jYCVVZV624uf5XHs7oQlcPgsqHkbbf/a
         UjenayaNSCfLX56ZJuSQLMu90o2c2gZJdvQjgpMfMF7D4gj0RD7d/R7o8eUYlxjxWHVH
         hEaxFQVMeY+I8S1iyPiPZmRZu6+qZYwo6Qnl/mGLpzRQ5UDcGuLBiEK3ZG0OTJmCTGtQ
         29nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193664; x=1791798464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbsBB7teGYK9VKfbxNuqfeRouM1sExnVepBnTLGc54E=;
        b=DUAcgn1nbKVCPqhQontGYgwi3wfy11ermDdR3EcJi1BOQZgnvp0QA3HxAXoQXXV67o
         I424kX6P24OJjAvd6qv1IvMof3MmSWx/32WiW+IT/2/rtdI+Ue48y13nulXedV12JQFM
         VM28f4FwWghAB3wp9f5bkGT9HipGyelGu+A/QoIXp9LrwaHTyS7QKBqg1+9cMtr4pHpM
         1IrKJd9aRa30T/+r1vwegDpeVnIhJvYbTjIISIc80tvZQmN+46xd9mcqhYU5mxIRMB+m
         bS7KNeCvZLlmdDC4nK1WM8OI7T0JD/s2rU81Evd2mhG63PcvWQHbcxp/4324Z0cswwPE
         WNZw==
X-Forwarded-Encrypted: i=1; AKwUvBwAjVhQMdvTDn7W/peQgBEMGUs744/2yzfYJuMr1puT93Rpwepqa3MzhYwQ6vXHYp6Ss9ozTIDDQpG9sWRRUA==@vger.kernel.org
X-Gm-Message-State: AFuF++mmHWjwxka0LeqAQCJbPpZz86Vzc/ea9lJ8Riyh8Hr/aW1vyLcY
	YSwSCWWuHitaHUHHT2iSs7v35B0W4K2OcsEiLTRbGLrXNL+HXV6GP2hFH55U4pjWiruB1o08b/Z
	3jmJVjyVi5LVpY051Zw==
X-Received: from wmpl19.prod.google.com ([2002:a05:600c:893:b0:4a1:6fa9:2d03])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6215:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a027564c86mr168001755e9.19.1791193663635;
 Mon, 05 Oct 2026 02:47:43 -0700 (PDT)
Date: Mon, 05 Oct 2026 09:47:27 +0000
In-Reply-To: <20261005-devres-6-18-backport-v1-0-06dcf0e592d5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005-devres-6-18-backport-v1-0-06dcf0e592d5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/W9/p/qUlI7c+Vp8Q94K4vcY+BU6ZQPqrD1mg6wzcFI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqw3I6RxE3WbmZPE+KA8VBS08Df1RqphB6A+wPj
 scmipIk34iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasNyOgAKCRAEWL7uWMY5
 RkT2D/4lM2bD7ln830RsI8zOjVjIR67yUnU1DOiP9PrXWtmyiLUgjij5MZRBRIFuxJ9MaXwC747
 mV7kskmGyj9uvZFKnJvyzRUYg4t/1zG45ODmg1PwVqaAHElsUhsSqC/vhurzgOE3P7k/UdqHRB1
 5xuLtTCsYG2ZM9fhMNXCcpHnySjRrAHLuv16C7LfEG9tULS6gRbxa77D+znu8NeBYFdofyrWMkZ
 wIOv6cCyulWeWtOY8ptqMLgxI/lmevH+lQyE7vlEUW4cutcS5Xg0geBO9p1u9ifKkk+SP39gu7m
 dVJG/yw5yYWS3tC2NeCBGalAafbmhlcqwLn5eEQNm0E23dbMfp+1hoi+spu0AeZSF4IDmeUaQla
 OnI5/sxYs342CQgdxiq8IlQZTMDnkrXjkXc9Tylyl7kh1pjyeX8cRPCl4usrCHbmDaA943Qp6ZE
 PYRmxGGBI1RKy817zvidz9/AuaUfBLLIFAnuUB1/hQWI6lWLt4cq9yoP6BmUu126iNH8nAYSGtX
 F7w44ofCMUPStjRl0gggtKU3fBe3NY4mtT6+pSOVR7Z+/v03P7ObrTDZs9q0KOW83F5a84QZS0f
 81CirftdX1+uJMqIe4Kd9EUMxel7HntoeH+Jofo+eVsZqNOeFcc2r5gMQZlQnRFK6t5tjw5W0Y9 j7QQ147Cn4UOvcw==
X-Mailer: b4 0.14.3
Message-ID: <20261005-devres-6-18-backport-v1-2-06dcf0e592d5@google.com>
Subject: [PATCH 6.18.y 2/5] rust: devres: add 'static bound to Devres<T>
From: Alice Ryhl <aliceryhl@google.com>
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, Markus Probst <markus.probst@posteo.de>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Danilo Krummrich <dakr@kernel.org>

commit 016267b521b18529c977c9eca9597a1669c3d73c upstream.

Devres::new() registers a callback with the C devres subsystem via
devres_node_add(). If the Devres is leaked (e.g. via
core::mem::forget(), which is safe), its Drop impl never runs, and the
devres release callback will revoke the inner Revocable on device
unbind, which drops T in place. If T contains non-'static references,
those may be dangling by that point.

Add a 'static bound to prevent storing types with borrowed data in
Devres.

Fixes: 76c01ded724b ("rust: add devres abstraction")
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://patch.msgid.link/20260526000447.350558-1-dakr@kernel.org
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/devres.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 562dd54fbe43..0fea4f2844a5 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -97,7 +97,7 @@
 /// # Ok(())
 /// # }
 /// ```
-pub struct Devres<T: Send> {
+pub struct Devres<T: Send + 'static> {
     dev: ARef<Device>,
     /// Pointer to [`Self::devres_callback`].
     ///
@@ -107,7 +107,7 @@ pub struct Devres<T: Send> {
     data: Arc<Revocable<T>>,
 }
 
-impl<T: Send> Devres<T> {
+impl<T: Send + 'static> Devres<T> {
     /// Creates a new [`Devres`] instance of the given `data`.
     ///
     /// The `data` encapsulated within the returned `Devres` instance' `data` will be
@@ -236,7 +236,7 @@ unsafe impl<T: Send> Send for Devres<T> {}
 // SAFETY: `Devres` can be shared with any task, if `T: Sync`.
 unsafe impl<T: Send + Sync> Sync for Devres<T> {}
 
-impl<T: Send> Drop for Devres<T> {
+impl<T: Send + 'static> Drop for Devres<T> {
     fn drop(&mut self) {
         // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
         // anymore, hence it is safe not to wait for the grace period to finish.

-- 
2.56.0.360.g66cac248cb-goog

