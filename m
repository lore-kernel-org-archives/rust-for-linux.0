Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4731715F;
	Mon, 13 Apr 2026 22:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119552; cv=pass; b=ubuyRN2heACWPHa2feMK9pE7Rwk81ujwqMiGIuv7NMJ7gIgxRzGuWZw7LyXKMPpulEwia4O1cKxSogzwJf22S4bBFEpGLtcBTyFnwNOEC21BBihvsqJHQp8D4c8zaBFnKd59c9x5F6ObSNxN3ioQXPOKWmhdpptIo27XWPQxueQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119552; c=relaxed/simple;
	bh=TJYiaR6HkYI0Jih2JmM5qi5Sd5bcOQQAYqWwO1EUFlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2cMq2T2mcXumDwWYbNtIl88JWdPOqjuhbtNdntFnuqLZ3mJn0ONizAmYhcJeewyhA6Ell48jrQa0AjrUAxNHlBbcAZDaivJULtZT8LaELk38Zo+qPtBwX40379nbJEKYthgJY+D3B0Tn4uHZohY7SAUtyz+slVmfNuV2Soxicc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=DN3pCSkf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="DN3pCSkf"
ARC-Seal: i=1; a=rsa-sha256; t=1776119517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VxVTjTfY030H4mEJBYWp/BxzRxH8BEt2Pa/BGXTzLKBWe+L+3el2f8+7w7tuNEngO2MeOL15VDkp46h5N23pt0OjNk44M52zC4N559iFVa8qppp/o8n4nsh2CNUwxWWY/YIQjNX9cec7kyp3c5MmYSDrdZzxz38lSPrP9e/J3V0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776119517; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mJKP1SVgsbLnTI6G/aFIyYqGXRmudzvv7JSn+nXBGDU=; 
	b=DRYeeel6zuBkVukjOlcbTUu6/DOlF0X1K5aGZxWB3ibP1qtPfUZY600+HA3OLeuLNUB+FRzjbK5gJTSwQZswnvE/QVpvZfW+AVjvcVBACNjlwHNCdHvcV2m2wCd8dcPahlUlRtYzUwl2tben0rBpp8+YWkOja3sAaoX4RysIl4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776119517;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=mJKP1SVgsbLnTI6G/aFIyYqGXRmudzvv7JSn+nXBGDU=;
	b=DN3pCSkfi1+etWj+1LQHJK6DiOzjdPkjohNgtbMkBMePpJfjGgKr/cFxUg/ooo+o
	V5WvM2hD7GnhPDainnFE2veszb3Pik7F3tdL7CaxrqDWeuNkSFrzWjC6lmlzXnlXTbu
	hxebh3sbhdyALWKg7o2l2oU6g+brzgcMvCDqkk8A=
Received: by mx.zohomail.com with SMTPS id 1776119515072731.0963813374332;
	Mon, 13 Apr 2026 15:31:55 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 13 Apr 2026 15:31:38 -0700
Subject: [PATCH v3 03/13] drm/tyr: move clock cleanup into Clocks Drop impl
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-b4-fw-boot-v3-v3-3-b422f3c03885@collabora.com>
References: <20260413-b4-fw-boot-v3-v3-0-b422f3c03885@collabora.com>
In-Reply-To: <20260413-b4-fw-boot-v3-v3-0-b422f3c03885@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
 work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2601;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=TJYiaR6HkYI0Jih2JmM5qi5Sd5bcOQQAYqWwO1EUFlU=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJl3867q1v4zrdhhfmPNW+25zbL3Cpe2dhnptCfNfdGk+
 WqJ9+aTHaUsDGJcDLJiiixn7Y16xKveG+nO/98MM4eVCWQIAxenAEzk+V2Gf+ZzLrSLx/MZGf+Y
 2tDjl7+m53vit8T46VaGUpP6uU32FzL8L4j+b/nksulXw+TI+TIcJ4Lj08LsAvY8nXDja9xVba8
 7TAA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Currently Tyr disables its clocks from TyrDrmDeviceData::drop(), which
causes them to be shut down before any other fields in TyrDrmDeviceData
are dropped. This prevents us from using the clocks when dropping the
other fields in TyrDrmDeviceData.

In order to better control when the clocks are dropped, move this cleanup
logic into a Drop implementation on the Clocks struct itself.

Since it serves no further purpose, remove the PinnedDrop implementation
for TyrDrmDeviceData.

Also, while here, remove the #[pin_data] annotation from both the struct
Clocks and struct Regulators since neither of these structs need this
macro to create structurally pinned fields.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 7a27207e52f7..3057f3af10e3 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -54,7 +54,7 @@
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrPlatformDriverData;
 
-#[pin_data(PinnedDrop)]
+#[pin_data]
 pub(crate) struct TyrDrmDeviceData {
     pub(crate) pdev: ARef<platform::Device>,
 
@@ -169,17 +169,6 @@ impl PinnedDrop for TyrPlatformDriverData {
     fn drop(self: Pin<&mut Self>) {}
 }
 
-#[pinned_drop]
-impl PinnedDrop for TyrDrmDeviceData {
-    fn drop(self: Pin<&mut Self>) {
-        // TODO: the type-state pattern for Clks will fix this.
-        let clks = self.clks.lock();
-        clks.core.disable_unprepare();
-        clks.stacks.disable_unprepare();
-        clks.coregroup.disable_unprepare();
-    }
-}
-
 // We need to retain the name "panthor" to achieve drop-in compatibility with
 // the C driver in the userspace stack.
 const INFO: drm::DriverInfo = drm::DriverInfo {
@@ -203,14 +192,20 @@ impl drm::Driver for TyrDrmDriver {
     }
 }
 
-#[pin_data]
 struct Clocks {
     core: Clk,
     stacks: OptionalClk,
     coregroup: OptionalClk,
 }
 
-#[pin_data]
+impl Drop for Clocks {
+    fn drop(&mut self) {
+        self.core.disable_unprepare();
+        self.stacks.disable_unprepare();
+        self.coregroup.disable_unprepare();
+    }
+}
+
 struct Regulators {
     _mali: Regulator<regulator::Enabled>,
     _sram: Regulator<regulator::Enabled>,

-- 
2.53.0

