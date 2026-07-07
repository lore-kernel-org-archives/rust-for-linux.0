Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E9D3EB0E9;
	Tue,  7 Jul 2026 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442037; cv=none; b=AZenefEIL228K0m3ZWcEcm7X1HSQO4HbrZC5/RblW9OhlFtJsUYlovlkTXQNmynZzUJJpDdAQlLkCm71zuMsRPTjkyfEjD/+2Ir03fS7joQtX521LcywFdCy+8Vvfe1FWJ9uEOcV0p/kC3+IR0hsLdHNh8Jq3NOlkxgQj6WIHmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442037; c=relaxed/simple;
	bh=EPy4vUECfwBd2kziKfra1feIqTsOHoDbqQjE+yjE2sk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=LvGrCgsdOdOqb/vd6PdB6eqkANHVO1mqSbH4PjFsakt7Vvx4bO28ZqI280CSh1TRDCN2OKru9mpXaCMS4HG3MwrDWKHzDVBmjsxiAFc6ijSON+ZIhaFUnCbOp94Ynbb5gproyRaSP9iMLGLCVB7tR+RYer/Z39BInCRQFqxGSa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vyFBhMSJ; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="vyFBhMSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783442023; bh=lSaDKeSfkjqAUmborLYlEgTaJyvoU/PgTrNBZohwgvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vyFBhMSJCqKRUi9KFe12cE8okAHpyCpCbHDgojS0NcP/p/GcFu6tYEPPVV0KLOSjh
	 993FTRiOTGYDSiM3rj9o4EJfyGMRVYp9aBBUMCRR6UygmbOEAmNA/1MbSuGBAA2g5w
	 9kGVrw8TUvrN7VeXWgk5aXsDmtyCf1Gt2VOm5caU=
Received: from localhost.localdomain ([202.120.234.146])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 868A90AE; Wed, 08 Jul 2026 00:33:40 +0800
X-QQ-mid: xmsmtpt1783442020tq0ycsoje
Message-ID: <tencent_4426892E62B77DEA2AE898E899A871940005@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3Jumgu2xQcoDP+TUcAjagQFGVkHXC9cCy+eo6Pdj9Poq0UDazu303
	 HgIvy4jopjER8naCLgPY65XyMiACR8/vNuo/qb6sGSAyZKx1H7grrXFgEypWl6facEyHrXfC9Z8d
	 sMGgdh3PLLv/G5RbeDzVNGG7svQ1UMGGJXhEn/K4oPsniNCbjGzQTDKzpSRyGjpjk4XgyhbM8R+e
	 PjPdp10vIqW+Q9J0kfsGYqoOenGnpQKFZrKWgO2XXbu6xEhpIqVU6lWBizDKESQEWTPQZClNkDB/
	 ehQYR3vZwEzROdJLaelxBBuzqfkwXOs/XetFhmiR2/pe523U4GHImUYClOaITDGxNvu+zdhnOjU8
	 tvVIcSEW2/IYSBh68xVrcNR7KLEt184kVccfTa+rWLJJvjIfj5fM5qZIXzaI2MCGCzcIMjPSXZun
	 7WMEzHqdc0tykM59nz+qmizTwTBSB5bQOIsq85pKJfHC7eVfaE4cGtQoYpEBc31ghP7IKsm1B9Xs
	 +QBX7uWqgOCs3A0ORTPt2f3hRJdvQS/0q2tHXgp577G9HW597+rbNk7QezjdkYtU/ouHRkfsboGn
	 v+llOlfTHC6+gGrMS3bjzTyoJkUltS1gjbQGuZrmIijq5xr5q2txjcfaEUd865CXyf8TKg3Mlqm5
	 iQzqX612+YuI/PA9SGbMMUC8l5vPycbxoCCEimYyIkuCsrya513I59fTSWlvwtasA9Ehg6hg1wH6
	 nA0yK2aYKxcVSTd58Jp6z+k1wBPUqJ2++UuwR9P6axBwtGhwAtYfQxw7EJgGlq3HHHAsaNN6nbVD
	 W9//5+mbwmGUv6CFEebOYLtp7AJAdsKD466THExai4x3XnJSjGzJOI8+QBer2Ip9Nv+K8sC9h7i0
	 9Xw8luJV3GM4fj7Lghkr6zIgm1UKG41i723C5cHWrZrsMS+UpzG/3xOguS7HdDSCsUxPoIHYFapv
	 SFVdkwvCjg1JKuQWxfJjlsepmIGqqPzRb5xMFlV+X78JsCIi6E5Uj4TClIEMX7Jxw5XsPNX+Isho
	 oIbdTcp8OpDl5Vkf16h0qQDRcHcBG//R3yRZr2Dg8rg5kY6EO9fBB9JTlzDSOe+K1p2aqxeTgjbA
	 hA1Ph9y6H7CEnyrMy2okUlmphaRR+9E813d3dIMr/ADrQRu3g=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Yilin Chen <1479826151@qq.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	Yilin Chen <1479826151@qq.com>
Subject: [PATCH v2] rust: drm: fix GEM object pointer safety docs
Date: Tue,  7 Jul 2026 16:33:33 +0000
X-OQ-MSGID: <20260707163333.2811168-1-1479826151@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260707160200.2798072-1-1479826151@qq.com>
References: <20260707160200.2798072-1-1479826151@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IntoGEMObject::from_raw() receives a pointer to struct drm_gem_object,
not a pointer to Self. The previous documentation used Self even though
the function argument is the embedded GEM object pointer.

However, the pointer must not be any arbitrary valid drm_gem_object. The
implementations recover Self with container_of(), so the GEM object must
be embedded in a valid Self instance. This patch documents that requirement
explicitly.

Assisted-by: Codex:GPT-5
Signed-off-by: Yilin Chen <1479826151@qq.com>
---
Changes in v2:
- Require the drm_gem_object to be embedded in a valid Self instance,
  rather than merely being any valid drm_gem_object.

 rust/kernel/drm/gem/mod.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index c8b66d816..524ab0e39 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -118,7 +118,8 @@ pub trait IntoGEMObject: Sized + super::private::Sealed + AlwaysRefCounted {
     ///
     /// # Safety
     ///
-    /// - `self_ptr` must be a valid pointer to `Self`.
+    /// - `self_ptr` must be a valid pointer to the `struct drm_gem_object` embedded in a
+    ///   valid instance of `Self`.
     /// - The caller promises that holding the immutable reference returned by this function does
     ///   not violate rust's data aliasing rules and remains valid throughout the lifetime of `'a`.
     unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
-- 
2.25.1

