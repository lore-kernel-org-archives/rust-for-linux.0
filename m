Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD620335098
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770479792; cv=none; b=NSGgGHUwgxHTlLCl6HW3HzWY4xc3QDi9NH8kFi0LsHDgInX4aj3KM8oIQe83RbaDZrjGnQzPUj+L6H1yBppb5Zf1fGES7QyfBd+QtUTeINwMmnUF5+uE/udUb+YkMIKZA5v6XgUczgxsVdoprwfxWLBPeXczY/sSyx1RFrUMm50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770479792; c=relaxed/simple;
	bh=tNxQ5d5F+0pxCQ53H68eMaj+7EH1agNEupPGgbTvKZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bP6rK5K95OZ7WuxScUAzXbS3KrWkTTFaIt9SGui6JHiP8OLmqqhAYF1jNHpTthiVtM7YSdjwMAbYv+H93UdcFfYqzMAnvVTKagAe5lP3IIAJAGzmpg8g+YpEMIge+fRM38EuiwdPY6LsemuL2u454pSjDevQ3XWc/lefSdCfwwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqFnCkjx; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqFnCkjx"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b81ebac5d6so3707519eec.1
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 07:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770479792; x=1771084592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lsv3J6NdVcTt1SFQJ7wC7ZpknXmPlIZzamEjxZSqFto=;
        b=OqFnCkjxbAKqBIHsmPzF7/eFF3vvfFjCDONgjECD86gXPRAkbDDXbr1GKVQa15oRc8
         9shKwPViU/xMvsXC7l1d2SYSVp+8KTARoh4ZwpkQglEOwi5M02OdNZJAn+ke7xxsgtiS
         5YGFDlMXphedym+tompZ1865AQgBa4jXisTfIHrS2uXu10AwhHccqeFvLvAFqIi8+qIJ
         AL81A+3PWaZIh4f3q0CO8zLAGcZOaUT4abN/rvhSXpdBx7CMCBlfiJ9AhPXBbXI5Pw9n
         PWhiT/ligQue6vocGH9J5rJp4OPG6mMwFTC51+g/GdmhgZw2Tu3+4Klg/nhrspQ8yZzU
         uLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770479792; x=1771084592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lsv3J6NdVcTt1SFQJ7wC7ZpknXmPlIZzamEjxZSqFto=;
        b=sV7RC9hOTBxkY00UWg6qfISH08gWm0bo8PES0iF4h0J6QBaKwjnnhb5TXJCLZyh3Yx
         xo9/EDwHs9gKxzI/F08k+PvrdgKCweBl42YTlSheoAi0mk8eJrD5EG0NzEt5x6eauEcl
         gIoBIfsT+Rbs3/ilte+vyIS2eFZ5Y12r7/QCYohJGV97J/D1m7h5jMsTuV41deolTJG+
         NZGlo97FU83B+YBaR58PnhbZfIEGBOh5n/hJmIdi1umO+ZmmJRNhS5G1fbYzBZioN+ZB
         y4EqkUI7G4HYK7Zy2oqbgmNc3Js/xlPRaZNpOmA3jqwGZRjUdQuUyo48iosdSqdWsUFb
         eCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfJOsuDbOd2dNaJ4ZNLd2CvtDanaDAioDbXylCOqqb297zHxk70dgsDpTYU8yGqtAh5NBgcTfnR4yUHBCSDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbG6LsGYXF0PQft2RngNUJXM7Gdby0i6gcepoZ98dRdmJUYWU
	09YJrz4uHGGIXitt+V/wyiS1/Ev5nybUiNxWcNcNh5mIT+7kZCLEzPYq
X-Gm-Gg: AZuq6aLzdtmiu/qScCrSVBeJbb/X8rb3pjPhs5IGp8F0AJN7Sm/WHOz7j0Zj4oGklEA
	Qr8ZEAg3yrZAIV/s8/3t2VIqNhmLCrGR9CHBHdyDnpkx1DgTzmffe1hrDD3pTDyaSz5NfNgGoev
	dBnF4lan5JsU9+/mVkrGstqbRzaegqG4vOxh0s9rL8ssOtDTktEsNU7BypyoL17dIdQ/79Z5rL3
	y001z04N5MQP167U2O6ZH23NydE0tKqjBRf1Di/yF/pa3HX1MuMEGabuE1QsAe9/kIAJqoNu3Qq
	nSgQi4Ia1tuh5MCPRVrDFnp6Q72EedubRikiWsmd/SHSZM+tlEkVxukxeanmaPlRxh6EfO7/gsn
	ZIDBRiVoCNQox6UTQ6cd5Saym1VuljaOtdh7iPx32aOvRnA890OWPymEb5t5fSfHopMAUm5WwGU
	UZ3miCeetY65sYAJTAFcYQZBkCGFNl+ChYZFJxaLx66+0ZTKZhzOKlc+naijxdMZo1e1aqHVAHW
	x0=
X-Received: by 2002:a05:7300:a494:b0:2ae:5e93:b6d with SMTP id 5a478bee46e88-2b856a3bcacmr3153653eec.38.1770479791680;
        Sat, 07 Feb 2026 07:56:31 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:22c3:7b0e:5e40:3e51])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3db4asm4936561eec.18.2026.02.07.07.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 07:56:30 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joe Perches <joe@perches.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH v6] scripts: checkpatch: move Rust-specific lints to separate file
Date: Sat,  7 Feb 2026 08:56:27 -0700
Message-ID: <20260207155627.122810-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiq72=68-daT3J_NVvp+7NkGFWFPGQmwoXn4m54VYeRKPUkbA@mail.gmail.com>
References: <CANiq72=68-daT3J_NVvp+7NkGFWFPGQmwoXn4m54VYeRKPUkbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create scripts/rust_checkpatch.pl for Rust-specific linting logic.
Add a conditional loading hook in scripts/checkpatch.pl to call it.
This will allow Rust linting logic to be maintained independently.

Add a new entry to the MAINTAINERS file to track this new file.

Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-linux/linux/issues/1191
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>

---
---
 MAINTAINERS                |  6 ++++++
 scripts/rust_checkpatch.pl | 15 +++------------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c0bdd08b74c..57831dc30e6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5880,6 +5880,12 @@ R:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
 S:	Maintained
 F:	scripts/checkpatch.pl
 
+CHECKPATCH RUST LINTS
+M:	Jason Hall <jason.kei.hall@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	scripts/rust_checkpatch.pl
+
 CHECKPATCH DOCUMENTATION
 M:	Dwaipayan Ray <dwaipayanray1@gmail.com>
 M:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
diff --git a/scripts/rust_checkpatch.pl b/scripts/rust_checkpatch.pl
index 69db5ded7371..56c1bc29d3f2 100644
--- a/scripts/rust_checkpatch.pl
+++ b/scripts/rust_checkpatch.pl
@@ -1,7 +1,7 @@
 #!/usr/bin/env perl
 # SPDX-License-Identifier: GPL-2.0
 #
-# (c) 2026, Jason K. Hall <jason.kei.hall@gmail.com>
+# (c) 2026, Jason Hall <jason.kei.hall@gmail.com>
 
 use strict;
 use warnings;
@@ -9,17 +9,8 @@ use warnings;
 sub process_rust {
     my ($line, $rawline, $herecurr) = @_;
 
-    # check for Rust unwrap/expect
-    if ($line =~ /^\+/) {
-        if ($line =~ /(?:\.|::)(?:unwrap|expect)\s*\(/ &&
-            $rawline !~ /\/\/\s*PANIC:/ &&
-            $line !~ /^\+\s*\/\// &&
-            $line !~ /^\+\s*assert/) {
-            return ("RUST_UNWRAP",
-                    "Avoid unwrap() or expect() in Rust code; use proper error handling (Result) or justify with a '// PANIC: ...' comment.\n" . $herecurr);
-        }
-    }
+    # Reserve for future Rust-specific lints
     return ();
 }
 
-1;
\ No newline at end of file
+1;
-- 
2.43.0

