Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB6E3E450B
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527027; cv=none; b=UIFG0EvLUqDZkKPXOAV0DoY0X53hSAq6kM/fC9ummvBRlzJou+rFohcjftdWor60lQmHSpWsVnxqLuBcIfKUbqbUcGQCcLn6G2mSzd1FKFLHkKL0cEtLxHlI+ADjxVAhida0vR0ZJwdDHIsaY0P9yxWmX6kEP6Xs9JPPTZaQww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527027; c=relaxed/simple;
	bh=vM/iNk5W69R92EN+aOfrAxpd8hJQ6DTURkdFhdbVE0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gxVQsruJlXd7l0aiLDD8yV8UVUZpzk1cXcLugEoGyVCFkOMsVvkPlh4ndLZ2S8Ito5PsoWM/Lrw2yuqzliJzhmPJLaEhJProf9KXo3rnPU4EWcSGYl6CO2kbaFlKBvFGZKmtm5wgrbI90L/j/A7OFxaodbICZAHCM/SgSUv2Vuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C3xQX89i; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C3xQX89i"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b2f22ea2so28986845e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Jun 2026 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527022; x=1782131822; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVsllswKyB/MpNirpjMlS3W3kzWpJKS+CbEIJ9K0B14=;
        b=C3xQX89iDLyVZ0Eef0T23jvXH99S7pm0phK1Is/Ib6DkJYIBYPhhgOy/z5zk00asvo
         iVqbJZCr9grcVy8iLilJKl6HY71TmAAkdy7+TVhnV0T2L5syzE8ayVsK7EB6wlVA0nVT
         8BayBh9szNrIMW1JWBcfaKjUTGtCBew7qvIAUS6IxGFGc44kRnvEaClFpZEbzYU8cMIP
         YTTCiTTZtTKuHwJ0RiAYnqoMoIW3KZjz91GyM0QPU2ps1iaiWPCZqY36/i60E4zRXd8R
         vT5LvqSC9VvPwH4PyLaMjZUubOccn077u7L7igDc+IIf835b07Rw7qB58lIb2OQ1dm6s
         OPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527022; x=1782131822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVsllswKyB/MpNirpjMlS3W3kzWpJKS+CbEIJ9K0B14=;
        b=IL+rWDKOXnIw4t6ZqDeGyLwyqzvk+0OQMzfg52LqrtxzklEU0tDtDqyQl/Nf4PjJVF
         w4izSr1eGSWEqeROff4WLH49m1o1uwa6c8gJv718uIz4MhVm8/IBXb0rlKFwP4fvswJi
         E+l6PuttvMXdwN3RGPz7qRMUbAbtkmPGSZ6j++olvVD32lJlAwUy0J315ronMimNQ2UN
         ZbFtS5v/xpqnARLm0z63t7OdLzhfucebCDMvZiq3JTcZABs9PhiJ4RU1QHkYBDd1Gli9
         Pqd2sqK6slSYp8Tol7BgKpZiw2jUrhbwJ7l3bJn5/ZACvQAc+BNEyoZjRzG/hfvE761y
         c1Uw==
X-Forwarded-Encrypted: i=1; AFNElJ8YbpoLwWLQYXfolhgwzL+INSdlW7CzbEKihOiB3pZ+DQbT7e329Q0qdFKyF56D3s3p3ugAUT2e9UK7srjmSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwNNa4AI+D3fMUY4k0OV0+HDIzj2ezGQ/Yj4MxBsolDeZt3jiy
	0vUYCJ/I64/wVQ+ELU+ToeNLUARJWTXp43GV+tgaxewEia6oHXmhY51Kgm+sPEL+6FtXuCeC9kv
	CW752Zj9Ibc5gfPJxXA==
X-Received: from wmbc22.prod.google.com ([2002:a7b:c016:0:b0:491:41a:40d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f18:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-492200dc927mr130901295e9.21.1781527021395;
 Mon, 15 Jun 2026 05:37:01 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:36:44 +0000
In-Reply-To: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615-binder-noderefs-spin-v3-0-3235f5a3e0a0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vM/iNk5W69R92EN+aOfrAxpd8hJQ6DTURkdFhdbVE0s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqL/Hlmd9oHM7e1cGIOeotnIe9rsRqd4kIxeRM0
 8H/aTqGQyqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCai/x5QAKCRAEWL7uWMY5
 RmGVEACBDSSmpAqdH1VJW8Kac/7bzxygFM49675I1Rt0xo05rD9+8EdYGaa3n1wMa8mgymRr02V
 yE+r8Q7EguKPtFeflxM/xESnYWtElaUlyRPT6w0h1gofLNRi6JcpkA4EV6NmwxMfALeFIGOYYoM
 UiIujkWUHg4xWCVrJhem6zksrkEBMYhdT+D8MJWLM56aORp8l33qko5tbiFSnwaswyEDNVkNVZB
 izefx+U6rXsWX+exRU2ux2ihGfG/pSP5z6b+nSrlLrTzGtFt+Bput+HcIUhwxk65P77Re/bvXYA
 4gf+6xBS0InLHdElTV4QkSpidqc7orP9Y26lHArKGOE0Sp3RV8PcLANCFD1vHIxJaL+NWCHREo1
 pkgMjL7KqnZYaZ0sdKxzV413h6KdQjPdH4oWhQDrEN8VlWj19nEChLzQdRCOVRE6E2vqXzgoJ10
 KMAOONUc0moQVLWaN7Px9ogy/+zvNxSMamXPc14G8ze2rXW8gQQX7R3FvbmMhpWyg7KmtZmVhzP
 7HNHREMMMTyfBXFExZyXA6KgSnFRMS80Ma9CfFZf9kgq5MvJLMb7/C8fCqVnH6Erh23jddxt0WH
 0+mNtx4Z20F4Gc+n43JhbPAYHJ1s8jr/aBqpr7c/+QKQaEqE4Guabh4mczrg3u1h7uvTSLQ79x/ KPyez5tWMEKvNgg==
X-Mailer: b4 0.14.3
Message-ID: <20260615-binder-noderefs-spin-v3-4-3235f5a3e0a0@google.com>
Subject: [PATCH v3 4/6] rust_binder: keep NodeDeath in NodeRefInfo during
 process cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

By keeping the NodeDeath inside the NodeRefInfo structure during process
cleanup, we avoid running its destructor under the node_refs lock. It is
still dropped shortly thereafter when the entire rbtree holding the
NodeRefInfo objects is dropped, but that occurs outside of the lock.

Reviewed-by: Matthew Maurer <mmaurer@google.com>
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
2.54.0.1136.gdb2ca164c4-goog

