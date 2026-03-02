Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666C12FE044
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 20:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772483027; cv=pass; b=GNFwNRJRptjKtY63MWAkWSNLnP7qTUhV1H2R3aN4MQ87e7FurafaE+vt7fFqfcGLACKBN23ZppogcjQYSM62yPWDOQ6djjaAYNfK2422fA1K4qTqNHdb6xLOvf58OveB+d3ESkZvZV+U8TbIJwNHKVjuVTWoTg5qmrqzIaDk3ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772483027; c=relaxed/simple;
	bh=2O3MPMBoN4lWLj866sM39xcDmM42WzxqVySUIo7g8uM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEzvhJb77Vmcb99LILAXwiQF/aL0HMTFmXmQI1hIowm+41G1zAc2hH71ZxAOmGWNAaXEiJVWfX1iyKEUPKLugOfV8yWE79Fk1qnqj0DDQxuVBUAUNWram10gUEjuDZB3E8q3921FLKLHtGkxzs990hnR97jZhy4R9K0PYAnfce8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=XzsGhd6J; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="XzsGhd6J"
ARC-Seal: i=1; a=rsa-sha256; t=1772483020; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=elOjR+LXzlUoQl9A/87V3aOpmy9UOjpb6h5DoCO+C/6AvYVX4APFE4P7a69gi+VjnYhc66ps9aq/ovt2V075HiH1nqjHnxAtYrvJLgfNUKSXR/ftbvPYV7VoHzAX/uuFU6J3oPTeEQt/XsuYFbkM/ibyW8yee9cuUE5nRV0rx2s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772483020; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2P7cKmxKTtUWza3HVGpYgBF0W5BOF4ADlghlq0nZnXo=; 
	b=CbtbxahovGTUufjc1ULbSGpG14RsXnZXgkuubT4Jq+vLs5q6uzMfDOGenSR4PkxuzD22DcR4RSgx5ccAIwXZMfp51AQVKl99Y8gh0a/0wqn4c68L17gR2dgBdndnpjuxwYhq5RI3Z0e5VOhKFelvbDYrhbk5/Ipsb5cPYSpTMSY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772483019;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2P7cKmxKTtUWza3HVGpYgBF0W5BOF4ADlghlq0nZnXo=;
	b=XzsGhd6JzEaomip6IvKAw69y9ks/sbfzHz2ixJmCUj+Uk6vKjE2QEkfzKXGnbuRX
	9y0jCna7a7Y/tZv5fG5Bqg5MxYOaOxx7Yt4sd8hLHFgIbbDRwjFe0SrYfSjUfuvhWWm
	tptwW0UuZ1m4Z1mKzLxnmkY6wolo38wBAURkRfiM=
Received: by mx.zohomail.com with SMTPS id 1772483017282302.4406533457385;
	Mon, 2 Mar 2026 12:23:37 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] drm/tyr: Use DRM device type alias across driver
Date: Mon,  2 Mar 2026 12:23:31 -0800
Message-ID: <20260302202331.176140-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Tyr defines a convenience type alias for its DRM device type,
`TyrDrmDevice` but it does not use the alias outside of `tyr/driver.rs`.

Replace `drm::Device<TyrDrmDriver>` with the alias `TyrDrmDevice` across
the driver.

This change will ease future upstream Tyr development by reducing the
diffs when multiple series are touching these files.

No functional changes are intended.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/file.rs | 7 +++++--
 drivers/gpu/drm/tyr/gem.rs  | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 450be5ab9aaf..31411da203c5 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -7,7 +7,10 @@
     uapi, //
 };
 
-use crate::driver::TyrDrmDriver;
+use crate::driver::{
+    TyrDrmDevice,
+    TyrDrmDriver, //
+};
 
 #[pin_data]
 pub(crate) struct TyrDrmFileData {}
@@ -25,7 +28,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
 
 impl TyrDrmFileData {
     pub(crate) fn dev_query(
-        ddev: &drm::Device<TyrDrmDriver>,
+        ddev: &TyrDrmDevice,
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 514524ae07ef..5cd0cd9585e8 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -5,7 +5,10 @@
     prelude::*, //
 };
 
-use crate::driver::TyrDrmDriver;
+use crate::driver::{
+    TyrDrmDevice,
+    TyrDrmDriver, //
+};
 
 /// GEM Object inner driver data
 #[pin_data]
@@ -14,7 +17,7 @@ pub(crate) struct TyrObject {}
 impl gem::DriverObject for TyrObject {
     type Driver = TyrDrmDriver;
 
-    fn new(_dev: &kernel::drm::Device<TyrDrmDriver>, _size: usize) -> impl PinInit<Self, Error> {
+    fn new(_dev: &TyrDrmDevice, _size: usize) -> impl PinInit<Self, Error> {
         try_pin_init!(TyrObject {})
     }
 }

base-commit: 15da5bc9f3adab7242867db0251fe451ac3ddb72
-- 
2.52.0

