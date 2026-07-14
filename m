Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E5737F012
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 08:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018028; cv=none; b=s4dJdC+may6UlE/Bmf/qGKkbI8cpoOX14yqpzDFOFa2UlgfmnQq31aHamprlAQOkHveb8FOeKZ7TKH2To/VuaH1NgbE+zQR8va2WqWKQGODvruaMbSxPhXcr7CnVJlVbbbZAPH6dz3Y0Wa17sx1i4konlPX7zWoZN4m2MArPPrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018028; c=relaxed/simple;
	bh=IHW0jrVYKirRz4xFnRAvekmWCpqi2k7RyAf7Y5W4PyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1DrCpN+Pt5Pxo66C6IEhWxD+yLp2MxdNj/Zz/MUsOMpCnJXLqp6ZdcJitjl+wEyHIsQ9eka/ds4u3mr1lZrglhD7Z6h5fpcBMp9bH8fTcsxRFPQ3oFSNa93CJ+BNctgXtyQ3YIORvug5MCL++O5D/8ls3fbVSeKjtwgT8DK1Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRNHBawA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRNHBawA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso6224555e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784018020; x=1784622820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dN43QeMKt3opRlURLs9WAJqq1Kw1gcGP8C53HZV1wz0=;
        b=ZRNHBawAzRsgDKjWIYbkX/L1AqJpGi259NXywqFklR5avA8/pAhNQPKxfaa7liKDGY
         NV9ytgt92T/KO1vMDsKuWiBcWT9AtNz/q4ge3CeGVXADTLhavvQiF9NVejobzMQizcy+
         OSYECwuCUW4yzY99N0TT7xKej9FCV+CvkR+uyeaFsaQupoT92k3dVzY9RvibPF+ZrP+k
         PnAoa2EWiPB8TPl/VQMTjpbig2UNMZ7cS8uNkIMfR+3jOe8IBchyDeaoSngsoWYBhj9N
         GKF0e4AZ0teyjC1rpeqSD2d/+7s9DVcmuPxCqSuEKn4MaUjLkoWCwiF302XoWJHMFDu+
         PJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018020; x=1784622820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dN43QeMKt3opRlURLs9WAJqq1Kw1gcGP8C53HZV1wz0=;
        b=QDJQB7uG8wD8hemL1oBs8BRWn6llJXB6Mt+3O3n3wOPbGuvyq4MT2Eqi1OiAegnI6Z
         3qK5XGmN0VCnVOuw0UjNmRy83QqntLWGYDNJ0AVKWt3s0eoZlCSdImpK76RIisCB5qq/
         RyJjeAK3ptLSnv9Ruhml9wf0ZtLReSkSPtvkMvKe5zp3Xu6xULNjlUecsCVEnIZrR66e
         s8nCNZvMV09gOT0g9RQPKrBMeK94ID/IbISaV2r6w9UHXAZXuRkNCktJjEiqNOOJRoej
         p0Ey2SUWXX3+IZ+75xbEVR/P06xU0jaimxHK/qaPelVPpwKYSjdWIMcmipM+ZekCIsvq
         41oA==
X-Forwarded-Encrypted: i=1; AHgh+RrYxKDDSKvhOtWYcU61otDRM6Ni7t1zDi/lcJ3Dq7bbN7PBe9Y0TJNwKQwLt8QAR5zS3upTWyIPZioYyA7A6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYnAI0ia0VZ3qhzonqQGRJshl25jjMYObcmrgfKzo7bd7FBsjV
	OPQVmMl3YnNl8YllrscoV407S4alHtPYHYmxCFpsw3fNLvyZRDnhdyLbNnr3BkXP
X-Gm-Gg: AfdE7clp5xTrMDI6+12I+hXHtN0MUdsg9AsEd6i1nPFmOXy3rm2uYqAO1HYM+edSZVp
	Yr7xCDdNvPogd36QjRP7T/QxNYacNuDLInhQrrnefg+bmvS/9kBFLuM0I47JvZSqrnRZzo+EtsQ
	SH1bLZlGQWBHDXU1skfb4CLjuCWU+OzaR2nDUpgMG/UYtmW8Ye+Ik6UypQitg8uP4yNDtMJnm/N
	qwJhi/1OG13xeG6MVeUucAwmZhyL5Xn3ocP+KzLOfn1VGuA5oTYLCHY07dj2NHbEezqlLlqtSfM
	CaOYSaIrvvZD4095alyS7DrSXd7aMqnL+z8BJSaRm8SDFybgUzUCeG91GAZdmyJ5Ds40rsondoc
	0e/8g+K3B/nuRwUICsAmB85Qr38KdaCG2J6dBMuquIHv69spMXXgxCvqFrnGOFLG0ffb/t7wBt0
	B2PdhYPGiokvPWf4nZ5KxQtqxaAbDsnsZI2g==
X-Received: by 2002:a05:600c:1392:b0:493:f753:24e8 with SMTP id 5b1f17b1804b1-493fed59338mr109265975e9.6.1784018019335;
        Tue, 14 Jul 2026 01:33:39 -0700 (PDT)
Received: from localhost (a89-182-201-216.net-htp.de. [89.182.201.216])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a33a926sm52933245e9.15.2026.07.14.01.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:33:38 -0700 (PDT)
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
Subject: [PATCH v2] scripts/tags.sh: Prevent binary files appearing in cscope.files
Date: Tue, 14 Jul 2026 10:33:31 +0200
Message-ID: <20260714083331.69482-1-litvindev@gmail.com>
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

When executing the command `make COMPILED_SOURCE=1 cscope`, the resulting
`cscope.files` file contains filenames with the extensions *.rlib, *.rmeta,
and *.so.

To fix this, modify the regular expression in the `all_compiled_sources()`
function so that only files with the extensions *.h, *.c, *.S, and *.rs are
accepted.

The issue has been introduced by commit 4f491bb6ea2a ("scripts/tags.sh: collect
compiled source precisely") which implemented the parsing of compiled sources
from *.cmd files instead of using the "find" command.

Cc: ojeda@kernel.org
Cc: nsc@kernel.org
Cc: nathan@kernel.org
Cc: stable@vger.kernel.org
Fixes: 4f491bb6ea2a ("scripts/tags.sh: collect compiled source precisely")
Signed-off-by: Sergei Litvin <litvindev@gmail.com>

---

This is the first part of this patch:
https://lore.kernel.org/lkml/20260602121521.11650-1-litvindev@gmail.com/

which I have split into two parts, as suggested by Nicolas Schier here:
https://lore.kernel.org/lkml/akVkIrcpNxZrrfii@levanger/

Changes since V1:
https://lore.kernel.org/lkml/20260705175936.4653-1-litvindev@gmail.com/

as suggested by Miguel Ojeda here:
https://lore.kernel.org/lkml/CANiq72kHbVQfNrum5D2a5sCd3mFQHNtigrQxP1WW=YcggxA=WQ@mail.gmail.com/

- Add "Cc: stable@vger.kernel.org" tag
- Add "Fixes:" tag
- Add missed "Signed-off-by:" tag
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 243373683f98..c9dc2763a505 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -100,7 +100,7 @@ all_compiled_sources()
 	{
 		echo include/generated/autoconf.h
 		find $ignore -name "*.cmd" -exec \
-			grep -Poh '(?<=^  )\S+|(?<== )\S+[^\\](?=$)' {} \+ |
+			grep -Poh '(?<=^  )\S+\.([chS]|rs)(?=\s)|(?<== )\S+\.(?1)(?=$)' {} \+ |
 		awk '!a[$0]++'
 	} | xargs realpath -esq $([ -z "$KBUILD_ABS_SRCTREE" ] && echo --relative-to=.) |
 	sort -u
-- 
2.55.0

