Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF923542C9
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770498499; cv=none; b=jf1ZmZx8ngzlQ64ACoRHNSPvzjsVQuYy7atl0Skbex6Vz9AMAuCgt7W9rUQIXC6E0vbK0JQntwjSBz1dSboYJAQo8gKP1DrAS6rExQFhlcZMzt7bW9cke+0+CC9QFNfjzj/xR0/mmkX28vi7M61roJSZQBbPIbhGTBCVeltjjQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770498499; c=relaxed/simple;
	bh=C7nWhSH5ZIBC5gMfK4XviN9conYjV/ZPoeELP6joANw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8B5AAdxvJsgwiyNLmX2EmmX/1urmzmUAOZzGka3zMlZbimhTdG82tpW5qCaHgrm9otlXTqSnt+ZYkparb6H5T07FXA2RfEln7XpxnF/E/PiFvVjDV6Q8ro1lXIhZNaUkHH3FeLr+Egk5h2Y4GuuefkMQupk/odhV1b5HqEWdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqEOCaKt; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqEOCaKt"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b8397e3e09so3809679eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 13:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770498498; x=1771103298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNVS1D5uVOL3ZzlJvhqueM/TaA1XdrpiV4JrF6+Qf5Q=;
        b=hqEOCaKtRRIz89qh2zgftZyl9zbIAgQXTFTvZEF1lBcjVeO5n9V1UyNuDwb3NVOWz9
         1WAB/oNdXhxsCoiKmKnc78EANZ9IwlIc/1g4URf8G9Bd6bCzKiHdB2PKBKzu+CAJJ2fR
         Eys6s+hJWXblAq/ILdbMJTjs8qcADOY6s06CJJ4COtTgnjdXhLRmVr+hy8kp6yx6KhD6
         ux/sLICVACFkF32UjkJNYLVpZX3aLeggo29hW/QLrsrILiij88W2mYM6k2OvhogIsmBE
         ZhP20B4Kk9pWvngwrio6kXn6eLZj1aKW6ls66QGlPil/QIUjtYW9ywX37p+zTv5C1hFs
         Hp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770498498; x=1771103298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNVS1D5uVOL3ZzlJvhqueM/TaA1XdrpiV4JrF6+Qf5Q=;
        b=JqXT1S3PvW2qJlVM1+LuqMLupXbVC1IUFG6z4s7HKyvIObTWEZFswPBVEPuOkXMrvs
         IpMP7P3AXfH2tiCLgxnUwRqEzww9UWU4A2RRp33B0W7+EBTCqtp9UaKnHC1JuTkritxw
         IjmZbE35JJWFy2e2mLaOVz4Jhv5cm+Av4PP9DqBiIWWiwoykuTdaZmeUHnpyLR/Q4TJc
         7zq57Ie9B24HERm5NwxVAf+0WUP0qYCT3oMszgSb17ywcnn+G3y95F3izqNKapQ2CjCR
         EU1DFLhahfjYIYQm8KyxArWR8giIRIAlIBwTJKw1c1mmTUQGy68baA2cBan30EFBh2YV
         8Heg==
X-Gm-Message-State: AOJu0YzG+4ZePLcdGY5vrpqg+NV1ORi5BHwFZVWQ7as04q1vEyHighOg
	KWRKjaAmPlwKWIcMwHAScmKtPaCnkQ57t058EAVIruNr+eQpMukpPRfW
X-Gm-Gg: AZuq6aKeURvfBpWY7aSQNp2o3G40dgb9n0JEjSbhI+/Unb5zipHrFgySpMNNuP+DDr4
	RTMGXGgWn7GX8qkokWa38j6s8i+z43Tb6Q9UGEk/dxniAcnvXClHq1jpQF9JSabdCdBlki+Dfzy
	tELqOhk5gEKhkFoavt+pOVc3y529gowkmgDeGDSR6iCQiLNmHp8YX+j1MXjeTKDicpAY1w4b5gF
	Ep6GUvsQvQY+zJb7fNtAXAeB6M7SpBT5tGOQuDdM70VISsJVGD+M9CjCrKINgetjpttSzrYR8j7
	gsJK2eJfKOTeGBu6FyNYzldAdwVibhUAy0A+BzZr1wr8HnMhynEpifaXOtPqQe9PaZH/7sDFql4
	NaaOWnDDLa60QyvNyuOwSa4Vv37gwMBi3b6Cmns3GfJPLURDLTp59Ngqteaz3hwJynX00f9S8f6
	qIp1/kw0xyNuDwixJMXyi2cftkRxlgLjjg61uEEbsJ24jmK0xJnley4JnOl+K87WqE
X-Received: by 2002:a05:7300:b594:b0:2b7:ee1e:75f4 with SMTP id 5a478bee46e88-2b856a5b95fmr3056648eec.42.1770498498216;
        Sat, 07 Feb 2026 13:08:18 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:987e:6d8e:7cd5:6e71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855afdbfbsm4504628eec.11.2026.02.07.13.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 13:08:16 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Joe Perches <joe@perches.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn.roy.baron@gmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakru@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v8 0/2] modularize Rust lints and add RUST_UNWRAP check
Date: Sat,  7 Feb 2026 14:07:44 -0700
Message-ID: <20260207210805.196759-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiq72kXaFkL34g0V3isOp39VqfN5Oaj9O_A0o1ipERFWhWi2w@mail.gmail.com>
References: <CANiq72kXaFkL34g0V3isOp39VqfN5Oaj9O_A0o1ipERFWhWi2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves Rust-specific linting logic into a separate file to
prevent further growth of the main scripts/checkpatch.pl script and
introduces a new lint to enforce safety standards.

The first patch creates the infrastructure for scripts/rust_checkpatch.pl
and adds a conditional loading hook in the main checkpatch script. It
also updates the MAINTAINERS file to track this new file.

The second patch introduces the  RUST_UNWRAP lint, which warns against
the use of .unwrap() and .expect() unless they are accompanied by a 
'// PANIC:' justification comment.

Jason Hall (2):
  scripts: checkpatch: move Rust-specific lints to separate file
  scripts: checkpatch: add RUST_UNWRAP lint

 MAINTAINERS                | 22 ++++++++++++++--------
 scripts/checkpatch.pl      | 14 ++++++++++++++
 scripts/rust_checkpatch.pl | 30 ++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 8 deletions(-)
 create mode 100644 scripts/rust_checkpatch.pl

-- 
2.43.0

