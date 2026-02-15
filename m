Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776F285041;
	Sun, 15 Feb 2026 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187007; cv=none; b=PyT35mV+oxr/h0ORbFW40OZfWECx4ob7Ce6ORHUmyQa7o4UC59zWtktXrCMtUH6G9QFnp7kqk7T3ZZEReHguHJvJdcgZB9zLX058P17G/KODgHRVM9ZrBW8Y5yqe0b5G8CSayEfWaoodlwRKO0rl8K+bfQuza+KrdmVzV73RhhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187007; c=relaxed/simple;
	bh=IAegEq6wvSTCSwwppXsh49sbejfMYcE9NVPrJzZfXzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpA+u7chH07iuls0kCKbF8ov6zON7+lU4yRdLSEf5/yvVENZF3YiGWg6HO2OqMUj6JT9x4dpIVvpG7yHk+odl6MwXf8aba3uPOHCz8/oN0Ul3FeyrsJ6Z5k17YcNI4jzvlxDkbmKukMpIExbWoEFxPHQakmmnp4wvmgwSQZry0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBGiEjvO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBGiEjvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF55FC4CEF7;
	Sun, 15 Feb 2026 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187007;
	bh=IAegEq6wvSTCSwwppXsh49sbejfMYcE9NVPrJzZfXzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JBGiEjvO+fffztXBWoSDnzUGonTFKPwH6aj9neKV9dxerWbiS9QeSxj+K5x/juGJt
	 vu/dD5ivWUCyyzhPmSQ9wJkM1P99PxCuI2WH4zsLOCJWvcO3Z1GaJmZEInLr3/+CC9
	 g/NrayrkC5VUEQLhZgRA7aHGeQyA52ZcPRylBKV6C9ukPpGwnmZMiWj34jKlY2kx4N
	 hkbI+ny9/IvVZ1KIf3v7XVPn0FHGauoaZZ1QmyG2aoTGrjHOuqn/3/vb/Oju6fcKsY
	 UjG+CpWyfteyJZ+co//3CTAu9QKCgoao3r82gtt6L1y8TjRwnOgRq/5iqJUZYdHLsy
	 bMbxSdQZCNvsw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:22:57 +0100
Subject: [PATCH 1/2] rust: impl_flags: add conversion functions
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-impl-flags-additions-v1-1-6538c8fb841c@kernel.org>
References: <20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org>
In-Reply-To: <20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=IAegEq6wvSTCSwwppXsh49sbejfMYcE9NVPrJzZfXzE=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkisxOJnInn1MyxUq7hWHWQlqrpwdquQpHBucA
 fQi0eG6CGmJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIrMQAKCRDhuBo+eShj
 d/DGEACq4/wtWuhPd+GImXZdPujgaJLtPTK2J0qjos8ZVR3cj1UN7vE/CmZrKPCF8xO5ME+fTXn
 HWWm8WK/91OHnYoZ24cjDdCbYhi2pTP5HZzNcHMHcyKYirxoEhvKyTz5+Nt21P9Lw0dqGRMfc5t
 7dV05EZ5BkC0za47vSr+9qiSrj8eG24G+VWluqcgd9rZYj7ElQ5dMNoHTYQ9l7Z+7h/zuxAC+JR
 EFmNSfiE9kScpafQ2xtFnsry/v2hTbauUjyZYuh6Ly++QvxLOGCUXwmm1+/YiKpyaTn+SzUZAlZ
 t1g1nhCsncLqerXsGnkmDQEWEjxeWnwsX965YlqNTk+E4b1EM5yZxKmEFY/4GaVIAUe9u6/0gxX
 v7vnwM7VLudi2aMW3EgruBBIHAccacNLJwOUU4ReMg4C3DOC47+C9PLsAtJbs5rNPwm9IsiP2bn
 b3LzbqH92xf+rWaucyuS0szY99uXv0oBFJPVZnhvRjJS2qtfLRMI9VSrXssrVrN1vAjPfeWU2uQ
 fJDQm7awBwtN0grcHWUx4MmzJDCXDvaQg5LP0I8zVWPIGDM2KnN/BJBFxetlwDHAU2TVR/S35oQ
 IlXeP2F7M+XqLpc8xewYaEIw5qzrrC8bvdGvhxh3t5CS0b2ap3PBSvtbsh0V7K6Gre8ajjiC9Kr
 K28mvIlkghRzfPA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add two conversion functions to the `impl_flags!` macro:

 - A `From<_>` implementation to convert from the flag value enum to
   underlying type.

 - A `TryFrom<_> implementation to convert from the underlying
   representation to flag container type.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/impl_flags.rs | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index 9160e8ce2e126..f34ecbe870d80 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -102,6 +102,26 @@ fn from(value: $flags) -> Self {
             }
         }
 
+        impl ::core::convert::From<$flag> for $ty {
+            #[inline]
+            fn from(value: $flag) -> Self {
+                // SAFETY: All `$flag` values are valid for use as `$ty`.
+                unsafe { core::mem::transmute::<$flag, $ty>(value) }
+            }
+        }
+
+        impl ::core::convert::TryFrom<$ty> for $flags {
+            type Error = ::kernel::error::Error;
+
+            fn try_from(value: $ty) -> Result<Self, Self::Error> {
+                match value & !$flags::all_bits() == 0 {
+                    // SAFETY: We checked above that `value` is a valid bit pattern for `$flags`.
+                    true => Ok(unsafe {::core::mem::transmute::<$ty, $flags>(value)}),
+                    false => Err(::kernel::error::code::EINVAL),
+                }
+            }
+        }
+
         impl ::core::ops::BitOr for $flags {
             type Output = Self;
             #[inline]

-- 
2.51.2


