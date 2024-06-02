Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71B22232B
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Jun 2024 23:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717370290; cv=none; b=GAg9CO6+SLq+H963Fl71mwa44D12fSmwn9oCSdZ5pY/rMfbwYB0U90JwKXPy3X9IDye42uxbFneyldYSippBuxFiAoIRlDCBLuAud9biaUCE42nV5E/fR5OGSalc4cnWVbrcx7izLIE+PYxKLMCNWBTw40/RGiQltHtOMq2J6/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717370290; c=relaxed/simple;
	bh=i5h/O1nF4qB/+0pwmtftS8PONNmMa3PbQlUtAfUQNmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K7OiFDHiYM+8JUDFhHhDFrWlMKnqHZ+GgHCRVGbwSLXnpgJR8UEFQcxJpXIwHOvIYXbFLojXCM+kRXpqUcc5UhwZawSTiyhhraKshIOaPDo/XeBIQZQHTX9Ziw9NXQuyRk2G/lOQ4jjQdYnhCt+3HUwHkcUx31K6Nw3tcbs+GH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBPJqOaE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBPJqOaE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-702762a76f0so1061b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Jun 2024 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717370287; x=1717975087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eS/hHyLKoJi3F3XcRpDIPJtR0+nhdPsn8kqQd8drklY=;
        b=CBPJqOaEMpqGhkuXivi9Loma3GzK/L+oLWaDMz+vKvwzHJbrr1PovoagoiKUaW+/zl
         PsTxzSqfDUmYOp6sChOnhz36OoFAx4+lpPU+iitlv7e50ThRgzJtvwaT1gbj2DXmkCzt
         ktgownFIQkfkDHJCJCpXVADUOwMw8zpDA+y067DoI4cV7g6GsHwkjX1QJfntdf4L/PcS
         f2oGQ2VZd5Kp4lemHxBP2oB1Gi9YEyFUvxCEGL3jKF64E0rPzV1BOy+Pnqzu3Z7ZDvWI
         JmwagSjcmURS1rDLN/iKQB0vUZoHYnkmdfHYJ9LrVTY4pQUKoAn5vXl9kT1UYCgwmt8B
         dqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717370287; x=1717975087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eS/hHyLKoJi3F3XcRpDIPJtR0+nhdPsn8kqQd8drklY=;
        b=R0mxukyJzQiJFupl2O9L2cP0U8MZsYr9bp7d548C77vOlKatAa10hF6f/3i+E45wKD
         MGAVZC62t8pP0urbelUlVdE/lwjLBjgy/pidSmjuiK1G/2VqgMN+YTDwBZmAooE6/Dpi
         l6wEmL2b2LzrQDm8OBKo+vF+a0Sl4ifUNgCH3oQQ80B/+PFPO692o1O334fdd5anoDXe
         78c94JVt0P/gyEb5gHDqc68YBfJ7QHjgRkU6KPyEvcV/FIEutM2z+U7ZwBbvTV6k9cWc
         G/4aYub0ckgEW+nd/n48dimjouhnKGS6Ie+9yEiyWjpTXJUga/JyqE+mXPtPDX3Tp2G0
         jl/w==
X-Gm-Message-State: AOJu0YyRVHmZzFAW/je/47gcZvvvT4hUppgROun9A9K53/FBe2uzChVN
	4tPlIJK+hnzrnqqSvx0yb4dpJRP21rblf5IsEaysl+agACepGI5lwtcOYA==
X-Google-Smtp-Source: AGHT+IH5Pn/RvxkLmH5JdgzCIlzJT7GSntsXXnE18z9hSRMXlJkuQ8vzoutBMzCFEQYjeoBrRCvumw==
X-Received: by 2002:aa7:8c19:0:b0:6ec:f5d2:f641 with SMTP id d2e1a72fcca58-702477b6643mr7949972b3a.1.1717370287456;
        Sun, 02 Jun 2024 16:18:07 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b300ddsm4416444b3a.191.2024.06.02.16.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 16:18:07 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	benno.lossin@proton.me,
	tmgross@umich.edu
Subject: [PATCH v3 0/2] net::phy add unified API for C22 and C45
Date: Mon,  3 Jun 2024 08:17:47 +0900
Message-Id: <20240602231749.57111-1-fujita.tomonori@gmail.com>
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

v3:
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
 rust/kernel/net/phy/reg.rs       | 201 +++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h          |   1 +
 5 files changed, 216 insertions(+), 38 deletions(-)
 create mode 100644 rust/kernel/net/phy/reg.rs


base-commit: e19de2064fdf6f1f2488e36cf3927c3f1d01803c
-- 
2.34.1

