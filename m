Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D603329374
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763379020; cv=none; b=OZ9TpMRMcMgXDKqBHuQQfREPWuF41g/NdyqrZPywEIID/3cGuhbPzKY1NG2WxKu0B1YS4Z4WxeDjlh1mb9boR0h8SZS+trZXe+sC2r2pMseRxdyVQOZX2FFR80gNPhAX1xRfvZv6F0UlsLh+WhfFoqXgvkLtH3JbE6c33A1BUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763379020; c=relaxed/simple;
	bh=IlBwznomCNY5hv8/BeD4ioOCllG+3LV3IzXw6zkP5VQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gJkbfA38uoQMr9kXdHD5JhGqsIhdhK0NOqEfE+moHXy8V925qvyABRR/SB8X4bzA7Pd/CCOecClK/pGU5evI1qtPPwdJVtjAs7MbifMEcBW+AhEYwcqoMKvhzPp5Sx+dh1RcZbzxA209AadWsQl893TPxFZWyr5re8cxDkMbErE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2fbCjBzG; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2fbCjBzG"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c5da68e5so2360116f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 03:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763379014; x=1763983814; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Aj4+FQsxMyGtrmcGiS6DW5AMZ1bMpHqh6Z1FckhufBI=;
        b=2fbCjBzGFTJ84MlwzxeRMPLghgZUci/vi1Zw8l7N19FIPneyoFaMpK2WAQADJZYEZd
         GvCRMrg0sjo/R4e5WlVrDXBoFbglRklFIhLExC8lwjRCnXyBVVG1v0VP/TOlWcEUrZ0y
         pHndUQebQwHkiR1/PG5J6PaEjMX98dybXqvs6zsjhFujbgSsktNdawq8jJmEjyAHTaUI
         P31ikYNDyS8ACSDrJGqMDuRQ6o5XLi9gUb3ngYn7E2wEsjpXli3Bf0FGWeY4ku4mA49K
         P5JNNIlIx+se+PmIiR9BZhLHjNpNH8vuQp8Rw5jltI37yb/zY1Y2xQB6KxmFCYQ5x9Uj
         EE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379014; x=1763983814;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aj4+FQsxMyGtrmcGiS6DW5AMZ1bMpHqh6Z1FckhufBI=;
        b=jQ37YEZ0mv3eQqIT9apc1dX69tmchXZhuY2TG+KG0Jk/WzW+y4wy9RUlTcgE2IE7Yq
         BtY0RoZhGlppw8PSxhpH8vshTvX8a9kkw3NLHVV5QDkCtXeGlDNY2twlavNmqY9tl/ZK
         Bj1K8v11/zJl1ARJ5vVLtiorbw0gUpKIW2MQvFqMVU1cNXBtad7ltkL7gJ6qaMSx5kOJ
         Ah8D45WkAgqxaSTgfskqonGUuQu0omZYn/yxSjNix7lmczlNJPoGCOqcje/gcx+zSRqw
         ku/Qx2//dFx0Mtql3YveG6xt2RH3ATNBKCdC0wYI7n1pMSNGrYHY5IsXkeHmUEA7R5zF
         YDHw==
X-Forwarded-Encrypted: i=1; AJvYcCW9bhUJCTiC3JsqyJ9QBSqdYEa9TY9uUOdSJXcF3mC703pCBe9eJ6JjE+LkmYrELEylyIpB708MA/QC2D8xLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+/yyn+wTXiuqngtAdFWXgxyGoqaLQ2mP2d2s88ore0PIF4wW9
	pUdeDEw+v8VzqZSycns0SJgT8/CwiyXp0j7O7xjxL4EmDvSTOZedA82Gxf3dql9F88bJxcoua8A
	8I3FFHwsKKYrGDRjeGw==
X-Google-Smtp-Source: AGHT+IEos1s7OFBxCj/fM02CWcOnMb6ZLlOOnUqYdtRqihg4crPsbk05VLBssUA1B8VK3BKch9rwsZuNBWjNRJA=
X-Received: from wrxb8.prod.google.com ([2002:a05:6000:10c8:b0:42b:5eaf:119d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584a:0:b0:429:cfa3:5fde with SMTP id ffacd0b85a97d-42b527be676mr16328982f8f.11.1763379014132;
 Mon, 17 Nov 2025 03:30:14 -0800 (PST)
Date: Mon, 17 Nov 2025 11:30:07 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD4HG2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nz3bz8skTdtNwS3aLS4hJdM+PkFCNLAyODFDNjJaCegqLUtMwKsHn RsbW1AAstps1fAAAA
X-Change-Id: 20251117-nova-fmt-rust-63cd29020d63
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1973; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=IlBwznomCNY5hv8/BeD4ioOCllG+3LV3IzXw6zkP5VQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpGwdABBJKTzctYKpuoSnFbOIZk5NSpa+oTTrtN
 /za72t96UiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaRsHQAAKCRAEWL7uWMY5
 RtnVD/4qapAyZ49F06sMtEJHVqKS8YqjwhykFgm+uZ/TniR0YxtO4KTpyxKcZKJE5RrE49eqhBu
 cQ9SaBpgoTjPsICBNHglk57Z8cTY+dOvnpyoUn1+Z7371RGOaBQBjOFr0vD6ybMMyswiT9UsSff
 GxeD4b77jCtNrFSqAr+1B2JXohggMwJ2bt2eOcm3HY9ANayh7g2nMEfV00JQP/1BMCpqoRu5nD6
 453QEn4HEySCIUIVstAjkIYozquYdmX2f85NKtLcBoXWDXLOTdr1ewAIh5RrWBgHot+CxCU95f7
 pRJQHYiUjxYPF4OHnXz6Opc0/2XYybl616H6fjD21tUfIZNM8DZgy6x5dA1O/vZaNl5s3+JNMeJ
 jeJclOWQSY3NRJXgXjJfTJkWR9Xc6HZDhuTfQ+nbQlcTQzyNHWqWqmQCXcT97MRq84OlyVVHKnP
 3b8MbdY5JhXbrXyykTSdGJ719EVbxJXU3T1XL9zZeNuFZYJMgwTcy4z2iJhybK/ogS/A1od9hNL
 vwPOeYdAhON/ED3qRKT2FWEdxHQ6kO/Qo9zhrmERY3mGCUwYvxwKjw5bnK1cYk+FGPLfIwymxCX
 8lZ492X8GCr/DI2RWLIcCzDoPxcivc5fGDhjBVeaIK5K1yHOmUc/23uUKYRP3GOZd85Y8h3NV+0 zIiTCq8bX1l8KOg==
X-Mailer: b4 0.14.2
Message-ID: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Subject: [PATCH] gpu: nova-core: make formatting compatible with rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Commit 38b7cc448a5b ("gpu: nova-core: implement Display for Spec") in
drm-rust-next introduced some usage of the Display trait, but the
Display trait is being modified in the rust tree this cycle. Thus, to
avoid conflicts with the Rust tree, tweak how the formatting machinery
is used in a way where it works both with and without the changes in the
Rust tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/nova-core/gpu.rs    | 5 ++---
 drivers/gpu/nova-core/gsp/fw.rs | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 19755af6ad045f4d42835985c2048868dac23dbc..629c9d2dc994cf79f37d4aa71ce65957f45736f9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -227,13 +227,12 @@ fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
 
 impl fmt::Display for Spec {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        write!(
-            f,
+        f.write_fmt(fmt!(
             "Chipset: {}, Architecture: {:?}, Revision: {}",
             self.chipset,
             self.chipset.arch(),
             self.revision
-        )
+        ))
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 8deec5e0a1d4affe705860401acd646ca8add11f..abffd6beec654466202abe70c4c52c9bd4504d14 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -6,13 +6,11 @@
 // Alias to avoid repeating the version number with every use.
 use r570_144 as bindings;
 
-use core::{
-    fmt,
-    ops::Range, //
-};
+use core::ops::Range;
 
 use kernel::{
     dma::CoherentAllocation,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,

---
base-commit: ce89e3e019f1ec4b11356f35feb8bd8c0f2c6bf7
change-id: 20251117-nova-fmt-rust-63cd29020d63

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

