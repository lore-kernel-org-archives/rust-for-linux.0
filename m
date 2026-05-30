Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3238643B
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780124798; cv=none; b=JoHqRafgD3WmHgmZZRTYRc/bLarQ/emDT6muFAZgL0f47Ues3M/0K6uQDOPjl4xjJyzb1jOW4tN/QFc/56EGxlcT4f7ip7ZKg3yOUIYnFb6keCzNHAo+Zpn4XF+RV7omQB5bwUlhbBW0E77J7U+E2QUk7AFs6fXnkZ6Aen3RPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780124798; c=relaxed/simple;
	bh=2N1CfdEjIp9UZ5olaB3KnwZIGIv8BcFHL7Wp9Xuj+6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M03sVASfCCJWN+y8LTg5cGbFpYLv2mP9LxTNnwbOJJRDryomtlnUSXUC7DkaP8BesQz0C1+nkhcpiHMXz6kjrycPX4ckwbWWkYZRhll2IRIgfiT1Bmdxw/uVRdFQczQqp85gLQryOwCLlShSyE8eVlKRqTL52GJXKU87B041VUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnTzG5Lz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnTzG5Lz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so701906f8f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 00:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780124795; x=1780729595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ikebuPUf41dJZeKHSamjbBCXgK2fFPq++GSjJDx1ew=;
        b=XnTzG5LzssubPnDy6/PMDnf4163T/4pHOfjcZtcxiSSooI1ToHk4OwQhmjj+PXZHJK
         +j91bxOU/CGD2ev6MyEKMIAKn4vcMPt584HfFql/TynbOBJ4oXqVftfNHg316zPbIu69
         REYbna1Z8ukTsQxIeZ944hwH7FzWmMQ908Z37fhmb964kilH9vIEEj66+w0myzG/qNa/
         UHrva0r9JmwD9PnsEQ2GjmTfbUyJrQZBpL5PY2lXM+n7IN26dfjbCrG/0jIKdqpZk5/Z
         pjzJ6Rfu/2lp1r0AN49BPyHDdUezkAmTm95k3p3koJsK37LBLHLhnIaU9GRAJNptCf5W
         xy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780124795; x=1780729595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ikebuPUf41dJZeKHSamjbBCXgK2fFPq++GSjJDx1ew=;
        b=eJ414kYElRBkaMcWubPax+cn3MKUWJwTdp9UP4AbtR0/2BxxMS12aaoCNF0vGZBwAN
         h2qmescorBxELNPBykcSB3yjYSk2dub5R53as7z7wk0B+t+5MPNktOy5EtUpDVFUG3EE
         czFVxyXwAFawfnPkf5Z8m2mGNQGKSlnmHEpZRaM7Cclvlqd+FDEvpbh+IaaqNA5rS1jS
         64FlrOWnFFNfqqfrN3eex+1E0Gicg7Fupe2L4Bys+B81fIneR7261V/xq7q11E/+/oxe
         VfehfLRsPFLjLDbKfJoBT/Kkn9mIdQo89HVBvUI7OaBZpJqvoXH9+k5++DOP7rF0Txvd
         Spmw==
X-Gm-Message-State: AOJu0Yye9gDF8S7oQagKmUeFUKi8VGnQNtOSO4vSYCHs7EnqsO1Y4UMB
	os9OEHnWeR49soAf/K4w6RhFpoBM8AFh+b5pc0HuQUGoCyyQLFmOAVyKPffdPzPJ
X-Gm-Gg: Acq92OHMk/GMF5BpHx+Ah62R2GTe8+QmyF8oWJ+IkGLixjkCCizikFQgIj0W8/3n/WB
	HMFH41nZ+3XH4nUYmrRGbM+WoGaYbln5goW0Ss6Os0OIdEzdaXmEncoTUnWSXd5E/fCD9JPKtQi
	weB8KhhOCKEp2w40Tfe422uDuB/Xcy3ZqhdDgDIT1Z6Ri8Y0lW7BM6e4vQjXn4BFwSOy+g+//d0
	w3Y1Lo8ebCiN5r9yYG9FfTz0YYMvLgMVIVV7ZcwnJkpkl/WGZAkx5WS/o/8iG9T4OZBiFtQ+GzY
	VeeR+P11lfHppGsFmw8NVJ8zgvBgcLZPkGGdtD0IUOC/63JThLqLHjTCVU4hGp8gwW8FA56Q0BL
	TzoQgSybk1yWbNQyZSj7Kz/jjM68DSRU8KfNg02zoG2S6A8/O2nGg4bIl0zhvVLFqM+24u9Nmqh
	oVU4k+vtRHNfwKrPoWHwTpYjJN0qZ5s3UbhQzcRM0pPXBVHei0FUBZ3dU=
X-Received: by 2002:a05:6000:4388:b0:45e:de0a:178e with SMTP id ffacd0b85a97d-45ef6b55c09mr3549373f8f.20.1780124795448;
        Sat, 30 May 2026 00:06:35 -0700 (PDT)
Received: from localhost (a89-182-201-132.net-htp.de. [89.182.201.132])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef34a0403sm9170895f8f.6.2026.05.30.00.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 00:06:35 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope" command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
Date: Sat, 30 May 2026 09:06:31 +0200
Message-ID: <20260530070631.14955-1-litvindev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When executing the command `make COMPILED_SOURCE=1 cscope`, the `cscope.files`
file generated by it includes filenames with the extensions *.rlib, *.rmeta,
and *.so (taken from *.cmd files, which, in turn, are generated from *.d
dependency files by the `fixdep` utility).

Signed-off-by: Sergei Litvin <litvindev@gmail.com>
---
 scripts/tags.sh | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..f6642bb0f8ee 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -52,7 +52,7 @@ find_arch_sources()
 	for i in $archincludedir; do
 		local prune="$prune ( -path $i ) -prune -o"
 	done
-	find ${tree}arch/$1 $ignore $prune -name "$2" -not -type l -print;
+	find ${tree}arch/$1 $ignore $prune -regextype posix-extended -regex "$2" -not -type l -print;
 }
 
 # find sources in arch/$1/include
@@ -61,14 +61,14 @@ find_arch_include_sources()
 	local include=$(find ${tree}arch/$1/ -name include -type d -print);
 	if [ -n "$include" ]; then
 		archincludedir="$archincludedir $include"
-		find $include $ignore -name "$2" -not -type l -print;
+		find $include $ignore -regextype posix-extended -regex "$2" -not -type l -print;
 	fi
 }
 
 # find sources in include/
 find_include_sources()
 {
-	find ${tree}include $ignore -name config -prune -o -name "$1" \
+	find ${tree}include $ignore -name config -prune -o -regextype posix-extended -regex "$1" \
 		-not -type l -print;
 }
 
@@ -78,21 +78,21 @@ find_other_sources()
 {
 	find ${tree}* $ignore \
 	     \( -path ${tree}include -o -path ${tree}arch -o -name '.tmp_*' \) -prune -o \
-	       -name "$1" -not -type l -print;
+	       -regextype posix-extended -regex "$1" -not -type l -print;
 }
 
 all_sources()
 {
-	find_arch_include_sources ${SRCARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH} '.*\.([chS]|rs)'
 	if [ -n "$archinclude" ]; then
-		find_arch_include_sources $archinclude '*.[chS]'
+		find_arch_include_sources $archinclude '.*\.([chS]|rs)'
 	fi
-	find_include_sources '*.[chS]'
+	find_include_sources '.*\.([chS]|rs)'
 	for arch in $ALLSOURCE_ARCHS
 	do
-		find_arch_sources $arch '*.[chS]'
+		find_arch_sources $arch '.*\.([chS]|rs)'
 	done
-	find_other_sources '*.[chS]'
+	find_other_sources '.*\.([chS]|rs)'
 }
 
 all_compiled_sources()
@@ -100,7 +100,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.54.0

