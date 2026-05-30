Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C463955DC
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780131523; cv=none; b=iObpcIMZx4WrwJhISb0OWlKEwrMo/Lr+p64IoAJyvNE/TczLJMFvpHt2MO3bZKmV/ULfg5JDF4Uv8xoOAHYVrgw6v/aMLLMDTrXKepl1RUv7h4ueqq5Ns7ZJIKl5F2ILksVBX0iHgXPUOurRU78j2vjVK+Oka/vBpQJ6F6Hsqfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780131523; c=relaxed/simple;
	bh=XRJSf3ftIv03/qui+8SqaGNF84m2IEKZj5de66SRlhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ky6MXhuzKDugBtRfq53xBepo+RxCA4qGa4HM/IsUe6KXcrD+VC++M55FEmHgCsQ5K427w2yeqNZ5klidB5ecsgy7SL5wuP7LUT2uKZaOCVlwyiM6f/E1MsT4DgVrhCB/wejpdJRQMoSYzGXGtYP2JyjFOWBX46u+a/y+QujBK+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB6ncJX0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB6ncJX0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eeba68948so1781822f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780131521; x=1780736321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOj7K5QUJdDs386HYdmbDYGPD84wYNIL17LY6chhIIM=;
        b=cB6ncJX0i0r29NR5EVFGzi6yHHAqQ8DqatXGIqEll6m4fpYBouGtgZyAN5n65DNWna
         GeEVGhiT3Qm1KCEAr8K8/p5RVyErlYlBCyZRnNVc1euJFGv8rSvqdFWdx9vx3j5h1vxM
         pOERyOXpcRb/qAGUzbo9XZF4u8w/6tNqCH5379csBqv7tly9FxnG5u49rJJ0SDZaX0UX
         MU0ejIESXIiWuFLTQql8EKPJ8/PZinfF+nY7oIn7nmuNf8HZlijvgjqjMo9U0BGZAB7O
         IC1KR8AeRusNtf7rHXbZ1C0Eh1AWZOfOdlJUNRCkOJzyXvq0IxUxhUZiskv8ls4u7ujL
         HJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780131521; x=1780736321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOj7K5QUJdDs386HYdmbDYGPD84wYNIL17LY6chhIIM=;
        b=FQ4HQ0LAz56YCO7EEf3FYaYQcYTsHM9oX/9EPVf8AvsA8XMW2kqk91/9treCI4X2Lq
         hsDzFgo4LgwcioKrVUJCY1xnEB50tXY2F8TlT5FHMGoAFdtrpunUe3XoWfeFdsnN2RLI
         A1e/8NXIrr2uKl0hCCK9tw+Lf/tNROI7AK9/SkfSQzXbWT2C5Q/WhtfVwg27KobIFi7Z
         d90RIx4zK8YGQyau4cV6mlCIg4HQ8/qAY1M1Kp2ophDUoMpAv97MMHZ0rpeedlBiIN0D
         iF8PrlogHw3OvVQcHQu6ei//zEtQE9RpbOd9mtgDXQHxW1qpKDOtySvFgrK6xxbYMx0c
         LVTA==
X-Gm-Message-State: AOJu0YzkVBWUDegmKka0CrEC5YFxwUoeURrk/zfR5fM5jGhv1FFvP7ds
	+D71qi7K9l5CDBzQa6Z7+CZZm6TQQpljwjmuBfO4Lwb1F5rre94ginRl3/Tk/R4K
X-Gm-Gg: Acq92OFCe3OgDCH2x0sv9ztJlknRkCDhDhJDqWLhAeUTbReBY+zKkuwdceHGlimr1sk
	CeI3K8Ne1XACzR4/aWQiXtiXiw+HLT7lYUtCSYGE6T0ZtnF8UTs/9Ap+ozY4GCJuN/sqLGMyZxc
	4OBqDN1eB2oO7nm5y/gMqfG+zNww0nTVcemByat9C498f4SeMP9LQE3rwnbdgsQQHYMMN/wZJLj
	HsnlncPemaNDs2Pv5ULYgAIO/UzCDxZO5APJIp+ytN+YzZoYOr1ZE07X5+fkSXV4cbQ6SVveH8x
	xAGQZzxd1TySBosOLvnY1+iMUd8vTVmI0OSfMcF21OCMx0yrIQuPcIeg3SJRbcr3dg14zJzpbpa
	QzS5ZMalcXrZiVn9FuI764GP7rkLEJNymvmrVLiliyod/kdm9+UeRcPGVgNKgjFPEYgUf108wUY
	YnC6LNKdzs+HQKlo7TqGyJuI7Z9qP9BnMSmD5FrZeYq8q9CwdOcIzMeCk=
X-Received: by 2002:a05:6000:2213:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-45ef6aec74bmr4896282f8f.5.1780131520404;
        Sat, 30 May 2026 01:58:40 -0700 (PDT)
Received: from localhost (a89-182-201-132.net-htp.de. [89.182.201.132])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef3559645sm8925833f8f.26.2026.05.30.01.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 01:58:39 -0700 (PDT)
From: Sergei Litvin <litvindev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	Sergei Litvin <litvindev@gmail.com>
Subject: [PATCH v2] scripts/tags.sh: fix "make COMPILED_SOURCE=1 cscope" command ends up with *.rlib, *.rmeta, *.so filenames in cscope.files
Date: Sat, 30 May 2026 10:58:21 +0200
Message-ID: <20260530085821.19689-1-litvindev@gmail.com>
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
 scripts/tags.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..9a58fed694b7 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -84,15 +84,20 @@ find_other_sources()
 all_sources()
 {
 	find_arch_include_sources ${SRCARCH} '*.[chS]'
+	find_arch_include_sources ${SRCARCH} '*.rs'
 	if [ -n "$archinclude" ]; then
 		find_arch_include_sources $archinclude '*.[chS]'
+		find_arch_include_sources $archinclude '*.rs'
 	fi
 	find_include_sources '*.[chS]'
+	find_include_sources '*.rs'
 	for arch in $ALLSOURCE_ARCHS
 	do
 		find_arch_sources $arch '*.[chS]'
+		find_arch_sources $arch '*.rs'
 	done
 	find_other_sources '*.[chS]'
+	find_other_sources '*.rs'
 }
 
 all_compiled_sources()
@@ -100,7 +105,7 @@ all_compiled_sources()
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

