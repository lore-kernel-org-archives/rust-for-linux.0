Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697AC1E49F
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 08:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767255388; cv=none; b=BllFqX7OnnyP/4eQ0DtI1CSZlUNQU3FGcEGUbxzASrOQPtQgV/E6OEQO1VszfmHdTG2x8H5dYtF7W5+sNrts6Dr3keNn5uC29jpauoL/KynAWQnyqHiZwaGd3y4o9XIhYdxBOeFAr76zUqcjeUBkIsVpdpC2AztPd9aYDRViVr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767255388; c=relaxed/simple;
	bh=Y+39MpLWuVWbAV05Dat+cSKmxVXwdHX36klW0XJmolM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLMC39xdVA7Kxx13TlhlfG5Qz60opbDr4sbJCJIzZKa0M02M0hU5h9pyWOCM2mQvqxR37R5qVrof6zFD9aZFlz+CCXM8BFDho58dJ9VojvQZsdBQG0P8AUPwPiFUv2DLUZXanefWVae3ofqhNmLhHtHjTPPlFZfaPsZkMCNQ1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a102494058so60911395ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jan 2026 00:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767255383; x=1767860183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YCAeQMWLuAT8xnOibjMuEGfFUPtvpUgHPN583gE0LNA=;
        b=T/zg97c4qaOSiBlMkOiFaNup2keDB9xSWioqon1i2WXN3trMERmMlkICihRwqim1SD
         F0VHA59jiKLCHCXMZfl6c+wSADeM0gS4rIigJljlDAc7KJuT0EK/+sGEW9leeW9NvadZ
         2yZMcxFvxZDILRb5sNeIlt4gFgWurfbt13+m7yjIs9/pCEHHC/70suZSX1mUko1kW0Me
         XoNS+R0QKd81DfIUxa5otpWqsadAmoj0aNXaN2QdyLCPdV8FkB1HRMW6pYjuhaG8IT2+
         qIHJYp8OwZhnOEVhcJ71X2IK3yFnoWHABMrv1A/mWbHyAfQUpI55mdlZXqIWRCbuHsSj
         H1rA==
X-Forwarded-Encrypted: i=1; AJvYcCVisjLz03tmo7hsvTZA2yF9hk1wLMWe1KDZiLlla/XEZKAMmDAJjjggEZUo+uhhs9vVupSeiPJy9OlI8raIIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5PWXdddVe7BZydrIT/VN6JbtYhqeAI7zb1gbugU0Oi9sf6+d
	c+h19FbOQhhFyq10GZL0F1pI9NqRr2ntgFra4Tjw8dqznuGyRRI9C11E
X-Gm-Gg: AY/fxX4CAD6GWal8t9PiZaxn3Lb8OKkgfwqumInPRALDfqetG9kxCS2S7uAs3eemlA3
	KmmVGLZ8jHwgS0M1kLsQgntfyadj7Cc+rCd8NcbEeFVGhpBn+LyW3ymI1Y59g7b4uKywzuQ7j0E
	Fk1aXuibC31lAZi9k5IMpQXvg6Ab9bWtX1NNbCxMm1GYP5IvrLDzvYgG655Zi6vX3VRbHFtLNMJ
	cpnccS8GBW9Od3RAWHAHWlfd5TIZ06ZKULWL7ijmewvlDLTZ2MruZApyEEdAF7dNY4mKlCXANdg
	Al3uyF6XHEOw7/wxCYgQtR8kTQMzm453wwXTUULXSjgQrxMAKj6OIQy9dvY5lVNqpkBtKPbGhNR
	m3TgoBgyH531MblmbYnrqPJS+eUuOrh7LZlUmGWzCVLq7gtuV1WaPAF4S5qh4eSsWRP/np444Fk
	v/RYcwTMboLXQ5kTFbIVzwM4BKowkzZhlBpaJLOP8lG/Swwv1UEOn3FR9Y/q3lB30EKA==
X-Google-Smtp-Source: AGHT+IGi1+mwdVQkNbgqcLDUkWhmPiGROrVrMGBckRIlqcMuV/lI4HU17xZ52XZaZmJy4aoltMcx/w==
X-Received: by 2002:a17:903:1d2:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a2caab76c4mr397720765ad.10.1767255382725;
        Thu, 01 Jan 2026 00:16:22 -0800 (PST)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666casm342457585ad.3.2026.01.01.00.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:16:22 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v8 1/4] lib/vsprintf: Export ptr_to_hashval() for Rust kernel crate use
Date: Thu,  1 Jan 2026 16:16:01 +0800
Message-ID: <20260101081605.1300953-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101081605.1300953-1-sunke@kylinos.cn>
References: <20260101081605.1300953-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export ptr_to_hashval() with EXPORT_SYMBOL_NS_GPL using the "RUST_INTERNAL"
namespace. This function is used to hash kernel pointers before printing
them, preventing information leaks about kernel memory layout.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 lib/vsprintf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a3790c43a0aba..7311550f6064a 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -811,6 +811,7 @@ int ptr_to_hashval(const void *ptr, unsigned long *hashval_out)
 {
 	return __ptr_to_hashval(ptr, hashval_out);
 }
+EXPORT_SYMBOL_NS_GPL(ptr_to_hashval, "RUST_INTERNAL");
 
 static char *ptr_to_id(char *buf, char *end, const void *ptr,
 		       struct printf_spec spec)
-- 
2.43.0

