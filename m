Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D83321D9
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608178; cv=none; b=AD2RhuBqv2YtUMAaHv9OElgrvdlFbdwiSra24Kno7Lqi79stvTeVlEWeuh0KeOtvog39ddy539VwMe5/3H9YW7Zhh0l7uvhlIpSgqy3YNKfjWCNr3sqyaKuV4tTL1vMN7UeQkkMvRNwcWU/PyFmo2SHjTj3vjoULTfb6VbP2elY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608178; c=relaxed/simple;
	bh=1Yf16URCmbyaiqZs1vL/uNOo4i/LUo+ZngTqQg95e+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ixHjcF1/kAuXps8j0iNnpnYY3LA2bO1uVFfkOnIauJmAqT1nGC0GcT+7FpMAofRZygj9M6Urf8aLnCihMRDFlocJQHExnEL65cSdoww7EkEmmSLA81OTscGHynRRmTqbD36tUZ1yMyQN6xIu1HIcFimysuqWxJ0k+er8AjsShec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJJ0itzl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJJ0itzl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29812589890so52646805ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764608176; x=1765212976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/yhApT3cCeKlOHqMHX5vH4olAMzf1iiF6+Z/aLmSlzg=;
        b=EJJ0itzldfZj9EiBKS8RiVhYAPxxgH8XCzbJaS9IH1O2z5uydMNyT7KgSaufU8QVG/
         72oXet99tmAPcWqeVeZLxBqkJcsFdd60CaCs/ut6AhW3gmajIByHGeyA5aan4SYdFAjG
         wslxhHDjh7Oshkt65oCc83NG49d/K/Rxfw/2fCaNPRCZF5JBz7FW7SOdCQuAc2gAo+qz
         FZp1F1CIAJgKoA09Uhvd3KqqDkRvPoztcg4fjb0bZjfqQwK9emT7v766nil0UVpfZnu7
         j2DwVQZMa524BG56GWDrzis8kX3+Kvjl0rzJNYScpbSds0UOcYt7+LIBS4I3EwVkRUdK
         NvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764608176; x=1765212976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yhApT3cCeKlOHqMHX5vH4olAMzf1iiF6+Z/aLmSlzg=;
        b=ssEYEbuanVoBM0asn5518UkLYBc3bRq2HBgn87B8lIFtNXCfDT58FMpRP/AoS5pjyJ
         yws5/7Ju+SbassN0gLIby8OFl+V52kuMC2CAhmVZUZAvGvO9roIs+hsX4EmBxbvhM1gi
         HSnGM7F9cI8pPeN7tMDHq0OKJ/+HQSe3qiJXFvEQfgCL202JrmQ6RLN9WWwokLEqY67B
         bWFhGeaVSbdVx0gBhigDAwRQXmn0qDq7KoyNHTaajBR5sQF8mzKUabZrEDK7cQYaGm8Z
         vrVVL77xF+z5jIJotcEuao/eO3a3BcNLr9S9Mkut98rK7nvkMkhaNy0U3p+4Tdj2Ysh/
         BGOA==
X-Forwarded-Encrypted: i=1; AJvYcCVt749Fi1Wb9S13VhieL4X4v0pjpDGfLH3NySvqiE3lr+BCX4Ac118wAaT5Qj5StIJEIRfAYo70Ycv/gwJ6RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEntvOgfgngd4H49CCQ+8br0KpJakHMyfsuY6B5M9mpIa0cL7
	yR5xB+qMrB9zaESbfX9GZaOj8FhT+uMg3lS0TiDRQPploD7SwxzR8ow8
X-Gm-Gg: ASbGnctcnHKgeW7Jsc29nz6saKp9yfieTqvrAC9viXzwzCsUnlpHeKPrXf+dltb2IqA
	IKyz9M4tLz/U5YwUKz58FuqGO5m3XoFLPzK935sCp2CYlZHGqnjfZHGMyCX/nxMU3XTO8t7Uw5i
	CcDXZHhCwBoy/VHNleYls7On+JILpvl5F1LAYZapUAmsbHT8OQxncc+g+92EfZP8PHzz8zWtFCH
	TlDh4yc86lTb23pttCQ+3+luj6+WJZtVrsRUMoOHvgIqmrvoN++8ks2bKs3RLgP6KNe6+yXJ/Fo
	Y2TZhVWDV1XijKdVt5JewM0t7JR2Ivl51PIOJk//Y53ILlvoMwRy6D3CSfDpUC+OvxnGsqZVgkj
	nAvBh1CKl04WQae6g2ervGG7gZtdKYbRXh9n8KdJRX4fgHNc2AB070rtYbEWapFMD5FwSG0RrLd
	Xmhx8z4uZ4lxVsmSac6Cz1vnaMIpJ9ZceTkv0MRY4VighDo+jvMh5NY4kzb7llA4kGvJxyUIwC9
	Vo=
X-Google-Smtp-Source: AGHT+IHkFzj9dhY42yw+96atc1vCKoheLdSw/XCPmV3DbIijy2POjg7piU5tTN0wwHnizYoFX0VyNw==
X-Received: by 2002:a17:902:ccce:b0:297:dd30:8f07 with SMTP id d9443c01a7336-29b6bf806bcmr457740145ad.50.1764608175719;
        Mon, 01 Dec 2025 08:56:15 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb55192sm129616415ad.91.2025.12.01.08.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:56:15 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	Yutaro Ohno <yutaro.ono.418@gmail.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Atharv Dubey <atharvd440@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Daniel Sedlak <daniel@sedlak.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: rbtree: fix minor typos in comments
Date: Mon,  1 Dec 2025 22:26:01 +0530
Message-ID: <20251201165601.31484-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects a couple of typo errors in the
documentation comments to improve clarity and readability.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1206
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
--- 
 Changes in v2:
 - Made Changes to the commit message as per the suggestion.
 - Added Suggested-by tag.

 rust/kernel/rbtree.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index b8fe6be6fcc4..6c9708201fd7 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -732,7 +732,7 @@ pub struct Cursor<'a, K, V> {
 }
 
 // SAFETY: The [`Cursor`] has exclusive access to both `K` and `V`, so it is sufficient to require them to be `Send`.
-// The cursor only gives out immutable references to the keys, but since it has excusive access to those same
+// The cursor only gives out immutable references to the keys, but since it has exclusive access to those same
 // keys, `Send` is sufficient. `Sync` would be okay, but it is more restrictive to the user.
 unsafe impl<'a, K: Send, V: Send> Send for Cursor<'a, K, V> {}
 
@@ -980,7 +980,7 @@ pub struct IterMut<'a, K, V> {
 }
 
 // SAFETY: The [`IterMut`] has exclusive access to both `K` and `V`, so it is sufficient to require them to be `Send`.
-// The iterator only gives out immutable references to the keys, but since the iterator has excusive access to those same
+// The iterator only gives out immutable references to the keys, but since the iterator has exclusive access to those same
 // keys, `Send` is sufficient. `Sync` would be okay, but it is more restrictive to the user.
 unsafe impl<'a, K: Send, V: Send> Send for IterMut<'a, K, V> {}
 
-- 
2.43.0

