Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB28A18626
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 20:21:24 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A04194
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 13:21:20 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a2318df875so11095257b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 13:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695932480; x=1696537280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ipDavCedwq6Qwq/TiHUC4NLLZIDW2X0yZpZjMZHB/g=;
        b=bIJtpw0WOpNxI5QBoySsoNrGmVdtE1KRof6kEg7U/9DYTI+QLAmjy7vEOxgC19VBvt
         FPREqHq8ISj6XoyqbuDIqhAolj4Ra0UUNrQMB4q84zSJ9uTEoPh0mZ7TAX9vuIxhElCq
         JtYhYSraHNdwTCQUTO/mbsH06+fC+2jN2RMUYy826EFwYIvTW27chjQlBGBMP0iGgKRx
         e65I5139AhFJrCIeOMei6VRz6dZOwUxHOMYiaXP7cXvFsAchTp6aqQgHlFdrchNrq74y
         y6XsDlE0wxkT2we+llnvGj1uwzoGC+d1/Bb75alcDGM1SN/DANf04S2x8/qjRwnwKm52
         2rVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695932480; x=1696537280;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ipDavCedwq6Qwq/TiHUC4NLLZIDW2X0yZpZjMZHB/g=;
        b=W404bkPl0H+pddT5AO5hd0uMU+TDNvE0q/a/SX+vVuL3R2N4YoP/hjfYwhUBPnpChK
         r6+KLI/ZXR7cBi35Ign+4P/yZw//EvuBdeyG3pnEG9uTarS2DWUFZsOkfarsIxzZip9i
         CqMW/CvSwR+ax+O6BhkhpDvAKCcezA5CRubtkvSwK7GQcEzKvvqr6jstSXIYoLkV2K3x
         V8pDuNmXlvmivkyRFs7lzPT6U6WREekyQBVu10SBEQpqOIswYxjvb9silqx172BpzpCj
         B3aTv37w+8kr53l2RvrOxWeGp3zGjkYmmjQ1EJPoUEaNBl14VjP+kANr52qRFNjBMPij
         CiuA==
X-Gm-Message-State: AOJu0Yxi989cnw06jUb2RRy1Sdt9MVYrmmrln+FKjewoX88iDDAQEfO5
	cEojrp2qjcL23wM7q5HooPS0zdTu7xYZ
X-Google-Smtp-Source: AGHT+IFYtiYx15xYObmoTlgOVU2/XOffBiyVUWQr+LcserfmkkXC4p7++a40Ha6OwjAOzwL4EZkCBw+ZxCsf
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:181c:b0:d82:9342:8627 with SMTP
 id cf28-20020a056902181c00b00d8293428627mr34637ybb.6.1695932480072; Thu, 28
 Sep 2023 13:21:20 -0700 (PDT)
Date: Thu, 28 Sep 2023 20:21:16 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928202116.2298150-1-mmaurer@google.com>
Subject: [PATCH] rust: Use awk instead of recent xargs
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

`awk` is already required by the kernel build, and the `xargs` feature
used in current Rust detection is not present in all `xargs` (notably,
toybox based xargs, used in the Android kernel build).

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..0efc5b5cd611 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -365,8 +365,7 @@ quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
 	$(NM) -p --defined-only $< \
 		| grep -E ' (T|R|D) ' | cut -d ' ' -f 3 \
-		| xargs -Isymbol \
-		echo 'EXPORT_SYMBOL_RUST_GPL(symbol);' > $@
+		| awk 'NF {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$0}' > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
-- 
2.42.0.582.g8ccd20d70d-goog

