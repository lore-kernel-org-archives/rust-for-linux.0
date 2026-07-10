Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944913EA942;
	Fri, 10 Jul 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693980; cv=none; b=fD5HQ/MKahe3OECQ1SGVLlnm7bTdJisOVpRKumYZ8KsuQeJuWt/FZXjughzkiiOafnw7CY3AgUeAndm+G7ZDlOtLdFjkNTLDu3TIXtt58nn3IsJyQPOKCIvVtEoJ6Z1aD1B61e3soysSHnWyW14r7WZzOwv4iAwkh6UJCi8nPBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693980; c=relaxed/simple;
	bh=effmvfGipEJw1CXAf4grDO/yAXKLh8tQceitLcPyakk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2P199qxyKaM1PKptXTwp64lZxYkn7q/tERoKy07F5D2l+Iz4ZeXx28b9w1TQYIyHWOHe8lboIf8Lq9eAYWcymqvfaIMHm8+PRdrgh6v0xfBanE2Wj3+W+dDuxrcaQnFh67nkZ/XSJJy8Ji+PfDCm6P8kfEvEurdemRzQC8GS0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SD/tjYL7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SD/tjYL7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C35CC2BCFF;
	Fri, 10 Jul 2026 14:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783693980;
	bh=effmvfGipEJw1CXAf4grDO/yAXKLh8tQceitLcPyakk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SD/tjYL7bKXucE1nupqaHbg70saluv5ivUWXv3Wwwe5LEKVEoWapHkVm9lRtjtZhb
	 UGlOJxWWwQgcbpFjJZSjsPyii+xb0Eigj5FdzWSFKRlE3Qudpz30uCYDDgGUKRDxEz
	 uk9xi8KaRSPHoIchXEsm91v+AkvS+iYy+ADrF6qM8G+n8vdhYo9/nWzISyNo6D1fza
	 1ACwF/ZEvEVxycd3Ys0r9QFx/3IAFPmTLnqEFbLIsOSH6iq14FlIsdZI+JXQYEw+Jz
	 sOxc+Pug/aEK54bmbwcVIzrtjWPc5waD9jjWEoZsEppASa81UBrZIUvaadVclD3JVk
	 Y2sGoOL67PecA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6AAC44508;
	Fri, 10 Jul 2026 14:32:59 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 10 Jul 2026 14:32:57 +0000
Subject: [PATCH v2 6/7] rust_binder: Implement
 BINDER_DEBUG_DEATH_NOTIFICATION
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rust_binder_debug_mask-v2-6-2846410e3ae6@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
In-Reply-To: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Jahnavi MN <jahnavimn@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783693978; l=2594;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=AtOGqyV47uTWj1HVWVVsjmE5n4vxfurKNFw6THldUO8=;
 b=giAJSkYT/xgVZhtrblO4c1b6WXZ/zQU3csQ6ylYRFzxOWxxBs0k3YU8KSXXqFRfgr7W/n4YMm
 JzBLJqZZKPMCX/qwuxtYR2L6nYUaS6SgSuw+cme9kvK3Z9/+B6yPSLo
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs for:
- Memory allocation (OOM) failures when requesting
  death notifications
- Registration and cancellation lifecycle events
  (BC_REQUEST / BC_CLEAR)
- Delivery of death notification events to userspace
  (BR_DEAD_BINDER)

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/node.rs    |  5 +++++
 drivers/android/binder/process.rs | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/android/binder/node.rs b/drivers/android/binder/node.rs
index dfad3697f672..898412cfddd9 100644
--- a/drivers/android/binder/node.rs
+++ b/drivers/android/binder/node.rs
@@ -1113,6 +1113,11 @@ fn do_work(
             // We're still holding the inner lock, so it cannot be aborted while we insert it into
             // the delivered list.
             process_inner.death_delivered(self.clone());
+            binder_debug!(
+                DeathNotification,
+                "sending death notification, cookie {:016x}",
+                cookie
+            );
             BR_DEAD_BINDER
         };
 
diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index db2b0230d19f..b1f1207ee868 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1267,6 +1267,10 @@ pub(crate) fn request_death(
         // Queue BR_ERROR if we can't allocate memory for the death notification.
         let death = UniqueArc::new_uninit(GFP_KERNEL).inspect_err(|_| {
             thread.push_return_work(BR_ERROR);
+            binder_debug!(
+                DeathNotification,
+                "BC_REQUEST_DEATH_NOTIFICATION failed due to memory allocation failure"
+            );
         })?;
         let mut refs = self.node_refs.lock();
         let Some(info) = refs.by_handle.get_mut(&handle) else {
@@ -1310,6 +1314,11 @@ pub(crate) fn request_death(
                 info.node_ref().node.add_death(death, &mut owner_inner);
             }
         }
+        binder_debug!(
+            DeathNotification,
+            "BC_REQUEST_DEATH_NOTIFICATION handle {handle} cookie {:016x}",
+            cookie
+        );
         Ok(())
     }
 
@@ -1353,6 +1362,11 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
             }
         }
 
+        binder_debug!(
+            DeathNotification,
+            "BC_CLEAR_DEATH_NOTIFICATION handle {handle} cookie {:016x}",
+            cookie
+        );
         Ok(())
     }
 

-- 
2.55.0.795.g602f6c329a-goog


