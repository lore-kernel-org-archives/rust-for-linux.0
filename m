Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657DC1BC4F
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 05:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717737711; cv=none; b=j4jWug3ZyXVmMAahtETY5tiDUSmj6du4cnxcfynkf4ENRH3Yu2mBuuTgL6IE2uf7GUygnovGpyQ13Y6+xRJwI7IXv6PaDXw+Ee1aWj8lirhclwZBp6273wWJXEdgU6CPpB8xvy9cEmiOsdq+d9G8lhC8C78nUAlTmmx202Sd1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717737711; c=relaxed/simple;
	bh=RnHB3/OxWseDBEwMm7ZmK9WZ6ExT4o1/e+UkhcKMmEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uK32aygN8qHelPh/RXiwj7HbDw/wMcwLtyllaGSXg6S02bpuW5899HivP0k9B7iCbOA68eu8VJhTdqIfeKJHeeQYuplrBaMCoQm+7lVu7F5685N/TjBlPMlo6/SuZeFgJC0c5ZoTZb4f955GJKGBBQoHBLk61d60AcM9OOgQr3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDwnH/ka; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDwnH/ka"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f4c043d2f6so1404095ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 22:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717737708; x=1718342508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cO7elGxQDvsHma3eM1TQbyK4WwYR2SCbSecMWm//GDU=;
        b=lDwnH/kadCNX49+uhp6SI0+xTx8W4OWrI2n5/iLXh6tmyCETRoL7SVV476WiBviKsu
         AVXIijzIw9Q33ilVRf4eHymM04T+TfNv7YxvtIiTvv9FoVNMfZ5W9XIgJngcTv8Y/rO/
         uB1xQJnJEkcDi8yAgyIbSILZM5fMAKNrP4e8TGq8BjfmKDlIbYR9XMepxLb00CouxJ/G
         DNPR7DLlLKDYSjPjZN1Zz0HhjDPDOPQrxxpaSjZ0mb/aSuNateSleW/7sDZg7bFJztpW
         GguoI0lA5PeblLsSoDXglDwIm271DUONuOsQl+01TG053r4KdGbUVHE+EyyD6C+ThXrw
         6T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717737708; x=1718342508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cO7elGxQDvsHma3eM1TQbyK4WwYR2SCbSecMWm//GDU=;
        b=F+ZqWEABpiicXl9Kyh9FBBWWiOfIxmP3r9XwvE+X0restuxBC/MnbP44y4zhD4vB59
         ReFQMkqKHQNfpEMzyPCqkEyK1JDK+f4D9Z6WRjO2gE4G7he2xheLhJIMkbXgJR32NQZz
         8qb11aZL+GBXz5ssl4aAy+uXLYE510mEkYYExnxSFxjkrGGKo+slNv5KxytLBRte4KUB
         S7adjaFtjH80QubBWdFfVubgEtR7Q8ENsCCfPYWOZtiOWenMBAKWnoHHVxjWJ/hTUanT
         1igFmeEcB9pWGaEaRx/Qi5LXXNvUgkcKb6Yu5IqhFZKvYZtVVraV1YDJoEqZ3ycPK4QY
         rU7Q==
X-Gm-Message-State: AOJu0YybdquwnquSOQKPcH+Pg2PDqenFANEzyuxgeaKbLd98COHJ4A12
	24kEg8lFXlt5jzz4mYQC66TYVOO/lWUH7xISWW6lnoRJ6kRqkzhPeeMcNA==
X-Google-Smtp-Source: AGHT+IEFcAB8RZtXPPIp7e2JGU1kly320BZ4WLnRSjJEOmO4Tui8cAYfuNKyTWVfTheKagvZww2pew==
X-Received: by 2002:a17:902:f68f:b0:1f2:f73c:c442 with SMTP id d9443c01a7336-1f6d0225c27mr18684225ad.0.1717737708241;
        Thu, 06 Jun 2024 22:21:48 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd6c30a6sm25106215ad.0.2024.06.06.22.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:21:47 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	benno.lossin@proton.me
Subject: [RFC PATCH v4 0/2] net::phy add unified API for C22 and C45 registers
Date: Fri,  7 Jun 2024 14:21:11 +0900
Message-Id: <20240607052113.69026-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add unified API for C22 and C45, reading/writing registers and
genphy_read_status().

We could add methods specifically C45 like read/write_c45 and
genphy_c45_read_status. Instead, this implements the unified API for
C22 and C45 with a new reg module.

v4:
- make reg module sealed
- improve the comments
- add examples
- use error::to_result() to simplify some functions
v3: https://lore.kernel.org/all/20240603.233954.1644803151268035787.fujita.tomonori@gmail.com/T/
- move reg module to a new file (with MAINTAINERS updated)
- rewrite commit log and subjects
- rename Access trait to Register
- add build error message for build_assert!
- define the complete MMD list
- drop new func for Mmd
- remove trait GenPhyOps
v2: https://lore.kernel.org/all/20240601043535.53545-2-fujita.tomonori@gmail.com/T/
- add genphy helper support and split the patch
- create a 'reg' module
- define C22 according to the specs
- handle C22 vendor specific registers
- add const for C45 MMD
v1: https://lore.kernel.org/all/20240530.145258.456915814420167538.fujita.tomonori@gmail.com/T/

FUJITA Tomonori (2):
  rust: net::phy unified read/write API for C22 and C45 registers
  rust: net::phy unified genphy_read_status function for C22 and C45
    registers

 MAINTAINERS                      |   1 +
 drivers/net/phy/ax88796b_rust.rs |   7 +-
 rust/kernel/net/phy.rs           |  44 ++-----
 rust/kernel/net/phy/reg.rs       | 219 +++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h          |   1 +
 5 files changed, 234 insertions(+), 38 deletions(-)
 create mode 100644 rust/kernel/net/phy/reg.rs


base-commit: c790275b5edf5d8280ae520bda7c1f37da460c00
-- 
2.34.1

