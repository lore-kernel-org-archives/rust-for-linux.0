Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7317716C69C
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979304; cv=none; b=kyVGq/KF7l8tYZNNTaZwg307KJQ2Fmg5Vai4NPCMQxvbt7/2jL9CjnQy29XvkVj7ZeLNOfWt7u5GHI8+G1Hn8rfvTPGsjGxpeteZpd1MmsJLGl6mC7J4pu3YBzEjwPJJFW872hYXDz2TMyXa1jkglfcGWPe1vTHudHgr8vW1jEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979304; c=relaxed/simple;
	bh=mCqYq1X/5JSmTDPsE/ocb7zGxaMcpnc/Bjh/o+XxIs0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ETjbl3+W2WOSX9/9cA4A1HO5czrkfAj+bg3emzrsH2xRyFk4l4dbu97HdOc5PZvLsEB0asw3byvV/KYm9tIDYtEIdwJPKUYlUpoO/EiCxCLXFDBnFXVTNkSe/4cxIKBbwTPRdBrkOo1zHD16SImgkd68Tm1grnhp2ORI/FN1w+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CvQ9Op5m; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CvQ9Op5m"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6688c44060fso20553997b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 14:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979301; x=1723584101; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gAaXWC0uuTf8zgXDc0pw4iU2+AZ5Ew6s2WlxaR3c8mU=;
        b=CvQ9Op5mhhpRJDe1qd93QNFQaqonLa6repdE0h752xjjkgN2guWrirFaWYR2pBNutW
         ljj4/LA+BPeHN1X9W5wdXp0593x355DQW5SqI9yxh9MGjQOfOfhCKMYFyjSFVIWUY5wY
         gffElgTC0Iv+79Wz5j4DBcobZN71h/EgnIxJGc7jh2VpvNb7HHooi+Ih6oexnRwvhqEq
         Oc429EkUMvjsqU7z++0ubhz/6Lbfh9+bdbKfwTgZP59uf10uyhkASITA6x/bIVJbDrJ6
         XOnRWU5YTViaJhi8CpHK9FW2qbAT5P5/kaH49auhmK/3DxKjCt0GtcdHFJHFA/B656r2
         mqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979301; x=1723584101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAaXWC0uuTf8zgXDc0pw4iU2+AZ5Ew6s2WlxaR3c8mU=;
        b=YSDtZEb2D3jfkJLJN3YQx6ursxg/5JX7Jtu+AwEAqy1W5SS6XyCT1io8zL4opcH9/y
         aBjWtCoxGQ6aKfsi0WRGgPBnnBdP1dQybVFWGQnjTp4/8MN6KuVl5iGyv1Ixd6tJRuiv
         MxGgvN8atdma5PX0usRCEFNxaz4zROxx3VlYlv3kgtbGB+fbsS7/P7yAHzaI42A6t5ve
         XCpwWt2yTY9YCS115R1ueB+Tts3bESYcGb7sgOu2dodFTaQE9qn4RN16slDqsy53m7OT
         KARaIYMh7oCugT97f+POpYky1H2g/cShyPRiLSu7aW1uoir6tPFCPZ2WU/aHuS05rDg8
         G7bg==
X-Gm-Message-State: AOJu0Yy0bQ4X9Hz6yrKKaqcSGGROxg74+rqpCD+UG7ySCXgIwd5D8tMP
	lZa+g3si5/5XpniFVHfGgAwhXcJkvAL5NN5RNFb8ZF1cywsL/35Jp6IYsR1cejADDlfXI3LdcVa
	G21OyMA==
X-Google-Smtp-Source: AGHT+IFcUQaohqepPhNvLJBa4TjhoTiyuvux1yaJvbNrJCyjQGkSU02qkk9c/0giXa9EMI+33KR83fwc25z7
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:150a:b0:e0b:f93:fe8c with SMTP id
 3f1490d57ef6-e0bdde8775cmr310737276.0.1722979301649; Tue, 06 Aug 2024
 14:21:41 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:39 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-14-mmaurer@google.com>
Subject: [PATCH v3 13/16] export_report: Rehabilitate script
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>
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
2.46.0.rc2.264.g509ed76dc8-goog

