Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98465171CA
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 22:58:11 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB02C19E
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 15:58:06 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-693400e09afso566304b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 15:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695941886; x=1696546686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghi16J3BrlW4TPN3K2aA+Kf8CE+MxHSqfJ06TEv+IsM=;
        b=bNcKkHwhVwyvARNy5wCnZ0sesC8Mzg45iZaYwvm+ZAKfyCuVRt9+kmOTQ7Mz9bXbLL
         CzB2udKOzSGWZi10vn4aVeloIA1KZzWJZrkjxbK2/jTVPp0mMg6Q3lIEwcr4DV/hlSTd
         67EkJu/D4ntisxDBUb7Dj6JmLs7D+GrzqNCSgwxjJbasBWP6fqiwIAZvI2Nv4tmsX8Gm
         Xs4QA/MkC+8eev5MLucbtjGvstRlK1EH77vdusPEz6ww5Ykn0DSmkYfeE3M09nDYlWz6
         nrlbsoFOyHgyRPRmwRvtcgN7o/DeNkfzDVqnIw1FrIE4ti83hzsUWDDCQbzNMPlR2RvY
         57xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695941886; x=1696546686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghi16J3BrlW4TPN3K2aA+Kf8CE+MxHSqfJ06TEv+IsM=;
        b=gcwDmrhwv57+PdERc5TLF2JCmX3t6U6CAsUwz2vOd/AkkOb0OW7WKzRrXosi8tqX0K
         FGiIQs8ccueeoZm6lryCjkP0UZOgY/8NCEWcS/j9m7Ss0VqibbvyZhk4FY7zbMzepOf6
         sCBODUApawQf7VyciZJZIsfuBBuOO9u2phQcKyKvrOEo9FfTe1CWZcvy/fB9Rz37f3WC
         AQ7ul1HXO2OL0hPjTzv1bsubjdloC59ebj8FQmTZh2+CMay45GecsMSK8ruKur8OkEQs
         xtcR1CHHmFlo3E18QRucbkiZm2Z4T49rOBHAKfHZgoyGTRnOD7DYil8gN/FmZTOzu0D/
         wiZw==
X-Gm-Message-State: AOJu0YxEgfyCYCXPrQZMXFzsZxcrPhzpAkN+njxKYcdaAvBGT9CGaJWv
	fwfjnbnWg1nP4IQgnH1lUQBVU53VxdAivQ==
X-Google-Smtp-Source: AGHT+IHOCbKg8fYS9cDI26JmmdLKj2D6sVncpKadWdLPTmp9e7t//9yVBElPujmj6Gppxq1omUJprQ==
X-Received: by 2002:aa7:83d6:0:b0:692:b3d4:e6c3 with SMTP id j22-20020aa783d6000000b00692b3d4e6c3mr2688901pfn.0.1695941885857;
        Thu, 28 Sep 2023 15:58:05 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id du7-20020a056a002b4700b0068e4c5a4f3esm6355282pfb.71.2023.09.28.15.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:58:05 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me,
	wedsonaf@gmail.com
Subject: [RFC PATCH v3 2/3] MAINTAINERS: add Rust PHY abstractions to the ETHERNET PHY LIBRARY
Date: Fri, 29 Sep 2023 07:55:17 +0900
Message-Id: <20230928225518.2197768-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
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

