Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1FEC6FA8E
	for <rust-for-linux@archiver.kernel.org>; Thu,  2 Mar 2023 13:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjCBNVb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 2 Mar 2023 08:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjCBNVb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 2 Mar 2023 08:21:31 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BB23D902
        for <rust-for-linux@vger.kernel.org>; Thu,  2 Mar 2023 05:21:29 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1756967wmb.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Mar 2023 05:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677763287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6VBMl47g0qMtsIckfTBUTJxMHkVrqofv1yXRdGADD4=;
        b=OhS1BX8OujyHkvzdiYoyhM7cP5+5chi+/lMvFhL2G976ltJvO7Bns8NHyZgJtqZ+7A
         HguGRhlZ+5sDkbXZ+bDJb6+mFxkx1Edh7guI2EjpXEdOnBjDcAMZWG74C3TQF6Wid2di
         f/TI/z96doSOAZHqDBHDOUZSGnRAPguawrmhg8GwaNplDkkzPuGJvZNGwEMFG8fFKlKx
         Jp14HBT0Zifa4pjESdV14WMLAK4Rz+fRdH8PX8lXvVF7zGR3VC+aFeYZrhDhKRFY18+w
         uHMZ0okXkGDogTVJn1n68JZ00ZRtcWonDA0my+246bCj5d4p1JC7Vxo9lAKgDbgOwnrm
         3ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6VBMl47g0qMtsIckfTBUTJxMHkVrqofv1yXRdGADD4=;
        b=ykoTFRfAXibuGvIjoum5Slo+nmPKUsHUCRf62Cw8yZV/lTmxq+g54Hf4rko0oQYppi
         2gTvq/jIbhL7EKQ9A4Y3yUjvcZptl7r7NlU+S4i7lJIu2w8GNVyljRkteqxq+yYtyHyG
         v4+eYo/Ir60pT5jtx6VUtv8ZTSt6u5V/WVERjJgjIC8+NnXx9nB5mhb2IWsF8xEnU4S3
         qWCOZt7bnutmGkJ1sDA22gldnXMWEQWB0AkLU0RiwIhTUZ/jt4mir9fTNKcGQiYIhOf6
         JNoW2Ma+NKYLXliVr/18ybmawgfMg1F5Of1t3HIoKpl1cuZDUNh3NCef1FuwKrURdedD
         cmDQ==
X-Gm-Message-State: AO0yUKWFjuf+zyo5qPvGY6/XJhkqKpzaAecbl7VK/TvYnFc1z2vf9xxS
        C9NqmPSUVwRTAtLK/xmzkENqlHWdP3d0+rMFOKo=
X-Google-Smtp-Source: AK7set+Muai/y+H9GR42QMGSN4xAd2v7rm4Jz4zaPKvliDS0btcYPbMigCAFC1hyBhdsNPB5buVYVg==
X-Received: by 2002:a05:600c:a293:b0:3ea:f73e:9d8d with SMTP id hu19-20020a05600ca29300b003eaf73e9d8dmr8888591wmb.32.1677763287240;
        Thu, 02 Mar 2023 05:21:27 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id z7-20020a05600c0a0700b003dc434b39c7sm7836186wmp.0.2023.03.02.05.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 05:21:26 -0800 (PST)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     rust-for-linux@vger.kernel.org
Cc:     ojeda@kernel.org, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH v1] rust: build: Fix grep warning
Date:   Thu,  2 Mar 2023 14:21:07 +0100
Message-Id: <20230302132107.210502-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Fix grep warning during the build, with GNU grep 3.8
with the following command

`grep -v '^\#\|^$$' rust/bindgen_parameters`

I see the following warning

```
grep: warning: stray \ before #

--opaque-type xregs_state
--opaque-type desc_struct
--opaque-type arch_lbr_state
--opaque-type local_apic

--opaque-type x86_msi_data
--opaque-type x86_msi_addr_lo

--opaque-type kunit_try_catch

--opaque-type spinlock

--no-doc-comments
```

Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index f88d108fbef0..41ac8401a8be 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -283,7 +283,7 @@ quiet_cmd_bindgen = BINDGEN $@
 		$(bindgen_target_cflags) $(bindgen_target_extra)
 
 $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
-    $(shell grep -v '^\#\|^$$' $(srctree)/$(src)/bindgen_parameters)
+    $(shell grep -v '^#\|^$$' $(srctree)/$(src)/bindgen_parameters)
 $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.h \
     $(src)/bindgen_parameters FORCE
 	$(call if_changed_dep,bindgen)
-- 
2.39.2

