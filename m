Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CA117B506;
	Sun, 15 Feb 2026 20:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187777; cv=none; b=Tdw1hxdTZEJ2NmmayYdwVGxtyOmkZgx8Vmuarq5orfMJ9WE7YaGSZiITulXQ8eN1cLOz8U1p0zEzOWn0kE8mMKX7ijxvohd3kxiUa0CMMF0YmhQ0YV6a0ZpnhMWtxgExZ1RiVGk7HqvuMLcEVxuo1l5CTvZGY33eenaZ+62iaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187777; c=relaxed/simple;
	bh=gAjR4xG4j4gdsNCib+JKea+XaFFjWDaPY0s4vAw7GUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KagYn1bqLo21VR7hpM1+X4i34hSr0y2TAAg+V7fO73o+E/GzU2jOpCkukQmkKTYa6j0eFdBuf4WZ0RlALQusjj/OutK55nDofWtlW3rwmjm1lOn+H9vnMTcaxgE44kKJBo7b+bKlHgyOQWK/Zs39ym8fGiqZTBb6LjaByRO1Frc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fH+srEyg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fH+srEyg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB95C4CEF7;
	Sun, 15 Feb 2026 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187776;
	bh=gAjR4xG4j4gdsNCib+JKea+XaFFjWDaPY0s4vAw7GUI=;
	h=From:Date:Subject:To:Cc:From;
	b=fH+srEygUDXxpnrvdpH/9XVhdGqIyddJiN7+8YqV/Yn8Z3JCffqrsl5unJnemaIwK
	 mcLrzCDwrK0bXl60JVXf05L43I9MaDog0wrvx8qjaqQbh82PibxwgHWVZ1Vtw0ffL1
	 EkGW4ZmFD4J+h9mz1drzN2LXW+mbLsnW0F+ke9eBaggQoA0T1mncQDn0usCvCZtyU1
	 Yzd5NheJsLvKbNDZcaAajeK82O0xpFStdd/mAs02uKnlCEJ1IbBnPnAuUmGQ4nEYLg
	 PBwFwzc0cC/iFAu0hqY0d7wpTnpiuvPN/JkUZVqYXWrr4TT9G/1Bp6THbOHV0shm7l
	 SymHg4DjudjHQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:36:04 +0100
Subject: [PATCH] rust: hrtimer: document handle based design rationale
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
X-B4-Tracking: v=1; b=H4sIADMukmkC/x2MQQqAIBAAvxJ7TlDBqL4SHUK33EMaa0Qg/r2l4
 zDMVCjIhAXmrgLjQ4VyEjB9Bz5u6UBFQRistoO2xqnIN53IKmRflLPoJ69Fjg4kuRh3ev/dsrb
 2AZ3gpRVeAAAA
X-Change-ID: 20260215-hrtimer-docs-52ec9c020285
To: Boqun Feng <boqun.feng@gmail.com>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=gAjR4xG4j4gdsNCib+JKea+XaFFjWDaPY0s4vAw7GUI=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpki40r21sWwaPc1xomA2NmGKmbsVZIDckLxnZO
 4Ksk6UCVFuJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIuNAAKCRDhuBo+eShj
 dz0bD/oCdllW5AX6rpIyIwfgptDuEJbKkPPjGeegEVmOYv/ALR7TgSPZBk+RZbTLe8mg3vVFpDL
 XXIJrMjwILbcoSy0e3XzhtpKoTfO5gTclr4yh03yplFqAYfl/BEkxLe0LzucwNewxVq76Vqh4eX
 e7dnhSRF2NslKWSlJIWicRDx7VCULfI/Ip7CJfSBoZIMv97uZFEHcCUx5LpPD9HauIe+dGWmCkb
 BPZVcXEr6JKidHwHkRcMhSke/8pYYYQ90XrIekpnvB5Da/U268A8akvJIH0/P+HMDDg3vrhOVrw
 XNb5LbNnilFqYFWvVFl+GSX81P9vJLfMVdAuDRyktIHM1Aw+Sc1TVsBKeu+Cyt2BdboAad6+QRf
 EPS/BZiGhHA0jAHV5mE1CEo6f5mkVpiYTIkUcb19DphQD3OvPdbX7ICxjLI7mwHrAeK8D6z43wR
 wLnse1lhdcGMONaYD+Ty8zV1mSYBIddRjMEkJDzg4J+3xBlQf1MALxCE31nBTmRKgJSW3HAzt+i
 kDzqqjjIbQ9yR1oO0siSy8CJKNZiQVvZYHRR69lTQM/flGvqBeS9LfRy+PMrj6dKHeOk8n2hfj4
 WC28EMym79MtXm/bmIb6kzh0VW3/cFVzCPd4+/b5LmDgOrKEodO4cgqCPYDm/Tba/+seCF60myR
 fjFC0CKVdCAjHpQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add implementation notes explaining why the hrtimer abstraction uses a
handle based approach.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a008..f92880b2cbdbd 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -67,6 +67,18 @@
 //! A `restart` operation on a timer in the **stopped** state is equivalent to a
 //! `start` operation.
 
+// Implementation details
+//
+// The reasoning for adopting a handle based approach:
+// - If we explicitly drop the target of a timer callback in the timer callback, we
+//   may get a dangling reference.
+// - If the callback owns the last reference to the target, target may be dropped
+//   in non-sleepable context when the callback is finished.
+// - When dropping an object that is the target of an armed timer, we may drop
+//   fields accessed by the timer callback before we cancel the timer (drop order).
+//
+// By using a handle, we can make the handle own the callback target and avoid these problems.
+
 use super::{ClockSource, Delta, Instant};
 use crate::{prelude::*, types::Opaque};
 use core::{marker::PhantomData, ptr::NonNull};

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-hrtimer-docs-52ec9c020285

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


