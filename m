Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8138628DC4
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766460633; cv=none; b=HuHATkThTJl9Rh2iZAtdJuHYl4oFIdnVyNEPZrGrQpPEV2DYCDD9v52sL7OcZWiC0IaP9VAME2plsMQypg0NEjOVowbufSoIdsfRjcQer2RDJ82j/xJWlYyDEjf4S4uC7F+23nMHK24ifmszt7mAsNObJV11EecD1ZGbcknrNbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766460633; c=relaxed/simple;
	bh=3gZYqrHL5SxR293L17TalMGNv6j/hvYSH9//RwE7nSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngiLF8X8E3KkR+2tN6PmknOfaRIiHOyQWfYjceR1YLBdCb1EwTxIeFfvOQKfxsnX4vKXpwAm3Xicl6UrtQbLnf1/xHuOTVMl/wsDsZhXnCU0TIcN+s9g2o68BZtTYzZ8lBlsqYYDIiD0VNoYej2AegILH7raGRV2T5m49QdjMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7f0db5700b2so4136069b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 19:30:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766460631; x=1767065431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpHVnBTxKp2cnNqszSmakIYlUkXE2Lvx62BhaCZJjCg=;
        b=Zij2s6NVjbVGwi2dHwHL7Xg97bhU9ugXvJg9camwCnesgJcqOmH2irWSj2ldUJswN+
         S+UO8yo8/MDEs/0gQu+YlELrdGYb4NHKFzWLGTwd5cZ8jd0XpY9VHy7UWH0JDY1EAacE
         JgUxTJDSx8ax+AIoi3HcJsogdQOQTyRywO4MRDC0V0gf4EQ2g03hP6Hwdl3F73cgqUHw
         Rhn2rKTCtlOv3CcwFGmog2HxQre3bsZ02B+cjsAti5HLzw+q1kCJzVONLaFVt2F7f4xn
         AYqTIeBpGUWK+E6fbJ5I4mLePBz35T3MDDxpDurxPotCpkVnZqTKXnLCXC+hMryf9dM+
         0T+w==
X-Forwarded-Encrypted: i=1; AJvYcCVCV8cg77rXPo6QME4yrvbOwckj/U7woliaMZxgcu9zltMVQgivL2N8O3//jQFCs6ZZCxdakvsPmbEJw3EYFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPuGR9+HFC2RcwltF8+pILV+n6jQACr5UEz316KKsPRQEaGgdv
	rA2V/EHZPDodrt6Ai/nwT6iXUdH/7rADXF/hlVi7OqMyECu8AbQ5/C2L
X-Gm-Gg: AY/fxX45ZhdLX3wWDXdkovPz2Zjc/iz0ospwkcbjNFJ2CIsk4xrouLO5BRt5CuUhTm0
	ayCSMr/OVBVd/Dj0VJf/1ZLBH6PLYK6XeQ8rTzAOzghYtsai3HtgSSemn3GGGSl1d1PjAWV8Zee
	Q0hVvQeOEaMTiYfHwFxAsUtmTKDpRYSY+1b0N3eCl27mBM4uMfkKs02pfyL8Oq4/V1g8Qv197ox
	5H4V0Uuagv0k+AUCyYYi9pxm7mLRwFYn/yYv/A6Bu/BzvUdXmxgp+wfM/c4y893KuYwAWDaRpTy
	5zh7l44IpRsrlbLlVL6GAQh2PnqOh7SpZa3b4t4BL0iY7VG7RzdjLBKOc8WLi62uBFI78LQKCFh
	zTHeMsugNDmmw30xEZacfGUO0QN+Cd01t4HYkmrZvGxh/NK93PYCMWabYXf+bYl55Up1t2/B5Gj
	XfPWyYuFV/1AunDxvq1POy
X-Google-Smtp-Source: AGHT+IENj6POVkDt2KOP+1WC7q1bqWisyrDVGLOwRIn//+ZyDmKWsUb6V5JhODv0Bks3fo68SgtG9g==
X-Received: by 2002:a05:6a00:400d:b0:7b2:2d85:ae53 with SMTP id d2e1a72fcca58-7ff64215d9dmr11630779b3a.8.1766460630621;
        Mon, 22 Dec 2025 19:30:30 -0800 (PST)
Received: from localhost.localdomain ([195.245.219.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b22536esm11807869b3a.23.2025.12.22.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:30:30 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH] rust: fmt: reject {:p} format specifier for raw pointers
Date: Tue, 23 Dec 2025 11:30:18 +0800
Message-ID: <20251223033018.2814732-1-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compile-time check in fmt! macro to detect {:p} format specifier
and emit a compile error when it's used.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
Changes: 
- According to Alice's suggestion, attempting to print raw pointers with
  {:p} format specifier should not compile at all.
- Link: https://lore.kernel.org/all/aUO1nRdaAISMjMTG@google.com/
---
 rust/macros/fmt.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
index 2f4b9f6e22110..76dd3d1ee56ad 100644
--- a/rust/macros/fmt.rs
+++ b/rust/macros/fmt.rs
@@ -36,6 +36,23 @@ pub(crate) fn fmt(input: TokenStream) -> TokenStream {
             }
             if let Some((name, rest)) = first_str.split_once('}') {
                 first_str = rest;
+                // Check for {:p} format specifier and emit compile error
+                if name.contains(':') {
+                    let (_, format_spec) = name.split_once(':').unwrap_or(("", name));
+                    if format_spec.trim() == "p" {
+                        let error_msg = "{:p} formatting for raw pointers is not supported!";
+                        // Generate compile_error! that returns a format_args! placeholder
+                        // This ensures the macro expansion produces a valid expression
+                        // Use raw string literal for format! to avoid manual escaping
+                        // error_msg already contains escaped quotes, so regular string literal is sufficient
+                        return format!(
+                            r##"{{ ::core::compile_error!("{}"); ::core::format_args!("") }}"##,
+                            error_msg
+                        )
+                        .parse::<TokenStream>()
+                        .unwrap();
+                    }
+                }
                 let name = name.split_once(':').map_or(name, |(name, _)| name);
                 if !name.is_empty() && !name.chars().all(|c| c.is_ascii_digit()) {
                     names.insert(name);
-- 
2.43.0

