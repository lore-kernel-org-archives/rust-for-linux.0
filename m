Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F2545104C
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 18:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570462; cv=none; b=ccgzz8D0Iiau46N6KS4UlhXDZSIrJxooT1+evbMy485991qfiX5RFveGTItFF6Y6Gi4/zBuPQKknQvdOulm3gAynjGkQ22S28dJGTe9bQE2MxmIVnHoqdku7rYiUyIjBEhsHZR92k2Yu0WRjCJYuw7LF4cALHx4I7eWD2hr93XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570462; c=relaxed/simple;
	bh=NwFxwEzduRthsAklGhzehNehnxCMZ1sKcUXTgzWo67I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TiOTdc0ZOQ4Mz0vG/w8QrvPUgQDW/LPruW9YA1DBk/95HoYWHIf1RAFSKODNOpadao7GrDnoYzorvfz5G1IFwiJYIUtdBDsVbkK9VVeZT/5+pg648AIpuJ2lEE9gU5rL1e1cqjWNXpbxU7BA0EIlwsWsBGsbLhqXRKbKeebkCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=dR5oCnzH; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="dR5oCnzH"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-caf707e3a70so2453896a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1784570460; x=1785175260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKOREryEfKuNZZdoCOQ4fv+T8IxxHM0POBXRDbZ5okM=;
        b=dR5oCnzH+eWP4FLyw9QlFCfGMwGlpvRbtQidrhxxgjiKdvS2gdc0OThfvPK0yk6YnZ
         a7vC7aqTG8+HRV4C9BWaPQ0bEOLZIl+sq6a0VVWTGgdeD9kiCmfAFneN9Q/FC1DDR0+X
         FZYFBUH9t+MphuRux9PfOl/MGw2ln3pROwsV2+wl67Xf2bkSXwYHXvG0McPJ2lZyOkVg
         dWc5BHODso0fpDYeQgu9OBE/uDK0tQNvHU0W0SZMjJ7CHkbR5Bn9xgcP4J8+l79p+t19
         bNGHfMMe9Y7QwRxkxhZIZiEV+xPsMlNSWhFD7grBHAnrNHvZ5e1YnpeTiCTSsp5o2AKW
         LLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784570460; x=1785175260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKOREryEfKuNZZdoCOQ4fv+T8IxxHM0POBXRDbZ5okM=;
        b=Ig+KM71kWzrRef29jlUrk2lke8DDhsPy8uM8tp4Pw6naKul0jLZcHPux2ngOSZ76Ht
         2kAkKJdX+u3aUqydqHYEpHqLXjc+uXM+GVipr8FhzIYMYjsNDDWKXd5+wNB5mUmuZ3/S
         W4pE12RtqVqfQau0t/K+ITN22lvvTzU+eCdlZ89ZzVNtlHm85D6z6nQ3hPNAjiWfevUk
         sNFwnaovh9LVzQnm7zdJdIuQztP4RowXk59woMOnTYi0RX5tqg5eIrpgLk52IUmbfKI2
         MXbWi3Uu+giaS9rTqaVHrWYOHmshcnXIKBKDg6v8ODsvUjyVch/h4ZqG9hlwKwmmDcwD
         GFuA==
X-Forwarded-Encrypted: i=1; AHgh+Rrh3zl3YnPokjGEMYkPK/1Zq1jpHp7ylxdggRI+kKCtjcrks4xTjB1kL+ZZ6+D0wXikEo/45xJEpWtJshS8dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5urHNoFUcAEbOAjZxKDYc94busaHJSS2xI2/1Q4Kda6VFhdY
	NBiyKXgCZ4yx485cSCuP7dFHyhUU5Ufmz5CTVmktjqFCa0ExzheuSUCNnI5Xji5nGMY=
X-Gm-Gg: AfdE7ckRRLNu3t7dxnlQYuAe2wjrgnPT1Ng/cZLgqxlfgjq22ZEsfG4PbMOj1CJXS55
	vORdXJ4h9GWiAvkQttnweFyYGHuEd+xMBEqRwylAxqi84Sk5poGkGRDQzNVjSCNWhk3jnBm3GOE
	c1GcVepupT0/ocx41b6OjKHvqxes0YFfXhTm9b58QoptJVsqwkXIA6NrMSmneF3C6P6Yhu572be
	O0tTQOHq5YxGy119F3XmfXxvUIjtIMhBkU3fShWQXKoTxe7hA8DT+Umd0Is4xqcipUjs1FCDgt6
	aAZIXrIgvjp+8TUy4Ij9uyQp0lD8muAzs/hsyOHIqXDOnmhASqiXTlsLFMI9Vr+2cZfvJQadhO8
	PGRKkWfgts+clpuJAJu9Bs8DtRK+58eT5zu+qUk9MvmDZflnkMiNHRbXLUWVxVcVxDwC6J+7Siu
	0545uf04mpjUxRPqR3VemihoeEOg0yJhC40tnPiCQ=
X-Received: by 2002:a05:6a20:939f:b0:3bf:ecf8:abe with SMTP id adf61e73a8af0-3c38d512647mr21834868637.0.1784570459809;
        Mon, 20 Jul 2026 11:00:59 -0700 (PDT)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3142a1bb770sm42198774eec.16.2026.07.20.11.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:00:59 -0700 (PDT)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	ojeda@kernel.org,
	aliceryhl@google.com,
	gary@garyguo.net,
	boqun@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	ytan089@ucr.edu,
	pgovind2@uci.edu
Subject: [PATCH v3] rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
Date: Mon, 20 Jul 2026 18:00:58 +0000
Message-Id: <c38ed08b34af92e134f5aefc993d349bd1dd11ef.1784569723.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `Registration::bios_limit_callback`, the expression
`&mut (unsafe { *limit })` creates a reference to a temporary copy
of the value pointed to by `limit` on the stack.
Therefore, writes made by `T::bios_limit` go to this temporary
instead of the memory location pointed to by `limit`.

Additionally, `limit` may be uninitialized, such as when
`Registration::bios_limit_callback` is invoked by `show_bios_limit`
in drivers/cpufreq/cpufreq.c. Therefore creating a reference to 
`limit` is unsound.

Fix this by changing the signature of `T::bios_limit` to return the limit
value.
`Registration::bios_limit_callback` can then update `limit` directly.

Fixes: c6af9a1191d042839e56abff69e8b0302d117988 ("rust: cpufreq: Extend abstractions for driver registration")
Reported-by: Dylan Zueck<dzueck@uci.edu>
Reported-by: Yuan Tan<ytan089@ucr.edu>
Assisted-by: ChatGPT:gpt-5.4
Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>

changes in v3:
 - Update documentation for `bios_limit`
 - Use direct raw pointer assignment instead of non-dropping write for
   `limit`
 - v2 Link: https://lore.kernel.org/rust-for-linux/2fd4425697efb6d52459cd886115edd281bd5f44.1784155370.git.pgovind2@uci.edu/
 - v1 Link: https://lore.kernel.org/rust-for-linux/cover.1783456063.git.pgovind2@uci.edu/T/#t
---
 rust/kernel/cpufreq.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 58ac04c650a1..04b39ade32e2 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -817,7 +817,9 @@ fn update_limits(_policy: &mut Policy) {
     }
 
     /// Driver's `bios_limit` callback.
-    fn bios_limit(_policy: &mut Policy, _limit: &mut u32) -> Result {
+    ///
+    /// Returns HW/BIOS max frequency limitations for the CPU.
+    fn bios_limit(_policy: &mut Policy) -> Result<u32> {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
@@ -1352,9 +1354,10 @@ impl<T: Driver> Registration<T> {
 
         from_result(|| {
             let mut policy = PolicyCpu::from_cpu(cpu_id)?;
-
+            let val = T::bios_limit(&mut policy)?;
             // SAFETY: `limit` is guaranteed by the C code to be valid.
-            T::bios_limit(&mut policy, &mut (unsafe { *limit })).map(|()| 0)
+            unsafe { *limit = val; }
+            Ok(0)
         })
     }
 
-- 
2.34.1

