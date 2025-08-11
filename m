Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ABB2D3751
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754914492; cv=none; b=d2aF6lwy52rfWDFraaMzP2Pq8wv4v/8eYIOt/uS0xesLl81aMNZaqwLYQumT65pixKLt4XG4x9qhZIB80eHzxUHWbIRP6ZlxxNQqKlNlfWXPN81YLtGDtlnzfVeYovS/MaF7kfcnta+8kh6GYbaJuOCY+fhTTwItSYoGiBm+/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754914492; c=relaxed/simple;
	bh=qqCr/4gDVS3NsvAL73WpOmWJdMo7mPjB6jMNNSC4EvA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=plDCV7oMG34bQkjoq17pzxFIoXCqRk2K/dL8FHMZLfHylJ2My3VZItkVt+JIOJdMXExQmNxGX3O90qeGr5tccgS1/3o64m0jwxevfVHIIISUx//e1W3qxFOYp/6eD8PDZD/8/vx47632J+vY1HJFPm1WBMtYZA5vLYBcIPsvP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RdyMxZF7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RdyMxZF7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-459e30eeea3so28725715e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 05:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754914489; x=1755519289; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zIr2K+//WU5goaIhZNaZHgeubyRmDPFT00OzR6uRZtg=;
        b=RdyMxZF7a3RakLdMneEtPHddo2usSyjBHsP53UVrnzBnTcKuLfnxMcrXvpu6P4o+j8
         M6ku+DZZigc1N7tQPuMB/pGnYr/u6RiWUHqZn0WNiaC65LxS2e0lad69Kqeb3q6X7Tab
         AsUbC2DG8Zcrhog39n+kTfe20tayOEZlW2X3SDSBPvIoGvpUvJQFK2vHIY34aSEgJgo1
         DuxyODI/R/i9ev2RML+GOhBoqm43TQDidXOM/+ACFNUJQGY8tM5xeFLPnar+Tz+XBiMV
         u+stUVTJi6aMrPr2BzG82qxJ+CEUqMj83f02u10KfRBH/9gQE3QXDrBXGgTkK9J5NZCe
         +OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754914489; x=1755519289;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zIr2K+//WU5goaIhZNaZHgeubyRmDPFT00OzR6uRZtg=;
        b=SN+wrJ4yMYZIcDNlK+xrDiKqoz2tlrVKVspxtZNzfU1g9Fj8DYCgAgqFgeFWNwVm2m
         Ra56XR1lYASt0oudcBLeOraomNg3KlqpK4InVTJFpTM8hA70s5BK515cOQ28sM3b+76t
         T8vkO1OmBNWlN68VDlX/T4n5vM5DQmN5OuAQnwEWOylUx7M1YN0v7PLieNzKk9/7h0IK
         ZGzO6JTKzZgK8IUYtqLp2YSqNEmc2FkVyOdRCw3/WpO2EG/CgTYmaV6t98vXicewVE/d
         lkCYi9tr6XxftKRPQEDXy8BjqDlzyuRqkA9dhjllGh98I3ueV15W7o1m+xTcX75L1YqW
         396A==
X-Forwarded-Encrypted: i=1; AJvYcCWhQBrSxO4ivGT7QiMcjy/Ftf2QmsDAiQ3/rhPT9LTDZilTyEjjJTFwQobLoLrCmA8kIW0Cdp09N3uPc/ok2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyiHU7v1Vo8BLo/sZKi7Eq6htda7gzSI2kV7j8GGf+2GYxkV95
	ifgqNGILYnh0vP889/JXUy7DxjSjA4+hfNYQxB2b4UOYqL29SwoofJMHCCCMhWEnMu4wK5tUD4Z
	Gia8pjB2GoyIq8ZqYGg==
X-Google-Smtp-Source: AGHT+IFku+9NashTyu6q4xo3uHwb34BMI4PZZmGXsRUoiGjYrVfm/03l1m/DEaQAjd7uGW9sPZtUHjkL89RtUgU=
X-Received: from wmbdv14.prod.google.com ([2002:a05:600c:620e:b0:458:ba61:fc2e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3542:b0:458:7005:2ac3 with SMTP id 5b1f17b1804b1-459f4f1267dmr88011875e9.21.1754914489058;
 Mon, 11 Aug 2025 05:14:49 -0700 (PDT)
Date: Mon, 11 Aug 2025 12:14:40 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALDemWgC/4XNSw6CMBCA4auQrq3pw2J15T2Mi2kZoAEpabWRE
 O5uYaUL427+SeabmUQMDiM5FzMJmFx0fsghdwWxLQwNUlflJoIJxY5C0t7bjtoeYqQdTnlCGJ4
 jBWmgVtJwIYHk4zFg7V4bfL3lbl18+DBtfxJft3/JxCmjWtWgWGm0hcOl8b7pcW/9naxmEp+O/ umI7EDFhNHMlifkX86yLG+q2KDfBQEAAA==
X-Change-Id: 20250723-lock-class-key-cleanup-a3baf53b123a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qqCr/4gDVS3NsvAL73WpOmWJdMo7mPjB6jMNNSC4EvA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBomd6zzPPCqnG1mZcdD9+jHvxV0unNd/zRf05dt
 SWnJ9EtVUeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaJneswAKCRAEWL7uWMY5
 RozMD/4s9oPArNknhAHMW8L0duBDsbQAuCnJjiPXL/R8xJM9AbNKaXSNo318Supmc82cOAvOzc6
 jRMZ3AE44v6iqXLyTkT4hoDcmIHLWGntn8kZHW8ZY+a9Mc4/IpS9l2coIPAlDngB0US0zuWogtY
 CmxXI4LmRpnoim6bro1cD0QyKaapO4pGCknszOwO6pob1A96a3CwrNCrIGF0ya11Pwwq2Ny2cxk
 z+MdgLmr/0/ACY6zUIJr1Ug4EkG0WZtSGifuJrdx1/NBjqubgsP2vpsF7EwIXosr3pFBhpewDKB
 ln3UlXXeyLDGjb9eP++imntQ7/j8E9PHpUFrEk3QMzFttcaXBsYQ1/jsGicsqbWStC7C2QEHv8K
 KLBGbaeG9IvVy22zLxFrwzxQaHNLuDxgFqiCYeoI9QsptZOP9YNTQX+ZDnYkq7YsyoaX6jb1rOt
 NQ+rEXMdZDAfSz3pung4bqfdndCSSx62rsx2GQPwgN0CDF22E1i1tInG6DRWHpazu2pWIjh+IVG
 3GXBsMEcRltT5I8pwnFADAU8b2/cbINOwYXJqawPTIeCQEYPKtGaTHPRdcJmZbZvbMhnyfeitDI
 vPzvZAgIgzMWsgf4HfJv8i29SvRNr1+CcWjwNGNXqJqCwSqmuYHu4wWG5Q3c17PW8CkAUX9j4w0 Ql05UxpO7DEFo/A==
X-Mailer: b4 0.14.2
Message-ID: <20250811-lock-class-key-cleanup-v3-0-b12967ee1ca2@google.com>
Subject: [PATCH v3 0/2] Clean up Rust LockClassKey
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This series applies the suggestion from Benno [1] and various other
improvements I found when looking over the LockClassKey implementation.

Based on rust-next.

[1]: https://lore.kernel.org/all/DBIJLR7XNI6U.21PMPODHE83DZ@kernel.org/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Fix duplicated "require" in commit message.
- Mention pinning in macro safety comment.
- Rebase on v6.17-rc1.
- Link to v2: https://lore.kernel.org/r/20250728-lock-class-key-cleanup-v2-0-ad02b80c69e1@google.com

Changes in v2:
- Change safety comment to require a static object. Adjust commit
  message accordingly.
- Add Reviewed-by.
- Link to v1: https://lore.kernel.org/r/20250723-lock-class-key-cleanup-v1-0-85fa506b8ca4@google.com

---
Alice Ryhl (2):
      rust: sync: refactor static_lock_class!() macro
      rust: sync: clean up LockClassKey and its docs

 rust/kernel/sync.rs | 78 +++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 20 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250723-lock-class-key-cleanup-a3baf53b123a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

