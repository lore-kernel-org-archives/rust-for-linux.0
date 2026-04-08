Received: from va-2-37.ptr.blmpb.com (va-2-37.ptr.blmpb.com [209.127.231.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457B34EF03
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 05:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775624768; cv=none; b=Twk/AvTiq9AuaPNWG3jvXCPSwYHJeFdiQ8nOLDHmmu9MefQo3h+vt0vxY9fhPJkdwYyhR6ErNYzM+qy8neuyvh3SV1sAv7PPbCrN+HZ9wzvnL0vQOFeit+K4l5r7CK4lVg69mz//BsfD3CSriHiYKvsekPIihsO9OKUUWuXKomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775624768; c=relaxed/simple;
	bh=g4C6FFS8LYr/x+aDGV/cZYMvYOKUJPL9jr/OjEbqbN8=;
	h=Mime-Version:In-Reply-To:Subject:To:From:Date:Message-Id:
	 Content-Type:References:Cc; b=bcp2ZQaHG5o7C8hyhiCWFMkASTJiw2H4/A8g60Ij9aOBjwn4mruyPu9yfrykr+WgDtddxbgmFxFwTe4l2QBIKBoPbkUAF74D/V3q8sgXoc5VD5NOPCxkAqDf1ajasVKMr9hxRH+y0Q6uJKoPGIHxP5B8kOpy8H1wlyu8/wm8f7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=pAgVrtbd; arc=none smtp.client-ip=209.127.231.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="pAgVrtbd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775624754;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=p3boRhsQNWfdjnCLQ95YMlxElU1EztUHBdJUM4Vp9K4=;
 b=pAgVrtbd8mPmV17tmojxzIOZEfOgfl8cumD5a9EulU+3yg/l68CKfpAgrfSImQqN9pnXYz
 cXTp1LJFnZCKVI2bRIXbVv6UDZM19mt+4u2rTSw70GE4b9JoovttYmDPOp6+NStR8B7zl9
 83jey6t89qrcmAs0ucqu2aEpk7UHDDKngAJyLWvySv+eW786Rj0J7V0UWMCljD/jWx89A9
 CSN5TVuSePTbVL7gU9M4YHpzr9D9pcGVSp+4dvdWgYjAjt9kOmgfqlclVLS3bMwrnCeisv
 OaDTXQZaMFcMUOOp4nBVKCGbaaIMiWdEIfA7pia9mZwg72qjvaiYNFrRQyEozA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Ben Guo <ben.guo@openatom.club>
In-Reply-To: <cover.1775619061.git.ben.guo@openatom.club>
X-Lms-Return-Path: <lba+269d5e230+4cd28d+vger.kernel.org+ben.guo@openatom.club>
Subject: [PATCH 1/4] docs/zh_CN: update rust/arch-support.rst translation
Content-Transfer-Encoding: quoted-printable
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Apr 2026 13:05:52 +0800
X-Mailer: git-send-email 2.53.0
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Date: Wed,  8 Apr 2026 13:05:43 +0800
Message-Id: <0e367d0dc8d74287dee1605a48ea80159fa464cb.1775619061.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
References: <cover.1775619061.git.ben.guo@openatom.club>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, "Ben Guo" <ben.guo@openatom.club>

Update the translation of .../rust/arch-support.rst into Chinese.

Update the translation through commit ccb8ce526807
("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Signed-off-by: Ben Guo <ben.guo@openatom.club>
---
 Documentation/translations/zh_CN/rust/arch-support.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Docum=
entation/translations/zh_CN/rust/arch-support.rst
index abd708d48f8..f5ae44588a5 100644
--- a/Documentation/translations/zh_CN/rust/arch-support.rst
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -19,9 +19,10 @@
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
 =E6=9E=B6=E6=9E=84           =E6=94=AF=E6=8C=81=E6=B0=B4=E5=B9=B3         =
  =E9=99=90=E5=88=B6=E5=9B=A0=E7=B4=A0
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-``arm64``      Maintained        =E5=8F=AA=E6=9C=89=E5=B0=8F=E7=AB=AF=E5=
=BA=8F
+``arm``        Maintained        =E4=BB=85 ARMv7 =E5=B0=8F=E7=AB=AF=E5=BA=
=8F=E3=80=82
+``arm64``      Maintained        =E4=BB=85=E5=B0=8F=E7=AB=AF=E5=BA=8F=E3=
=80=82
 ``loongarch``  Maintained        \-
-``riscv``      Maintained        =E5=8F=AA=E6=9C=89 ``riscv64``
-``um``         Maintained        =E5=8F=AA=E6=9C=89 ``x86_64``
-``x86``        Maintained        =E5=8F=AA=E6=9C=89 ``x86_64``
+``riscv``      Maintained        =E4=BB=85 ``riscv64``=EF=BC=8C=E4=B8=94=
=E4=BB=85=E9=99=90 LLVM/Clang=E3=80=82
+``um``         Maintained        \-
+``x86``        Maintained        =E4=BB=85 ``x86_64``=E3=80=82
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--=20
2.53.0
