Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1A30C615
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244154; cv=none; b=CQKx+X6bbZ+ZoJNWuOMNxnjh77HQqUJZg41IcKizTO4KQw+ygF6sTSATqhxdqq1lTTtLuPrcD+Q4eqBzYfCsU3VOuLUnt7kLb1o6KTdWDoJXUF51AplzNCjx8SrH7TxqQ0rY6GE3pRkHThJ8iSjwg0qLN2mG+0j6yIYdDG4plA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244154; c=relaxed/simple;
	bh=p2j8Luk7W6yr0bxlOlpHiNO3IOJ/KtgqMq3H9b3ynRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPPRVcCDs7CdPWSxenJk7j8o7IQBOIywBrHZl0gwuAUa0W7hlsvT8lkopcO4o8gDWPtDVjHI5NXr7qmVafIr9wbQjXwCbssg2tGOpZbj7AWjgaDzLikGDxcNKXyjET3dvc2ZZu7TB+oMf2BATaG6Sko1GFO71MDKcYGelrGONN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=M8ghO42Q; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="M8ghO42Q"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so2562351a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1776244153; x=1776848953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CWG3OmkxNDqiNbb7KQHfaHwxQ5jJUOD3gTNZtX0NKo=;
        b=M8ghO42QTUxohxakaJXzdMZYl8H0I7sKlDVV/8f1utqRS6HUioiyzIyIfgUysqY0zh
         1y2WDp8UPeLR3K3r218Hg0qKiOmp+SskueuZwP/Q+rEkaja/IuE6TYLMGXyvAyTZNA74
         vs9rAG8eoBJwJj4zc3lUwEekr/YfSZ+NU9W0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244153; x=1776848953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CWG3OmkxNDqiNbb7KQHfaHwxQ5jJUOD3gTNZtX0NKo=;
        b=ESTckJnbDjJgqwsMmov5XK71yseo89hVXnrEscZf48CO9cGzzak3pns60V0wc1Wkym
         XmR4jREiNg/wp1YdXQKNvEa/+8StyrQg+i+mXSQsdE8DmDvyJFMZKfraRUndVkI6TSsY
         rhdZMXJuRKR8RUxRb5yWr/6mZBdryZ5t/sj8oQNfoAX6/aTCHaXoZ3LJSc3YFrw1a9f2
         P8qqRInFuGKSY7i8yz0RjlIKO8dlsWk7/EuLLglTbOiEz4x1Z9xdGW6TuJwVG7tTGFTr
         7voo3roGOwwfyX1cD1bdeE7Stw9/xlSaFQ5TglpDQMgVBbX1ijPw+DsqKRaAcjmVyywq
         Xh4w==
X-Forwarded-Encrypted: i=1; AFNElJ8fW+CGssL5/V5TzMj3Kl/uQDG4YsdKUs1QORvUDa3etOFc1x+Xi8tBAyHJnZlmjjR+L/VOucrqVAWsdEzZfA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52yjiR6xqIXlEVJbh7+2uy6tJnBNKCxvvxouZSu2dcSgis+mD
	lXothpjQmXzwKL3PhTzcu9mek2rc96g9fcAEsFeuIdSrq25NW5QVtoDIA5ns8vf/AeY=
X-Gm-Gg: AeBDievE8nq96rE0Qs5dPXIrEUYT4ZZITOuJHnjO552NoN5F8VfN/a0f0xsAMexCuO3
	Y/E5hAI1oO5G/LuAHZJM8NdeACXHqBFbGkEhmiTDWK2dksKiKsl/gQZqsPIgj1MsqvXEPAzAo3U
	yEHUSRRmmKgSL0luASxNNggnWjYSU5+/VD5p/tfHhaYo+xghU3xT+IsTMZGfSZ8i3GbUbgRCthd
	SqWGmSon4RH3DybFTTb5SHbEu6UiaTnhE2e9lVzjCzP5y9OJb+/2ND0plo86yiUPPPk888QHRp7
	8JLBnu4/LIKvOsGSN0YjGBMWjZqYZWiFJuUtbNnWz1UWt0/0R6vvtW8m7ABpDAHxI0VWCiwuyqD
	EDQ4Z+pwM7SY1aEtxcUqiWhFdxQvisUvhkJFHLtH8Kgb1OmIAue4v4zJz2qAFTa13umAzk+/O7B
	IdNXFixNM2gys8jmKpRMdNIZoy9XVdaaVxP0nd/wfOIRjWsB3BUXjVhGvH2+o=
X-Received: by 2002:a05:6a20:a122:b0:39c:787:f17a with SMTP id adf61e73a8af0-39fe3fae289mr22725946637.41.1776244152976;
        Wed, 15 Apr 2026 02:09:12 -0700 (PDT)
Received: from sidong.sidong.yang.office.furiosa.vpn ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1074619a12.1.2026.04.15.02.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:09:12 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jens Axboe <axboe@kernel.dk>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	io-uring@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 1/4] rust: bindings: add io_uring headers in bindings_helper.h
Date: Wed, 15 Apr 2026 09:02:12 +0000
Message-ID: <20260415090851.4897-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415090851.4897-1-sidong.yang@furiosa.ai>
References: <20260415090851.4897-1-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add io_uring.h and io_uring/cmd.h to the Rust bindings header,
placed in alphabetical order, to provide access to the io_uring
command infrastructure from Rust.

These are needed by the Rust io_uring abstraction introduced in
a subsequent patch.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 rust/bindings/bindings_helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index faf3ee634ced..b7b0d549a061 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -60,6 +60,8 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
+#include <linux/io_uring.h>
+#include <linux/io_uring/cmd.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
-- 
2.43.0

