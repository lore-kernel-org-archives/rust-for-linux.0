Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701935;
	b=pChzQ3olON5pVLwGS6jtJ8Oq4Im/OOLcfCzuZW05N5u5S2glKgpPU2lVrX+MwfnDX7kF
	 RfgLUqMLwwgvkiT05+UEibNYH8cJaE/li9vVvwUIIfGUZZQI0j6VIwCxxloizz4n7lWcG
	 nW5n29f5C5iq9DP/AS8cKkZiOnRAZMDoDIWsrg5i3MWnO6R8o6wBY1OAIA8zYJyTZrqun
	 2KCcNp1+3CuIU4e2xUybPHlOZFJKiQzlzaQfo0lh1qTfJIJ41c30tVOheJvQJ+mtueEFb
	 569zCQvrp2fpUFQUsRLGrDhrqDHGOz9djQj2HwSAfXaArHFJv4zFHxZPE+SFSaF05DQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
	b=UCyFxHJgwDfqw+O7PC6CnpWwwxAZufBJAWEIcERSp1kqt0fDZNodDmyREOnl/bXLuhv1
	 n64z60gukB9x0LNbpoC93lCiJnqR3Uxse6SHYlWDo4+YnGs04P5BMxLYcQ53ErY5+StKU
	 g2qZKQ/ap5qKH9crUQtsrmuWlO+1SwbWyzvqQe9VVHsUxQIjHbXVLRN+yTczXjQv/LUFh
	 bTrUBcjkyL75MviOCZBKqbpqWn+cjZSpGMYKftGNlD0RlXY5uVUmAuIavRGi57Q+XF2Nx
	 X4bRVq5ac0HLM0XM6GoXONdWKvLfFFpHz+CzuepmOyaWG320aaa5tueLO+e2qn3ZQ1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgCUCSBG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE6606BA41
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 10:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8AE6606BA41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgCUCSBG
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67a80d827e8so2448031d50.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 02:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793701934; cv=none;
        d=google.com; s=arc-20260327;
        b=c3VWtrDMxNtrA93WJdFYb6iWfdzoutct1HMf81MFjU4SSeyadcg8i1ESGL83F24THP
         rXFFt1iNKaNcd/+YzLPIVUmtWHhf3KNQCtZC1up/z3M556AAKWvA0DqnlHq++nUnDCoM
         SLM24qwePgocAOrFTu0IKNUwgXo6w+b6AJRBSRuxLiwuT4KJxP3Eu8gortqutY3qcHXm
         Q7P8PnslO9yvy9T/n0Jc4vJ4JOtq/bCaur4UnRihqyxYMwVq6nDsK9coHlnLlVSxKSrF
         c2CAMYw94xPbcHrUEbaUVwZ5xkZ5hEnYelFL0HDpD+5QJ3bPhRVYWZzOEA1DRq2UUrH1
         wMCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
        fh=1yWuzn+Znx/5nTSh8ebmE1YmrbzgNcun4IrRfFQYX/Q=;
        b=IjPCE5vMmwzcWWZ43L6d8IpLA3/uKjCzW7hyGsHlJxjW7RJNKLVkc3RqrdoPSINQ7n
         kcEK4WswVwO4u0TvZzpochfcqYsPQWMgE7775xT0x1bWObUNlBpnShGSDqfTOEHioRxu
         pljp3GftsTHWoaMfZSWg8+Yt2Mv9HIjtpjDZ1whk5/vrKTwkZx0odp561wcLYT7dcSoj
         KapNcbcv06Vbcy1YNKVMt69VDkDRR2D+xugn3FBUiiUfz1/fCaMq2v+0T0wJGPTxIoP/
         Vovb/iQBoCj1pFDzcTCgJ6anaAdK3/mKqIGo6Uwb45uklEn8i8CJjHppNKL70rDVwP99
         FJSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701934; x=1794306734; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
        b=zgCUCSBGSQZBUYWaWNgYpejQ2dJxrcAj6UKNDz5HgBWz3DoCtsm0Q4a3vcVS1i2bKX
         1KOuCZTR2KJAmN5ijRVRAcqbvGDKZ4XF8c2aYDEU0GNCg8q2huF/8rXyVkWSBQ0dq2Rw
         +yJrsSI1sk+5d/IV5fnNOfe3f+MOmcr6XLbOm3qn/zHmD0yIOtagNYo6zKVh6ZpSFaRG
         bCXMHbjpKXoyWn0leS8hK9y9cIQBC3xMB2N6Cg53PjVYqXmkeoRm3VPIN1u5BHYCXbfw
         n7QXKrE4BZMU0RnAAbEHOxXR43ah7rX3CHbsVdngHzinsTcuGP2m5V/hAtWoIV5pxMfJ
         anEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701934; x=1794306734;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5wF0zewFpsOiJBtoZv6gxgfRVpLXGxk558GJSrFJvyE=;
        b=JQgZi8/PrVfGsCGBu68p9jLse8fd0a7T0RneSSy0S9SWATKSzZkCdkQbb783XvKrLv
         gCPxq2usTYbiv92sLfySPmVsx/BgIB1eAqVfJFoQpP39XrugiLEOrJKIE1FP8JgG+MGi
         APua+Keok7CL+Tm2KGxZmSzEJbZr0zrHUKTAqHdrpQi/ojxx5D59YloSztd26EfREbwD
         /uv0FmO41w7SVtfRXrdIXw3rUQeSlJTTyZZiesWVlitL9s7p0Zy1MmHT2OQXX4UwPs5b
         Rw1lZbRMcSAXSFtlmXmQjiabTHl87goV5wi7gXzyWKFcD6qZN+voT5MHEo7UDU/zfvu5
         r84g==
X-Forwarded-Encrypted: i=1; AKwUvBwliZc6+patHsOvwMVKrnB2CqlK5xEg0ab/4kajR2wD/5IS/+2vVH1P/a002GUX6CJioz0tHIZa/ZHMLDeTRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8N+VsZrlxE6ORLeE8HPSTm2EB9gF4Zr7uAlFNxicaBDvKU8U1y
	Iv/ILz8gH8ELflhEF8gFbIwWisKO/Kn+3kC0orKo5CPDw1hEYwhp4/MOpHZ8SE/oC7/YL62sqnp
	PDh9K7QgqgE/jUGg9MVTO+64jDtLcvg0=
X-Gm-Gg: AYBFou1xSAieqRDIWJNTEf2VuQLfgoivWrXBPSamgeGs84Jz1FpTplbnqkm5qjXx9B7
	vBHS7HKvryGj+RVB7k2aJQB/IoAGphkW8msua3gW1ALqj/eSsy2e2XIIcKSi0vaHso0fSLYwW+P
	z4udmYxDN3OPqjYa/NWGJjDhef6nUNKdf9m4udgrPJG5xCuXgeMYLhhNTcNMPSK8PLVJgQ2eyig
	QqoDS3Su3KcrnEBFbcWb6mlknhsVOitUHogG1ZIT4QkkSzoVmeLm0d3D2eCk9ZbZ+Frbu4haf49
	lmntJZ6XSPTJrw2RyKIEV32mBNM0uULHd7Ph2i8xmB//Xt0jysI7+v1SqtquQYoOIRfl097zVM9
	1KMYwdq+CXBjO+XeijunY+O01LlVTdkM4e+DDVj+hRbK1HK7/4+ty7k3IVR3+wgbVBV50dWyqfh
	FujWfSIPu/dWmra20WcQPCJJRinjoz0aooYdplwMEzn+2ydyhjG4XcuBbj2dR7MyxY0NS6jdxpx
	Hsdiw==
X-Received: by 2002:a05:690e:439a:b0:676:bf92:2520 with SMTP id
 956f58d0204a3-67ba50c7b2emr4676467d50.89.1793701933775; Tue, 03 Nov 2026
 02:32:13 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 04:32:13 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 04:32:13 -0600
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
Date: Tue, 3 Nov 2026 04:32:13 -0600
X-Gm-Features: AclHuK96gvYRqRgBDT03v_6oIAmN1e7Nl712wgD5TpWQ9zekVuOi8l-OEed9qRo
Message-ID: <CAKHwh-E-7CRRG-DH6-rDfGUCFAxG6JNgswk-suTaGKqMbig5Jg@mail.gmail.com>
Subject: [PATCH] rust: alloc: test drop behavior of Vec::drain_all
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

 rust/kernel/alloc/kvec.rs | 88 +++++++++++++++++++++++++++++++++++++++
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
+        // The caller owns the yielded value, while the drain drops
the remaining values.
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
-- 
2.56.0
