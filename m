Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF84014AD;
	Tue, 25 Aug 2026 12:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660284; cv=none; b=UVgUTFGkVBGbIyIpFzyaURva6R0PZnWbpa+8ERIJc0Qbsmq/Dihef3RRyqOX5ORSPhAqYqfTc3nMXA3yc//SvFPJz6AdKj5d0XkBzuusYj0MUUcDXdBfMjnL3cmQYBQvPPcmguRJyHqGztn+fzhrg56+oe4JtMjx67rWYL7Vy2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660284; c=relaxed/simple;
	bh=Ow+PSvrJvkzOZQbgvD96IRHpJyfMq8vwkgdFvlk+0zM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcMuBCCis5/G1ELxXa1b4xhM9zERXWqKdLl5n6/X2jwXCpnL3FhtwGPV+m6kbAmAqH3lVPMecYnE6+mduIctZim2tJUWjoG8Ek1hATKKlqgUrUr2lee9cF1IO7O5dbKvLl9YpN3BXkGjR2M6FvYGiT6dwSFkzeDuqspzyCZnSu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnbMJqiR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnbMJqiR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E24E1F00A3D;
	Tue, 25 Aug 2026 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787660282;
	bh=3Lx00wwuYYyKdP28LMQfLYV9EDYOsQNPdQa6e0MEs4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MnbMJqiRKpxq+/ETDNHmmCC5z9s+8x6QULKFS5Ju6cNEVolHW318XlTCzABnzXjIy
	 tVOqKz1rY7potus21Cu/9DRfRzHYyhy4otdmBOX/wuvP/m5O/EObLBuJ/mP4tJLKbf
	 hrIX4yLNqvuILE1NN8gheZt9boMasD51+xf90zqz+nRavGt18ooDugRmcTi2S386Xz
	 ErMsmAxQTmFt34OFTSZ+E7I6lpbVd51qGf1PjFmLyoZNkWjjtzMREyXTpTmsFi6LBa
	 gfnvEl1DwP0VXzEotLnWtHf/HNg+dW4MJ03c6bCkdEXMmj1+vlrLZHQ0CyMeiL4XSc
	 nzx3FBZKCmeNA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 25 Aug 2026 14:16:35 +0200
Subject: [PATCH 4/6] rust: hrtimer: restrict expires() to exclusive access
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-expires-v2-v1-4-90411c6217c7@kernel.org>
References: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
In-Reply-To: <20260825-expires-v2-v1-0-90411c6217c7@kernel.org>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4618; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=5Is46ps7sgBCYIjJGYZl0Quf/W2LYFDIy/ef6mXE7Hg=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqjYe8jLQULOEI7xxCzta9iHRQ9wzF18FNTX3uR
 slKqd9LVlyJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCao2HvAAKCRD6UCkIqsW9
 0ICPD/45nHQmHvPMhidkLa0pteMJKVUdizssB9qYLx3otZQbOfrwKhOtQ4CA/BX/Dz0x3xRZd71
 uesTwMi31JgWZjOyFbkj4AWpE/zDsjmyATkaw4T6j95u1FOvHkYEqcR7ft7CPQNSBiKXRriZma3
 7FxKPf1DIdAm2pBEPVZg55ANWFVbOpIwRdBnsZ+lIsbbJ1eLjhj7PKqJq145yUw5OR0EBIFX5NG
 VidWmMUs8tDKT6NT4NqqXE+mmTq54sDwKMslvw0P3sYLQq5N1pNPeGpZDmEBT0CR0BruvwCSpgr
 fWH3esYnrRam5VskaaCT57XHxtbZCTe3/HAt1E0nDrH00cuYp9yvTIJr3oFytPmaXoSPGAcoD/C
 mvSL+3LNIJZX3qLdJMg2B8Qky5yGCoz6uh+f/pR43eTWx9Bsc0x1BusODkHtUCyPCInYfRAibwC
 MAZl4RCuSl6cweEpAYY+sXm9QlG3eMHbN8ISL2E1O+Yo69c+2hDh/YJ0ABp33NksAHQTg4+QCEf
 t971KPfmtU+/imF0qI30CEIWEOhGF2pxuHlngMAmSzpI5VvonCFx+yxWjnS8pPykn2J8bWv0gfu
 7E/cKQer9s7D/7SaAAPROe1DQUbK0QeITsUOkSKbd35L7XkTsI2WrhiMONV/SrOGpOTmD0EG6Ra
 Bb81TMSCoyzaKag==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

HrTimer::expires() read node.expires through a volatile load on a
shared reference. The read is unsynchronized: a concurrent start
operation rewrites the expiry under the timer base lock, and the
64-bit load can tear on 32-bit architectures. The volatile idiom
narrows the race but does not remove it.

Change expires() to take Pin<&mut Self>. Wherever an exclusive
reference to the timer is reachable, no start operation can run
concurrently: the timer handles own or borrow the containing object
exclusively for the box and pinned pointer types, and no exclusive
reference is reachable through an Arc. Route the read through
hrtimer_get_expires() via a helper instead of duplicating the field
access on the Rust side, and provide the unsafe expires_unchecked()
for contexts that can guarantee exclusive access by other means.

Reading the expiry from within the timer callback is served by the
expiry snapshot passed to HrTimerCallback::run(), so no callback
context accessor is needed.

Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Link: https://lore.kernel.org/r/20260813134834.1562995-4-tomo@flapping.org
[ Andreas - Reword commit message and rebase on expiry injection patches. ]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/time.c         |  6 ++++++
 rust/kernel/time/hrtimer.rs | 37 +++++++++++++++++++++++--------------
 2 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 32f4959704939..205a38839532a 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/delay.h>
+#include <linux/hrtimer.h>
 #include <linux/ktime.h>
 #include <linux/timekeeping.h>
 
@@ -38,3 +39,8 @@ __rust_helper void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
+
+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return hrtimer_get_expires(timer);
+}
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index e6570a6162035..bdb6aaa228396 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -567,27 +567,36 @@ pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
         self.forward(HrTimerInstant::<T>::now(), interval)
     }
 
+    /// Return the time expiry for this [`HrTimer`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must have exclusive access to `self`.
+    #[inline]
+    unsafe fn expires_unchecked(&self) -> HrTimerInstant<T>
+    where
+        T: HasHrTimer<T>,
+    {
+        // SAFETY:
+        // - The C API requirements for this function are fulfilled by our safety contract.
+        // - Timers cannot have negative `ktime_t` values as their expiration time.
+        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(Self::raw_get(self))) }
+    }
+
     /// Return the time expiry for this [`HrTimer`].
     ///
     /// This value should only be used as a snapshot, as the actual expiry time could change after
-    /// this function is called.
-    pub fn expires(&self) -> HrTimerInstant<T>
+    /// this function is called. To read the expiry from within the timer callback, use the value
+    /// passed to [`HrTimerCallback::run`] instead.
+    pub fn expires(self: Pin<&mut Self>) -> HrTimerInstant<T>
     where
         T: HasHrTimer<T>,
     {
-        // SAFETY: `self` is an immutable reference and thus always points to a valid `HrTimer`.
-        let c_timer_ptr = unsafe { HrTimer::raw_get(self) };
+        // SAFETY: `expires_unchecked` does not move `Self`.
+        let this = unsafe { self.get_unchecked_mut() };
 
-        // SAFETY:
-        // - Timers cannot have negative ktime_t values as their expiration time.
-        // - There's no actual locking here, a racy read is fine and expected
-        unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
-        }
+        // SAFETY: By existence of `Pin<&mut Self>`, we have exclusive access to `Self`.
+        unsafe { this.expires_unchecked() }
     }
 }
 

-- 
2.51.2


