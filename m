Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450E165F08
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 21:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979275; cv=none; b=fOwb66McJD06vdfppL1DBfgnR/CJuaX6U1ftVJeYZGVhMtP9zcXTlVoKUeuxXzot2kASiCWCzcb1nZIAEXv9lPzXZQApzv0eerl/fWZT0vJcjTBICwkMwKgH5K7on/pLsSxF9HElJ26f+jhIGPqPJfIVSq17WEtulxoc2Nw/6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979275; c=relaxed/simple;
	bh=iji02Oc/3eVse8/8b0a97tqkHPOd2ny7+/1oh5B8hHY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bu1oZwZinf/YuR3U9I4QuEFxX6riArMkZzucL0KX+OQspRBnRLlbZRbqxEVV95Ubdm99XzQIeswMXm6p3TkQyDtVY2aVSMMx1y/rKVa5NVaZi+VYAcs2FtgzO63xUXYU24xKdvKBEsO5L98Nu21JOH6szuPPpf/c+ofMhEEHb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sMR8GsLr; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sMR8GsLr"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-672bea19c63so21720337b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 14:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979273; x=1723584073; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOl8CtEcN1RVp67UAYoE5SQ2BHxlCocLL/lZKU0oS64=;
        b=sMR8GsLrWGGLnAivD0/ZcacpSVIAT+HyrCJr80Ljsgb+akD+gu0IyhTaRPMVbRCOwQ
         e29Km3ZQI0bm+x05zroBtWzX07TIXLAcGyeDLoQiBYtddkf/TO1KZwjswxtlila8Nyqi
         mZbCjf/GGXUanauQs1mzDSILPh2h5e+XpQV6VyMTe2djpqs5qacmhEuD5JkXhCT2Llc0
         gBga8E4G+3s3M2jZtVWgdJMcNxy95wSE9E37NY+GoSuD1gyh/LtDgtz85emICnvg8d3g
         8TtXaCp5Gi0CLB6K1Y61NlKDXN7borzFDdwip7Tc2ASj+IHzVzaHhCnjXmYl/TEIL0cS
         aHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979273; x=1723584073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOl8CtEcN1RVp67UAYoE5SQ2BHxlCocLL/lZKU0oS64=;
        b=WWjKtUrxza9yJxeuet6iBD+8zJB61l8l17ol8GywRnX5JGl9sOXSYxNh+epkpHhBYr
         TQSm3WiLSWjH7QYIM+nBpbgGCbNx8NG2FcfVU99E2nW7fg3kvaKMRHQ93iNDEBiVuppd
         H8IsWo1TmmD0Zx2JQK/WltpFUB2pF8i6dmkNZu+i9w/ZvE8R+iUKD3Uqx0C9yiFML8yf
         3blM563BHhavuR5ev4A9N1FrwZMJQIQ8/KWVoF/PjLbwCNuuCM+S3DNju/rnw+BKynAt
         zqiqGNU13kP/cqJQvhDNME0jIptiKQRBcsybQQX4jqhdy8tsXQC7lgJ5rCQFHkVWxbEV
         5uTw==
X-Forwarded-Encrypted: i=1; AJvYcCUWXAuCoRe2HgGiVFjpVyqoELvGxuuNbjA+tQFY1WvrCxnnOY3s6A5vpfsZMkFpYuadT6O6VSS+AMKL0HEkEcvdcZOpUzuRWPxlOL+XZCg=
X-Gm-Message-State: AOJu0YwJHG+kQ2U2EYplFp3/eZ+L1RX0B0GVkt5aV6zLZGJRXt38TYJe
	QJXxOdERZLCNBpjOTZU3Wga0WBdM13Svo//OVd2u7Ph1ypurQE3E0Y5sZjEqfVnMs77i6pgDfTk
	VJ8DL/g==
X-Google-Smtp-Source: AGHT+IH68bwpdjlnY26x/2+wcQZQXwD9UHybE1nA22cklT9RgpSzraQUX4QVqW9CAA8bhLmB1AIfRzUuzphh
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:188a:b0:e0c:301a:1d8d with SMTP
 id 3f1490d57ef6-e0c30666c8bmr256479276.4.1722979272769; Tue, 06 Aug 2024
 14:21:12 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:27 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-2-mmaurer@google.com>
Subject: [PATCH v3 01/16] module: Take const arg in validate_section_offset
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

`validate_section_offset` doesn't modify the info passed in. Make this
clear by adjusting the type signature.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d9592195c5bb..141a964b6b13 100644
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
2.46.0.rc2.264.g509ed76dc8-goog

