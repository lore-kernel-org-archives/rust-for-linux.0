Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2FC15B999
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183365; cv=none; b=sjlDVTk+h/XMQDo93HOkeGLkYESsZ3KznLLEbYMHPr+AEYYQ22K+75whb5Z1zoaDlwBSIXKtzIKIS9Niqv4Rg+kMdJoACqV0QJcR4uNPxYMCiFOAdiY/7OBNeUm85s6FezIShpJ4qKgUwEfRYhQNG8uKJvYGoCot3cGyeCVdzoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183365; c=relaxed/simple;
	bh=9oNV1w3wGfKsfCywfmT2diaojSN6oTskGZWRM52458g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HlIcV6CWpxPI8XP7acmyWKRUHDxx5HhHNW+hpk9A3wNg4qahUzggu2v8UB3KWitV14BJcpKn5NR6GaDevd6Kuwn3EM+3PdDJBAWxw06qLaG/Lw1R/0yKiX2UigMsuZK1littQY4VL2lpZO6mG49fRq32Y0bMPvqNW4tWgDmQ+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V3Qe6c7w; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V3Qe6c7w"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e11703f1368so8190466276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Aug 2024 12:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724183362; x=1724788162; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhd4bVGt7t2cMFreV83ln0lve5lvedn9wm7Lt/YZotw=;
        b=V3Qe6c7w1Ak7ZdvmZnrZHsUYPdaWepbu6VMZCYO9sEH43t/nm77ADcV6T380NNSuC4
         HRJbuf0UpqTaeuX0MKsKmk4zrmeaSL/bf8lshBSB7W6JCIugeHq+ppuf8w6AfKNWKEV7
         xxJuypUQtXOftZxjhq+gMQ3A3CC3zgZekWt+640DU6vxN1xh7JdRwbKoKCvOrswq5zBZ
         ImWM/RCte2APsl/3rPerLgyieW2bv0OGbuw8DGIjDJPDOlL2EiI568zN6eE5jXfS6PuH
         RewJSbhbzDPXcFoUlE+tjJIK9cFdVI90xDwq7EJXSu2XrxDor9PlcGm1WNPmDKcbp/V+
         Jn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183362; x=1724788162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nhd4bVGt7t2cMFreV83ln0lve5lvedn9wm7Lt/YZotw=;
        b=Be1Dljz4x/dkxpHeGFFv3LrMDXS4SYi9IskuumKZqqGsDzzhl10yK6BjVYnhq4X5j2
         qqFumTA+bFsJqOQHR1Eqv9WZBonh+wkLmFbkS5Af+WaRW8JMzmhi1N23rRx3yEaLhRXp
         +DkMnE9p5m8VnjfZGw79RfK1+q19iAi5aWqML2yvsK1Zb8kOgxrRVe8H6gkmvBsunylq
         H2kyzhIWz4gZzS/8L35Rh4t39XA65vSdgpTWvg7KfW51h4L7p/4UNFuk2vQexwE8xHjr
         g0O1pkcM6eluBYhUrIvj/hXHA9+CZzEmTfcpyo6DE/8FE3KfN/hPIKtDwKW3Zk++Sa+R
         2sGw==
X-Forwarded-Encrypted: i=1; AJvYcCX78U//PrCxL3wrYXYXicvpY9DA86lYfMUZt+qSwq1rviTA8NmqyXBhO4+YTAaPmkORycjV6TPMulzyhm8N2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcaS7PljyH6k3+64bSONNKUMBxKTX8Q+PFM6gx+LvoI6Zs51lf
	mWDtXwMT9s79CV/9pvfWSCqKDw/ItyjCygYRzmQ6L01OGWCIIY+YAJ2etK4Jk2UAAadwxPGj27+
	n6ORztw==
X-Google-Smtp-Source: AGHT+IEpsPPXTrrUFHSKqTSK6jvaFKxfwi4lcLZMkRceC/2MJEHf7twykkXKb1aOCg41KLuqfqlpbrkDsfBb
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:9744:0:b0:e11:5e87:aab with SMTP id
 3f1490d57ef6-e1665542f69mr767276.10.1724183362312; Tue, 20 Aug 2024 12:49:22
 -0700 (PDT)
Date: Tue, 20 Aug 2024 19:48:57 +0000
In-Reply-To: <20240820194910.187826-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240820194910.187826-3-mmaurer@google.com>
Subject: [PATCH v4 2/4] rust: kasan: Rust does not support KHWASAN
From: Matthew Maurer <mmaurer@google.com>
To: andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Yoann Congal <yoann.congal@smile.fr>, 
	Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrea Parri <parri.andrea@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: dvyukov@google.com, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Matthew Maurer <mmaurer@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Rust does not yet have support for software tags. Prevent RUST from
being selected if KASAN_SW_TAGS is enabled.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 72404c1f2157..a8c3a289895e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1907,6 +1907,7 @@ config RUST
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
+	depends on !KASAN_SW_TAGS
 	help
 	  Enables Rust support in the kernel.
 
-- 
2.46.0.184.g6999bdac58-goog

