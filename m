Received: from mail.tintel.eu (mail.tintel.eu [51.83.127.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E222655B;
	Sun, 21 Dec 2025 08:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.127.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766305642; cv=none; b=umFyZmP0IYQnZeYhTyteVSydwLMKb9FOzaxjaYU8A1qspgk/CqSxF5oWmON7QlZH+aHVltHHQVowqoXJQE7q3SWckh+oHLdv1EED6pp5KBhZpRMysdOaaIf1LVfU750bRXmnayG36lk0d9AEwaTxpTwS5JWNjzcw+KZ5sBIM7LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766305642; c=relaxed/simple;
	bh=iEhEzJ5xFlAhlUSQa/eQtpyAlEdM0fpySyrbhSifybs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/Gdymn6hxBS5ZjhcXthNzK5VrXr48HlW7U3Jetrqmu2u3GnJqc+QEOW4P0GfuuHJOI0S+iuFWDBiDeG/gpyWHpi27O1nZgMFha38zJ1RXZdIxLCzDGH8F3kbxp+6/hK84c5IiQEUpUIHCyGwMhX3zaC3rgFBYFti1zaTIVw35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux-ipv6.be; spf=pass smtp.mailfrom=linux-ipv6.be; dkim=pass (1024-bit key) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.b=M4HHh+Fu; arc=none smtp.client-ip=51.83.127.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux-ipv6.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-ipv6.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.b="M4HHh+Fu"
Received: from localhost (localhost [IPv6:::1])
	by mail.tintel.eu (Postfix) with ESMTP id 11D8B49A2568;
	Sun, 21 Dec 2025 09:17:01 +0100 (CET)
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavis, port 10032) with ESMTP
 id ILLuPJ2rWv2Q; Sun, 21 Dec 2025 09:17:00 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by mail.tintel.eu (Postfix) with ESMTP id 8D911445C7EC;
	Sun, 21 Dec 2025 09:17:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.tintel.eu 8D911445C7EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-ipv6.be;
	s=502B7754-045F-11E5-BBC5-64595FD46BE8; t=1766305020;
	bh=RNwWaNhUGr+yzSm/dAMvUqK1oR6wsINK0iBajk3SNog=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=M4HHh+FufL0BRN22WVsMf+US8Ca03fopL4SoWCJ/kSNO464LOSToXR4zuCKrZc6pw
	 ZZEsO5HKumJLnSI5/TNMMOc77HWCfaKDSvGQlzKEkpu1hkLLFB0I3D/+BBgiGGjxQr
	 +swxWhCN914hiW3o4xFaGfetmlhRFyCjzxBKVBoQ=
X-Virus-Scanned: amavis at mail.tintel.eu
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavis, port 10026) with ESMTP
 id BkJ_2h9WkYOD; Sun, 21 Dec 2025 09:17:00 +0100 (CET)
Received: from taz.sof.bg.adlevio.net (unknown [IPv6:2001:67c:21bc:20::10])
	by mail.tintel.eu (Postfix) with ESMTPS id 1EA71445C6B1;
	Sun, 21 Dec 2025 09:17:00 +0100 (CET)
From: stijn@linux-ipv6.be
To: ojeda@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: bindgen: disable GCC latent entropy plugin
Date: Sun, 21 Dec 2025 10:16:59 +0200
Message-ID: <20251221081659.1742800-1-stijn@linux-ipv6.be>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: IP_WHITELIST
X-Rspamd-Server: skulls
X-Rspamd-Queue-Id: 1EA71445C6B1
X-Spamd-Result: default: False [3.49 / 15.00];
	RDNS_NONE(2.00)[];
	R_SPF_FAIL(1.00)[-all];
	R_MISSING_CHARSET(0.50)[];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	IP_WHITELIST(0.00)[2001:67c:21bc:20::10];
	DIRECT_TO_MX(0.00)[git-send-email 2.51.2]
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: IP_WHITELIST
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

Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
---
 rust/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704d..633dec548f6e0 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -412,6 +412,10 @@ bindgen_extra_c_flags +=3D -enable-trivial-auto-var-=
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
2.51.2

