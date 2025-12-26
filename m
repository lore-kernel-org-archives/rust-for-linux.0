Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DDB199E94
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758091; cv=none; b=qN8njL8csrY3STa1wvP0HcqcKV6PZCzx6U78mOSubSelP22U232xz73JGwE0zAC9PdavRwz4cFQPqyC+uqHlEqaPr4FHG6XKVUpHbnfB8glVrJrE0zGr0Fi1lu1RT3vzA+VpUBgXT6xfjqkDSW+ndZdXq+vZNfjsOoagNEsTw3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758091; c=relaxed/simple;
	bh=IKl7/bfakQ+mbir6CzVUYw/mbCd9b8LMYnzXc1fYSM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJaVWz5CmCcoJsH7PIjjLcL2a+nhJUFbJASpxnf+Y3yECmCusVcq5o1LnrCqG5O5OrefD9LSWAUdnQWHT4WCIhafXMFD46fRrcQ3j30TP4qs07gjcIMGuynZ75CW7aeCPKKuyrBiIoX3lkyCcv7kmClagVGUup5ZRmopzklzqKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c21417781so7351868a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 06:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766758088; x=1767362888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsqwhJopFC2L1zbCm9XHJhqD1XcSvq6YgpMNLvfdsIo=;
        b=br5KgqSd/bTpjdbti5cIpatoMWECfFL8hiENoQMhAPj3WRvmSIAyeaXYCoSpDUKfFU
         39IbMJ0tknJmKuOdruwdcjDII1QM+hv03NVfmm/KC17/i8jOtCwMvcyGcffRufpL/vfK
         dghs8i96cgZaAo6/RWTcsATH5k4EsLM2dntFmhHzcIaLOjjbzDVPM+XHyN8EQonMB6/R
         xyeVH/U7aBp9SltLMyz623H7rOe9cFiYdOJHowYZ4VYjizgbuCc9jiqpEkw091ZuQFYl
         ES1mtRMHh6jCJZY21xyeTgEUIN29f4wfRc/tFSvYCdfqlviFao4BXu7tj1D5O3UW4K5h
         v8sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjDl23Oi5KESAysrIMwQJ+zwv0QQhoWzWRoSvgtC5rp5VkhZbSnFq9CJr6au7rzyGn+fmW1/OHkHuSLyybDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcogGF58I/MtHVQLSPT8KD10xrFb/1mDyES8F+JuP7H6BBcl7E
	5c4v5sR+vJoZdEGc7zfq8frHegOyNHV2ImVEu8TPFRH0O7GfSc9q2Mmh
X-Gm-Gg: AY/fxX7uZDQFImd66aVhFoa+7mat2FlICVaY+DNzXjKDEmDZVtCJdbhFmdeqDD9wFFZ
	7Xl940ghfg29JLG3vuM4xB4ctMUCzXENj9gWAC5DnJPWMjZ7B0tUH88gPEHv1YwW8P+ELJY9QJQ
	0cWAEZ7Fn6R1QiieAmp4mEkehjAXoQoD5NEww5N1FJw44Cv68OGpjMbuorguwTLQ4mqC6j1Q1Tz
	EgNeMf2WfbFsgonU8u5CPaLO6c+0v0dGIpJweL0YfN+eHLT71nBTNi5uFCYbn1uTjyoDgnXntoM
	zRcO5UG/27DvcD/F/GveIyJyEJw6ywHu+uZZO0yOzuRjsoB9d8201C3CStIH1Km16NJI5KWDD9w
	s149/US6OZkVaYHSnaMmDiXFyYkhmH5/S11EAfZoKMLwo6A0mU6kU+xUl4oiVeS3uSfb49qP1xJ
	P9aTGX+WYkq1r9LhhRAaKUalxPix648YA=
X-Google-Smtp-Source: AGHT+IHy4TqzfOHejiw1q4OTUMaKW0egG7D1Z2t4mCWEGA4YyMCxHPXEc2zYqtwOxO8AxHD/7uogpg==
X-Received: by 2002:a17:90b:4c06:b0:34c:c50e:9b80 with SMTP id 98e67ed59e1d1-34e921bba16mr22317898a91.27.1766758088410;
        Fri, 26 Dec 2025 06:08:08 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7729b04dsm11460886a91.6.2025.12.26.06.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 06:08:07 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Dirk Behme <dirk.behme@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>,
	Ke Sun <sk.alvin.x@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v5 1/4] lib/vsprintf: Export ptr_to_hashval for Rust use
Date: Fri, 26 Dec 2025 22:07:47 +0800
Message-ID: <20251226140751.2215563-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251226140751.2215563-1-sunke@kylinos.cn>
References: <20251226140751.2215563-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export ptr_to_hashval() with EXPORT_SYMBOL_GPL to allow Rust code
to call this function for pointer hashing, which is needed for the
HashedPtr and RestrictedPtr wrapper types in rust/kernel/ptr.rs.

This function is used to hash kernel pointers before printing them,
preventing information leaks about kernel memory layout.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 lib/vsprintf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a3790c43a0aba..d1c682afd792c 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -811,6 +811,7 @@ int ptr_to_hashval(const void *ptr, unsigned long *hashval_out)
 {
 	return __ptr_to_hashval(ptr, hashval_out);
 }
+EXPORT_SYMBOL_GPL(ptr_to_hashval);
 
 static char *ptr_to_id(char *buf, char *end, const void *ptr,
 		       struct printf_spec spec)
-- 
2.43.0

