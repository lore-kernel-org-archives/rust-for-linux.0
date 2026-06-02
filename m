Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3893DD539
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402528; cv=none; b=KDmi1DceSs79RowGgonh74TM0jU/iSHwzb7BezwjvIc7H09Ke/ipbO6s/xJPismrluwV1EwXD7vy+vOjdYz4ZNBngneovkdi/tY44JR64RmE69ra5Dk0rtaxl/s6Ar+kpJdXO6XQeLeSKLPVp3Es7c15tWDMbE8SGXKkESR0PHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402528; c=relaxed/simple;
	bh=8jFenrVpY6mPEQQtImkt6UJT4aM+INO9AtlA9KVwTDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLCc5LLtzlPeB21X9NIJi0Ovo+rXTw4BeFJt81Y2zTnAN/IsepXFO3NRP+cW3+hP8vYfMbEWOoJKiWx6467eF8qDcFhH64LS4YB2dJdB/DNoZdIsn6OCs1zQxyUEoLW+538iTW9vK069fIg5BzXgbWGOvJkHckJ1Yb5CgbWVtLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ozv7PPwJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ozv7PPwJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so3204889f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780402525; x=1781007325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39tomWq/D8VlQLXIgboVyRs7DGzptFPLmBA1BoR+QjQ=;
        b=Ozv7PPwJ9FYIacmMMOcbS84R4q9K8OnzDn9+g3QaNdDUdWjwLGXyChPwRIoUAES3Hy
         V5eIRwHMZnLPkSNB6hyYgMsgjlUZ+sT6toTN8dTMEnl6oNQS3oS8XBCN9vBUV7Z1Q5bT
         vSBTIVJ5434e+n8U/k9Kd6ETmGtDxhgvwdXdw1XtcqvNKjT7ibUioGzPQFwBG7JGjOXa
         rdmc99tY9eTaTFwUHB9CH5guXccEnoQA+5yE99wHMpNIvUeQ7Xyqvi7cDm0o9XoVjkEc
         VT7I1dR0mKXksROclQerxrH17iKlzw+nRWIGqQhFMNWNWQRnkVJnVs+5n9PfeX4Y04dy
         qFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402525; x=1781007325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39tomWq/D8VlQLXIgboVyRs7DGzptFPLmBA1BoR+QjQ=;
        b=MPx25WGdGq52m5eqqtR6YqcJ/05pFCKTb7NluKcg8lk9kQ9gln9F+pvOCzOeusgltN
         H0XPJQaU1YophoTBdem0J4nd73FpB2Rz1/OoAlHblUFB/83j7pMeh7fQI89bAiDLCJHy
         Jh8MdLKbWySNBQ1+taFHa3ItqyX3jMvcshX3UTiK9E//S0rhQot9gQzGg5df92P+vQMA
         Dq/MTzg9lZ7xezI0lPeFRwu/3VivwWmoHdvJyoP6YOoOrcJ8rJ3mO6WIR+GOE49Jaw06
         so5EXnTkdBIGo0Wzop/kgaTEzHyE7Cz4bUWybk+joJNReV0lX3SLKNjNKXGVTfnwMhhr
         x7cQ==
X-Gm-Message-State: AOJu0YxF1847nw6O3N8mZUNQN6bRA/xPKyJPQQ++1pnJnmGpi22n2Pt8
	bsWX8xjrnQhHQXnHSKQ2cll49C9HEleWLdzzuOM0I4oLkau/uOaW4TqR
X-Gm-Gg: Acq92OEonrGvzy657UtnKDUxmXgNuXORHBp4dsLy2On8S8HcHI6ZwwevxlqnpqWy4W1
	VZ6mjLuRplwy9VPhueO7UmucGMM1iDaeRzc3fr4KB6vj4p/7uGfPcoC/lJfhF6j1PWZRb1+d/lx
	0CCIksjgSSf15kf2PrA+RXxqckPkNj1o/MXybY8fIWIbI2S/xS3Zx8lsYBwdGwYz7bO2jack9es
	vBluKPVx4h7kkM/qOcI7XrVl53gowSRrMRFjI/rsr9oiCNOaNY3GT9YzQS8bOmadxScuz3gQomn
	iagR6h11VqOQLVHEYv4cuWKmErKq5o8TSVZiw6h1BRpBO5Twi5cb1MH/acKndJKpdFnuz3n6F/M
	ILXuc+5XP+Uvusqu1blCoFpIoWOOQIDl1LVLBd/hm6XIe3gPf7aumtjSvd61GUw5CJU+txCehI+
	OuqA1/lrz2SPP0AJCY6sdlnJiIW+z+aCtg3bDhp+q0v1XNqDpUSDendTA=
X-Received: by 2002:adf:f902:0:b0:43f:dc54:9493 with SMTP id ffacd0b85a97d-45ef6b5b602mr21478259f8f.21.1780402524564;
        Tue, 02 Jun 2026 05:15:24 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef354b5bdsm31879617f8f.21.2026.06.02.05.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:15:24 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH v4] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope" command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
Date: Tue,  2 Jun 2026 14:15:21 +0200
Message-ID: <20260602121521.11650-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601211850.3378-1-litvindev@gmail.com>
References: <20260601211850.3378-1-litvindev@gmail.com>
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
`find_include_sources()`, and `find_other_sources()` so that they can accept an
unlimited number of filename patterns as parameters for the search. Add the
`setup_name_pattern()` function to convert these filename pattern parameters
into a list of parameters that can be passed to the `find` utility via the new
`pattern` variable.

This causes `make cscope` command to generate a `cscope.files` file that
contains *.rs files along with *.h, *.c, *.S

Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

Changes since V3:
https://lore.kernel.org/lkml/20260601211850.3378-1-litvindev@gmail.com/

In V3, the functions `find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` were modified so that they
no longer accept the filename pattern as the last argument, but instead retrieve
it from the new variable `pattern`. However, at the time, I had overlooked the
case where the `find_other_sources` function was called with the `Kconfig*`
parameter. And after Sashiko pointed this out to me, I decided to rewrite it in
the current version.

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

Signed-off-by: Sergei Litvin <litvindev@gmail.com>
---
 scripts/tags.sh | 42 ++++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..41e38df96984 100755
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
@@ -100,7 +122,7 @@ all_compiled_sources()
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

