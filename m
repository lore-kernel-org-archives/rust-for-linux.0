Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB19359F9D
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484444; cv=none; b=DJKmLs2aa9YjHM2G4RuXuLtixqN7JiQhIa0+l1vlFz74wVV6ixAG/gpbxbZ8Tv8j+Z+rvt9zi25WkeCAsn+tkIMXbLinHgZG1seQoIlF+OptEzWCmphp/U8pNmUsSTAkD8xNiNlHqsMP99BXWKIXh34CwZ8/ifbQoFLvrAbKJDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484444; c=relaxed/simple;
	bh=SKYy/YgRp1r9S3quaeIxAAdqBkH5PhOTty0BpFAOeK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SR20VGwV3j0Z5hDicQyUXJrZZH8fm3QSbwpP+v416llyKJdEkudVT0hPgpC5hJjvxWZ1f8OQqc3eXWr7kfNgw97SyDiKqN68W9MB6nONWAL5GC2CvbGEvA90Z2tw7BxisHUFdmNIr3CUpUozxXYqaymoamQ5asqKHG3nG7y2doY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqL+nI/v; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqL+nI/v"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-595819064cdso7802867e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766484440; x=1767089240; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lae5UGB0sBbMmlSigC5w6caqUQw5AlV5GUxciIGUOA8=;
        b=XqL+nI/v0HfUPw5xPn1kwOJmAg5MYdhM38F7q1Z7TrWIibgJGI7WVHpEU+IKDnTXtT
         2lI2wJtgFCvyrFtdQsgXDIyg/ZiygrfjyJs2PzdPX0mIQzGWle4Y572NS8qEScc3BSP8
         QeeP2tPMxlxTfcD32/1l+f3QMNhC9bnnkSQUUCV8G51aGluRbOvOgvmb7AVPXQ0U/deE
         xwXXjWpaEo5AOtu2Fb1gCnPjAoFa4uKfnaoviJP5MWKh/wUmcXhWWkm9dMq3uPn8vLxf
         bOFUzMYhevrTPC2yqjXqyeDIPEyDc4lse8mcQSGn92BM+eYHG0g3h2ijNUBL5sxyRP6+
         AM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484440; x=1767089240;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lae5UGB0sBbMmlSigC5w6caqUQw5AlV5GUxciIGUOA8=;
        b=RW0mdQ6ch05Tpgz60qbMaBZvFJW2xSLem6eKHrvlDA51yuk/61bug2FwY8YVHnb7zD
         EVg/yFz0EUi3ZLhK19UEJDSJaRYOPaeSyD/c6aCvh9GokotKZL3D5eh/0GTDwf7N24+r
         vPY3aYKzWC0P/biZ6JrPjrATSGFesIK85X49b4PveQGxj9JMjfUXllgx0sKpSglC/hWL
         pzm/Q0U1UTlvHAnKb1COyVcoR2WKpQRn14r9Q4mnis2KHtjog7+fNpK9TZ6o0jO2v39V
         wqCYBEW9UtLSxs1NvpFqD1MvbqvbEIyVE0+WF/PK5kuSvejn1DYJV3Ie2xy3r4mNQHyk
         /7ug==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5VH3eYZ129RNN2zzHiU4OpBMLC+am0L+jvNLaPI+rcm68aocpMhHmH4FmihgezgwZgWYrtl1BPHXDWlr9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8gRg77B3frmvrUWTeUEyWDqKH0Ze0oCcXsMza+NzucqdKgsOq
	0BBSjxyH1IVPQCVJDy5ZKV91eCittzcQRHoH4OtLkbTUD8+/3hx1Y2Rt
X-Gm-Gg: AY/fxX6QEmG/31U6DsboWTJKfldRZ6riWf5XTyxeUTSk7pUUICZjU8ByHLvEtFgNaIB
	uhBjWdpftvvFX4hbgFEaY/oWnMFOrTiLpWpyrZzlbJW1UJOp6g1AMfz4YW/S/gpEE4dopRT2nI6
	ere7kmAnLyqvjHjIleUGOhSuIn27WipqduQ5xmZGoI4lHVsWBhDtdSIFpLEyw0254um4J56Qb9G
	xYCkZPG7xC4hWTAhzghMRF7O9VWXcTYnby3MWIJhHM2S/CmFm+h2gssm6pqDfaIN+os/5NtQ8Go
	8VAJeABcXtL9FUTVtzc28O3p/NDSBtzMZiZ+irVzn80MdiUI0aljtnDZNrrWLo0OC+jvZaEj5aa
	4q6i7Lv0Fzjz0+x8LR5+9fKP+pmoogg9t7hkBW3khYN19i4S1QoYlz3LeX0g366Zi8wcYHzlSp9
	BGXJ2A3j/V593jzZImRZ2NmfPQeWjFfXjchMd8IkuLGunujD8Qu0N8I9VMozriW8L3OfhKvfITv
	1ubPQJ47L8=
X-Google-Smtp-Source: AGHT+IGN8Vxqk7TEa/HSRtqK0wjzo/ktRj/6q57PMgBH4vZllHFBJy79YxEqw8earTNcRnAgxsYsVA==
X-Received: by 2002:a05:6512:b28:b0:595:9195:338f with SMTP id 2adb3069b0e04-59a17d70bf8mr4996009e87.23.1766484440099;
        Tue, 23 Dec 2025 02:07:20 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (87-95-81-50.bb.dnainternet.fi. [87.95.81.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5e32sm3865918e87.8.2025.12.23.02.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:19 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Tue, 23 Dec 2025 12:06:17 +0200
Subject: [PATCH v2] rust: page: Simplify overflow check using checked_add()
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-rust-page-check-v2-1-fba3dbdde1d8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJhpSmkC/3WNwQ7CIBBEf6XZsxiBkIgn/8P0gMu2bLSlgUo0D
 f8u9u7xzWTebJApMWW4dBskKpw5zg3UoQMMbh5JsG8M6qSMVNKK9MqrWFwrMBA+xFlaRNQWjXb
 QVkuigd+78dY3DpzXmD77QZG/9L+rSCGFHxQZNTh99+Y6To6fR4wT9LXWL6Dpu6euAAAA
X-Change-ID: 20251219-rust-page-check-819ccc39c53a
To: Alice Ryhl <aliceryhl@google.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766484438; l=2211;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=SKYy/YgRp1r9S3quaeIxAAdqBkH5PhOTty0BpFAOeK4=;
 b=eDq3mAAdL87bd1kGflfZuQemmgrHgZMjA+4U7KTkOhoEVqa5T3AaiJX306VXEbUHbwR8s+PF0
 Qh9ieyXxc8nDTMB3+0Pbhz81iZQ9WoAI2AQICkKYLbFmV6GUZS8BKHm
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Replace the explicit bounds comparisons with a single checked_add()-based
range check. This avoids redundant comparisons, makes the overflow case
explicit, and results in simpler generated code (checked with godbolt
for x86).

No functional change intended.

Reviewed-by: Dirk Behme <dirk.behme@de.bosch.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
Changes in v2:
- Added MSVR todo (Dirk Behme)
- Link to v1: https://lore.kernel.org/r/20251219-rust-page-check-v1-1-df2e52fa3bd5@gmail.com
---
 rust/kernel/page.rs | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 432fc0297d4a..cd2af7e4c357 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -239,17 +239,16 @@ fn with_pointer_into_page<T>(
         len: usize,
         f: impl FnOnce(*mut u8) -> Result<T>,
     ) -> Result<T> {
-        let bounds_ok = off <= PAGE_SIZE && len <= PAGE_SIZE && (off + len) <= PAGE_SIZE;
-
-        if bounds_ok {
-            self.with_page_mapped(move |page_addr| {
-                // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
-                // result in a pointer that is in bounds or one off the end of the page.
-                f(unsafe { page_addr.add(off) })
-            })
-        } else {
-            Err(EINVAL)
+        // TODO: Replace `map_or` with `is_none_or` once the MSRV is >= 1.82.
+        if off.checked_add(len).map_or(true, |end| end > PAGE_SIZE) {
+            return Err(EINVAL);
         }
+
+        self.with_page_mapped(move |page_addr| {
+            // SAFETY: The `off` integer is at most `PAGE_SIZE`, so this pointer offset will
+            // result in a pointer that is in bounds or one off the end of the page.
+            f(unsafe { page_addr.add(off) })
+        })
     }
 
     /// Maps the page and reads from it into the given buffer.

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-rust-page-check-819ccc39c53a

Best regards,
-- 
Kari Argillander <kari.argillander@gmail.com>

