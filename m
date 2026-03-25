Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B0A358389
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 09:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430828; cv=none; b=ZzzNwKbq22rbAQfCv4cSWPciw+uJZcIIMM8ZYbTV7cUf3smIA8ZUTw2dgyt8Cty97QGztORRGgrZlO+9kWqOBvd+VmSeUgSQtDnuGA5pLfoDy6aas2PzEWMqaI1QdR6AOpfkmUu9FUoZK8s0hsQXQ8cw9Yoh6tNQyy4mVC5LK9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430828; c=relaxed/simple;
	bh=HnGb6oNDsCB5tv5asVjd+AKFnrtiLcYTXJqcY1lq3iU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pk7RUKaUi9uwQtHMmrpgAXNfsYH9Z5AYQKEM3/+vy1ZwJ6M9RXYuTVn9HJLJS4Jj+AtNn6Na3I6nMsDk8DwBlpmW5qbyl9t9DqiYc7NTNQZuc16tD+UnZgJmNy7dnahzyzz7bEm2P0tU45tEJ2Mm9l1HxPGyMSiXC5GQtGG0kVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uQ0BllR0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uQ0BllR0"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486fa35b005so28587045e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774430825; x=1775035625; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gyoBCCL7R2zpGR0e6D+f4G9qJS5EtWVdmc2UjsZGGY=;
        b=uQ0BllR0kzg09AvBZKNsvh0HJPt01DKI0fHapi+JXAj0jgyxbjHAWJ9kIrJ7gDRUul
         8hJctoLWDN5LElb/n5Qmt25WfWAlCXOAMYp5tW0Iv6g5SgC+F3r5OlgfodCML46BTUGM
         zTMb72P/4TSWNgppgRxG2kFjSTeBe2bbQRJUW8hSuWVP8S290nWhLEgwJKco3uuOvV1Q
         nVypkEfW7K/gUjfrGuv1M1F/VcRatNz/u4LIo1Eyioht6cwYxUrxTCb8tpuJNCvaSiP0
         Y7W7Xyi1GUJEZW67q0MMqothbukhGp1rQfrsvSW5dSjZlcip5Wau3JakjTaEThzCxMlr
         M0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774430825; x=1775035625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gyoBCCL7R2zpGR0e6D+f4G9qJS5EtWVdmc2UjsZGGY=;
        b=P9/vmK3oeGWhgt560c1cGqfhkzeo6M0CU8hRkw0NyCdiB+YXweTTi4e9ekXfDO88kh
         Rfzbuonpt9LEGDIoasOV/ESkOWtyt2s155X254Rh5IKd4H7Fwyve1ydr3Si5PKEVGgwu
         6ifIACqh9ltNOtCBAy8nmjBEeMiEylAmTc9XRBv4sq24m7jQFDm+ktoCXz+j1lPlRYle
         bONGh+qmjo4HwW3JJ3ScUW0A9UPz4932+D6f+2egIIbEvTBeRoOXNljh56MPj1c3mhlL
         th8G6dd0vsE1C5H0BiAlygYYm22VaGWUzR4reAuh2z517oMNbEjKFePTUK8iTkhjGIW9
         f2gA==
X-Forwarded-Encrypted: i=1; AJvYcCW4/MuPce0wuSLW5Ogww6jrtsJxIKkzbyX/+tCbD2jRQmgBjcCfUOziARVRaf3XAahpV06LM++ts/RnKiCT8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YySCJvGEBEtvEy9L2rb9LS2xnmhbI4DWYSJX5e+yOt5+JBgiL0S
	QXzL9TMtgeCJ+ZL04FkMi7NvMavU9I+35IqCV0DLILjCIkWl9TA7qJz1a2djcU512Lk8CPsVs49
	kXUVweJA+byO+fX9Y0w==
X-Received: from wmqu17.prod.google.com ([2002:a05:600c:19d1:b0:485:39cc:2a07])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e52:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-48715fc39dfmr43468755e9.6.1774430825110;
 Wed, 25 Mar 2026 02:27:05 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:26:52 +0000
In-Reply-To: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260325-kasan-rust-sw-tags-v1-0-7d3a765a72aa@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=HnGb6oNDsCB5tv5asVjd+AKFnrtiLcYTXJqcY1lq3iU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpw6pju/c2lw8U0Dj0ADcGZ6cBzRmEjx+iXhXaq
 6oA/A1g1MOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacOqYwAKCRAEWL7uWMY5
 RgpXD/45X8fKglRP6dtiHZWODmavKX8/p4mWH0aiUq7pjCmYyYYdpJrGMo3gKqmy2T49aKaRjC8
 TvifajXm+ugvzt4hW9mddmeAVf1Q0aTkG3XcLzVntCdw6UvH7AEH19L1yzdCU0y4JlQcMJAgtW0
 5MdTtzo2RKFGe8k7x5uR3JbpU6xVKLaXYonTZoqNRrq+uCTXvNedIt82n2Z4VA8qT2WkI2G/Tw2
 fH1xp7qvh0eOtg0nSmlFn5E690I8TVaVM2HswMUHKx2ZNFD54uVV/h1LQqGGxiysHbaVZkOIJO3
 ZhV5fAlyopcBaIfIJl0SxySodbyiLgcVROhJgUW7UFa1n8jMn0ctO/pwGpVeERYxiCfiNjMWjvn
 NTQufXil4XKv51njuQw+FRUet68ACz0XcPYUwdceSrizmwj7nik3zK5iQVBEll3SsdOQOu8olqP
 qHCmOWf3icvL9K3nHsh0/fQ1weSLNgJ+s3Xo5yBGngZgxFyxaEH6bVcTXGkHD58UkM5UTQFv+67
 SyIWiXRFWjd2tQrrl2LH5LkqUv+Te1tPWiwlBqQl/gCkuJAvIytj2EkFnUbgZaqAdTvS8MbfBEH
 +r8ee6cjkAfTAUUZS5FOQZa4KRhuvb7Q7E5Pzv22Qastr292GYNCCHYmLdVZXkJsxwhiWUwoTzA ipv+K3TIPIrI/8w==
X-Mailer: b4 0.14.3
Message-ID: <20260325-kasan-rust-sw-tags-v1-2-7d3a765a72aa@google.com>
Subject: [PATCH 2/2] rust: kasan: add support for Software Tag-Based KASAN
From: Alice Ryhl <aliceryhl@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds support for Software Tag-Based KASAN (KASAN_SW_TAGS) when
CONFIG_RUST is enabled. This requires that rustc includes support for
the kernel-hwaddress sanitizer, which is available since 1.96.0 [1].

Link: https://github.com/rust-lang/rust/pull/153049 [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig           | 2 +-
 scripts/Makefile.kasan | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 444ce811ea67..545cbe889a52 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2179,7 +2179,7 @@ config RUST
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
-	depends on !KASAN_SW_TAGS
+	depends on !KASAN_SW_TAGS || RUSTC_VERSION >= 109600
 	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
 	help
 	  Enables Rust support in the kernel.
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 9a9033096c88..3833e0b3b857 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -70,8 +70,6 @@ ifdef CONFIG_KASAN_SW_TAGS
 
 CFLAGS_KASAN := -fsanitize=kernel-hwaddress
 
-# This sets flags that will enable SW_TAGS KASAN once enabled in Rust. These
-# will not work today, and is guarded against in dependencies for CONFIG_RUST.
 RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress
 
 ifdef CONFIG_KASAN_INLINE

-- 
2.53.0.1018.g2bb0e51243-goog

