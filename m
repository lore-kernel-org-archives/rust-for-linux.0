Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A0417378;
	Fri,  3 Jul 2026 15:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092566; cv=none; b=tEw8ds9IVso4itXQIXP6sqLfEu3G+B2h+T4jKvLjEZfsdLSK+2F7b80xQJy1KhFNHZM/lMeXC1E8jaXowKXgF2ix1rnAkLN1Wi2LI/ESRmI9SZk1iZdpJQ9bI9M532kcfH10nyzWHTN36v/zUXeG4IaTEkpGisFw3PrTWBI25Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092566; c=relaxed/simple;
	bh=wdusuwS946XJ1XLBLnF76l89oTCPPr8gjySYIcU7YtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=esIwK+titcIacBWXcArSeO+kt/sbSmAuFixAuJIuFPUfc5p6QrpeoSdlI9d31MKRemWfOodOOIIw7ZW3NPpFODxfJV6Xp9qlovWsRW3qx4OplMHGPrZ/zqP2dVldUvIxjz6y7jVKtt9JdPpUHMZncGTGpKrYgSIIJGa15IbuVUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsUynZlG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsUynZlG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3D51C4AF18;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783092565;
	bh=wdusuwS946XJ1XLBLnF76l89oTCPPr8gjySYIcU7YtM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DsUynZlGNohoO6ifrqIrIsNaiOkersOrVBqHKIBhxWPzETOxg5z/7gDdKnibha+sf
	 pCh2zp9SNFI3dHDdQEopiIgILZxBJHOJAwDqa8kLQZzJCZrr2bmuMU76Eay+fz1yjb
	 JBW8inuCvavdvlBUmByKI5UWF2n84WpIitdYKV3AlwMpqVQOnYp+PAQOrRgQcV/SNn
	 WCdENCyio8ZgAQBIeRkVUVpIStFK9mGTcRyN4i3M6j7pBCy6ZQKPjQDBADN3ICWirB
	 zpAp5WczpcUR31GZC4oh3XsA19HPcJUWsfwcwNAsiPXISqd18SduhicpZr+RsJYilg
	 pcYpOjPS4lenQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF31C43602;
	Fri,  3 Jul 2026 15:29:25 +0000 (UTC)
From: Jahnavi MN via B4 Relay <devnull+jahnavimn.google.com@kernel.org>
Date: Fri, 03 Jul 2026 15:29:27 +0000
Subject: [PATCH 6/7] rust_binder: Implement BINDER_DEBUG_FAILED_TRANSACTION
 logging for death notification allocation failures
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rust_binder_debug_mask-v1-6-9bdf12b5325c@google.com>
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
In-Reply-To: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783092563; l=1150;
 i=jahnavimn@google.com; s=20260702; h=from:subject:message-id;
 bh=pN1rgHesVhztljUkcVdGtMP5EXBjpUqDWIIh6dRhEyo=;
 b=1CbHGorrLuhNkfnl/SCiLISTOnU/UdNXrZjmx50pgY+1/xuxBYVFuGjkwAWjx+cPWnXtXLUGy
 qxb4rqivUJNAxKBT2g7P2SkXVCg8rzwRm06AagR0aCh0cV9QFHTQXmD
X-Developer-Key: i=jahnavimn@google.com; a=ed25519;
 pk=9aLfw3FepTOJwTS7jRXm7pDH87eBeZMXBPrqwU0//RE=
X-Endpoint-Received: by B4 Relay for jahnavimn@google.com/20260702 with
 auth_id=849
X-Original-From: Jahnavi MN <jahnavimn@google.com>
Reply-To: jahnavimn@google.com

From: Jahnavi MN <jahnavimn@google.com>

This adds dynamic debug logs for:
- Memory allocation failures when registering process death
  notifications due to out-of-memory (OOM) conditions.

Signed-off-by: Jahnavi MN <jahnavimn@google.com>
---
 drivers/android/binder/process.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index db929cc35585..4c200d3d5604 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1238,6 +1238,11 @@ pub(crate) fn request_death(
         // Queue BR_ERROR if we can't allocate memory for the death notification.
         let death = UniqueArc::new_uninit(GFP_KERNEL).inspect_err(|_| {
             thread.push_return_work(BR_ERROR);
+            binder_debug!(
+                crate::debug::BINDER_DEBUG_FAILED_TRANSACTION,
+                "process {} BC_REQUEST_DEATH_NOTIFICATION failed",
+                self.pid_in_current_ns()
+            );
         })?;
         let mut refs = self.node_refs.lock();
         let Some(info) = refs.by_handle.get_mut(&handle) else {

-- 
2.55.0.rc0.799.gd6f94ed593-goog


