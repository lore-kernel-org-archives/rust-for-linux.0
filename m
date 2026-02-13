Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973893EBF34
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 21:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771018666; cv=none; b=KEM+w/mVSh19pYQFXL0A9MmT5R9YT98PhPWWtFTbKiwrDNAXxGqb8aLXk+fylifIW7p0VMmYFV7ggWmmDcrdPmp/INH1uMpuCBupOiDCvys01WH+vyGCB/44Zq2cr2xHYRFHDJ6FDvQAQdO70UkDq91Y881piUvKukKoymCjV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771018666; c=relaxed/simple;
	bh=0Qv1Zhy45amk+UwexhVvvNVPsfJwy/dNV1vCWrKxHJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMsL4r7U6d7GyDT1TtZxzE1EBJDMd0WgbYLJKP0EioqBUeuwc9Go1EvT4g65wjnGdxJyAV6tEHovf5MDCRZBJIXyJxErJCV6kK2A0apX8pXuFk6wVPKOkRPaZzrTQT1Qh2eZL7FdEjnH0Zjaukl5TANpAJRnhFQIMyOfCEyfz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1qbRCQvU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1qbRCQvU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so3515e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 13:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771018661; x=1771623461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ID3zOB4ouLXJH9v7HyxM7TqlQKrFtlHXVt251u20qc=;
        b=1qbRCQvU8osTIPNdNnX19L4/v6BoqJUlPpKa3bxDo4h1BkRW8zSfFzwqv7/mjWkLrz
         Qrlp4MBTD3ynNBbnI+/9+3uxL9MSLQTLjFqu/uKntyAG2JMJ45u99GwtSX8YyA7rjoLS
         kLZlo2Bt7++At1fbAYwBP7dvMYTj+D3hysOz1Hmt+ZqMLUjyAWQC85tCj7sB78pzohqV
         bahKu3gei9QV9x+5zhBPlvQv8HjKlRtV9Vy3QpeWUa+7Jl+eHQMPIHt4aq8gf653MW2e
         6hPuMLMAXcZoftCpVjAGadklT0B7FmMzOVrjLV8yOjj5pJLefy4bLdWgF7Nrnqu7OX6h
         0VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771018661; x=1771623461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ID3zOB4ouLXJH9v7HyxM7TqlQKrFtlHXVt251u20qc=;
        b=l/nrM3Vo2BhpHzp0hbz161oyLknCWU+q3c6gA2uIVPRWheyaSIqEgr03V3Rl6DbVu4
         1yCy2wCAsQanLwWcSGmDl/OycG2xPv65AYxQeStqtKnJn+qzjTBYNrU8LHvGrQp5XSZA
         pSe4j5xfKphvMky07jkZFQsmNnExCd2hfMNlpmm1m3OBOONsX3L0WXpby9dJwvmXjcI8
         DxoNnrryrOynvxQX9xkPJHoMpQnD+V3CR6L2eB9sB3pv9nXW05Q9nAO3uRUOsyZGAsFE
         BwrtTJA15kndWkVOqNqnqoFdOVw6Kn9QbKwPTQyUMTBnBIU3BFwzUJe+raq8wG9f12XJ
         G53w==
X-Forwarded-Encrypted: i=1; AJvYcCUiyJtI2v87NhZNhiahMCQZBxAit8mKmo8U9/WvodH5TwxMDY0GwR/DJFCiDUzhXQ2+lK8mnhphzcrT3sWIXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPSE0uDNrPmE34Kff71LA0M4rXXQaHhcgtMg7HEyzD9lPwgd0C
	QGlN0KlDIH+VqUhvq0d1ETDdwx/YeNXzCpqj0MizGo8Y0Q1WHXcarpl/N+HUCJU2GQ==
X-Gm-Gg: AZuq6aK+jwQAJudLrp+j4AMGFLzWUEvEShi108sEoudFU0GiqhwG1UU3ev/hQ6x1FX5
	EanTr54FkY1ldImVdzAkI5WCKCfoCj8ArpBovFI6HB/rZ8HDT52nZjYSB44LiFcoLw1WvpY/0DI
	5NljjiZN+ItE9oGfdtuvP/Je6mv6VDPL7Rb4Q9SZEz/OKROJqvc29QvkB1kxKDskp3DLOIxTAST
	eYQpFyfLr2jdaDeXfPXAnoCaIwVMREGWIl+UdcT3qUMm0skgihT5ukpn4wkLYtho6+yj1RTjrxj
	OsMt/4JCs3iVTs9fN6REhFm8HcfOLjhoYp5I7M4eHiPugjUfnHXM81ZTo81SwX+iHpx3hEq8b5D
	Fo2M4fsEPfHlkaBOi9bEND9gin90rK7TTwzdQ+Nxhn1J/+krhyj4Tai08lW3fTGIZFybWn2K1Da
	P8LZzprt8rQlfCOY8FIh2swHPp0eraM+xteAwpnU1KiLQxIbu6xFM=
X-Received: by 2002:a05:600c:6007:b0:477:86fd:fb48 with SMTP id 5b1f17b1804b1-4837b6e44fcmr7045e9.9.1771018660505;
        Fri, 13 Feb 2026 13:37:40 -0800 (PST)
Received: from localhost ([2a00:79e0:288a:8:989e:b55e:7170:736e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4835dd0e327sm229975245e9.14.2026.02.13.13.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 13:37:40 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Fri, 13 Feb 2026 22:37:31 +0100
Subject: [PATCH 2/2] rust_binder: use current_euid() for transaction sender
 identity
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-binder-uid-v1-2-7b795ae05523@google.com>
References: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
In-Reply-To: <20260213-binder-uid-v1-0-7b795ae05523@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 rust-for-linux@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771018654; l=1290;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=0Qv1Zhy45amk+UwexhVvvNVPsfJwy/dNV1vCWrKxHJs=;
 b=cPbLHIqb4ntFZk4lGUC9cBg+W+TcpQKS/WtpVdRYkXM7EwXL4UMdvzAaDaG+EAIfZdQ5p6s5t
 jDwf5I08IMKAQRXeLcX1MmVDR+xR7whA+PQQBx9mp5Fe3ARbXx6OQDj
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Binder currently uses from.process.task.euid() as the transaction sender
EUID, where from.process.task is the main thread of the process that opened
/dev/binder. That's not clean; use the subjective EUID of the current task
instead.

Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/android/binder/transaction.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
index cd8d8202e52d..3deaa745fe2f 100644
--- a/drivers/android/binder/transaction.rs
+++ b/drivers/android/binder/transaction.rs
@@ -107,7 +107,7 @@ pub(crate) fn new(
             debug_id,
             target_node: Some(target_node),
             from_parent,
-            sender_euid: from.process.task.euid(),
+            sender_euid: Kuid::current_euid(),
             from: from.clone(),
             to,
             code: trd.code,
@@ -147,7 +147,7 @@ pub(crate) fn new_reply(
             debug_id,
             target_node: None,
             from_parent: None,
-            sender_euid: from.process.task.euid(),
+            sender_euid: Kuid::current_euid(),
             from: from.clone(),
             to,
             code: trd.code,

-- 
2.53.0.273.g2a3d683680-goog

