Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA317D416
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 21:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713563444; cv=none; b=NcoW6X8jTPKGU5OpWH4EN57onUaA3xCeMc76M6dxQ/iZPjO4hvyA3qmLzprk9o1ZtC03t4qp5DffZ4ioJ56x3iY3Q8sLVjHo7Nd4vXkv3zJt+lnPwAJAX3s+Dgon5+VQzklTP+KCLkgOmVmIMsxa4YhC4i6sq3XEz1aZ1FK2EkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713563444; c=relaxed/simple;
	bh=Tc16FHR45RKf0ydp978Efliey52/Z2SAyOGtvizfonk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jPEVu+SqOhuc6KrA81WfaQc4WHLRuh4bdZG3yAuelqCiUmaffrGQmCw2/gPxoiezjAQ3U2U+hbVHArNsO+AWPmBYa0L/3yb6cQYk6oi6pXRcCNVko3WposEjC31bo6bhV5p+CD//5OFLmo3WIOlb+ci77YaHYGr0QcF+DamkNJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erNwU5w2; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erNwU5w2"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-369e3c29aedso11542455ab.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 14:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713563442; x=1714168242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+AmZKnjv20a8KAjLdIHJZBPYGkol0Lw6LGWW44vgeI=;
        b=erNwU5w2kNZDDkab6+dPA+rdatoGOjm0XFlq4msdnHtcIH1OP3p03fKBj2doU/Xse6
         Wlub8/qalXrsbBhfSqT/NoLmoE2k2737HfOUBrGb1lJJ6DUGq2KmlUoXqN4xXtbKrYp2
         SC9Pvjq8zE+jeDug0xm3rEXoKPSjA8GLcGg66EnsvzTlPUA8Z/TvA82NYnKrVQFaotUo
         w2L3pNE+QSvzEvXCLq9g5r0fzB24l0GRd1Ox5Ipc0E0gHIUxCKvOKI/RQE39FL/YxroM
         pWlgBHBtpom/9o334InJO4G2CScoFextTWF7fup+w6iNNePoyr2ho238dKqPzjbOEGUp
         TFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713563442; x=1714168242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+AmZKnjv20a8KAjLdIHJZBPYGkol0Lw6LGWW44vgeI=;
        b=lwwy6zBiTC+K1Jb1qgg/zVUXF+ZlxBF3k6+zCIGWaKOpcov8/DIJYkAntGk4T9bSPv
         ypIu54VTwoH2IozvfavDVgsffs/fwNduv3FGYlr3LxzBeQBvNPUeiuznkwezdKAci59X
         actCEBs0/0z2cH9kprl0jEG14rAvOxGZjQZfAs/0ifu9IBx3eI6ZmaCXJNpWKnkps8xJ
         dRQcjtMgZzduRydSNf8+VlyBTfAwSGQxWGruR2K+TOcAqLAizAvXwKqTT/lnDdpgPEr/
         3VuCISTqPI1qwCvkvbsioamd19lD/dsWv/geAHZObOPymdempBCy+QGtWpUfggGBNpY9
         lTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBIreNSH8S6Vtfw+zldZhv8oKRNhp3/NTx3OFJXC+EH+XXHAcyfcgu/QPD6HG8bbCVaJyKPUKcBQkgJCf/sM4i8qwAXTldSJjwscRCZLo=
X-Gm-Message-State: AOJu0Yyc6xoVNE0jMi59CCD3nbXrQdZgxrbkEfvYr4Txe3agkHXbztXm
	SPrNOIeLmAPv2rdAf1HZV/crSAshO7DK5pwNl/CLPVJl4/izbUPL
X-Google-Smtp-Source: AGHT+IFeq2XPAhmhYNSnba9SP2OgtCmjgPdSGw4G0e16PftRe6e912ulnOk99NStJxjI4ZCb4fUGGQ==
X-Received: by 2002:a05:6e02:1649:b0:36b:153c:a469 with SMTP id v9-20020a056e02164900b0036b153ca469mr4057753ilu.21.1713563442197;
        Fri, 19 Apr 2024 14:50:42 -0700 (PDT)
Received: from rust-for-linux.vcn03240917.oraclevcn.com ([138.1.69.80])
        by smtp.gmail.com with ESMTPSA id y17-20020a056e02129100b0036b37f8b2d8sm971281ilq.51.2024.04.19.14.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 14:50:41 -0700 (PDT)
From: Aswin Unnikrishnan <aswinunni01@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Aswin Unnikrishnan <aswinunni01@gmail.com>
Subject: [PATCH 2/3] rust: add example for `alias` argument in `module` macro documentation
Date: Fri, 19 Apr 2024 21:50:14 +0000
Message-Id: <20240419215015.157258-2-aswinunni01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419215015.157258-1-aswinunni01@gmail.com>
References: <20240419215015.157258-1-aswinunni01@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add example for `alias` argument supported by `module` macro.
`alias` accepts an array of alternate names for the module as string.

Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>
---
 rust/macros/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 520eae5fd792..aa89b41fa10e 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -35,6 +35,7 @@
 ///     author: "Rust for Linux Contributors",
 ///     description: "My very own kernel module!",
 ///     license: "GPL",
+///     alias: ["alternate_module_name"],
 /// }
 ///
 /// struct MyModule;
-- 
2.34.1

