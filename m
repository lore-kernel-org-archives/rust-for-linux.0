Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA73328E8
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605250; cv=none; b=OJfzGp1wPeBCWG+rsYGnW5Qgmcop9ej/Wf5oqAJrr4deiHBUCmKRpPse2o6RGs6hAnUEIwwfmT1qMKymenCM7wHaYRa3kjj+j5WUv7MHcMAA4/PAg2Y3btXeUUa8/wSkBFPgGrcOc1TDHXnWfiYPyuzEmH9tVVdUw/6/a05v2KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605250; c=relaxed/simple;
	bh=q4hEVwCIf3e3jafp7Hj7qDTlpV1EJ1EWkpDy5nFONjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1/b4G0hLdGUhV+DDYMHQxLs1h9yyxVb+9oMNJNKKXJCTAa2x0r1yS5sZco0yj8gyzJ+cLQ1V2edAihe1OQy18PMDiJebduZ08DBN2StQQBUWov7E2M7O5mvFIR0gyKsvok7ZOc0wLXlA8Ge53RuTIOYDw8XVEVjuhHuZF1Luj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmTJhS3C; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmTJhS3C"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-299d40b0845so72341635ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 08:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764605248; x=1765210048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Dfsm1sPHd//8c29QHqvEAZuPXZqUTIp9fgppxKLZDA=;
        b=RmTJhS3C9V9sy0jSLzfzfKJ2nb0+OPOwvfl5SvH3h4UbDNx3Y15TzJOdNdM4BuvU64
         p7dwzJ5UPfw0XpxrhN308kmYUD+KHOBBqME/qgPx4ooeOXUh+Ntb/wl0AZmhKved+Ndz
         fcgR54OcfiZYaVYjJccDgsK98sU3NbKczdNabiduEg9nclRy2m0h7mReRNsBfHb3J2rV
         3Y/tp/ksH58Ev8FdmySB38d4EZT76HLhJbv/kgmQq9sgi5pzdT7tgGKdbIiiiYorEmcE
         aNvIZdZF4U0upBDm1rpgQcMVPxOX1nQttor84dZwglnpWYbEAs9HMXc1RG36aJ397loG
         2Gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764605248; x=1765210048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Dfsm1sPHd//8c29QHqvEAZuPXZqUTIp9fgppxKLZDA=;
        b=DLKfX8KD4Q+yQgO82HoBrEZCpI1dmizQqL5ELG/aXsOgIf0NIqSAq34/GXbLK01kQ/
         yKAVCDdXK2aa8fJ6PRxhlY0hfR8q9uGzfbcsVrrYKEUU52tKdWm4t2Be4adOv3XcTAqy
         3apYNYmRIdDpmVPY9lPtMKXU/T/dpx68g0P8p4zZZwhJatIi1UUkZPg9fV62XhyEyEtV
         3UlmOGYl2qzW1efjG6gmwWleYJm4zgcs9NDVOShvj8Egaei6ArJGZVAIN1jRTjNDiXc8
         0YZRRP5kBDGvfMOMEgCZTSDa/aEqrNk29OLHuR2aIgrGTH49vtS4x9Yy1kS6kNXgEDMo
         ImAg==
X-Forwarded-Encrypted: i=1; AJvYcCXtd6RmQa46zFfqRgKMadNCLpT9MnZQ8cFQk0qn32WrgMshvAi4Za/MNd5DvP3F4W91OqLslwJaUjJdL+xEoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90zR8qb0c56Vg/6vw9GyMiTOuE7M4CPccJlO63YtbCjrx4oWH
	o//sAnv6Ta3EIywGDbfkfeXJ8C8UZsIb6sG6qtkQ2Sj6FRPKtI6+Ti88
X-Gm-Gg: ASbGncuZqOu5IKLxoWbPthOXl9CPW6yEuxNvnp8t6Tk/LyYZqcUjIzL1NQy+Ht1cDMb
	A2W2sCFVvwUJLB7kTFB6y3pYiSL0l3B4kehdlg1ZNtx/uy+QdkSGix6Fulhuqz1Q3fz31t4z6l7
	ZFeVZIQTQn6sKomVnOvHbGJv1ilDwmpM8586fNLN+Qjtan9LAH1ySyjKlUrnXCxjn2IurdRHtaK
	QNt5e9gpRiPmaI5XLeL64tLq7EXxJWQfWci+hG5M9OpAdI5oKU+Oih7Xdkh/dh/fFiIevkODRII
	7TgAYT4aION6ii1S5IUFfK/FEcD4WdMdGWd50oZwhMhpGpv8pIQkXYg+Jwn1b+/OC1kygL0wEPq
	CN28ONK9w1xZHqRKxysVFzaEwwSOdM6BZ1qaUIAj+hafEtoVvD3Q4EeATd54ap5n7o3P06T7Z9G
	0cE5qimS+UtTdeFVsgV158Bjvd+WclfX464Z795Qgm3Pz7xTr/azP+ZS/bHxE7osGS
X-Google-Smtp-Source: AGHT+IGu2QAK9vh/UY1tG+9i4HQZzqMm0a1LmwXLI9dpN5njlpJh/BSA7UWh2EM2EBttbHz0xnoAgA==
X-Received: by 2002:a17:903:388e:b0:298:616a:bae9 with SMTP id d9443c01a7336-29bab14892amr255899285ad.28.1764605247858;
        Mon, 01 Dec 2025 08:07:27 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40281sm126525725ad.70.2025.12.01.08.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:07:27 -0800 (PST)
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
Subject: [PATCH] rust: rbtree: fix minor typos in comments
Date: Mon,  1 Dec 2025 21:37:15 +0530
Message-ID: <20251201160715.25991-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects a few small grammatical errors in the
documentation comments to improve clarity and readability.

Link: https://github.com/Rust-for-Linux/linux/issues/1206
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
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

