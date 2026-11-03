Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793704900;
	b=3PnGI1vHuHm7RKmLeveU2imJ9gwi7+sDA1abN/WMwBoWVJVWppYs3+514UE8ionB9kl9
	 kvBf8PiGFy8stMhjIpbgw2UUkywzAZugMUUc0GrSpIu1+XWvdEVWNhMz3ikBssugOpExp
	 NyETjXn/sY5xK6vOKhTgnftoblXih6/Ips0+E0oqZqArcYnRbteAtzqFtxQPl5OmPT/mA
	 4ieJzCyak1lY5VLmYPHnPNkDbKEopVA3y02hnf9yRX7O/hZVSs/IQZz9WKD+w5lNg/Tz8
	 Rhe1xYVpf9odE2Pzi/w/+vUUsAqPMvfG5tvSEg4NkeQf4+nsLi4r7zL/TWXLbeJQ8yA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
	b=j10AdbAsn33YQMJuaiR10QM4KUBcqZbwzkfEhF89zPUAOhEaDVuqaDX4+eSWUvbC8nwT
	 MhT6uyHV4WV/4S7OKIBDKfS3iFDL1GeeZWetZQdsN6P/GU+PRp5CLCP1dY7luQxkfYLUd
	 wXbyHInKl0X0wTANEBfBpGP45AGDLRmeVHiH40bWeG9mZImXNeMZYjOapOR9NlTrPP+we
	 eZFXWUG/MOd8+DFXsIAvoVhtEQWzCi7unrnOM26gGIRXPWWcT+UrBz3InvpLS/jAo0Bv6
	 3JiBV1QTP0IbSc2yOBlPbMxzoeFulBXPgN7vPswj/8diYr1seouAhx06ahxKWNWfP8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaXv6KYJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE2606A822
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 11:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29AE2606A822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UaXv6KYJ
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67990a45e02so3588916d50.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 03:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793704899; cv=none;
        d=google.com; s=arc-20260327;
        b=hCnN2k3/7rmWmOf0JFQ4kk3ZrD/kQvz3/a7mLS+ad7LfdSmLge+1noIb2rnf2OuLa6
         +ObNkJvFOOo7tCKXDqjbBoNib7nZ54vluT4v5/Kh8fTSaeuETDe9xW9iFLSH3SIu+jwh
         w4JdvIYfW5EU3G7emAlKo84o3SnPPE35+5nvEwFRube1ZipZp+2NUxuaouwWUaq3U/X8
         o+ssYi68J5MWMfGDesRiU0qArOXktwSJbb7vrCggMIuCC65w8LgT57FJAf+ub0Arth3y
         l+h7WTL6fpMBeoCtWoyHiv3MsDo/OFq46Th7+DKk3G44lo2vf0IINdqMo6+e9P4TCuyb
         TQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
        fh=k2DwLmKh1URSCW6X5oJTwmP+H5cN0cCSjC0yZb/hZh4=;
        b=PUsPSHVWQIjxsUyZmfkF3+2G+XEnXMwa93yAoXDfvNl4RjwOD6OybDROnBWryo8m9+
         vnOGzWCQcnQ7ELMwqV/5G6TliQv/D+qQDCKjNmQgNfjt5a4MePTzj9G5r+ZC9iT1Ev7i
         LoyyDryre4kM5UYY6i7fF23R0PlB4UHPOns6M3H79fNLsYRcpIRfbNMmlT/wqtgtYqLD
         kyGxk7wSFV76Bw26U1My4lm9kx2yOHDO1POr8tlOx7gUwuwdcUB7LYaXYULkXjCih8do
         I/JPv8zB5s7SQt2fnhLirBpIQdyvMMkGwzFT96NVNbBdpHYg6ssHG+RzFSKsEMZWpnTv
         2y4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704899; x=1794309699; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
        b=UaXv6KYJCp+0/TFPY7tt6WAYPKrOU0FxBLAOnS7/M7xTF7xOyG8HXXo/0v4LzG2Hkc
         4Uhz+9Hzayq22rOqVMZtNbfEogmPWYzcWKVxDemBAXPWGht9FoH13JS6yaKElKZfG/tG
         u+kIk/+l5UdjlwqK/lCE50x+KFRStiHexeSoN/Kr6ob3uf0Ev7u406swuVpAKEegGWR1
         dI3yFrfySn1nnh2fLs4ritgLvYo/x1tDP3FhtBoyc//TAruK4Hv8/p2F1c9sWluFpwIQ
         qSEQkkFIU5PShlkGM8hWx81kDxD3De2NCWQ8T/TiDthf2pfFCTg65EWHMB064HjWvF32
         DgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704899; x=1794309699;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PpLYeCWbIFeoFaRaLxNu6w/fm6DcMWnrvqs61XoFcys=;
        b=RAEtCELw1qBD4tE2Nxi6frm4ESihQIFIaBHKzEqB18DEuZjlTAlL4R3SKZcBR34Pzp
         7mIlWdbWPtdO31WLudYAvl/wwN5rfhuYWtAnz4TyfiZCd4ZqIX1nBP0KOM4BigRI1lgC
         59wy2hU+O72xffMssE6EvncYoJd0vcRuRC/hEkYgXU+Hklgca1FQRgxV23EUR6VmSOth
         Ygh0KK3+EUDSg1ajqcS6zesjh+ThZkkP6x9Elj0EMG0jLZdaTownHgs7Koulr7+yHk/w
         tcPCihY8I7OueLSQQ6kysbFJZ0VCmKY7JemsY/c5c533fDWKgRLbJi0afteJT8K4s0L1
         9PgA==
X-Forwarded-Encrypted: i=1; AKwUvByezvFWU3IyrQGz4a7xWJyYUe0PTcx29i/86TPWbNn+HsDQNAHly1UyAEnMiOeFdfw9mnEN1yMFoyZjThlUIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8bTpFwTW8sAGBmc6V2LThSoxm5mZmGCsLvt7UoJWdguv5FbEu
	pxF7aShzUhx0atPIg5lvOCh6APmuis42sEh+vXhpgpV8qg19XHSqqmkX/NDNcHQx30G2N8WV4k+
	Gxykgq8nBhVa9f8RqyK0dII4uyBx1alA=
X-Gm-Gg: AYBFou3B7Tlqd14wH+sSfe0eacRi89j3NI/d0nFKgFKox9LmlFVV+gYEsUwV6nrfLCu
	lkfSO5wmqOy0odYmgDwFyqZ1EhmDCpJC8NdZ9jIVDIjhYT+OJe7z/3cmNdT7RgH7opXXcRwCbJ/
	pQ0uBTDRTvRy44T+6IJdG8XtPAMcEW30tBVWDlhK92kFvEMfzYhmfrcbwVZRilBJ5GeSanJvhCB
	9KLDWGZBteMete43zGod9B1VrK2QgitqC52aKsH3rGZI4yW64G7wEioTmogPbW7gLa5lbuCNXeX
	ZE+Vf6OSvM8HXGkhpgx66TR/EyYgn9QUtlS9Y2NOAgRU/+bnNhk6NvQ03vl6FNPXdq3kWUHcT05
	6eDnoFXOBeBfaRHD0xhU21FF/xV/jmqRxRik6yYYRKKV2hj16hOWGy36UXL8Epw/rKZwY9mPs2e
	yKVj4Ml0/53xLezcH2rjrT4B+g48Ke5FtuVHxvkBXtb3z65+DWgdc5OCBw6Vy+iosFq/6lyOnjq
	O4cgvNP7Y5YG7lWuwKte05W6TY=
X-Received: by 2002:a05:690e:80f:20b0:679:b98d:9b87 with SMTP id
 956f58d0204a3-67ba4fef31bmr6609467d50.69.1793704898918; Tue, 03 Nov 2026
 03:21:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 05:21:37 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 3 Nov 2026 05:21:37 -0600
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
Date: Tue, 3 Nov 2026 05:21:37 -0600
X-Gm-Features: AclHuK8SGRMs5YXjfWPiNRL1xtH2xly27akho2t0jAlydepcH9ZLLOhHM9IDYgw
Message-ID: <CAKHwh-GzSuLn9dvjnWph_tr6MDa4nZnjc-JaMy4PeqnNXDnaMw@mail.gmail.com>
Subject: [PATCH] rust: alloc: test retain ownership and mutable predicates
To: dakr@kernel.org, aliceryhl@google.com
Cc: ljs@kernel.org, vbabka@kernel.org, liam@infradead.org, urezki@gmail.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The existing retain test exhaustively checks filtering with integers, but
cannot observe when resource-owning elements are destroyed. It also does
not exercise mutation through the predicate.

Add KUnit tests with per-element drop counters for mixed, all-kept and
all-rejected selections, plus an empty-vector case. Check that the
predicate visits each element once in input order and that mutations
remain in the retained values. Verify that rejected values are destroyed
before retain returns and that retained values are destroyed when the
vector is dropped, with every value destroyed exactly once.

Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
---
This adds KUnit coverage for Vec::retain with resource-owning elements and
mutable predicates. The existing exhaustive test checks integer filtering
but cannot observe destruction or changes made through the predicate.

The new cases cover mixed, all-kept and all-rejected selections, plus an
empty vector. They check callback order and count, retained mutations,
and exactly-once destruction by retain and the vector's destructor.
Production code is unchanged.

On x86_64 under QEMU, the five original tests passed before the change and
all nine passed with it, including a CLIPPY=1 build. Temporarily skipping
destruction in truncate caused exactly the mixed and all-rejected tests
to fail while the original integer test still passed. After restoring
the source, all nine tests passed again. A separate predicate-bypass
experiment also caused the expected callback-count failures.

rustfmtcheck and strict checkpatch with --no-signoff passed on this draft.
The draft applies to alloc-next at
6628e7d4c6b25c8d18f1345e3a20d21829aae7e4. My validation used Rust 1.99.1,
LLVM 23.1.4, bindgen 0.73.2 and QEMU 11.1.3. The baseline has an existing
unused-function warning in io/resource.rs, also present after the change.

OpenAI Codex assisted with coding and testing. The requested work was to
implement and prove that the tests detect skipped destruction.

 rust/kernel/alloc/kvec.rs | 109 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da..3a1e09057 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1540,6 +1540,115 @@ fn drop(&mut self) {
 mod tests {
     use super::*;
     use crate::prelude::*;
+    use core::cell::Cell;
+
+    struct RetainItem<'a> {
+        id: usize,
+        value: usize,
+        drops: &'a Cell<usize>,
+    }
+
+    impl Drop for RetainItem<'_> {
+        fn drop(&mut self) {
+            self.drops.set(self.drops.get() + 1);
+        }
+    }
+
+    fn retain_items(drops: &[Cell<usize>]) -> Result<KVec<RetainItem<'_>>> {
+        let mut v = KVec::new();
+        for (id, counter) in drops.iter().enumerate() {
+            v.push(
+                RetainItem {
+                    id,
+                    value: id,
+                    drops: counter,
+                },
+                GFP_KERNEL,
+            )?;
+        }
+        Ok(v)
+    }
+
+    #[test]
+    fn test_kvec_retain_mixed_drop() -> Result {
+        let drops = [const { Cell::new(0) }; 5];
+        let mut v = retain_items(&drops)?;
+        let mut visited = 0;
+
+        v.retain(|item| {
+            assert_eq!(item.id, visited);
+            visited += 1;
+            item.value += 10;
+            item.id % 2 == 1
+        });
+
+        assert_eq!(visited, 5);
+        assert!(v.iter().map(|item| item.id).eq([1, 3]));
+        assert!(v.iter().map(|item| item.value).eq([11, 13]));
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 0, 1, 0, 1]);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_retain_all_kept_drop() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = retain_items(&drops)?;
+        let mut visited = 0;
+
+        v.retain(|item| {
+            assert_eq!(item.id, visited);
+            visited += 1;
+            item.value += 10;
+            true
+        });
+
+        assert_eq!(visited, 3);
+        assert!(v.iter().map(|item| item.id).eq([0, 1, 2]));
+        assert!(v.iter().map(|item| item.value).eq([10, 11, 12]));
+        assert_eq!(drops.each_ref().map(Cell::get), [0, 0, 0]);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_retain_all_rejected_drop() -> Result {
+        let drops = [const { Cell::new(0) }; 3];
+        let mut v = retain_items(&drops)?;
+        let mut visited = 0;
+
+        v.retain(|item| {
+            assert_eq!(item.id, visited);
+            visited += 1;
+            false
+        });
+
+        assert_eq!(visited, 3);
+        assert!(v.is_empty());
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+
+        drop(v);
+        assert_eq!(drops.each_ref().map(Cell::get), [1, 1, 1]);
+        Ok(())
+    }
+
+    #[test]
+    fn test_kvec_retain_empty() {
+        let mut v = KVec::<RetainItem<'_>>::new();
+        let mut visited = 0;
+
+        v.retain(|_| {
+            visited += 1;
+            false
+        });
+
+        assert_eq!(visited, 0);
+        assert!(v.is_empty());
+    }

     #[test]
     fn test_kvec_retain() {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0
