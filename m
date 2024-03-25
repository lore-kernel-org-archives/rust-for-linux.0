Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22721F60A
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388979; cv=none; b=q+cpzosCMmRS7njx2qGbbUPvWNWP1WgwUiTdLj9ziSyVOZFG6nmwSedpqvBpxxZkO72R7OUsAzb0rPJHxG8qZiLJYzQpmuBOpBVRDKtb8/slrqXsVZB3YME0WEblNlOHiGxfWeHxMrlz/9ij+aIzLVtXnuuG8Y2XHOcbY3NV30U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388979; c=relaxed/simple;
	bh=QkaqBEy+ZCn/Stm1e8UG4/ZIpXSKHQZpx8FxlH+tlNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPekdgzjR+VGst4dPmFzSjwJnbSGVKl9TYF5MJkmQNiJridH4sslfildF39Dy0n6pTs6euE4ENUvHOlX8l7U0Bl3zKnQeBZXW67ExaqEVHziAYeiNivFQ9OUpg5IJ3ZL1uk9tScCWpq+Qky/fqcZN16C3x4AOCBqeMrUGlNWPmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jTz+odrO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jTz+odrO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5JpKnaGqEC+8QydBQh1MC+zGWiofGXoQh/4syQO3TA=;
	b=jTz+odrO0NHv/iHVBaMB+y59ci2att2Sb2rNbyIaSCc0DhyxYI5LSBwrXt7Tsuopn547HI
	ErKw7kx0r17gt9l7s54A9dMr/FmccOFPdQ8bhuIlSUHWVEJqHWZKnVwfFX91JsTvH7wbVB
	pHC1iMqzzdeAGgMoVJ69eioaXfGM91o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-XYAIsysKP-CSrQm9ZQy4UA-1; Mon, 25 Mar 2024 13:49:35 -0400
X-MC-Unique: XYAIsysKP-CSrQm9ZQy4UA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4148c035ab6so2770975e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388974; x=1711993774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5JpKnaGqEC+8QydBQh1MC+zGWiofGXoQh/4syQO3TA=;
        b=Cnf1ScEpuP1K4WbXZVv5lmu71s3RaTJpFlv2ugt25Yfms9AG9hGEeEOqjzt5InQsKQ
         2lXpvpkjWplLrDiXf2pKzolZlx+SLVW8WZ8I8zwrONPon97iB2OfQOkvsYBHOHRt8feq
         P8mC7Ju2baj9ieo4U2nFMLKXDiJCuI9XwNLQEBBkGz5XXHf7cV74g4sWE27G+yz2fQsC
         5r+CZ3BMqf3gb394+A4dJ4bIJpROL2YBfhmCvzbWkNT1RBKEHDmosjfiJeCZSBoV6E2R
         A/OmpetL6Vk0WT7CsuwvCmS7YP6EpZaqg26ZkMA8oS83nU4li22CLJpwQzUnnpkYMT0O
         n+qg==
X-Gm-Message-State: AOJu0YxMPWrWm3YOr+PzSKBa2WQ9Mr4EaAC/SgRAwOezODYT+MtKEkjH
	G3mPIBcSGMIzIQL6A4xyqVQ/pPRUVi9aQ42oUG9JTmDd/1X9H0VbbFbnYhxSNX2kOJManffCjdj
	jGWGvw4ExUxSRtLbqkVnKo562PqR91u1WlTWCAIlicvAtxd+3h8K3VuEPQGcuYycM
X-Received: by 2002:a05:600c:3c90:b0:414:216:2cd1 with SMTP id bg16-20020a05600c3c9000b0041402162cd1mr5084354wmb.5.1711388974574;
        Mon, 25 Mar 2024 10:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxc0oN3IbCSIf+RcKTXZlk2K9IKIt9SBXKjMgh4x8rVqxcFZYzASRy2UNCl7L/Pl3Eq1RWqA==
X-Received: by 2002:a05:600c:3c90:b0:414:216:2cd1 with SMTP id bg16-20020a05600c3c9000b0041402162cd1mr5084317wmb.5.1711388974242;
        Mon, 25 Mar 2024 10:49:34 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id k30-20020a05600c1c9e00b0041469869d11sm9084216wms.47.2024.03.25.10.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:49:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com
Cc: rust-for-linux@vger.kernel.org,
	x86@kernel.org,
	lyude@redhat.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	airlied@redhat.com,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 1/8] arch: x86: tools: increase symbol name size
Date: Mon, 25 Mar 2024 18:49:05 +0100
Message-ID: <20240325174924.95899-2-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325174924.95899-1-dakr@redhat.com>
References: <20240325174924.95899-1-dakr@redhat.com>
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

Increase the symbol name size as the Rust compiler seems to generate
symbol names exceeding the previous buffer size of 256.

arch/x86/tools/insn_decoder_test: error: malformed line 2486512:
77620
make[2]: *** [arch/x86/tools/Makefile:26: posttest] Error 3

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 arch/x86/tools/insn_decoder_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
index 472540aeabc2..18601b3c5037 100644
--- a/arch/x86/tools/insn_decoder_test.c
+++ b/arch/x86/tools/insn_decoder_test.c
@@ -106,7 +106,7 @@ static void parse_args(int argc, char **argv)
 	}
 }
 
-#define BUFSIZE 256
+#define BUFSIZE 1024
 
 int main(int argc, char **argv)
 {
-- 
2.44.0

