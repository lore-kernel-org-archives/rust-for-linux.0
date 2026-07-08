Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80874425CEE
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 12:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512050; cv=none; b=fjyNJdaooLTpnTICCAu6S1XinO6Gl7Xhxr8hxId6925F6ay8bE1ykD/zYaYimiSc+i86DJ6oVS+L8YwrQoXfleq1nhLmOB0Q8CrxTRfhhvMtGiOvBocSXk0V4mF4vKAWA/QcPOfr3sFNss/cwQfSeK65By0LMTPjPGcZe3U/xiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512050; c=relaxed/simple;
	bh=OpkZ0xk+76hCO0aRaWhQVNccdyeQ0prSR064OZ951o0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PImdDAv8r1wNr3soM/hlP0FcDRxU/Ju/p5aRqnOBBB86m2r8y6fvAzOM7CsMblqGalzffc96fNu/JxKCI6iQz6orzuQ00kq5Bo+u3urvd96Ep//lX+rVFo3+RCi27ClSqZ5jH+jwUVj6J+v6sa3D+PL6FQy8mL76PGncyZAwoSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RuVF/JAO; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RuVF/JAO"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-4784d0fb9cfso542471f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 05:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783512045; x=1784116845; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vu6GUvcPmiyyVBqZH1tXC1YhgDv4CjJLhz8OFncWHA=;
        b=RuVF/JAO2GwQKbHX7XO/jS0a7qdtH4r6lrMrIfjrUxH1ZHEQXJny5LpvlESn7uDCa6
         /rXHQWoR0V+lQncH42UmVn2U3p2GxzvZRyAgmxjhx0bRC/8cleznqcV8J+AOUWpI98Qk
         ZF+u3IGdtISCD6J1ydHJT1NkBqNk9XhcR70RkvpexjQG/vGuTQZ2xuuuz1p8Gz2yWZai
         XShQuwvkMSoPaMoX1ynUN4aeLKVK1/F8MQ5YFA04TuNANmEl6dcxO9OUOv1rFo7/JTNK
         BNs7Jke1OLG3V7FaTS8mjsGfP77+jP1q5x2RrYBjOfQ8FLkRW/jfhZMX+0X4er53nlEx
         3U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512045; x=1784116845;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vu6GUvcPmiyyVBqZH1tXC1YhgDv4CjJLhz8OFncWHA=;
        b=e1G3nQISGh1rIh4QMhqxaFi6mfB5vNziAfmzq+HfdE8Tuz05e2fBg0Hdyy+1s7yU8u
         oyqWreeCBqMSCE9b3zOQJqxNUYB7gXRAr+rr+D94NltptpG2viXRRJJZKgiQc+RWhmUS
         fsrU7fr+UZ/xf8lCTC2iGTVHbxeruJA8lD4A8fPASSXofmweYxnNJeGEK+Vf2ykzCLhw
         K0c4PWIWdRghIyE+mwYQzac6HTCtzVFZDHaMyUMifAxeNOtEDQzJ5ULWTS5a7t/FCUJF
         c+mGKhUPn60XnsYxbmuTy8YNujAFNVEw5YEogAnM7XjfJsQLtjNoKSR8UjOrPGTjueC4
         7jiw==
X-Forwarded-Encrypted: i=1; AHgh+RrLf/ZMA2pi77+XxRTgYWYscYXO7RhKWz9AeGPdBM4543Dh1qtE1EvrJYyKxqTFhXQwAmz/LeMbl47meir0DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5F9v9CjhIwTiea5BNcCuZEvMLls63EtaqOJvLSTmiACbi5O3
	/t1nRzRa7eREVFGJNaZq6+1Nx2Hjz2zrjVCHETzd750Ov1c95fjmxKItKtBfhRd61EdkjIPDm/y
	k0qdbameMMMvnHGNUSQ==
X-Received: from wrbes37.prod.google.com ([2002:a05:6000:44e5:b0:47d:ea5c:7ae1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:144e:b0:47d:dfea:f729 with SMTP id ffacd0b85a97d-47df07a18bcmr2586261f8f.4.1783512044956;
 Wed, 08 Jul 2026 05:00:44 -0700 (PDT)
Date: Wed, 08 Jul 2026 12:00:26 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANk7TmoC/x2NTQqFMAwGryJZG2gFf/Aq4kJev9ZsoqRFBPHur
 7gcBmYeyjBBprl5yHBJlkMr+Lah375pAkuoTJ3rBje6iRMK4y7QgMAwO4yj3HyaaBFNHIe49d7 3I6KjWjkN1X+HZX3fP788gABxAAAA
X-Change-Id: 20260708-get-extended-error-fix-printing-f6fa51157ef0
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=OpkZ0xk+76hCO0aRaWhQVNccdyeQ0prSR064OZ951o0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqTjvnzddkY4TqwGI9sXYhwphmDDTpMB2OaCJHq
 Su8/9OIg9SJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCak475wAKCRAEWL7uWMY5
 Rkf2EACZWSfbHXgi8taJwqul+Xlu+scvh/2UPFesUYLwaXWX0AwIr22qjYc2hHb9r1/kEeTi/Wl
 cKDHrY/ypP+I4CqKBpLyAdRWC8fDj80Vwna9N85gJSqQRjYUVLZpsEfJL3qA9JlaRnL3qF39Jgc
 R+jzrT9P0WxDK5i5g4lUViPN8asBz5nLeCtb+nCXhsHsXIdBpJxgL/qEf5xWtMGXYvN4RtTdEhN
 Lfio7pqd15FfXOyjjHMPqeKZNJOCwJWcsTsd0SnVNsn3XIuY774+nuwDpzujg0xCOOU14Sdcnhj
 vmqJkXQSzOz7awhsAL44skw1XoM5ucW0fV3jrGWIqp808CozPC5XQAs1N6mtoNGlfp3Z6oWEry/
 bYVmYO/frXcnIW5QV1lFdaT/Ya61pceBzJxnx/FuLMT40ZLxPJpnOPKDoUuZLA35s1Nm7WHoDDt
 bnTzBHZMOqtskJiJ+VQPsFrIar0LJ6Z0OgD1nJlV4Gpy3kJFkB7/nVlDWsLHqXjyW0tNLs44bPI
 HmStBwgjjv3/U946LXwK7tZYGH0YQsTy8t9DoPsbmJ60werDXWWcXh27/YqECvZuJIMpblSGg3U
 RGujjCxqVWYLwc+2ajOGqzMENirqBsieRIL5IT7ZyooBbg6Z63edUBvloySsln3nk92u8wNO/RZ 17y5p4Ct/kZb4dA==
X-Mailer: b4 0.14.3
Message-ID: <20260708-get-extended-error-fix-printing-v1-1-6e293b213b70@google.com>
Subject: [PATCH] rust_binder: only print failure if error has source
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Jahnavi MN <jahnavimn@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The commit that fixes BINDER_GET_EXTENDED_ERROR changed the condition
for printing transaction failures so errors are printed even if the
cause is a dead or frozen process. Undo this change so that the error
is only printed if the failure has an errno associated with it.

Cc: stable@kernel.org
Fixes: 77bfebf11077 ("rust_binder: fix BINDER_GET_EXTENDED_ERROR")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/thread.rs | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index 3b8520813941..bc0ef8927905 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -1273,14 +1273,14 @@ fn transaction(self: &Arc<Self>, cmd: u32, reader: &mut UserSliceReader) -> Resu
                         inner.extended_error =
                             ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                     }
-                }
 
-                pr_warn!(
-                    "{}:{} transaction to {} failed: {err:?}",
-                    info.from_pid,
-                    info.from_tid,
-                    info.to_pid
-                );
+                    pr_warn!(
+                        "{}:{} transaction to {} failed: {err:?}",
+                        info.from_pid,
+                        info.from_tid,
+                        info.to_pid
+                    );
+                }
             }
         }
 

---
base-commit: bc4a9828897871ff3e5a1f8a1d346decbf4ee95e
change-id: 20260708-get-extended-error-fix-printing-f6fa51157ef0

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

