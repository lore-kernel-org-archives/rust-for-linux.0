Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA3F78276
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733663760; cv=none; b=q9RsbMZgf4IVTKh61GX5tju8qQFfzjvgbHbBNF9Gh48OYgPSXyl1l4ldbqKVd8psrIjr7imNqkFokRjl0MNr5Vu1sRkEuwu/bhrf8nVsFOorKdbbSwfCXL8CyrpJrB7J0x2UZ8p2czgyAqJbtiolqazr1JTVsmos1aUVA/y9uNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733663760; c=relaxed/simple;
	bh=9SulVlQ0LNsWx/q+yqRhps8KnFDASFn5tAh4umgXgFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7PL5oVjqJ2cdTMqdj1/Jur+HpUOZ5lt8yugXv6GcYySJKn2i5kKnjLMczRX5iUiikrsuvQx8wGqTuq5y31g0KR9xRRLRbfZ8eBx73qkP8OLL6HBcr6W5WVqJHv4K8QNS1sj7RDlHfVh+hY6VBEl/KVgwl690n+HbOGotejfZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=qU+sBSFM; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="qU+sBSFM"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso600032666b.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Dec 2024 05:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733663756; x=1734268556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+IZWuqREO3G3z6KHadyzAvNCEvHpv5YJ2RDB7ujqmE=;
        b=qU+sBSFMy8d2MUnVMcHvPGIOOAjDhYFggfN7v5DxUXPv+TY0CxER4jdyEq/xI1gw6r
         hZrIEsAizo+HyHvFK8t4rApxU7zAeP4BpGDd/Y3JY3tDWhygW3cG6dSS2czjxWp8kPSj
         0SlQCZGQru0ckn+jH6OOPDY/0JHiL3LZiWTjzClgQV7EhmhO5n7GAqTY9QkAoVSVetXG
         5G5E7F4FKvCZJoPiZBqrpDMqdsvMLy78qveCQd4uCRyCRSOsM1rHezGkvuphP8StL4am
         KMxdLJF59Yi0Bv/djevFFn5icE5Eri8SVURsN4wDFYLSF4nq5Z0SNGRVXU9B2sPYKxw7
         OM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733663756; x=1734268556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+IZWuqREO3G3z6KHadyzAvNCEvHpv5YJ2RDB7ujqmE=;
        b=jjHQcCzv8xxC3E0I5VW8m7Fns74tGS8ceYFqbBOOuLqY0ibLvX4j2R/MFyOM5zZO3d
         cBuCdcQ6Rd+pxqlxNAegJbPVU4Ni2OhPbQZAZ0V5i+jshROVfrx9DUMPOgoIZ+Xlc7Nr
         sR3NzR4z6TXnJi4vVTmlcp6GnWwYpUsRJp4I3mBdXcwSj9LPc0sY7XpM5OEnNMWDMn1I
         KUPbO5/WnlcAYpNaVyv7jZXgBrK0KEB2jBHHqVE5Os2QeCi3yW6buK8U9besjCjBH7vA
         F6Q9uBc75vErjv9uXmePUiZ3N1NBIoyBx0QVfIIoSov7A4kXnSUS7QBS2XMRVIHJlAYr
         DEZg==
X-Forwarded-Encrypted: i=1; AJvYcCV/rpPSXRuhjuK+F26dsY5NhE3zDTiNmiXBP98QK+4I4ltDvniIE3zwJKpRRp6pZGHdR9O4ve1DhGKjzvNn8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvbw70zONpja1ywK5ZRZK3YlSzXMYDjupGihokkxaqJ+7Y5Jo
	JGbIcuvSwzaCMhizbzou3d175WTJXwZ7si+Uf5yTzUVNvdcHc9XwF1cLYnXqlgkurIsk61TTYAq
	/ogg=
X-Gm-Gg: ASbGncvL3aEQlvElpT7MgpS/piNsENrRBeIN5YX4lD7/Y7jVmsIP1GlTDFy1mPWZr+b
	wPueHqKnTi9nNCGOJvmRL5tywhiBmbUeV0KOEBvCJP9dlyw5c85dP2rTSuA2GmblmMJ3AuZK7SY
	l3u51k6RdmCq3gjxBloD1VYcG3Rm7yFZ12v3B6cH2lrfPynsdI3tr91frYkgIqGlkikOUk0Vpfp
	1gjG4wNX4hLTNOyc9ktUWzo9mLIebrT3FVSdmeukGY=
X-Google-Smtp-Source: AGHT+IHnkE9S49cN4Pb7q9UN+kiZJ6tVbwihz4my1W8JUsxNbcOy9L+8HBjDhvuOmFehWp1PU9Msmw==
X-Received: by 2002:a17:907:9516:b0:aa6:4671:ddeb with SMTP id a640c23a62f3a-aa646721751mr627674066b.22.1733663756507;
        Sun, 08 Dec 2024 05:15:56 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e96c19sm529078966b.42.2024.12.08.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 05:15:56 -0800 (PST)
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
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [RFC PATCH 1/3] rust: kernel: types: add mode wrapper
Date: Sun,  8 Dec 2024 14:15:43 +0100
Message-ID: <20241208131545.386897-2-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241208131545.386897-1-daniel@sedlak.dev>
References: <20241208131545.386897-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add rust variant for representing file mode. This is needed
in order to set file permissions.

Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/types.rs | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index ec6457bb3084..35ac2898433a 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -517,3 +517,20 @@ pub enum Either<L, R> {
 /// [`NotThreadSafe`]: type@NotThreadSafe
 #[allow(non_upper_case_globals)]
 pub const NotThreadSafe: NotThreadSafe = PhantomData;
+
+/// Mode represents file permissions.
+///
+/// TODO: add link to header files.
+pub struct Mode(bindings::umode_t);
+
+impl Mode {
+    /// Creates [`Mode`] from the number.
+    pub const fn from_u16(num: u16) -> Self {
+        Self(num)
+    }
+
+    /// Returns [`Mode`] as an number.
+    pub const fn as_u16(&self) -> u16 {
+        self.0
+    }
+}
-- 
2.47.1

