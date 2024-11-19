Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F0953363
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 19:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044985; cv=none; b=uRcyQyyif9pRlKXBhtmBfjRR1J102eW49EMQXwvwG6NDllL9x+R9Wit7cOa6AdeChfkzGAZgggRh5J42t1iXZcMvIBa0I2QcXi4pkLEd5t2JaOwzfVNSupmmx0G4u+4O2nEPcARX1awOEDiXRWwDzKzXM50Sx7TlrMRL1Ldu2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044985; c=relaxed/simple;
	bh=M4XqYUKCjcyBOSDyo0RR5szUREhfRH+dRBp2XxaTgwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nIj5KOsdS95aZB6oaIePYSr43rwR+7E4cx5mGe50Vtyej8LG0g4+9w7dx/rx4PR6ryl5EjhNQWtls3t32JzZRruso2A3NbGCaxF+G/c4pRYHrvAUG64n00TsjCMfB8YB7+FzLhB1zYgLL5iONMmppTFt18UrdcJaCBZ31QGUN2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=dlO56q++; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="dlO56q++"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so12316985e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732044981; x=1732649781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfpgmagDf2j5vYDSDMAy8AnRCj2ZJSqIl+XkeL/9NgQ=;
        b=dlO56q++H86DmFy1u2elPByPKL+YBNErON6IovwZ7n3LGgAB88OU0GiQgmNLq4r3JP
         kva0O+XW5diJuchQKG6SHEu5sGoOrY3JIjLApjbEJCgbuvVijzYOEcoOsNfgudoJjuDq
         sdR651nPPpZk+fh176E71UJ4Wq0ApcJFuQnD+RIpWZv1y8GflQnWPEfjQGc9WfcdGgwP
         rnIxvqAKIsJvYtFTWo1IdnWfpnH0mkse6yO1G0x1HCF7UHSdp7th01jmMso7zPjJdb02
         mX0JHc7McJ0eI9XjF/pUEsyVhktZ+DsIEddjJ7oz+uby1nxRbSSlK4+R+shAgxaPtslw
         bC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732044981; x=1732649781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfpgmagDf2j5vYDSDMAy8AnRCj2ZJSqIl+XkeL/9NgQ=;
        b=v/mLaq3cft67Ztzqeo3YX83Px8zo87VX9YOBINsM0Y09OIrbF4JYjWB4xEcwIGNqJu
         ekbouS0FWk2PXWidZsOuF+2O6H4qyb61sdVQL+oNFM0LID0uHHnA3lc6TpVFz2hXlYuw
         uvxfWvae10bAK3RDOqBhAgm8OIVzHzMcdt0RMhORBHiRU7xLfrIcp1qouqUm/qID9AN+
         AAsURd08DKqyw2KxPEO5ktRCmrr2uD/y3PSc0atqVun65Y5LoMdwZFygeB7xL6EOS3ms
         qV9vN6dBrFQVTExc5CNWtEcdcuQ8SEyrH6BgdLzmA8Zo4XfJ7+gThpQ5G0doU7SUbg/q
         tYxA==
X-Forwarded-Encrypted: i=1; AJvYcCV7oQ8KDWXE5NjGMsdCTYjXQuZAuB7xBCE23JcebWbCNwIjykXBrxEUzNKoumFjdjPn9Z1ZzYmiEhMZAlNl5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnfHkkVMcTUySLd/fcxAtg608UBX88672MRiYgjJynY/ZCDxc7
	3t5S1P4IaYOUcU0YZa9EzFo6bf6rnfuqZn3jksznR3vZohTIzD12GVkxFXFHtfI=
X-Google-Smtp-Source: AGHT+IGaoSkV5cZQA3gsLQDaeqqA0rFDjJaNv7FLI/1rw93Msck02X8HJVQxg09Q2DfiFNv/ukRqPA==
X-Received: by 2002:a05:600c:a08:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-4334f0219fdmr1204825e9.27.1732044981594;
        Tue, 19 Nov 2024 11:36:21 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80869sm203127355e9.22.2024.11.19.11.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 11:36:21 -0800 (PST)
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
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v2 0/4] Replace unwraps in doctests with graceful handling
Date: Tue, 19 Nov 2024 20:26:37 +0100
Message-ID: <20241119192715.38282-1-daniel@sedlak.dev>
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
 rust/kernel/rbtree.rs | 48 +++++++++++++++++++++----------------------
 rust/kernel/str.rs    | 28 +++++++++++++++----------
 4 files changed, 47 insertions(+), 41 deletions(-)

-- 
2.47.0

