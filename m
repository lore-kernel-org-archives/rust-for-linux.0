Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4522DC793
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Feb 2026 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770504555; cv=none; b=tJspYD4WyxVGjq9e9oZkOXfR3lni/aDUY4Klat068OSdxCf3HYlHgVlm8jySkeYf7vSiSK5+wVYSC4o4st0wrWQ81UVdVT/0+j0ntKle9hk2ADDfIsYLiTuy2qYlZXWRncqN/jdLUIxcx3z1gNVKfUt/eo8r6Hwf2J8QKx2wf5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770504555; c=relaxed/simple;
	bh=p4sqO1mG97vd4jVtw3NiZSPL1ufijbZuHKgqGBtMU80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgh1htDKesckIHdCUNbaSLRTcs2jYCOdOsHLEW1YhOHQ9KceTg5dRDdSR74xta/JIj976+CDXNAJg27onUONj8ZisLKoVYabLH1UtdhsZ6cEfHc9RA/VSUqRxC9BCqNKVaJq2K/5LfecxB77ZE9sZovI8azRRVPHM4dQtWTdvVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoOZojwo; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoOZojwo"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1248d27f293so8409607c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Feb 2026 14:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770504554; x=1771109354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xmt0za/RINbPauP/GT/yB3oia1AGMi1h2xDlnyHfSuA=;
        b=HoOZojwoaFjaY6CGc2PULu9mt0txoldL5LNUYZfQLiHFBVVQamA/r3BU7I6Sfi5nLD
         a/PSw7Q3VVawncTOgOX3RnjArj3slH6JCDb/wdA6IYzzP37E3uuQps7OZ0FMl9oPYA8D
         mBFIdJx4TzxdXifScMtLVy9OkX7YtbgNeOntKPGLb97DJlfz2qQSZNp/XgLiymNdTZv5
         rVBCyS5YOfULb6QbcX8QhAgGpJGHVwEeaalxKsgeaRCOt2VG2Ys/Eg1oWQjD9uwx4s49
         7N4ACuR90zkZNVnDQmtrtiUuxL0jZoK9N9DZuL7j/3Cz4eg4EWXA5E9T0yTBF3NcJIA1
         gXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770504554; x=1771109354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xmt0za/RINbPauP/GT/yB3oia1AGMi1h2xDlnyHfSuA=;
        b=nidA5xxl+u7biDWKAXoOOyPi+Ca1s5wNe3Z6NMt/JpHh3S40EjQqJW5SzsuYRttUME
         2k2GBtpZeIKl6X044yrsQhVGx7pzDkFURaAne3w8eaYPjtrcUZQ6MxzlP3gkjTfGGEgc
         jDsuOpkFTg2UT7enM50MYxdyByZg7g9QAS72opBI/JsE7uxeg8YCx7tNM+aaRBJqpmEw
         GuAYRSGSUEJ4cpNjWb8ke3iUC31/RLmSIg7J6nSjZ/3HTQVk79ZZYiypOaRCZGobNEFn
         pv9E4VtyITAJrGRijKmdYjBqGBij0fOTIBCM0LsWsKdDLuJSuezQxRcbiEGvXIXWf+rp
         EOYQ==
X-Gm-Message-State: AOJu0YwGvgb64Fk5OTIv7Hh/YzTSNC7coX0O32j6DKI13B3KYW1YM9Mw
	yc9OH07GKijPTXpasKlZuhZqSeXM98KyGsVEz+S7aH+Gbfi5mJKZZV2Q
X-Gm-Gg: AZuq6aJiarE5g/LcaxpEEmX6f9qnZkGE2Axcqm34yFLriaqssL9oYdwO4RKX8HC/ovb
	YOzNB3biEvp8cbiLZe80srOcoQlUaBlk7T+M7hmxMw5n2/8EHFA9/RInujhYwS/SqtUBKIPMVrK
	CnLLnmOpM569QP2uBppMQ3KK2pLpKym8n/m7zLfNQCr4MQ1kgGpoEfhOkwooCGiwni/q/yF5u8g
	mn5MgEEv4wPegH0u9EqBIL8svQF6WaRZ8Ae6vcMchef28i6csLdjQfuVqYnWEtXisbp26syW2EF
	9A3jpoSlqOX8SzQ/L8MCwRUNE1aTCFiQOyl8DJ/TYHTTPIB9Y/RIyGgiEblrKEERZAo/xyvWNNd
	szEKh3XvPXv6rSm+LmsCEhAj71/qT92LvB8kriQgFLsQi4Q4G5HYJFhyNVKeU1YsW0oZQFeqrp6
	CGMrW7ZpEqB0Fl4Ivv7FIhzLShH2W0G4O11A1gOul2Lbbnl0ATMRgTxWpn+GQcQY00ODZ8ThVQu
	uY=
X-Received: by 2002:a05:7022:ec03:b0:11b:a3a7:65cd with SMTP id a92af1059eb24-127040014a0mr3552322c88.12.1770504553929;
        Sat, 07 Feb 2026 14:49:13 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:987e:6d8e:7cd5:6e71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855afdbfbsm4648131eec.11.2026.02.07.14.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:49:13 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Boqun Feng <boqun@kernel.org>,
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
Subject: [PATCH v9 0/2] modularize Rust lints and add RUST_UNWRAP check
Date: Sat,  7 Feb 2026 15:49:05 -0700
Message-ID: <20260207224907.234815-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
References: <CANiq72mB0N3GDe+w8qT_VU1ieMQSRBiEPaFdSVa-2GLDiDMEZw@mail.gmail.com>
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

 MAINTAINERS                |  6 ++++++
 scripts/checkpatch.pl      | 14 ++++++++++++++
 scripts/rust_checkpatch.pl | 30 ++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 scripts/rust_checkpatch.pl

-- 
2.43.0

