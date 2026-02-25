Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E17A2D595B
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Feb 2026 19:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048758; cv=none; b=GzKMjkCuSUZrLxs9B0QMxrYP9V6HKIebPSr7/1NCXJQ+TXD3/yZsqeqRn5+k7GV2OGldEue/3JI5lSFe16IunjwgS49T0QwjLeJNmMGH37diKqvFnLXDcD4/ifToMruL8Rx2PinPWRPr2Sq6Cw8tiaqFl6CSkGT4G0zaKAaam3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048758; c=relaxed/simple;
	bh=foRzQxT8CkgOXWqmcR/feMK9MJqjzyf7PRMHFJtRYSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WMXOSpYigklwFQv/QERvP8OizeO3waH115m+UKkctxGQtdACuOg7sPzk0Qgo0zG9VR+y0J7QwcNBobAn/5V7WSTlUd4sOi7DSVacNmmX1LTqrBw8YfTw17TP7yquBT/42aswF4pPBEzsECeYMckxz5k40oTs0Adq/6svZ+5MQWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBFb6Cis; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBFb6Cis"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a8a20e6e6so63690e0c.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Feb 2026 11:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772048755; x=1772653555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFGINhiINX8MAdKqo1ZviH2yexjx3PwIBTKhQwKzVYw=;
        b=TBFb6Cis5L0AHOTcvxrW/esgvqp3FGgBWiFmv+GIt59uOhpDFFZd8Aivf7MeSMl4s8
         +W2Xw4WNKqPiJHVVlJT8WM1VkZAAjaX2JmAv7iiVo63Tw8E14Y7YrPlIJrixcg6bWHM6
         Gou6eqkgP+AKoB6sfhpZnR7i5m36KvrXqUXE7JpPpMrLvVBkgICPGcwcSmJYM1sRktJw
         FGtKCjZXICgrpAk5gkRGAflSNPfk7K/wekfP3yHmHfusvUeHT3RWTe+7lLjfBZbV48k9
         xHBW6jhpFQPyjODZVppt7suRYx5A3Q17b2iLwgHOGdO1zB9Mgx+nG0XgR7VczcZWoOQ3
         DmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048755; x=1772653555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFGINhiINX8MAdKqo1ZviH2yexjx3PwIBTKhQwKzVYw=;
        b=jcHXUmMy0+fSV0C1aCtZI457OnxORQJ4QmFT7zaYygMXF1KBrRwrnD8+JoSOqzToju
         tbTBE+2OXkJHseMwwCplmBb36epP2vA/oVX8KY368SBUENvU8fp9jiIvG0iGNLbd8L7h
         kSeZfKxEUjBeDQIwOArzOej8A9f0QfM9uh5XZlu9vXZDmXzXIQfRgAKXlSa7DoTI2PzX
         RdSzhWyUov+w91ZdlIz3KVWthIV3yO2qiRHiRz7kJ1rMta6eQlpD3RAbpBhGhpuQGgsd
         A94ffTypFIIo/R8iUc0S2D8rL3dciPY1UVJNRl3Q7UHtcVshlE/hEGMqWHXE5h0b6cWe
         k1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVOdlXFD9cwE1upgxE/4lngmDYb1Dg5qDhPgzmm+oZK8eyYyx2QpOLNJB75RzKl2HIc52ZlJLzFn0PiPhU86w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqFIuVDsWDPWd9uVkuaetXkuKwDTQoRzsBZcKKIgMV1iqGGjHz
	4ZeTYzgsS7w2tn8nXmQbOEiqNU06rWT/X7Eq2D0TiqVbKbF4E2MgFPwc
X-Gm-Gg: ATEYQzxvv+L0wU70glI0eB42NicKTOUlScK7sTdSrzFgYV+/b20JVs/nrdUPeRpzMPT
	z6KuGsxOUXq8xxQykRtSrdyNMjG0OcNc2K4eXohkLjV+uCt0CZ/zXYrFKJdkLDE26TWwnd53g5R
	1NjXQRmqc6hMtyFppHvbPns1VF/7zTVGHxJVUoc3r8iXNH2iKw6O/EKgKU9t7wp5ynQ1/nlRUBh
	8kP1mG8pMsGcdPld0kQgoxMJajC6ayIp7x9A0YEGNMO3/QpdKeEbbiX7P1FuTMPx71oXmtsZ/In
	ApcuhLUmv+PYJn9Lu4+FRtZDgOfrzB09Q38tSPH7+JJJ7cJ4WESEEBxW0kbkL0TEfRkFDz6LBfI
	/wOBaAPl7uh6oAAnjbYesxEqZyra9p45ZvoFcGTzewMqEpOfk7eDghqPQFMMO/NrsmxNOUCVP6w
	o4U+kZ4rZFQGbp5ygZRKk9JZFomMoY2hjRH56GRNxrcxtpxa4ZLs9vn8KLVRX7BM2ZocjADiA=
X-Received: by 2002:a05:6122:e448:b0:567:4aec:a27c with SMTP id 71dfb90a1353d-568e48f3255mr7001990e0c.17.1772048755348;
        Wed, 25 Feb 2026 11:45:55 -0800 (PST)
Received: from fedora ([190.142.206.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e591c266sm18023919e0c.15.2026.02.25.11.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:45:54 -0800 (PST)
From: Elsanti <santiagojoseleal27@gmail.com>
To: brendan.higgins@linux.dev,
	davidgow@google.com,
	ojeda@kernel.org
Cc: raemoar63@gmail.com,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elsanti <santiagojoseleal27@gmail.com>
Subject: [PATCH] rust: kunit: implement test attr filtering without extract_if
Date: Wed, 25 Feb 2026 15:45:43 -0400
Message-ID: <20260225194543.1542668-1-santiagojoseleal27@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the TODO-only removal of #[test] attributes with a
retain_mut-based filter that works with the current MSRV.
This preserves test detection without depending on
Vec::extract_if and keeps the generated KUnit wrappers correct.

Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>
---
 rust/macros/kunit.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..e064419bfc10 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,10 +87,15 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             continue;
         };
 
-        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
-        let before_len = f.attrs.len();
-        f.attrs.retain(|attr| !attr.path().is_ident("test"));
-        if f.attrs.len() == before_len {
+        let mut had_test_attr = false;
+        f.attrs.retain_mut(|attr| {
+            let is_test = attr.path().is_ident("test");
+            if is_test {
+                had_test_attr = true;
+            }
+            !is_test
+        });
+        if !had_test_attr {
             processed_items.push(Item::Fn(f));
             continue;
         }
-- 
2.53.0

