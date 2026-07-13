Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB072D47FF
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 01:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907228; cv=none; b=MqyHYvvP5Smru+ZJlYG6bXqozaYwdWx+ISbSa5V1X6uVf8YY4OFixMAPJtIOzyIeJ6HInjp2z606nJl4FHDhgVXHhPRDSXyKtJKEg4t3Y/3Jw7FRBqH+Srk1PvD7HteYFbIBPuEJzPgsK7oayI99Vp+2xhR5keKqLOQe+V15th4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907228; c=relaxed/simple;
	bh=/Ktcp+l7uLL0G7v+LT6g3m7YyM4cEFKDeTbDpmY1Onc=;
	h=References:Content-Type:In-Reply-To:To:Cc:Date:Message-Id:
	 Mime-Version:From:Subject; b=CQYrp+Ja5sS1f3fc9RXw9LqiG8a8kjsW8E+x/9b8lRyXfu37bpKlcvF0hETeqU3HYrO6eW6lfDhlHOWC61LaKlrgdhQJmWOsX38yexbFAF+hWQvLun8t11pk5bZGMcCCUA5cObJo0NIvCFKg9f4WORJZKi5HM+/Hq75zCXud/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=0efXTiMH; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="0efXTiMH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783907216;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2q3S4x1/dODBPkXhKWUY3JUjUdqqwInmZuDQwkLD+Bo=;
 b=0efXTiMHMhk3ll2cbN0t5xnqnncbaJICn8qRjvwjyCTa6SQF1U2/Kxmz193lPkeY8+zULO
 39bF5/7DPsacsORjImr48byKYZ0h89oJY1ggqSxoP0q1+K/QzO4jPvq2bf6w5p0WHV8Ix2
 vGirfI6c1P6XqTjwzhvZPg12aEyYeT3QcfF4KnEYNJivglcAKlbDtxdWlD1bhMTOA18LTY
 sEF1ZN8ngjnZbiFxUWuyZWrFZaY20EPwHW9oftUU6dI1cs7YASQXIyA/bRY1P8any4FnJu
 QSkQ+gwDtmnZ6fzeH0/CLu3+tRZr9rXi7pE6AOVYl+TQWqpq39VdROr0cO6rnw==
References: <cover.1783905132.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <cover.1783905132.git.ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Date: Mon, 13 Jul 2026 09:46:35 +0800
Message-Id: <ea65566150d1b7797051ac2e9bb2b8725f041513.1783905132.git.ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Transfer-Encoding: quoted-printable
From: "Ben Guo" <ben.guo@openatom.club>
Subject: [PATCH v2 3/4] docs/zh_CN: Update rust/arch-support.rst translation
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Mon, 13 Jul 2026 09:46:53 +0800
X-Mailer: git-send-email 2.53.0
X-Lms-Return-Path: <lba+26a54438e+b5466e+vger.kernel.org+ben.guo@openatom.club>

Update Documentation/rust/arch-support.rst translation.

Update the translation through commit 3f70ebe63858
("s390: Enable Rust support")

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Ben Guo <ben.guo@openatom.club>
---
 Documentation/translations/zh_CN/rust/arch-support.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Docum=
entation/translations/zh_CN/rust/arch-support.rst
index f5ae44588a5..0ca4be6e176 100644
--- a/Documentation/translations/zh_CN/rust/arch-support.rst
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -23,6 +23,7 @@
 ``arm64``      Maintained        =E4=BB=85=E5=B0=8F=E7=AB=AF=E5=BA=8F=E3=
=80=82
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        =E4=BB=85 ``riscv64``=EF=BC=8C=E4=B8=94=
=E4=BB=85=E9=99=90 LLVM/Clang=E3=80=82
+``s390``       Maintained        =E5=BF=85=E9=A1=BB=E7=A6=81=E7=94=A8 ``CO=
NFIG_EXPOLINE``=E3=80=82
 ``um``         Maintained        \-
 ``x86``        Maintained        =E4=BB=85 ``x86_64``=E3=80=82
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--=20
2.53.0
