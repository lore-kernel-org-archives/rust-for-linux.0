Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C333A6B99;
	Mon, 13 Apr 2026 22:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119576; cv=pass; b=dPJ4yb8GsfypZxms+C0C2xl6Oyt/+9kOj6M6imNAlcSzSeQDRcGxCyQVPAAwHNt1W4D9XQh2Azs+GCLT10Yx6RUipMlaOn5lSRMhoMJJsVTAMrBkz92M6zMIMX66BmluwLw4hrlQ/LR9m+1DaDpXd7HEJjFagBr5EFruybJ2mE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119576; c=relaxed/simple;
	bh=n3WZMErEy6oVIqhhH/21DmsPSrqalZYcPgPTfJaLSp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5KcYDWopcB3vL7/MErPCXK91PbnLLQMSEk5lmBKqIOrplKEe8W8Vu2jF9HEMPpjRl4Uz1NT5yFAN7O9h7Anusu+fSikts5JwXb5zPpP105bmCj34PeIPcEcgLpyGpBANc8piw6wAaKNd4oQsXyMYWZqqId2zlOj3GRxzGjrQOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=idJCH8HX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="idJCH8HX"
ARC-Seal: i=1; a=rsa-sha256; t=1776119519; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DJVOkSYrwD8bg66B8qB51uy5RX9faO4rNwwhgZEmNy4pPzdrDB+JpZXxjJ5R2B8QG7SXHPULb6RzquSe2iUpOMYcNCd9qvyTK9xKnwgh2CpSN1Tv27FGNZD8ECXsbZ3sGaqRmYBWO82LY+R0v/uOWfBflykDRMzvB3Y3rlSFslM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776119519; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3dTFROfvAzEnMmmF6K1xMdBFrCP2mhHx9BiBGFP1Ct0=; 
	b=QnMeSm2MJqbVFn+uZN57v9un6C3OE7mSGmj2A/LuPOveNpYd7gIW8UVVBRIZBvC9TR/H8ZWQAEismCNp0FTy45dnl2+uge8u2A1atH9Qj9fE1CUkCu+d89odylHeQyb1EOemCxy6TCgadKUpHemCXdvl/MklTaQ7/nzntghYBbc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776119519;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3dTFROfvAzEnMmmF6K1xMdBFrCP2mhHx9BiBGFP1Ct0=;
	b=idJCH8HXEserd4T+O7/x2w+wQdVnJ/XkkgYln55QQKjIa2hQidXjkxEgz/0py/PL
	4s0lddFukMGcnD3StnsoVipc2aORJWUR/jLtZSOcG5wyAiqoMTIcWZ46jHtDjflYcF3
	zRH5OrdxKjoDpJvuGxB9f/tFashnOvo5CaokS22k=
Received: by mx.zohomail.com with SMTPS id 1776119517638801.3669547765522;
	Mon, 13 Apr 2026 15:31:57 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 13 Apr 2026 15:31:40 -0700
Subject: [PATCH v3 05/13] drm/tyr: use shmem GEM object type in
 TyrDrmDriver
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-b4-fw-boot-v3-v3-5-b422f3c03885@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=4Ba4ZrUKq66SWVeeJW+wemfXBYB6qyOZr6r0bmtZhd0=;
 b=kA0DAAoWeagp5wxefesByyZiAGndbtXIUAisblEBsZx8lVIgSEYpYw1l8J1PgsG6R3kfTaLpd
 Ih1BAAWCgAdFiEEzT8yjBd67zItn/+Deagp5wxefesFAmndbtUACgkQeagp5wxefetAQwEAjeve
 vo4JExKtAFWE93Pl8HiBwpmGU34gRbHcgKnoSa4A/3tIK5Yhas1Da85yA7oyFYO7jFhVlWLWeEZ
 B/BS8HQQE
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

From: Alvin Sun <alvin.sun@linux.dev>

Tyr buffer objects are shmem-backed, so the driver should use
drm::gem::shmem::Object<BoData> as its GEM object type instead of the base
drm::gem::Object<BoData, R> type.

Switching to the shmem GEM object type matches how Tyr allocates and
manages its buffer objects, and uses the shmem-specific GEM abstraction
provided by the DRM Rust bindings.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index f2e7157221f1..26a20e0ab91c 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -183,7 +183,7 @@ fn drop(self: Pin<&mut Self>) {}
 impl drm::Driver for TyrDrmDriver {
     type Data = TyrDrmDeviceData;
     type File = TyrDrmFileData;
-    type Object<R: drm::DeviceContext> = drm::gem::Object<BoData, R>;
+    type Object<R: drm::DeviceContext> = drm::gem::shmem::Object<BoData>;
 
     const INFO: drm::DriverInfo = INFO;
 

-- 
2.53.0

