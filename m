Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893401;
	b=vfF/YlZBbSMfyWV75wXaCb1QRhaoJaVRsJTif3sKOBbsbM6lqFzG7gi0j9pkxC5f7MK5
	 7UPMWcU3lXSkS7IG11WOoPl15VuTmiGsIAixLywjjFDWNWX7nSRGOSlURwYbODy8jIARE
	 1d8ny7NYtLLKQMHr10e1Xwg9Ap6mE79kNn5GngJ2lEarUEqH4Bie8i+KRrI3kGrrziQ7X
	 yvl+yI/ngb/Mv32XgtVMcSqk8ompNrDnbYe09P0FeZ1cRmN3w++ZP46BEWmiTppjFOJ+h
	 hBKq+XtwZ4DEUMAvx6ckcRVPoVvgYEd982nBVa+wmmbvM212HiY9N3/nKfFwrl7GElA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893401;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZZ30tj2pRrX2TSx9hx+y3zY66lWWQvzA4rqP8T/5bwo=;
	b=vJRrsIaKIWxDpkDRex9cFI+dLnXDuqcc8PYXUeuTx+j7uk0elrobRn6vyVP6vitnVztJ
	 OSLTU4tzyfs5k7yTd+P/qMb7+FjWdYEHV0fsKbnJKfWnp7dFTme+pXlfacWT5wfQBqddp
	 jRTJQSUUYEQxFcHjUjZi+kzl76z59wQSHvJx+awjV3gfOKn7We8TEMz1Fp18vUEkMWq32
	 sDLUG1+dV6lpZKZaShzwRkU4CuiwM11C5CTh/dQfbTSd8oq51sl99mZNNAgliem3qzpk+
	 hamo2OLXGMIu2G5dsvdcWb6ui7ANq/zOwsM2xqg55Zee2Bg7jXmC5ua8gc7utX6AI+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emol58vL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2B8606D830;
	Thu,  5 Nov 2026 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=emol58vL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718F21F000C1;
	Thu,  5 Nov 2026 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893400;
	bh=ZZ30tj2pRrX2TSx9hx+y3zY66lWWQvzA4rqP8T/5bwo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=emol58vLxmuU05NVTBa+dw/u7YLWB3lUJnnwNeMsIC9DjbmhlYrNMp9faLAdwecS6
	 2FK61Wc2T0l+Fyi/AAoBGWVzNDHau/78khAym1VqrFdkeY1BSrZtlXeS4okprKzeQc
	 n7Tl6bafE7Ex6sZOa1eZtJvrg2qylLnfQbmdqCUGeA2sIrd8QFc3bmLDZAYI8/2eDk
	 pRukuRgjh52ViQle+A0H1qps5vpJkhNaWfEh6n7kDoEZ2dvoiY5AtvGf7VnJ13pNGD
	 eSw3Zx+THe/ON+cyRQ3U40w6byd2gZfgSziBl0hcHGw/XurYk9Swh9BxNcFyayxH1R
	 87STp64t5qhjg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 05 Nov 2026 16:42:44 +0100
Subject: [PATCH v3 1/2] rust: impl_flags: add conversion functions
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-impl-flags-additions-v3-1-5b17c01c2b15@kernel.org>
References: <20261105-impl-flags-additions-v3-0-5b17c01c2b15@kernel.org>
In-Reply-To: <20261105-impl-flags-additions-v3-0-5b17c01c2b15@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3204; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=9iyGL5fNcH/TV1QXaAh95ETqf6dnZuNL8Wwvg0cVRW4=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq7KP/yZD3vXgqIFKq7I/KVPAln5q+4fSmNg7gS
 XyXBeV+1vSJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauyj/wAKCRD6UCkIqsW9
 0JPoD/99yyIMZ6YfoJx4PjrnuIdp3MXQY/wqWsADpniOGclfkw/Id5NakOn6s5HF3UVh4TLKlnH
 0NfF70PR46pVfbZu+I6xL6MJWYqFNhX0svjtY6Ck65UuV5WNy8Bq3510kbhxj4L6bQKQ9OW+N1t
 1sEeuMnkXPbu3EQCkJrSCACv0aQeEoXzwub1lS0nmB7tEwzO2vrsT13mSeZbyFE763UiU1w+KMn
 z/v2tg1dqcd2TRb8ETmtVjCckzwASGLZKwFFcZatzllc9aOhwndklDe0ajDgJLxVVGn3f9Ha4sd
 DWrKO+GhBu/CGXDko2VTN+kysmsw+31u5LgwuxQ1nYHM4kdsaZ5mgV4wUnRxygkmzB8qqUKRNnb
 9nJva9eHeDo4T/gK/1Zev6sFNM4+iRWSFM2lkfvNlAW9spV9c7aYBE+PJ0mD7VGkf/9uo8hCZ/y
 WxnvFyWlNagowx2If/+fQ+4MMaHRpSDRdsbQdRLQFMVNYcZ+hEorgyax8Onch5Df2P4f5pSuOrH
 HLjcMUy0kINXBvbCd9Lqow91QcYat7+DijI/lFXMB6xg8RHfdEK+CaRTFmxtBDMFGEPBazYjLQK
 HIuikOkGHtHvUBgkR0eTANFO/uVz2ugkfcg+SPJ7kFjyJoAHVfNXqpvRWTH5tHabpO3NzUWCpJO
 DgfPuwBhIzIAZ4Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add two conversion functions to the `impl_flags!` macro:

 - A `From<_>` implementation to convert from the flag value enum to
   underlying type.

 - A `TryFrom<_>` implementation to convert from the underlying
   representation to flag container type.

Drop the hand-written `TryFrom<u32> for VmMapFlags` in tyr, which now
conflicts with the implementation generated by `impl_flags!`. The two are
equivalent.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 drivers/gpu/drm/tyr/vm.rs | 13 -------------
 rust/kernel/impl_flags.rs | 31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index 1dd11b2b1253..0d6e841a31ed 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -141,19 +141,6 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-impl TryFrom<u32> for VmMapFlags {
-    type Error = Error;
-
-    fn try_from(value: u32) -> Result<Self, Self::Error> {
-        let valid = VmFlag::Readonly as u32 | VmFlag::Noexec as u32 | VmFlag::Uncached as u32;
-
-        if value & !valid != 0 {
-            return Err(EINVAL);
-        }
-        Ok(Self(value))
-    }
-}
-
 /// Arguments for a virtual memory map operation.
 struct VmMapArgs<'drm> {
     /// Access permissions and caching behavior for the mapping.
diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index 6051487f6e28..052759b8038d 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -73,6 +73,17 @@
 /// // useful for passing the value to a C API.
 /// let raw: u32 = read_only.bits();
 /// assert_eq!(raw, Permission::Read as u32);
+///
+/// // Convert a single flag value to its underlying integer representation.
+/// let raw_read: u32 = Permission::Read.into();
+/// assert_eq!(raw_read, Permission::Read as u32);
+///
+/// // Construct a `Permissions` value from a raw integer. `TryFrom` rejects
+/// // integers whose set bits do not all correspond to declared flags.
+/// let parsed = Permissions::try_from(raw_read | Permission::Write as u32).unwrap();
+/// assert!(parsed.contains(Permission::Read));
+/// assert!(parsed.contains(Permission::Write));
+/// assert!(Permissions::try_from(1 << 7).is_err());
 /// ```
 #[macro_export]
 macro_rules! impl_flags {
@@ -115,6 +126,26 @@ fn from(value: $flags) -> Self {
             }
         }
 
+        impl ::core::convert::From<$flag> for $ty {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                value as Self
+            }
+        }
+
+        impl ::core::convert::TryFrom<$ty> for $flags {
+            type Error = ::kernel::error::Error;
+
+            #[inline]
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                if value & !Self::all_bits() != 0 {
+                    return Err(::kernel::error::code::EINVAL);
+                }
+
+                Ok(Self(value))
+            }
+        }
+
         impl ::core::ops::BitOr for $flags {
             type Output = Self;
             #[inline]

-- 
2.54.0


