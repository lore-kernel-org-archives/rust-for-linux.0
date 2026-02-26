Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF836682C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107808; cv=none; b=k6eQwRyK02UTU4GJ2kO5DKrhq+Xz+cFkpf29GvA87JOM02TDaCuJnOZ5z5B4FMXenCnhq0WyqOU8q2t4XmwCN9zje6c5AsXpq38i3u85uCwKz6x4qaEz5VlKHVqA/qEMneG8KUaskxvtM2LOgVcGr7jgcmbbUrtP++vWBmsZ/i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107808; c=relaxed/simple;
	bh=x76RNCXfgdAuGc9fiHqWSqvUA0USXkosjZxUYRc0fFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CmrQVNiNPpAWXLzxtWVEhhbHJa7q4GH4ydBz3ZyXDZlajMVAeCArIgbv5nQDbkqp/QWIhTmu17XM8iKJKtnm9NkhcOf4WQA6HbwbCI4xVYFTd5Je+sYf7X3uXNvi86jtiA+JbhFMr9snro+Smbfv5i7kSF4jSs7NJVcJvsgGTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdRaYH8X; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdRaYH8X"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a9296b3926so6022445ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 04:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772107806; x=1772712606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xSHdR1w9bpnJdPF+3g2I3/9gadQVBqo+N9ka111Les=;
        b=OdRaYH8XRfNYwsoaK/dzATibXDxiNRg3VpUsu5Ys4Njl3axYCqz+vGlfcia2YVaf9J
         G+mVLsfXdXnteRTuqQtNb0trnU/7u8X3V6+MAEDGkD1Pry5R507rwSlB1JuA5C8wSy9C
         5CDYevCVHy90SC722buUGZ8a2CxKApBuAXbuENczSyox42+jaSABntq8imWRhpjwobTP
         HUVM3nV85nxTZGnrDZbzy+Geg+yJAR0Ufv99LIjazk22xxflwBdaxOdQ6gyBkv9/Fefr
         Rj5BmxuegMZMclDuUJQlqkybIJPeaD7Op8JfvC0DR0FG2PCzgoA16R69l7qp6vjewPzL
         NRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107806; x=1772712606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2xSHdR1w9bpnJdPF+3g2I3/9gadQVBqo+N9ka111Les=;
        b=PuHvBxMb6nAbL1rnRwXN7xo7xAn8Q1HB2iTBIdBpuHxqzpO92LpQkZL/9OlODKAtN3
         DB9x5GeEEqi9TJ5kCOXkyhWOMH5IUj1yOM2Gx4K7rchXpkOQi2KsNk0hKU/I6yxw1bIf
         nv2h+vemoWGjSS24aoEWHO1AK2UyZwxgq0878VEqcyXbO/BHMxsXxy6vofWIpYV8lDOd
         Hpb/Jqv+k3FirPFAJkZUlHF+tdPjEI5hd/60B3BtZWWzoK4B9erXZIiMAD5B2qq0s3Xi
         F/LLmMx93zxNrG9bHgTUjaFQTM7rvqC3pOnF2V4wSv7Jm+OihnX59gGu425WoQ+rLYwP
         Yc1g==
X-Forwarded-Encrypted: i=1; AJvYcCU/JrehbkOKMnxh3HifzAqIfoyi+xkGuBAmcWYLrEuSAi50qeJCTw6AzuUqLqyo8FOMsz2VhY0U0cRjDzcqDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNEfPb2dg1qNRgNIa7tAfdUB/9x0vsHQIt9f1Bsl8ncPjJjm2z
	FDBASSKkFBh8WA5l36AwjNuGeUjrp8/YQO/VnNbl8H4QmEO+zW6Tl+bN
X-Gm-Gg: ATEYQzy1RCPUFpFniER315sG4G+wMYS8qP6tTHoNHeTCVWCsMvStPHOz0yqDP526OnQ
	7Y8eaw2ZU29VnJ3ZEhW45gofEUi4v4N1hIDyw4o+FFI4/piuqsIMtDSa8Ob8gy2n4M0fEzs56mg
	sVHnwfWHe930rFQxhuWfDbHfx503DtKV6Bavv+bArhoDWZYQ6KqnMQsxNyJDN43R8LsgL1raspl
	0XS5S6idRoGdMTDMNZWwO1hRlxdpBdAhMGy5x11oWVQsnKFyzYovxpUhKXLEwaiKHRPArvmMxdb
	OSJFQoZ/yn7t2kW9aZSxVhC4P67cu/mqqKBc2ikSGf40PhdjB3qcHTsV9Hb7euWLzegm4Y+fWLU
	5QutAr5e9LutGHmIERvIQk9XVFF1R6qoBy+6zDcV7ZfIchyxBwofRFakW8g18bEY6iSjNk3rclt
	0oU87+0wY8lL4GcjRHza6isdXfzytZCUhqbjA=
X-Received: by 2002:a17:902:e5c4:b0:2ad:d59c:bed1 with SMTP id d9443c01a7336-2ae034c04d9mr27210895ad.29.1772107806443;
        Thu, 26 Feb 2026 04:10:06 -0800 (PST)
Received: from archlinux ([103.208.68.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6cd476sm24199525ad.75.2026.02.26.04.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:10:06 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH 2/4] rust: module_params: use `pr_warn_once!` instead of `pr_warn!`
Date: Thu, 26 Feb 2026 17:38:46 +0530
Message-ID: <20260226120848.82891-3-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226120848.82891-1-adarshdas950@gmail.com>
References: <20260226120848.82891-1-adarshdas950@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the temporary `pr_warn!` call with `pr_warn_once!` and remove
the TODO comment.

Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 rust/kernel/module_param.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
index 6a8a7a875643..dd6d663a0a3c 100644
--- a/rust/kernel/module_param.rs
+++ b/rust/kernel/module_param.rs
@@ -62,8 +62,7 @@ pub trait ModuleParam: Sized + Copy {
     // NOTE: If we start supporting arguments without values, val _is_ allowed
     // to be null here.
     if val.is_null() {
-        // TODO: Use pr_warn_once available.
-        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
+        crate::pr_warn_once!("Null pointer passed to `module_param::set_param`");
         return EINVAL.to_errno();
     }
 
-- 
2.53.0

