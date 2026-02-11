Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BCC345CC9
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780639; cv=none; b=Nn5b0F2UsZj/zlex1QlkGn6vzWKmvKluzfDzswXwYMDVUQEisjrGJT+6PVjnv+AOK0RC7IyjuqfxEA7zqNBD4KrcXjMGTTY6eTOQoDoJiEODGkklR+DPOEYZ8RyQM7xqhosFT3JAHE2px1StFFfJW2zUpVGoWnDwCqg0BXfcKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780639; c=relaxed/simple;
	bh=FppKemrwtWk7l1BEg98yFq7nk3dgLMRXUW1h9vBpl4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMY0rRVU/jj+9d6gGAocFg1hre5LJyFKoHGnKoAVZNPgoUjxehp2EQtvbacrXJAXSNDVbtN++npUe/2+RNVk44s+CiUCOxHESK/cwRAoVwuWOvzzJrWjrWl4jdO7Ge9jKeCaO1EUyifV6vAJ093uf+TiGnKb7GsWiamhcrGnH0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqI6ICbz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqI6ICbz"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso569348a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 19:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780637; x=1771385437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viBpYkVWc9cE68UFiQJOVrqrE/EpXnGovXyJD9hjSPs=;
        b=AqI6ICbzsb2BaM28dkfJzC1s0VCKby2Jjh0sYOshnzToGY8D4kJ+W80yGkWmBMtNpq
         uxV0fch3G3Canly3z/cAKYQdhFpd8wfRtpwc345q9o2hIX9EeiW9dmZdQZYgWNBBWby3
         W6oVJDGwtLxxeKosU8VGgQrR6PTQxTmgugZZt3n0X4XqlJw9mR9RknD6FbrT1emihhtd
         aA3ZLWp0V5xaYgDBLmWyOE3JmD+falHdgj7vwLcksen/3XzqW2Fyw/ULq39gZ80+9hUq
         yysM1hPLQppWvNe1q1G4m8EQ4ofLDLTKthYHFzydo7x3N+sDtBwc08mdUt0T2bQi569V
         nMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780637; x=1771385437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viBpYkVWc9cE68UFiQJOVrqrE/EpXnGovXyJD9hjSPs=;
        b=iKxexmuF+K8Mxm2yJ5lsF4X65Jj/Gy5NV2LbFjjJuhqnBQO4JAnVM/SjEOVo1HwlhD
         c00n3yY+1Mp9D3PvGEh7RQjB1FMkwFYs3LmEq9Gs1J1Y088fs+wYVmxbuH9ZUWIBPmaB
         q2Gv4rGSqaQaHua77skiOQwWCSwuI3b5kAIyClxj35D3qjSrtsaY1Clzvt1FAna0gYQg
         HUkGh9bZb6v2hasl7NW605jh6Dv7c+zavCmzXtmg82hRuITrgC4v8grej8o9i4tNWKTv
         h7lKg5PlcEDlZ1hbl6fTXDVhN6mg03plHzzYo4o4iqFhiy8M5J2v/w2kslAG00eZKvgn
         2czQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNMwaJfRXk5Z1OzXNALrCKg/cPf+ybUTRJp3EDexXKv8fWrYp6axpZaM1j3vh+PGCGA8mvqx+iij3entw9qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdMnmiPuepeEM8QD10wNU0WyMC9o7lslSIUs8WpkuR3ZwdTxY7
	+/QpqpphnJDz9+ZrDraDtJFdgO9CaOlOks6D0m6D6qoU21sQda43BTm0m6hhd3kPygo=
X-Gm-Gg: AZuq6aIlCDgu6gigMKdP8ETMdk5ni0zGk1RRbhaIQrdFJiLKhNCHAPg67Y1SMHAQgDl
	kkRjKpnwpHazG6uv5ob+OK3TVgXj0RGkziqNcGrHlAh5W19nBI2B8qC8T81pOzm8DpuW7sZV2TS
	ZBcMokPTusDvlm6mh1C0sSqasG1+x5Llg+i0qTGP8VD+5UkxclmIzVLlCsj7cO8jmlr2dtkwBYD
	CmpQkLfKnUDVwND2FWViwebF8hHrvEviC8a9g0urQWVTl3B35g9DsfDU/MeuEzuXQ4k484Qvqa1
	J5Vbv/U2tKw9nJOX7Z8yM3eMqjmaY+pZWxx07/3cYMv+uIbolPDgcgvQKpZ5Tc6xcV/Y+br2mc0
	O1m5qWxqx9oJfsEndHClbm7YB0DgaT8XbOiYqsMxs+7qca+JxrKlI8JSNAVaa5asSg6KLDtZH/K
	m46WanBozsh7a1TPVwx5mdGQc2KNAtfx+E1W9Zj3Lfkg==
X-Received: by 2002:a05:6a21:a92:b0:342:9cb7:649d with SMTP id adf61e73a8af0-393ad01e8f0mr17914368637.26.1770780636948;
        Tue, 10 Feb 2026 19:30:36 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d63c9sm464856a12.20.2026.02.10.19.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:30:36 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: bhelgaas@google.com,
	lukas@wunner.de,
	rust-for-linux@vger.kernel.org,
	akpm@linux-foundation.org,
	linux-pci@vger.kernel.org,
	Jonathan.Cameron@huawei.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alex.gaynor@gmail.com,
	benno.lossin@proton.me,
	boqun.feng@gmail.com,
	a.hindborg@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	tmgross@umich.edu,
	alistair23@gmail.com,
	ojeda@kernel.org,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC v3 07/27] rust: error: impl From<FromBytesWithNulError> for Kernel Error
Date: Wed, 11 Feb 2026 13:29:14 +1000
Message-ID: <20260211032935.2705841-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211032935.2705841-1-alistair.francis@wdc.com>
References: <20260211032935.2705841-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Implement From<FromBytesWithNulError> for the Kernel Error type

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/kernel/error.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..569d9d032ab3 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -12,6 +12,7 @@
     str::CStr,
 };
 
+use core::ffi::FromBytesWithNulError;
 use core::num::NonZeroI32;
 use core::num::TryFromIntError;
 use core::str::Utf8Error;
@@ -251,6 +252,12 @@ fn from(e: core::convert::Infallible) -> Error {
     }
 }
 
+impl From<FromBytesWithNulError> for Error {
+    fn from(_: FromBytesWithNulError) -> Error {
+        code::EINVAL
+    }
+}
+
 /// A [`Result`] with an [`Error`] error type.
 ///
 /// To be used as the return type for functions that may fail.
-- 
2.52.0

