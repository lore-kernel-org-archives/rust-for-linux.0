Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA31C290
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 17:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388878; cv=none; b=EHQDAjEJVZs2jFWnFsRAgoajJaNcbNQ8UZ6eTSF5tkkMOfGKgKJo+AX8s1hAcSJh9jnQJ7/zcEUmN2cSf3wcPE7g+iri8SSaKtieQJn7scDf1oItj7ou9Vp7FTLWVghPsX4d0rH70D3ArmPjk9ZRQLKeDukpHTgVflG1ejw55yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388878; c=relaxed/simple;
	bh=QkaqBEy+ZCn/Stm1e8UG4/ZIpXSKHQZpx8FxlH+tlNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rj/sqVG36W9Z46uRGnFd0ctm9bcmfQ0p6ja/v5TLKI4ZoPBRD5t1bCaOKytPtv9d6uenNgFUuBg8ST7iRLjtxQeLT1AUE0ZcHD0W4j0csRCgufzaVLFrrLSrmEFLcMUSpxxCGfUdsUgJFFL7MA9Mojdl8RQ3NwDycSeadWIAa6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFGMMrT2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFGMMrT2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711388876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G5JpKnaGqEC+8QydBQh1MC+zGWiofGXoQh/4syQO3TA=;
	b=hFGMMrT2l8CjHSgWXOCjVGLLrsgitj3x5E15hFKc6sd7me9XyZGwcpB4dGZzLe1E5FPAw6
	+LLLJvFftzEzBq6BHdzZTaJQMhvnydV21AgQY72bpiqSxBzzygmDxKvAQg73ma4v+I3mJ6
	sgRwWeFtkrK6QG2h5Ny4zekFaQ/Ni5Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-lHZlFs6iPzago1qQ-hukvQ-1; Mon, 25 Mar 2024 13:47:52 -0400
X-MC-Unique: lHZlFs6iPzago1qQ-hukvQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4147e733d20so11814925e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 10:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388871; x=1711993671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5JpKnaGqEC+8QydBQh1MC+zGWiofGXoQh/4syQO3TA=;
        b=P0/kVt0z+qV2OQZcPYWD+hJuRXXsZrvLPNMrROJC0PdVUNQfgzUuIyJXTf++6WOaGd
         NmD+wa9SHS4ySzmRozDwnwHxCRcmpSxBEpKirNZt9TTNp/xg+/x1QYzJN05ANgybYWjM
         cUXvdzDxqRs5935PBCdgoSEryK8KC7PFThM5TRP9cICeAKI3pH+k6c7+fJpUdoJOMauw
         hlcNZhtLoqIPCWvvE3s8V/+Ip6euhbdrrdabXY7cI4+V4LsU3Fr53PD3UjyDwbrGOUbH
         9wMapccCWN0KaChkMh1TttNyvDI552/eXHS64IEMSZHcOkSqCFEJ1dDDIMgXD9XBRPDt
         erDA==
X-Gm-Message-State: AOJu0YzB/kb+b5ywjB1eJizxnO8qXzIFBYmYsLrdfoKGYyyfEP9YmJJ/
	F/CXsmjC/TSDNDYU2ESwRzCDOja9quXFMQ0ygleyj9pOhd6SX/Upuq2mh4X1yHIWFkfjonxpAJ/
	U0LfjA4+hGfwAKctW9TqmpzUEhG6isKAg0IJyjNz/Xk4Lh464PdVv/SnC3q+sTAxS
X-Received: by 2002:a05:600c:2807:b0:413:38ee:69e7 with SMTP id m7-20020a05600c280700b0041338ee69e7mr5292519wmb.36.1711388871516;
        Mon, 25 Mar 2024 10:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5vWnIhTRe0oKqtlYhfwYEhtdZ3dok4uC4wvkcwLyRDRUQmfXBEPH6ks1ZweENgUMgGhu4MA==
X-Received: by 2002:a05:600c:2807:b0:413:38ee:69e7 with SMTP id m7-20020a05600c280700b0041338ee69e7mr5292510wmb.36.1711388871217;
        Mon, 25 Mar 2024 10:47:51 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c1d8c00b004148b8fb25fsm2000771wms.22.2024.03.25.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:47:50 -0700 (PDT)
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
Subject: [PATCH v7 1/8] arch: x86: tools: increase symbol name size
Date: Mon, 25 Mar 2024 18:47:17 +0100
Message-ID: <20240325174743.95542-2-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325174743.95542-1-dakr@redhat.com>
References: <20240325174743.95542-1-dakr@redhat.com>
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

