Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0256390992
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529872; cv=none; b=fnC5K5KJ9THvYq/FIcJrUYb0/atpb2VpgDY8s+P+Q6zA4OaY1BJB/wUmA00FHF2LwMRMnrOHv+4Ro82OVTfQK+PrzI1750af81P3aBviaGkVFLKUFnj2N8qybCAtEdble2X7pD5OABdBHwUbaiJpXswam6RMvLgNXJt7DiXRBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529872; c=relaxed/simple;
	bh=2f7f3gbtPo/Uq28ZOW5NymCCIuSaR6PvKX7O22oZJ9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sifuEDXLjGX2bm1w2NMHrTeArN5mFtlfki5j/mRnPPrGCRD0slpnHJGWeE7dtQN+ek1k7Ol+iQu9RR+2evg5DQw0tLhywvqPSJDtOHUadjTbpkibHHT9iXW4Qpwbdnn/zmSp8gH3l8+3Udl+Lp3jw600TV1taZwHdJhU/HNPyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ma3yYNF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ma3yYNF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1121F00ADF;
	Fri, 31 Jul 2026 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529870;
	bh=MsIDZiwSPmskK9n5nhtTssL2Y1o3vOS3ZV20vncjul0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ma3yYNF8izHoiKeiPE/lFK8PynI/lAU9XNRinAfqcoUzj9O0LCQ101kkcqJEsgwdf
	 wavpDCiVp0m8MiPjixK/3kH8Uq0bEpJdYAh4G8FdmFXjgUFFRB2MGn+c6y6xp9dMLs
	 kOXkJoYxve04Ia2898cAG9k7jeITyctCLO9mAZDTrfZJmdUGEUeoFTvwDhVNeAC+35
	 gbbpEeZar9J7g2aNkehRWSoH2To0nZlQ+pXoQJURdvn761BsCCR8SvsbNrV3njVJZQ
	 5G52GJcrMJKf27ttsFF5Nu/A7DJYEL8M3qKRd3x9y4tR0CDFHzmenphHuj1kAcoQxT
	 6/sJHA0zFJTyw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 58F68F4007B;
	Fri, 31 Jul 2026 16:31:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:31:09 -0400
X-ME-Sender: <xms:DQZtarW-zKTM4S2GVIwW10Dclvz3i4z42VXtqXlqXaIMvJoGUKxlug>
    <xme:DQZtat_llGpowB_h2qfbioSiE6TbPjSK7_0AWObfzaErMuBh9io8rTDL02pEvOmTb
    Irq_CuYuw8t6sRIg-Is-Qz3GIsKoaP0JIAKwHFrV3NpskfShPFd_A>
X-ME-Received: <xmr:DQZtatjZRiBRiUZWVU2afr7oWF3zvs-ZponaT2hr41MaeWehHLDApHyXAgTi1dOXrwgoO33K-85ZiTHHXGD_-oi--TQLKZ7O>
X-ME-Proxy-Cause: dmFkZTEx/5S6G4+/qWahub76rD+/ZVHwV35J6FmUal1s+rCkFqtdmVSwk6K0IcMoYNBriQ
    jzkD/QIWyBCXxFXrUxewwooRRYY1snGImAM8ms1J0rQ4yousOqpNJ30B7CHK//nNcomy4W
    I6ocsiYNJ0mCNaJmOgh+Pf7hXCJ/QEJRpl7PHOpTLOD8FaU/mgJ38GevRTx88Y8aOyNMPA
    RxPFyEJNVBAYxKhXvQwp05QVk4kSq+dG3VxPm0kHYbTYKcWf4HJeBmpgQRwXCF1tnzxJ3p
    u5VrXdml3B2K+pxowi0aeuUo4V1i7eGjDAPpMqKgE9ULEmEwsndt/ZtUBMuM3XtcdFbydq
    cozzsDoeyagIZHo14etb/oYSZt+8QWLZ7vnFKvZkxuFb8hDYpkszdxNLKkUQFE5Q+wCkoA
    NPPhEQ4VvwBEIb7M6Uh/FXp8LvcPyre2JffvbgObG6y/e0lhAd3YxuPs3/Al+j4fy0vTCP
    o1Vt3U7VAF156MFqK3yDvg1m80eIJ60n5bImutblaWA9uO2qC4yu55Og0GaylvElS6TGQv
    XtpvGS3bSwgSJul1qk1tY4OLmFI3k8z+unbequ5U8jUCbl88j6ZdgSCzPQTkMpcDnPl/ay
    v3DnwzcBnDQH9Isee1CU22DUuUYpGb92efjZLD4sDFIYVZsSzhSlOjSQXwQw
X-ME-Proxy: <xmx:DQZtahf1aaQa-kklOVaZ0wq8wpt6XgFYlSPcwtkjrg9NH8xYBQE3eA>
    <xmx:DQZtauIJr6rgGFVCV-mLCHbuNh5v7lC21ICDbWvGZ1YAm7S-I-H5bQ>
    <xmx:DQZtamm0ajsZnZII2QjXNVfQd3AvxFpxBKmEHSCm-uIHjPo7sea9pg>
    <xmx:DQZtaueWNOq_xB-F1dqSxqOzRn_LGDgIOBPAahI9hZ7xkxMMaSIm-g>
    <xmx:DQZtavyZfb3FHaFJckkHM0AEUs3xLfUrZKuR097Gn2TbjsWV8sqdVhov>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:08 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 20/24] rust: revocable: Use safe synchronize_rcu() abstraction
Date: Fri, 31 Jul 2026 13:30:21 -0700
Message-ID: <20260731203031.13679-21-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Philipp Stanner <phasta@kernel.org>

We now have a safe wrapper for the foreign function synchronize_rcu().

Use it in revocable.rs.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Onur Özkan <work@onurozkan.dev>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260624150704.1504001-4-phasta@kernel.org
---
 rust/kernel/revocable.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 0f4ae673256d..f539603349f1 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -7,7 +7,11 @@
 
 use pin_init::Wrapper;
 
-use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
+use crate::{
+    prelude::*,
+    sync::rcu,
+    types::Opaque, //
+};
 use core::{
     marker::PhantomData,
     ops::Deref,
@@ -161,8 +165,7 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
 
         if revoke {
             if SYNC {
-                // SAFETY: Just an FFI call, there are no further requirements.
-                unsafe { bindings::synchronize_rcu() };
+                rcu::synchronize_rcu();
             }
 
             // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-- 
2.50.1 (Apple Git-155)

