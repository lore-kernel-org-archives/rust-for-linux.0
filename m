Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77C4611E
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Sep 2024 00:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726531874; cv=none; b=fd/0nRrK7UNu5x1KHqmgx+hOEYycTM5bJD/AcWxmrVWVN0FLFO9VsCT72+hWnTjH6TTyhcTY/PQ/1m3wlgJVGEvmBsghw34BbUTew3qz51U1WwVUz1E1T7zb6nLsWe7XwxV2oToB86Neh75iwYu6McrDO9JHzYA7WJjlhEzLKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726531874; c=relaxed/simple;
	bh=W56FUMR9QIT0LTtxeEn0yFfK/pN99UsZE7+uyX1M+rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A6nvwZy1stqf59978gLJVQbzYvIOrnVTgomd633BHTAiOjtt/sDUTIT9PCiCenaIrdvZXvPWW15hwCbm7r4shLI6/g7ERh5znsq0JsUN23VPro8Htz/LaSHwCivALTOCGIaEQ8lk/QqH1+OqOGcUpiFLmo3kj3I17gHSzxUYK+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bAEBeoMe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bAEBeoMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726531871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3XRknCuZ+rddMbA9raqM8xFOQmhedysMspZNVnmtig=;
	b=bAEBeoMeSu1d5TCIyvN4CuqaCzDv5/SPZbMvnwW5Ho9ybG5r/0wXWBQ4uk+E+WX6oX+K9H
	TZdbb0EnRW3OMJDwz6IrVOg9sufImzY1zs+8UMoot1sMKOyE6/b86L5lapy4PwtQnSLh1S
	9qFiy6rx2oCl0OYgMG36lLn+JQ06xuo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-QJVO3klcOhesF-QoPvaJwA-1; Mon, 16 Sep 2024 20:11:10 -0400
X-MC-Unique: QJVO3klcOhesF-QoPvaJwA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6c3540067b1so97256106d6.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 17:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726531869; x=1727136669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3XRknCuZ+rddMbA9raqM8xFOQmhedysMspZNVnmtig=;
        b=I5Rq4sTT92LBgiT6FjTuunVwJ61HSnlijURPwP0CELewbALP7ff/Y8fIFhyXvczqMb
         5aiusE8REMPZLzM6o/c0qiefQjyFJASdEpZzjT1e8mu/a5R06Vk7RnN/5bGVrdbHAkf0
         BcxU9rUl+fOvh/RPcZbh+1RQHu5+V27FIU2DRnZ0tJ2U6xC05qkVmHJ3mexVem7Vuly8
         My9Il94TTxJqrpTQD9IMwBrJ3cXG+dP/ND3ECLcj1j6HmFNxd1Ur4+XmU7NjYN60NvMG
         0X3A+DxfVEtTTt2bqhRLg+HZmnJBi1jIFk+zPjCp45eQ8ibu0R4XMN3IO4kLsbpDW5vP
         vywg==
X-Gm-Message-State: AOJu0Yw8o5TtXPudfuj84WPAM5ePW4ccbLd9iISRaxP3Xsh4LGFZks8b
	0ECBDOTXp8WLSv66PT7+M+k2+UOoBIAo15b5c8G6LisJsrQV/5hgQg/6VlkkvmDPzd5Lo+VYT+C
	cm3juWMpqmgShCwgpBOd5f1JAK0tgmFZPrhmv3Sg9Dz8j0jfeetQtViKGTK/vp7sn
X-Received: by 2002:a05:6214:311a:b0:6c3:5496:3e06 with SMTP id 6a1803df08f44-6c57350b986mr276808186d6.10.1726531868910;
        Mon, 16 Sep 2024 17:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHnGglfemeo+Af3oezjiRWKnnZJZ0HiOz3D898c3WHVJObvGXlST1AzNl9ohW/gu5HlG6/gw==
X-Received: by 2002:a05:6214:311a:b0:6c3:5496:3e06 with SMTP id 6a1803df08f44-6c57350b986mr276807636d6.10.1726531868420;
        Mon, 16 Sep 2024 17:11:08 -0700 (PDT)
Received: from towerofpower.montleon.net (syn-066-026-073-226.res.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c62633bsm29221956d6.25.2024.09.16.17.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 17:11:07 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Jason Montleon <jmontleo@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] RISC-V: Fix building rust when using GCC toolchain
Date: Mon, 16 Sep 2024 20:08:48 -0400
Message-ID: <20240917000848.720765-2-jmontleo@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240917000848.720765-1-jmontleo@redhat.com>
References: <20240917000848.720765-1-jmontleo@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Clang does not support '-mno-riscv-attribute' resulting in the error
error: unknown argument: '-mno-riscv-attribute'

Not setting BINDGEN_TARGET_riscv results in the in the error
error: unsupported argument 'medany' to option '-mcmodel=' for target \
'unknown'
error: unknown target triple 'unknown'

Signed-off-by: Jason Montleon <jmontleo@redhat.com>
Cc: stable@vger.kernel.org
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index f168d2c98a15..73eceaaae61e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -228,11 +228,12 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
-	--param=% --param asan-%
+	--param=% --param asan-% -mno-riscv-attribute
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
 # All warnings are inhibited since GCC builds are very experimental,

base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8
-- 
2.46.0

