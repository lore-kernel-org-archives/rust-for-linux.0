Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0026FDAC;
	Fri, 23 Jan 2026 17:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191182; cv=none; b=sGn5xF1BmkOAwD0s4G77xEvszvDGNnU8pVXOt6DmLvJ281kQfYk/ePvLJzikzXEYhJgYPJi+gJLdeUI8YF62sP+XEh7h2Q6m5JNVx84p0Mk3GGm62npqZFwB24MAUuIaYEHK4ng3JZzcuL+aGp4xbU8KVb0ClS67awmqTHm7PDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191182; c=relaxed/simple;
	bh=abMEdDj1ecT7PEBgeo3Efaftk/vtPUHppJTpuJNaA5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbDdMyat19MWwUzpO1nnE0XSrAt1+ecqKvkyv30NMFsC5tDe3d9ThgM/tJe5W8ionr0gIFB/XSyiOcZpkaSOT4PEFxriZVSl48Qiq7uNHrE2LxuubgMa2KJ4j43m5PyT40WtqhoN5bWP/pKehxVxK9CAlbuQ092fkymgUu5f73c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWQBJ0hG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWQBJ0hG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A981CC19423;
	Fri, 23 Jan 2026 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191181;
	bh=abMEdDj1ecT7PEBgeo3Efaftk/vtPUHppJTpuJNaA5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=tWQBJ0hGSMfV9MbHmctkF6zXMFWybelZwtXbWKtmlJlLjn0/FWy8JtsC0ocR4fYaB
	 NQalsLm3+3ldC9YFTqhx9k7u8n2nyfcUkMqhzgJD0jZtpaPV1PvP1/IlHhhHM/24ti
	 jJSOa1aY54EX+30u1PfN6k8p61ELtHu0bxiPslCKAWc5U0oD4ho2lwm/Q8oD8awEui
	 OoojRrZYJjC3xGcE3fb8NrJrxW/DRV4r2sPB8ev4aJrMs9a3Gyg0u8hQv0fz1SgaHR
	 ltUZ+yptSxB6Narz21YhGU7tueViDge2yGbMa62qiL3FqoY/pxa1cnNbo2XjMZGLP5
	 9yQKLbbWmgbNA==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/8] gpu: tyr: remove redundant `.as_ref()` for `dev_*` print
Date: Fri, 23 Jan 2026 17:58:45 +0000
Message-ID: <20260123175854.176735-8-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This is now handled by the macro itself.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/drm/tyr/driver.rs | 2 +-
 drivers/gpu/drm/tyr/gpu.rs    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 2a45d0288825..fe991d8cbb4a 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -140,7 +140,7 @@ fn probe(
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
-        dev_info!(pdev.as_ref(), "Tyr initialized correctly.\n");
+        dev_info!(pdev, "Tyr initialized correctly.\n");
         Ok(driver)
     }
 }
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6395ffcfdc57..64ca8311d4e8 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -98,7 +98,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
         };
 
         dev_info!(
-            pdev.as_ref(),
+            pdev,
             "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
             model_name,
             self.gpu_id >> 16,
@@ -108,7 +108,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
         );
 
         dev_info!(
-            pdev.as_ref(),
+            pdev,
             "Features: L2:{:#x} Tiler:{:#x} Mem:{:#x} MMU:{:#x} AS:{:#x}",
             self.l2_features,
             self.tiler_features,
@@ -118,7 +118,7 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
         );
 
         dev_info!(
-            pdev.as_ref(),
+            pdev,
             "shader_present=0x{:016x} l2_present=0x{:016x} tiler_present=0x{:016x}",
             self.shader_present,
             self.l2_present,
-- 
2.51.2

