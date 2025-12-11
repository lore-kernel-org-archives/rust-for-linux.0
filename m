Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C629121CFF6
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 23:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765494587; cv=none; b=n9n3kHVS1EV3mXXe9UpqUf69gwAgmXL8cIHtU/HI6lE1DVLQUSkPxeFKxUCevrssPkFjRi4c/EwtIS7k+ruPMlDYkxC/ZV0UlwjgmxkaILxhvSwJfrr+rbAGdxqkQrfxpB7vh3s0IYvl2FH5oio5ZHak1HjOqYbiJ6qTUY0SkZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765494587; c=relaxed/simple;
	bh=na/e8Ql1be2OrYW/sl5lAu/k9Gwutbr8SyJslevM0GA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hAgwMgsG+K2UsV+L/t03PiH84GYbDXWKbRMXpQpGSjeg3i2uURjXnxXd5Az4BrwUSKaLWP9geDUtqfFfxTLhP6z7mR1DZXc/s77cxyy9LE6xCrUj8XTdLrCvNy8fQg1a1RMmaEuH/Bhv2z2Ww/1PDmCtcnzDMFeVltjOGMIWwfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjuoESWp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjuoESWp"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7f651586be1so57169b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 15:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765494585; x=1766099385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSF4H99YhQiFDX2coba9JCqe5AIZ4rnFNqgLaEL1ZVI=;
        b=OjuoESWpB5wCWZg42e/WiC74GH3yVHzTUUrF0gD5KLl7do6SQ10QN8soYEwm05ER5u
         pP0sUqQaZQeerndLZzuwHhvVa+cDpG8DKc2l10VVM8DecZoAQrbqeThXEPvBVJPPzjTS
         BS4SmW5aEGrgqzCS0rBZku/GjjMajyMryaXLgY3r04D6VRim0fDUnakncep4ylSPAXhO
         qGNTs1Dpo+1BCHAccMhdN0Do1fpXHlWe5/hI31u/k2WXa6RfLx0mVBFVzjjfk1xQP6ta
         4HeTPnOb69k/H/mKbhbcFfbD741Pc/BV+9EOt266uEaJWCZ2ltDpdyAWt16sivfHGNFo
         lyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765494585; x=1766099385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSF4H99YhQiFDX2coba9JCqe5AIZ4rnFNqgLaEL1ZVI=;
        b=fND8tt2d/6ivK17d88O1rYEwepC5GFNuj73L55jA/VADippoN5Hy3Y6zBbmnWcsXmz
         dzkLGci/6TL3o0rkQbztpiPjLcKakfM2lQINPAwvZHyAIdBO0uUVWVIDPnfeHSUZJS9K
         SC0ngqeMGOJsDnvM7CjAXeeTWD3gppqwlMQAOHSb7lW47VI6C/0Ri+eztNClS76Cv3Ch
         Y8pIhzbMlHZlKlfKsq4n7R/vzAd8zddCtuZu+noJ2uCeIbex0ZZ2tw2xkTkcmjYsZ7j6
         JCvj+IoGGSkoLugqP7yELrVYa8s2E7ekgaREMQw28hrzvSM7GnOhf94q3ZQ+9sIekupV
         er2w==
X-Forwarded-Encrypted: i=1; AJvYcCXhqsOH4KlHvKM3GM7O6L/AcZqSjmjSkNeJRE5Akx4i4ZJtFYFg33Vk4qtUzOMS46bAZ/BAOufg5sOW4oq3tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy7wuAhYLKDh4XMWcWy9JTCt5ekrVBHMnMUogyC75Aeuq8ZJr1
	uVIU+T1+mnPETiPM+CyxlRusRTsUrTbtb2jYGZqdspqxBnj5EJMLMihO
X-Gm-Gg: AY/fxX781vEw1L/rHrCFM8iGeUDM3iSORQTfmNssMJ//ZxIpr5wj1mBm/CAGDzKK6Bw
	husYbVX7fbiaId8iOFBSu00ieEtCBE3jJ8HujhK5kvpN+4aEDSpQmN5UsJHjqnhJerZc3BHIWbx
	aCAKihK9jrePdq+pIqWnVYEKLYA84XnFwVmAheFRteveWBglyH2T7ftgwnTKRUWapYnKjfbfZBJ
	x+cCrDJP/+DnBSsegDVre3eb9n33WHgC2/Ca5XLQn/dFwWf1X5AyaDFT4IPmV7NMkUQNuTgSV8p
	fzaMmyZGxRT7jGE855ccqq+SrmE9nQSEd34j1+Ri4QkjEY26R/Vhhi3LE3w006ro9IC+hlBfh3C
	K0DN8QAQDYt0vG59Fx7cMhZHW/753PC70W7RHiPGs4yzdWTSyH0OZSVRPHb0XhnAZ8p0rN+vqWP
	Ori92SCUTtN7gCqh6uUR+Z42BBpELMFJFLIj2xOHnBo2+WsIh3WQ0z00hO7Zwq4A==
X-Google-Smtp-Source: AGHT+IHduTDxxv36O+HBA20lYGvCkuUPVC6aSI/S4ZweLzlevV3WNU0szlOBYUlZhYMfxKd5JFFphg==
X-Received: by 2002:a05:6a21:e098:b0:2b9:5bdc:8e28 with SMTP id adf61e73a8af0-368578deec5mr4107897637.15.1765494584996;
        Thu, 11 Dec 2025 15:09:44 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2bfa0845sm3247728a12.28.2025.12.11.15.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:09:44 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: ojeda@kernel.org,
	a.hindborg@kernel.org
Cc: aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v1 1/3] rust: sync: set_once: Add fast-path check to avoid expensive cmpxchg
Date: Fri, 12 Dec 2025 08:09:17 +0900
Message-ID: <20251211230919.1303926-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if already initialized before calling cmpxchg in populate().

When SetOnce is already populated, this avoids the expensive LOCK
CMPXCHG operation and uses a simple load instead.

The Relaxed load is safe here because it's only a hint; the subsequent
cmpxchg provides the actual synchronization. Even if we read a stale
value (0), the cmpxchg will correctly fail.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/set_once.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
index bdba601807d8..889d37dfd17f 100644
--- a/rust/kernel/sync/set_once.rs
+++ b/rust/kernel/sync/set_once.rs
@@ -80,6 +80,10 @@ pub fn as_ref(&self) -> Option<&T> {
     ///
     /// Returns `true` if the [`SetOnce`] was successfully populated.
     pub fn populate(&self, value: T) -> bool {
+        // Avoid expensive cmpxchg if already initialized.
+        if self.init.load(Relaxed) != 0 {
+            return false;
+        }
         // INVARIANT: If the swap succeeds:
         //  - We increase `init`.
         //  - We write the valid value `1` to `init`.

base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
-- 
2.43.0

