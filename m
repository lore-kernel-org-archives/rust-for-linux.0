Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64E55E73
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150847; cv=none; b=rndc71vEwkDGyjCl8Laj/gXkiK154uBsXX+0bDML82rGOzAdOdPrmsELroorK3KiapgnX3keb2ZqoVg/rKKcDtbxYT29XDdqYZy619WMQtQKSUpshzZfOHKikiMq17J2wOnX2+MAvwZapa0xB9k/WL97/MJMeXQzc8O7JpZvHaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150847; c=relaxed/simple;
	bh=bzS2SQiFMOU6F7XOkTxNzcfaRNJj9Dz0uIvOeW5eVw0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iSKqJGoCrv8diI45diCyyHjeHYgoajHIsBwQbTlpwfSud9yoDb1AfKm1Tv9a0zKlLlgoBSPN4ymBneSb+Ls+EuWqAHZovpbFkz2eSonlPkzwK9QjofgftiW6Bc4748+6thMbL0e5RoM8YE8peOww0iNierwwTv7e/4H0I34YDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uJbQwlZQ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uJbQwlZQ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-378ab5b74e1so499803f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726150845; x=1726755645; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AbxMkKqYpXyzBIW6S2i/vt/W7X6pYpyB4dZLGsN8EFE=;
        b=uJbQwlZQK1aZNwAqcFW8Xysf/RWk8p9GC2BzPmdi2FeniE1trOMt3qFEjwCTO4Muol
         +EtW77wxNKaPM625ZnaOJzAUreZaudbdtahl/GMTtpIKaNL1IlS7o6J0Cr/W9+C7X3Xa
         Q9o7GMEveV/OhUeZ8n1EXkA9jXOOJgkkq98iJKKZb+fjBHbxeBeiyb98GE6eqEdW1bUM
         ME715DkKlUa6rIxKEyOiCrj8dmi9RZEkikZM9VuVn8JfDC1UgKxcQeOBxgNdz1FV6QsP
         7EN7DfM8jqywQkaOXyeuHiPwZ5lhhxDKY4IYba09eB1r2ZrBHwQm6nYWtK4Gyoogtkc2
         SAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726150845; x=1726755645;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbxMkKqYpXyzBIW6S2i/vt/W7X6pYpyB4dZLGsN8EFE=;
        b=aP4wYjBdet7xBrMs4yjJKMtumH2qXXP1yp/uiAT31MbH3UIludpCUMfcsTm4F1WUoR
         ilyI0O0cT3flLzuoO52WLd2TaCm/cR/HaJVkF28N3EB9VPflXli5prsDYT0AO1nqBnOL
         INNAfwn/nt+bU48FTYhyO5rzv+oISkZ1dmSFhomPMjbY97usIbhoXCOb5zxY+3qmqOT4
         rzDhD4OmyCTSfhcAsr10SBhJGjCftKJoe32jUT8jOdoPClIa+N9Yxh8m6IIt/zjCPFcV
         EI8PS3M2Z3dfaQHee+goAAnxqCteOSJw4XpYDtp+ugtyZnKBL5wgb+FTssKwg75iY6xo
         q6TA==
X-Gm-Message-State: AOJu0YwcsGRISGyZ3pxxY2dfeTF1C6P/D7Y5zW0Fj3zNim1T2SzCn4z4
	sRLCABAriJt99EaShH7NBQitM371tF7vZCCBLCptETyP/PcOUi6sjMAapBjiMcrANFDfAJ1BBEb
	+MiICpgDCPv9XCA==
X-Google-Smtp-Source: AGHT+IHlQOs4CTIMMDJxX0/QQ3RZQfLadjCwjj5uZqSBT+YUKZbyayjWXl087HminWVr5lRHhQKfaBoOn+RPaoY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5d:4a02:0:b0:377:9867:903f with SMTP id
 ffacd0b85a97d-378c2d5c4b2mr2842f8f.10.1726150844293; Thu, 12 Sep 2024
 07:20:44 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:20:06 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJX44mYC/x2MQQqAIBAAvxJ7bkGtKPtKdChdayksFCKJ/p50n
 IGZByIFpgh98UCgiyMfPoMsCzDr5BdCtplBCVULLRXuh9nI4pwwJm/Q8Y2ilbqyrlFOd5DDM1D W/3QY3/cDq7c9W2QAAAA=
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2100; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bzS2SQiFMOU6F7XOkTxNzcfaRNJj9Dz0uIvOeW5eVw0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm4vimjfLmjrPI4J0Ne/igPdq4mvNQGBfFPylJr
 DiUznpWybiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZuL4pgAKCRAEWL7uWMY5
 Rp9xD/0ZUtGHBh07tF98063h7hmF+lFx8IzuwrjcdNgfefreQcdiMLQCdGf+jLdlMWy7Ur5D24E
 odw29+EpBqC6uBx7Cpbmz54S9cADK3XSee2+H1WbN28/6sZ/U3s3SiLF1COoaTRwBYyqrB2fE8+
 LxD8j50x+Ls7Z6mI0KSoEv8r5jY82RBv3oR6katX4Q0g0aJcZ9SkLg3vJl75BwFH7o4seC3/AzE
 SJ0Zh2lSBjFz8WQ3HzsAVE0ovRkyJtGaQQcmB8oQF485jU8+s2jxTcHuDY7++xQ6YN1VXL4S+z0
 0J9IBKDV3wdOhP3H7VGt0M2E8bPsCd9NpUiqtQ+xeqK2oS21ygnONq5P48Hd/ZRwCJPBabtCZby
 SmZ9453s8Vj6D+xLQwR5yj/1OZNg5tKsChJstazkAM6lizNRTGeFlPxQsFN8VbBlVSVlEU1vj+4
 bE5bbbvKfFmxNEnBxtHuVoRDz+R0rQuFoBs5DIIT+X89DOOMCViRwR0pSvNb/uvRkyfP8TP0srv
 FLrGVZaeZHxXqws0/6oGfCJRvzsQjJQ487UQdH1gCXbU5h9i36KK2XecOgyY8BlLEVwP9wQLkRv
 kfCAPbjz2PHlLNbH/HBkJkYE/7CAJOMeOj5uewMDfCifNYQdAtgGTyzLYozTIwSlk5GgGnkGY4e UWrauSvskU36F5Q==
X-Mailer: b4 0.13.0
Message-ID: <20240912-locked-by-sync-fix-v1-1-26433cbccbd2@google.com>
Subject: [PATCH] rust: sync: fix incorrect Sync bounds for LockedBy
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Trevor Gross <tmgross@umich.edu>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The `impl Sync for LockedBy` implementation has insufficient trait
bounds, as it only requires `T: Send`. However, `T: Sync` is also
required for soundness because the `LockedBy::access` method could be
used to provide shared access to the inner value from several threads in
parallel.

Cc: stable@vger.kernel.org
Fixes: 7b1f55e3a984 ("rust: sync: introduce `LockedBy`")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/locked_by.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/locked_by.rs b/rust/kernel/sync/locked_by.rs
index babc731bd5f6..153ba4edcb03 100644
--- a/rust/kernel/sync/locked_by.rs
+++ b/rust/kernel/sync/locked_by.rs
@@ -83,9 +83,10 @@ pub struct LockedBy<T: ?Sized, U: ?Sized> {
 // SAFETY: `LockedBy` can be transferred across thread boundaries iff the data it protects can.
 unsafe impl<T: ?Sized + Send, U: ?Sized> Send for LockedBy<T, U> {}
 
-// SAFETY: `LockedBy` serialises the interior mutability it provides, so it is `Sync` as long as the
-// data it protects is `Send`.
-unsafe impl<T: ?Sized + Send, U: ?Sized> Sync for LockedBy<T, U> {}
+// SAFETY: Shared access to the `LockedBy` can provide both `&mut T` references in a synchronized
+// manner, or `&T` access in an unsynchronized manner. The `Send` trait is sufficient for the first
+// case, and `Sync` is sufficient for the second case.
+unsafe impl<T: ?Sized + Send + Sync, U: ?Sized> Sync for LockedBy<T, U> {}
 
 impl<T, U> LockedBy<T, U> {
     /// Constructs a new instance of [`LockedBy`].
@@ -127,7 +128,7 @@ pub fn access<'a>(&'a self, owner: &'a U) -> &'a T {
             panic!("mismatched owners");
         }
 
-        // SAFETY: `owner` is evidence that the owner is locked.
+        // SAFETY: `owner` is evidence that there are only shared references to the owner.
         unsafe { &*self.data.get() }
     }
 

---
base-commit: 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
change-id: 20240912-locked-by-sync-fix-07193df52f98

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

