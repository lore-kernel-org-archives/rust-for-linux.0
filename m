Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D2346ADF
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057751; cv=none; b=Ehflg48HlB0eifH4yeOwKrRJ9UkRe1XFBcrbeSxS3TTucwTnSHnAzYN4opWuopnva206EOtavqN403wD6VwEXYUFS13SvfXgnxkH8y4DnpLI55SLjReOx+sHM6WRlOwmL9E8fy5u/KpBjL9NnkOw2eHxG3kMYLtxfSfdXgADKfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057751; c=relaxed/simple;
	bh=NbSZJOFudokz6C+njmD0VOJLlYmt/34Y4GRpm6Ry5SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvS6WHB1hKC2GzTc/LKH6cVhksOyt7s8HQiS5AdfRx2QB+XUdLKVg9A0qTGdUeQjBJqXp6A71xpYsZfJLGghVnSx7RZpYZBL8oKrKWlCXBwzPKQjHQu6pzRHKVoe3ioqnYn5WjfEVeaf6Xi2oBdo5SXEpzCatFBK7rc3MLrxOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eH3Ah2zA; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eH3Ah2zA"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b786b2a5dso3486198e87.3
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jan 2026 07:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768057749; x=1768662549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJEsrOJPO59o/eeH09HtsmYQCeq/k0b3qKzFe+dbMbk=;
        b=eH3Ah2zAX0rbaB8aQB3tVqyqJjqMHW9ms7t1kkkXK3xU8tudfeMNA49JMRJb44UkM0
         Ir6rFnR/LUWxkQF5Nf0KGruohsVTwO47LOFgwQsjvS2UU6NiFFiDGOytMzqse7kkeRV/
         q8YcF28hmBiFBLUKhn4QmEw5LnQrVILTT3ClJ8O8CMIbXZUFVQxr9tzwc7SuUw4Iz2Dq
         DmAYz7DtCN8W6BDyyNSMlRTlecpe+CKfBHWeD5eQFVlISALtN4JbEI1sb1HiGGEPSb+k
         1cQHHZC/wULg0VVTnOxvg3r1JPBONO3ePvFJVkDEdIm0cDSz4iIzmdEihdkIQdqbw5PF
         Fe8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057749; x=1768662549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hJEsrOJPO59o/eeH09HtsmYQCeq/k0b3qKzFe+dbMbk=;
        b=H3SHNKXoVW008s0JPh4iZuhl+foe2nMJE2a3AfNj+AoRE/CKkMxevA6DP3+HqnyLTt
         Nxs3kuCFB0g4V5ADjfWC6eESMAhkCLm+j6Rw7LtLKhEEgNRWgzj1mjKJuzSnBcUoxwXt
         7eBfNpJhZalho0p9rTDMV5v9cvFrNxJ4StoFvnv5w2WWXQvsckbpkIxUtZBaRjD6A8FC
         3BP5CehuCrhCLi8BDjPosWdU4isvJk4yYt5i3RXka3ZyUSQRlgGq63HjE6Ll5ixAlrFG
         Hnc5PYLkUsBJpZus04rWl9thFdgor67uShzuU2Dp2A7iEiRl/Ah9d5fpN95dzEoGVey5
         qb3A==
X-Forwarded-Encrypted: i=1; AJvYcCVJSPcLEpaOBGiuVSOhoM1rgQxnsDIpJjWow9PkOr0eHFnZOcqwMLWgmkgFX1DQMFhb7LtV5DPdgeSVoZwXsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkoc23j/7dQQF6Kre+Jswr//FhmgWBVxQj880vte5q775uLm8V
	wxu+UIRPOVsaPSLVLvsoblGJkDVfXiJ1BKe8NdlecTm3F7SCcy+Hlyyi
X-Gm-Gg: AY/fxX5ooKFold2r9/Tea5gaW3ltskdKrol+PzffSlrp3P8omrqQxW6F5U1swX/UgKN
	6xztFcSNMSC6S5Jw0WBLseREq4zS+ZqDsMdHV7CDFEJ7sNBi2DDXCLgji8ryum5O9tISaf4ihUv
	DjYI+QnP6Pp71Jq/N9lMgwZUY3bsHtlGSnr3yurYmKvdUbqBmKnUSKqcF3CAZHvNxvym66eab4o
	xMEyR4sH6od8UkU6YiPAnq94ahOSGyZmHeU/lIQibF9GJDcKbfpgJ/UlOrWYRbDrkosUZ/P5W1F
	rSWUeeMrrHvh8mtMmXeAAJXpogWHjvtx0xPraO3tGl9p0ABZQ6D7wCi/ZmUCj0v10/KtoZV4Tv4
	4OfMvbPGJ1QCMm4PD0MCPy6jbRhkEyBxsTr6WaeOd0azzRLCJYeQiumpp+ISfbHLGg6XB0ZsPZV
	5gENHVo9mtC8SwxNLiXPx8fIZg5WfCnmg4QwoI7xhd88HF9fLJdbbv1uG3BHv6fDvUgEYezUts
X-Google-Smtp-Source: AGHT+IHBhceUlOKxssp/V2ATdBwshPYNs4sQJe/+zeKAqqJ46EkHQ/gZgH8aiQ2/64zYDmL4eWntMw==
X-Received: by 2002:a05:6512:3985:b0:59b:73cf:2f17 with SMTP id 2adb3069b0e04-59b73cf3399mr3933492e87.50.1768057748448;
        Sat, 10 Jan 2026 07:09:08 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-148-7.bb.dnainternet.fi. [37.33.148.7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b75543a64sm2137059e87.49.2026.01.10.07.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 07:09:07 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 10 Jan 2026 17:07:59 +0200
Subject: [PATCH RFC v3 01/15] rust: enable const_refs_to_static feature
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-this_module_fix-v3-1-97a3d9c14e8b@gmail.com>
References: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
In-Reply-To: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768057742; l=837;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=NbSZJOFudokz6C+njmD0VOJLlYmt/34Y4GRpm6Ry5SM=;
 b=4vkJvuu2jFVi+J3bLxy06QVBvfjoWAjPvuHGbbprllQZav7Q9xO/ZRqlxXGFrxCXa3bazL5zy
 va5jcyoAN3cAG28OQlcqT85GHBUcPBR4z1/do6sC61LQ6JNh/kU4qNP
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Enable the const_refs_to_static Rust feature to allow taking
references to static items in const contexts. This is required for
using ThisModule when constructing static Rust structures.

The Rust support already relies on features available in Rust 1.83, and
const_refs_to_static has been available since Rust 1.78.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 rust/kernel/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6d637e2fed1b..510d4bfc7c2b 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 #![feature(const_option)]
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
+#![feature(const_refs_to_static)]
 //
 // Expected to become stable.
 #![feature(arbitrary_self_types)]

-- 
2.43.0

