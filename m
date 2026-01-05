Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44728DF2D
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767616966; cv=none; b=uTl+XW0AUxlby0Xq4hLtVA9NuWRZ+psMpuoYHDpHTTYzpT4nriTOgHE5y7Hl0WJfPS8AAPfRCdwOV01bI6WyQSz2ttnR6FUjkIVrnyNNTJJVPUxBPnuf/Xusaxpd40xdEbp89CAqwVnR4FheI7UtH/DUC9FmEpyJC/uZvh8o1Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767616966; c=relaxed/simple;
	bh=XcNFUIoX+BqwjK90/TBrzmCV++jGxUJlOagYgMK4Olk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G/Xp3lDAENXF/iGDOlAVoNT8djyx7XWktj555wRdv/zYiCuxOcQnQhQoCbMZuLs3AIIsAWOHkkEvMswkHJZagw680G6ljOFJIN0dwjS8FFep0+a57E6kYMYBOVEI5FKtvcws9Rae9GWdk2H6Ed8XsUuGdDLgS+T2795lzrxr/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJUfF0PP; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJUfF0PP"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64d01707c32so16803980a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 04:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767616962; x=1768221762; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUWksnLTXbLDZ2fDIZTeWfv3osTylhjQuxBEZDIjrEs=;
        b=ZJUfF0PPcY5F02yFLNSeslFVdoDcNSAoQpt4k+5nbj3bP1PDVxZ2F1sJjBpwOwmjdj
         FqTSOcMJb2Di9LnnyncEPiRuCtqPoKKOIjsQcIfG0uLDmnvNcpd2HlzYZaj+yFDD8A1o
         Ir1Bzh/PL5L+aiVkurmMwDJwZRJdjh86e5qUTiQZNWzHUrRJzmyaZFmBRbcNJwBfD4bS
         dzAlPBdYRWLboz1BcbSTY9BhJKf94+3R46WMsNHRyV1IKi8PEWfuURYCLi+liYZDovjQ
         3YOrM5FB8vuZitgGXkXsXW86cwpCLeR9tB3IW/ztDwWNnhJrvQLmsLte4vv4ER+IEs25
         J8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616962; x=1768221762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUWksnLTXbLDZ2fDIZTeWfv3osTylhjQuxBEZDIjrEs=;
        b=rnLUkqNj4RVDBxbethh/RMNs261/trQSo2zj1F03AS9bJYzxzjQp5I1AnHHe0qARIj
         5MoSLBSIW/h3GhkY78V0kAdKpgaw1zDSwRD53ieRfxBM426Jr/QBuyb8G1Xm0OMW3R3u
         XgcXnCV0GQPiWOkSzAL+gtmlk8sbMRJ+NUgf661SprCnWRab5IJbh7fL8zm2gVGOIc7w
         wWSDzjKm38N2gDSpbL0KvN4X0yGcNNXIRhqqX6bNALTvyi7GilI+i68Wg1NmGoRLBjmQ
         JvHWXJiUInp317JxjHHLH1tJoWCngYzGozhk3v30wb7xOhejufyA5Ekf0WcdiPLwUBfw
         rkPg==
X-Gm-Message-State: AOJu0Yzo08KFwN1GlA/lakX8RYu2uhfdSdYrOtSPw4FqYob2Qu172hi8
	1tyRCkMYWUQiKAK6IBRA7kxPOysGXid26cgHld4EI6qrN5byM2p5bMlPeNPue2ZStjsIL09kcGu
	Av+/wQgzVTETkObb30+tL6PXJM3hsT7zbzR8KbhtYy+ieAD98Q4tvXWsC7R5Z0D9nzW81KYT+0B
	SKzYkP8khnfQImwQgJCWqSIUT10FcqUDuUWu3WyGC4FsDVcBWqIvINa+WZ6BEdZZo=
X-Google-Smtp-Source: AGHT+IHsQSZkyWbrsS7axkcDRmr4my3BpjCjwGS72Gs31+nR91tNTIs01K6MUzm+Y8+Skawi5hFWbV6Twcn2GNc=
X-Received: from ejdcw16.prod.google.com ([2002:a17:907:1610:b0:b7a:37d:5e3d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:2081:b0:b80:411f:aa50 with SMTP id a640c23a62f3a-b80411faa6emr3718537966b.48.1767616962580;
 Mon, 05 Jan 2026 04:42:42 -0800 (PST)
Date: Mon, 05 Jan 2026 12:42:16 +0000
In-Reply-To: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XcNFUIoX+BqwjK90/TBrzmCV++jGxUJlOagYgMK4Olk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpW7G6wtceghCVY1quXvH5J59BI6eZ25mXMwjBo
 MZ5/r6BsfOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVuxugAKCRAEWL7uWMY5
 Rrp2D/45sF+QKFFmwTDP0/VS5UOQYhYCWDipftV75/jqe43KuXcePJ48WCx1BSWUdjxZa5QfYs4
 R00j6JGrKlNm3BXekjm4p/ZlvnJ/Z5s9spq8/mI/07l7+SBGOsAkFYP/YKtfHKXMh4A0xCyK058
 PfAQO96PKQwTOioOukE1PJLCOExfSG/idGA0PwC84jQ08Pv2xlWyojzdMYac+AkNF/Cu4r216wl
 JN5NiSE5TSBG3SYnQNB58r9WidUn6grI6HCMc5B5j7UH4e24emLQNHTNDWK9U8UkF8jfZMNQL7w
 zpc9tOD3NsTrU97kDmapubtlDTV6FE9dsWw+tMR69HdyTsvChtSwVIEzNnBZL6Rr9xXrm5oB5dd
 tNNuBelPSBM9mSmjiM47UmUwTPdNpfOXs0ktxPtR0KH0qn7QHZ1J8HV1kHCIov7SlRfnSOYDn27
 GqeDhvsQfedfYU1TVSRHOoNc/H+mR+/ETLiBBllShBYx7UEnB9ppIu8l6HuuZLaM7YfF1TLxmhb
 55Yxljj+fYk3QtCuBDCUWFH/o/nV9B1X7cwBv5CU9HVeiRmLHC9xw0hXK2M/L+7r8yG3pUB9oC9
 4zGuCAeY4R7eizNIim/Sj3IgHZg48OaVH0SnZ2KwKO9BlNe86IoHaHs8Ups1UVXAE4X5t18r2td +2g9VB5Tal7+4XA==
X-Mailer: b4 0.14.2
Message-ID: <20260105-define-rust-helper-v2-3-51da5f454a67@google.com>
Subject: [PATCH v2 03/27] rust: bug: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="utf-8"

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
---
 rust/helpers/bug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
index a62c96f507d1c16cacc462199e390857b8afec28..b51e607725785f540dc46156630ca848dd0de491 100644
--- a/rust/helpers/bug.c
+++ b/rust/helpers/bug.c
@@ -2,12 +2,12 @@
 
 #include <linux/bug.h>
 
-__noreturn void rust_helper_BUG(void)
+__rust_helper __noreturn void rust_helper_BUG(void)
 {
 	BUG();
 }
 
-bool rust_helper_WARN_ON(bool cond)
+__rust_helper bool rust_helper_WARN_ON(bool cond)
 {
 	return WARN_ON(cond);
 }

-- 
2.52.0.351.gbe84eed79e-goog

