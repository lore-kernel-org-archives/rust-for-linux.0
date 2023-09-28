Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CE171AF
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 22:58:10 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811CF194
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 15:58:05 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-690f2719ab2so3080076b3a.0
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 15:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695941884; x=1696546684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=42zDVS/1CLf9ETGOJ7BBUpXS0aNVAw5Uq2Vp2ZRQxgM=;
        b=dxaOZV87Ej51BjxVJHhL0Zw3TiTHWNoQ5t/5Yb6PkYS3oO305/hCU/Dix15VTjTViA
         +wJOSBdYqDyGbqUff5dU3dxjH846FpUqon71jCJgSqb3H9DgUftpm9La4Zp7fDWc0gxN
         4tnZhUqcs+Pzqu0wsoSCie2SzaA4GX1W1pAcBJgdxQKZ5V+R8TiTKB0GfQz2XbsBWER+
         gbTAB9eEPfWoTyYKNl0u7//VSnGJcdm/czW0iIudFEY7rYkYNZe/O9+A84Dci4zYGTKX
         FpdqICuaI7Xd8RoVvS0HUGpIXhF3/xZ5qvqAI2SBOunf/GOeqt3ZH5KNx8rxlwC0nibX
         ULjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695941884; x=1696546684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42zDVS/1CLf9ETGOJ7BBUpXS0aNVAw5Uq2Vp2ZRQxgM=;
        b=NqW62J2l8McaZMbwjXNSKuE2omIfw2s5PJv0fsPoqjwTdeo5FbjDNyNk6gjYVXU5Ux
         I6bcatkQXS5qjzIc08Q+fC20EugagehX881R5qgXZH3JKhTslglaUrwglTGhGuKjiI7Z
         GiF+pBD3b1mdWeoH7cFupWqDWdI5R5Pzg755meivNGW5ieX2+xue0PIwK4EG+LB63yYj
         iVRQnogLCYg/9fg9nNRfCoS8EpzKLL467hIwlryfwckyw5ZQk7euPLyjkCtCx0jF+pMR
         Z+2Wqal9by6+Yp98IMnvrKE6OwQPQnbYA7owYMg8T+sQ86y8afFV8Dg2PcnAnpEN5e+m
         Wefg==
X-Gm-Message-State: AOJu0Yy/pH1Z8tnKYKiYGoXRp4ftsg75ARrmVsNsU4V3/m6i8hjt8jD9
	/yeQD5X61y1GDPSNc+khYqqM3n1OIiGC2Q==
X-Google-Smtp-Source: AGHT+IGIvJfwj6QnifKV0fll4MEh1McFti4XBn6zgGp1c9QGuuMTKgtKuKihZ8o4y8vxyx2XElIM+w==
X-Received: by 2002:a05:6a20:8403:b0:15c:b7bb:2bd9 with SMTP id c3-20020a056a20840300b0015cb7bb2bd9mr2749063pzd.6.1695941884436;
        Thu, 28 Sep 2023 15:58:04 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id du7-20020a056a002b4700b0068e4c5a4f3esm6355282pfb.71.2023.09.28.15.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:58:03 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me,
	wedsonaf@gmail.com
Subject: [RFC PATCH v3 0/3] Rust abstractions for network PHY drivers
Date: Fri, 29 Sep 2023 07:55:15 +0900
Message-Id: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This patchset adds Rust abstractions for network PHY drivers. It
doesn't fully cover the C APIs for PHY drivers yet but I think that
it's already useful. I implement two PHY drivers (Asix AX88772A PHYs
and Realtek Generic FE-GE). Seems they work well with real hardware.

Thanks for lots of feedback on v2!

There is no major changes from v2; cleanups and comment improvement.

v1:
https://lwn.net/ml/rust-for-linux/20230913133609.1668758-1-fujita.tomonori@gmail.com/
v2:
https://lwn.net/ml/rust-for-linux/20230924064902.1339662-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (3):
  rust: core abstractions for network PHY drivers
  MAINTAINERS: add Rust PHY abstractions to the ETHERNET PHY LIBRARY
  net: phy: add Rust Asix PHY driver

 MAINTAINERS                      |   2 +
 drivers/net/phy/Kconfig          |   7 +
 drivers/net/phy/Makefile         |   6 +-
 drivers/net/phy/ax88796b_rust.rs | 129 ++++++
 rust/Makefile                    |   1 +
 rust/bindings/bindings_helper.h  |   3 +
 rust/kernel/lib.rs               |   3 +
 rust/kernel/net.rs               |   6 +
 rust/kernel/net/phy.rs           | 706 +++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h          |   1 +
 10 files changed, 863 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/ax88796b_rust.rs
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/phy.rs


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.34.1

