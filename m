Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E9515FD01
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732355440; cv=none; b=JxVcjOdUpNRue/0Lgb1gWFhhIvS8bCDI4PgqQtNac9SdlxjgbK6BV8MqIOv5875cnvtQbOqQF7gTSyou0iCNh5YhckrAyu0LH/OOuIW+rwA9INPFwqvoy3IMN+AxE4KgYLdA6Y5B7MMQgcsNFrLQi8Ya8q9rSVaBFfU+Oplry7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732355440; c=relaxed/simple;
	bh=xM8XGlD4m00gT8LnHMKcqEFnZuCF/Xh3HBofdULu1C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GSI14LKiYHohVQoHfByPH5HtHe/uCg69QDUCISQ1Hf5dRMKEHyVc8Ex6tpFKZ8fby+Onnp6Z9dZQPnrZFyzkZha9D5c1RgGiNCotQY3ctt4OfoLMCB8n97m5p93rCUM3Cq15Yy038lWoGhwnvzoTN7+YAnUlspaN7UMrcgtyask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=2edE2zhb; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="2edE2zhb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ced377447bso3712276a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 01:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732355437; x=1732960237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okF1HNNj4G2KLPkFyMq8ZAw1P4QOFUzANjitSL64PFs=;
        b=2edE2zhbzqqclqcpstxtmmQstJy0zQ9m38n9C8dAOOQZnDSmArIzwB+7q+b2c2Ay6/
         Z8c1id0y3MBy19SmNgf4cMCvMoa6xOoQ94mVTLn2qAw9D/odtp2JIHkjkXU0dmGft/1R
         Pyt8nHhlIaXPRmayrKNJ1MmQxFHGl8TFpelYgDWuo3Hk7y3LRoUGqQKBQWCBkXki9AZl
         nHCBXiwJswbElPepG6zwQVoKXydJJgAfT4P2sG8+KKZ+MYSU14weH/EEOwaF7htjT8r/
         JGSq87Nlp54RDPRE3NuYA2twe4s/C6xzcDlavOev5vbCqdPA7S5tL2bbcg8LvzngYMPK
         GH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732355437; x=1732960237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okF1HNNj4G2KLPkFyMq8ZAw1P4QOFUzANjitSL64PFs=;
        b=CgGtS0oEAQBw3N9B3Kjy6rD3w8p4XF9dUvSd8JfzP1y+Sm7NxizaQ/j57UKiZPC2zr
         vgklZ3GD65xep8J/2pyFMBugB52m1gDSkwLFnkqisIxdT/bZSGumcHcTHvKLxvBmr3Ep
         VVmKEB5O9tBiQeYNmq3ShiZ72e50mGEjNb/d6W9RqwHsasS4xNIs5Rmprz4NAF3DsYYE
         cNpvLKV0Lt5H9Xhyf/uuokSSY0Np7P2fUr9RRKs2O3ATdrWc4aE5KbgoKYqhbXZDFf1U
         NhJxKXa8xBmlS01kvzph0XXnwL/RdFLFfM3lRFFouTiKZmdL0rF6g5rxmifYy/SiDs1b
         30YA==
X-Forwarded-Encrypted: i=1; AJvYcCUL2VisE2I9AodjUnbM1prWK2DfD22QtlKEeRfpivqbrCxQ/pxqB45vOX1Kx4hSshqyvfJb6p/tOrkkk6WUPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mmZ7YALJZxNERLKjk8KhoL9Xcg1PqkSleMFY5z3scpETgr5B
	An826dCUzCz6sabQ6ffgR+3odK70IgXoXHN1lOeht5r1s3/K/jx/qD4RGqPYxFI=
X-Gm-Gg: ASbGncvgTUD4oLlI4wfB4zpfBXh2P/dr0FZhC9TdcVBuIyQ83CiA73HKDKWs8gV1mq/
	CF4DIgnZEMyoqZWW2gmcxWzBsnTCTyO2hfX9m9s3VcaCn/aNO2RGjKp+fqCDjsYV1liLZJJlqaN
	lq/LRUfLBEWiM4zVrOf9swPR+nM3YUwH25D8eLcYO8106U9s5Td+Htr5xa7sd1k6HGaRTTH60Wv
	TivJRiHFFKA6B98Z+ZfR24Nf5MnagXSekbMu+Jqcu8=
X-Google-Smtp-Source: AGHT+IG4zLmLKX3ywh9qzk+WuinoaBdC11SZcLqPvb+Qh0+VN9VguIfFuPtrfElqz/9AHLXMzfg7HQ==
X-Received: by 2002:a05:6402:40c5:b0:5cf:ae1f:84e5 with SMTP id 4fb4d7f45d1cf-5d0205c9471mr4474782a12.3.1732355436681;
        Sat, 23 Nov 2024 01:50:36 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41af39sm1806918a12.82.2024.11.23.01.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 01:50:35 -0800 (PST)
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
Subject: [PATCH v3 0/4] Replace unwraps in doctests with graceful handling
Date: Sat, 23 Nov 2024 10:50:27 +0100
Message-ID: <20241123095033.41240-1-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the following patches, I touch on error handling in the documentation
tests/examples. There are multiple occurrences of unwraps which can be
replaced by a question mark operator which should simplify the code.
Also, people typically tend to copy & paste code from the examples
(citation needed). If we leave the unwraps there, I think we can convey
the wrong impression, that it is OK to use unwraps unless the programmer
has a really good reason to use them.

Changes since v2:
- Fix typos in commit messages
- Remove unused import

Changes since RFC/v1:
- Remove opinionated changes from `rust/kernel/rbtree.rs`.
- Run clippy
- Add description to each commit message body with rationale.
- Link to RFC/v1: https://lore.kernel.org/rust-for-linux/20241116195221.373332-1-daniel@sedlak.dev/

Daniel Sedlak (4):
  rust: kernel: init: replace unwraps with the question mark operators
  rust: kernel: rbtree: remove unwrap in asserts
  rust: kernel: page: remove unnecessary helper function from doctest
  rust: kernel: str: replace unwraps with the question mark operators

 rust/kernel/init.rs   |  6 ++++--
 rust/kernel/page.rs   |  6 ++----
 rust/kernel/rbtree.rs | 46 +++++++++++++++++++++----------------------
 rust/kernel/str.rs    | 28 +++++++++++++++-----------
 4 files changed, 46 insertions(+), 40 deletions(-)

-- 
2.47.0

