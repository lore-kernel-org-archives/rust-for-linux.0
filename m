Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795802534;
	b=xZCKjXeS3p6PqtqgzWBJ/AQjsIdIAAammddNdz2DL3l359FBHuEXsBrXh2qoHUn0/b2A
	 odOymv5yWpXS2tz0LHlY0ZJ0pDE+bqdd6bYkgjQcRvvFvvIPETKu150NmhZgHRKOyZY84
	 YtPqpLL2ttnfJlSJVLQkJu4S2stoTHvtmpUoRLsn63L7NMt4cyDXcTw/H5gxj2W9KirBy
	 ATbzxTA6aJ5HdK1FENMlDpn6l/SZZiPH9y8y4PB/fsI2ctMp4JwwFKloGvg5EELe5Q//C
	 sYuchuPpfrljNR8im76F6o38fJddpt+tnqiPuq6yJX9M5CSyeuhWzRD/2ezLAsau1IA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802534;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc:X-Mailer:
	 X-ZohoMailClient;
	bh=fhLeRvwp84/mebgvqnu92UQhmHvpOrWS0lHc3JizXnA=;
	b=D4r9Lup+1vMrP1X+3wJiCu+l+oqoI2PYINGN0iG89cksh0zRDuOpZ1MXuK51yPqVeLaL
	 EUkzNvaHZ80oVZjFLA60SfmO451IaMe6z6/ByY27N0iYoG/R4bf3QTVhywI72Tbh4AySG
	 Kzc08Yrx01sONRtKDCRZFEQNDAyhKeK7gN8mTDTgGNL/naBLfhdWTTvKmfv8I6vQ/eYXU
	 72BfDVfxt8whIq4ly7L8Ruy/sACciei6rHhbDbFNC0r72MZ7jmklqQvnzVe3caG3+aeOa
	 KRayIYTeeDuR9Rnt0I1fgZ5MjrJbQ6p6hONPYg4VuhTz0n8XiibXQ/ksVp8RoM8mP0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BHNafiFi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B16606A327;
	Fri, 27 Nov 2026 18:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B16606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BHNafiFi
ARC-Seal: i=1; a=rsa-sha256; t=1795802505; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nd3ld/H4mKzop3hl1dgRun8clAkOHV+SXdHWpmwo8v0JX7YQb5fUMwe1su+ilu5e+epGOHUy3EByhSymIqv65oDfZen5EcLmAkRJJdqvGC/9QLtOiHtPbyzZDDwkxreaitQqfD++/9HfPysqYkYBGx7KAiof/1e/FR192R0lQWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795802505; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fhLeRvwp84/mebgvqnu92UQhmHvpOrWS0lHc3JizXnA=; 
	b=ASgb4wfiLxcct97Vp3LxcrIT2pDi9sXrhVKD4nMkXW+b0KHkgDPKTg7mmPZXmNC8I2MJWlnA+YVCeIdZRFMT1mUEtba4SIJH5oskvt9i+Cui/nOwylQd4B1t/+xjIvQpwUKriqqTkRbfBoLBQT3hBstcqXHDBoo8LtNtj/sZOE0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=BHNafiFipjsYc0uJ0tL7Fjncpl4NX0di5IuOaYXwdAi78CsKJpfT/boG1Pik002XPOZk99WeL/lydiG6JN4QCKmy8qSJcSYrm/YyLwFNQ/yjDrPVGVudrQs90WCj4lrtooKuyQOckv2i0jFsbSbt3OHbUWRSL1biXKXLdmpshCw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=fhLeRvwp84/mebgvqnu92UQhmHvpOrWS0lHc3JizXnA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795802502679285.5021177051765;
	Fri, 27 Nov 2026 10:01:42 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH RESEND 0/3] drm/tyr: KUnit tests and fixes for the firmware
 parser
Date: Fri, 27 Nov 2026 15:01:36 -0300
Message-Id: <20261127-tyr-fw-parser-v1-0-8aab2a711f9b@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: dakr@kernel.org, simona@ffwll.ch, airlied@gmail.com, 
 aliceryhl@google.com
Cc: Sami Tolvanen <samitolvanen@google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

Tyr's firmware parser has no tests at all. Assuming well-formed files in
linux-firmware, it means that the error paths in the parser are not
tested. This is a bad combination for code that directly consumes
userspace data.

Patch 1 adds a KUnit suite for it. The suite builds a well-formed image
from named fields and checks that malformed images are rejected. This
suite obviously can't cover every corner case, but at least it can be
progressively expanded.

The parser also accepted two kinds of malformed images, so the gap is
closed by patches 2 and 3. Patch 2 rejects sections whose VA ranges
overlap, and patch 3 rejects section data that is larger than its VA
range. Each adds the test that fails without it. Sami Tolvanen had
already fixed both of these issues downstream.

This is based on drm-rust-next. Tested with KUnit on arm64 under QEMU,
and with IGT on an RK3588 board.

---
Daniel Almeida (3):
      drm/tyr: add KUnit tests for the firmware parser
      drm/tyr: reject firmware sections that overlap
      drm/tyr: reject firmware sections with oversized data

 drivers/gpu/drm/tyr/fw/parser.rs | 379 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 379 insertions(+)
---
base-commit: abfb640b2374e26de8ff81d488c39d8254db538e
change-id: 20261125-tyr-fw-parser-073e351dc7b6

Best regards,
--
Daniel Almeida <daniel.almeida@collabora.com>
-- 
Daniel Almeida <daniel.almeida@collabora.com>

