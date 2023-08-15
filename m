Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428C1857
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 06:53:58 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB0AE72
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Aug 2023 23:53:56 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B4ACD3FA9C
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Aug 2023 06:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1692082434;
	bh=RB9ghWRFzrC2S/go43Pr90Xm2atl6VsbU7few10mp7c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=pRKGziI3BXeqc6LXVXyXw7DflbYrs5OyS7hZXSZNAahzjDQzl6rfonTDf8cYjtVWv
	 gsBFi2RhXfatlmDBOy9005q14kOChgH9Y9LWrqwmWxqhm/uBOH1hghqcS2PA45HHGt
	 dJwkp81Tbsq9ig4cnZWPhc9Qdr/+wavJkeS3q0PBvJx07rkDIncNlM+sBerznmkWrn
	 yPSDjXcp4WSQGPKKxxm7HRx/0zLC+nOnDJGlU+xqBC/yQOf5V3IlhrnCQB0nPQftzk
	 YCLxyXEA3CKZV2gSy38v0THWxUPRY1kDz+PizX6ALsaJnrEBWqJb/CDfZFdowtNnE2
	 7uy5XYahnuVHQ==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51a5296eb8eso3392890a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Aug 2023 23:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692082434; x=1692687234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB9ghWRFzrC2S/go43Pr90Xm2atl6VsbU7few10mp7c=;
        b=kL8DQ4R9myTSH9YIwRciYX5nhKhfyY61Mi/9ZMbxrMCfQqMxCO1lju1svWNR/hk5SI
         COQ2R/Z/B37KHqpQGXp33uD8MiFRJ3/ya1wyCnvQ+lC3ObXZ8ibQtPrcMI42Hhe7vGNH
         iUNPMuF+Ay8acZXIgvVBPCuh5e/d7J5riCHor587oWOUv3r+nDs1kQoe8zLZpfjQNLkD
         yuwrNAxgNGUri63+ppRg207OGVIAX1J5sKiiJ8rJInXpB34BVNefOF6SNuaa2xd2dcvq
         ngIsUZ/VFRu5Cj6hLMs3H6n3InHtLwpbaTTZC9TKEGIVLRVlV+b/2AeKk6KSv8juz9fU
         e6pg==
X-Gm-Message-State: AOJu0YzjEt+IZwr+2nGzdXylz/zoLgbNrkJkP0uUls89n1nErbXj0RiA
	jEW8MIU5K6In/qsvjYV5lw9piFefdbMjUOYoTJwZgt8TD4o6PDg6nkhBSWDejt7uNdfpGcRzRrp
	VDEtHTlwh7hJOlgtI/6Ll4Om8c3QwQw6WQUpDMeJMID+6
X-Received: by 2002:aa7:d50e:0:b0:523:d363:1627 with SMTP id y14-20020aa7d50e000000b00523d3631627mr8036454edq.33.1692082434190;
        Mon, 14 Aug 2023 23:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG28gpy4hdT1nvVWM72ZLlZkYrhVpysNu5tg6V2wH0wB/ok8CuiJHKGjqtM9571bluVibImkg==
X-Received: by 2002:aa7:d50e:0:b0:523:d363:1627 with SMTP id y14-20020aa7d50e000000b00523d3631627mr8036436edq.33.1692082433774;
        Mon, 14 Aug 2023 23:53:53 -0700 (PDT)
Received: from localhost.localdomain (host-79-33-195-131.retail.telecomitalia.it. [79.33.195.131])
        by smtp.gmail.com with ESMTPSA id n5-20020aa7c785000000b0052338f5b2a4sm6544040eds.86.2023.08.14.23.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 23:53:53 -0700 (PDT)
From: Andrea Righi <andrea.righi@canonical.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: fix bindgen build error with fstrict-flex-arrays
Date: Tue, 15 Aug 2023 08:53:46 +0200
Message-Id: <20230815065346.131387-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3") enabled
'-fstrict-flex-arrays=3' globally, but bindgen does not recognized this
compiler option, triggering the following build error:

 error: unknown argument: '-fstrict-flex-arrays=3', err: true

Add '-fstrict-flex-arrays' to the list of cflags that should be ignored
by bindgen.

Fixes: df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3")
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/Makefile b/rust/Makefile
index 4124bfa01798..ae2f5421da25 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -258,6 +258,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-reorder-blocks -fno-allow-store-data-races -fasan-shadow-offset=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
+	-fstrict-flex-arrays=% \
 	--param=% --param asan-%
 
 # Derived from `scripts/Makefile.clang`.
-- 
2.40.1

