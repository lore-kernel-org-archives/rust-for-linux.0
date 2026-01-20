Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E482E362127
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898323; cv=none; b=ShvKGRdNVKHkhPGKoy4XahutShirS+aPYcfEov0K2xne5qDt81SuVtURxYu0pnWUecxDuTrWJMgUl3+IRvobFxDOStH8Bx/0dI2NFbio0968I9hnthIuuNBy8fri5uyGlG5BCuBPP3hghuoVYDi44vxpUUY17WYfYSON7LvbbwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898323; c=relaxed/simple;
	bh=dq4EEoCw+67yQU8fR515AtIubgN5O1i71t3sFWX9JN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGJvRhsLJLra+WKYddSFjoIfecFvfbaaDTEJmfXX83HaGfZXbGMLxMy9JQC+BheJnMSKbB0nLfsmRthNZjY1FEqmzlVndS4W+N963ISTUxZtbJe7vCvExSc9fAjp9hM4Q7ODvd+IxlMUsOw0GfH8pSG3TsOuA6glgmygrzXrPXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a75a4a140eso2886745ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898321; x=1769503121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0E+O181V8JNO0qwlnrPEECHeekzJsptwjmVVwr5k+r4=;
        b=Gg8S1DwdJ68EYlq6osN1b4I9f57Lclau/gJ6jD8YveaYYWBetXhJJG0hgOx4RYgWX5
         U5iEnuFDkE7a4SYVSTjJJv/17+UxWEkLVld5DdQkj/b6kWp9TJEN5HhEhb7TeqUUt3F1
         nqumGBAahrQAKiuMcjn5ztiQZlu63zoJJMqEQdc7Nt2TvHErm74Y4QGCgVJRvkBfyqrY
         OW/0vaE87MMTt4B0gCTsn2cjKQtA5xwFRJZWNTlI0ZyzF8zWPuMsm1MZP9Vkb+vcevVC
         Uof4N7m5veyguDYiglit4g/1RANAe9SRf6lyhuKQLC5xj3FXjqUq9ELJRcVH1j2CfXZ2
         sfZg==
X-Gm-Message-State: AOJu0YyjQ3A3CLJ+ztzZbAJNr1akafuDyaT26RvNU5gHvosmbllUh/k+
	8wYb/AP7Hj3YcLwB+ftWvln+cFKyssD4LB1gZo3Rw1m/KnuNjRgvnH8hMp8JgmPZKJA=
X-Gm-Gg: AZuq6aKFX+taf6ZdCndXYGEPqqkid2+BJwZNJQZpT0qXcXC++e9fWVqr5N6vk1ojSzy
	sflxzEGXwuu42HirdD+U4WeUUcSsHqP1B3MttVt+AxVaufiJebuGZZmsxsToqJTJx3Ru/12SAeY
	N5E+QFsIbKlN0Ugd6GjboUSrarjPl10tzV5tSntF0caaRMoh/cPWyIbjPEsPdIJgKdgxdLdpoRc
	cxnlKA4R1uT9n3q38/aAPmGS0cSpyeB6NYcWeY0JsG01OZBuANHkgYfE2esRVkBKZJWYsPD5k9i
	fYnXb0V9OBd8QrsPCM/b0cquOqpACQxKb0Dsmb0rAvjwRVNK7PsDhx40SJBbLF43tlIO9WyQniq
	gA8TNyk8/9P+kd1yVWGfv3KwotSQG+KSV7Tu4CCKxaqk3nzKWSMDrnHck4tnmR8AV2vM0gKmXET
	kv7VI6WTeb22o0XULYYxA=
X-Received: by 2002:a17:902:e84b:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a76b1693d2mr11363355ad.49.1768898320561;
        Tue, 20 Jan 2026 00:38:40 -0800 (PST)
Received: from localhost.localdomain ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm115114625ad.23.2026.01.20.00.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:38:40 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH v2 1/7] rust: auxiliary: use pin_init::zeroed() instead of unsafe zeroed
Date: Tue, 20 Jan 2026 16:38:17 +0800
Message-ID: <20260120083824.477339-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120083824.477339-1-sunke@kylinos.cn>
References: <20260120083824.477339-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
auxiliary_device_id initialization.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/kernel/auxiliary.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 56f3c180e8f69..d3e94a78c9340 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -112,9 +112,7 @@ pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
 
         // TODO: Replace with `bindings::auxiliary_device_id::default()` once stabilized for
         // `const`.
-        //
-        // SAFETY: FFI type is valid to be zero-initialized.
-        let mut id: bindings::auxiliary_device_id = unsafe { core::mem::zeroed() };
+        let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
 
         let mut i = 0;
         while i < modname.len() {
-- 
2.43.0

