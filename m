Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E137DEBA
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Sep 2026 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427388; cv=none; b=YBD27sGL3qiZaOFPvMD5n07PdOEw5P34U/FXYO9b2addJt/D8Jv+JdmN/V7TAltYZLf8HZC/8ixwa0h/s0W4HbLpmGHqfBqmVYDUKTLTGdqWGAOMuaNnkY46kP4R9F5lrkChJnGpqzGeNj9ouLubl3TwEvepFa1uWBEq4qDNu4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427388; c=relaxed/simple;
	bh=AjTasbakC0emVDyGI93cXu30+73h1hI9fBwV3t0u2zQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p8PkadW9m5V1ZwrAT93X1bSFIFaRbVK+lcQODwCiWRpnuCuqIyOCscTtZBME+c5oa459BjEFLbVO59bCe3RmdtSsBIpU01s85jVoMIO3nUIKR5YIJY2byn4t/Qa73WQFUDRXwvis6WSwI4mpBKIeWc6b55hn49RuA8CJMqL7Fgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A7Y/7m9+; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A7Y/7m9+"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so14703835e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Sep 2026 02:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788427381; x=1789032181; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2V4M6o7aI0aIbt2wQz8c6XIdX3uY+/4vuQ30/skoPyQ=;
        b=A7Y/7m9+KVG5c0xDJaqGLNjV2utZHzBFGxTEdtz16YLOuajXxJCkxO2CC/MbaHQpxk
         nCM5qTOnEJZTIXJyh6RRPR6s4FHqSkaK+t2ohW05dlX5xQYcGQlOo6SgDQNPcDexefg4
         weKAvFVueAy1xMlHbAMXsU4Ct/iYQY2phUXA/AAIbT0Ym6Dircv8AOCuuU6P9Jrr3XOJ
         IAUMkEOGUQyItjuwMcqhStT57ls8L+DLONs40l5cLatMVQgL22DFOalp2UblCKJ23Jwf
         Le0kWtU1dVwk3TsnIA3wLXZoumaLPF6CQV5rQvijTz5eKOIR2+wMF/xyOvZpgOy9e0Wx
         +cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427381; x=1789032181;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2V4M6o7aI0aIbt2wQz8c6XIdX3uY+/4vuQ30/skoPyQ=;
        b=hZmqWF/2v9qseg5ZiaCRGxilLNhInMgLWIEWinLESmg6Pt+ToaycKO3dopSpc39qaa
         KBzl/X1WsbkTBJTWpthZaOxJnEvrF/c0ytE/NuslpAKJ0O15mUJWLlPX7sAqtLLOQDs0
         XCdepbEfYW/QXmtbOcy08RUPraNvLrMSCVYP4ItNJjNT//KDhvEF7Wi88T7j40eCwwln
         uG9G5/8X5Grz0MGnI6/Vox56K5FqwZ5TXoiCQqtxYa0DLwEQtMr2X7M3MF9VqdIePXAc
         1gdtB0baJa1wy2zGndto9NLtLMzW54FIkT4flVdOGZbP05oiVFdFhzzVNwW07JpQj3td
         G+TQ==
X-Forwarded-Encrypted: i=1; AKwUvByfsSah5SLQo0WbZvBG6Z15WHhCWRkwNIhe75KOzr0pqiWszaeRstCM5+CystMf5/arxve5KRmBA9p1EAKGwg==@vger.kernel.org
X-Gm-Message-State: AFuF++kvCRdrzw5LOjysPr6/UBZsyz7pEudF0keSbgD9WDfW/xc/Ed+3
	DFC1RcaK0Z9TrCq3p3k6t0EHZ0bgPSWhjMLpwd5Qs/2slaFwUKTDRlNWFdGK+NlllZv3Ej7dK0c
	pNVA6wWtn+lkFNwl3Xg==
X-Received: from wmsk27-n1.prod.google.com ([2002:a05:600d:849b:10b0:49c:f0fa:d2a2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470d:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49ce58363f8mr156305415e9.15.1788427380263;
 Thu, 03 Sep 2026 02:23:00 -0700 (PDT)
Date: Thu, 03 Sep 2026 09:22:52 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGs8mWoC/x3MQQqDMBBG4avIrB0Yo1Xaq4iLav7oUIhlIlYQ7
 27o8lu8d1KCKRK9ipMMuyZdY0ZVFjQt7ziD1WeTE9fKU2oeNXoY49CNZ2z8W+3DXeWaUVxoBQ/ K6dcQ9Phv++G6br3rkMRmAAAA
X-Change-Id: 20260903-binder-exit-get-work-7124b02f60e5
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=AjTasbakC0emVDyGI93cXu30+73h1hI9fBwV3t0u2zQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqmTxupemevviPsCLFMT6CcnH2LH8E8iUsrockM
 DwiA3zO+96JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCapk8bgAKCRAEWL7uWMY5
 RjCND/9vR7ChED/4hBm4q5t2TfodomhRsx4zcVQN0JneKFk9zWTaYYfNetZelolLb33thCYeP31
 4J0DE13AnCh2LOOHtQBYjaucNYf3LkmFNnMx4C1B8q59zWNNXB60B6YylC9HZeonzFPOxunZVzh
 QOCbi8kIW9uPE5z/K1t7A56na0V1fas4/IbQiyw6/WJuaVg8dO9nGKkRG7deKYkDXK8jO+693bf
 TiunYOZPhNa0qdeVkmX/x9oYwCYjKtXNDQSXMTC5vSagObVkW5oeBS6n/ldcCZSl05VV4m9LNJc
 a8Ij0jfuisQX7bDYuc/0hmBnosHzPy2FycjqBbeo+1gif1XR8izhKlmMI1QLqcosre9TmjdCqG+
 JuDgHs7DmSv4f3qaepOgFQTg1f64zzae43U37IKm2u4SWoPxWY7HcT40u0RGt8JbTQRq157YwaF
 aNk4ir+IQEZm9BycjMmBuZPl4DcK5r4WDharV1Piwgk6heNpP0laqv8ElnUr5Atbd+c2ngqH9BC
 uYu4jhlcZto4p0MaGydCv81OP6ii2k7dC0jdX2tYQkxe+j0DpsoeeG72tiKw2neIZwFj4soMVam
 5yKmgFncmm2E8O/TFXMwc/UdXprwJvZym/0yPOsPe0uXEYLlXECMrsmZQOq2GbJxNmjE48KY21O Yu7vzdxZTeTBfcA==
X-Mailer: b4 0.14.3
Message-ID: <20260903-binder-exit-get-work-v1-1-2d6129a238df@google.com>
Subject: [PATCH] rust_binder: cancel deferred work items in thread exit
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

If there are deferred work items on the thread todo list, then they are
not cleaned up in the Thread::release() method. Thus, update the code to
clean up the work items even if they are deferred.

This can happen if the thread dies while it has an active outgoing
transaction.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 18a14aa8a835..24f7b5be1b0e 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -686,6 +686,12 @@ pub(crate) fn push_return_work(&self, reply: u32) {
         self.inner.lock().push_return_work(reply);
     }
 
+    pub(crate) fn pop_work_even_if_deferred(&self) -> Option<DLArc<dyn DeliverToRead>> {
+        let mut thread_inner = self.inner.lock();
+        thread_inner.process_work_list = true;
+        thread_inner.pop_work()
+    }
+
     fn translate_object(
         &self,
         obj_index: usize,
@@ -1678,7 +1684,7 @@ pub(crate) fn release(self: &Arc<Self>) {
         self.unwind_transaction_stack();
 
         // Cancel all pending work items.
-        while let Ok(Some(work)) = self.get_work_local(false) {
+        while let Some(work) = self.pop_work_even_if_deferred() {
             work.into_arc().cancel();
         }
     }

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260903-binder-exit-get-work-7124b02f60e5

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

