Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292D021B1BC
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753628667; cv=none; b=ZvjYZCe0Hgq6vV9P7cTUmp4tPC1rcPidUjg7Kxqati802tQwr5HRZQzy7E0TyQ3eGksSuiOtoEaRDW7Izt/vtehHbW0Dpg7jMoeHNTuE0pjxiMj/Mse9Y15UV45cp36yLqwNv6rXbN+tcB3HUM2GtDqOeG29+KX+/XGKtiBTKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753628667; c=relaxed/simple;
	bh=H4aHIJOV1TJAq6ZuusFg9Zqr2Br14ng8uZtfr3ysksQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTU9JQSceKixD2DIuBvkXdprPAXhdFJ2QyC7wEmC6Oiz9BkCQ7oU7hVfGeAoGwyoDFLNPk8K3pCxzBg05TFWnRNa1/VdnLxDlBnD4oUodu3DSz0bMIHJxOKzq6JfBj1PdU5ImpOyaw7k3EjdVGq/S64qDgSjMfDPNvVvdviOKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=C+w1gprh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="C+w1gprh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2402774851fso1522595ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Jul 2025 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1753628665; x=1754233465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkIl0Ng87tj2Fj8IQfRrJkmK5nZP9FIei480gavcNNA=;
        b=C+w1gprhE1LSZUr3AKY+NKfeXsbGRczUf3vBzxMHuzhfEgcoMyLlOpvVz6bg3VUJvR
         T070zJP8V33fQDhZLl/585EIYF8b/UIYhXfMoN0RnOTc0yJt4OA8tZ+9lMizxJPAazPY
         AO1taE7AGjFBN9DwXCqPOP34ZnMYaEUl9raJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753628665; x=1754233465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkIl0Ng87tj2Fj8IQfRrJkmK5nZP9FIei480gavcNNA=;
        b=usPYpGKZYVyur5T/UwhpkutBV1nAtnF0J9tJlSNImMSCq+TEXJjTKnmt3Eyzlmrnds
         qCbGH2QHMVmcal7tYDAVhjAipOJ8kuiR3LaWr0Occ3i7xr8AnVoqgYLTQYt674LoN9fM
         b6K3/uD0Hv5mB15LTAqkb/fkvidi6NJy4+OgYf3NGk1sI+vH3p8rXZxkHUxeLUlOZ5eZ
         1yf6tq0rT5HmL4mHuUFtpxgfImB2O6bydiy1e5Fe6EnDAz9uj7V9+qfY+zc0rvJnfzO5
         VjHH+wZXgzkBYUFOnHn6KZz4fMjHz65CNYffCqIjZ8i4x11+Ejjqy3bCNXrUsYleqnCh
         caIA==
X-Forwarded-Encrypted: i=1; AJvYcCUKunhZR1R8mAc2jXr8z1nkHq8cV4Re1pxuQb3zc84ZLoSYe+N6Zy8BDe6F7CnBMjmfycsuk4Gqn//Gye8CTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSmvP6d0kZtnEyC7afChuqk2acZE/7WQ2HAooTwraInYFMGIiN
	En5jdnJX+ipcPPpAaeP546zs4K5sJiAPdSdTKiNFCnISAV/24P6B1nMFv0yIGWSI7ko=
X-Gm-Gg: ASbGncvyAIgcE4/TUUQiw5nmiKfExJ+m8K9XQCmwIIrk3evKTvgivLUtpMmjUpE4+Fn
	FI3nkl5/BxybmkPQrF4zb0s16aYiXTVqdTsW5Q2KFkFJx4eTwPoVN9wk0LAOTNlU4Dzq5Mm5WL5
	8Rqw7OpJ0Pc/QKlUyeHwEtH22vEQblYCAs1P6VtlmovtBlrSkYTm77Qwqg4cOyF3GTyy6i4IK0u
	DOLKZs+k6GGYmx+N59NpCEsOJDee4XRHfJMOWSRM6yUt3zorHnVPLydGtD7O+SNbWYVDmR6ZFO+
	Rrr+RMcCz+fR+zyOTcZuAOR+3TJbgIMW5LijszOm44vHx9F2lStxzROHvhqGj3pRFleJw/vgSur
	EXg1dhnSwM/zG/YmX4Np2fh80yogmrcwc9+JJfFnF2iWa37Dm9qicXHOVK8oe/g==
X-Google-Smtp-Source: AGHT+IH3T9NAHqsD3owCYZXUMl0VQjeiye3RBk2SMd/XJ4g10HNgS5Tm3Wd75o21SRnae8bador9kg==
X-Received: by 2002:a17:903:ace:b0:240:1953:f9a with SMTP id d9443c01a7336-24019531719mr20105335ad.2.1753628665479;
        Sun, 27 Jul 2025 08:04:25 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffdec96aesm15381965ad.165.2025.07.27.08.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 08:04:25 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [RFC PATCH v2 1/4] rust: bindings: add io_uring headers in bindings_helper.h
Date: Sun, 27 Jul 2025 15:03:26 +0000
Message-ID: <20250727150329.27433-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727150329.27433-1-sidong.yang@furiosa.ai>
References: <20250727150329.27433-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds two headers io_uring.h io_uring/cmd.h in bindings_helper
for implementing rust io_uring abstraction.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/bindings/bindings_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8cbb660e2ec2..a41205e2b8b8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -72,6 +72,8 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
+#include <linux/io_uring.h>
+#include <linux/io_uring/cmd.h>
 #include <trace/events/rust_sample.h>
 
 #if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
-- 
2.43.0

