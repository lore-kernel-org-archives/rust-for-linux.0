Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB83E5A05
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jun 2026 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997606; cv=none; b=UvDxTCZxmt7f5PRHx0jVXyIpoU5/wO4OLwSFhHP+9IkRhHOflPyr4yQYze326lV1wgrY2mtmE7qufmHeHRqKcfv8Pk9MD9oW5n2K23F6KKyeebAUWcq+7nF+6ZigMQ0v/juIcOv+K1nNyAu0lgEAayYh94p4v9I2Aj+D6YIoWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997606; c=relaxed/simple;
	bh=k5OyUmvgzwfQoce0MXcCSkK8eKdCBFzMZYVZHbxSNss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sowc/A6iSIpfmxr9ch8gWacRb9c7PWscOT6J8pJ/dQSe1Tr6M5JLVFqN+tm5gmq8xt1lwByo0Z9Ax8ncZvGp/+d9MRBpQOM4qFcCUxLNMIQDvvljguRHwFtmzpbQgPU0bD2fiEcY3xX4NubNQ5cmLh4GS5TAN0MiECrhdrjohIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2V4xMaT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2V4xMaT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490ab3f6e55so18943225e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780997603; x=1781602403; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JSs0I7bRSPPwlvcDukxrz4wRY+Gjupfr/SkyGxTl4ww=;
        b=d2V4xMaTWUWjhTPdgqtyc2MlsRCsypYh+xX0PZDIG68pqY/DeUNgfAgzWtW7DDXnUU
         TP2GdUeduHQO1HR7nwhg6v80xMUYZ7NYOYpfuaR8ziXLAnDKDe3mhwSzwaPwTHmmA3Rm
         QBe+YRmh0D8/DjQk3B1n2tXA/rW35xhRIpDS6At2z6y4xEUYKNl61M58mjjQOFs2i7oh
         /h0fLKV0Kvk92p4dhKNm8WGl2cZhPzxODq3zjfsGwpWLRBRl4amUnFEdi1U5nNg9o5Y1
         VL9gujL/F+Q6yalcZH7A4jN4nlp4POy/O4n7HLxH/p4T7F15LdUEQ1f1knUuICz6JDHJ
         Ysdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997603; x=1781602403;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSs0I7bRSPPwlvcDukxrz4wRY+Gjupfr/SkyGxTl4ww=;
        b=N2Qglo3ZauFyuAU5voSF8h9y8YDl8SE5uBbhAiB7L0zQVJkI49F4rTK0zble54y6gd
         BCQIO93KJPA/WffS2sTDc7NrRXreSLIxAF1kZXxM48T4LB+/8Wc+voCLpf1peuL8EGeX
         JH8Q/DS7uXXZ9eticzFsbWU/EnNnOQvkUxEtjF/Fr7IM6D6mq/GXNNd3X8ExYpCdkzOf
         WRtVBfteB9yk5wUTJZxKQm3PPV4Z7fRlHYDWRbiO7+Hah3vHfaVUmp4f6wHHVPMukBga
         m7l6ya6y/oW9khbjkm/YMovD2riSz378TKcgMBQq0kTQQ17o+vj7xpqoTI45UDzui2Mc
         +pkg==
X-Forwarded-Encrypted: i=1; AFNElJ80QLPKKfmUzO9Rqre9NlwZ3ZUg7p3js2t9IErxnCdu/yZ2HzDRA6t0ZzRONX4zjdEppVVHpvFjMtngSqmLUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Ok+bVGhRNzG3mf1iou9uok89OSqjB04DWhN/iAkd02mSwUJJ
	MJ7+ZG+60EJmqYxe2XN+HuRD7u/iuDZLEEU1to+3tlKFEAfT1vuTdC0/bTz6VZTJkjlkIb9X0zc
	MHdJuZ/PmuOUoQ/6gQg==
X-Received: from wmbjh14.prod.google.com ([2002:a05:600c:a08e:b0:490:b646:6e97])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:620b:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490c25cf45bmr332471605e9.28.1780997603167;
 Tue, 09 Jun 2026 02:33:23 -0700 (PDT)
Date: Tue, 09 Jun 2026 09:33:10 +0000
In-Reply-To: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260609-binder-noderefs-spin-v2-0-eafde2ff376c@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=k5OyUmvgzwfQoce0MXcCSkK8eKdCBFzMZYVZHbxSNss=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqJ93bhYm8KNxscigH+sbifvizx8Bzr16NqAsFg
 32MBFL+l2GJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaifd2wAKCRAEWL7uWMY5
 RjTbEAC60ETOd/Wp14fHqztO1iejb9N/bi5uPvVeLDLi1/M/808GV8/cMvIXdkNaopo+l+NsZ1s
 jI1OgW54LWtLQHcmvpJmg30LXv8Mm1zNEQ86TTpIwDHTowE31w2ssYEvt9J9AB8IcA6KV5m5kNc
 t1t0KxwW8RN1rbs8r/fbAkHDdK2G+6oKmBq7269CL9/PJ2VZyODvm+tbIvyUGSdnBhtaWAe+uwZ
 oQXkgOkoRiL7InZycUxOj43rIUgkiYx4IBMzE7lQlWo0D1mfDdY9fxTWE7JWEEb91YXRRWU3gp+
 tVpdJ17bDcQ+SCijlDLQc7A4VTU7mtD9gKklToaNKhPV241b0E6/+A+lRsKQRnBxMEmaslq4H8Q
 WNrdVggzWb7ffHYvdwdQZRUPiWddYhtRGGFm1+R+1G896n577Mk9jL2sUJwcid7i5VilZAwIIeh
 rDplS4yqT8red+2es+H+t6KLV1W2js1YT/Vgr4D64rNNXnvO7FvzaLGc/inZLAHQ4lkPTk49P6j
 MdJKTHZdtgMssNEli7C7o6PfhCDyGajt3XTEBw3JaHEpL48VZKdYy8FzpQ6o9AhhCK//no4GXkE
 6d/N92xsMXBpS1KMTX13GweNLfl8nAPtrF02usCaOgY76PAN0SggGN1OqQ7DbkE41gTfYjObZhq XQPCE9BywU538fA==
X-Mailer: b4 0.14.3
Message-ID: <20260609-binder-noderefs-spin-v2-4-eafde2ff376c@google.com>
Subject: [PATCH v2 4/6] rust_binder: keep NodeDeath in NodeRefInfo during
 process cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

By keeping the NodeDeath inside the NodeRefInfo structure during process
cleanup, we avoid running its destructor under the node_refs lock. It is
still dropped shortly thereafter when the entire rbtree holding the
NodeRefInfo objects is dropped, but that occurs outside of the lock.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index a8836cb8b8cc..c8e9fd0d0472 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1375,13 +1375,11 @@ fn deferred_release(self: Arc<Self>) {
             // SAFETY: We are removing the `NodeRefInfo` from the right node.
             unsafe { info.node_ref2().node.remove_node_info(info) };
 
-            // Remove all death notifications from the nodes (that belong to a different process).
-            let death = if let Some(existing) = info.death().take() {
-                existing
-            } else {
-                continue;
-            };
-            death.set_cleared(false);
+            // Clear death notifications from the nodes (that belong to a different process).
+            // No need to remove them from `info` as we clear info below.
+            if let Some(death) = info.death().as_ref() {
+                death.set_cleared(false);
+            }
         }
 
         // Clean up freeze listeners.

-- 
2.54.0.1064.gd145956f57-goog

