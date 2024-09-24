Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D91AF4E4
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212878; cv=none; b=Fru06QnMNFyd0Ej3jAP7YCIhvkNIo+6hghv5FFjlCP01EKKQGm1xmgEvvZstDpXQL6XeSvgdVJFJ7+E7LFOPV3Fed0vk/DeCeeltKUp6D5jqhB/uOma46pKVHkPq6LHcSrcrQjGErgoXZTDWtNZozf1G0E32jZj396hWoZxppz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212878; c=relaxed/simple;
	bh=HByXTJfGaacs4MV7ivXCvJq3lGnRepYcPD/jPTnE9OU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rRBSpGIwZxKRNEb/ZxmJtFei77cjdpptjFz5WzJ9WlWdpkIcuGyhtG+vxPxKSC829R+vYp4PYBfa78LOlJemfSzGk+1QrMSHhpG6LTVJz/eCCril2Uz20VMuc2UCci+pi62hpMSCAhr/jZ//a9+yF1wgwnudGNB2RcVlwqvRPNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJIRtx4o; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJIRtx4o"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e1dc0585fbfso8562227276.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212876; x=1727817676; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=oJIRtx4os6rPSBwICFzoC3Fj5od1KG+aCFhFpETl2njLS+z+lTeZnQCiAUKCoJcSdE
         NjIKxXN6us74Axp9w0kkWOZ2g9gUHOcW7Oxqujp60Nveu9d4fk+uv22FRwrBc9VvKPts
         JFptWKRx4fWE0dxbAuYF8JFb+fStTDnV6O02TZKjVZssinMQdLAD5ThWDyiWUG4bGJ9S
         FJfZ0NwMr0XaXGisHbvk7LKa7U5aIZirmACT7qJHMEEjz6pBNRiJs4I48oMLZx7g0Y+G
         cMNXvJMD9ez2OePDWtBDO5A53N9qJm2G9KliZSVxJjAYkCdKMoZkZbJtrCBGpuAsx1G9
         v5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212876; x=1727817676;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RglsluUoLriSL7HbUF8axxP+liCt7+SgicjK27E/sOo=;
        b=GX9Zdrsi92nxjSfyFww4XCrpvNgG53XggBboHEU0/Rs3oilFlLeK/hQyNCBEZeNcnG
         cKJ1mWds/cX7EmiLnkyX1XlQ9XPOPSz4D+P3ysGzU72eRScGAgYlP2EqohVIi3OK/4S8
         NuG60bETYtmQGIBaCU7bCG/2Jux+2sSBPVsjXE0FGmDHXA7hIejPUahe38dkRSD67GP9
         nQw/i1NWsWygcsQS3csn8QRxDhQQ9n9GVwjEY7g0uvjwvxnZDSgidMcnk61XeW/dpM6M
         o2Z9yKKwdF4EURak/wQJ3qx3DE7SyoE3YxXfYU92aVf4+ADM7SRBHOgTFojAegvZrsZF
         jgOQ==
X-Gm-Message-State: AOJu0YxCZSPNGNZTLqU4gG8ltmvCjbHq2TRNNfrXc0xwgAKHyX/8qbDX
	0RgXh21tki6oWYSTgl1K+ddWesA++V7HfrsCedGxAZEYr3K8Y8SyU2WusVFBD+cVckm5cE9Dfmp
	mX+nRdA==
X-Google-Smtp-Source: AGHT+IFFP5DGiuK9d2HIotMaqmgWna4m+vnyCwqT1jRKadMrQxmzwDlp32Uot3cmdJtoti5KKpM/kNWsOgbg
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e24d7352858mr4339276.1.1727212875760; Tue, 24 Sep 2024
 14:21:15 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:57 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-16-mmaurer@google.com>
Subject: [PATCH v4 15/16] modpost: Produce extended modversion information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Generate both the existing modversions format and the new extended one
when running modpost.

We no longer generate an error on long symbols in modpost, as they can
now be appropriately encoded in the extended section. These symbols will
be skipped in the previous encoding.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/mod/modpost.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..f8b7b793d2a2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1840,15 +1840,48 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			/* this symbol will only be in the extended info */
+			continue;
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
 	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const s32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t%#8x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.46.1.824.gd892dcdcdd-goog

