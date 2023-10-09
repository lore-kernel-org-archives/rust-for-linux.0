Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573E417D1
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lDZKkevm"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730539E
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 15:43:55 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a213b4d0efso75968667b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 15:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696891434; x=1697496234; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DKAs9FiDWAh3UClUoSgrNgZ5MWCcyLnU7t6CMgdnzXQ=;
        b=lDZKkevmol2pCZr/NOIiqWqTwwEJMZT2szqyAVAo7kJdmOiFQUlIlRmz6vubU2M2+7
         N7VWj+WVL96gYmFpoeAWbjleeySLssS8xLaw7+Oko67rWXWUsgx/+SbX2R4BRUwIdvcC
         OQyJI+H4cE+Ri3MbyyNe4Wk+N9ttV8gSqibEueCpB4DBpWTwb+C15QrBlbH4OSoS2LWf
         xulIcvCFNYF7IfMePbp2WyUcydIZWaRdpYakeysmLIfXMUpg2+J+fEWXdF/zwXtq37bZ
         I4ihwAeeOsS2JRDnH9qM8nEzfScR3P2nfVKgEiEJQhCGk0ooXKsjO3ImDlzHqjQ5H4zX
         B2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696891434; x=1697496234;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKAs9FiDWAh3UClUoSgrNgZ5MWCcyLnU7t6CMgdnzXQ=;
        b=wFtJeS/wl2L0HerUC9LFiAiiqEYRCl2Tn3po90SpCDd/PIbDCYAX8jqlUr6Ymy+Xda
         GVv9LvOzlrkcp/DJU65DBrUPGhIzMjOmcuD+2Q0h2r6LgG8kqM9o6NwlUQ5Pf3BVwXeF
         DPnR09CmrV3dmbvBnHF0YdETfP/yRc2DRqdkez+J1wbLQVUcvVU27G97UrWt9e/8cTd+
         4DWrIn5WuQZefr26dFewYE/DxSQPP+RJvkbyTRlF4prvpaKedju8hP47PDCysZ9SGkz8
         BLahcSDe4S7anNHIZQnLXWbaaqTydEKfOYQj+kbzE1FTr+QY1NDhm0L5vOdJs9dMykFr
         Bj7A==
X-Gm-Message-State: AOJu0YyjUPq4g+rcBvWO0pWLnq7H8KGIp89Op12eyctQY1nle6kPKWtC
	xrXguh7+LsMYEvVQAaC8xyvA+2ger2Sb
X-Google-Smtp-Source: AGHT+IEMrJfWElg8wRCen2hl8qHXtRVcnGRgHiYLheyhGANlw4Y4TpDgh+2N3ec6R+mUm+N0GW1+0lib1b4w
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:aa4d:0:b0:592:83d2:1f86 with SMTP id
 z13-20020a81aa4d000000b0059283d21f86mr290212ywk.4.1696891434703; Mon, 09 Oct
 2023 15:43:54 -0700 (PDT)
Date: Mon,  9 Oct 2023 22:42:54 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231009224347.2076221-1-mmaurer@google.com>
Subject: [PATCH] x86: Enable IBT in Rust if enabled in C
From: Matthew Maurer <mmaurer@google.com>
To: peterz@infradead.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

These flags are not made conditional on compiler support because at the
moment exactly one version of rustc supported, and that one supports
these flags.

Building without these additional flags will manifest as objtool
printing a large number of errors about missing ENDBR and if CFI is
enabled (not currently possible) will result in incorrectly structured
function prefixes.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---

Split out the IBT additions as per
https://lkml.kernel.org/linux-fsdevel/CANiq72kK6ppBE7j=z7uua1cJMKaLoR5U3NUAZXT5MrNEs9ZhfQ@mail.gmail.com/

arch/x86/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 5bfe5caaa444..941f7abf6dbf 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -81,6 +81,7 @@ ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104816
 #
 KBUILD_CFLAGS += $(call cc-option,-fcf-protection=branch -fno-jump-tables)
+KBUILD_RUSTFLAGS += -Zcf-protection=branch -Zno-jump-tables
 else
 KBUILD_CFLAGS += $(call cc-option,-fcf-protection=none)
 endif
-- 
2.42.0.609.gbb76f46606-goog

