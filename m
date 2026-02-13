Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30008189BB6
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 11:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982653; cv=none; b=cXG16EhpApSSBjp3QrFGuglrxh0aAF48BSzZhD39ebh3ohpoT2UNTJoc6xDeGTm7HIp82BlHoMLxDzjRdT1ImQ30T+YEMkbLJ96YQTwwHaLht+5a/WzsWXP0Rl9fKtNhgtYmxMrXAKmHICkjDh1OGhX74s4u+ad7MtacSpucr5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982653; c=relaxed/simple;
	bh=4LTNjgJgvGqNq7J29QKVGs2V+h5UNIrd7eT8oEJbNBM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UiVn19Xsd525+fm9Z1WECiyiHJUhz1ew94K4CX+yTfmBCw/r1rSLWcEZO9QvBRiA2PcsN6XTRb87zltcGUTe0dyycuSviwMGfzTv1ge1m+HSjkcnevEc3Zd7slje7VYcQL+P58Y6woKoHsr+l6opXj7PvmaeZY8JnJ4xdRyK9Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+P10E4L; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+P10E4L"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8f10615953so102527966b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 03:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770982650; x=1771587450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZbOmUybxmds8ticCOAuzlWlSf0l0KDGIiJfpTQsjS6k=;
        b=W+P10E4L/ALkpjm+/HX5HR492d3nfDnsfA8Q+Ls4ZL5t9XwmBC35/GThEIgHI6yjhH
         cm3x3xlPpGuoLxScE87Yrz1r6iv0WMgrPQL1w2RyuQ7mbzPXTt/Fosb/VEbyutn51y0P
         M5FTjpNERy55+WOFCXnO7rLnZUnUBgx+dMLruCC7HU8Kclr7xMOMtygWIm3mhxjGNtcN
         zzc5MOpEI6j12Ky6E6CgVOrstOIWpUcbjRmr7uuMYKn27hGBpvtvK8OtthyG6kLOyZO+
         auxKlfg86KVURB+BoRUCsQkgn8KWuIh5mdwtJtPqLP+At+hFDxtk8QYAxjN5U5OryPf0
         e6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770982650; x=1771587450;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbOmUybxmds8ticCOAuzlWlSf0l0KDGIiJfpTQsjS6k=;
        b=v2fzpdRdx9F2/1MqLHsEZxPEL1YXDSa179coznP4jZmXmkb4KvNhkhFNAwFfBA1e7Q
         RJ6rND8yULfbjY4O83zvWqXOCXSEdwii2O4aJ0zFL/U+a56YyQbR9kXCBit1X5RC4U/W
         jzm+JQvn8hNYVdMIOvwmeL0F+K68eALFn062Co/DqwgQhqM6TgkLOlTgBZM43vLEgmGP
         JSWvouaUIX+X3zuA5MOKsZ48RCexMKXqsW51zmugkB3hl4IJ9LIyYHNDgB/o/tRPI+5k
         szccOFSQqakOsvkwk2CoyAe/EgYgMmtBax5UcGaWwyCfnQi3+AtmNpk4O6Ms0v71JXYj
         GofA==
X-Forwarded-Encrypted: i=1; AJvYcCUFgZPw8zTGuGipCpQE187xk+K2TZmJhOi4xqzXr45T8DhoyIUDgSaKP+XCJ66+oJHAf9sTiHSsb0fmgIYk4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/C12Bs9E0D/N1wui2bYcIcbnImOdqI8l8yACIFSwoio1Nh9dw
	5keJaMNpiUFNLtDI0O4EmY2GCBB2vWmTOtrzOkrGk1wgv2jPNAHrtupaL4VPmubIacQMfjyj80v
	tFbIeGYYwTnbySBvCeA==
X-Received: from ejbm12.prod.google.com ([2002:a17:906:258c:b0:b88:435f:4347])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e2a:b0:b8e:a1a7:1a98 with SMTP id a640c23a62f3a-b8fb44dce46mr72100666b.47.1770982650069;
 Fri, 13 Feb 2026 03:37:30 -0800 (PST)
Date: Fri, 13 Feb 2026 11:37:26 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPUMj2kC/x2MQQqAMAzAviI9W9jmGOhXxIO6qr3M0aoI4t8dH
 kNIHlASJoWuekDoYuU9FbB1BfM2ppWQY2FwxgXjbINy6oETp0iCWdGH2EZTlG9GKFEWWvj+h/3 wvh9lWP+KYAAAAA==
X-Change-Id: 20260213-rust-binder-ps-46d9d060243a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2864; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4LTNjgJgvGqNq7J29QKVGs2V+h5UNIrd7eT8oEJbNBM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpjwz4ba/pGfcwxzqFFR+EX+9yplWJyIqVLiGzY
 TWKQYpCXKqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaY8M+AAKCRAEWL7uWMY5
 RuEAD/9TnK7CeIaWplyYB0pi5DRRdsI4j7fa0PsvDmZC9Pk9zV7WKkSVYDNeDupwroYk3DDnaUY
 PUMQPvXcrrf2q9TICZcC7fZY/ciPMGZg+ezb/Mw+UFrO5t4EikzbD0+0gNakrDomBBxx6ipXHmk
 Lyu696apNAEMIfpR+ax3f7/RNEDXPRejt156KkGxzHziy0iljxNWOcBBKpo+FlNo+NBf0QmR/hY
 pW+spq+zrhEynmJCoDQgag+y0hwLVjIp7keuMMLneHX7SjXnNv3cYXWwPQDPuZJ6euBvNEVW2Za
 IdpF8UHZxQoR6naKT8QZsIgl4DG57Itaou0C8Ou2UTob2juIxO0NW2uJbJ36O6v7wHI0fqPoC40
 72hFSxNDSxvZiiXpbkT4ju6pg2xMx/cFx8ad4lsD9DRJVJFElIMrIZ9GZVg+AEy7z3PE6kYLC6X
 1xbH3hVixltOL2JA1SnDiNTxqMayY/qsYAwK22iSOQY26xN419wf+FVuEaM2qn0QDTxIR7V1iuo
 Y6WnmXfQfnl/XiskB1KKPtxrJABri8kWbbtWUzKq1J1CM84hOM+nxp1ojE0pDtCB4Ug7dJHfIj2
 +Ih0soxlqTiVaYfWmGKB3D54ky+TzZ0RoFM0Gp4oO5MRwyTjY8L2/jPYK5VZ0/CwD9bipA05B1q w0FYLdDjSHvTy3A==
X-Mailer: b4 0.14.2
Message-ID: <20260213-rust-binder-ps-v1-1-6b90f83c0b4d@google.com>
Subject: [PATCH] rust_binder: avoid name mangling for get_work[_local]
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Currently ps -A shows processes waiting on schedule() in functions with
names such as do_epoll_wait, wait_woken, and the impeccably named
_RNvMs2_NtCs8QPsHWIn21X_16rust_binder_main6threadNtB5_6Thread8get_work.

To improve how ps output looks, give explicit non-mangled names to the
functions where Rust Binder calls schedule(), since these are the most
likely places to show up on ps output.

The name of rust_binder_waitlcl is truncated instead of using _local
suffix because rust_binder_wait_local is sufficiently long that ps shows
unaligned output.

Suggested-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 1 +
 drivers/android/binder/thread.rs  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 132055b4790f0ec69a87635b498909df2bf475e2..cf7425e74183966063ab53114637aec7b3672ac8 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1436,6 +1436,7 @@ pub(crate) fn drop_outstanding_txn(&self) {
         }
     }
 
+    #[export_name = "rust_binder_freeze"]
     pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
         if info.enable == 0 {
             let msgs = self.prepare_freeze_messages()?;
diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 1f1709a6a77abc1c865cc9387e7ba7493448c71d..2ca8ed8962314b58a3cfeb3ae0aa0ed60f179433 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -514,6 +514,7 @@ pub(crate) fn has_current_transaction(&self) -> bool {
     /// Attempts to fetch a work item from the thread-local queue. The behaviour if the queue is
     /// empty depends on `wait`: if it is true, the function waits for some work to be queued (or a
     /// signal); otherwise it returns indicating that none is available.
+    #[export_name = "rust_binder_waitlcl"]
     fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRead>>> {
         {
             let mut inner = self.inner.lock();
@@ -552,6 +553,7 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
     ///
     /// This must only be called when the thread is not participating in a transaction chain. If it
     /// is, the local version (`get_work_local`) should be used instead.
+    #[export_name = "rust_binder_wait"]
     fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRead>>> {
         // Try to get work from the thread's work queue, using only a local lock.
         {

---
base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
change-id: 20260213-rust-binder-ps-46d9d060243a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

