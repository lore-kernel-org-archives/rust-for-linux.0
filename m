Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F80A48
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 06:49:22 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE63107
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 23:49:17 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-690f2719ab2so1137164b3a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 23:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695538156; x=1696142956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r7CoCkVSKtV/m7Y/rqxKBVDRWCdx5eGlwSf364hBv9Y=;
        b=hkSVOZNYM7wIOfxC9y9S5atKq8uzZbqzwBRWMaXwy5ZYdZorkiRA7SDPHjzzmFA33p
         SdCpsosobBOTEehbZMwFzzfHbYfBWtWmhS6ZQa48GoSA6ZLSt2AS3ztE8T7xiwHdyiEP
         8QkfzTaUjC8dG7zjsS638Yz8IgzZs/E5qxew+GYWn1bbrRg8T9MzxL88r6lE05KE5Ktt
         WlqpUW3nLjwjCSSGHfyVtQ4BOU8KVHKDbZmCD4Ao6KfaQoUC7SixnED7m9SUbLwXPK2I
         5KbPR2P3Z3GGk99MlXVU790jWVH8mmg5yKLVy22DwFR916YHVl+wzrHtMRegsZZ0YySd
         QZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695538156; x=1696142956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7CoCkVSKtV/m7Y/rqxKBVDRWCdx5eGlwSf364hBv9Y=;
        b=L4Bhy8Q3L2SMC54AeUloVsqxLP8bxlCv7V9vzOO9zA2XWbqc8SO8wPtB/y57syfeLk
         Ba1lhuUWeru6/0wP1eBT7GOHg5pA+iDrBS3Fuij3vMN11+I0+1tZXsscE5BRef9WE9sl
         RkFF5KlkPVEO9EkijQmXbWEGcxYUz2MLfAIDpZOAXXZxhMc7rWmemR3Vi1bsIYGsF2Dl
         LiUVrBxDgY1ILR3KSLTUaPe1gWNkHBJaMOQief1Etd/LETyBBwwshD37Wq3ehIWlYwt9
         meGscBj5L4CAtKP9wLoqEEnky8sWl8bJKvSYMhQ6MPiebAG5TSzlvLSpfA9btDg6U2r6
         e4ww==
X-Gm-Message-State: AOJu0YxsvcEag7Ba0W0LT1DRljTUU5nk7lBl1gEhOKUVbL9RIR00seiG
	zg0Dvcj0Z1ChFlY6cuGZ0LiGj3S/PewDCw==
X-Google-Smtp-Source: AGHT+IE1OmtrFKctDOO/rjItstPvy9hf9u9hkXi1xvko8HIoavEmVIs00/qa4lpcQCm/5wqA3ttcLA==
X-Received: by 2002:a05:6a20:4418:b0:123:149b:a34f with SMTP id ce24-20020a056a20441800b00123149ba34fmr6674584pzb.1.1695538156223;
        Sat, 23 Sep 2023 23:49:16 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id y5-20020aa78545000000b0068fd653321esm5827711pfn.58.2023.09.23.23.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 23:49:15 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: [RFC PATCH v2 0/3] Rust abstractions for network PHY drivers
Date: Sun, 24 Sep 2023 15:48:59 +0900
Message-Id: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
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
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This patchset adds Rust abstractions for network PHY drivers. It
doesn't fully cover the C APIs for PHY drivers but I think that it's
already useful. I implement two PHY drivers (Asix AX88772A PHYs and
Realtek Generic FE-GE). Seems they work well with real hardware.

Thanks for lots of feedback on v1! I've tried to address them but
sorry if I missed some.

Here are major changes from v1:

- uses rustified enum for C's phy_state enum

This guarantees that C and Rust never diverge. If the C code is
changed without updating the Rust code, compiling the Rust code fails.

Note that C allows using a value that isn't defined in phy_state enum
for phy_state. It leads to undefined behaviour in Rust side. But this
enum is used as state machine in the C side. Such should not
happen. If it happens, it's a bug on the C side.

- adds the Asix driver to drivers/net/phy/ instead of samples/rust/

I've implemented all the features of drivers/net/phy/ax88796b.c. The
features of C and Rust versions are equivalent. You can choose either
on kernel configuration. I suppose that how to handle drivers in Rust
will be discussed in KS or somewhere. Until then, you can use this
to make reviewing the abstractions easier.

- uses static allocation for phy_driver

v1 dynamically allocates memory for phy_driver. v2 uses static
allocation; the registration of drivers is much simpler. I added a
macro that handles registering drivers, building the device id table,
etc.

- cleaning up the interface for PHYLIB

Uses u16 for register and value, keeps genphy_ function names,
dropping lockless_ functions without MDIO bus locked, etc. u8 could be
used for C22 registers but I like to use the same type for C22 and C45.


v1:
https://lwn.net/ml/rust-for-linux/20230913133609.1668758-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (3):
  rust: core abstractions for network PHY drivers
  MAINTAINERS: add Rust PHY abstractions file to the ETHERNET PHY
    LIBRARY
  net: phy: add Rust Asix PHY driver

 MAINTAINERS                      |   2 +
 drivers/net/phy/Kconfig          |  16 +
 drivers/net/phy/Makefile         |   8 +-
 drivers/net/phy/ax88796b_rust.rs | 147 ++++++
 rust/Makefile                    |   1 +
 rust/bindings/bindings_helper.h  |   3 +
 rust/kernel/lib.rs               |   3 +
 rust/kernel/net.rs               |   6 +
 rust/kernel/net/phy.rs           | 760 +++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h          |   1 +
 10 files changed, 946 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/ax88796b_rust.rs
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/phy.rs


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.34.1

