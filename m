Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC214E2DA
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718804405; cv=none; b=nIiwAStjJu+X19F/cUde5rBo2akMmRWJCmP3RP2GkNeUOmbjRXDNW/A4PtnA7XXYhjLzpptHX+eVHGjn1is+x58T+1zWIMMRnJsp/Z7+33ed5MPpDMv5Fb5rpUau/ITFUJXtEiLB6w78GtSzP0tH/U40BByd4KPL0SDBy/11SzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718804405; c=relaxed/simple;
	bh=6MzhpI9fJCcEpgQhs7kB5z05QS7LHzxzTbVhNvTC/wU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4iaUEPGHY0YM3PyrfJYqU+K2kxU1HMOtxQw2bRPhLb2RxZhmcv2rXFoIRokA57NLcOBUsZj9YH+OFAObDxBySNr7wgQrAvGyLY7uQcx/kYnMFJ+AXrMRfqawMKNWKv2Ng4DzIvrlH51HXtXTyMrTJt1Q5Y9KR+wy6wJHIuZrqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OUrzeO8o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OUrzeO8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718804403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuMMLNSwR36fe8ZSML4xmcTbA5i566bPVz1jYRmdpSE=;
	b=OUrzeO8odv+VWRtTOX8ejIvXL67sYvbKcCE7E9boXsE/H8GkJFCULxleYqcA4WTUa1JjRP
	l0/O1CuFZt6Qwiq0DfG4Qt6iFb0Q/WTauiLJLTbiFHNmV0NBG8H/d+9UBWtjTC4bdrzcPy
	AT9tklW4eobWMfecl2SiIOR8nYDUwBM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-MUijEdrGME-p5N0OQV6Cjg-1; Wed, 19 Jun 2024 09:40:01 -0400
X-MC-Unique: MUijEdrGME-p5N0OQV6Cjg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4217104c425so41255845e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Jun 2024 06:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718804398; x=1719409198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuMMLNSwR36fe8ZSML4xmcTbA5i566bPVz1jYRmdpSE=;
        b=XDkDgQnifyink0wjXAEAdBX1mltHaNhZF1AAE+/41Pxbw2E+BtNhV3PcYigTiZZfDl
         jwAFyOGWvQP5hIGbfoXkh0N7PRmx76UyVqa2oDOBjgg+bfh1Q8LDban80Hic3i7thvSk
         QKk0W9SNd8Dnh1x/tH5TmiZ5Xj4WdOO4nBl0HfV4h7zp3VsFk6qzGwuTieC1fbzJQO48
         qc/LQKtg/59NTlGy3C/Ecklf8m8Qo0PvTEpVBcYXyjr9UiRaBMg858So6FSaAmi0uiLg
         HE73Dvik7G4w9mnxQ8A9FFQmx6ic+zkRmLZwFbX7UcQaFo9VtmMLwrqztUREftS2norO
         cMcw==
X-Forwarded-Encrypted: i=1; AJvYcCXmbRExro5qdpPlO+hpgurDAeMXdDisF3D/EFxpFVA9anTAZJQgOTM9puCljBu+eY1CvT/G/MD1gWgkcmLaDGF8mjn5nqMip2q2diWZFCA=
X-Gm-Message-State: AOJu0YyzQtK5v1eh71Nydm8oYNE38YySPoU5pl8nACMXxZ51NTVU9UVM
	AhPDhEUvf35QIn2SSy4FfdY29rIYxyTdaFtMrb+96IY/U3BCOn1H5U/wpwp2B5KPITD1PW4jb9R
	958upyPG8AO+bmOBN97kuch4mS+ImMxhVU74frqYNo6EbfHTRfSbykSeC0/usewpA
X-Received: by 2002:a05:600c:1c94:b0:424:798c:120a with SMTP id 5b1f17b1804b1-424798c1341mr9623895e9.24.1718804397898;
        Wed, 19 Jun 2024 06:39:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8xLEHLAiIZGvEWrnYIWMvrdXuriX36HI3VGWbzjKEdB3y6vH9kHZRBFc0eqLASc3sxSsRIQ==
X-Received: by 2002:a05:600c:1c94:b0:424:798c:120a with SMTP id 5b1f17b1804b1-424798c1341mr9623745e9.24.1718804397530;
        Wed, 19 Jun 2024 06:39:57 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f6320c16sm230512565e9.38.2024.06.19.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:39:56 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH 2/2] MAINTAINERS: add Rust device abstractions to DRIVER CORE
Date: Wed, 19 Jun 2024 15:39:18 +0200
Message-ID: <20240619133949.64638-2-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240619133949.64638-1-dakr@redhat.com>
References: <20240619133949.64638-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add missing file path of the Rust abstractions to the maintainers entry,
until we can move it to 'drivers/base/'.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf9c9221c388..6dc6f264f800 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6714,6 +6714,7 @@ F:	include/linux/fwnode.h
 F:	include/linux/kobj*
 F:	include/linux/property.h
 F:	lib/kobj*
+F:	rust/kernel/device.rs
 
 DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
 M:	Nishanth Menon <nm@ti.com>
-- 
2.45.1

