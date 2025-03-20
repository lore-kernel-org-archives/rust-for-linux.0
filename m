Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02E1EBFEB
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 02:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436558; cv=none; b=pqB8IuDxYsAGXLAOmRkkRjQhSfxIuvtJFKTv41yhiiz9pRKMLS/KDD67AMsKJYf+OufO5k1J5pRQTtyO4PfUAwxwMBBMpf/dtWnRVzpYYcC7ewENEPtlWTdoGG+ckm29fhDDzej8hDfU90rPxfbbwrl2VH5j/qyDpCVZ57wrur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436558; c=relaxed/simple;
	bh=9ChsMWB9R6IufCAvO0z106+Ye1dl3VW0wCDjtZrHUvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CNY+MYQ4LpTCTR8lGPje54Iy4SpFd47FmIJL5q/5ra48S7TeY5jLQXWguQla3bbhF3T2ahjuVXFOD3fUP1Zhdl/u8/WLIuKdIUEj0C1/ubMqw9lv16GuUs3se52BHOqeXAq4B6pIroskmJN0v4Jf9vRG0mR51X6zmHXb/5y4kEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=t9wMwqMe; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="t9wMwqMe"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e634c42a296so185628276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 19:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436555; x=1743041355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5xpeMoSol4YYbgPmXkzSJh9NDUviiNm/ZDSdPgH23k=;
        b=t9wMwqMeBqTFWtWspbXuKsj6FnyKl2FzIxiMoIOEe717JrvO9raPY7+hCVR49HSMM+
         pQY7/SyrN79cIUr3FuZaeDysam8Mhbjy6sFGpkdHkhkG+hg4+bjEgz+atF9p5KmA0rAL
         irnC755Al0guS7ouaXKf6rJTEdDy8ufRBpPJapON93IKl36UJsqeB8Z/b9dtdFgESntq
         SJosK2b9JDj/Drf/hY70L6Tr3PoCj+WQdK8h0F/FZK0BKzLr06iAKWcD/pFuEaXJWuD7
         szboXkfe5ENObtLCVzZ0Ez4D8kXOwttc8wAPgWVwh8M3IA3SXypHWnFjH/dBIzNA6mSo
         Y1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436555; x=1743041355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5xpeMoSol4YYbgPmXkzSJh9NDUviiNm/ZDSdPgH23k=;
        b=wnnjgLiQLDQtLJ3hpICU9yK+o/tHsNTIou4eivTAcrQMG5fK/DYQVMjAbnvRo6XEk0
         ZfE5dLTzkRT89UToVmRJWmWsIFzFAr/lBUA5e19D0GkH/MWtSaL37xVYrsxa2m9wML5D
         tV64YKw3p9tmgVyrPuTqnxWfdG+4EsyNiSRdiTD+BF/ONXwFrrT6dg//nXHI6P9IbjwP
         NT8nfmIzuYwsg7A15rMtgb8yGb/pLRxl2sxKST62pj00yKdIDH9f6fZgTpoqEB39rzcn
         z7+44oAI6ar1bmnnRb9wWZB1HdwMdmBDsBjFpoSqf173KesYUChMJjQE3/HFOOD822/2
         O6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUTqjAp53VaWuORnhYJNlBBjgMDW7p+RiySfYpt11fV7BK1ODFax07q/QvusiMUn0a87XdXJaISN6SwNzl/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvjlMLLoDcUtkLP1WnP7TBbGN4uZ82ujFdm7IFSJU5EZt/F928
	hghnHNSWI5f5nhkOsmX4rMDYxxtUzrz/4trZpKtqT1iwcX03vF0KPJ531fZLrUY=
X-Gm-Gg: ASbGncsxe43TCGmTFRZMwZ5OctZEJeg3frt6t5nJP8M5My+tR55DRpVTDxmNlI4Ks64
	ZCe0S2A5hFwsejqGd98Bg2xfPB44XPeJ2ltuozqIW3ru4DvwP3jMrd1ldWQSuk24NvK0VWp5zo8
	NG78qJaUF7vNlz2zEYc1t2lLyffh1BY7snTFN+gW3QJxF7D7obbYcUSiTuCrfgiQ6Cr22stPE9k
	elQ3oxhGmVMZnZL+3y6+8GKB3f9e4VtF5yh/itzmLclOAE4Qs1NW3oYtxF0ftXExt2YcY7mWmY9
	Xx+1+nSiKf5UFqYZzLARVP88JveIaqERCEbrbLgQ46Lp32jXQ6n/+47zBhzKjM4EmyaQG0zpZyR
	hpOTgtbYabYAs+s++iuzw9o1bdu96ubJ1kgxymJ96
X-Google-Smtp-Source: AGHT+IFsawTTSu4ze6h4UmYPI+M13Ve2gYZXnqPXGv43VUQkqO8yiFuERTKF/hryshNtllUUXhNsZQ==
X-Received: by 2002:a05:690c:490f:b0:6f9:9e25:e992 with SMTP id 00721157ae682-7009bf86581mr76597567b3.10.1742436555463;
        Wed, 19 Mar 2025 19:09:15 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:09:15 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/17] rust: jump_label: refactor to use `&raw [const|mut]`
Date: Wed, 19 Mar 2025 22:07:33 -0400
Message-ID: <20250320020740.1631171-15-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/jump_label.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/jump_label.rs b/rust/kernel/jump_label.rs
index 4e974c768dbd..ca10abae0eee 100644
--- a/rust/kernel/jump_label.rs
+++ b/rust/kernel/jump_label.rs
@@ -20,8 +20,8 @@
 #[macro_export]
 macro_rules! static_branch_unlikely {
     ($key:path, $keytyp:ty, $field:ident) => {{
-        let _key: *const $keytyp = ::core::ptr::addr_of!($key);
-        let _key: *const $crate::bindings::static_key_false = ::core::ptr::addr_of!((*_key).$field);
+        let _key: *const $keytyp = &raw const $key;
+        let _key: *const $crate::bindings::static_key_false = &raw const (*_key).$field;
         let _key: *const $crate::bindings::static_key = _key.cast();
 
         #[cfg(not(CONFIG_JUMP_LABEL))]

