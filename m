Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EF42EA154
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769042294; cv=pass; b=BjvuRViZwduFxRdO0YieL9AeZewT+9trOav6K1tI5MEmuZmUQmjmMmKJUz8dxuyWUWFV4wCuvUsafdyzNiI10grU1OL/3ZCeHnBMqZ/Cye9a1Zw0WaRk7UDud3ZQP0IXE0qVmbTiwaTfXFkHz2jfzd0qjTNFe09P5FjN9cZdeh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769042294; c=relaxed/simple;
	bh=IrAyt4AnY5ldRoipJ2Uj1S2+zrzBlgx5HzxO7mKGEXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rz0XoB6i227wffPSN1L6spi22G4bzT0e+pMdNHFuDuLuQRNUZyRlefZzoRtQ9El/isgZy4FMRWow2zeEGIK15yBMhnWzNGfO7chnZYt9uoCg6iKFyVum6N58Qxq3QikAwkVIwpxtLUP8cwFN8c9Mo555xjJ5gpbY1T7gWe6HqpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=BuX1HarW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="BuX1HarW"
ARC-Seal: i=1; a=rsa-sha256; t=1769042284; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TlMPaHTO3Csgbi9QylWtdn/sY05JB6SW/VjLuP9R70UVysciyOVYa68rsKfh+ND7HMwKynQs5J5I+D96HoKYBBReJUJE6xvLXrQ7PssLBs6ySnsTWp5nIC3cYVjclbHkAtMCQ8sUzq8nuM1f1LfaAZZTX34AVKnhliWBlEmhkRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769042284; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PKQ3OMXGxwDFvD97qd6tvylwNytfpk6i3gMHCcDTjXc=; 
	b=krbQxH0Ykew7G3ChI/mc+HMLUyfHgLLLcvsk6xYrNvk1kxCteVF1DI4sSlm3CP6U6jbEOsSLp1QwG4vnCrw26aBxmmXCAS3GMq8zP1xxQV75/3nTt9uc478tT2lo6JXNkzNVg6Upm7YenAmpq5K3QaH3ZA6IqW2/Y9vLXz3CrqM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769042284;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PKQ3OMXGxwDFvD97qd6tvylwNytfpk6i3gMHCcDTjXc=;
	b=BuX1HarW7SV8pERf0IAu6kROvVn3rhfO2/+YSLEKIPdcuCVy594YymyvV1cW+ELT
	acTLlhWMar9Uw7PKjulQcWFOnjXS1Tb4Bs3Un3/O7rkfGJttEaUPEnELI+kvkrhpL2+
	7GxC1zwHOALTZC4ClmGma0ODuh8/48STc/O3YnQw=
Received: by mx.zohomail.com with SMTPS id 1769042283476199.73502584415917;
	Wed, 21 Jan 2026 16:38:03 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	broonie@kernel.org,
	dakr@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] drm/tyr: suppress unread field warnings
Date: Wed, 21 Jan 2026 16:37:46 -0800
Message-ID: <20260122003746.405370-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently these warnings, as errors, are preventing Tyr driver
from building:

error: field `device` is never read
  --> drivers/gpu/drm/tyr/driver.rs:37:5
   |
36 | pub(crate) struct TyrDriver {
   |                   --------- field in this struct
37 |     device: ARef<TyrDevice>,
   |     ^^^^^^
   |
   = note: `-D dead-code` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(dead_code)]`

error: fields `mali` and `sram` are never read
   --> drivers/gpu/drm/tyr/driver.rs:196:5
    |
195 | struct Regulators {
    |        ---------- fields in this struct
196 |     mali: Regulator<regulator::Enabled>,
    |     ^^^^
197 |     sram: Regulator<regulator::Enabled>,
    |     ^^^^

error: aborting due to 2 previous errors

Suppress these errors so that the Tyr driver will build.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 2a45d0288825..04c865cb4397 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -34,6 +34,7 @@
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrDriver {
+    #[allow(dead_code)]
     device: ARef<TyrDevice>,
 }
 
@@ -193,6 +194,8 @@ struct Clocks {
 
 #[pin_data]
 struct Regulators {
+    #[allow(dead_code)]
     mali: Regulator<regulator::Enabled>,
+    #[allow(dead_code)]
     sram: Regulator<regulator::Enabled>,
 }
-- 
2.52.0

