Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D51367
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763338281; cv=none; b=Epa0gVZKNUdzfLq5z36HOFyMXuP9nPX8IhO3Jz01hsdpcdTr+CAXB0gz8UTTvluMdr8rZONOGp+X7xk9ddsx+Rp45FgT1r1cS8E7VN40hOijEGiM32gDOPz7H45GVafi5KRw68zG2a1eF/EqDnYNpOGNHQ7l1nyDT2psbakNpng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763338281; c=relaxed/simple;
	bh=elWuHl1WJhA3q+X45uTVoaGgih8FU+HaVATh5WEeOBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/ZnQc658iphpDVaSZA9c2/fgYs6w4ZBCpUHf8gvAgPXCKIUBRosHNCYKeCILQ9hlsO02xn/ZVmS8cL2rsIHlfxT8bmMV7GBP3z9uq0jahyla0Fj6gJKqUplt1Uu2AVdX1oTZXGxUMC1vrbcFthexEgYaivYitXgvWUl9AY3xrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/rxGNea; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/rxGNea"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29853ec5b8cso44512045ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763338280; x=1763943080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAODmJxOiVZT8ni3izxRjYgzhxVLmJbCxcdrm5qXouQ=;
        b=R/rxGNeatHmW1uay/ZEg+YvzJTC9IV9YaNB4M2hOQY93OoYCEMInxGbMxI0uL/2QVP
         SpVQKoRcP0JPZG4ZF+KEkRhpoQoyqEvuxdpzb7XwFIrMT87SGAizt6tt8F5xszWDHwvx
         /P/4oCeiSR5hbad+6+8MXHo/m74VjRpVhRWdJPIcZo/o232Aq/Nk+nQ099m8n3zOhB1B
         Rxw7AQ0WeWGjyL9AV6Gij/dF2acOsCubZv2hENoYXoFicd5S+IRKQ1lrjKsEMak9sW2R
         //w55Ls+//HpYQj1C8z7BthSyuf8kuyjdstmF8qRMLOO+h3uhaw72hY/Dtz69g4SIy/Q
         K+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763338280; x=1763943080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAODmJxOiVZT8ni3izxRjYgzhxVLmJbCxcdrm5qXouQ=;
        b=tPxctTm1wOhOId4Qwiw4JOh/96l4Nd8hytbCIp3tPGKtGIsePOgO3LxmbWnzpfUlaH
         5P6zdZgVIDf0SKLC1YotlP/cnY89yyN+rubo5ijf3SrSoZby8OGaHvC2idNW0pr0v+MO
         WnxImDxZnaUjP3M4C1Y+NrLHSCbVuXkY7aTpg48Tgj9A4iXA/xoGzfxIf2ZOjsDm7JVr
         ofI/rixE21vPCUwj4Ao6Q04vgm9rXHp+m0MrnlERHGR0Q8ts/QlERZbq4ZVGOe8Uli7D
         YdsHzb40BNks5bv4A9xqkef5sWxZiT6YWmMvu3SY9xfw1JfWoCbnRj4+YxXF6U/Jxbrc
         HMTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqxaENIK/84yec9lExx3HIYJbeSU4Bdw+N8JdQ4swgVZW8DitXgu72LrwjInc2A0BUhuUfMV1d4OtDqiAgYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnGUR2V075fvmHG0Y707D+n9hyjimsaEAwJM/tQ6f8qw9oGLjX
	KODZ5HsUpQd1W98rdKodbFTIkZHcnu57Iteu8PcU21hCNS9txOGdWKF/
X-Gm-Gg: ASbGncuyX6Op2MvMS7DB82g/ShlglNW/yzFeEwSCp7uYwE1BUadX2X94RM1GD6QGfat
	gFC6cY/tfqwiv5x0dYvpmCr1lb9/1G51nrd48ruP+m4XSD7HRfHQ8X8w/M/A0aTTkdwSO4puGul
	qaCRvOzTBN7OknXnoxUNI4VCaW4tZk6u+tO5vpgqbg+eehZnrqmDz+FUkKxULTiTKtx3G0egknJ
	l11H8gUbqSR9voZL2bvpt93nSQ8FeXip8TPSBLpNOIozqVaAhQ4A1Cwyzq09fT8zq7jooA8d1qD
	T4Hb4LdO9movBu/1VPBpD1teBRBQAKoX6cmZEE5dWnUI+SgmYtRkFcKj/3xUzsm7yVFSejtjgmR
	GKAFlYTbh9U8YWGfYtKHhb0QSH9bQesvmz2DOWetyFDg3o3NuybQqdAF9gxBHnJhY0w6tkKSV8q
	EUaeCI6bRWmgL36fhVsSCytySV63LXa52VxswE/20oHGUCnJySWNjMF3HIG+0=
X-Google-Smtp-Source: AGHT+IG1viOUcnWVN3h2qdNTjVI8IAHlY1F+AAYDAl4gQcvAjcGZSOaQL/30x0BRlIYfDq6w2lckiA==
X-Received: by 2002:a17:903:19e3:b0:297:f8d9:aae7 with SMTP id d9443c01a7336-2986a7556ebmr120200275ad.46.1763338279669;
        Sun, 16 Nov 2025 16:11:19 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bf0f8sm118374365ad.89.2025.11.16.16.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 16:11:19 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v2 4/4] rust: sync: atomic: Add store_release/load_acquire tests
Date: Mon, 17 Nov 2025 09:10:35 +0900
Message-ID: <20251117001035.4068507-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
References: <20251117001035.4068507-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimum store_release/load_acquire tests.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 09b357be59b8..51e9df0cf56e 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -137,6 +137,16 @@ fn atomic_basic_tests() {
         });
     }
 
+    #[test]
+    fn atomic_acquire_release_tests() {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(0);
+
+            x.store(v, Release);
+            assert_eq!(v, x.load(Acquire));
+        });
+    }
+
     #[test]
     fn atomic_xchg_tests() {
         for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
-- 
2.43.0

