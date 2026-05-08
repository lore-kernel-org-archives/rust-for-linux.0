Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630C633CE9A
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 07:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778223899; cv=none; b=kYR2/liVrwOKAAfDZmY7KoTML/4hpcsaZUAAuio5WL5Cntm7r84G/w5Pm2Y9XBSnTrC114FG1wJunDegtEbjioU0Esspbk4ZpZIqlx7bD7EZrMgtMpka1knwdX0JG77N8SDSyIOnMIrkOwrdv8pJkWP5SiODZj2M2NJBkHinWyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778223899; c=relaxed/simple;
	bh=quONP67/uzHII7lRR37I7LO6loAdbemZWdlRnwRV+Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ium0N1tniEfxwUcL/sNZILQtlcS0IaeWN4vkX2mgo3L9OBW+2CxTiXhNPTBZHxaCn7I6B0dTrxx4kRrPcEVHVUGZkCTyVhwYp1pwiG9D59TMX0YgIeoQ7/O4sBGRjYjyHqxOhfVar3aygiIFoUF2jAKv+5F38NCQKS6rUZhM8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giuWP5eA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giuWP5eA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso26711205e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 May 2026 00:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778223893; x=1778828693; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K7r4inYikJTgjnhyHHEC7mQk1d7W95TEY6F4j+F5894=;
        b=giuWP5eA5goNLR++lW6J4MHgWTdTyYHMp/GyBzvcKrEMTLr0RE5uqyUxLK0Hu7lmkO
         Uv2GoYBubxvNCAlPfCk1sH5JGiIuH+53AVS7GllbQsfO71FoaQIDILWia4Aig5D5B6aX
         ycA+Elz3uwORUPg47hsI9Rh5Exk6qCgZr6tKk20LuasEE+m/EFdTnI5T9feesOxKmKdO
         D/XjJY1jmqXq9tKBaz7yMomxgZpqms9S+T/c5ZOCc6PgS2X52hCTENVlPd2+6p54r/VA
         XYKDKjAlaKjuBjGRwC/1+nS0+oMkiZ49I0fvt0rpBkAlUkM3AVYGbxJTN4LhOwr/a50g
         JI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778223893; x=1778828693;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7r4inYikJTgjnhyHHEC7mQk1d7W95TEY6F4j+F5894=;
        b=eVHeEfdt/5hwK+wGGkqpEhKxABiycXfW5TmGhYV4r78gX0yuug6YWWJYkv8x14dabd
         Miu+Rc1jlfqzWjm1jN1mzyhhWKCjzAj6uECBBSDt3ZVW4DGEtiJsYWXAxgEeye7sLy6X
         +Jfldu4653l+2YTXU/jvu/TmSq9NZQsYWQ2h1qzkGHWI/yBvGjibfYjZsW+ZCtnq3ep2
         E/RAnsd4hY7bR8bzHyQQpeWrHg/+Shz2JEdXMygz9BJH9SKLe2GwyPAdM9+brIZLdwa/
         1wVlJkYsJBH+6R15wrkN05dK/o0RaomeNwcKxtFTt+GeZIxrzvh6uoiaKUkgrQt25r/D
         x3AQ==
X-Gm-Message-State: AOJu0YyJT0HHnhNir+tl5b6Th9geql+zq6DaXvuDzmH3zWDgKwG+8Axi
	v8vn68vK4y4eM5UvNVo3cD0DGdQrOxzGcySHiOwHr9dI2nxN25BZKT+S
X-Gm-Gg: AeBDiesbZy8EzOHCGV/EazS2yh5VwHmzweoTy5WcJ52DjWXHSzuSzAMF19rgEwRZ8gy
	CJJlYYvACz1j/0/UUXz7IclzttfF/cPf1aTbNPYVTOGyWplSu1sNIz/w1rWizwpWPd/cbcvcB3C
	2vcyrPGGu5SWSgdVqvU1XILEx8GicqAWamR2rOM/1iVyqfE5wBjBnBJeZlYPnqVUKMqX+lIzSEY
	n9L9i/glqWV5k9mZOPH9rU1gx4j6fGMsJLKu1bjlYjuNK83Gk+TYj28pfSD6VIdQ1ORcBqIfhtO
	k2SSweckwuooHGRC9+ukDXWvvI++ZVZOdHdYnUMBfs12pEOB89hG0nkRPaSo5p4mij43sYd1F3E
	3UeIBIExGeugi2VZWXhFoCTwVB48LHBzq/10HrwKNUbABlIHVRJU4Kx3rYvEEVYrPu6YFpgOEcJ
	hG/5d0oDFK4N/G8g/P87yWHo1WKn3ZQn0=
X-Received: by 2002:a05:600c:3e86:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48e5dffabcamr85371625e9.9.1778223893021;
        Fri, 08 May 2026 00:04:53 -0700 (PDT)
Received: from [192.168.0.30] ([195.100.225.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f514dfsm13979615e9.13.2026.05.08.00.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:04:52 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Fri, 08 May 2026 09:04:40 +0200
Subject: [PATCH] rust-analyzer: update generate_rust_analyzer to pass cfg
 to macros crate
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rust-analyzer-macro-v1-1-9122b940d003@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3aLS4hLdxLzEnMqq1CLd3MTkonxdI6M0YwvzNIvUtDQTJaDOgqL
 UtMwKsKnRsbW1AFp0bm1lAAAA
X-Change-ID: 20260506-rust-analyzer-macro-22f387f8eff4
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
 Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778223890; l=1018;
 i=maltewechter@gmail.com; s=20260417; h=from:subject:message-id;
 bh=quONP67/uzHII7lRR37I7LO6loAdbemZWdlRnwRV+Qg=;
 b=09EjqiRMDo2GEyzj2/gSFLquERUQ+QlMTFLsI8JGUj6JNomLwjNE2V2kPFTypnk4oe+rPBmtJ
 +0F/JSJGf3aALq5BhVHFKANTKahaTlCgw2TjiJJFmx9a3ZTrcCjxcIz
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=07WplWXZnwyLTMZOHNCIGcpoEutcMXU/JDY6f9VtxSY=

pass kernel configurations to the macros crate to prevent rust-analyzer
from marking conditionally included macros as 'never included'.
Add the generated configurations to the macros cfg list
so rust-analyzer correctly hints inclusion and exclusion.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 scripts/generate_rust_analyzer.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d5f9a0ca742c..69990a96522e 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -238,6 +238,7 @@ def generate_crates(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
         [std, proc_macro, proc_macro2, quote, syn],
+        cfg=generated_cfg,
     )
 
     build_error = append_crate(

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260506-rust-analyzer-macro-22f387f8eff4

Best regards,
-- 
Malte Wechter <maltewechter@gmail.com>

