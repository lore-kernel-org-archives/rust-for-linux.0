Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F83019B0
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759397143; cv=none; b=WGHcXa+RXLQCeiR5drjlkVlp4Kp8MRr6rNc7YQpGVcxcUUCn3bxi3G1V/6e7JJnKypoxHYhY5lsWRJXtbAB/LxU0lgid3fCcRORNca4n+eUJGr5EPpVCDVifq6+H2oux6T9qa2sLLiumNkw5GhYBYwVk67XOnid9b4xhFf2ivcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759397143; c=relaxed/simple;
	bh=Y/sByYoKKU8P6VEhlGTI2CFrOrUl7lTYvCLhcfpmKbU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Jm8eX3JCaUXuKoNQaboznk7sd0oxVTClSq6/gG8fmw1Tuyk4BXYPsHtQC1++SvxZBFEjZCpAa+Dn/o0MNzGRZgO4SlO6KHEtmgJOPW3R1Rm6zbC7kgnPQUNnYAUVThTSQ1H42WMXwmI4G2g3MBOSQpSQ/8F4v4CI50jkRnkHuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aY0CG/87; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aY0CG/87"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-632c9a9ceb1so926655a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 02:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759397140; x=1760001940; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+PlKBjPp5FZQsrsuboWKkHJmwPHYSdKJmwQAuUGMsyo=;
        b=aY0CG/87xB8DzxIDpx6e9BVeQ9Xv+Jm15LXtHyIbELbK2wE1dZhkmx5c8SGxpZeLex
         P1MIBrGqatUWqQ5w06c5UepdTQGQ/lxQwDm2X0IYw2em2tmYUOEIn9qjYjYvNQz9hX32
         LEiq+IuH2LUhD0Fld2NVuWuk1nWhccsWZviEI12L6Fk7dpwvuiuWJI67LQ7aukSTOX90
         tmj2K58Qfxjc5XJQGQFQDNxTOpGgWxjzg958l0GLsM/2U6O6Iq4SU1nXF5G7V6if2JfJ
         1lrz2tXAtvuN5kKRi/jfUffaEkk9NWgEfeNguTxZA6p8s+xbtYTNfusGDODdHd+3MHTR
         FQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759397140; x=1760001940;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PlKBjPp5FZQsrsuboWKkHJmwPHYSdKJmwQAuUGMsyo=;
        b=vYQKZ0v9LFMsHbUclA5DYDxT0/vkDc8nvGFbD+bNpyQ4dvR60V2bIvmk7fBHhbco11
         OndwHfEtgzPMscWb0XiwUZMVGbQ1zkIONgzAV1JWtVxn3Ze/gUQohDsp2Rj494Ty579m
         Hq+CpUvC7kLH+vyxd/KNvNeB32RY+B5gmEK0pM28F7aY4YJ3Pw63Lul9rqzntH9ItgW0
         F3TjS5t4t9huDjyroHQrf9z53sCfShyIoJeNRAYc+qf9hQatdBDCyqhcN8BC+wZmBXyf
         3RTpQU/2d6ac+Dep4xOFW9lgQYaME1xPIpMdbTdsNeABeOlbKCFVyQR8ik8G3BP0OCHY
         8tYw==
X-Forwarded-Encrypted: i=1; AJvYcCURBEoqw5fqqAjcMNUai3ob7zKktISyTCsfkR3cYZ0fg+daS2OHXA5v9kmRMTsqiS7F52a08zLHMhIOsklGhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKmXn5KoCMRNhvJKLyMf+vguPkiX8yj2ZKIEjSSJ6QJV5uzcfo
	x9WtIAk5gwK3efSpDAVfPZVq13/YVCRZ4WKORK0FXiSLrSDbES7ZqN9vs1ud76NqIJDvtwsu1fr
	7ZCqSy+JdjfkS7Pbq1A==
X-Google-Smtp-Source: AGHT+IFiGvtpNZSrwRO1oSUnyWe726xnw67IN+IMEOYdKIx5jbLC4BCDdiTrVhfoJOfm48YNxn4U5EvL1e5e8Og=
X-Received: from edvh25.prod.google.com ([2002:aa7:de19:0:b0:634:a35b:1d11])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3550:b0:636:23c2:e62a with SMTP id 4fb4d7f45d1cf-63678bbadb7mr7786985a12.8.1759397139975;
 Thu, 02 Oct 2025 02:25:39 -0700 (PDT)
Date: Thu, 02 Oct 2025 09:25:29 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAhF3mgC/x2MQQqAIBAAvxJ7TlAppL4SHdLdai8qK0Qg/j3pO
 AwzFQoJU4F1qCD0cOEUO5hxgHAf8SLF2BmstrPR2irPEUlUkty1QuPD5AMuzjnoTRY6+f1/297 aB5h7vwNfAAAA
X-Change-Id: 20251002-binder-orphan-d1bc4bcd9777
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Y/sByYoKKU8P6VEhlGTI2CFrOrUl7lTYvCLhcfpmKbU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBo3kUOSfHZdu3RAzK3I4whCF46XkLRZdNE1E4zZ
 QPtpUVdan+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaN5FDgAKCRAEWL7uWMY5
 RlBREACqkYCmD4YESGpf5vez0GLEW1YzAzFEkMkxKRtdI6u5RCnsJTrbbV8qe30vPjl7OdOVuzA
 Kie4gt4LRHFL1uDdgmMF2BvKzt2SFnh2lV/StYzIz4Wmv2GkJcwmlaTegzPyO8GW5ZE76MePx79
 2E8SDD6c7zXo1JycdoCcY+IkiB7bq9/fi2GAbM+e7esMKEjC8IYIWlw3jxihpRQ6xQtnXtdRL3g
 sxSs9TbGF4WGQKbG6JBLwuzp/cRnmcMSlDP0JwwxVj4Y/XL3iMZCkZEdBgsWvlfI1qnUjBznuZS
 ATUTQVoeL4dzztcpJjUF0EEvsfNG3/wKSPM3X8xHORwTm77y8/Bn13x3uQLRtZXwBpgws0LiMJt
 rTODhfGire8OF1tJk5++2ooPTGv6xN5008gwju1BLQCktH5tJJhBwqCzZje4LbRWrk/1si7ioUo
 tWp9x3u2rBugnnLkk3NURHQKMN6fE80uTuH7ztXXZ96pyxznZ0UbZN9zYnEotEIsqVLEj/t/mH4
 fVecemOuVFz2i7HXY4EHlhoUvrE/S8IDr2sRebwUC0iYnrg+QbRgIW5k93VhSSoYkFJcKP2PNb5
 iDZ2+f1xzCjMxcLzT0gqOuurge0nzZekW5xynTFOjNSSqWTNaiu6ABsrS/Wbc0KybmOK6IkKdnQ YOSmA3QFf23oYWg==
X-Mailer: b4 0.14.2
Message-ID: <20251002-binder-orphan-v1-1-cdc4cffff992@google.com>
Subject: [PATCH] rust_binder: remove warning about orphan mappings
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This condition occurs if a thread dies while processing a transaction.
We should not print anything in this scenario.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/process.rs | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index f13a747e784c84a0fb09cbf47442712106eba07c..d8c3c1ae740e0eb3bcc8aa5e7faf4291f1cb69c9 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1346,10 +1346,6 @@ fn deferred_release(self: Arc<Self>) {
                 .alloc
                 .take_for_each(|offset, size, debug_id, odata| {
                     let ptr = offset + address;
-                    pr_warn!(
-                        "{}: removing orphan mapping {offset}:{size}\n",
-                        self.pid_in_current_ns()
-                    );
                     let mut alloc =
                         Allocation::new(self.clone(), debug_id, offset, size, ptr, false);
                     if let Some(data) = odata {

---
base-commit: eafedbc7c050c44744fbdf80bdf3315e860b7513
change-id: 20251002-binder-orphan-d1bc4bcd9777

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

