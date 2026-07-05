Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE430676E
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Jul 2026 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783274407; cv=none; b=SBge7vvHAgfgpOCA7gq31zwk6fE40ZlhQBU8/HpT2brrW2mr0aULR4vBa3wB+8QgffLADQBA8ymC6NvX/UeNZGeIlbacysAsKCgBhg4Gn8sng5Fd3IQMJWpOpupPDun9lQF6frmxRWq7jWrZS4HtQCSpsZ2A8h7vsobGRuKxSKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783274407; c=relaxed/simple;
	bh=pcUt4ECBHp8fwLieJAcIrWj20xaV1v0BfHd+NcNrWjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmS2aF59FnRLXndTudbxNfVBbuCcBSzXu6J3trE9o80ZlvBGbSdOj3WjPIe+dOs3RZJI3b28sVCC3Ikny4xx5iMcP4sALXIULOSMNSRBOHjkdToDvfhUFW1GbAD9E/vRHKp5aUHISnLoNLZfhcvVO+JSQzEf+yugH6fNrZqMYUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psAaykJR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psAaykJR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so11962725e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783274401; x=1783879201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejKKZA+gzkTcRsPeUIx3jem6/jVbmODgcUaRcC0r+t8=;
        b=psAaykJRcXCQ9sSZbFL7GZiQuk4uW5zOK96wRH4ZnKimyJXT/ptXCJ2QLhYzoEpsx9
         Ih2caGJrHIZrz2vgcwbbZwJMEpS8qa0wJ5gRwfrcmbjJn9jgZZ8AF/uLjHSeeU1foxlZ
         TxCNTP8AHO83dmxGrJvgNShz1G/UClNvgbjvuL6FCti4SWKnrE5oJjytROPMFfB22lh0
         wP5CoTBUNXn+yeCD3IKTsDXG6pfOVmwVvDV0etjMqJwxln7AreYz64QWP7SCoGa6f14a
         xq7+HxYT6whcDVn6crxYUQmMXwlHGPuvDMdqfSfq5z4zpsrYskKGSjs7dU+B/k+Q+0n4
         hbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783274401; x=1783879201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejKKZA+gzkTcRsPeUIx3jem6/jVbmODgcUaRcC0r+t8=;
        b=e9SWp/uUKsbdPB6PSu/r6IIQrtBPBFCkuubtKLyLsWIZOOIvxngiEiWLezTp0mVr1/
         Qviog9oIbQ2MaxeEga3+IPXClMHjXZkvsA9feojVt8SoZTcW/J8Us9xR1OnHt86c2EJb
         oTRbQ/2/vaWKCoPc0wkf47Uhz00f5Hqd6zuZhrz1XqL0TlgYomo+0St11moGEfXCHzTZ
         DIBuIFtFFR3C0tNslupp8hB1FTADkeFzsJXEWUre/tByvDG9K2LSQ374xY31rq+C+kke
         Ce8PHM5G3fRVAoFucihw2wcJ31Dj4U4jr22LtofB1XX9vQli/VstTrwoKBPSM8Bag7J0
         n7Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rqd4iL/bNWZ+k4s378Lse/E3zXIaB/z+aj5EcP6y3tBHH5QABfnhGvontfTiBPF9EI/irxuyphh3XeNHMVYMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFmN/mCzt9CO65gyy1dFvPXg4gLxExi70JTFHtmioJRrJb/NUS
	chT1ctQ6xIEqsnDrIodrE1lXhBz5i4VLeFY9NecpDPySXgcgO98AnCQoOcaPDkk2
X-Gm-Gg: AfdE7cl0nOhRerhmikux/H4ATHS0Qtk/cLaIgf4/bbjt5MvK8CjNE8WYrS3ZnN7iL77
	4NtIaSJFB3ENQbZvdKxas48YT+HxZbb3Qhn68zBYHHG8b0Pw6W6ufTw2q88bmzj9/Okq5Nbh+Ii
	L0q60pDHWlYr01C5fz3ntSmbQlanoeEeTR6CU9JERySargJQALd0/GY2hqnDJ+5THvCNRSe359g
	+WdkIvNzvry27boQNnZ3x1neFWw16X1hNk94rif1Me2mHROG15CxDCj3KGJ2ejJr3IhoyoM94hV
	mzAV7U2C8yxT6W77EF/tefowgjQmDQLl6XUI0VXIqTcp5LNJIQicCKnrjX7bBRPtTdO8MXj2RP0
	KsEuebW5G+Y52Yc6Euju2zLpysEAn+7Fm4BvWcfLFXlsK8PfTj7gztNHsTD/MVWuEtLmuvyUz76
	uNjGTKLhVqJYKuZ9oULoMBi6ugPsqqRrzOAA==
X-Received: by 2002:a05:600c:358b:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-493d11f13d7mr99093575e9.18.1783274400696;
        Sun, 05 Jul 2026 11:00:00 -0700 (PDT)
Received: from localhost (a89-182-201-232.net-htp.de. [89.182.201.232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47ad69519c2sm17994734f8f.37.2026.07.05.10.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 11:00:00 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: nsc@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH] scripts/tags.sh: Add support for rust source files
Date: Sun,  5 Jul 2026 19:59:57 +0200
Message-ID: <20260705175957.4672-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
References: <https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PROBLEM

When executing the command `make cscope`, the `cscope.files` file generated
by it includes only filenames with the extensions *.h, *.c, *.S and not includes
filenames with *.rs extensions.

SOLUTION

Modify the functions `find_arch_sources()`, `find_arch_include_sources()`,
`find_include_sources()`, and `find_other_sources()` so that they can accept an
unlimited number of filename patterns as parameters for the search. Add the
`setup_name_pattern()` function to convert these filename pattern parameters
into a list of parameters that can be passed to the `find` utility via the new
`pattern` variable.

This causes `make cscope` command to generate a `cscope.files` file that
contains *.rs files along with *.h, *.c, *.S

---

This is the second part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Signed-off-by: Sergei Litvin <litvindev@gmail.com>
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
2.54.0

