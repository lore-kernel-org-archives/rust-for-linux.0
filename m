Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE73E3156;
	Wed, 26 Aug 2026 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750891; cv=none; b=awVHs8PxnNjGWqn008kI+aoAUeiDhXCVRklitCJUgC1vWUVKDpzNCNhhmkMl8aSvGcnI0QwK5bUtl1uZEf4Y8KH/ljyazmXhHBVyNMjww2MaUconeAwBTGefirWTP/4eNVJbADULPykF/8nf8dL9D235xT7iBuS9lGkqHaTQFAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750891; c=relaxed/simple;
	bh=7iwd+ZPC4b2HIRIKNbtVUAPr0n1d5JXJQ7YzYBbrbXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EsOtGC8xscagl5osOcTlbuNs4JvGD+KM+IFwj/y2cJwxOe8pUv2lwDTvlHHuIFnyxk+bEvBnQR5rXH67aolbDeZWzx1dN86QhtEgEPTQo1oxiksoFLaOOsf+9p9lmiGNJftDW2ak1BlHqag5mjeEmkqG5mEdeMCfT+8Q4ML2h+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1Oho4Oe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1Oho4Oe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC5C1F000E9;
	Wed, 26 Aug 2026 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787750889;
	bh=4e3M61ZpGllDH+Am07maUhem4TA/VM4b9rObsCDHJgk=;
	h=From:To:Cc:Subject:Date;
	b=n1Oho4Oe0Pg8r993pvzAPT2CMpds8pnFfBryfHLtG+GMPS/tkFaUho9rWAot8S0OQ
	 Ri0pnmhgfKog/JijCckvCUPkGiyifMDipQ4LqaPrQemR22E6vV9gn6EUd2XZj+gNIt
	 ZAVdF010Z8JXhCxBey2nwXNWdZqW6q/oLpR3sTgdr5nXNb11SrgImDGQ0duD/6x3mc
	 bEmIayN2+VBD1vCVZV6k1h4xK+cUp9kJ10xM4+xYRr6TShRVOQyca+cTHXEMMqvbBo
	 K9US9gQNVzkhDb6mQVUk7DpjblrCCjZXkV9YJbUxjaKThBIrMA4u5W7Qv6/SbFuasZ
	 8CsnL58Xut+xA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	ljs@kernel.org,
	vbabka@kernel.org,
	liam@infradead.org,
	urezki@gmail.com,
	ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]
Date: Wed, 26 Aug 2026 15:27:18 +0200
Message-ID: <20260826132729.3281308-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Alice as co-maintainer for the Rust alloc module to share
maintenance responsibility. This is also a natural fit, as some of the
alloc code overlaps with the mm subsystem.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24ca91ce5d86..7daacfd70197 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23945,6 +23945,7 @@ K:	\b(?i:rust)\b
 
 RUST [ALLOC]
 M:	Danilo Krummrich <dakr@kernel.org>
+M:	Alice Ryhl <aliceryhl@google.com>
 R:	Lorenzo Stoakes <ljs@kernel.org>
 R:	Vlastimil Babka <vbabka@kernel.org>
 R:	Liam R. Howlett <liam@infradead.org>

base-commit: 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229
-- 
2.55.0

