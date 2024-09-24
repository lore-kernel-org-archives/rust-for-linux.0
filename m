Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FE41AE874
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212860; cv=none; b=PmPb2oCwadOoWXEBgMFKBdOr/dBRMZ0O7o+O1ysuyzXGtba1LBhIPR61rzmaYquMw5+dD2OanWq25i2LesZ+DGiGhP+8s9GGyWxExkHBpYu2vwYzkcmT1Pb3FpSzcStNCEPmtniNz2JiourCoSh6e1ayrliJzKWYiPOlJ6BKO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212860; c=relaxed/simple;
	bh=W7tU7P3GNG+a73WgyQWeP1re2H5Hhpn0LeAD9h0akfE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=McmLRXEVr3OukRFxFReBXDVzu8Mn+A0BIEhE3/6Mf5bf98K3zQsGetsvgw+HvsGShkPA8MSvUFiRYJS/xrwLB0Nv/t5hj0ozJbzncsNDRIIrXHb/mbSnT3ksWrAC56R7ZRBhEvYBhS6hZJRTG2Eu9PGjF/Iacu5A9xHm8o/QL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HwI+U77b; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwI+U77b"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e1fbe2a9a2so41651057b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212857; x=1727817657; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=HwI+U77bj+GqX7K60MWegnMNnab1+DPXn+IeFDbW+E6SG6umYYogQ0goD9vzAncbtM
         Yut5kCBjl4ICyCnPBi9OXzH2rv7ke5ANQM99+7NfpVFE9do9EMdVSQgsDHWQIzR9sdDw
         aAqOEWegaujTL7/6OIqS4PcigdswO3K0SI1oqD2D85IwWZ1Kt7pA+Ok7Ba1BOjkl96qt
         E/7isxgtZ7x8HUA6HWCpyEtEpT+HVUd2518h6NJlrMrVCDlLpa8uTfU1VoM9X3+kGqxf
         0QJohd8vLiqTioiAZEcNFYlV2U0oNNVrc/Cfex3ay3tLNIJjkx+q6PBhQImnZxMPvA56
         kObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212857; x=1727817657;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2yLoLuY3hdxUDQj4FAKHilbBg2KnzEPjHr+p4Rv35M=;
        b=VpzKmWDt68MZj7H1gzWVJqLjB8TJGA07OvNlano5j60WltjIlLBHCjYrNIbJ+RxOVn
         3tJzAbOjqYTAHAbjfZwwBLxainbo/yThqCZvx4SOF/4YsEOt/kan1e3ce4xUOhLZGsQY
         Alo2SCa1L9i0trrP0C1o71LfeMoJD+Sld2/cfUH5+TLaaG9/iIpmUht7EevOILs5p9Bx
         lzwyN7j7Omm3tWOkL8O3HV6EV6lWrZY7X8EtCZ4PAtPB04JH8nDCkRt9FwTiY3ipSGw6
         PmNwjFiSmCSoXI3RAvGyeRLKHqJ355t0SrQLr/9z3dmMJ4iCSfhKkFTohC/JcX23sTU+
         8SYg==
X-Gm-Message-State: AOJu0Yx0oDcy+ee7j4AqE9Hj/XLerN44mY3rXJXN7DaEIaP51hSK25vh
	F4MBDsL1pgtdh+HTXFZn2pqG/V5u5ipSFUCETcuuj0NJ6qce7Rej8kxFEbC9E0b8Qv4l0FOixyH
	QGIUCJA==
X-Google-Smtp-Source: AGHT+IEZVi9081t8P5vrHL2wqYempVI6Tx7zpqovib+RLuWBI7X+sbJ0kRsI9o9ftmy+87K0NaMr6bmxbc5u
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2e88:b0:dfa:8ed1:8f1b with SMTP
 id 3f1490d57ef6-e24d7352858mr4336276.1.1727212857200; Tue, 24 Sep 2024
 14:20:57 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:54 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-13-mmaurer@google.com>
Subject: [PATCH v4 12/16] module: Reformat struct for code style
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Using commas to declare struct members makes adding new members to this
struct not as nice with patch management.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/internal.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 2ebece8a789f..daef2be83902 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,7 +80,12 @@ struct load_info {
 	unsigned int used_pages;
 #endif
 	struct {
-		unsigned int sym, str, mod, vers, info, pcpu;
+		unsigned int sym;
+		unsigned int str;
+		unsigned int mod;
+		unsigned int vers;
+		unsigned int info;
+		unsigned int pcpu;
 	} index;
 };
 
-- 
2.46.1.824.gd892dcdcdd-goog

