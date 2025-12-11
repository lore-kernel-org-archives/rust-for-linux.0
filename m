Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910C21C175;
	Thu, 11 Dec 2025 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765466288; cv=none; b=SA3PgPBfetlB/mxF0w54P4k+SwkS3mTPxjBsz4Nc5Q4GF7j3Lw6qvbL6mUYd8DBWYPI2pAzX2rt8w+MAu/F/Pj1kP6jPu3x4bJaTkkKO9wExC+U9vtHKw6y7DMZA7/Tq+EIpIqrRaNWAIMkvQyOa2MOJc7IcxuxeyCHYy0nco6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765466288; c=relaxed/simple;
	bh=jMmwbuaF/J+aS1DiX9F6BBS5Uj7nz2sQmE+hZSXb2+0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=C6BuZoMT7d6pJ+XUQDWEhxMzNad1YmiJbu9h/KVtGTn7t6/da3iuEG5JxxX/OlVkhAgE+pd0pBoZc5+xxe6+AogPtYbUInd0kS+LTM5aU228Ld8+ucebG0IjX/T9vVbYLdRTjMZ6vendtQKkv7tC6MMlqUXtzQ+M2Lx0KIugeIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=sGeIw5DF; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="sGeIw5DF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1765466282; bh=vCrlGfuMYjqOzwOUZxISTC/WPIdY1C0Ou3RjuX0eIHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sGeIw5DF20ydieJLpk0nSJJCrHjsulae7YXPKAAREA65EJYwWm+pOa+EFUrE8Z5gm
	 /snLa7FVlSC9MK8CUDsGmN/L9+cXp2iWhEMP22JBm2zrTE2L3O9qHy6yKzNlP1s3L1
	 DN+wiojPlv1EPtv6N6nXI1aX0lBrl2A6GCynteLM=
Received: from xh6010.. ([202.120.234.37])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 4810EEE1; Thu, 11 Dec 2025 23:18:01 +0800
X-QQ-mid: xmsmtpt1765466281tjwgh1hcf
Message-ID: <tencent_5524A2A07DE84AF0D8E4B9B21199603AE905@qq.com>
X-QQ-XMAILINFO: N2PXJXefbcU4ZtiYCrZyBxSlVOwnNIs2lYVK2EEvxXKF7tYV/plXxSXPzD6n45
	 nrU7SJPMoa4iMk+lOJuNjLyJRQBShoOv/9l3Ahg+lPrMfRaDtEcRgc9GSjqd+62iKqjvhwJLqjPS
	 m3kwUuQNRuHmZKNGLj5kJW3GtWMpi/YunyHx9ZczR4ShgTYX2CtGeEq9w1TrZ3PMQU97vH+RFkE2
	 oeg+SWeW1v5qDLaeug42d+nsId9lQYYSyvwyr1AQp8BC3uDPIUiFMGmhCvT/i30CIHxr/TbziJhX
	 MQdmR3M7Dhy3WKZssPAuUcXa7tLl0dIZlBFS+mosxSM9yGVNnimxLW5CQISQZTckiF+j/SNMph43
	 nZnioKka3oh72I3QTWtfOmB67OCUxVgAyUx4v7QstYnzxKBkFd/vWQNKxC1ynnVJbF2s+iaUDehZ
	 /wtNQBfhm7M7Y50/n0rR2shnPRyiFsiBo5EdZWPNdcbSVSkpCSSlIgNIGNwuowQf9C/QpmTMwdMI
	 xDKKXK4dlcJHTz3Go38TRW7JdSFZthvgy1XXmakfFK2Oc2xISVknde+e8kuiw2tzO5Aw7tpbqMT6
	 YCUg+B/tqfDa4R/pIjSm/Vyz3altV5zvpp631wJvZPIQQHorye0okyJTzpE6YPVi3fCccuwO573q
	 Mr3dv72E2/ixgh0cvtwpw2jr+vYH/a9Wj5flOgPX5+pvfA3+aQjCkhQwssUSZOy0r872Rr8ekA5b
	 K8j0GQftiS3Eg6uwFEz3n3abjoiFScvybAlYO6G9OkweB8Q5CVD4wpgfLz3DdK387OV+lZ34w056
	 vUdH8WjZ9xao1iRg/kfv13EzcNXogJNmikV9/taFq6QwgWGHPVjD2q1WNucZAjwJ1yhdhfsnMrQ8
	 8ygf5fCsoxsegwSbG0R0h2z0mGHm0lxOTAO6zAD9OFDNYPr+lvLVwdGpJfsVqCxTCmNApGl6Mc23
	 n9SxhzdS6elbwvlOIVrvhavXm4Hri2Pf9kt6/kNBR489gTV2bUzKtDmvQIRQqfZ8eCd0NxyG+LJd
	 wkY9uWWrrXi+J80HPe7ZGT/WfOoheng/8TkreUmqqDo0+FavpFjrqFM1vZ5BdwxWuDhSM7Ae9W/2
	 3kfKXK/Mrj5x1zEDZ6l6S8wwxtHg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: yilin <1479826151@qq.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yilin <1479826151@qq.com>
Subject: [PATCH 3/3] rust: cpumask: rename methods of Cpumask for clarity and consistency
Date: Thu, 11 Dec 2025 23:17:59 +0800
X-OQ-MSGID: <20251211151759.2894403-1-1479826151@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211151553.2893838-1-1479826151@qq.com>
References: <20251211151553.2893838-1-1479826151@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename `as_ref` and `as_mut_ref` to `from_raw` and `from_raw_mut` to
align with the established naming convention for constructing types
from raw pointers in the kernel's Rust codebase.

Signed-off-by: yilin <1479826151@qq.com>
---
 rust/kernel/cpumask.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/cpumask.rs b/rust/kernel/cpumask.rs
index c1d17826a..44bb36636 100644
--- a/rust/kernel/cpumask.rs
+++ b/rust/kernel/cpumask.rs
@@ -39,7 +39,7 @@
 /// fn set_clear_cpu(ptr: *mut bindings::cpumask, set_cpu: CpuId, clear_cpu: CpuId) {
 ///     // SAFETY: The `ptr` is valid for writing and remains valid for the lifetime of the
 ///     // returned reference.
-///     let mask = unsafe { Cpumask::as_mut_ref(ptr) };
+///     let mask = unsafe { Cpumask::from_raw_mut(ptr) };
 ///
 ///     mask.set(set_cpu);
 ///     mask.clear(clear_cpu);
@@ -49,13 +49,13 @@
 pub struct Cpumask(Opaque<bindings::cpumask>);
 
 impl Cpumask {
-    /// Creates a mutable reference to an existing `struct cpumask` pointer.
+    /// Creates a mutable reference from an existing `struct cpumask` pointer.
     ///
     /// # Safety
     ///
     /// The caller must ensure that `ptr` is valid for writing and remains valid for the lifetime
     /// of the returned reference.
-    pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
+    pub unsafe fn from_raw_mut<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
         // SAFETY: Guaranteed by the safety requirements of the function.
         //
         // INVARIANT: The caller ensures that `ptr` is valid for writing and remains valid for the
@@ -63,13 +63,13 @@ pub unsafe fn as_mut_ref<'a>(ptr: *mut bindings::cpumask) -> &'a mut Self {
         unsafe { &mut *ptr.cast() }
     }
 
-    /// Creates a reference to an existing `struct cpumask` pointer.
+    /// Creates a reference from an existing `struct cpumask` pointer.
     ///
     /// # Safety
     ///
     /// The caller must ensure that `ptr` is valid for reading and remains valid for the lifetime
     /// of the returned reference.
-    pub unsafe fn as_ref<'a>(ptr: *const bindings::cpumask) -> &'a Self {
+    pub unsafe fn from_raw<'a>(ptr: *const bindings::cpumask) -> &'a Self {
         // SAFETY: Guaranteed by the safety requirements of the function.
         //
         // INVARIANT: The caller ensures that `ptr` is valid for reading and remains valid for the
-- 
2.34.1

