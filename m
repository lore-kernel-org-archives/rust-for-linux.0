Received: from zebra.cherry.relay.mailchannels.net (zebra.cherry.relay.mailchannels.net [23.83.223.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39649337BBD
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765984114; cv=pass; b=lUo9N7GExvRWSIxacRKqvNeX8l4Gylymefu3fR59sf3GO/o0gxq/bYOhJytnpjH0h7E4ODUH78UxKyk+Xogr9OT/9n4qQvGhM+OvO2qIs2/GmD1psynBSGbBhvbTuBbvKAf80XMqquhhAVOOSJUUrP6g6oUKWgX7PRDtt1pqPho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765984114; c=relaxed/simple;
	bh=6Md7KQeCbNjLK+AqrRmAVn4VYkKnYrlJ2CddE4BFgZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZbjZlUlENsL+MzvTVCBpuoqPH1zAE/QM6AMib0BBd09hyLVHkM2SjHEuOJOVsDSccJYn5AQePEUTBvTRKp0fHz0tr1fyAkOxc+Kxuw0IXjlLI2AsXcnd/QpmjPA7vJDxYV0/sN5Wn8pvY5LzNDIqz1mdwfM8x4WvMiNhhiz7wzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gotplt.org; spf=pass smtp.mailfrom=gotplt.org; dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b=Yp/eIskR; arc=pass smtp.client-ip=23.83.223.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gotplt.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gotplt.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gotplt.org header.i=@gotplt.org header.b="Yp/eIskR"
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 104587820A9;
	Wed, 17 Dec 2025 15:00:17 +0000 (UTC)
Received: from pdx1-sub0-mail-a255.dreamhost.com (100-108-123-201.trex-nlb.outbound.svc.cluster.local [100.108.123.201])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9681D78216D;
	Wed, 17 Dec 2025 15:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765983615;
	b=kT0bkbc30i2UQ5VnlySsDXeJcH3A3PFxjyh5GgmMpBjTrE2u+hYxvndU6032aTBqudhhtv
	Gxwisvdx2QGFdezlFUqsll84oWA3UjtsSIZ66/nPUAmb9iLwH2tWBDvat10CGsHwL1RfE9
	bHmVD9HxsRRwYNfz1e4E9VvSN5mdbSVGPF+a93YY+78mulAeAR0KWTEDymGhT+HSRVH3vK
	1V/Xol316lFzGge56R2gCK2N/Ls6UahFqzSRJdPNjklD1WuJYLPt0rtuv4/cgIoN0TQPZk
	KekjyBvG86ymuZTEruNQi75pKJJhYvo12Ukgl2IXcmfIt5vUGy2aFMj+qG1ILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765983615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=iPgqG2OlNCoOC93C05c/lTGWd3oiXdj9Z6x6+VHkXEQ=;
	b=n2ZfCBy70w9si4y4+6Lct97Gmjpnd6YUkhB0hS07koNsGvP64io+XUk7lbHiFISrH37Kku
	OV8wmPw6Fy1PcAn7B64wyxzAgcflvD+i/dO6MSLz7eayUGnsUgBkmu5qM8wNLsPMotXyp9
	uS0balDaqrsgme07/vaZWSqDBqb+OX8nloMMt1Ajjw+u0B+tpAQOpbHlBV6IiNTO8bSB8Y
	Lfrv+c2daVSsmC4vNgKeEeHRoDGSRM9vPww0lcW1iR7mJxvfoSU3gs7uDg2pRERoaqHsYD
	Vl/uVZVmmIhKOnVS/pMGQMGrVb2d6U4pYkGpevCPhdn09pE/FxG0KZ/OYOLSTw==
ARC-Authentication-Results: i=1;
	rspamd-6ccd5b4cc5-s8m8f;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=siddhesh@gotplt.org
X-Sender-Id: dreamhost|x-authsender|siddhesh@gotplt.org
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|siddhesh@gotplt.org
X-MailChannels-Auth-Id: dreamhost
X-Harbor-Harbor: 23a97f8e7b0bf0de_1765983616722_707573571
X-MC-Loop-Signature: 1765983616722:4162901822
X-MC-Ingress-Time: 1765983616721
Received: from pdx1-sub0-mail-a255.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.123.201 (trex/7.1.3);
	Wed, 17 Dec 2025 15:00:16 +0000
Received: from fedora.redhat.com (unknown [38.23.181.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: siddhesh@gotplt.org)
	by pdx1-sub0-mail-a255.dreamhost.com (Postfix) with ESMTPSA id 4dWcRL6Vjcz106t;
	Wed, 17 Dec 2025 07:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gotplt.org;
	s=dreamhost; t=1765983615;
	bh=iPgqG2OlNCoOC93C05c/lTGWd3oiXdj9Z6x6+VHkXEQ=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=Yp/eIskRSBmuMZhzRwjNv7J2eSq/8CUD4EI/n7bJEe7YvViIaRPk63m5XhVEKBr+E
	 TA6n3qK5bJzNtD2zS0gQHgdHj1qzEcz1WOL9b/q65ddxdY8QzRhinW6cMNl9xNd3at
	 LF9MqmhZjTl+ug+qOXZg7qjSq8ZXbMryhhisu+UkrEP4hzpoMhI6Pnu+zzAB4H5MNm
	 Li8npEFuPWPS7XcXkxDCARcsnyr9bZWcHqm2GZ4nUzdQpwDoyjRbBcg2lXexHd+1NB
	 H3l05bGkW2R1duPSjpwUwQafTEbhfKtlq5YCaFZr2n7G7wT6sRlYM60ez5TRvJp2fo
	 jz/xHoydEYWCw==
From: Siddhesh Poyarekar <siddhesh@gotplt.org>
To: rust-for-linux@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>
Subject: [PATCH] rust: Add -fdiagnostics-show-context to bindgen_skip_c_flags
Date: Wed, 17 Dec 2025 10:00:10 -0500
Message-ID: <20251217150010.665153-1-siddhesh@gotplt.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This got added with:

  7454048db27d6 ("kbuild: Enable GCC diagnostic context for value-tracking warnings")

but clang does not have this option, so avoid passing it to bindgen.

Signed-off-by: Siddhesh Poyarekar <siddhesh@gotplt.org>
---
 rust/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..4dcc2eff51cb 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
+	-fdiagnostics-show-context -fdiagnostics-show-context=% \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
 # Derived from `scripts/Makefile.clang`.
-- 
2.52.0

