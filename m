Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C5E280309
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 21:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780348761; cv=none; b=bEavMdQzm0/4P4QEP0sOFIDu19nusDTt346gR/5isjoNaaI38Tndn6kCPBCXWX61lmyQvPSHAtt1Gbx++EEv5gqW10qcWdcxhCQtMW4YPcouWA8m3G/gUA7E5jDGLbKXACk3bmKwx+DOb2zvQyNx6sb8wPNZze6Oak7kE6GPeMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780348761; c=relaxed/simple;
	bh=IfPIiZW0gCIHgOF0/+IIrxBC8ZG3r9xHJsxK0+0F0kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQwkhrNFcWL7dERoQWNGM31ROIqpkTWfbhrZGZT6dmi4EDl1cn1p11f/x48D+3GlEjSY0SbbB3sZ5lVuZzc0o1Y7UJsJXgCOI/pRln3BAHl7cDKfmqRjlPHGE0achdxGS/YKsOStAi1JYhGc0ASK4RBsNaANoRKEtSyX9eh4MBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o3ipgcmU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o3ipgcmU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eeea039ebso1986552f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780348758; x=1780953558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuVHAspRZOzT54Q3CeGYfhWxBcncLtAKm4G7e3ZGvNU=;
        b=o3ipgcmUluH9ud6bWumsrmuDdH9Gtfcr7BDcN1KYANa/V7Wyrm0ZVKSPv/9tWDyiPf
         4wt8MHAgTn2cIT3CPJ+zDvhzP6OeLiSMnGVEcUMK2Urcxi0Mzdj439ocdQqDtvOFBb3D
         YSdRJfc0PKf4SLJhXWipVSQr5uSt3RgB48vKJfH2WzinHUmvphwqPqEioWQQduieJ/x4
         B6JmYc9s84jSJAuZzTqA+lqeEth4SUky09gKVQRykYU2MsCu2pEAT0FxVj9iNhvr9Vr+
         Z75yW6cD0C5m+fDElR2DU+dpqjFAcyud7fGJ3g0NAwB1jw4nv4i4RSV2hQdqxh2HlAOG
         5hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780348758; x=1780953558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JuVHAspRZOzT54Q3CeGYfhWxBcncLtAKm4G7e3ZGvNU=;
        b=ngWFROVtUvJvo3vpjgoOLk37DcBTJjihp3YuUJY/k+6x0XW1J+QFMtoWuACV9REKcR
         8yP09UjSjXSxveEJXnGH6V7+VXFe9qwp4VqCcfaK6+B/cllBKlUm/ziJnrwu26Ki8x/U
         l11/99SrY7MqDwoplqGkfz73rTNJtGWRYe6QXIi7csn99DhZKQLOlLOgphamAdDoaCJW
         AMYnEmIbHpZzk/tVBWu+2t2K2CNZhGzvyK4JMvl8xohadhen6XZNloaNgK556Izw8atm
         fGtfECcv0KPbgEWZHgIh4Y4J+jPqyd5nA9vCUnzGXl8Zsgnls2Ts7QlXA9DgyuKApyPY
         tUjQ==
X-Gm-Message-State: AOJu0Yxi/nRimEL8zb1VWUDqXZazA+QPegwuStVsWvUghnZQtX3GQBr2
	23MRAUm0xQPd7VE4eRoCZXrZWAUtcd/2Wa0TxKik8KgTmzHyOZpvGB/U
X-Gm-Gg: Acq92OGcA+PjE1oQUm2LKWe3XGHVxOg9eBtKlPYTZYRKyVhMwsZxC22a3v6I9nJwpMl
	bsIHe41akkDiVLofJS4gVqHDFKwHO2vs1ONLUC0sHGw1CezkhMnoJs26vGTlY25Eb1jUYlSK5Xg
	8f5WY+TI/rzpWOxAKeANTzrBK6Gef493BVAuT9zcwHXqfp59Yxn9owGABKa1wvzoCDTfVYghozb
	VC/tnHMf1+iF9+I0uJlcL07RNOTgTLLQ2Gonicfo3woEUt7m9CkM9Yqm84zLbEHQE9lcHzwXnNr
	20Got2ln+9QtQQMBXoIF4uQlFRJFWkWsSwKcJYxl6aJFEKLxmjGRZhauH+i93Vv5SX6UXKUKYIh
	YrFGoo1i/7TOsYjJKv+Xdl5dYt7IjtytvGM0vdQjhTkNPbXsyC83SRobpQC59hJC8OC92VrdDOF
	ghYBsNL7yG3lTo++BsQ36+UCfw3AyoFvWYXDoHmWd9yn+6YsIT3em6XaU=
X-Received: by 2002:a05:6000:4b02:b0:45f:1bd:a053 with SMTP id ffacd0b85a97d-45f01bda1famr19783269f8f.1.1780348757529;
        Mon, 01 Jun 2026 14:19:17 -0700 (PDT)
Received: from localhost (a89-182-201-205.net-htp.de. [89.182.201.205])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef3587072sm28494538f8f.34.2026.06.01.14.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 14:19:17 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH v3] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope" command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
Date: Mon,  1 Jun 2026 23:18:50 +0200
Message-ID: <20260601211850.3378-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CANiq72mBkBxGk4CbTrjeNYZ5ZUsD=wVfLVyP2Bcm_v9BExQaGQ@mail.gmail.com>
References: <CANiq72mBkBxGk4CbTrjeNYZ5ZUsD=wVfLVyP2Bcm_v9BExQaGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PROBLEM

(1) When executing the command `make COMPILED_SOURCE=1 cscope`, the
`cscope.files` file generated by it includes filenames with the
extensions *.rlib, *.rmeta, and *.so (taken from *.cmd files, which, in turn,
are generated from *.d dependency files by the `fixdep` utility).

(2) When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

SOLUTION

(1) Modify the regular expression in the `all_compiled_sources()` function so
that only files with the extensions *.h, *.c, *.S, and *.rs are accepted.

This causes `make COMPILED_SOURCE=1 cscope` command to generate the
`cscope.files` file that contains only files with the extensions *.h, *.c, *.S,
and *.rs.

(2) Modify the functions `find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` so that they no longer
accept the filename pattern as the last argument, but instead retrieve it from
the new variable `pattern` (analogous to the variables `ignore`, `prune`, and
`tree`) which includes *.rs along with *.h, *.c, *.S.

This causes `make cscope` command to generate a `cscope.files` file that
contains *.rs files along with *.h, *.c, *.S

Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

Changes since V2:
https://lore.kernel.org/lkml/20260530085821.19689-1-litvindev@gmail.com/

- The functions find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` have been modified rather
than having their calls duplicated to avoid redundant directory
traversals (suggested by Sashiko).

– The regular expression in the `all_compiled_sources()` function was improved
by adding a lookahead anchor (?=\s) to the first branch (also suggested by Sashiko).

Changes between the V1 and V2:
https://lore.kernel.org/lkml/20260530085821.19689-1-litvindev@gmail.com/
https://lore.kernel.org/lkml/20260530070631.14955-1-litvindev@gmail.com/

- In Version V1, the `-name` parameters to the `find` calls in the functions
`find_arch_sources()`, `find_arch_include_sources()`, `find_include_sources()`,
and `find_other_sources()` were replaced by `-regextype posix-extended
-regex`. However, as noted by Sashiko, the `-regextype` option is a GNU-specific
extension; therefore, in V2, duplicate function calls were introduced instead.
---
 scripts/tags.sh | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..be7c2ffd2d4e 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -12,6 +12,9 @@ if [[ "$KBUILD_VERBOSE" =~ 1 ]]; then
 	set -x
 fi
 
+# sources to searh
+pattern="( -name *.[chS] -o -name *.rs )"
+
 # RCS_FIND_IGNORE has escaped ()s -- remove them.
 ignore="$(echo "$RCS_FIND_IGNORE" | sed 's|\\||g' )"
 # tags and cscope files should also ignore MODVERSION *.mod.c files
@@ -52,7 +55,7 @@ find_arch_sources()
 	for i in $archincludedir; do
 		local prune="$prune ( -path $i ) -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
+	find ${tree}arch/$1 $ignore $prune $pattern -not -type l -print;
 }
 
 # find sources in arch/$1/include
@@ -61,14 +64,14 @@ find_arch_include_sources()
 	local include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
-		find $include $ignore -name "$2" -not -type l -print;
+		find $include $ignore $pattern -not -type l -print;
 	fi
 }
 
 # find sources in include/
 find_include_sources()
 {
-	find ${tree}include $ignore -name config -prune -o -name "$1" \
+	find ${tree}include $ignore -name config -prune -o $pattern \
 		-not -type l -print;
 }
 
@@ -78,21 +81,21 @@ find_other_sources()
 {
 	find ${tree}* $ignore \
 	     \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
-	       -name "$1" -not -type l -print;
+	       $pattern -not -type l -print;
 }
 
 all_sources()
 {
-	find_arch_include_sources ${SRCARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH}
 	if [ -n "$archinclude" ]; then
-		find_arch_include_sources $archinclude '*.[chS]'
+		find_arch_include_sources $archinclude
 	fi
-	find_include_sources '*.[chS]'
+	find_include_sources
 	for arch in $ALLSOURCE_ARCHS
 	do
-		find_arch_sources $arch '*.[chS]'
+		find_arch_sources $arch
 	done
-	find_other_sources '*.[chS]'
+	find_other_sources
 }
 
 all_compiled_sources()
@@ -100,7 +103,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.54.0

