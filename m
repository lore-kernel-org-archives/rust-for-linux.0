Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C4D35952;
	Wed, 18 Dec 2024 00:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481445; cv=none; b=bhDOCouGHRG3pqbC8c5DLaGhbBmvtLb/Vek/AYYfTbNNxbY2NVGYUkrq1BJO14YkvRtQj7QCLPJLLeziz24GLbNcnAeZUKZAH1rutaOlSKdsOyGopJT7Ud04+d9AicpH0UG4Vy4zxJPb1YujVy4reSwI1HXmaiZpoIONgAChNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481445; c=relaxed/simple;
	bh=IvD4tMNLTgENGXTR1jcLc2bkSEAHJcE/vkoi8H7e+u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGTSXF12D0bmZk3T03jYGinu5up++KZ3UHnlHoZkJG5weWY+Oa6+DY0mcDhP0WYgMZoHvz4Uiskpj7nbI0V8gntIBXIkOZS4Lg95PPs7MBZBMdpLlINTZMydH/1/5VlRV+TedassfpPLG3ch1oNEQzhmdUIbKF9/Andyo/s0thk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfDFwdZn; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfDFwdZn"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3579167a12.3;
        Tue, 17 Dec 2024 16:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734481443; x=1735086243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHF2mQUBN45ueR+C/jemI/ZotMmCI66ixhg5UiKr9jc=;
        b=HfDFwdZnJ9gCaD/+l4d4obx6Ik8jVxLQbAyp6jSBOpyS8xcs9qfa4nAdDwrS73FZf1
         cbm/1ejHufGoMtfVA5MAcSF2mdoaqYFo+hXEzjhZ7McHTsIog3FkHTfKj2Dv34ePE3LQ
         ipo3Rgp+eH8krkJ2KetnwPRn0SwR4g6+J7JfaM424b1WUhPqMJuPIesRuSwQAZG3EIgn
         Z2HMekW4EfIsk/f5vgdm1k6kkXR/oFr+jyyv2+NmcsfmpEXX41j7+NcGd1y+89MJhHJE
         UQUzffWnfq9/Pv7Wmzk786n3f3IJuClt8V03uPKQcSGbZ5XqM/Ub8RaZe2Y7NRrzYe9G
         7Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481443; x=1735086243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHF2mQUBN45ueR+C/jemI/ZotMmCI66ixhg5UiKr9jc=;
        b=DIx4SaHNfzQRXsmyd3ZyfhCxm6vMtO3hBNdnABWOEAoRlFZfmFQhL0VsQZ8m4R535c
         I6qAqrxw6zGcQ8KUilYKi5eyM9KBPu4TMOkkxfTjT1QzJljknH2zqhmRfp1OYaWMCAQ6
         Lj512kI5qaekkcax99TAF+1MG5beKGitafAW5zxDVqTnXYW+VrhdULq0w/5c0RwGCzAz
         r5IN3eA6+mKXfIbJrrFMiPRrujZ1fB3O8i1+jbb8HL8AsB2iYMFpnmaNT8BK0EWEU7kb
         BaGAcS6iAomoISA9BcryG0dAkJ1Sr5Nde2FO8cVe10nH9Ptd1Fd/ZrECp/4KgofMF2rR
         vqJg==
X-Forwarded-Encrypted: i=1; AJvYcCX5XIUlc0hYM7R3WglMt0+O5dw8Ixhg5hJRM4X7Is+3BiRnwCBdS4I9TRPjtMlZd45knajFtMN0Qbrd57g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMeb2vQI9/7AD7GUwftPVLWmjtbuLSDYQ+LBWWFZyyIl/1Jzbg
	jrtZyQo4NaxNwCaPo9y3kPUjKDfpA9re4p5+Z0VNfSEKOC+qXaVS
X-Gm-Gg: ASbGnctLBZAve0DXl2FP2cOoyWqiIQC2zN5ryRICOccZMke55yFWjb/67BGU35nLCIC
	kwDoDEhnOz2EEVeiuUsxXQnYAxJ23BPeA06qhMAsxneJ1DX3CQnTmRbCauFg/0ageTuvtR5I9oN
	J1xVePMKJxL030kBEjCBp6sb/oCGHBgJ08DbpOspGE24GY4NWD/w9dzQ3Jb0GAPV6MdHZk3efkF
	JEobNFxH468HB9nHmmIzu9mxrR7xRbkyK40oI14ywBJTesKV6qYq7VX4OedAja/Cg==
X-Google-Smtp-Source: AGHT+IHX3VCHljw9hlR91Ks9/YhBpes2dS5CXB1bPhP+ALz92Seg+cJVZnFWAfNJyLsGd32IT3UeAA==
X-Received: by 2002:a17:90b:4b8f:b0:2ee:d96a:5816 with SMTP id 98e67ed59e1d1-2f2e91efe42mr1299397a91.10.1734481443358;
        Tue, 17 Dec 2024 16:24:03 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::5fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed6417d7sm97932a91.23.2024.12.17.16.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:24:03 -0800 (PST)
From: Jimmy Ostler <jtostler1@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Filipe Xavier <felipe_life@live.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ostler <jtostler1@gmail.com>
Subject: [PATCH v3 2/3] rust: error: Update 'stack_try_pin_init' example
Date: Tue, 17 Dec 2024 16:23:11 -0800
Message-ID: <1f19375654fa5ef4d9bc086177f05b112470ca6d.1734477232.git.jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734477232.git.jtostler1@gmail.com>
References: <cover.1734477232.git.jtostler1@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change documentation imports to use `kernel::alloc::AllocError`,
because `KBox::new()` now returns that, instead of the 'core'
`AllocError`.

Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>
---
 rust/kernel/init.rs | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 347049df556b..3d099908dbd5 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -290,9 +290,16 @@ macro_rules! stack_pin_init {
 ///
 /// ```rust,ignore
 /// # #![expect(clippy::disallowed_names)]
-/// # use kernel::{init, pin_init, stack_try_pin_init, init::*, sync::Mutex, new_mutex};
+/// # use kernel::{init,
+/// #   pin_init,
+/// #   stack_try_pin_init,
+/// #   init::*,
+/// #   sync::Mutex,
+/// #   new_mutex,
+/// #   alloc::AllocError
+/// # };
 /// # use macros::pin_data;
-/// # use core::{alloc::AllocError, pin::Pin};
+/// # use core::pin::Pin;
 /// #[pin_data]
 /// struct Foo {
 ///     #[pin]
@@ -316,9 +323,16 @@ macro_rules! stack_pin_init {
 ///
 /// ```rust,ignore
 /// # #![expect(clippy::disallowed_names)]
-/// # use kernel::{init, pin_init, stack_try_pin_init, init::*, sync::Mutex, new_mutex};
+/// # use kernel::{init,
+/// #   pin_init,
+/// #   stack_try_pin_init,
+/// #   init::*,
+/// #   sync::Mutex,
+/// #   new_mutex,
+/// #   alloc::AllocError
+/// # };
 /// # use macros::pin_data;
-/// # use core::{alloc::AllocError, pin::Pin};
+/// # use core::pin::Pin;
 /// #[pin_data]
 /// struct Foo {
 ///     #[pin]
-- 
2.47.1

