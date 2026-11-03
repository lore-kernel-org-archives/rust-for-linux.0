Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793702294;
	b=ta+Q0vAln66cS7+b4TS49XkkMJ2/bLHDwXiB7KJP9wPmzNnTnD69q2WwwJWF3/kHixKF
	 nz4i9mj9jNefLaAMGLonN8stYund1ioA5nF/pzZnmkcQruyRHrLTXS4+LR6WXT1JqUFOc
	 PwTee7PrrfFQVGeeBVnAZspNxplagJsAIMRqv8fkHcewEqQf7sgjfTWd/QYVcufTFXtKU
	 bs+6ZS1ePI3tDqDKjSmI5M4kpeCr9OYf79KlxP/Cdw9oxsNnVevDicJlE3Ep//8dyY1oS
	 wymiB1RLXt8WmDPgNtHCw8/2JfazTEnyf1sOq2rE+osLcpIpEJaPRug0I5wLXAIqF6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
	b=YHNjD+REPhstYjd1gFjSrvXNhREzMwX1q/jjPaWTxBkCroD55Z3TLSHLBYvmGlPiWtf7
	 ma8dOXGvuV+vyLeKlxizHUWXK/B5XxG8Nz8TTNLWUU1Y05h3PQN+RWJrpYdvo8SEoHCET
	 JAZ/IBqD25lXgo5FgcULI4xR0QsAQyWp3LpQ6u5y1aCRmuPzscQ4PnXX7aQcIrujSMcrU
	 9U+kEereJyWCfmRCoSOj6DmV2YZupwOnt482FBO1FPN1hI5tgBPgpX4RidBAsikv73GnG
	 YQPle9et1p5XD0FLrP6iw1ck+m8SDocAG3dK6EyRTUZvIxFckhpBxcyxpWJLhPzLF1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76UtIeB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8B607153F
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 10:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE8B607153F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76UtIeB
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b125371596so4260407b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 02:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793702293; cv=none;
        d=google.com; s=arc-20260327;
        b=IWZtB8M86OZRi8hW2XupexBwKfNLbhNKkrJ8qOLKAmP0gm4EGSTmhFzte3smRFR9wA
         GhFEQRNFBlcLtRlyf4do8L3YBg7lN01QJSOJD9eauvGTGbTd5QeddOX4xMIlaQnWhiLA
         qKEyfPmSvUmd3xF54NbCdc2UgBSsR4Cv9jrosPN2cZm5+pRilOnQ4kQYBktfjInJ0Co5
         nvRMaQ4ALuJ8AeSm16HfbQs6BGmreas2pQr50idsbVWd80acWYSUSKnAn6d6HljNCITX
         Ltd6lQ4uGOQHIi+i5rkzA7jkso/1BXE/+pSo/b1g1QmUeGuKVnAI21rfTX7We16UoWgg
         xcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
        fh=jFFItRx3SmnPLWdAtDSh+gZd6HWhgLbxkdUX9SLXY4I=;
        b=F0FhppL8n9mLgKCnU665DUd+r1p6hrh02wrsU6l/mbwwHVyJXNELCUb4wQo81Nv3Wn
         9Rxn0kKscdqxh/S5dczyDkTwFmIjwy3gqyJGcOs1Z6boC5s/YBjfhA+eLxfR4q0D54We
         FCiq1a3v+p/lawrC8q4Q12JFBvm6E8tI+ZTbcv9FQKW44k+14nF/m1xaZpmFdCBe8j4b
         J9GwSfKJFq8UTkvMTaK2ttEBSeASCsK3yYUOmrJ/PxEqOF2mRoZD1s4o3hft9Nub+aCO
         JbKnNb7RcDZ7EIR/e0IYm1NNI/R+w5vCf4gWfGY0D4iTg5hDithx5NFnv1kNNBUfh+o3
         DOYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702293; x=1794307093; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
        b=w76UtIeBbvbl48JVj1miebuP7+QqmS8voOeBlJC7dJ/FMq2JDvBsF8/P6Ks6pgb6Im
         xeS1wgEq3ityfS6e432FdqLsf2Xhh5Hu5P1ulRst+CbsUvtEI7b1iQpHLiRVg/TQHncj
         sP+JqoldE4VPrwZQg8VkfDx7nXVC2Mm/OWGsjlQMMZOnuVEYg9wNvLRmD4U07IVz05Dc
         04e1voBf+M35rwdkZOr4M1etuFYq1w9gvlw2mzFOeJHUIJG2q57U/85YwkIJl5o2f6qd
         ZChk83j5vYeA+Vi/V5ssr8jO0YXJ397Il8sr//ISrDwG//UBUM+RDM8tPllS2ENy6nAw
         4IAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702293; x=1794307093;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geMjJFNKKykGkLhJdWftFFIjpClvfEV0OD82CBvxC4s=;
        b=26PY292Om5fS5SIULKUmsjwAAbt9oWfKlqVuEjcLExebPPkbloW4vQRV+i5hz0SKMy
         cSoEtWCbxYPtMnSOULlBMnqBU5aabdCrdZ4Fv79Bd8rlQoGTj0D5IYVXNiWp3M/hrvh4
         KXssMmdICNqYRH3lRyGJULMwG+RyElHKBMk0qzoNa1Q2MkN3zcpfsITSXqcn5BqMa+/v
         56rjHfXo2PCjXUPLMjvWmSi7s5vIAfm+ubBelcdZFYfhWJ0Y7YO4A2fgOetNFbBfJjKM
         0ZIAe+Pw+wIZ8EmWaMjyQZGTq+Sm3IkuQaqK9fviF25AQUgChhB202y+57PDrhnl7OYZ
         hAmg==
X-Forwarded-Encrypted: i=1; AKwUvBw70z2kZwPU8v2PZuNBHhFcQzJto2FxSUnmfQpxpFyuMm92M2jouFMDWXTNW/wzsMwyIQgSF6uMGmn6U1OrZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JUe9s/8QXv9WZS+YURQPiDwwbsxeuaNeFibi1FK/WDgiVeKSe
	fJB0LIcCh3Pci4Kr3qxGddXfgFy+xhcY+tTB7uQCVv3zzyhszSQQMcMOAfsiipRLfgzL+9sjCJb
	r07kE1034OjAuY2PL95G84N+mtXtBzig=
X-Gm-Gg: AYBFou0UJQvpBM6SOszB5YtLoNkdGffk4jPtNR4bAFf8fMV295uvxhRYJDNmKK9nmYS
	AOs0/So1kcXvAvrN6+ZSB4ixjAw6CvwY+8KaXPnJm7zACzSq2re72MqgCce+ljY/H2vDgXZPMfM
	76vT5bSZOhF0qI7pL3SqYOIMr7lTlcGzzBLEgd/NipvDzlzh+qN28kYw2yIcuYjElXDCLnpgP7e
	qmMGFQYRX/JOjVjBkiLLJR0XaX8uGltCjzmpBgIt1K438b6m4dHFZ6sUzF2UTaV9ZVQfHRn1z6F
	7DB5pGRWUEyw0yHc1NB9u+NfME7JoVeqAXl5KBLM1EDzwjgisELPkTLjkJIMKjZgebIIzCQ29GW
	BXtWGnY3PGxnwiQapn+5qXrQXGaqAV5u1pdZn4XCEq+UgkoPiJrKa7NcCQKlTpbeRqIjEG2iCHZ
	sJT+vTdjoNI5/SV6umzXCztUtAHvaDWA7bklKoIqDmgB5CYAmVLpr3agEH1xQwkN3Of3Eo6f61+
	Uur2A==
X-Received: by 2002:a05:690e:148b:b0:679:a89d:d23d with SMTP id
 956f58d0204a3-67a8d39881cmr11442946d50.11.1793702293253; Tue, 03 Nov 2026
 02:38:13 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 02:38:12 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 02:38:12 -0800
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Peder Bergan <peder.bergan@gmail.com>
Date: Tue, 3 Nov 2026 02:38:12 -0800
X-Gm-Features: AclHuK97Lxt4O2xlEcDKgfS5TIHK1JX32ZvuOwLNv4iZ8tf8lb7mEWhkgmNWMM0
Message-ID: <CAKHwh-E_A7Bp1oP5PYkgE62hh0cJMQRuxOM6yXGF7OB1QR0BhQ@mail.gmail.com>
Subject: [PATCH v2] rust: alloc: test drop behavior of Vec::drain_all
To: dakr@kernel.org, aliceryhl@google.com
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
v2: Split a long test comment to avoid mail transport line wrapping.

This adds KUnit coverage for the ownership and destruction behavior of
Vec::drain_all. The existing example consumes integers to exhaustion,
which cannot exercise destruction of unconsumed resource-owning values.

The new tests cover partial, absent and complete consumption, plus an
empty vector. In the partial case, the first yielded value stays alive
after both the drain and the vector are dropped. Per-element counters
check that each value is destroyed exactly once by its current owner.

Validation on x86_64 under QEMU:

- The original rust_kvec suite passed before the change.
- All nine tests passed with the change, including a CLIPPY=1 build.
- Making DrainAll::drop temporarily empty caused exactly the partial and
  unconsumed tests to fail. Restoring it returned the suite to passing.
- rustfmtcheck and checkpatch --strict --no-signoff passed on the draft.

I used Rust 1.99.1, LLVM 23.1.4, bindgen 0.73.2 and QEMU 11.1.3.
The minimal configuration has an existing unused-function warning in
io/resource.rs, also seen before this change.

OpenAI Codex assisted with coding and testing this issue.
The requested work was to test Vec::drain_all ownership and destruction,
validate the tests under QEMU, and prove that they detect skipped
destruction.

Base: alloc-next at 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4.
The patch changes only the existing KUnit module in kvec.rs.

 rust/kernel/alloc/kvec.rs | 89 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da..01d468239 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1540,6 +1540,95 @@ fn drop(&mut self) {
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
+        // The caller owns the yielded value.
+        // The drain drops the remaining values.
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

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0
