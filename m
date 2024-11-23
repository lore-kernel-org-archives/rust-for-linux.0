Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6918C015
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732358981; cv=none; b=SQIKMXJEMZsaWikmpqS5UmcZ+IkjquZ/X24UGqVRBz5yCEciL9QmxuRjYV6qzMPQMHj5wAmC+rY8y6dvUV9p5MUiBw0+F8zU/e7JEBgVAI4yf5JpU5u37mmPW4hVhTCszluON6Kc5mNFumLEt+f4iEZvIc85Tw/zVtBs0GQMCJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732358981; c=relaxed/simple;
	bh=l5e/fedUXXgZbt7j8yrNuQFGz5WJDB8IIUFqB3GH9iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlekyRxz/F4i8pqtzCZatiKkC6CqyGpv7+DmqPb/gHaQgTssyNrE2/Yqk/I2H5VoP8KWclotKxT5nFemAMspxzTx7QJ/O4FBL7OLeXp0fjm6oo3liLqr1AlP+i6r5iAAFKs8QDMUdu58WbMZY1dbfPr2W5VYkk1bHcBfGGTK6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=AbCaEDhd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="AbCaEDhd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cffb4ff85eso3939166a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 02:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732358978; x=1732963778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uztOev9Br2eCEGcAQuyqESkApKB8AQu9zJnJsYYwll8=;
        b=AbCaEDhdgX4/ofKFthfXADClwA7WijaofB8CJtU2jvCoH808ym9t8WZyVLh64fpZKl
         +EIxkzUfFFhiz8gsPfYE4LL9btwJ1gSH75IDxn6AcU6wNYNvMQLT9ynn+/z9ovtJSQU8
         J3hCye61dHrmzBZNVBJRil90ZY5L2K2Hpsq6PvBTrLQ4k+2W9atY10wIYT2RGz2X1XWL
         XqjN3L3Z8iXiel7D4KK1UoIZ8CYfPATSYBlfbi6YCJBeJGKHEe5dE+xBCr3OmjGWj1xV
         tjUb8aNtcupA3Izr4Ivtiqz904jGsorEyqfWW/0Bxbbdd+XXqSCgzkzXvUHibw0VzJ+8
         M9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732358978; x=1732963778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uztOev9Br2eCEGcAQuyqESkApKB8AQu9zJnJsYYwll8=;
        b=n4sM/m+UrP52hFN4Gsar/WMDFkrD9LAT/i901gbm00Rh21WJxcOqJEDFOwwCkuH3zw
         2lD3XM7MXz9gDTnSNY+kSsd5t3fnD6mFpwW6Ux7DyDhueOMhlcxdReo7E1rt7uG7COYD
         xcqVolJz6WGSz+WW9pFeoO3OMkpvIXaoU2i5Sdu+VW2EGNgZ/NX6Vg36f4SOKzUcj+ru
         Cc/xi1iNoC+fNZ3/9C9Va/YkbR8yD//jRT0NDF0/x5iRORuXQvSMhsjg54sVJEd55F/C
         duqySfM4Hku2q8rDx9XznY8Zs3GX+Ulg+FHO3eeyBgJLM++1eWR4Nv1sP+UwSUmavo2m
         NkTw==
X-Forwarded-Encrypted: i=1; AJvYcCVU7yOevJtg6EyzVIOleOJZi1qW0kdIPLn04H+oYMjZNc0kf9H+CH+Rv/wpSSIhADD4iOQnb3SDsiQplTnZZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOhYLl17ORMUb4M8nvOghrWW8+3EfYxHEhSOXC4nsIQE5zuTdG
	HJaO0A1ecjU1kbRSUyN6Xb6FDEmcnhShr7ZqbRzHe9YUQt+7tBmoCgwQN0bKqwA=
X-Gm-Gg: ASbGnctgwZQHFKwLI+NRK5n3+w6VcLwjGMxpUfsRrNFehREQU+T5Bf68y59fVHSvpd6
	/gRASPEb3jbQRADrXulG0OYvK6+I421blV1jH6Pes9u39/XUNA5m7UU6uE0PvbBxBedtSHvWAXl
	qUfmFnTivhuv7ulBsyqHsZlqTSDCDTL4xnusrgnbsCc3ZhNcKrOgRp9Rvn9sZou5RCyENDAzj2E
	G0z8D3EsBo03HFNuJneBGzxz9EpF+5rsC8B4J/ZxsU=
X-Google-Smtp-Source: AGHT+IEowTRfjPgSf6+BcjqDNR6ElDZtkK0zV6UDtGGt0Pl/n6iynJ5chusjbRcJVEf30s249BpcsQ==
X-Received: by 2002:a05:6402:35c8:b0:5ce:af48:c2cc with SMTP id 4fb4d7f45d1cf-5d0206944b1mr5359582a12.27.1732358977818;
        Sat, 23 Nov 2024 02:49:37 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3b0fc1sm1908463a12.28.2024.11.23.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 02:49:37 -0800 (PST)
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
	Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v3 0/1] make `from_errno` use `try_from_errno`
Date: Sat, 23 Nov 2024 11:48:56 +0100
Message-ID: <20241123104857.49385-1-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, there are three patches for this issue. There was a race condition between
me [1] and Guilherme [2] because we both picked it up as a "good first issue" without
knowing that one of us had started working on it. We both agreed that one of us would
be the main author and the other one would be noted in "Codeveloped-by." However,
Guilherme has kept radio silence since [3]. So, I am resubmitting the patch, which
builds on top of [3]. 

Link: https://lore.kernel.org/rust-for-linux/20241104185135.18974-1-daniel@sedlak.dev/ [1]
Link: https://lore.kernel.org/rust-for-linux/20241104200014.12996-1-guilhermev2huehue@gmail.com/ [2]
Link: https://lore.kernel.org/rust-for-linux/20241105114819.14051-1-guilhermev2huehue@gmail.com/ [3]

Daniel Sedlak (1):
  rust: error: modify `from_errno` to use `try_from_errno`

 rust/kernel/error.rs | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.47.0

