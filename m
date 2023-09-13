Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED11D3D6C
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:36:14 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA5219B6
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:14 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a88b1e18f2so540245b6e.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694612173; x=1695216973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=THMcqIUdLzfLaLd5lcTO3pRHtc15ihAqshWTmthEa4M=;
        b=b6OGuHBsbWFpo0HeXZQKsp0N+SLjZDkvkZwqyhwLjLh+65qFQKLglAWCp5aKO6Ixxl
         CaKcC3BxRgJBvRJg7fvw5SzmW3OOSo1g/QTJuN4lAGmRbj/Jwm/Z9KOrHmPvBxGV2N3l
         pMYVoItwj4Tdq5RFVu4nXhdsjSKOKzZimcWrjzSJSyTsv2YzTNdVhK84v93LeXUkurUJ
         Gjc8ELp1XlrcmlgCvTbR2B6y8vk0zTZuQrlq4R7h9Lu+TeKJb+E5OPwIaNoLQnmpgKgq
         +SJQvStiMKjMFN40xNiEGHf1aPVzox7rQeQp2aR41LjQmoJL/O4/+hJyI5HCp7+mXyav
         iZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612173; x=1695216973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=THMcqIUdLzfLaLd5lcTO3pRHtc15ihAqshWTmthEa4M=;
        b=su9hQ7Tor+u1T0xT8V47kL7PhVfkill6b97OsNu/iN1kjOCUcwDvm+x/G5cnA4sg8U
         u73Y1+pkfRfv6GwOQh7Uh2Nec9Ntssy+VmtFA+dW9gOHp1WZWX6G3/p1srKDd+qqPj5u
         0G1RuU2JnWOgs7WjhW7iVoGNMIjgLNOL6xkgqmh1HdTRuRcLz6e70wLbH4wi3aB2neQz
         ouU/cRz5oXDw9Rt9zG4Vdxo1AW4cSREq/SZGqyG2WvdWhrLkMrfNpP+iJJPcveWDw/Og
         VvdZbhwlvSMbps1B6miWWFLYTtAClEU4RrmJyXuVvsSvXKl2nNRvxKfQHOAUPh43fx7U
         JSCw==
X-Gm-Message-State: AOJu0YwOQLARimSjJANVAyZBqmWycCt4piRAmXxuSi+d75PBT++vKbnt
	sMpy666QiRRybaQoYapiluP023AeOqk=
X-Google-Smtp-Source: AGHT+IEpKN64/d1uKeeOnBekzk0eo6YrLwVYCc/wDTKjZmLXBYEqqT46/fUIyhaMnA69MKg5QcoF0A==
X-Received: by 2002:a05:6808:218b:b0:3a1:d457:83b5 with SMTP id be11-20020a056808218b00b003a1d45783b5mr3064718oib.3.1694612173261;
        Wed, 13 Sep 2023 06:36:13 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id l14-20020a63700e000000b00573f82bb00esm8866602pgc.2.2023.09.13.06.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 06:36:12 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch
Subject: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
Date: Wed, 13 Sep 2023 22:36:05 +0900
Message-Id: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thhis patchset adds Rust abstractions for network PHY drivers. It
doesn't fully cover the C APIs for PHY drivers but I think that it's
already useful. I implement two PHY drivers (Realtek Generic FE-GE [1]
and Asix AX88772A PHYs [2]). Seems they work well with real hardware.

Without the user of the abstractions, it's hard to review so I include
the [4/4] patch, which adds the Asix PHY driver to samples/rust.

If you are interested in the past discussion like why abstractions for
PHY drivers?, please check out [3]. The short answer is it's much
easier to implement useful abstractions for PHY drivers rather than
for network drivers.

Before submitting to netdev, I would like to iron out Rust issues.
Any feedback is welcome. Thanks!

[1] https://github.com/fujita/rust-realtek-phy
[2] https://github.com/fujita/rust-asix-phy
[3] https://lwn.net/ml/netdev/20230710073703.147351-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (4):
  rust: core abstractions for network PHY drivers
  rust: phy: add module device table support
  MAINTAINERS: add Rust PHY abstractions file to the ETHERNET PHY
    LIBRARY
  sample: rust: add Asix PHY driver

 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   3 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/net.rs              |   6 +
 rust/kernel/net/phy.rs          | 687 ++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  13 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_ax88796b.rs   | 105 +++++
 8 files changed, 818 insertions(+)
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/phy.rs
 create mode 100644 samples/rust/rust_ax88796b.rs


base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.34.1

