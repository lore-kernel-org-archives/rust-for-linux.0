Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F4F2376A
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Feb 2024 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708940675; cv=none; b=mrtiru6Wk5rdNcTRJx2JgKWpMpJHK8O4DDZ/k6gpxLD8/uwz+ZHQuIYu9L5QLzoYW9mJd27jwawkjKilN1uXUNxbnVxraaa1LB5+XGJBhqEVOLcIudPIH6WC7jL3Q9wQ15pnMs5K987VBBJncqhmLSrwmJlcWDQvIp64h9quhKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708940675; c=relaxed/simple;
	bh=vDAziiFfJZc6buVlmJCiloA6pDClgVZnZEp0wK9gzmU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dptUZxApc2CqUe2+Zv4RDhllxFFWqWE97btZA+YRQu6YR7gi8qCcn3jndFd0d1kZY7Idv1Tl82NAFBn1LN8r2X/o1HirmVBOMkTJCe+Q2iBsvpMh2GfosLy2daSNyjOP7SP7AnhplceJg+e2eRZCHcqoylE3BJthRuFB6jO/NjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CyIq4Ip9; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CyIq4Ip9"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-608e88ca078so14201547b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Feb 2024 01:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708940673; x=1709545473; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QOSt/iG4gYTayLNw5qzpxWVv2v1rK7cBXJ7GmDghH0I=;
        b=CyIq4Ip9ocHDFuRXVTr4Zdfwyws5JUtuMx4Am06w8yQiNMiJxZAv+DftULDmfLaIiG
         HZfhhoxS+LdvkMusFqbyBcw20vhFI4YFTN1/bYtp/6QBIbOxa7uhIDRd53v3lhAMb6wr
         zACsheEKqX57wYqTUeEPLB54kciUw/anJDG3GJecMLDdRpY1dqx9Q5iW4ilBL+PB1eFi
         lvx+d57A4t+sbpY4yiTfT0uOzFPumORgbiVf2xYlxeZPpwzRQovtE1fPKQ69KBXG7ybR
         eO5TsltxZpAcdd0g7AJZL+/kHVXMopoRhT07Bj6lLOPN7xF2AzRjweE7VpuFBvJIbEyp
         WIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940673; x=1709545473;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QOSt/iG4gYTayLNw5qzpxWVv2v1rK7cBXJ7GmDghH0I=;
        b=cZkJTN+9/bbsw04JwuIAHEoPsvJe9/veKNjJN2W9HdaWIn3+4ansIbQKrblUsRrCOP
         xDEybBrvQXnfrOGvi0Su5h+n8SD4dn6Y544kf4MegICWLv4zaHoTLzug83ssow6wfU/l
         lXJYkqFR0k5oXYcs3ezY+ofhvLXqkL9x21wGsAVjvb8n41J7uhn955S3YFWRDd9S1pyP
         +SHkGNJ4sx0zETzptvcSwdQrLnqdt/JbWu8Uz61mWB+4xbZK/xjohfwqUfdXCK7WS/Qe
         Fi6QY9Pjtpi5cR+vZDkjJZre17CuD5+bVe9jSW/DYunK7DV0KxZ++ice1LcoEGeq0F0A
         1GDg==
X-Gm-Message-State: AOJu0YyU5wtyIgjikHHyxhhMj7NEokgCsLF6eVA2cH9e5sxy/FPs4Fsi
	Twgrb//nCuesvB/B0h3APC4Ycu6tE9WmTeUiHyOgFf5Uz8o5vWtmI43W47/ITETajUcodz9dLMw
	4s92wKjVQFHSrNQ==
X-Google-Smtp-Source: AGHT+IGMpIEyzXhi8qB/WsEeganILJnbryRTPaMdNcqvTPREcIEEgySfF1JhGvDz/n1CM3vsLgiKcdIhcmIe12M=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a81:a009:0:b0:608:d045:6eff with SMTP id
 x9-20020a81a009000000b00608d0456effmr1615216ywg.2.1708940673405; Mon, 26 Feb
 2024 01:44:33 -0800 (PST)
Date: Mon, 26 Feb 2024 09:44:02 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGFd3GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIyMz3dz8lNKcVN3EYt2CkiJdAwtjA4MkCwtTI9MkJaCegqLUtMwKsHn RsbW1ANB6U9lfAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vDAziiFfJZc6buVlmJCiloA6pDClgVZnZEp0wK9gzmU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBl3F14z1zT8Nox+NGVYCm9mWk5R/j0ItPWvC0AO
 PkkLM66XLOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZdxdeAAKCRAEWL7uWMY5
 RvcQD/4769UrmJrYdzfhNSdrDtcuLUwxigXofYKTy1I/Dv87ftNHha5Xggz8u3XXuCOjo9yMMhn
 XOqooM6hQbGB95H8P+/1Fv2t78IkYX9i19/58+JtDv80wOfbMS+qRRwYVH5wyJT6Mh8g8KaX8DK
 X+3Hg+tXp1ayWfjHwKv+fy2gZVslZ5/2KEnBxj61RKp2Vy3KjoalXU98BEl5K+ew6nyzXA9KvRO
 ct2LttNAWVlKZNbegSoQViA+CrFBCQJMqgnsSQg5NfT8p/fVonNG1edmWjUhQfc+Zfy0MDhe6ak
 rxBg2Kfz2pyz/IkRt0gkge0G2/nTN54c1AtUOhfhBQxHPJlzWNnSVRIKPgLvad4ABLrzhLMLLjv
 mRTVNGDH8iKXxlLPfEBL+/9M21Bu1Cfs/APckzegcwhNVCIfe8XA2kY3l+HrIpZ2npbd/5SBYpo
 MWNcwF+UYrxNQflP/eE5hTyGcPwtFSKlq/IIb4kfchpyHEqvkXqiNjeD8kEaS2pe/Nt4PFPnZsu
 bVIMI/ClQCHUJJ6qfnCvdT3jDxszhdfQTZA7IdU7xeFlvC+ejsYLRmkM8Rv9pQ56MlPeT/qtDQH
 YHS3Xb586j7fcGqsvDvKTTeQGxK+T76D+QQL7mTOORHZJ6HBnc/0SEi79+tKBN6l9gkB8nXe4iP XsBtj6ddtoYVpcg==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240226-module-as-ptr-v1-1-83bc89213113@google.com>
Subject: [PATCH] rust: add `Module::as_ptr`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This allows you to get a raw pointer to THIS_MODULE for use in unsafe
code. The Rust Binder RFC uses it when defining fops for the binderfs
component [1].

This doesn't really need to go in now - it could go in together with
Rust Binder like how it is sent in the Rust Binder RFC. However, the
upcoming 1.77.0 release of the Rust compiler introduces a new warning,
and applying this patch now will silence that warning. That allows us to
avoid adding the #[allow(dead_code)] annotation seen in [2].

Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-2-08ba9197f637@google.com/ [1]
Link: https://lore.kernel.org/all/20240217002717.57507-1-ojeda@kernel.org/ [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/lib.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index be68d5e567b1..1952a0df0a15 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -92,6 +92,13 @@ impl ThisModule {
     pub const unsafe fn from_ptr(ptr: *mut bindings::module) -> ThisModule {
         ThisModule(ptr)
     }
+
+    /// Access the raw pointer for this module.
+    ///
+    /// It is up to the user to use it correctly.
+    pub const fn as_ptr(&self) -> *mut bindings::module {
+        self.0
+    }
 }
 
 #[cfg(not(any(testlib, test)))]

---
base-commit: e944171070b65521c0513c01c56174ec8fd7d249
change-id: 20240226-module-as-ptr-08300b88525b

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

