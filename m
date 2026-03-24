Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C35D2E8B6B
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 20:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774382567; cv=none; b=a5WRxdkCjZRCqfHfU8xGrF342nTWDfarVNgmtQKVES6MMiMvY19VR5TMbNago1UUuTdPgHUy9SeVUScjqv4VADv8ROnu8TXdcaJ/hKTOSBkJ/6NaBgeYaN4Vr/m3aR2opMvV5em1/lA3oLObIugwvBYI94gqiCN7ROITi8G5TqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774382567; c=relaxed/simple;
	bh=4VhF9kuvpEZh8ycZbKE1zfDnwtecaaxCzZ7sj8l1BJE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mYf492fU/38bPtl8HyZjtHqMNGr6LMie/6koDOesu7ozCS8Hxj5fp5fhlDnC/ESrZZnFg+WO30BH09V7RQAydhQnjvyL7XPSkXdzCkqiN/DNfYZNdhpDNP7BGjMcAzhyqdo/N9scSQJQfwcuDMfAVcHdby8dec0+Unhk8PLNT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uYp8WSLs; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uYp8WSLs"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439bab2d095so4314138f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774382565; x=1774987365; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AItcHa/tBR+ofOjP89Afdfc6NVXFuF1Errf8xhpPbuU=;
        b=uYp8WSLse9ms+imYU6tE93VQ3RpLgbbKjHJ9NMVg9qTwtF4vjFfnA1ehrOMSSnmyDp
         FBb8C1RaWKM+7BSkuLSlrh/f4NYX0ib+2St6dNxioGZ2Nb3BIk5n5zzmy2vJF7vHwWVk
         aFPcDk/0+9TzjpHbHV8jxx90IeBXpKTffoOo5IN1OgcG9JevNJ17Dkhxp9xEx9ZxP7Nz
         Sg+IsVlGqtsFOcI+T+ocUFLhjcw+7DcZDLzqcLM2MnnQYCvA6/RbEF6COkS3l3I8oXcn
         8R1v07mR3UiX1HkdtKP9f5Ydd/4b3c3GOvpl5gmljy7SuBwzcwFwbIRUDdJruK2UiChR
         HAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382565; x=1774987365;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AItcHa/tBR+ofOjP89Afdfc6NVXFuF1Errf8xhpPbuU=;
        b=EvWpcp5vdeNf8oT9tn9SIEahAhZFEBGxVppbC7YMNYRuK82M54gqmYHrG1sEXeHNMO
         MrnwqUBPLomdg3Yihh5zvot7Uvc8Fa0O4JY3bFRK3EokGLrHKkp/M3pw/lLWvlydZO2E
         A0K5lbV+bcmnCwxaRV0Fu4w7Oo4GStgATQxxgNjFhRE8LHcqOm8tKkwjqD4/o5ndHlTm
         sQLrxGh0Wo5E1L89ECX9R6fGy8zptb6pd7uTmVOwvuioVLCn0QW4n5HQVA26MxZFiWFn
         lDbpgRzsrhOd9O3CYdcYGV7UnIU82NqOXfMMXdr0eeY79U9k7y9HukChd0fN6JUQSfZF
         CWiA==
X-Gm-Message-State: AOJu0YwKlmglBtt9z6JCRJI0fWcZvzvG9V87TtLFDy9ee5BTZIDJyfjy
	z2G1b+UM3P2M/mSM4kym/rj+21bu9DWTUmvyIAXmbxPiy8K2ksIEEDW1cCix1ds1UvkxQ5zBnvv
	MNPyc6o0FPOy7oltqKQ==
X-Received: from wrmo2.prod.google.com ([2002:adf:e802:0:b0:43b:3cda:8d4c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25c7:b0:43b:47ee:4586 with SMTP id ffacd0b85a97d-43b889f58f1mr1225340f8f.29.1774382564496;
 Tue, 24 Mar 2026 13:02:44 -0700 (PDT)
Date: Tue, 24 Mar 2026 20:02:34 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANvtwmkC/4XNyw7CIBCF4VdpWDuGSy/gyvcwLgpMW6IWA5Vom
 r67tCtdGJf/SeabmUQMDiM5FDMJmFx0fswhdgUxQzv2CM7mJpzymnKmwFx9ROgsmAHNBcwjBBw
 nUBIFYqWkpC3Jx/eAnXtu8Omce3Bx8uG1/UlsXf+SiQGFzrRaWlnWqquOvff9FffG38hqJv7h8 Oanw7OjhSgbtFoLRr+cZVneyX8DqAUBAAA=
X-Change-Id: 20260219-close-fd-check-current-98e3ee59880a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4VhF9kuvpEZh8ycZbKE1zfDnwtecaaxCzZ7sj8l1BJE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwu3eyw9jsCTxPUee2u9sm+aCX/Vc6nPS/VZQ1
 oJYfagLqnWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacLt3gAKCRAEWL7uWMY5
 Ri4NEACjVt0KWSI6L3bOXK5rHZ0jdkESZMHQ8F4lK0MpeDZAvTUnsGO+vb5Ja7ZYeFy0DDUfUy1
 fMe6iy6a6IoQxXLV2HXHCi34DHGJyuU2NBD8UIFV1VNcxZHZh9EQzk6Vmy1HIOEwCkehfUwwfaC
 LlQ2bHtXauOYqdT7nNkGprZm0sSs8PDRXGqrC0G/OwHcAaMLh46InoU2CDGG0fLuktnkR9CKsd1
 weyGRc6fC7UtlI2KovQ/9KLKpgSOfI7eNbb2fdIQNUHfQMENGfEOYvSfzW4KzZrbglK9YFaHNAb
 4x8G8fSTOzfBGaCMB35m/1Fvq9QyCY0z/q4x6ojD0wjIak3rGlc77aJ3DgYJWEYovZAsJRMj4bn
 PA9GHDSXg1G3Y9gdw1WGBDUmyIfW6dCEdfcMtbntAasd39h++woOuEKZbsG4xG+BK+AVKAkfyot
 0RQ939ZI9+5oS9s/IqhF3Z+jfZ9nSTRdFexQaNOP9geWrBZgCdyNDw7QtqLdOyrBoF01Ov/cehZ
 IXXh2XMSUEWvaS3P7eLcc5n+1d/NMhoRCglEFR0KFulz5OdJxdxzskGW3P2DQMzaWE/Plc/cvfq
 VaZyxeeTjS/5wnftf2WCf9FcBSEF49SAIFs0CTkQkt6aLL9+8S1ZA1rNljRYEpPOtL5pVIl6syg 221Gy0CvSRD2UqA==
X-Mailer: b4 0.14.3
Message-ID: <20260324-close-fd-check-current-v3-0-b94274bedac7@google.com>
Subject: [PATCH v3 0/4] rust_binder: check current before closing fds
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the last patch in this series for details.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Apply 'if' statement around for loop.
- Link to v2: https://lore.kernel.org/r/20260227-close-fd-check-current-v2-0-b3347edbb310@google.com

Changes in v2:
- Note that ARef<U> == U can't be implemented due to impl overlap.
- Add #[inline] in == for Task.
- Add a patch that makes use of the new == impl for Task.
- Link to v1: https://lore.kernel.org/r/20260219-close-fd-check-current-v1-0-fcab8d8469f5@google.com

---
Alice Ryhl (4):
      rust: sync: implement == operator for ARef
      rust: task: implement == operator for Task
      rust_binder: make use of == for Task
      rust_binder: check current before closing fds

 drivers/android/binder/allocation.rs | 29 ++++++++++++++++-------------
 drivers/android/binder/process.rs    |  4 ++--
 rust/kernel/sync/aref.rs             | 22 ++++++++++++++++++++++
 rust/kernel/task.rs                  |  9 +++++++++
 4 files changed, 49 insertions(+), 15 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260219-close-fd-check-current-98e3ee59880a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

