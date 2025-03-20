Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE11EC006
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436559; cv=none; b=CXZr+sihHo91wjK6fiyyZYiwiVQFxob6YZ0gEXj0FwwFC+/f0wFJpozSYYCS03f7MZ7Nix25+AHr6EbWsSDpsEOOCGYgPS7PkuPrdTZBsl+BzQucWsH56gI4dYSYuvwTIL4MIgmOXv8hZU70Zjl4UEnkr7wd58wtVZYEUWRzews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436559; c=relaxed/simple;
	bh=N2IPwfKEmczTfi5K1HviqmmyLKm6mFRpGXyDRw95sEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSlRznTVjF1TkC+bIvy4LnN7J08F2lxUDGoY9JPgDL8aiAjvCrShPY07VHRjcF/nPBbsPy5neAIvUxa1ITr6BRQVHJd+fk57i+6LJeUxFSgo1RU7XtKZV7s5pYkgq8M0EqcqvFPb3wi4cOeBC5rgyb5R6avGTeIc3JQ3IUF/ynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=2zMOl+Jw; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="2zMOl+Jw"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f768e9be1aso14397907b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436557; x=1743041357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imGKC3gmhbIWa37wZJHFU8on3cBZLgF+oTJoS5NZccw=;
        b=2zMOl+Jw9JVBT5tN1dwGMQtJm7GCT+gLE3Z5IMhQz7uTrr9SwziHjPVAqg6j5qNPqb
         MOnzPTW8BV5fHHPzONBAmxEYm8IFTag85hBx96tyVdArTTrPkhvKs0TJlKcCgTzheMgW
         QvuHH2qHmb/6alDWFffl7a21FIsMyvmQAiPqVevkVQF2NpToXbafLRUoR1Jxf9+IKZHI
         SWXqT3Hr60CIGgSo9hJpFJfwINZsWK5j8hB18B8qxikn7LW8rTZvRCqyVfftS4cJUE3N
         GbGrM2F729lU/2UFDMdnsqMY+2Amnnbewf1a/rMtcdCD05hhaSO+FMNktW/+OEcF2EJI
         VsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436557; x=1743041357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imGKC3gmhbIWa37wZJHFU8on3cBZLgF+oTJoS5NZccw=;
        b=XBpNt6ia04bTWBFVHmbSeMzoUQT/LIFBuzWb1QBnhh9SE1+tnYEXQdrCpplvw1LHiO
         Wik0iSz5t60n7vTWg2Dy5FFVhqat/qUs1jM0C0rgavjUhm7UXK0+Wf6ctZu6pCBl/Kz8
         T6soahnEx308lJYgVch4XZG7nkJxV1jNGF/mzXjCXo7MPjVPEnPymZtpM5EGnfqlMkYT
         m2jhh5OAK7YvtFL01oZ6FMzHGkM9cDfz0r2Ic2/yeNFXBkfhsPL5l+CcCBZgp3229xfb
         1nWBzc55p08oI3hSKLh23x2b7R0gTocBi4OqXOnBfT3Az0ZBrQ2J6vb7F+T6W0DsbIBg
         a72w==
X-Forwarded-Encrypted: i=1; AJvYcCWwjMNZYg72kpmvIp/SYJy1CADnlJ8XaSTNAMSuf7L2uf+8+45Ky+ZIWYPBIEoTvD/H4Uy9IK2UBlWMY8KDag==@vger.kernel.org
X-Gm-Message-State: AOJu0YztnSAXZjLEQFB9POF5J9ujmtZk8LylMzXrHLq+xOOq7CFBIrrs
	bloislLbr0FHDpZgXJvcQVyoIe3SIbT3gAT9KP6ygAvXjKGZx93VPp5PR9YXhpM=
X-Gm-Gg: ASbGncvGZ3vnFTgDwBEGS1gr98yXxB9/vhWeha2PFzRk08V/4XQgFQ6wo0c2LgHudUf
	JffgePJi0NSfuTTmeU2Ep6l23FbJie1kTsuJc4ETNsgLnFXdkAQ8NqqFuWl5uoWLgANuAVssu8d
	Fxd4R9HuJVXhziqbdH73TtryE04B3iA+bRXDhzy2pKA9pmtChuoMD8JYUt38lEMQT+5seIP26Kq
	RoOFAm2ERvJSz3pZSPa+DBrkZeIy1Zx7Wu7vS3oMcH2sAxXwwDcGDsWSivYh/0K53O06W4fg2rl
	A7d8KBc9ze02HIMOs22Rf8+TtDKlzmM3Dp7asKITd4P3ccgAf2QLqRhGtDDxARrprpoQhXuVQoz
	OmoKktJqygt/dKfipt8xViWT/0zAYXhLCAnrpRILI
X-Google-Smtp-Source: AGHT+IGmA7SYSqNRfrXhwB3bZbarYdhqU5yTBQFpygD+N6x3XxMAhUoyGeQU29karx6EifJyn2wOQQ==
X-Received: by 2002:a05:690c:62c6:b0:6fd:a1dc:b409 with SMTP id 00721157ae682-700ab28c861mr26232997b3.5.1742436557351;
        Wed, 19 Mar 2025 19:09:17 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:09:17 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 15/17] rust: fs: file: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:34 -0400
Message-ID: <20250320020740.1631171-16-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/fs/file.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index ed57e0137cdb..7ee4830b67f3 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -331,7 +331,7 @@ pub fn flags(&self) -> u32 {
         // SAFETY: The file is valid because the shared reference guarantees a nonzero refcount.
         //
         // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-        unsafe { core::ptr::addr_of!((*self.as_ptr()).f_flags).read_volatile() }
+        unsafe { (&raw const (*self.as_ptr()).f_flags).read_volatile() }
     }
 }
 

