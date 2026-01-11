Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1C257845
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 21:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165830; cv=none; b=PN/as5SGQHBGYULyZLNBC7F2YnDYMUxU/qKH80sDBlhvba8CQHrjteHzwWuy6EKwrJUFZahVeWvE6QkoByAlsRPsnGWrBjGtwTzzTcgLyq+mdNQojodIQ6VR5G5Tyir32QjIYMHtf3pCU+hy1wUuTR1+yESgtSLCRHac60ucVjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165830; c=relaxed/simple;
	bh=yFLCeOwH2zXwDlzt5rJtMDARmux5E9KdLTrjVuWSYe8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AdenDOuO7q0VPk1iBW/2VpgTgU4IYriXZ9by29SSd8o54u3zlBWCZH3X7kK3yg9RQ7swHkTNCU7m+tum1YBTOAQ2N8SDRpEJKMGtPiPRFrANuoIhuHcrQcIMLFKumoslY6K9m9UwS+YXAk2Ff2XjTpWg+3nasdKKAPrgvtOA0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TX5evBpe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TX5evBpe"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8706ce18c0so124860266b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 13:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768165827; x=1768770627; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ljPVQIEMBp8DGWCWc4YXYqopxtlC88u1AWMZ8frI9W4=;
        b=TX5evBpedHQXWuSsvz2vD/AeRKVbGNn5MuYIQgutUvsYEExRij2ZPltoFRcvCv9+Qh
         pJqf9BC+OaCL0L70EJAjFHQAWIgLn5fOT7CN0SNzfoirKEwfB4AM5YLq/SIQcso4IX5n
         7FYbPcNmOZ/o5Ndk2dUMkxdGOdrhzw8Ig9X7fowy1/B8DnH9mnIpF11MM983JuIX26rj
         /TwEObtrX7km8u+O76nUT6KVhFMm7UBOWEWqmZwQhHiB6HNe7ckXCnPQjGQA1TPCwBoo
         J+iq5plfk1n/tpffFYamejXF4gThn/C4cfTVU9teFCfE5SAbHiCX2iOpK1xuZGOaiLGJ
         WlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768165827; x=1768770627;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljPVQIEMBp8DGWCWc4YXYqopxtlC88u1AWMZ8frI9W4=;
        b=Vr7mF7zdTHqz+J6Da7mzS6OtT1Ovcy1oiI4YVVa8B34Z40TpHcHP7cr/w3Q+HQLSmk
         hJxmYcDvESD/zlM0HKFyvHX8Zy/SloSHLRCVEDY0cXMFxrzRyVobk1c8l0tXSChieWuk
         ChospbUmXkpR3WuGvitmabOWx3iSGtITHdICCw2+HnjS7/cXutA9st93YKKoezRhRlzs
         i+GdHOd8axd2SeRxdNDbyJ2d2BX0RH8v7fbRfzjb2IE5JwiAS0x17BOPbC07++Qgb5tr
         24GWAByhNkrIsoG5UwZnyAaU6CNO3oUrnIVs9zSNZSuQ6iNSU7lDeyx/39GNXKeXXnNn
         IcOg==
X-Gm-Message-State: AOJu0YxputjP61zUwJ5SIWw2/5V41Vhpwhid/XUpW5zEamlMcGACpmI/
	R2x7RHD+/cbylQS0JlF/PVEQJqmJSRVzPqWwwBHhBpQXCE7p9+3ZbqdWmUh4xCobhx/gmZs82t9
	dAN81E8Yumq6fbIK7m+G0ITpKcSEDsdVnJ586
X-Gm-Gg: AY/fxX5/lo8YrqVWitoROVjXC0H3ViIRdMNyJrIgeFa852iNyiCUScv8gWI8rq+ClHX
	+ikjT4AZCs6jCfOVm5e91GFSfMILgd+yIDJ2ihPap0FhxGNOCIc21RxeIvxTsA/qq0SS6BiTRlq
	lBTUsR040ODoAPq0YtHn0eEGyoCiNAicIHTroyjdQe/1bMcc4SNrBTnknRE9TBMcBYOtYc9X29J
	DM6q5MO7kNH6l8ufHT30D3lItRMutbEMy1cpd2sO8IBh2jDEWA1bfb6qSY755849WXeOJpKY2eR
	A/bqUxZ9/Qvh/Gckm8XNTNAQKJJybVgQm+eJzZw=
X-Google-Smtp-Source: AGHT+IFbtD6nQYyxUOQ66Kq/CkUtOBcXkuxIKmdCPOJLAAo/6YaxvkHbI6fWTlsT/HU0/NAOiqs5e7Eyf8aLxosh+Ys=
X-Received: by 2002:a17:907:2689:b0:b83:972a:6af6 with SMTP id
 a640c23a62f3a-b8444fa0b03mr1505476066b.44.1768165827232; Sun, 11 Jan 2026
 13:10:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Wesley B <atticusfinch570@gmail.com>
Date: Sun, 11 Jan 2026 14:10:16 -0700
X-Gm-Features: AZwV_QgEnXPhiHIwImLIZndG0bX6sZvFtbyE46RQAbv4TSnvmaKQJsgnY1VBtjw
Message-ID: <CAA7JaUmx4+tqSPSnruQFWAVMd8=b3Gu+v1=wPHJ0JiiN1V84kA@mail.gmail.com>
Subject: 
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 71c099600448cdb639136bb15bdd40767dbfc0fd Mon Sep 17 00:00:00 2001
From: Wesley Bott <atticusfinch570@gmail.com>
Date: Sat, 10 Jan 2026 18:26:47 -0700
Subject: [PATCH] rust: Restore __new INVARIANT comment, updated docs as needed

Add back the //INVARIANT: comment in __new to reflect the
precondition that VALUE must fit within N bits. Updated docs
to reflect INVARIANT comment.

Link: https://github.com/Rust-for-Linux/linux/issues/1217
Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Signed-off-by: Wesley Bott <atticusfinch570@gmail.com>
---
 rust/kernel/num/bounded.rs | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af8ac..07ce6a1dd6e3 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -282,10 +282,11 @@ impl<T, const N: u32> Bounded<T, N>
     /// All instances of [`Bounded`] must be created through this
method as it enforces most of the
     /// type invariants.
     ///
-    /// The caller remains responsible for checking, either
statically or dynamically, that `value`
-    /// can be represented as a `T` using at most `N` bits.
+    /// The caller must ensure checking, either statically or
dynamically, that `value`
+    /// can be represented as a `T` using at most `N` bits (0 < N <= T::BITS).
     const fn __new(value: T) -> Self {
         // Enforce the type invariants.
+        // INVARIANT: 'value' T can be represented using at most N
bits (0 < N <= T::BITS)
         const {
             // `N` cannot be zero.
             assert!(N != 0);
--
2.43.0
