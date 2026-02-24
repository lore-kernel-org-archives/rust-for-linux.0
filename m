Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8BC2C026C
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957013; cv=none; b=rjZB1GG8S5W+AtCi/FFMucnpfHFqJPnIuwP/NWtFK9QqZHiXOjAVvgnWLnfC1BjRBAv08Qpi4AVdOT9gtj5/dmZw99Un+plkPaceGe3GdEEqx3/JEVxoYyvkn94Tl1rki+vCFllwDoAAPMhAiCSaiWBikMIOVNsu14GclJ5EZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957013; c=relaxed/simple;
	bh=1tkVRXlNkR9Fmy1nO0DHn37Is2OgEtPJWOq31cgnHx8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Forqc6jX9h5xuAR5vF26vT3DiFNj8t04cqbmHBeOJaedsSm5+WBtavbbMOvNEDrxsZHiOpQtwk1xqqgkPRasLnyrNs6g/TgPmaHnV0sZgTb2vYyyQ1CEQvEg5ktrrgzuZgv0gZQcsc+L0Hmpd8B6HB58YUACV5xCSw2dCRIiZSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K7nJ35jY; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K7nJ35jY"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8839f45c3aso136660366b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 10:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771957010; x=1772561810; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aWRna/o7J6EKgHI9SPvVfoppVmpzZKMT5lNJXeS/XVM=;
        b=K7nJ35jYwW6QSefvIXFHZ/w0StHGqePyGy4CB+e1tzVTfvrrzcudp5CfOH9k1xBpEw
         A70536GTviy7BZ623hSZHh01+9ZEL7Yv7tdf7Iuw827lR3D8qTe+xXEtZYdt2U4G+2NF
         PcvwRfVErv3B3rWYC+6XwjRNAsaN9DJy2DRovK+JfZ6vRdMtJ2WqR/PS3Jr2EjDvDcN2
         1yt0GgZAxZYudutNA/59hhhF7R5bZvN3sk0gYnFOEVuPwaKoLA2kCkln8ZYiKMy1RhBj
         RrUrRo8ZwQcxCIBzYuLH4qwDR7abX5h9CxcEcz5/R56pNFZaFRUcwANFVcdj3p1rPM/V
         oUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771957010; x=1772561810;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWRna/o7J6EKgHI9SPvVfoppVmpzZKMT5lNJXeS/XVM=;
        b=BvnjxHpAY+TkzJ5O8TEAAR7oBZijx0aBfCftDq+dzk16tX9k3JkJzHODUVYh5V3i9G
         +scX6VAjHx2Vw4kgzB9to9vzGW1QYL53qMS83UjUowT1Ky1lZXevK0i06HdIOre0Soqx
         5U+INl2TpZEkR30D7w/P+49gpbVlwNeB0cNPobemSrmKd8p2g8DnmmZ+xB9uK2CWyIcz
         PWdZO9qBKGvgf+eCcgs3pnbpEaSNwRNdjLEHRSemrQ76JkeSg82u5Pql0fag3ZO68kv8
         +XHCooyybCG9Re2YfzO77kYppGZm/KMWUgWb0QtbhhAZwDySCmQOBXM8vtQl8zCRxQ5w
         nBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzOE0PSbUiYJ5vhYz3w1lho7eYj4kNvP6PEsDBvgwo7HXXCjC5Y3yPgrVO6maTBpxXrdR/4xGuO99QGNofwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+iBOEcUHldtiIgEsUQ1UgQSf19WnHrdBFY1n5TQJKNLD/Z5I
	K6GsuCiREjN9KERseK11J+CPOoxFXWUY4CVkHwd4iywVfXTxt/+s5ekHmp4Y1szUVE96RKjXRfA
	7kA/VpYMnYF/wQZYQMw==
X-Received: from edya24.prod.google.com ([2002:aa7:cf18:0:b0:658:143:cbdb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9308:b0:b90:47e6:e0ad with SMTP id a640c23a62f3a-b9081b6dc76mr879570166b.56.1771957009985;
 Tue, 24 Feb 2026 10:16:49 -0800 (PST)
Date: Tue, 24 Feb 2026 18:16:39 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAbrnWkC/z2NwQqDQAwFf0VybsAGFe2vlB5081qDZVeyIAXx3
 7t48DZzmdkpww2ZHtVOjs2ypVjkfqsozGP8gE2Lk9TS1SINTxYVzopRL04RvHoK/E1hYYg2vbS TDF1LpbM63vY7H8/XcfwBuOaJD3MAAAA=
X-Change-Id: 20260224-binder-dead-binder-done-proc-lock-e2d4825b2965
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2651; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=1tkVRXlNkR9Fmy1nO0DHn37Is2OgEtPJWOq31cgnHx8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnesK7Fm0Sl+mGuKgqGOVK8Oy8n4pDAOTIp/Zp
 +CO0DK71pmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZ3rCgAKCRAEWL7uWMY5
 RqGID/9T3kWXlSFd9MQx732cdnl8ctymu3Br4l8pGx9Bf9S1XAgLb/WQhisXY2j5d+dfWNZvrZX
 uq/mUzgzfZdwiQcIng+XyT6bsZnyN4Q74Z3sjsgqsd+inEwf3f4OlQi9vzLqIMtHPuWTORDp9SF
 suvPnCik9X5er95WBsJ1UnBSWjmZ8HRcHIcfjMQD7OKMIdMUr3lybpmu0F+aeFPReD2ImQJO52L
 9xPgMRZnwL8uy7lVJs87EgyzNvpkcLNjeCj9vXHZs6F26aNUofX7OFeDsdXil91VKRsyiMxXA1p
 PKVIbsKNpRVxbhJaHQX3TgLu+8P2eSGuOLutwuTUaD1zkrSeqza3S4z5NBu8gZwJFwiG+hWASUK
 FCQjBFjx3EoXipnl5tqjVL430AOGZsJ6z06eaH7j0tBsjze9OzmeR3YbzescZEJuLZM8dCcUXBL
 st6on8qGd1nTQdSN28cmrKHhTo120jv8mtdEnTlurteGM8kDtCC55eEDNHaOCntzsxu41LEabId
 PHMu6GnuggsLk5uOE9Zp1cKdk2Il4NabO/5aKAxImfNJAkgWwk8caC0nEKy4N/nFNHV9Uw9HOB4
 lmtqD1syRclXcEnv/4MQO1wCoaf48SW8O+9YJGEM1jVOZcO25hMu5J8OhyI9MleD2t1cOW+9r1x 2/6f+19Nv0foVqA==
X-Mailer: b4 0.14.3
Message-ID: <20260224-binder-dead-binder-done-proc-lock-v1-1-bbe1b8a6e74a@google.com>
Subject: [PATCH] rust_binder: call set_notification_done() without proc lock
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	syzbot+c8287e65a57a89e7fb72@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"

Consider the following sequence of events on a death listener:
1. The remote process dies and sends a BR_DEAD_BINDER message.
2. The local process invokes the BC_CLEAR_DEATH_NOTIFICATION command.
3. The local process then invokes the BC_DEAD_BINDER_DONE.
Then, the kernel will reply to the BC_DEAD_BINDER_DONE command with a
BR_CLEAR_DEATH_NOTIFICATION_DONE reply using push_work_if_looper().

However, this can result in a deadlock if the current thread is not a
looper. This is because dead_binder_done() still holds the proc lock
during set_notification_done(), which called push_work_if_looper().
Normally, push_work_if_looper() takes the thread lock, which is fine to
take under the proc lock. But if the current thread is not a looper,
then it falls back to delivering the reply to the process work queue,
which involves taking the proc lock. Since the proc lock is already
held, this is a deadlock.

Fix this by releasing the proc lock during set_notification_done(). It
was not intentional that it was held during that function to begin with.

I don't think this ever happens in Android because BC_DEAD_BINDER_DONE
is only invoked in response to BR_DEAD_BINDER messages, and the kernel
always delivers BR_DEAD_BINDER to a looper. So there's no scenario where
Android userspace will call BC_DEAD_BINDER_DONE on a non-looper thread.

Cc: stable@vger.kernel.org
Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Reported-by: syzbot+c8287e65a57a89e7fb72@syzkaller.appspotmail.com
Tested-by: syzbot+c8287e65a57a89e7fb72@syzkaller.appspotmail.com
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Sorry, no report link. Was reported via internal issue tracker.
---
 drivers/android/binder/process.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 41de5593197c..f06498129aa9 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1295,7 +1295,8 @@ pub(crate) fn clear_death(&self, reader: &mut UserSliceReader, thread: &Thread)
     }
 
     pub(crate) fn dead_binder_done(&self, cookie: u64, thread: &Thread) {
-        if let Some(death) = self.inner.lock().pull_delivered_death(cookie) {
+        let death = self.inner.lock().pull_delivered_death(cookie);
+        if let Some(death) = death {
             death.set_notification_done(thread);
         }
     }

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-binder-dead-binder-done-proc-lock-e2d4825b2965

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

