Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE233970F
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616975; cv=none; b=IPsZ6tLGVk/UyBJFTDsDNEwcufkrldcugVcIFuEpGwziohqzkr2uRSD5xMGjrG4qt4WzfO1h8xxZXSDX4IRAl1UMqHDO2zsoMF0yHx3luGgwS0q7Q9zCX9pfcTSac1RQl8wX6getukrKBSKaCzp/1H62lOfKL/LBKIL+mL9+4Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616975; c=relaxed/simple;
	bh=eklUnMkjialDLjmOlCaGbwka3gC+QkgvK41klffYGdc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=piRb/uL+yXS48NEjpQRw0Qifwqmo4hVn83tZB1fi1D9x2dB01jlzdojrcNcxypEDNw6LQxZbchUhl1cD4uex/+XJ80UvVncA9ggEyBiSpczUFY/G4/s6SLo0CJJ6adE00gYXWrtg2iqtedj8OgS3s9pips08+tB84SVcVf7Ypx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CThAUFlN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CThAUFlN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47d62cc05daso25363565e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616972; x=1768221772; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPim/bnU8LvyeLR4IV1lC0pyB+pbiZT/fuxdT+3ZgLQ=;
        b=CThAUFlN1bqOAueNVlHhS4ufh1gfWQxUGBd1CwDc74gR/VqfvS8KL88FfUztNOI87e
         qkMYheZwOepptD9uqRrn7mgmc68YOdygV/Of4TmZ8CaI5Mb6biD4Lhqg3+Maq8q3vms+
         qur7rSgdpxRuhzqn3pEBqIZRpfjmi1/6XIfSo/JnZwqvlm/lRmutJzCAPPDppBb91vQz
         GlXZnj37ER3Qu03XkV8wveGZW+FwSbAt/+NXIDOxC2iF/sYAranmbN1LY4mILTRqaaU+
         6P6lWDmT6/9Dsa7DGn6AdPs1AmI1DFNL2Cv8aWk/kc8e1084LngJyuYjohyYkyFbuoOA
         eNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616972; x=1768221772;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPim/bnU8LvyeLR4IV1lC0pyB+pbiZT/fuxdT+3ZgLQ=;
        b=SbMzJ/He65ARNO5j66TQ1vXx7KRVo4x6hXsk8xcsGXjoLJjmVaqHPWiyCspju3HrDf
         TdqBAa9PRahgytdjJHVLzjEMbrRYLiHhfiozW7cHBvdPLX8X+HE135DqP5/eSr0ycOrD
         ywpCSCF0BgqsWKTWfH5WCZnEEcrYTO8tEWsxCtftexkbj5QPmpsr89o8yfjwxSmTDkJ+
         F5/WbPdTFloQGUpjIFKLjiZ4k77b1N0f/MPg/0A/UKjhCWS76l69IxD/WFYg3WAyToHL
         tRNkbas35qtRY4o9w2vu81HtEd2ou0ZBRLRQCBZzuo1rLyIRoY7XLs1BRsjuMVvvGsLR
         VC9Q==
X-Gm-Message-State: AOJu0YwPQ/wvPxV02icgVaThiDyyxA+tmxevkbrZi7fjdqjybZVX8+0Z
	yyAHEBce4nNr3DIYT7B1K0Jga1jM2aU+itwVEZghC0qSpf0Tom2+aOhrCWP73z9N2dyso8tCPEO
	3hF8ve6E6rnqeO2YpxV0C4lxqgBKhbULrt3YRHn/tNoUN7EUup/vGV5iLyMrNkaiPUEAH9v3jLC
	9s8OO08jkurl+f9pWgU56PbIpg5cf968OB96TokOSPW7dieEI5E6MgMKrXQ8brEn0=
X-Google-Smtp-Source: AGHT+IEKuUpjRUdDI18V8ybvVSN4B8FWVVfm5z9ZQIEQ5lcls4uthnO2XVm2jaCrQo1BFMS3SMRH4FDVz4X6uLg=
X-Received: from wmco11.prod.google.com ([2002:a05:600c:a30b:b0:47d:47dc:d5d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348f:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-47d1954a710mr546210275e9.10.1767616972235;
 Mon, 05 Jan 2026 04:42:52 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:23 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=eklUnMkjialDLjmOlCaGbwka3gC+QkgvK41klffYGdc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G75XlHGTbjrX5WBJdg8/f08EeV+yfpT5LCC
 Sst+D/4TVuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxuwAKCRAEWL7uWMY5
 RkiZEACa8ijtRTQzaOKuY5mDAmhbz7gVUxOYqZxuc56B8TEu2JchNUtPBzZmkNdhGGGxujg8/Z5
 L+hPwjKzgXRUPgR2Gbu3faZyVMScMhM7NfZ27zAvVDpw1gH1qFAv8+GB5XRwoJ6yoImD1GsKas3
 nOUGwYmOT28FOemvmP1AyljbngXLQkrkcVAo4CLQy07rj4e1x31K6ZaFPkaWaql+V+bOKBplBsY
 ESpdcidT5ob/77QaOLx3zzdtR7gsPhJcQ2yGkTJFuLHzGGjYA0GEz7m70B/O7qR6UoN+NE0RBW+
 WBulY9rt17SZgDVI1H+SnpEYYv5heeJI6hWYeMM/n696NGml4h+3NB3/FMx7EZarJYvMZ/zTRCS
 6QoRlqn+JZ+y5qHlC88lU5A9NzG2i0VKFfg9q4B6aLu1kt7e8DwZUazHnQWlrosV6YrZH4UCrcE
 epGQyjCywmOB1w/X9Nv4bYQ+h1EagE7nowm/nDRWVXuh1uJ/0RI+ObYfEorSBKLfUy2uzLelhtW
 26wO3X7wDiOzSg/75MhFgjOPYSaDdk9RRhqqOp0skHB9ty3qo5WtWjKbO3c7LrRMsPm0M+37xjL
 IImDrGXslKfjgpFAcesWHy34XXR73csgHFrEkBXpf8ppGrCy5hXc+uQsP2ovrATpf7XmZ0Zvghd F/47bcS2Be51srA==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-10-51da5f454a67@google.com>
Subject: [PATCH v2 10/27] rust: maple_tree: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Andrew Ballance <andrewjballance@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Andrew Ballance <andrewjballance@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>
Cc: maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org
---
 rust/helpers/maple_tree.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/maple_tree.c b/rust/helpers/maple_tree.c
index 1dd9ac84a13feed53c0ed5eec6805517081d0673..5586486a76e0de60969af1510b4b0428392920e6 100644
--- a/rust/helpers/maple_tree.c
+++ b/rust/helpers/maple_tree.c
@@ -2,7 +2,8 @@
 
 #include <linux/maple_tree.h>
 
-void rust_helper_mt_init_flags(struct maple_tree *mt, unsigned int flags)
+__rust_helper void rust_helper_mt_init_flags(struct maple_tree *mt,
+					     unsigned int flags)
 {
 	mt_init_flags(mt, flags);
 }

-- 
2.52.0.351.gbe84eed79e-goog

