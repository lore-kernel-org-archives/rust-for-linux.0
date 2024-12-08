Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB5187862
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 22:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733696798; cv=none; b=EsInfI/pEy6HOKgZjxjegHU+OJyhdrqMxxwHryeCzwx9jLxuc9BitrPQiRd4QqIin5MSxLmsu/1YorFfJ825G/1QgQAPjqpuFfaJ6BjbCDXILVCp5AfOaDWQdpKc8E1VuGymAqoKFxDAoXWDCU6PH/wFunlBxk+EVlO7UD/PenU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733696798; c=relaxed/simple;
	bh=Huz2ZJVI+/3rGx5bTiLXhuQvwRkrfYt6MWVVFMmbHRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AexYLoC86jG12LxPfVAFyKz6YaEiKwRVw+AmFl3RPlH5Hwy5KvHhxRS4Y/BuvMkkBOsuGaxatWJnOMNrL9elgKxkvhTs2TC3T8qf9AA3ayCaWpIEgLmQd0R3028D64bARWSCzlm2loLnXnUF31PsmEPbmcS5ZbnNr0zt+jH0rUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOBOMzQ8; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOBOMzQ8"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7258ed68cedso3835558b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 14:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733696796; x=1734301596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw5jNIyLTqCBnBE0TueWL4hF3cpyhX1/kvyuDQSrfgQ=;
        b=QOBOMzQ8iZ+dUgCBktL5+JHvs0V9K/JTbdSrGCgU7sA+Fkgfaaks9rBm2HZ7HoXCp+
         +7PLxa+hyUn6vVXpx1SEwVlpQ3jgj/kZRDxIDnoMzzKmYW9Wo1oDdPl3oYR32kMJLrYn
         CtbDMNWwbNeIE7/xedUx6tNmaApOIokKK4smUcH36aqFamrn3F7H6tOU/mLP05a+RC+G
         lxoJq3vRDsFYhTPzMZj1ouc8O3IZvjam/vEmXbJ+vXZ0sNT1P6Ro3tCZ/TBj1C20awEb
         kM9V+5mRkCzTm+ipTLau2CiHJtdNpZAOC8mH0NO42JmFCcdA56tncg+VDs9GhIMVplHH
         O78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733696796; x=1734301596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nw5jNIyLTqCBnBE0TueWL4hF3cpyhX1/kvyuDQSrfgQ=;
        b=T2RsruvrrUv/RPqVeBqdWnqyRCt7IVAuBlFv3JXb75zrOPU9j8l4uArUGqfPlROOYr
         X3/3bYXIEEvxyng+cWIo0ubb0N1Wt2q+y6Yym1dewM6pPL9Wt6RnFmoem3Md7N8xYiy2
         XIqK8fubGHbImyG9PBa2JprlubL3GqbOWfkEI2NprB/EA5CyVS7+aLkxhKyen1gPzT8N
         bTD2B6jzyZMXv7X1hfa1Zbuys9MX2Dtlm+wtnQfJyQa8cGUXjte05DjoLWBLNZp2dEI6
         kPdA1tS0Lgr7ryf7/MWtIOKkcqz31F7KV5qBTO4fEGzI9Wqefs9x+dVJr2nf7dFZ/VhH
         J4uw==
X-Forwarded-Encrypted: i=1; AJvYcCW9M/vgxvjUA67KsGGn5K/0ugqVInLMQWOujox346/ihssNitZIpRWTEfpcRz/UusN7qvdJlr0x1IcrjNr3QA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZV/iAi9QtW+Mh5stGQl9agpBp07Gav+Zo3z2wx4VOmNLUJLGu
	29L9MOZAr5yekhzIxUrhe0W05lWvFOH9YiW5X3o1Hwk4eyCANWov
X-Gm-Gg: ASbGncurh/dfGSWeM+a0Ob7C8M6maHFzZ4oavJgkVGGFovp6+Uu6B3vXb0MzsxSiC13
	t4Fin/8dXHFwDLSLXaycErD2xomtnV/4O7w/BDe/9cZXcuhx2td/JMFH42xHWCvD9YwuNUqnuE5
	zVaAe5r8oczC+KWLrdJyw/GPZT0bSnOadMp0HCaeHmpRlsxtDedAC0aNOgIeFKXkKjiprm3KnaJ
	GMGxpNXS+kLDruTvnv62KHg+6iZfCmACHWR6H2tek+SjtPqAnGiu31W4LPaDQ==
X-Google-Smtp-Source: AGHT+IEtKvNClaAon8wHtIH5S5jMcfw51u5heuoRie8NCFdlzfaa6YVMGCqCn0sjAmmkp1nCh1HA3A==
X-Received: by 2002:a05:6a21:7894:b0:1e1:6db4:8a29 with SMTP id adf61e73a8af0-1e1871468f8mr17456298637.41.1733696796430;
        Sun, 08 Dec 2024 14:26:36 -0800 (PST)
Received: from localhost.localdomain ([73.109.132.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156e1e20sm6296813a12.32.2024.12.08.14.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 14:26:36 -0800 (PST)
From: Jason Devers <dev.json2@gmail.com>
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
	Jason Devers <dev.json2@gmail.com>,
	Alice Ryhl <alice@ryhl.io>
Subject: [PATCH] rust: sync: add #[must_use] to Lock::try_lock
Date: Sun,  8 Dec 2024 17:26:23 -0500
Message-ID: <20241208222623.54714-1-dev.json2@gmail.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
References: <CAOJvc-b4NXuVKkxCvfKQ4=COBE0YzLAgrgQfYmtu2Suk_1779Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Lock::try_lock` function returns an `Option<Guard<...>>`, but it
currently does not issue a warning if the return value is unused.
To avoid potential bugs, the `#[must_use]` annotation is added to ensure proper usage.

Note that `T` is `#[must_use]` but `Option<T>` is not.
For more context, see: https://github.com/rust-lang/rust/issues/71368.

Suggested-by: Alice Ryhl <alice@ryhl.io>
Link: https://github.com/Rust-for-Linux/linux/issues/1133
Signed-off-by: Jason Devers <dev.json2@gmail.com>
---
 rust/kernel/sync/lock.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 41dcddac69e2..f7d355c5d90a 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -147,6 +147,7 @@ pub fn lock(&self) -> Guard<'_, T, B> {
     /// Tries to acquire the lock.
     ///
     /// Returns a guard that can be used to access the data protected by the lock if successful.
+    #[must_use = "if unused, leading to an empty critical section"]
     pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
-- 
2.44.2

