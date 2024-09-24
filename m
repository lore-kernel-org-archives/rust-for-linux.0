Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1481113DDAE
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212836; cv=none; b=lm798DWE2I/ADeFtTIWRwju55LW4c88e1p7nJJZq+X+mHBrjQxLxyPOd4GID4mQyuFbqSfKTUBD3FwhsbLJosE4SUNaLUF6H/mcIM4nf9xcZh6yxXnDdOEaDouHTKcMqGEOCE2sc1hc8pjh1jVB+ze96HBWa6na+0y9QlkNctrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212836; c=relaxed/simple;
	bh=87UiLghCgImjI67qGqkZVlUAdkIatHILzWkWX7E7o4U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u1I2Uq4++LqD89R0I1vCthESGPqd1a+lOiTarG6+IPj2RR23cd2ipLmWGl7WSg9KH/XxeF+O9S1Nuh+2BmW7agI4ERmT2s33e5gB3w+6d/xtilrqu2gephf7ibAzuM+zIWCd2zkS1rvvLNwua4CIKYoyyhxDHdJu7Zu5Sh05RS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1vW9r/wY; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1vW9r/wY"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6dbffbae597so103415487b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212833; x=1727817633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=1vW9r/wY5pMgV+iETKeCJpYBeVh/xxtd+97mXm+W8IkHfkJh59ByIPFs4ATtDqdws9
         TvxRvEOaihdlpzI4Og8q2QbW0YHwbdBXEwOdOPqHjnnGB1ExZjCwLLOF86YwgIXLiARv
         iUmY8WeBhH0l+2zxHoMlbFhZVEiC+nTKd2t72+Id4nkQC+t69iu1U2a5bUiTbG5nmwmQ
         y5lLO/uUOeghXFHCigzwssO/hKThGX+4esGF5X9Ve3rpxm5ZSsxAIbkIAMfwQ9a/4EpH
         /vTmgmkQL+63RJ18JqX4mzWbfPpSjJaaBIdCV22wvYu4B38aCc6ve72grdcUb8lyjaH6
         a/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212833; x=1727817633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyxbaKZI7M7/7zXNo9r/7MnbWQPTGkdTyXhoBixsIfc=;
        b=vOA1mhU7TUC+nKxB6vclNojXiLugxEa/CbOTq4ClbIutmUusE7pyHmIVjtLdtdyqVI
         /6Mb51xqBr5taYEC1OisGPX7srL5MFKyz2/cGq606wERUNp9KKHAI5s0+AScFOLubIYF
         bUjenkxMvF8V4kqIdJZGRC8ONgsvCt48uSE/jFAizvpNKnAXUxNgRcL/saU6uIfdQMwv
         TUX8Udp6hHeN+x1od+NuY/f+mYpuZiC5MgwG4v01rp+RBe2FXKRQAVXsWBK/c6WID9fu
         NlceFmQBLtfNxx0wRamMdFaVFInDCB6oMr8biJqGjx42/nSjvuARbaZzyMf690KWTwX2
         W5EA==
X-Gm-Message-State: AOJu0Yx5k6r/CsszfekNQgHcVgk4UR5VMT/akBrT5d+y+N/k2sP2lXKo
	GyVjEpe29pbpM4xYnyiatBjRd6UPKegbhl82gHVJjwsUWRI9EUDrYTa9pnXfNuT7+ugzomDXWWe
	4mIiHag==
X-Google-Smtp-Source: AGHT+IGnyEMTRWI7sNtJtp7R9rDDC+Gbb0gxLeam+VvQbZl9PF/2aqJWci9nw+JctbXxlWMfU5L+JyyiNb9f
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:4289:b0:64a:e220:bfb5 with SMTP
 id 00721157ae682-6e21d8373e9mr83647b3.1.1727212833007; Tue, 24 Sep 2024
 14:20:33 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:43 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-2-mmaurer@google.com>
Subject: [PATCH v4 01/16] module: Take const arg in validate_section_offset
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`validate_section_offset` doesn't modify the info passed in. Make this
clear by adjusting the type signature.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 49b9bca9de12..1a2dd52147ba 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1645,7 +1645,7 @@ bool __weak module_exit_section(const char *name)
 	return strstarts(name, ".exit");
 }
 
-static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
+static int validate_section_offset(const struct load_info *info, Elf_Shdr *shdr)
 {
 #if defined(CONFIG_64BIT)
 	unsigned long long secend;
-- 
2.46.1.824.gd892dcdcdd-goog

