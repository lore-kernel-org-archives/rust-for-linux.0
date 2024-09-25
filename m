Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109F61A4B9A
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 23:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727307598; cv=none; b=WPSk11pDhInSWxISagqpP0kKeTso1rkqC8lJeUuOXuFdvafFPcPHcYpFYvC38KNXtP+EjATHQOHxpQmAv/Iw1Xq6MrQ5FGTEKwSpN2HdKpoNSowVvf4LS17G/H1+M9PHtr8ZL3lpxAV3XAiLGSNGdI1dVzkq6NKJEzEWK7Rx6uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727307598; c=relaxed/simple;
	bh=KqzbIRZaiTcASB5/z7j1pBJp9u/nLEzrmBQfqdwdS+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r3xqYZwoacdnKcw/C8OiBD7TQRo63XKSDwvTE3ZhAGhmblIj8XLZQNX5Zk6kZFvWkA5SRFqoGG3geU+d6v9QwxFY2EYn0LNMMEytp6KxgfpXxHuzYO/C7i+KdY+veBQMh5vCVxwJGowu40GDk6uMiQZS8Dav8qtw4t4tniRHp6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oKP1Z8NY; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oKP1Z8NY"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6d4bd76f5a8so8904387b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 16:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307596; x=1727912396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=oKP1Z8NYzCW3wdrGLbSd0+z4YaAtfoT+55NhpDw9t6rLvl0jWbL70Dl2B/Kh5tmKYJ
         G2GupxkGy83tyRGyRSwtyT2FpBXLIt2wWabdNX8ecp8Q2pvr7ur+V5PCfEkE/+QQAfmD
         doEyyE0OPuqskrD0GERU3wJK2bYsEcRh+wphK+xOCG4PE7A5T8fic6AcJjgLfY1bIffK
         /CbN1lGPMw30iGanZXxYrQ0ALBD+BIzgPamajUHMsFR/lRfTlwLxJXbYLLPl0Dr0HhEc
         SppOLafq9h5SiDULiY5MytW1aEBXpqMqaP3MuoJrIfc3QQdNjcXXYfo484YrusBlvFOK
         t6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307596; x=1727912396;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9tQH+085gbT8g6utnUHSGPzzhaq/BvRPx+qqG98o3U=;
        b=aw+DUQmpHxvRySgOA40TTzQmKG2c+8g9ucik9wqSxRLwrcbWhvFy2ZcUULj7ZKkS+0
         wg7CRYjMe3AU4P0tFSFEPSpZiysz3p4B0zqrXNotX1BjtbEYvk21RnUcfXBIE3ktZcNV
         y21IrlExVdq4VJgC4ucjiAtc8ZJ6OWGhW3F31F9WYDGh+aUgV4zfZ7E8drbpXzJiIddB
         ZwWUmNzTZNsjDrosb+A+55LkY4zzPV4PDbElCS0irfYEQ6lzaK4KdBLh8MkyU6U9qzHe
         EtOu3YdMwuCRDLaXEOckGK+UeX8TFIPt+3UorzP983OouSmKrD9FfuaPnKPN0o9thqyx
         F3Wg==
X-Gm-Message-State: AOJu0Yy8XPM/ZBwKAuDcEyNJEPjYeiASD2BBb6EWvaKyyL6Ti8SmGA6f
	7yT0pRZQvCdd1TDtOLjgUxD5HJCm+vRaDhAsUeRa6xXp/Xbvh1pMbi1Gtk/InqoKkOJa/X0jhvK
	NfLoKTQ==
X-Google-Smtp-Source: AGHT+IHf83nSsh8dSI5MT6Lq2qwz18kf/IKNLkJKmhvyxAcTbUnK8QftG83szzLWCAGb7csPDeD/aKPeenOu
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:118f:b0:e24:9584:52d3 with SMTP
 id 3f1490d57ef6-e24d71625d8mr82063276.2.1727307595844; Wed, 25 Sep 2024
 16:39:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:38:28 +0000
In-Reply-To: <20240925233854.90072-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240925233854.90072-14-mmaurer@google.com>
Subject: [PATCH v5 13/16] export_report: Rehabilitate script
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

* modules.order has .o files when in a build dir, support this
* .mod.c source layout has changed, update regexes to match
* Add a stage 3, to be more robust against additional .mod.c content

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index feb3d5542a62..dcef915405f3 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -55,6 +55,7 @@ sub collectcfiles {
     open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
     while (<$fh>) {
 	s/\.ko$/.mod.c/;
+	s/\.o$/.mod.c/;
 	push (@file, $_)
     }
     close($fh);
@@ -120,10 +121,14 @@ foreach my $thismod (@allcfiles) {
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
+			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
 			next;
 		}
 		if ($state == 2) {
+			if ( $_ =~ /};/ ) {
+				$state = 3;
+				next;
+			}
 			if ( $_ !~ /0x[0-9a-f]+,/ ) {
 				next;
 			}
@@ -133,7 +138,7 @@ foreach my $thismod (@allcfiles) {
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 2) {
+	if ($state != 3) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.46.1.824.gd892dcdcdd-goog

