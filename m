Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5782F0C7A
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704293; cv=none; b=QVY61xfX4f1NW0tuV3N/AxFfS5+dVXYRUuf5/ajxreXz9h8GAgILG+l9rhd3iqD9sIrLhMB96yxMpMYH3CxVB94fba63v6yDZLCr5qaEPqsvkjj29zdgWF3LP6Gzf2FPZoNHG4nF0NKXcdyivfNXp9QcQpuIlVpRLsl9hfVlnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704293; c=relaxed/simple;
	bh=MpnFAfV0XjyKamsJb2lrJxsaSWjn+wGdUIDfF+VVQus=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hsnkd2v5vviCFjb1FIU6FLEIQwcFn0OzrwAqf4lgjfFe2pwBk280Hl7thWiUDQmLkRjhCQnQ6W66QYo45glKwtq0BPq2TN01XNnYGqAjKmnAm4Ypy8vBlOYLGBbRKrRaakGr2kmTf4IxD5ohk9CWBFIDwH9B0fQG4N0J1vcT8MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HvFsFhG4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HvFsFhG4"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2f79759bso4047724f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704290; x=1765309090; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mR24ItDXxq6oeO13JnK65D/3qDA0jdgO70K07Z4qGEM=;
        b=HvFsFhG4dWz8cp7ZFSv5qxx2qXU2ST/IL35n4TCYPq/LRv/nZeNh/Y6timQfbNdKux
         Xzz6OUSHf/cAwlT4CYPlx8PYS8I4WLJkuUaaZDIXf9SDRzWkip1Qwo8wircSN8S1FH45
         6FlYQMpZW4iYKMAjvdDeKVIU3ww1wOqDSHGNmikPF7zu+jBX3Zx27aZxI55flauLHKel
         VikTDPqr2dusQq6fTpxutvF6x0J1VK5tHPGxEH42X7esMqW6U+TRo0RQF6gtrdgw5Id+
         BZXifYHFiOVDGJPD2ZLbTvvlYfilDgGpeRzQH2ZJ4JRT1OLd2fQ9C7JgDWDVl0vRr2mB
         rk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704290; x=1765309090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mR24ItDXxq6oeO13JnK65D/3qDA0jdgO70K07Z4qGEM=;
        b=pRae8KAdWPNxvZMMXqWXXXzlyppX/fOVYPb5A4yKNkZfn5/ZAqwJw+yrtCbZgPAYWi
         F6xqS7F2wB2y11kWOhJ4GOG10yqyVKiSwpjICu1bo6YKCcpTSsOEFAx54sFRgft3KYwk
         R89PZ/qEyqvRLquhdWVqEDzJZC1dQ7HAc99XyUto5ahMflBxf+aUR0yZ6i/tGUflYY0R
         fGG4iSoJZtgfJNhssaGV4cbHs+rsfNNjrUy3gAp3SNdDF/lBr+U325AfSJZQ4rZz6eaO
         wH4aSPVfiL4Mu8UphlWsQtc9agAhNx9s1es/1UBN8R4XQYS+cT3nTfn+UwA5cLLbpiVg
         lxww==
X-Gm-Message-State: AOJu0YyIzAZFXhgDvUcAfBmCf9p5g3yb3v8LFNdrRK0FG68BBAYhqfox
	Oj4L1M8q/AqmBdGz2XYSFBRiONxNrkHFsqcDm/7h8d+gHcs6wY47yTlJfyss3UB66vfyPPDlNlu
	s42gRefC40WJtf4RC3Uz/+c18kMkqrKlerzCEUj4LwQCz2i/aJJBT8J75Gly1q9X0uwZAlpbb58
	/ZoHqC5Yx/G36hWzKrZqGnrVhL9WC8DPefEIXK4hrboPRGr9g4WECKbra/reZ1vbU=
X-Google-Smtp-Source: AGHT+IEMpyMN4BNh1ATi2Yjkyo1Y/LjaeHr+KF8uJ0CaUGHJFvymaXf+BFgYanfFIluI7ORDE6rceQ4lFue7Sxs=
X-Received: from wrbhg14.prod.google.com ([2002:a05:6000:1e4e:b0:42b:5d42:f6b6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1785:b0:42b:3d9d:c5f8 with SMTP id ffacd0b85a97d-42f721fc5d3mr341413f8f.6.1764704289729;
 Tue, 02 Dec 2025 11:38:09 -0800 (PST)
Date: Tue, 02 Dec 2025 19:37:41 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=MpnFAfV0XjyKamsJb2lrJxsaSWjn+wGdUIDfF+VVQus=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0AIOx21nkOp56I17y3e9GPWG9CnmN4wTMgmN
 vbcZCgyhzSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACAAKCRAEWL7uWMY5
 RiA3D/4iKQ+cGMwsROoypCMabHGzuReU9sFuvLN2FR4gB6sotkg5xuwcjALmhaAKgGYS0uN7HOS
 VJKIvxiqbc+qgUI4OhlDuhPAowY1/4J2Z0fyekAC3TPa6cxumUcDKSwR9lYlH3Tv5bUTnkj49Vt
 aewcvFk2c5JqEfEGhNl9r9GDqBld2pnUG6QQTRw9nVGONXlh1d/or0kjNpBs2c7n7fF/pw1ATC0
 ShU4TAB3k6xi5uucFmaNdsFp9DTL+IEXLTD1aX+Xd+CEn7YEmyK7kam2WiutKaozjb+eN47Qz2q
 LTKf0vgrhLCFOjGE19uRzUulgZ9PXgwMdaSh9B2QFUp6c5FPQMZx1nOKQ6o2TVy+Y75wOL6skyQ
 wxTyDj5h9k9Y2WFpo6Xpntu1bRo+nFv6zhoFBGzVECw+ugPDArITiscQ2HMDzttW+WulwsaDJyZ
 hu/M3Q9oJRnrPitlVE65D8CqzL6py27u5enaI34mVAbRm/NiOdZpDYWn0lvqPpw/pInH6VxolBN
 szOyGFK2g0TZ1Q3ZaQP4DSLprjqtrSmJ7HG1z88L1y65tPnH69eKrDeG/A+ThehGOccbPsFXmfi
 oYJ4ZEdq5PTU/d7gjt7wA6HN/U0/0E8Xs4SmFb+HKsbPDqQAqsNwMziTIRCn9QV8ckbH+UOsGlD D17WkcfL9noehpA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-17-a2e13cbc17a6@google.com>
Subject: [PATCH 17/46] rust: err: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/build_bug.c | 2 +-
 rust/helpers/err.c       | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/build_bug.c b/rust/helpers/build_bug.c
index 44e5794880373e5b4c3e9de5677d8e03ccd4a2be..14dbc55bb539589fd822ac8777b3fdaccfee7897 100644
--- a/rust/helpers/build_bug.c
+++ b/rust/helpers/build_bug.c
@@ -2,7 +2,7 @@
 
 #include <linux/errname.h>
 
-const char *rust_helper_errname(int err)
+__rust_helper const char *rust_helper_errname(int err)
 {
 	return errname(err);
 }
diff --git a/rust/helpers/err.c b/rust/helpers/err.c
index 544c7cb8663283edbe202318e5bca870708546f3..2872158e379383d592af687991115a0d223c3898 100644
--- a/rust/helpers/err.c
+++ b/rust/helpers/err.c
@@ -2,17 +2,17 @@
 
 #include <linux/err.h>
 
-__force void *rust_helper_ERR_PTR(long err)
+__rust_helper __force void *rust_helper_ERR_PTR(long err)
 {
 	return ERR_PTR(err);
 }
 
-bool rust_helper_IS_ERR(__force const void *ptr)
+__rust_helper bool rust_helper_IS_ERR(__force const void *ptr)
 {
 	return IS_ERR(ptr);
 }
 
-long rust_helper_PTR_ERR(__force const void *ptr)
+__rust_helper long rust_helper_PTR_ERR(__force const void *ptr)
 {
 	return PTR_ERR(ptr);
 }

-- 
2.52.0.158.g65b55ccf14-goog

