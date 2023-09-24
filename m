Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136137FC
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 06:49:19 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA6BCA
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 23:49:18 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-690f2719ab2so1137172b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695538157; x=1696142957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghi16J3BrlW4TPN3K2aA+Kf8CE+MxHSqfJ06TEv+IsM=;
        b=bUk+X6kEGlU/sN/0oEL3DBf1F9vxPzY9EystBnerXZSMVCOsfjKkIix6YKu7oyA3e0
         rGNYgP84ZrJDcI94k7iYJz3FuaezC5oizQkW1Oh1aXLDmY0A9VjRESuaLEKPSAq3jqhy
         URJa0YcmOHMGM8FsvhjNM+LOfsLnD9JcYgsR20ImVB1Lc4W6Kz2WvMDkNeFAa7Sxr5yX
         qzJQQ1n0y2KmWxgqpTBo9MCM3dJWii4TtFDI65+aVrnDDhOuPHEUWNR9VIs7iBI6MCmS
         U7pVuvn0BSX6t/CWlOWdPUYpHvAbIdCBro8rH8ftm9oThiCnwyAQlPxcOC3sjzAlJz5u
         daaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695538157; x=1696142957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghi16J3BrlW4TPN3K2aA+Kf8CE+MxHSqfJ06TEv+IsM=;
        b=M/aJF2rNX6yQ+KDRLYTnnU/TEagyXSYbcIEXchm8pX/v1YoitaUlLNTRrcEbHoY6i4
         E1fTTX0kDp4eGwVbo634dO45xD2px2j6hDHgbomGkMgQl+kaN5/isbgIeCVDK6hjxyqO
         +8Gre1wTFYbmFfXTNoA5ITPNz7e+HFRYprZqAeGVfnUoUkD1NPy8LvfFVbMqF+dlVPa6
         6Y3zHW9wGjAoeEXtNw+jBqqPKYuC977CRCaFgynZQRIhmk5li3gM8gBzMNkBcxYjl41l
         eWDN2+3yrt9shriiofmCYTTz0DZ3/ihsFQ4H+sx2z4ltZhXmn0tK4lSQm/snfmRzjLJ7
         JHqQ==
X-Gm-Message-State: AOJu0Yw7ZQFeyO7Iu55MYvi1Z1d9ogqxI8BIr1MvnjXG2alNkqJpkBlB
	j5zXsHGZzWpWFPDzuCQcS841O7cYfCQw0Bao
X-Google-Smtp-Source: AGHT+IH12XXZqVCQhOvheMZkZJJutxxxEfPsUvdpLtndN0iARvWyKU6iWS7fL9K9IV4MzLuDdtKWmQ==
X-Received: by 2002:a05:6a20:5481:b0:15a:4634:e4c with SMTP id i1-20020a056a20548100b0015a46340e4cmr6040749pzk.5.1695538157572;
        Sat, 23 Sep 2023 23:49:17 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id y5-20020aa78545000000b0068fd653321esm5827711pfn.58.2023.09.23.23.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 23:49:17 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: [RFC PATCH v2 2/3] MAINTAINERS: add Rust PHY abstractions file to the ETHERNET PHY LIBRARY
Date: Sun, 24 Sep 2023 15:49:01 +0900
Message-Id: <20230924064902.1339662-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Adds me as a maintainer for these Rust bindings too.

The files are placed at rust/kernel/ directory for now but the files
are likely to be moved to net/ directory once a new Rust build system
is implemented.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..20e0ccd4fcaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7768,6 +7768,7 @@ F:	net/bridge/
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
+M:	FUJITA Tomonori <fujita.tomonori@gmail.com>
 R:	Russell King <linux@armlinux.org.uk>
 L:	netdev@vger.kernel.org
 S:	Maintained
@@ -7797,6 +7798,7 @@ F:	include/trace/events/mdio.h
 F:	include/uapi/linux/mdio.h
 F:	include/uapi/linux/mii.h
 F:	net/core/of_net.c
+F:	rust/kernel/net/phy.rs
 
 EXEC & BINFMT API
 R:	Eric Biederman <ebiederm@xmission.com>
-- 
2.34.1

