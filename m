Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73A3F44CE
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 08:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018249; cv=none; b=pf/iKcO8FYjYvcJAGgVI1mTw5MU0rFo13exuveDkmvrQMIB4702fF84NdmXwtVmvOlv1+JyrfwT2BbzaYvzdINxulyL+zb/yGPMeQkD9JWUvXethTcwyGN7XXR9exx6uqYYRP7Qgb4+nYOkbqWxpZ4UefFjCI5lVaD8Dmnt3QKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018249; c=relaxed/simple;
	bh=jyNi2uQN+yA/KxZs/JeOh8FJ+fAidxRw+r2ty9saz0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXk+FbNhCAzXVMgbxWQ77ItWq1VDUrbgkSK+NEJDlRKqNsmvMF0MXKi+qblNSgZskx7w4WCuw5biuDYZgdfguIDlutcerWTD2PLWZgMlYx224Y8Ryge3u9EX9NXwTaKO2d/hnfuwzSHnA1geX5vWQFbY9bcjKrmf2uFJIxRLVzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoHG1Zjl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoHG1Zjl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4758bd3731bso535191f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 01:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018236; x=1784623036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2Wd2Xk4XZ8QtjBdQAzkHYSxRYvpP0OLkJpmP7Ac0SQ=;
        b=RoHG1ZjlN9LgqdgchRqf/YaTilkFn0aSTzPr5wN/U5HfBN2utje0GaqlVq54eCOhJv
         QtrOgbOUE1xWkc6eNiGptCUfaj84r7C6ABNGYomMT63j7pb8AIX68WhY9+U5wSyDFIGb
         WAEPAYpgpXfmFNtua87OM5m8A3J5hgMkCVb3E/KrDGyZFwF+Ab/QLq1iH9kaW9DvOuxu
         cJhUwP56x44S78K/9JCE/XH+FMTrX3+Pe1s87HQxc3gnDzHNEZxNmrPQuZ+P3bwCOkaU
         XRDXhANlAj4kUjSaIcGRS1i+87/kms91l/YpENjhU5faNS4MKtjjfE1l3TQseMVco7BR
         gi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018236; x=1784623036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2Wd2Xk4XZ8QtjBdQAzkHYSxRYvpP0OLkJpmP7Ac0SQ=;
        b=CNzKAkSuVtnAkZXyNC/6wDny21POGoigOrKcnxSbvw8ulBVyAmGt+QIZA7o8od0Eab
         aMUlkv5PAMOnUz2n6Q63w+CMeng40HsaYt/nMJ7Y3mi7wQUhOtSfvb8uMRperplDwfi7
         m3m6goYnVCUZ7eds6ow2dU+BAddO7LDuDnkxaB5WBStgiEQBx1b5bIOhbRomqYpsyBWD
         OQx9lyaZvPNy1S2/d6yOAPkEfOiKiVW+wJkt0OQGk7mJKzvB00xor+mzU2oRbrWYI1je
         1d6tGV+m9bawPQdWnuT7VWvQ45YiN34iYCJ6kL036WNVbwr/YY5gIFCuyA8lwWvQ9lc2
         9YVQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+uSyB6ZgALysKawSMmO9gofWBF5HapDq4qj4EftLgqaTPLRZYHe8EXRbdVGX37bk373FPkry42JGleqnoeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOIcAbvHxm/g3DnJGg3+27q5JjSj8b/nfJ86KeJUEO+fUJLTMS
	+TwSuaUuiH64gZOBUWFoaGaEFy47xs4LPLaQQg86DMMmOQbXhF80MSRb
X-Gm-Gg: AfdE7ck08KdtaA2GZZHYjKCnPsqFc2bWgg7c3A/+utjOPS6pHkHSb9yMjFB7uMmAt+S
	wu4NqQiUaSsG6kpbSudiKPf7KwFJlEeUZPkJJZPB/xMM8+gl9J5H5OPeypMaWjOMyP2P3Db2WO4
	4x6o4spZy49i3sBUQhJrR75tU+d+xoLHqNgjgjf/kFXdUCHMHi0yfNXEh5oMJTkFCxfMKEwpH4q
	r5MYX5k8k33I/L4P2YN2U0f2jpCx3i6o4NGehPnRIRnNq/aZ62spGCRiT4is8NMTT6/+QRGoUKx
	f+KjxH6fv72TkABVAkOT+uJgnnymjrnmQWzUs1xGq1sAiT91/Lmd3VgnD8+wehVeo2KDL3myEaE
	YHijdObTuvMsN9R/JPaBeGxXya2X8rTSYaywBkrhDUCTo9v9Yid6xDTnczU5cmSPca8yl4eqaaF
	i0bMUz4/fX+Rp+lnU+B/4fIHHPSRs/uZAj9Qy8gw6c/ynw
X-Received: by 2002:adf:e19a:0:b0:47e:96f2:52ab with SMTP id ffacd0b85a97d-47f2dc85da3mr15640517f8f.7.1784018235606;
        Tue, 14 Jul 2026 01:37:15 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464c7c96sm6238308f8f.33.2026.07.14.01.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:37:15 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: ojeda@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Sergei Litvin <litvindev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] scripts/tags.sh: Add support for rust source files
Date: Tue, 14 Jul 2026 10:37:09 +0200
Message-ID: <20260714083709.69517-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
References: <CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

To fix this, modify the functions `find_arch_sources()`,
`find_arch_include_sources()`, `find_include_sources()`, and
`find_other_sources()` so that they can accept an unlimited number of filename
patterns as parameters for the search. Add the `setup_name_pattern()` function
to convert these filename pattern parameters into a list of parameters that can
be passed to the `find` utility via the new `pattern` variable.

Cc: ojeda@kernel.org
Cc: nsc@kernel.org
Cc: nathan@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

This is the second part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Changes since V1:
https://lore.kernel.org/lkml/20260705175957.4672-1-litvindev@gmail.com/

as suggested by Miguel Ojeda here:
https://lore.kernel.org/lkml/CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com/

- Add "Cc: stable@vger.kernel.org" tag
- Add missed "Signed-off-by:" tag
---
 scripts/tags.sh | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index c9dc2763a505..41e38df96984 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -46,13 +46,31 @@ elif [ "${ALLSOURCE_ARCHS}" = "all" ]; then
 	ALLSOURCE_ARCHS=$(find ${tree}arch/ -mindepth 1 -maxdepth 1 -type d -printf '%f ')
 fi
 
+setup_name_pattern()
+{
+	pattern=()
+	for ext; do
+		if [ ${#pattern[@]} -gt 0 ]; then
+			pattern+=("-o" "-name" "$ext")
+		else
+			pattern+=("(" "-name" "$ext")
+		fi
+	done
+	if [ ${#pattern[@]} -gt 0 ]; then
+		pattern+=(")")
+	fi
+}
+
 # find sources in arch/$1
 find_arch_sources()
 {
 	for i in $archincludedir; do
 		local prune="$prune ( -path $i ) -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
+	local src=${tree}arch/$1
+	shift
+	setup_name_pattern "$@"
+	find $src $ignore $prune "${pattern[@]}" -not -type l -print;
 }
 
 # find sources in arch/$1/include
@@ -61,14 +79,17 @@ find_arch_include_sources()
 	local include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
-		find $include $ignore -name "$2" -not -type l -print;
+		shift
+		setup_name_pattern "$@"
+		find $include $ignore "${pattern[@]}" -not -type l -print;
 	fi
 }
 
 # find sources in include/
 find_include_sources()
 {
-	find ${tree}include $ignore -name config -prune -o -name "$1" \
+	setup_name_pattern "$@"
+	find ${tree}include $ignore -name config -prune -o "${pattern[@]}" \
 		-not -type l -print;
 }
 
@@ -76,23 +97,24 @@ find_include_sources()
 # we could benefit from a list of dirs to search in here
 find_other_sources()
 {
+	setup_name_pattern "$@"
 	find ${tree}* $ignore \
 	     \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
-	       -name "$1" -not -type l -print;
+	       "${pattern[@]}" -not -type l -print;
 }
 
 all_sources()
 {
-	find_arch_include_sources ${SRCARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH} '*.[chS]' '*.rs'
 	if [ -n "$archinclude" ]; then
-		find_arch_include_sources $archinclude '*.[chS]'
+		find_arch_include_sources $archinclude '*.[chS]' '*.rs'
 	fi
-	find_include_sources '*.[chS]'
+	find_include_sources '*.[chS]' '*.rs'
 	for arch in $ALLSOURCE_ARCHS
 	do
-		find_arch_sources $arch '*.[chS]'
+		find_arch_sources $arch '*.[chS]' '*.rs'
 	done
-	find_other_sources '*.[chS]'
+	find_other_sources '*.[chS]' '*.rs'
 }
 
 all_compiled_sources()
-- 
2.55.0

