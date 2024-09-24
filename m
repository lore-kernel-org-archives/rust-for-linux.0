Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36935192591
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212888; cv=none; b=R8Bj33f3tlTWfA4wYrTmlcoDNlspU7Vi2WGU9jTEJPju8twE8DwxO0UT6PVS35rurIB2XJ6KxAfRTHJq/XLp2PWsODx2hBxJ08sRSDZ3G1GqrvEoMENqJPeFIUXpxbD5Z52FJHQLFwAFzONZvp8apttL3HFtoj07TpRvSHNX170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212888; c=relaxed/simple;
	bh=CxcOGYVl0RHNxURp1Y+1xpXbMOZLvm56O9AP4mZATd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aR0KQJii/jqpPPmc2VZ7lC/4HGwBZxuZ4Vm9i20UC2PLnL2gVEy06u4B250aBSzv5XIH5N/lBuZwun7RwURQXwn73uFw0Llm0AI+eDsm7s0BD88LsAUx+tpAtnaYeR4ybzoId4n6ixeix7bkTYBcHyMp4h/xnYYdQ2yo1+sYyl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AKOZ+uaf; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AKOZ+uaf"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e24a347548aso512710276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212884; x=1727817684; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=AKOZ+uaf0D8tspupXHAXYrBovcQp8XUT7CMpVLp+A21lbnl0gYY2o7dukUHOVMXP2e
         fINJPQK+B0+iBbGLAd5bQXPCkNfzWnzlT14YtosM4oCxZfQK4buu6pciZaBuTnmN/Xsg
         vf67JMxbCn2XAHhP3S/2CLdXHmpv9b+RejKYVvtTct570KIspmLS369dkhqjrf91emtj
         01tvdCo6sEAanK6RnsF06us6jl+H24zVVPVqZkT/dinxFaYSfauT0AaUiUOWMEfHgN8Y
         BxFhCkvTh/J8TpeWVI/xdpKu0wAhLtBXZZkIuux36CBYXUAfncqqFbc2WEi4Cz6hBTSl
         tjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212884; x=1727817684;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WplRKYGF+6Vdtojy3WxnxZnhza95+GyPbQDFLT+DHQA=;
        b=Py9IFEVietX3FLGJkYrn2QknLX4C0lp+dJTB1ddR+/ZAdgFZ3Psxzu0vYCPG0eY7Yw
         rh/xj/H4H6mq25hHDstVNHaAt0wvtXM+e6Mqh9ls2M0as/p3a2qlxOEOvmUecWNK7zqi
         LHmmdzOsA1J4iTQxyZ48ps2gLr6UneQut5NFYsdZZ0yNUFHMxV3FIVbxmL/WHUP2J5SA
         i4wQD9/XgM580HN0laiQUYPnAzhEFY2mK1NnETrH6gSD2e5OH8kgKbjhLZrhPz1KUiWm
         vHdSPjr1Y0oKZfTJkYc2v3dpuJrC6aq3QE0zjjso/Waw8kvneG+tSoQr/zccWi6SI17u
         jdjg==
X-Gm-Message-State: AOJu0YzzpK1zKWV97fs8XIej7MY7CTo2REXSHJqQQtgXe0A6RvLhoxOl
	gw2aUEd1vkK8g5AHHsvNX4iFZtMGYVHPF+IdWpoAhY6fUgA9xgv/p5mOM5dRqjyyW3UljaqPdwM
	JzG77BA==
X-Google-Smtp-Source: AGHT+IF4MxPHlb7j/5VsEwiO/CdZf6hOwGyAlmC18C9D4g5UAAgDjKnR/SlPm4jDqfBG2te5d6/arkT9UptV
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:dc8c:0:b0:e0b:b36e:d73d with SMTP id
 3f1490d57ef6-e24979369b9mr29871276.4.1727212883700; Tue, 24 Sep 2024 14:21:23
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:58 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-17-mmaurer@google.com>
Subject: [PATCH v4 16/16] export_report: Use new version info format
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

The new version info format has a superset of symbols in the old format.
Since this is a tool for in-tree modules, we don't need to parse the old
one with this tool any longer.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index dcef915405f3..6a37df6f947f 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -114,31 +114,29 @@ foreach my $thismod (@allcfiles) {
 	}
 
 	my $state=0;
+	# State map:
+	# 0 - Looking for names
+	# 1 - Scanning names
+	# 2 - Done
 	while ( <$module> ) {
 		chomp;
 		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
+			$state = 1 if ($_ =~ /__used __section\("__version_ext_names"\)/);
 			next;
 		}
 		if ($state == 1) {
-			$state = 2 if ($_ =~ /__used __section\("__versions"\)/);
-			next;
-		}
-		if ($state == 2) {
-			if ( $_ =~ /};/ ) {
-				$state = 3;
-				next;
-			}
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
+			if ( $_ =~ /;/ ) {
+				$state = 2;
 				next;
 			}
-			my $sym = (split /([,"])/,)[4];
+			$_ =~ /"(.*)\\0"/;
+			my $sym = $1;
 			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
 			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
 			push(@{$MODULE{$thismod}} , $sym);
 		}
 	}
-	if ($state != 3) {
+	if ($state != 2) {
 		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
 		$modversion_warnings++;
 	}
-- 
2.46.1.824.gd892dcdcdd-goog

