Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CAC183CBB
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732355443; cv=none; b=N0qBLDmKYhGhmzkjTDUjvc9Ki1wGQo880aoRRcXLUSGrOcoPESNNmBqf4uRAdoPIq9htfWSUD1ZWuGaULUHzNiSjXd9Os8dDi1SNK6hbbeYZ7LcGIbNrPaw/VUrTSxpfF8VZSz5mcQ5HuqS8VVCMfxETXzeyCt10fzCUBQDbDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732355443; c=relaxed/simple;
	bh=nANG91Dw6oR9A/T7ofiuGDJEJeRScy+H3Buu0suwZO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3kuo+rMygoaiRsjIU9CzyGGH9PyMFCGTtMNzlXXHSKmosaoXsbCyGt+xy9Nfhw3N8pd+MiFcLsoyQb2aYN0jQjkSCskcfErmrs8ksqzaHAKTdbwUy+QFZcmPCo2qXd1vUXtxRZQxBEY7yFllTM/BgqQFRsxhJ7D0s3USrSnpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=R1rI2Qbe; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="R1rI2Qbe"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso3788689a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732355440; x=1732960240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q70rMmR70wWX4X78buGcgS7GzfVLIT5HVSyKAXV4Qw=;
        b=R1rI2QbeYeOBwzcXn0X0C53LSMUQeeY7RfOr4TEEe3DQDas5hhJdeawMVHFVpf1bYt
         Wr1hzPR4w9hnC+AScU6w/MIUDvckv7N1s/7KsDmTqjDQTbP4r3ybJpZzcbPc+1ayG1YZ
         5y8j25hByZVng3MyJ+j9aM/nNCnUctuL7708ScUYc2ogLON+5PtwofB7YSFvH/HPWh15
         BXzINYGRIbgNdZPqdtjKVhPBRzg3IjbFiji8tmlsVoyeCF+ZJYhiZgP01+ryvi2Hj5Fi
         fnbEJmFOfrCEOAeN1ynVV5zTEdeSUiHxH/PDskkeamu2MTFMlqyYQZewcZd74Z6uNmtq
         OCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732355440; x=1732960240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Q70rMmR70wWX4X78buGcgS7GzfVLIT5HVSyKAXV4Qw=;
        b=GcD8HETgxqs1fAdIauVbP1UElFGnnBiiYaQZNrFIG7ZnX7/PpgQj1jw8jFkblgFPTv
         DTPkT/1RRd2VSGWxIaCyVCbtxIpJwp/iVNmKOr7bJRhO0DS942ep1KrdgTC6a8hBLoPv
         M2EEzueVjDECxehcgDM0Du7VU4a7e4rK3wwy+G+4TJRxkxEBY7fPEhneVTc6c3FhuG5B
         Xyl0R641mUTQfMZEsaLzRLVrG2OPvL7xBGuyI3LrLDOEOL6T3zpM3fBiQS9Yu6r+k+Wp
         yzOysPRxf7Cz8aZJ3fzcRrhD/mlKE8DDkdn//K0N8I2Tu4fiJ6guHyFlI/LkfOFH++qc
         C4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWBbw6CxECwlTupgnmvZGMH6qilw/71SvxlI9CYU9AsabCnEOqZeHRhEvqLlsmSciTZ8194CsEhQuon1IYHow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0xz5xTLhsE70D9SBuSbhUQNqgZFPfkVMIOMfWkpK+XPpV+M2
	JPP9RcWg1I36o0g4FlULTcRWLfOlBbIeoBbwSSqsSYj7J5W7qDO2KJaGI2bHkZc=
X-Gm-Gg: ASbGnctKW3rSA4/w77ZrRpSqNVY8QKjGt6pdmjVWeABHYGo2SKudqEdlKW9vJsHZ+92
	2vx/ss0MQfl+NPfmj3e8ADZwJWUsuvMz4pvQR+HEPVjICDY/uebaNhG5anDfjUiegBDgcvrFNTU
	l7ltDpofNZDT2red0jhOIesNgb4pSAcOlJduY4WEi4Z210+2Mpnenxw1U+AvcQUvhFVQGvq7IZ5
	mTSRaluXulkWfu3k6Y5iWABpby4+ZoMG5QnOo4y2VE=
X-Google-Smtp-Source: AGHT+IHPmGM2z/3e7s5Evo775l7DV7kwo4byQxppXLLl+LnEEVLkJbzTF12v5RQTf963le2O9d0Q0w==
X-Received: by 2002:a05:6402:2707:b0:5cf:a1c1:527e with SMTP id 4fb4d7f45d1cf-5d0205dbaf6mr5117358a12.8.1732355439662;
        Sat, 23 Nov 2024 01:50:39 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41af39sm1806918a12.82.2024.11.23.01.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:50:39 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v3 2/4] rust: kernel: rbtree: remove unwrap in asserts
Date: Sat, 23 Nov 2024 10:50:29 +0100
Message-ID: <20241123095033.41240-3-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241123095033.41240-1-daniel@sedlak.dev>
References: <20241123095033.41240-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove `unwrap` in asserts and replace it with `Option::Some`
matching. By doing it this way, the examples are more
descriptive, so it disambiguates the return type of
the `get(...)` and `next(...)`, because the `unwrap(...)`
can also be called on `Result`.

Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/rbtree.rs | 46 +++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index cb4415a12258..ee2731dad72d 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -36,17 +36,17 @@
 ///
 /// // Check the nodes we just inserted.
 /// {
-///     assert_eq!(tree.get(&10).unwrap(), &100);
-///     assert_eq!(tree.get(&20).unwrap(), &200);
-///     assert_eq!(tree.get(&30).unwrap(), &300);
+///     assert_eq!(tree.get(&10), Some(&100));
+///     assert_eq!(tree.get(&20), Some(&200));
+///     assert_eq!(tree.get(&30), Some(&300));
 /// }
 ///
 /// // Iterate over the nodes we just inserted.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -61,9 +61,9 @@
 /// // Check that the tree reflects the replacement.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &1000));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &1000)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -73,9 +73,9 @@
 /// // Check that the tree reflects the update.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &1000));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &3000));
+///     assert_eq!(iter.next(), Some((&10, &1000)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &3000)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -85,8 +85,8 @@
 /// // Check that the tree reflects the removal.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &3000));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &3000)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -128,20 +128,20 @@
 /// // Check the nodes we just inserted.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
 /// // Remove a node, getting back ownership of it.
-/// let existing = tree.remove(&30).unwrap();
+/// let existing = tree.remove(&30);
 ///
 /// // Check that the tree reflects the removal.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -155,9 +155,9 @@
 /// // Check that the tree reflect the new insertion.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&15, &150));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&15, &150)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
-- 
2.47.0

