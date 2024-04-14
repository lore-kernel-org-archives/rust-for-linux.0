Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F49135A6B
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Apr 2024 18:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713118179; cv=none; b=oMvZZwwpnbRl65ENJDr+J4cFBxqm4XlbyP4zek1pvxBAdHQ6+UwgDvSlyPJg8g8BtlOI+tVmvNjR689M6hV8MPq57i2sktwsUhmAByM0kAIGm9WfM3jTqnZNZGLaBwxQIToncZKuDxKX4Na0QrCeoY90FlVcEI3zD2NuDxfKDxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713118179; c=relaxed/simple;
	bh=vBlOcpqf8bV1MOEYIpsswDV3lmfUajJD1hPa7hpwkdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=POpSHKs1sQ4IO8S9w3wd3D1hywglG+2tUdSYZuA2Nc+yxTrEkH67KMz/O6IoVxichQHgq6mqZ/ECcIb3BL96f2iayyBdq89nP5uUYh6NkitVTkCCWCGIwNoziAapquRI/GTv2L5gYRZOTBhVaRrr4maIsP5DDQjmyNpuqziCv/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij97lIGn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij97lIGn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4167fce0a41so18407535e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Apr 2024 11:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713118176; x=1713722976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACx9ELK4+gQsZktkmaxguvQ4vPw2r3i3YhGuQZZsHik=;
        b=ij97lIGngrGGZIJnmiJ11e2SHwJ9SOO5EdwVvaYZASSU+m4OL4BWMHZx26G+ANM/hP
         MU7diRH3inXnwgYqrXEEPL2ABT99S+AmvX6MD42I+gaLnjheuWyhLjzNg6CZBGPpzmli
         7TMRLp+hSFLjre/ae9luGVRpKUXVs1OYxh3FPkjaDQJVXo/158LvKnNSxaRzI8NBrDr6
         cD2n1Kn9MkRlogYHBBAjY2MjB5QGH6UgHeSU2G41rFzNmp9MzzaCO41Ie5Ef66dvzUEq
         K2qrWujbdlV1y3ltbCcWiEq2OPpWvEjfQUiqF8xb4sFEwQSL/wPxwAA/n3yEIejXkjeH
         90ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713118176; x=1713722976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACx9ELK4+gQsZktkmaxguvQ4vPw2r3i3YhGuQZZsHik=;
        b=syPTIKd63jj6V79e/3XNaln8HteGiJ9pIwfcML3vfWmuA0lC3WKp+tcBAD/izL8uHa
         R0mK4TwtXANMoENMzV/xSpuua4QFHD85Y8HjbpR6/RJiKDouwi9ZlLSqQfhAVoP2lDHn
         6gydNHDYGn75KQty5SXZKPPeQboDtDxZ3FdBCtabruHmWag+dVoEu2FQ5uozg0UfD0zj
         gupY3qypoS6sYaE2Hsb7qiLHoYA31OLt2SOyyWnQag5cJfDtQC3eyM6c85XkGJwwIEQj
         ImzGL3ROFzBg7wvzs7+Paw1DpRxyBnntBT9EQaftXBEAdhyFsOsxv+Lqflg9i7Su7Quv
         HBfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4/3a1FimBQRH6Gt02h8keQsGE29FR8sX4UU4uYagHp67BrejnIMHhEwueHLkJI0oJDfZnsCXypaPhQz1JqxP964u3hpUDGj6MVvbpFns=
X-Gm-Message-State: AOJu0YztdXxR3KCsDAp7YizCO2ysh0qnUEG+ErgxvQh0rFv2pPO4sIAV
	s+NUgzUgFibsjhbPeXRRv6+dSh72jE2AGpOU8Wxa3QfdK48AcJqo/r08U2Bm
X-Google-Smtp-Source: AGHT+IFsgSxf1wjphJG9+i5E4Uj6HXcd9SpdW8mlmukqrrQZl3t1libkpo/i8lJnjE198akQYnn1Yw==
X-Received: by 2002:adf:ebc6:0:b0:33e:d139:412c with SMTP id v6-20020adfebc6000000b0033ed139412cmr8340735wrn.30.1713118176064;
        Sun, 14 Apr 2024 11:09:36 -0700 (PDT)
Received: from laptop.home (63.75.217.87.dynamic.jazztel.es. [87.217.75.63])
        by smtp.gmail.com with ESMTPSA id a14-20020adffb8e000000b00347363b77dasm5470547wrr.33.2024.04.14.11.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 11:09:35 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: David Rheinsberg <david@readahead.eu>,
	John Baublitz <john.m.baublitz@gmail.com>,
	Danilo Krummrich <danilokrummrich@yahoo.de>,
	x86@kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
Subject: [PATCH] Add room for insn-enconding and symbol name
Date: Sun, 14 Apr 2024 20:09:29 +0200
Message-Id: <20240414180929.79033-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The longest length of a symbol (KSYM_NAME_LEN) was increased to 512
in the reference [1]. This patch adds room for insn-encoding and a
symbol name, as proposed in [2]

[1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org/
[2] https://lore.kernel.org/lkml/16641a56-9139-4396-a5a8-89606bedd1f1@app.fastmail.com/

Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
---
 arch/x86/tools/insn_decoder_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
index 472540aeabc2..add51bfc2260 100644
--- a/arch/x86/tools/insn_decoder_test.c
+++ b/arch/x86/tools/insn_decoder_test.c
@@ -10,6 +10,7 @@
 #include <assert.h>
 #include <unistd.h>
 #include <stdarg.h>
+#include <linux/kallsym.h>
 
 #define unlikely(cond) (cond)
 
@@ -106,7 +107,7 @@ static void parse_args(int argc, char **argv)
 	}
 }
 
-#define BUFSIZE 256
+#define BUFSIZE (256 + KSYM_NAME_LEN)
 
 int main(int argc, char **argv)
 {
-- 
2.39.2

