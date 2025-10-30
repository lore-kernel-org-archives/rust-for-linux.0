Received: from sg-1-33.ptr.blmpb.com (sg-1-33.ptr.blmpb.com [118.26.132.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F0E1A3BD7
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Oct 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761815282; cv=none; b=InmJfKpVQ6Tq1SAfGs+LEDidTVjlf4Adjwk0aSQiEvw7F+pi3Xgopfhwtu99yHriDbypyanPp1Rtl02MK0b/5CyNHsCFEsUzpWnYBAaVezYwa/3ktjQrjz2TWgKapJUhSLQecdVcY/BABKoJ/N65V9xDVVJk4OF8zbWxHCjTX38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761815282; c=relaxed/simple;
	bh=N2nhDDoVSkyl5VIjjrCqInu8j5G4Jln8Mq8+CrZWkW4=;
	h=Mime-Version:To:Subject:Content-Type:From:Date:Cc:Message-Id; b=RHxmGUmEF+b4DJToNFwZqPOul3pStkEfP9kNhmiC6o6ApZL9CYFt/PtuQ4FztHpjnmFrPImvQ7kyXvZowb29SaZ9CQ9GaRrFoZwGK68rle0t0WjqN7R0gRKY0G1O87+Sw42M+B9ELx+yicOhL7kAbeKJkdUwHQ0X1ZdyI/IJ6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=Ov0OdZ0M; arc=none smtp.client-ip=118.26.132.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="Ov0OdZ0M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1761815268;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yFLfJAIRB5GB4c3FauNgnw4VQrFIdM3sS4dAA1umawc=;
 b=Ov0OdZ0Mfeq6J2VNsJhzXMV36tJojCvos6+Bqc/r1GwSFEFwJzzbHrcUnIsRBLz+3Jw8RU
 Z3o0HDU3fTDHSuIXOmU1qunYYjq/rbOcLaTEKW7BRyMVxR687Nv9sQmkLSYDW42LjfVVce
 lU76X3719Sjwa81An82kcvuR6/xdvqmHVNw3p+kHefQzVlB290lZeP3tgOHHnCbrZMIBE3
 kUVpHKqJVUvj+z/9jhRCPk7NI+DDZGv5BmWrIKyShIT5cXgBrECGHJxQDXF9qCgSPDkceP
 fLmL76vwTT2SO/1Mfy3IYNqQh0QIo2lZ1h9tK9MqRkY6KS9rmPfOQcFJkKHLeA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+269032ae2+31a8be+vger.kernel.org+chenmiao@openatom.club>
To: <lossin@kernel.org>, <nathan@kernel.org>
Subject: [PATCH] Makefile: Remove the product of pin_init cleanly in mrporper
Received: from nyaos.localdomain ([114.249.194.57]) by smtp.feishu.cn with ESMTPS; Thu, 30 Oct 2025 17:07:45 +0800
X-Mailer: git-send-email 2.43.0
X-Original-From: chenmiao <chenmiao@openatom.club>
Content-Type: text/plain; charset=UTF-8
From: "chenmiao" <chenmiao@openatom.club>
Date: Thu, 30 Oct 2025 09:07:36 +0000
Content-Transfer-Encoding: 7bit
Cc: <hust-os-kernel-patches@googlegroups.com>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, 
	"Nicolas Schier" <nicolas.schier@linux.dev>, 
	"Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, 
	"Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, 
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	"Andreas Hindborg" <a.hindborg@kernel.org>, 
	"Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, 
	"Danilo Krummrich" <dakr@kernel.org>, 
	"Masahiro Yamada" <masahiroy@kernel.org>, 
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	"Tamir Duberstein" <tamird@gmail.com>, 
	"open list" <linux-kernel@vger.kernel.org>, 
	"open list:RUST:Keyword:b(?i:rust)b" <rust-for-linux@vger.kernel.org>
Message-Id: <9500284ff72ad4e4dc4799fa5392a7bbfdd34f3b.1761814593.git.chenmiao@openatom.club>

When I enabled Rust compilation, I wanted to clean up its output, so I
used make clean and make mrproper. However, I was still able to find that
libpin_init_internal.so in the rust directory was not deleted, while
all other corresponding outputs were cleared.

If this is an intentional design, I will drop this commit.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Signed-off-by: chenmiao <chenmiao@openatom.club>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b34a1f4c03967..f43a70413a6aa 100644
--- a/Makefile
+++ b/Makefile
@@ -1590,7 +1590,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
 		  rpmbuild \
-		  rust/libmacros.so rust/libmacros.dylib
+		  rust/libmacros.so rust/libmacros.dylib rust/libpin_init_internal.so
 
 # clean - Delete most, but leave enough to build external modules
 #
-- 
2.43.0
