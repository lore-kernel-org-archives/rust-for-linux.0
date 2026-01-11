Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD53A344033
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133015; cv=none; b=VxUBJuR9XS/dQXNHO58AATDBgidWMWVGjGCAsZD8FmHMnezi0GkZvfPTB+k1pjGStt70LRWPKX8m2+sHR/wAr1WnlV3Tm621zv3qbyfPLLJBD7f81wES7qOjpZiQixsWdNXfv+MLkMK+TxKFJ4m2uBmelBtBb5dHpWYtohab/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133015; c=relaxed/simple;
	bh=gCbR3GFtX7U/M5ncjDF9ACLc9ETQz4PEL09PH8zUK2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQ02ClWdWoRlkr7OTsVWOo+tJgOUceZdUmWapUY1+JAB7bL+BD9Fou1mZHblspnVWzktwMPD5TrqjLttUZBm7WOPgluDLvCs4qI6X0OqiGDl1i/SQV3G+o1938JydJCIs3D1VI9IAjQAmXV/bEVI4701UUmMHE0pKU2WpgkIKNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUbfw5Ib; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUbfw5Ib"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee158187aaso60615991cf.0
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133013; x=1768737813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g99DEBLQaLBX/pyNsC2hBNpYdw8rRcB79zbmvUgRaxI=;
        b=NUbfw5Ib1zglKMCSPYNw4c5+KSvFN5+HGXNJ1KBQ4PcJNmLF9Vi8BPYylhhsezLBLs
         yeMUJSokfZwa1MM6jUGeyTZA9RrADyKM6BCAkGf7Y34AzaTdRJLG2MLCyOWdCbu/jeji
         OPEFwkk4lavfLuPZ20vpZpSrj5XqIu4WZJO4QLLvAFiLn1Zp+AOvReD8se2jFvHRWIln
         OMzQIMKuhdJSNX/0+h7cGJvrDXGW+kd/JNucvkLQZkQS+3qkv/7I9PeiUs16A1gCwQoi
         FcR5Bqzx7uYXz/W2Qe5Wd/WPkh1jJr+PnUtQ0gKVEFw53WzLz0Bq5pkw8FI1QjaCl5hE
         relA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133013; x=1768737813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g99DEBLQaLBX/pyNsC2hBNpYdw8rRcB79zbmvUgRaxI=;
        b=HlSlSbGRragifg878h+t2QeEn0PddwYsZd/vG4ocXHzoycJPqtcW4QTKdvcJH6cTja
         5NV9Sa8YFsopRhGz+dT6J9y0ObhlF2AOmu41eC7Ygqkvq29QFdXCeHuDnbfqaJXrFLqs
         fpILD95Y8piKCtsrrzp40fsRJu9ilzQZbnoMSlz7FrV4W1KknbKK6vMoOY6E2JCi/oLL
         L0PpzCG33Rjjt+RYU1vXUJIYoToX41tyzbrowfWIDfq1crXU9SiSPQ4VFSN5XehIhygw
         pOrXc+Xaw96PpIqAQ8F1q6EPfJY22ic2jJFXXSaoku9LHaeCvPJELMGbEx7UaHjAzNo/
         Fojw==
X-Gm-Message-State: AOJu0YzzYUAgnLk2qWs5Eu/TsdTfNSqlA5gsDRfYWmOICBN4yIziIlnS
	x2NtOI/jHsi79VWQYHamlcjBSP6fUnHTetihKQf5Rz1iOQzeEP+m0V97
X-Gm-Gg: AY/fxX6CFgwlE9A1jR7TjvpJXDdWduqIF+YY4yhu+aKyPfwN3LYlj0Guvibfnm3oIUj
	q72W0o4jrbYN/g2tqnUAd07NbqdnPv+2oQ1arNP7My845ZvmJTFee2O+36ZKYXVNLOIi5gEbRgp
	+vz9T9nsEbf0xfrvyzhJQ91/NzHhglAatqu1Zf2z6Ak5zhumCmyFegJqhi5CdaxUldaVUSGbH1z
	cQQRwkrL8N0cfPlRkAc9mmWWh2+N2sOesOZcEFuLHFGAayWZmd0uyAi+p1UheTtRjcAenHWwioz
	+ldh7H9+UuXr4ys5p9w7su/L+A5E2e4WXmj6pe2lXQp3PrtIjNN8lzE1SVQcqnCCDt2KUWE8xOm
	xR4ajJTlvauTIBDmEwPHtIssv8X9se+IcAoKLs0Aq/vpDxJ3DMs2qhrB0jgqfskb0nH6dj5t4vA
	mRRgYx8ODiaiIaihPt8B9Hcc1byi4gxxwrTR/4lF+DP/3hffnO6QKeKClzqp0WxuVu5Rrtpv+jl
	Ot8J0iUOIJhYUn1x19RI7RBjw==
X-Google-Smtp-Source: AGHT+IENmmCoSHNLUi9LhJHOEfhYsdVuZs7pKTYg3a610T5MZ0xFd0ga/mDpUfrsri7jyu6u7QfYGw==
X-Received: by 2002:ac8:584c:0:b0:4ff:b18a:104b with SMTP id d75a77b69052e-4ffb4958e3cmr206452491cf.23.1768133012890;
        Sun, 11 Jan 2026 04:03:32 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffb813ffb8sm84359251cf.20.2026.01.11.04.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:32 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id EE1B4F40068;
	Sun, 11 Jan 2026 07:03:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 11 Jan 2026 07:03:31 -0500
X-ME-Sender: <xms:k5Fjadab1PLC2oxYFGjzveq2xsUoEBWNdcsgbbwRJNZQYblXYLQJUQ>
    <xme:k5FjaZnlUNaAkghLxjV5B9kKETcFJrzmtyfCUqZ_L-flGCLNA2HKBYV9Xf7PPHEzD
    7B0UeU5lyyNmsdXmAqmhuLrAYbPimW4aW4IBIAUps6_6bIo6cwBzQ>
X-ME-Received: <xmr:k5FjaTXAL2Xi4ruW55yCgX5O0mNdMMHcVkB0mHtKu_Dxx7RoorRE8Mjc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepfe
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:k5FjabKz_sDBYY7LydOBi7NdqcC0NzF2BGyFvSa0DCdnNn1g3XF_nw>
    <xmx:k5FjaTsCeOik70HqxlhJgnrXFEQevu4FOxYJUNWs-x2WMYzU8NpUnw>
    <xmx:k5FjaQ11XkbanLI9nOX2POPd2XggajZ8PDnYK29WVAYCUgZIZoxJPg>
    <xmx:k5FjabMVGURpYPzfquzqMR4nuw5Jh4PQ8N3BbntE9UdMnPm-Ddo2gw>
    <xmx:k5FjaQUkZkpzaW4eObC3ydSLQzMO4OT2vNSHvkAQhw0Gji-f2EKf1Dev>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:31 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 30/36] rust: refcount: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:03 +0800
Message-ID: <20260111120209.6133-28-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-17-51da5f454a67@google.com
---
 rust/helpers/refcount.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
index d175898ad7b8..36334a674ee4 100644
--- a/rust/helpers/refcount.c
+++ b/rust/helpers/refcount.c
@@ -2,27 +2,27 @@
 
 #include <linux/refcount.h>
 
-refcount_t rust_helper_REFCOUNT_INIT(int n)
+__rust_helper refcount_t rust_helper_REFCOUNT_INIT(int n)
 {
 	return (refcount_t)REFCOUNT_INIT(n);
 }
 
-void rust_helper_refcount_set(refcount_t *r, int n)
+__rust_helper void rust_helper_refcount_set(refcount_t *r, int n)
 {
 	refcount_set(r, n);
 }
 
-void rust_helper_refcount_inc(refcount_t *r)
+__rust_helper void rust_helper_refcount_inc(refcount_t *r)
 {
 	refcount_inc(r);
 }
 
-void rust_helper_refcount_dec(refcount_t *r)
+__rust_helper void rust_helper_refcount_dec(refcount_t *r)
 {
 	refcount_dec(r);
 }
 
-bool rust_helper_refcount_dec_and_test(refcount_t *r)
+__rust_helper bool rust_helper_refcount_dec_and_test(refcount_t *r)
 {
 	return refcount_dec_and_test(r);
 }
-- 
2.51.0

