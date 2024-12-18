Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6130CB673;
	Wed, 18 Dec 2024 00:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481442; cv=none; b=YSFKsSytEuVp6C2bMR/SmuC3xG/8fz8irwiuh2/zcO8oYK9yUSr2OVWKgYsMULaZZS+5IqV1HHTNvyAicpAgae4VkpPv/n1h14W9VkMWFCLVto1eSDMtMPPB1+hZmMa5TMS0LYjQ7P92U4EQN8hqX9tlVoiFdP2/bsVwSnbSQ4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481442; c=relaxed/simple;
	bh=n/zoxZgxg9IlhQOEr+3TkyNuoTsR//D9kWpwtLwXyYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLJEcaDlyFQAw3loZu26TyYQ6WglcFFE7/T89gEgkMAZbgyrZopoMpIZtoct1lMNRsVmWdf8x/tAMT1MVQoR9NO3PfNfduB0x5FzmRSLaR7Ez1+0TIqCPW+nzF36YHPDjFDxmturTlOjZs3001Hh49oEuTrXu5d8zxMRHxvGtqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6fflNfT; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6fflNfT"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fc93152edcso185667a12.0;
        Tue, 17 Dec 2024 16:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734481440; x=1735086240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpUyO4+1q/hT06ZgSTeMvM8lqeVLtEHow9cN7Pnoxl8=;
        b=K6fflNfT6LaYt/gLqHbC01x5j8LZDCY3M7HrNYDswIkrwMwvm3H/zI9Fir/u9ds/HD
         6uS0OfH3cLaemtO9rT5olCNuGz4dxdT/YSmCui/nB94HiShlOGRd3bJjXAu9cLYtpga0
         6rlw2beDRGZFBFhdqqCwHTxCCNtXtjSG0yKyKlz5rImt3Yi4oPkyhIO40hpgXhtecBnj
         6KV2yFhKYWxCBSJGySuErhOutRnlWZIOK4pevi/cgHVmsWRZ1ta7gcnlUBL4bBY0EXNq
         27e4YzpuYLgVwE6gVkaxW6ckOmiUeLIEnZUTFfGCkH3L7YKwEw05UpPNuus+XP44Gu9s
         66zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481440; x=1735086240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TpUyO4+1q/hT06ZgSTeMvM8lqeVLtEHow9cN7Pnoxl8=;
        b=YJMQ3aUNJaGqTNMULErFsHEDcfnvd9tJxzKvxPKEdxPKj940FTLp0hP5MOl7qN7hRl
         hiyerJiL63RoB9eyH1/0fAW7jVmhtHRJf1ZehI0/7SPJ7MFZoHA8vkcffgl7ZhxtlLNl
         BOWGhuRiP8PuGsUwFzS4O4N9hqxFw3Jv8Vl6NiTnMjmoIpqWbOj9uEmpJvdmSejRShwQ
         /a3N0XlAFdixJOuwp1sA3mgzpQUy68Aa6AJ32czHkg9l1ZnApt1LQM/bmNpa9JjG7FZN
         n87vVDHvXdy9JzB6KGbO6YusuftKYXDy5ZnM/JnWc+2kUPBu6ShnCnEFEeqWatwrSxEG
         DO5g==
X-Forwarded-Encrypted: i=1; AJvYcCVwfaMXiCB5+hnY4XtGSe+7o1sY5h5vzDGoh8H7x05Ok98i2r0x79b9MFlkU+SnOPsyKFrhxMNmwjIyZ7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YymciLACU2C23/rxoZBlBjGZVSCHoXa3k27p22wKP4l6cIKjaJI
	7jqpHIf2x1SmvmibS0DsErj47pQYVEJzc3DK+LsFJzhwhzNDHXeY
X-Gm-Gg: ASbGncsMe18i2CFZuAv8kEAKHo6BKgJ3YMk9Vd2U3hJCqEUL21LucG0eN3nS/dv5Lws
	lm+94heZ/El6AS/QiomL+elglkvoNkIidfUcikPUiLHFlTmq2TNHsWbU/ZxiKsSi7NrrI1+s1h+
	7x5PjqJiK2/gsRNJXLvOgXfKz3t0Mf6H/YnU+By3wofUBF5nmdXk6I6aa/To09VSEh45rbrp5Xk
	9Wcbt9rlKeOP6L57DGPP6art5muHCs+F2tawEg5aHPINdBbvXyDmcvpp6DHqbJHOQ==
X-Google-Smtp-Source: AGHT+IGjf12oUQb9dha30LknrNYXMY5WTdCBsL72WTp7904gBFM9ph1dhUC8RbVgJS0bY6fviz8caQ==
X-Received: by 2002:a17:90b:1c84:b0:2ee:d9d4:64a8 with SMTP id 98e67ed59e1d1-2f2d8654b36mr8217883a91.0.1734481440551;
        Tue, 17 Dec 2024 16:24:00 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::5fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed6417d7sm97932a91.23.2024.12.17.16.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:24:00 -0800 (PST)
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
Subject: [PATCH v3 1/3] rust: error: Change `LayoutError` to internal
Date: Tue, 17 Dec 2024 16:23:10 -0800
Message-ID: <966cc6950c3e8705462f330d2bd002d305ebbc93.1734477232.git.jtostler1@gmail.com>
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

Add an implementation of `From<LayoutError> for Error` for the
`kernel::alloc::layout::LayoutError`.
Remove the implementation on `core::alloc::LayoutError`, because we
don't use it anywhere.

Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>
---
 rust/kernel/error.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 914e8dec1abd..f6ecf09cb65f 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -4,9 +4,10 @@
 //!
 //! C header: [`include/uapi/asm-generic/errno-base.h`](srctree/include/uapi/asm-generic/errno-base.h)
 
-use crate::{alloc::AllocError, str::CStr};
-
-use core::alloc::LayoutError;
+use crate::{
+    alloc::{layout::LayoutError, AllocError},
+    str::CStr,
+};
 
 use core::fmt;
 use core::num::NonZeroI32;
-- 
2.47.1

