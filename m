Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F437F732
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440568; cv=none; b=dghDSr1cwfc1xY81xaeRmT2dtMTPBb8mwggk3eNH6pfC9f1Ki58mhj/jdHZaRT9o+XoNpkU8ITfx+vAHxLz6v6Ww1TDpUC8MZqQ04hY+r8qYFvYgLCHhKta5H5wvq/8WvVXQWgD85++lm+5ybhra2hpGfoM/uDwdvVzZtkYiCdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440568; c=relaxed/simple;
	bh=homsJuCQjKnZ0xNxouQDRH+hnm4JjTgYjqEZCArzYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lEKT3B7cg6Xi7WkNZcvCT904ecgao/2SVIBvrQEG3GW8bOgWGRyxoBTmDOG3v6PLTEuWR65XOHhGoPdDWjVSmaNsroWOoOYzuPODcz5wJIFmz9ykb69rXWxwUA39SQ8ufboBu2y48z6dZXUXb6HSwd++AvAvIVrrZ/w+WyXX1Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDk6RWCO; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDk6RWCO"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so747157f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Sep 2026 09:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790440561; x=1791045361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=iDk6RWCOBJSBW04OJUhZECHaKyxqjcKQSSR4qMu3CLMP2c21hdHwXjduwSW1uvg6GP
         g+45Zch6/ufh7FTJp+rpyWG7PvLnvKXp3aMAH7b+ocseRt9kUA7a/T12PfeMujaG5pDv
         uRJuapewlnnhZ/KyViJ0yg3EXQdlsgVTIX0wTYKqeq1O7vZPUxOMbDiRQguvtn68DJc7
         pHtOSH1qTr1Pbea57l2PCDf+8n9wjoms7z33nBO8Mz+xUT6FrHmHD9xzXonEN0X70830
         8ua9oO0bgTl1oIFKyYU06qEbaPrxqbxxI+7V1HFZwyHWT5hDF0CI4m0WaADgl9uJyQin
         h8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790440561; x=1791045361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSUQA8gq1RkCRhOMqlGaEY8nMSV691WlNynGk1mNlWM=;
        b=QPHnJY+1q1A7fzp4j1eFAC4ByBcSWUeIZCCIbGzs7B6P4aQqefnyn94+WQBSpxQMbz
         2oNNdvOl9JUIOWVqNB5nND2AnA5qOxCIWr2qR6Nn1stBKPyAu8dqFsGRBp+uQVuSDU7A
         qzSPEWMkd5VImIIjBnlRiU/vjXOmr1VTHdK6Vn0QX45JKGkOuldBfAu2Qrf/LHrXTWfL
         kIb5yT2FHmT9Apjn48EYuZmGVRMmb4BcSd8HWgCwOsv9xjcBhcNckT7mu+GJN7c+stNZ
         Tnv9MQMKafIvSdOCvBo0V0Ae0kJrznBWRcYhgSKvVtekh8965zYivFhhNSEfu3vAKZyU
         pvFw==
X-Forwarded-Encrypted: i=1; AKwUvBz15i7mX4dmW4Gc4ZfqfyaH2pqUepK0Ztt3eXesrorw8EloqbPvSyB2UC3Yj1kSBYS2gpXVTs9N3vGEIh4yZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI3MJGYmVkKppZG7PUcCQXy8XaXk+OqsWY8S0T1yyF7yMyGeu7W
	W6MaeaD7cwVzAldVjNhh7gioOIg9t3kKNBazraUOWPbgEMAZ94ddxeTD
X-Gm-Gg: AYBFou1EUtOg0zEuNQhb/a1K8XCRpK0VmHNWoBh8o0xnCHEbYcqOmLKifYiMxPGIdC4
	4t/G3Ijlnnrs8Tmfq1TOF9BBS8l3kXOqY0Mz0jLquo4aog7DW9+pOpzALmL8Qo0QrCK6eMSs474
	8qVJyAqNOkUG4jYs62HDRuglo9dYIbf2nSjh7OtYaEYY4loy3qB6n3eTQxc+R92yaFqaFACjUJ7
	Zvk+1GQXrWN1kESB17MwCXBI9SUFf0DntLbGqR2wuZAkHRxvmRRSygiuM4pWQrpy3RposgmcIFp
	7/IkltRmPu/s049bUAoEfzaXWCDcPtMp2fQFhYnDhBmFFjM4nAOs6zT6r6Abyfrwi/RDSsKWoHS
	4kWYYAgORPVBJXXJffhg+bqP2p+QN0hMplvUu1SYl33lCrLo6uh4U013LyKaKAOhmg7oP9cd2uh
	sLgxBg8iiRxVm4WSefwVFwPKFToi0UPONea0eRjWuiNkvdwP0/UzTOc7Pk2V+yM3S7aGWJpiXo3
	NAaHI2q9UpFxfTgBKHHpSEzaO6mkgVeq1s1m/jCn6bjCwoLL0NtLFmEVljmjMXcKTM=
X-Received: by 2002:a05:6000:2383:b0:488:81d4:8bfc with SMTP id ffacd0b85a97d-48881d48c0bmr9652514f8f.11.1790440561402;
        Sat, 26 Sep 2026 09:36:01 -0700 (PDT)
Received: from moosama76.. ([102.44.245.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355d96sm16176146f8f.17.2026.09.26.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:36:01 -0700 (PDT)
From: Mohamed Osama <mohamed.osama189110@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	longman@redhat.com,
	lyude@redhat.com,
	linux-block@vger.kernel.org,
	linux-serial@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] rust: serdev: use DropGuard
Date: Sat, 26 Sep 2026 19:35:50 +0300
Message-ID: <20260926163551.52371-5-mohamed.osama189110@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
References: <20260926163551.52371-1-mohamed.osama189110@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the ScopeGuard usage in the serial device bus implementation
with DropGuard.

Use DropGuard::dismiss() when ownership of the private data needs to be
transferred without running the cleanup callback.

Signed-off-by: Mohamed Osama <mohamed.osama189110@gmail.com>
---
 rust/kernel/serdev.rs | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index 17ca504b7f8d..dd43b159b461 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -13,6 +13,7 @@
         to_result,
         VTABLE_DEFAULT_ERROR, //
     },
+    mem::DropGuard,
     new_mutex,
     of,
     prelude::*,
@@ -21,10 +22,7 @@
         Mutex, //
     },
     time::Jiffies,
-    types::{
-        Opaque,
-        ScopeGuard, //
-    }, //
+    types::Opaque, //
 };
 
 use core::{
@@ -174,7 +172,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             }))?;
             // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
             let private_data = unsafe { sdev.as_ref().drvdata_borrow::<PrivateData<'_, T>>() };
-            let private_data = ScopeGuard::new_with_data(private_data, |_| {
+            let private_data = DropGuard::new(private_data, |_| {
                 // SAFETY: We just set drvdata to `PrivateData<'_, T>`.
                 drop(unsafe { sdev.as_ref().drvdata_obtain::<PrivateData<'_, T>>() });
             });
@@ -204,7 +202,7 @@ extern "C" fn probe_callback(sdev: *mut bindings::serdev_device) -> kernel::ffi:
             drop(active);
 
             result.map(|()| {
-                private_data.dismiss();
+                DropGuard::dismiss(private_data);
                 0
             })
         })
-- 
2.43.0

