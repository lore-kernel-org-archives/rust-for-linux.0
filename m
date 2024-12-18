Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60AB673;
	Wed, 18 Dec 2024 00:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481436; cv=none; b=ugGlVG9jRX+QrxhHvYRFOxCXTOKdFsAzAzLgGLBQ8/XvEZTWRUBMguIGAm8cmcqROqJeG3kBtXIjzeeMC5EgFzh1NRDf3Ad9lEQ/CXGfQCkjN9KTLU3BcNACZ09jJa5mlsSh7EoDg8B4MAZkIQ7hHZ1TAyXljfD6i6LXg7JAQjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481436; c=relaxed/simple;
	bh=ntAmQ7iTPfBLxPSk9eLlj/qS8hnr+T6cDQFbGAVC7a4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eyaxcMQ41G2O4tP7ZkhTTdLcwel3oovM59/mG3f29zPlrMr177ZkUr2OrqpIbLcoo59CCspRP8ft6DOYQvjG9hnAx2vI62Hmxp9diEpXpgl1sH+FYeVF/wDP0kZcgERq/ROicrUVnkKiu2z8Ea5+PAGRdL5n3Yu9AjWddpQTSEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bwhk80ga; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bwhk80ga"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so5329528a91.1;
        Tue, 17 Dec 2024 16:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734481434; x=1735086234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MO0h7JQ6b1C6fPfifjfPDKFjZ9kp9FWjeeL0qWt/igo=;
        b=Bwhk80gagQbU58mFwVg9TybtS6rzHj/dUxgRJGh3Yg1K36vYDl0diLrhaq9QtxW+w+
         abEfz3nVwbs9lCd3/rvGPrygyi66frhDbwIm1fK8HejLHiNo1AwFGUZdN/Sev5Iq7Gut
         S4j00jf2vRKjQLNPnx/83FDfDp2wGLcGdj9MrCIJfSiICGN5t35V4huOmp9hj3zOEbck
         Wvdl6g/L5sg1DnvIKF4imYGvhN7ogpGlcQPmqmYRq4fbkoBiLUnTvYnIzJ+lICvX4Hz5
         cC/JcMJ7XzmBxCUGnkwh/nevjGjNp7HtTUK1oPtlEsMsiknlXyuj1yy9nSCtzACThBTc
         pyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481434; x=1735086234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MO0h7JQ6b1C6fPfifjfPDKFjZ9kp9FWjeeL0qWt/igo=;
        b=lRXTvcb6ADw3REzDPpDhAT/N4Op/e43A4N+dpLUOcJtNeSW5TYuQGyD5R/+Eh9zgke
         4V0d65IZ4QddlWLJa/qHJCJTTe1dPHP997krVkAkxpAo3Qzvb+ib/ZJKE+G1iKQ4sH87
         Dopwr/Z22DsgRm05Yi8RMhEqSlztHmjeqq5Z62j+2JYlbs/+bHu6SJaEN0RtBopDCFvX
         Sgya+5549Edyo2EN/0bTNgMy7DoXbpIVRTQzaf4FE+5phnkgE4da9P6gi6yb09sN2DF2
         pWpwCF9DtXKXyeyUtR8WBOmRlyagP7xV/r+O9KlwHfitq9tZQyky93tBHyoEyQR3y7pl
         rUaw==
X-Forwarded-Encrypted: i=1; AJvYcCWtCfa5ENPmWTjszV90awT4PqWEzKsOxeHFjd3TUfMHfSYcc5e0Ohtx606FppZgiY2/ZHJXas3xrl3ESLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwljzlnV2lh0HUkFmRycGDBsqftrQRaThEzwdBTf07ap6Zz1Hf
	rcPecWW554bGDVVUql5IMf3ysdNW/FrHMPBqhyKlQqiCgGqxFTWM
X-Gm-Gg: ASbGncsbvAxcDxfOuGDCcG4jfUH6E9kfNxfxSxUHqRpHoSVTctDocxrtf5GJhPZYo59
	7d6u7mphbba7M6giMp/d1CGYXMn2Cyb+bu5hEpGhFK6qxS8SipcvL5rQz5+7cf506lJ7oGTkiwt
	FGftoPo57FBkfWOxcDgGH0EL15YWsXFoetACQwHEeF0XECq5YujByN3hw5tNCHQO+o4+6NEFmG9
	kkd9AThLcj8e8Z6BgpaiUdGetdbadhI/ppv2lxLiIgx79uCsPzlIR8vi7I0gd8xWA==
X-Google-Smtp-Source: AGHT+IF2URjI4m3NrtOE3ipZnYm7Pd2Mx5Kk5Ut1vYR2COkOLn5FC1SR1q8fBmOnWuXDvKVY7F2oIA==
X-Received: by 2002:a17:90b:53cb:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2f2e9303920mr1137299a91.22.1734481434192;
        Tue, 17 Dec 2024 16:23:54 -0800 (PST)
Received: from lordgoatius.hsd1.or.comcast.net ([2601:1c1:8502:a6c0::5fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed6417d7sm97932a91.23.2024.12.17.16.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:23:53 -0800 (PST)
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
Subject: [PATCH v3 0/3] rust: add kunit doctest with doc fixes
Date: Tue, 17 Dec 2024 16:23:09 -0800
Message-ID: <cover.1734477232.git.jtostler1@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds a doctest for the `ArrayLayout` type, as well as
implements `From<LayoutError> for Error` for the internal `LayoutError`.
This change in the first patch is required for the added rustdoc kunit
test in the third patch to compile.

This series also adds a change to the `stack_try_pin_init` example
documentation, so it correctly imports the `AllocError` kernel type.

Link: https://lore.kernel.org/lkml/20241203051843.291729-1-jtostler1@gmail.com/ [v1]
Link: https://lore.kernel.org/lkml/20241205105627.992587-1-jtostler1@gmail.com/ [v2]
Signed-off-by: Jimmy Ostler <jtostler1@gmail.com>
---
v2 -> v3:
- Remove `From` implementation on `core::alloc::LayoutError`
- Move changes to "rust/kernel/alloc/layout.rs" to separate patch
- Move changes to "rust/kernel/error.rs" to separate patch
- Change documentation in "rust/kernel/init.rs"
- Link [v2]: https://lore.kernel.org/lkml/20241205105627.992587-1-jtostler1@gmail.com/

v1 -> v2 changes:
- Add third assert where length is smaller but still overflows
- Remove rustdoc markdown codeblock languge signifier
- Change tests to return results using `?` instead of panic
- Remove `#[derive(Debug)]` for `LayoutError`
- Add `From<LayoutError> for Error` implementation
- Link [v1]: https://lore.kernel.org/lkml/20241203051843.291729-1-jtostler1@gmail.com/

Jimmy Ostler (3):
  rust: error: Change `LayoutError` to internal
  rust: error: Update 'stack_try_pin_init' example
  rust: alloc: Add doctest for `ArrayLayout`

 rust/kernel/alloc/layout.rs | 19 +++++++++++++++++++
 rust/kernel/error.rs        |  7 ++++---
 rust/kernel/init.rs         | 22 ++++++++++++++++++----
 3 files changed, 41 insertions(+), 7 deletions(-)


base-commit: 9a02cbc5139e668f8b74e75a611d3a04b5241228
-- 
2.47.1

