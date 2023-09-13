Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629851DDC8
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:36:17 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B142919BF
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:16 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68fc94307bfso709481b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694612176; x=1695216976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/FWGmu4O7s+DXwQ94QWf/6qlnnblZ2sw0wwfJpMrtA=;
        b=pCwfC0LYiOgw3yCwV7CN4fTifSrEYfPpr5q1rp7DexL/BMSVTXSZW+ZfuJ7qJE/WeG
         mQzpSsjTySCtGbaEYTl9Jen8jIzH5xSunlfFbV8Mofbr9YRVKnlQ6Q0QiwLJ8y53QLF9
         iFf0HQoRI022hX0wSd/dwBWHQS6THEQMQ/q0ykcT71sE+gkHE5ppTE6b3g1iWMVf0/Uj
         57yXs3gGvC18JTJZGpXSldEf2R/zSFM/syjVAvMBADxJNFGltknOtIcFCBiHvHG3FOiI
         qtlF/pOCJK8p0JEh8pYRj2SYlXSUhYlp0EJ4RIgipi/Bq20tA7oZ1ejmxxZFozj75ZY2
         zFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612176; x=1695216976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/FWGmu4O7s+DXwQ94QWf/6qlnnblZ2sw0wwfJpMrtA=;
        b=DjKKX4nG0sO4Wsud1fste5c3AyEcCZUE009zyLtvSe3V5P8DpsKtJpS3zAVTIzCPJq
         Hzp1ndIc2WeGAHB/f3QJP+VDd9cledNaqAlp0QsKIi8uZT5I1p/A09MI7sh6bjd2EsoE
         ddmv+r3SI/tMGgnUdGjsMvoPNo/WJ30Qznf2OwQONE2WesYgtg4J1pi3E9ElKS9TMu23
         sow2Bfz/YD1nKOjppj1IfVX9S4+Cbl6XGklWud0sZn+K8FL3qr2VPHQ/zcbiFzOVFL6J
         qFLJunmcYnbFuvPRBna2QdWf6+l4XLXkySRv3s3s1DPcDdFwQMI/gr/GafS1K9F85sQ7
         a03g==
X-Gm-Message-State: AOJu0Yw+tXVuFnHnVBOqMUCmfwDMUQiXdePxcwgIUt8EI2C29390H2LB
	f8LuiFmv8oHAqv31FDZRYEP+XmJd92pt2g==
X-Google-Smtp-Source: AGHT+IGaaVeUFd0ijIZWVB6QL0+lws8Frl1qkvL9po/rgC+tFTgs2Zsuc0Uh/69xVQ1FMtTqSBUZ0w==
X-Received: by 2002:a05:6a21:a595:b0:13f:65ca:52a2 with SMTP id gd21-20020a056a21a59500b0013f65ca52a2mr2759891pzc.5.1694612175817;
        Wed, 13 Sep 2023 06:36:15 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id l14-20020a63700e000000b00573f82bb00esm8866602pgc.2.2023.09.13.06.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 06:36:15 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch
Subject: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file to the ETHERNET PHY LIBRARY
Date: Wed, 13 Sep 2023 22:36:08 +0900
Message-Id: <20230913133609.1668758-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The files are placed at rust/kernel/ directory for now but the files
are likely to be moved to net/ directory if things go well.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..95ecf96b911a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7797,6 +7797,7 @@ F:	include/trace/events/mdio.h
 F:	include/uapi/linux/mdio.h
 F:	include/uapi/linux/mii.h
 F:	net/core/of_net.c
+F:	rust/kernel/net/phy.rs
 
 EXEC & BINFMT API
 R:	Eric Biederman <ebiederm@xmission.com>
-- 
2.34.1

