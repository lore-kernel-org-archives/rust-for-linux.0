Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5913D70
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jul 2023 06:32:13 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA482D64
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 23:31:48 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5704995f964so5083187b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jul 2023 23:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689834620; x=1690439420;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJUwQzbRztLLTSTi35hLHWvFJlOvZKlmG5YMI9kdOKM=;
        b=exzMRciz6q57iZ3LnCISvUalCcqN+3UGW0dNiMEU6Ux+IUuc78gOhlVYUkJBW2O0V5
         ej5vDC2rgGJhAdjVu26+fOkYdw5ptSu2dD6vQOgndW5uTqXTMg+MdWzZgt5jcDSvP4zA
         FSMCRNvOtH9sE9JDwS+96mV+vQyPUcAZs2SnNkOFZNqalPWZ6NwHXxQW/jt03bBjRL88
         SZL1IEnTHd9I+3F0BkHkh60a04LAf6ZKKJdXG3/qtlAWJipsHM7nNq/Z7GA+dSEzree9
         PzrQ16O/PhOSKgEvbVEghQg84fQXQN1cHCZW6PQjs4Omr5MUE3noZpyRCv82OvBbctsd
         52tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689834620; x=1690439420;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XJUwQzbRztLLTSTi35hLHWvFJlOvZKlmG5YMI9kdOKM=;
        b=MWGxiWcsr45IV8PjeduLe588A6iXfg/125KVR9a5IuhdX679hnHHsxu5Bk9V18naj2
         MA5th6fbn2Xz89ltR9W1svVTjxe98Zk1KMcTHxzAd4IqL44H7TjHCMDIOBfOiAq5GecK
         D4qKLkDSFiXUoaKLL+DRLoKgo/2t3gHDaXu/CEsP8BJdB/qMz04uOv/B63SZQu9RUgn+
         HeOvALT3w1LJkMWAWMZjCj2JjcLaTn55+11ggqPYvDZFwR0LLe2WIKuIy/xdwp5H6SCE
         WiaPMA1nuDAfYmzYrl1RzldiZOPKcxU9miNMXLjncMvd3KtDyoJi7ai2sw7QeYsv/6HP
         tDFw==
X-Gm-Message-State: ABy/qLa7ytopHi6BuRqApF62yiUNrEHKeFd7oYdKygGTrxWxrB2FRXpN
	LC1ccGNUqyyFabUkkVmRh9NEcSn7pDJjug==
X-Google-Smtp-Source: APBJJlE9Or/WvU1LyYLL5e7PUIkswIIqACTJZXRrrefvubcmzh9/DrI2y+dUq4RV8PFzuza7opwPGWPwyrD8Ww==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:4423:0:b0:57a:118a:f31 with SMTP id
 r35-20020a814423000000b0057a118a0f31mr56270ywa.7.1689834619846; Wed, 19 Jul
 2023 23:30:19 -0700 (PDT)
Date: Thu, 20 Jul 2023 14:29:37 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230720062939.2411889-1-davidgow@google.com>
Subject: [PATCH] rust: doctests: Use tabs for indentation in generated C code
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

While Rust uses 4 spaces for indentation, we should use tabs in the
generated C code. This does result in some scary-looking tab characters
in a .rs file, but they're in a string literal, so shouldn't make
anything complain too much.

Fixes: a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
Signed-off-by: David Gow <davidgow@google.com>
---
 scripts/rustdoc_test_gen.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/rustdoc_test_gen.rs b/scripts/rustdoc_test_gen.rs
index 5ebd42ae4a3f..a625cf3517c0 100644
--- a/scripts/rustdoc_test_gen.rs
+++ b/scripts/rustdoc_test_gen.rs
@@ -242,13 +242,13 @@ macro_rules! assert_eq {{
 {c_test_declarations}
 
 static struct kunit_case test_cases[] = {{
-    {c_test_cases}
-    {{ }}
+	{c_test_cases}
+	{{ }}
 }};
 
 static struct kunit_suite test_suite = {{
-    .name = "rust_doctests_kernel",
-    .test_cases = test_cases,
+	.name = "rust_doctests_kernel",
+	.test_cases = test_cases,
 }};
 
 kunit_test_suite(test_suite);
-- 
2.41.0.255.g8b1d071c50-goog

