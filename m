Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18D03FFAA4;
	Fri,  5 Jun 2026 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780637020; cv=none; b=CGWqtvtKu/EaB98hk9CSBkra8vqo+xW+2UFebh0aswsEP7R6TKuPWX83sBEh3uUUWcpH0+QZ+dItPrkJe2cHe1PkgxuwUcCH9weCxIn+EicXTzW4rYc5An118+lmkZJqKXzPMrs1gq8QyFeaCHa07b9LCQTdzLMoVu5JudGEQ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780637020; c=relaxed/simple;
	bh=O5U9/mE/ws0WC9A9baVp+Em13U8kMcULebFgHo4una4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYLfeJvEc1xOeOlFoocJDtjsxw7DSt9kt3HOQcm9DWxvQNRvdVhjW+yrx+Kh4P3cEKxvjyNehna6v0TSCMVQbkVdhImhcKs4cWMDEZD6cVzand5S9sxARKxUuZemvBUKPiB1SLdB2K2fovNARKTsnQphTAn9i5vQDqTz8eV/xi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyKpLKpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyKpLKpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E698D1F00898;
	Fri,  5 Jun 2026 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780637019;
	bh=0eq71ClCc2y2QnZZklcpAKj/F5X2bJEmtSbXujLM+2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QyKpLKpeJ//6k1pz9IfJOnxeJzxjzIlCrukITz+c/fV6eKR7eceUu3mmqFVvNe1LK
	 AHSgTClweEEA3FDPw5mRixsup5ZEe++KY450wyWaozQLW2uyr0ayQtHxWatG5toefb
	 gWyhyIJBY2Yoy+5X8IqeZXIz/ycbwZZqJKC2l2B7+30rgL3xewZIt9f4KFyz+/5FKZ
	 Z7kg6L2dfoO+WklCHRl32ecrLxOGJG/DvOJzwEMlK8Fkr4SRLtVW7xyL1K8eBAegQe
	 2ZB5Tp8iiq7CaleHcrPESQ43MqHx19ugIMpACHkGya+dcwYQvrmzzPMjQFyec9r7dL
	 DSMW7G/tV998Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45D07F4008B;
	Fri,  5 Jun 2026 01:23:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 05 Jun 2026 01:23:38 -0400
X-ME-Sender: <xms:Wl0iavpNgT9tuL09mFD17NjaPEo161j9O0lRTW9SNjSHxpng94JSDA>
    <xme:Wl0iatmOS4B03gGoqsVuL0gz0uYFEFuEQwvhLq84Tosv36eXCor1Rla9JNgVA8lqe
    -z8VrF6ZuG_afSch7ojzNQnueoZrKotH1sUIf0qTtV6XxzvsDENng>
X-ME-Received: <xmr:Wl0iagx_hWQpvT59iAOSFo8QHuBEiOreCDi8Rt-jeC0Px5VS1XDgVoyy1a8>
X-ME-Proxy-Cause: dmFkZTGVFc55oynbaSnStRiW6SrUZLe7lsFvszDeVCl7MvIXzrJlTiksVD7ngpaPNtnBA0
    xzpe0KAcgjxOnzHwp6rZ9Ql7S0lC44ptRJ0hsl9aktWp207P//NWvfBaH6pyJtCaRIDIg1
    1zZ1CdVquqOEtD75Kj985uzC9ToB2LMOrhRjDA6MOXxbEX/kmztAQYeGB9EXpSS/4TsRe/
    6Qf2l2+vPx+b+fqTQ9BeHNLfkuvUD1sPfcbNHNhL+jGtKJIC6o5BUIo4+ewgiSabQMG/02
    r+GRrWdB/QHVTqnWjec/xWbuSPNl4GSruprwTDU0SGp0gFAVp9fQrfcQkLrzvZFpXXrDnB
    EQZnD4lBIGT0YBWvBs/Vu+Gnm1NnNyA+jBGHof727VuVuJIYWmIM3HcRnsYmxwtRm9ElrV
    fofYqK7TiATjCQHWu3gfDSLYKI9G1EhgBxoXFmh8Vi3XSuWLszIZHLsyoNLxmavArTLFtf
    6+Rru3IJ1L1mZ6SMh8+ys4Kzhej8YHaLi9I1gGiq5BSi46OS2XRo3Vbs3J+NSvr7uANBBy
    1efnS2XFIyXCRAh6q8qh5JLN8W5OejGvsRisq1Yy5wo5MAcdlzM1LVeSUVrSBCN8318fCI
    6w3s1oynxQ1TW3LSunDBcDJDUugEEALZEbAwa26qQ+AcNUEzcMECo6kUK/uA
X-ME-Proxy: <xmx:Wl0iaq3psVlKdEL7yKPXkS7SRObvezl-TxTti1WQ8S62ifua8tXb8w>
    <xmx:Wl0iakBKEY9-ZCbsYYjQblSentlQheBv6hqm6yjW3oHoOwRYHJXw4Q>
    <xmx:Wl0ian9vARiLie1Mb4LSe9h96q5eUCaXUEt_YREIDb0OgAMERfWrEg>
    <xmx:Wl0iai_LkpL7gwnRGthRwvqXNskPAbR9HOmB6JxHvrHjoJQlV8i2-g>
    <xmx:Wl0ian2xv3bNuFSsJ010Cv6yXUyNAsvtHulrXgNO2bymbt6vKoT9fQsZ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 01:23:37 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Fabricio Parra <a@alice0.com>
Subject: [PATCH 3/3] rust: sync: completion: Mark inline complete_all and wait_for_completion
Date: Thu,  4 Jun 2026 22:23:31 -0700
Message-ID: <20260605052331.1628-4-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605052331.1628-1-boqun@kernel.org>
References: <20260605052331.1628-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabricio Parra <a@alice0.com>

When building the kernel using the llvm-22.1.0-rust-1.93.1-x86_64
toolchain provided by kernel.org with ARCH=x86_64, the following symbols
are generated:

$ nm vmlinux | grep ' _R'.*Completion | rustfilt
ffffffff81827930 T <kernel::sync::completion::Completion>::complete_all
ffffffff81827950 T <kernel::sync::completion::Completion>::wait_for_completion

These Rust methods are thin wrappers around the C completion helpers
`complete_all` and `wait_for_completion`. Mark them `#[inline]` to keep
the wrapper pattern consistent with other small Rust helper methods.

After applying this patch, the above command will produce no output.

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Fabricio Parra <a@alice0.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Link: https://patch.msgid.link/20260316151056.287-1-a@alice0.com
---
 rust/kernel/sync/completion.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion.rs
index c50012a940a3..35ff049ff078 100644
--- a/rust/kernel/sync/completion.rs
+++ b/rust/kernel/sync/completion.rs
@@ -94,6 +94,7 @@ fn as_raw(&self) -> *mut bindings::completion {
     ///
     /// This method wakes up all tasks waiting on this completion; after this operation the
     /// completion is permanently done, i.e. signals all current and future waiters.
+    #[inline]
     pub fn complete_all(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::complete_all(self.as_raw()) };
@@ -105,6 +106,7 @@ pub fn complete_all(&self) {
     /// timeout.
     ///
     /// See also [`Completion::complete_all`].
+    #[inline]
     pub fn wait_for_completion(&self) {
         // SAFETY: `self.as_raw()` is a pointer to a valid `struct completion`.
         unsafe { bindings::wait_for_completion(self.as_raw()) };
-- 
2.51.0

