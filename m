Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706655;
	b=ru8SGqbMAxBJsC4GijotoebhZ5rCRQvMzad10wBFbohaxhJsWLtEmybBxDBun14GPPav
	 3nUs5ZlocW4y3okaKNLw6k+z4a9HRLqcYSETd2FJ9PqIH3SRsgWQicQjOP/NCqrefUdJh
	 1gQrbrVX8GUxFPY/znWQ+nF+xtj5n9So4uzF4nO8cKVTCLMQcMu41viS82e/xnzE1Y7we
	 CP6jozFvf4F6y7XbtPdAIp+fUCUE5utFP4fm2sy8r9qSTr3MkEm2sqj6B80kOyh9IgVaa
	 kQ9d2L+AFqYIG0TID1uJ+PL0wHWMQ0+PGTbhcDJ5kYf0f9HjvMM3PbX7SSsRc2jheeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706655;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JVZ7ZPe0mun5HPLz14I9dlYljWHoQNvQgiP47jOr2E0=;
	b=Ko+gsFraL6SP8xglwMriBfZOX5dkqXcso3ledXeHTgAu2KPdgU8Vy/N/KpgyHCAxfWR0
	 Yd9m09lDkaiLtVnsgWd/bxpu4yYoccpPOtWb+MtaMZxy3S/j58Sgn9chyIN6TG3Jljkor
	 liJQa96mQbQBuXjWr3cO4Xzm2a23IoheX8bMdfT+C8nQrb6Ufg/OI3fw7qXY28lYuc4mN
	 9yR6MMq72hliWgeSMOM/0T+XtiA9g0wUnhg15h6nNSW2VaPKWcodpJrmh09LueGqXK/aK
	 WwFv5V95VgGfxbrA7GBr/m1SMNYiU6r07mZnos49EJSwbnJItdiD+FzMCw2LEkAMuyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENnxHu7q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685C2606EE99;
	Tue,  3 Nov 2026 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENnxHu7q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793706655;
	b=JaITYJgMfHkuGRYUPRg/47yrE4HfQ1tscLs0daMlAwtcqT7W9K/mhnt7eBJ4kYP/SUhU
	 FnX2AX07N2UTY9N7dx09GOtFOpMS8yHh9vHgAPgsOU4Gmz03Ldd+2A1FIA0l4EaYekYUF
	 qDzz44XPGnXmIrYqTRcBe/s0JamFXrN9TGrudoIt3uui7N9FhJKakoUVV+sG7p4XTSjym
	 MbFEVcefJeqHA5eSscVslq8xxBGyhO3W+vY9OR2u+18wYMY5lvtk0TbvNuHYKtpZX2V1L
	 wAqMYcffqrNm3tN/bz3mKtMX9my4N8I2c51WKq3O4qGxyyJe8WZcBrW/jYH6roZZpEA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793706655;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JVZ7ZPe0mun5HPLz14I9dlYljWHoQNvQgiP47jOr2E0=;
	b=S6UFZMHpRtgZPgtNXxzJOEYWZMULJvtn1Fbl7mdTTYIkhTg22nqhbW3a9Qvu00rFg3So
	 RRKP6cij9psj+n8z/Azyfi98FOAbBaTPP3nWX/vhMoTfau9GQ/mC9QyvtT1HrLfWjIvfd
	 tFc/aHsCFBc+HWWiYDXfrEqfvpYiBFdny0a6ysC6uskUTkpUSGHkk4tdA1oTEJchazYUC
	 xg3HW68R5dUGMLxFrU4Ka4OZ/lJVIemmXDWR/2eSOxrTcr2Sq8xvTYSbc9leXkaJBHDmv
	 ljmxhday9kIuYaGpO0mVERXosRnd0GXL8srtEiwf3+R8GH0gjU9hStlXqpbgW1sYVxQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 677EC1F000C1;
	Tue,  3 Nov 2026 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706655;
	bh=JVZ7ZPe0mun5HPLz14I9dlYljWHoQNvQgiP47jOr2E0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ENnxHu7qffUAIukvdpgDwFYtpuuHeyEkUrABB4I9URZSjOjXBwLDxwJ0dLnyQseTe
	 Y3CteUsEzq0lT/BDXVY36Rv/PONvTFyMiRPH6vTo/r1XiYc+DkyuZFYR0tyaeHXH2C
	 csfY0N1rmoknw5nHKQqluhlGg48GM7uloki/2C5XZnCRoH+ndm60d5FUabG4L71ooa
	 F7ERklaX/QbjDlGHqi5CUwV++U7QjltIg/p1ewgmhXQtcTgQ+/GRBhE4t0c3mnnpj6
	 c48r7Klphu1XKgKLBmxqrKpkSHXjnj4YD3XQrNjgidTVWtoVix2zBL09O0lBlfZq+R
	 tHoSQ8LENTjjg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D7E6546903;
	Tue,  3 Nov 2026 11:50:53 +0000 (UTC)
From: Peder Bergan via B4 Relay <devnull+peder.bergan.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 12:50:54 +0100
Subject: [PATCH v3] rust: alloc: test drop behavior of Vec::drain_all
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
Message-Id: <20261103-test-drain-all-drop-v3-1-5f936d67b099@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ3K6WoC/12PTW+DMAyG/0rFeZkIHSDtNOjopnYthe6wD1VTS
 F2S8RGW0AKq+O9L2G0Xy+9r+7F9tRRIDsq6n10tCReuuKi1mN/MLMpInQPiR60tx3Y8jO05akG
 16CgJrxEpS52JBgHGbnaXYYJd29KTjYQT7yfq5+FPq3P2DbQ1KNOREQUok6SmzFiaJCiqoW9N8
 SRFhVomgUyrF8GW//hOvV2+rNnQicddWhWw2ncFS4IF+YDQ2XNRiO41jjziyTjsHirCy9t8ilR
 UBsq4aoUcpkcvjrlMg9fPHUPRV+CHDRY7d/de5JHnMGbT1SZJz3288Ya3p6UfhzhJ7ZAl/8GHc
 Rx/AStyP+VEAQAA
X-Change-ID: 20261103-test-drain-all-drop-e115b4b1a150
To: dakr@kernel.org, aliceryhl@google.com
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com, 
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
 tmgross@umich.edu, daniel.almeida@collabora.com, tamird@kernel.org, 
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Peder Bergan <peder.bergan@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793706653; l=5159;
 i=peder.bergan@gmail.com; s=kernel-contributions;
 h=from:subject:message-id;
 bh=wr/rttULwHjMnmBYWzKteJlebu8bZItM0swWuvHRT9c=;
 b=5p3SMMkQOKo0XCI42eM0AUc1B3PVKIfyk2qbx17Q94TNLlbypZ8ylbFv9THdeHN9xFxxDavTZ
 +2knCtYHWwgAfnROMLyd8bXqluwloB+z4+TcIoTpnILDRDu41gQnFO6
X-Developer-Key: i=peder.bergan@gmail.com; a=ed25519;
 pk=39790pn1YZCulHBoUG1uiQI1Hm01EvhBEa2zVrS/yN0=
X-Endpoint-Received: by B4 Relay for
 peder.bergan@gmail.com/kernel-contributions with auth_id=1395
X-Original-From: Peder Bergan <peder.bergan@gmail.com>
Reply-To: peder.bergan@gmail.com
Content-Transfer-Encoding: 7bit

From: Peder Bergan <peder.bergan@gmail.com>

The drain_all example consumes the entire iterator and uses integers, so
it cannot detect missing drops of unconsumed values or premature drops
of values yielded to the caller.

Add KUnit tests with per-element drop counters for partially consumed,
unconsumed and exhausted drains, plus an empty-vector case. Keep a
yielded value alive after both the drain and vector are dropped to check
that its ownership stays with the caller. Also check that draining
empties the vector without changing its capacity.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
v3:
- Remove the repeated commit summary from the submission notes.
- Keep the base in git format-patch's machine-readable base-commit footer.
- Restore the original comment instead of changing it for mail transport.
- Send with b4 through the kernel.org web endpoint.

v2:
- Split a long test comment to avoid mail transport line wrapping.

Based on alloc-next. The original v1 test source is restored exactly.

Previous revision:
https://lore.kernel.org/rust-for-linux/CAKHwh-E_A7Bp1oP5PYkgE62hh0cJMQRuxOM6yXGF7OB1QR0BhQ@mail.gmail.com/

Validation on x86_64 under QEMU:

- The original rust_kvec suite passed before the change.
- All nine tests passed with the change, including a CLIPPY=1 build.
- Making DrainAll::drop temporarily empty caused exactly the partial and
  unconsumed tests to fail. Restoring it returned the suite to passing.

The tests used Rust 1.99.1, LLVM 23.1.4, bindgen 0.73.2 and QEMU 11.1.3.
The minimal configuration has an existing unused-function warning in
io/resource.rs, also seen before this change.

OpenAI Codex assisted with coding and testing this issue.
The requested work was to test Vec::drain_all ownership and destruction,
validate the tests under QEMU, and prove that they detect skipped
destruction.
---
 rust/kernel/alloc/kvec.rs | 88 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da..fe113c7ff 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1540,6 +1540,94 @@ fn drop(&mut self) {
 mod tests {
     use super::*;
     use crate::prelude::*;
+    use core::cell::Cell;
+
+    struct DropSpy<'a>(&'a Cell<usize>);
+
+    impl Drop for DropSpy<'_> {
+        fn drop(&mut self) {
+            self.0.set(self.0.get() + 1);
+        }
+    }
+
+    #[test]
+    fn test_kvec_drain_all_partial() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = KVec::new();
+        for counter in &drops {
+            v.push(DropSpy(counter), GFP_KERNEL)?;
+        }
+        let capacity = v.capacity();
+
+        let mut drain = v.drain_all();
+        let first = drain.next().ok_or(EINVAL)?;
+        drop(drain);
+
+        // The caller owns the yielded value, while the drain drops the remaining values.
+        assert_eq!(drops.each_ref().map(Cell::get), [0, 1, 1]);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [0, 1, 1]);
+
+        drop(first);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_drain_all_unconsumed() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = KVec::new();
+        for counter in &drops {
+            v.push(DropSpy(counter), GFP_KERNEL)?;
+        }
+        let capacity = v.capacity();
+
+        drop(v.drain_all());
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_drain_all_consumed() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = KVec::new();
+        for counter in &drops {
+            v.push(DropSpy(counter), GFP_KERNEL)?;
+        }
+        let capacity = v.capacity();
+
+        let mut drain = v.drain_all();
+        for value in drain.by_ref() {
+            drop(value);
+        }
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        drop(drain);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_drain_all_empty() {
+        let mut v = KVec::<DropSpy<'_>>::new();
+        let capacity = v.capacity();
+        let mut drain = v.drain_all();
+        assert!(drain.next().is_none());
+        drop(drain);
+        assert!(v.is_empty());
+        assert_eq!(v.capacity(), capacity);
+    }
 
     #[test]
     fn test_kvec_retain() {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-test-drain-all-drop-e115b4b1a150

Best regards,
--  
Peder Bergan <peder.bergan@gmail.com>


