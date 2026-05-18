Received: from mail.tintel.eu (mail.tintel.eu [51.83.127.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0146A2E414;
	Mon, 18 May 2026 13:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.127.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109894; cv=none; b=dNdkgKoW4EVlhp5CI9A++jXY8l9zBj1sf+09AjJ/B6irB00zpSZzjS2GUtL4OY58UX6OdpB+XLTJyngvmSAeRfsnN8iYep7BhPvUf/530satoP4jjh7IpmS2G8gm04P3eu2fCy0N18lemU1t8hXPX9uUB9A+FqErsgR7OCHtbk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109894; c=relaxed/simple;
	bh=Hih2S2nt7LYD9RBX3nBmVG0fPLmC/LhrNrWAxq6h4ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HM3HQn7MNlv2zqKpCyjuFkqq/GsQ6L2nd6Aa2eLjbqJK0FupfXb5sNBxdG68tzEglJTdSgoajjBc+n1uTxAkier3GPnglHVYLcHm8LQUTJf/o5wOqmzDn/wN7Y+q6ZpymlXBiPFa+ErSpejr90yyGg0nTNkzPnrHICaFTzTb6Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux-ipv6.be; spf=pass smtp.mailfrom=linux-ipv6.be; dkim=pass (1024-bit key) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.b=CiSaCjyf; arc=none smtp.client-ip=51.83.127.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux-ipv6.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-ipv6.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.b="CiSaCjyf"
Received: from localhost (localhost [IPv6:::1])
	by mail.tintel.eu (Postfix) with ESMTP id 6198F40F9B38;
	Mon, 18 May 2026 15:01:59 +0200 (CEST)
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavis, port 10032) with ESMTP
 id T2Tbz4RLseh5; Mon, 18 May 2026 15:01:58 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
	by mail.tintel.eu (Postfix) with ESMTP id D0B0F49AF388;
	Mon, 18 May 2026 15:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.tintel.eu D0B0F49AF388
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-ipv6.be;
	s=502B7754-045F-11E5-BBC5-64595FD46BE8; t=1779109318;
	bh=grILkK1DAo/V0BW5OcSviMJwhFjmL/jjRdOxYHatJ44=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=CiSaCjyfQrb0Xv6heynNZYIvIYuqDMJRyZSjTkJ/Fw/KpTeeU6OrZCAoTAt3vmrWx
	 cLg+2Zk0okkAXB1wyuZGfyocm22UaO67Iuyov4HWHyp3OtlHwYPbaZi03VbTAH8c4v
	 eTBGsUK1tquDUeJN1dH57yi3+S3jUopbZ/aesmJk=
X-Virus-Scanned: amavis at mail.tintel.eu
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavis, port 10026) with ESMTP
 id RgzQ0JfSYEb3; Mon, 18 May 2026 15:01:58 +0200 (CEST)
Received: from taz.sof.bg.adlevio.net (unknown [IPv6:2001:67c:21bc:20::10])
	by mail.tintel.eu (Postfix) with ESMTPS id 6610640F9B38;
	Mon, 18 May 2026 15:01:58 +0200 (CEST)
From: stijn@linux-ipv6.be
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: bindgen: disable GCC latent entropy plugin
Date: Mon, 18 May 2026 16:01:57 +0300
Message-ID: <20260518130157.362555-1-stijn@linux-ipv6.be>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: IP_WHITELIST
X-Rspamd-Queue-Id: 6610640F9B38
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: IP_WHITELIST
X-Spamd-Result: default: False [3.59 / 14.00];
	RDNS_NONE(2.00)[];
	R_SPF_FAIL(1.00)[-all:c];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_SOFTFAIL(0.10)[linux-ipv6.be : No valid SPF, No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	MX_GOOD(-0.01)[];
	ASN(0.00)[asn:200533, ipnet:2001:67c:21bc::/48, country:BG];
	DIRECT_TO_MX(0.00)[git-send-email 2.53.0];
	FROM_NO_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	IP_WHITELIST(0.00)[2001:67c:21bc:20::10];
	FROM_EQ_ENVFROM(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: skulls
Content-Transfer-Encoding: quoted-printable

When CONFIG_GCC_PLUGIN_LATENT_ENTROPY and CONFIG_RUST are enabled, rust
bindgen fails due to latent_entropy being undeclared:

  BINDGEN rust/bindings/bindings_generated.rs
./include/linux/random.h:24:39: error: use of undeclared identifier 'late=
nt_entropy'
./include/linux/random.h:24:62: error: use of undeclared identifier 'late=
nt_entropy'
Unable to generate bindings: clang diagnosed error: ./include/linux/rando=
m.h:24:39: error: use of undeclared identifier 'latent_entropy'
./include/linux/random.h:24:62: error: use of undeclared identifier 'late=
nt_entropy'

Fix this by adding DISABLE_LATENT_ENTROPY_PLUGIN to
bindgen_extra_c_flags.

Fixes: f1385dc670fe ("init/Kconfig: Only block on RANDSTRUCT for RUST")
Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
---
Changes since V1:
* Correct "Fixes:" tag.
---
 rust/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index b9e9f512cec31..a2f13bae29b9e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -427,6 +427,10 @@ bindgen_extra_c_flags +=3D -enable-trivial-auto-var-=
init-zero-knowing-it-will-be-r
 endif
 endif
=20
+ifdef CONFIG_GCC_PLUGIN_LATENT_ENTROPY
+bindgen_extra_c_flags +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
+endif
+
 bindgen_c_flags =3D $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
 	$(bindgen_extra_c_flags)
 endif
--=20
2.53.0

