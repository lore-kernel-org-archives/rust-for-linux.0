Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603653403E3;
	Wed, 23 Sep 2026 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188385; cv=none; b=hJ0X3UxrzEh1NtShbkKu9l6m4im7tU5OKpvwagdpwZqGhIfOEzb9CWLwv3ry1Cucjgj6QHVJ311TzT0RkWT2Pw8J+9wSg3s5tDqFaHG06dHiluzBpwS/KkewGYiw0/2yqFS9mDUsCIK2DMEOjpGaOc6z+eEeWm6xN3x23N6qh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188385; c=relaxed/simple;
	bh=GEAi4xeAEC51Fc8Gn4Dcl4ApqKGP/X6rOTK4lpnrAKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SISsyYHOz4Y/v+4v3lB8Ofxz14q/kYbyElPRmBea/Nlp6LObLFc4Cs++m+lJWGEEZULguqVd8ATdWuESJAg2aBA463G4LtFSGVWYbRAfIeM5o2VW2mvTjqX+/Rvp+/D4vOKtgyt/S6YRYqX8JIjdYyM1r5pevbx8rcmsr8ZLA0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpazltQB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpazltQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD8D1F000FF;
	Wed, 23 Sep 2026 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790188383;
	bh=Enjrv+zX99iRDKabfV95D0AkoKz5ER3qyGx4elVKSDk=;
	h=From:Date:Subject:To:Cc;
	b=HpazltQBD/yfYyjLHV8T1J/Y2isUm6P+9KikSrfjPZKikkXm51ZRfdRFXE7Xm+Kz+
	 9TJc9VMFOWZI2Sj9fpVv24cWuJVj9rSB+0es2aLjzhICweLjm73r5VcsBCts/VsrAx
	 ScH8UA80SES3eIp74jS3q0e3wbZ9H1AFaSY+j2WJ3oCu5YzzSOXz5uXi58Brs6KIml
	 Ftx+orgeHKmhWRKxabiVZ/n6PejxC47d9RYVkjieUKZo2OkzZqLjmLTuhLs29THx94
	 aCvvUZGH8SZF7ueHIUQ+xlWml3R97W8cb1U95v0drMB0RcPMiH6b0T3AhFCMptYAB7
	 38+GhRi+0vE+w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 23 Sep 2026 20:32:50 +0200
Subject: [PATCH] rust: sync: fix safety comment for `Arc::from_raw`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-aref-from-raw-safety-v1-1-e34f0da04145@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFEbtGoC/yXMQQ6CQAyF4auQrm2CJWHQqxgXBTpaE8G0A2gId
 2fU5Ze896/gYioO52IFk1ldxyHjeCigu/NwE9Q+G6ikujxRhWwSMdr4ROMFnaOkD4aGAzVVTSE
 y5Osrj/T9y16uf/vUPqRL3xZs2w5l2W0seAAAAA==
X-Change-ID: 20260923-aref-from-raw-safety-78a7283627fa
To: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=GEAi4xeAEC51Fc8Gn4Dcl4ApqKGP/X6rOTK4lpnrAKM=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqtBtSPY1FWi8HAT5LGSV4NdS9zTJNM62RNoYY7
 A1y2ml66CaJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCarQbUgAKCRD6UCkIqsW9
 0LAID/9bdR8MkOceKQ8wcu/m6/ODge7ztHN2ZRnRObivAuWgB+1J6q+fRiGZLitVByTQJIM4P+O
 mHBOKGBcADehWjom4FkGhiL79FYglzSTHMb3OgAqwC7TLsxJoeXppVfD1BpmBlgUf84uwynln1n
 ZpNxN6AtA1YyKwDusgv5OZEFQjKoMWFG8JTtuG8eW0rJvtBsjX/zN/2ML7awQr4PEthJ+kIPATA
 qkon8GnGKhYX5WXB91GQr+Xl9s3i9S1JBDV+7vAuEsM/jj8NLyQF3llvKFHbQfeoeBzYj15PIPm
 ezwS7DK4Y39KKY4cQ+yA6b89REmSlT8Z8PsGcBrsnpb0VGZpCV8uFHwEV+d+rlrhiIRCj/dGubd
 KOVQJq+7Ja7+vOHjYskI/aFxr37WBmjDk2EC5HQlkLZMKIaBgUHaMqyCdqvq3juPw8Zvso5GGtQ
 eINB+mK7hgRJEMlHITeLDf/fBTSt1LzieHsHHImVN/UldnhOJoJlwkYhSnSP5drr5Q92EXOaWXv
 cdMO44qFOPTFr22CeLQLZ9Va7QwUqGPfWRKJMafLA9XsgnUyPq7aERsp6Aa5hQHbejB3/MAkwX6
 UT4wuYQVoAk7NapCxHZYGtwEn5UIX1/TYEOALUq3LE21R3LqU+ZHs/vDGCMWudQjF6CUC1PPUAq
 xHiZ0QnG0ktXNDg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`Arc::from_raw` does not require `T: Send`. But if `Arc::from_raw` was
executed on a different thread than `Arc::into_raw`, `T` must implement
`Send` for the API to be sound. If this is not the case, ownership of `T`
may be sent across a thread boundary even if `T: !Send`.

Augment safety comment for `Arc::from_raw` to close this gap.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/arc.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 8ae0fe6f19ec..06838ecf633c 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -276,6 +276,9 @@ pub fn as_ptr(this: &Self) -> *const T {
     ///
     /// `ptr` must have been returned by a previous call to [`Arc::into_raw`]. Additionally, it
     /// must not be called more than once for each previous call to [`Arc::into_raw`].
+    ///
+    /// If [`Arc::into_raw`] was executed on a different thread than the one executing
+    /// [`Arc::from_raw`], `T` must implement [`Send`].
     pub unsafe fn from_raw(ptr: *const T) -> Self {
         // SAFETY: The caller promises that this pointer originates from a call to `into_raw` on an
         // `Arc` that is still valid.

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260923-aref-from-raw-safety-78a7283627fa

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


