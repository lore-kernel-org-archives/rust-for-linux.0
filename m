Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5B42848BE;
	Sun, 15 Feb 2026 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187004; cv=none; b=GkE19Qr1rbDtJdIF5gmZPtuH9b60rpmvaQ8kBYt+Ik0E08LyzM76SRUxLGBchW9zLzupu9WScgNPj7Miwklmw2Hmq0iMoMzexls5pwhV3q6ygVtE7qQI6OvsTWjnnCI0K1UR8/DtXwBzw4RTtKbqXph+YFZLeX2fuYXByJCCUJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187004; c=relaxed/simple;
	bh=R2uBJkBCqv6QYfYB1lgGca4GOppibkTzmzxHVTl/yQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xj7SyHdhSA7zO5/Z4WqE2jzQP8qNaeztRnaB3tX5zFF6ASU4uW5clX94pZplY499n2yRqTW4dwlH16F3tP1aJLl5Oh04jggdEkBuB8hTjtObxdgK6oQn1JOAXAFozA3GISSFFBTwtf3LBZnwQc2Yi492QLhkjlmibQY7JYKa1JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3ADt1pp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3ADt1pp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB0BC4CEF7;
	Sun, 15 Feb 2026 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187004;
	bh=R2uBJkBCqv6QYfYB1lgGca4GOppibkTzmzxHVTl/yQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P3ADt1ppvGIVTaiFKPB1lGQ8nTGCLNQNtwtGYugOdwP9fJGJnzpH80eDU23aLtv1j
	 8y+u+yscHbyG9WnqUVPpzHD6JG3jSpkm1tG+4xkIeGPU+40llNCmOgKXvoS02mmScL
	 JhDS/QJYtgMFKL56weu8ibS42EAcK93V/TtkWU4Mu5x7eUF0WZBYAt6VprLRpdRyQh
	 FljkqMBa19iMz5qmwbP8dhDW2ro5CiQAhY8wYrOXXhuDmXn4QxWWQh8HsrkLuO6h+h
	 CUsMSi3VTUJr+xK5GjpIJ/tBwLvcH/0H4nDeBQNDSB7nBm8r3xMArbDDq35FlGTm0T
	 w+mUuqjWwHYqQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:22:58 +0100
Subject: [PATCH 2/2] rust: impl_flags: add bitwise operations with the
 underlying type
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-impl-flags-additions-v1-2-6538c8fb841c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=R2uBJkBCqv6QYfYB1lgGca4GOppibkTzmzxHVTl/yQA=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkisy9YGCZzf/VR2auOHx03FR1C1VD032nrbx4
 5QDTnqweX+JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIrMgAKCRDhuBo+eShj
 d39dEAC1PelNl8f3/hHTGHVR8WdfBubupCdUKQq70leeXMCOuUtVgZYFqx3vKHsb5V3ZRrsAZil
 BJ22sZRasvsxTA5ImXmjEB5cZWnyU9BkKeVoH/wRTD/qs15/53/62jCMQgI8nLqAPUAdz+h8Nvy
 nKmC9ga5W2nXMU5Zi00LRyLaTLR9ZrqwLni5Noe+0PpIqmPUhUGbGipFdUvkFaweElqZx1dfyI8
 f3R0apseOzP7f6RUJROqaYG79VOHAy5g0HeP094fZMdn5j+VGze+emMZBZRPnaP+T2KEayfVPkq
 vQGjt6gIkm46Isbgj8+HgIAJKb6+HFaha5xYpxAc6RErCGScdU8FLID0kW3xrPoCbH6kmyZAcPw
 fe9qt3rcNO+VaAZl7/emirm4W8TSuNkpQCBaiOGNVl7d5NN2EMdlSP1fH8/AetB0nU3zTTKXvqA
 AHRV/ucdccn8ZJrICUKDOhN99wY/cKX2CEDAOV2GKN+sz4pcHODGBgzGUxQiV7LQNap6wNg+ytk
 crwamHsN4E9XsmAq056fv6VkCMLFVG6Bt92VZJrA46D486RO8aTdAKUjvHs9r2NJXxyNp/lu9dC
 pIOItfXaV9f3E9yWRg2lTfKa0KbS5ItvRi92PFjaOxGpSsorSY15mQQCECsx2UH3nsj0rII0QJa
 ZvMmaqK9A3b2NQA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add bitwise or operations between the flag value enum and the underlying
type. This is useful when manipulating flags from C API without round
tripping into the Rust flag container type:

  let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
  ...
  if self.write_cache {
      lim.features |= request::Feature::WriteCache;
  }

The above code would be needlessly verbose without this direct assignment
option.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/impl_flags.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index f34ecbe870d80..f829be815885e 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -245,6 +245,22 @@ fn bitxor(self, rhs: $flag) -> Self::Output {
             }
         }
 
+        impl ::core::ops::BitOr<$flag> for $ty {
+            type Output = Self;
+
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | <$flag as Into<Self>>::into(rhs)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flag> for $ty {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self = *self | <$flag as Into<Self>>::into(rhs)
+            }
+        }
+
         impl $flags {
             /// Returns an empty instance of `type` where no flags are set.
             #[inline]

-- 
2.51.2


