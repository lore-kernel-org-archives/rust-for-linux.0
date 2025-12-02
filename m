Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A6D327BE6
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Dec 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704330; cv=none; b=g/SZQgVW7SDQtzt1eA6CzTOYD9DhIh09QizraUrFUstrgWM5YhiJLF/fnLuZi1/1nHhEWOUtXzWg4EcTi1f1oTx280EHuKUyCqXm1W/hF9X8mnUGsPtidC1mMMwJ1W/QG1VSiEcRYNCG0v2eAWKiF6JM66i+Ciiiznr5djXnemQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704330; c=relaxed/simple;
	bh=Xwi5teGSa8ww6GWa6kU7GK1a7/Rk5hWhIeVBcLUeEn4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=txVnWUuP5ghhhN++6E4vZu6ai/WHkVPG2OoxK1s6eSjumgDQ0xrB6t30NwRgbVwsqRKNbXErWrMlUHwvZtle1pPvBgqZdt8xQjOJOUk46XHgBmsbx2q+z8y8+tCUAB0Lcl31rEo9o1b4P3/Gnhwcjw2XMc0/mIptb4gKBSEYWQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=idRnFb6L; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="idRnFb6L"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477bf8c1413so36158215e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 11:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764704327; x=1765309127; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y5m+KL+v1jMuyDrANGRkUhiq81fps/2eZejCizQFnb0=;
        b=idRnFb6LiTycPb+dVxtQZKylhKX7kLOXraDeDQfHz1Y0LKRYXoL07TgUZabjg+N/rM
         LT7IRcW5GOW1U36TwAMfFqN9qfOhv47TwjgH+Mh7Nozz5IrJuStiPNbSYVBHiAUaR8CA
         e55aCwQRPbesa+llZCZXpHGYYN8yW/rP8L9ddJzFxvnOQrC8D7Kc1U8JiBrNmYbvh1t0
         2uBy81M8I7r/17tnbgRcHG2KFY0+HMRvk2KaSkbNhsF/7TQe2dnYCjg+JUfYmBLradGM
         hN7PxPFicddwyUaMXqgZg58YYEMzsaIzwl+oyz9+rlKfgTzUsmHon6Pp4yQg0csWJy9a
         U85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704327; x=1765309127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5m+KL+v1jMuyDrANGRkUhiq81fps/2eZejCizQFnb0=;
        b=omX97HsQmpwgyi16LLGCRRJ5R1p4bCt7AsOKLguu02hi9l0Tf3VNU7fP+jRkPFM5O+
         yX2iDYe1yo1oPhSuUhqxqIiGxJ4Ifdeiyg5GxiHjpByp9jEA5bIeKMMEhGiaUqaSZI00
         ao3AyTOxcp84mBG21RtlpY+q2OTLmlpinQLZmiw9aM09O8XT+256AxiVRpMn5Oq5RmHP
         U1r/E6MkAnzsqX2jSrWX1vrafzRGebCJOnpkuL70xBZqYBh0+su7aHTQJOZaaI5lMHbT
         T4nf6bnnva18bfmyWRLuxyYmuIC87+xmtUt9D8AKg4HzYtV1uJM4k1v1WkUl3ygZzc0i
         VHRw==
X-Gm-Message-State: AOJu0YyKiHd8d6iBdvtfRJDEb5C1IHCFn/OSrA6nwzGiLglWN0x7UOWV
	TRAdMmP96LEESHvYD+GzoOern1Mr14LPe/POnHP6BUaIqFLSHaFW04teOVDaZBgDfDbE/ywMLGx
	akygvPQg0jXqSARNowDSz9PpLoGO/spKbVRmFuhbSK1ue4v5AbRQx+lI7c2cj8Vq4Yk5VV8SGtw
	zGkl7DYshrIit/UlzWgi2+u0Xj2VI/e+hJm5rKfyOdFcgE9pEIN9UONtHHZ/7dceI=
X-Google-Smtp-Source: AGHT+IFZZ5LDaduG+5Xz3xSUFaXzU3Ns4ABL8O6xUI6yh8E4yAw6bdAuHa0A6zHcHOa6r4ee97VrkZ48cMxvR0U=
X-Received: from wmat14.prod.google.com ([2002:a05:600c:6d0e:b0:474:979d:a20d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3541:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-477c0165bc3mr451900555e9.2.1764704327053;
 Tue, 02 Dec 2025 11:38:47 -0800 (PST)
Date: Tue, 02 Dec 2025 19:38:09 +0000
In-Reply-To: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Xwi5teGSa8ww6GWa6kU7GK1a7/Rk5hWhIeVBcLUeEn4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0ALLYrSFNnqoFqXUg+09tls7ShgF7K0GmA7R
 AAVxDpCTNiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9ACwAKCRAEWL7uWMY5
 RqT2D/9Y+i003cKH5vZ0juleAsr87AWKFjiNaB9CcE65z8KluQM0P7kd8jrJkQVDhUWBoQr80uX
 c9gc0wRNV+HPLtRCrzt+rqGC8RvaT3jls/1hXOACcvKIzdJcWsnIamsSXN9VoQguRgwAj4RBiAg
 ZrLF2DsYpM4v11wWuZffLzH66im2xpI7N/0HYGBzXCKincc6MvqXnpMqLPD9up94FHCh9j1DUAd
 c9sC8elDHNA08673qFEeA2sIU0Ve5hsOEtC588kTucT5JSb0nEijT/6EO2S99IMLXhVLiWj9oMr
 P8FZNNxC+2qn9ElTCabv1wkQyJPXNWqSLK0LytleA6sLdxBzlTBZQrWBTYQFVTOfPYMOrJqlkkM
 MbAOexajxKASllPhSrWiev72PO3hzRk4n/jSbVvgWSS9+/msc6gJVgEx419ODGriyasymC3ujLH
 frY7Bd6Ulm/Tz+aNYht7ECaLD3lrnD/iOp8CZI+rTWrX3Yykvx9RCHIuLNIxWlybw7LDdQsTawB
 NJ2/DBocenpx/FbZtSssNB8SvB34ifGkiZUgd21PYkXQdYnN+pYJim/UGtSDjx6kd2iibuImxjy
 FeNDQ2AIAq03j3M84ydt1mVCpjscYJpZTMji9hYdDWZKljSMkFJC3QckrAgt/YClOGSSHcTWbcI mq7fihyeeL+TDTQ==
X-Mailer: b4 0.14.2
Message-ID: <20251202-define-rust-helper-v1-45-a2e13cbc17a6@google.com>
Subject: [PATCH 45/46] rust: workqueue: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
---
 rust/helpers/workqueue.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index b2b82753509bf5dbd0f4ddebb96a95a51e5976b1..ce1c3a5b215028cc04e2f4a7d9c9c60931792e07 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -2,9 +2,11 @@
 
 #include <linux/workqueue.h>
 
-void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
-				    bool onstack, const char *name,
-				    struct lock_class_key *key)
+__rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
+						  work_func_t func,
+						  bool onstack,
+						  const char *name,
+						  struct lock_class_key *key)
 {
 	__init_work(work, onstack);
 	work->data = (atomic_long_t)WORK_DATA_INIT();

-- 
2.52.0.158.g65b55ccf14-goog

