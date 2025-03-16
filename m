Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1717E472
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742105893; cv=none; b=u17NGylh3UznozdINyPdTLCygKFirv4CqneWCQ3HTasDs4JL1W8kMOGoKV+SgLgJ3s1CFEc1CGMMAciqtlLiEsrT/wpH/KoIbDtSWiFu4R8C1ad4UTlfD5sLb7p4As+boJnPPZ/pXH9gT9xx6RoA2n7tNq8HWVgJqhL4JMXjMnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742105893; c=relaxed/simple;
	bh=ygAyP+s1qEkz3upA+KGMVgJXbgXIUyv8naNBvaYnPSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r70TqEDmSSmtOC2rDmqZ4Vttij1njVKPFZYPPPOxexp3DZSQNvVKL1h4ls1kthQvui/6fXshfJYP4T1WQydw0NS9ZjVwEYK9fI7zKANA3iO7v6q6yF3FJMFv3N7sXrn141DKaCU8XiJb2WIwXzjeTcOu5g4EhNrhAtwBl49Lyg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=whsRheTK; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="whsRheTK"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e63504bedd0so2271051276.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742105891; x=1742710691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AeJq6u99xXx3TpzT08tgvG0/0VOgzCx3B7iFUdLBeI=;
        b=whsRheTKNduQgFdPA1AOGw8dc7PsbC0f/h46aCOQto1jWlQDl+A9seVdywGqNZYhFP
         cBm/dpEIZHjjjWMItZcqmFxTZkRaN88XLEFZumtz1qvy/4taLzKwy9dntNlXbbvo5D6Z
         tXiWfTk5BgJWorZeNywr8CZc2thirrNW3317slJlMeK+Ovhp4KeRoXN6Z1fk/2NBJADp
         Z0/dWx+PN5UaLq6h9EkxV7XNxnouU+yit1D5ffR6Kjt/plIn/TU6RzYGSLT2royOCSkl
         VP317LNZax/nWjoCHWqMSQuo59VJFEIEgvJi9T9+RNwyYtlELC32PbMziBaKg3AQK5R9
         YBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742105891; x=1742710691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AeJq6u99xXx3TpzT08tgvG0/0VOgzCx3B7iFUdLBeI=;
        b=evfuRorSd/jQyiXow+SsBBoCb5Y/uOvbllcyC0nvtJdHHUh7YeCVN3t8N6BwxaAuax
         8jblPLsad0UX4fG0C6oH4JQsAdqbyO+kNbO2OyyJ3I1tJRyVod4fOykmQWy9D/HS63/8
         9Fz2GhzeII+5zfpHNuOEUtmO4HR8BvkFMuFCiYDm61es39shKZqUBXB43jvJ5zBCE0QO
         J0PoEqB+SK1YVibhse97AYqairN4sD9sRMqCbhpfO68Faw9dC2Sm4xYozMLDJkuxnoBZ
         igj7lwe0I8ePqwS7YTY7hlPI5n6T7qbeyUrLWGQ7PhqHDVdPXM/Sgu+m376RlJapP2KH
         GfmA==
X-Forwarded-Encrypted: i=1; AJvYcCXVRWERU9hPsbINXPRGNoKLJTW1M5dGORr+PBxFiZv5KpnAdN8XiyzIIqPzeGCN/7Y31eWrSMXm4RuS7TUpJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIfPj7JN6hxQGWTVd1rlLYGYrbqSjzjHMt3LdXcCNvkNmdyRgd
	hrQzHJr4LcKoNKWtYKeTVdoRmSFgmt7J34SAmtEiiMNzKZdUGtHC2BIJLSYUF5k=
X-Gm-Gg: ASbGncscIpFRxWnvSeWeCL6X+KucMNSZxNd2ak1W3IotzSSkh2JdT8XyemIzzT1oKlJ
	7f2wQc5TptfOz0+vSaM5CqLXhLHYo9SNJcp9mmCBJXODOlS1GmczvHCmqTFxV0bHifOHbSBs7KO
	pbg2N0jJ76jHFvaJL53PdNfhfnPCMCZroqFtYWiaaegmpRt+c2XuypT3TfOzMDODHfh3Oo1aKxW
	YkE8rDgP+TZvcV6o1h0HDaeC4vXxm1IP/AKYTI1ERckOi1pZnImfRDlxH0oRkbvMn36bq1zXoyM
	vK/mB+oU10lOR8Fp2mp6zKiNTtvNl1LID40Lo3mYwsC5G0pDkmxNxGsX4gWLv69pFEQQ6f323UK
	Jrwubdt0SL3fbWsAO4frbQZaFYkuaaB5MYTqKKgG8
X-Google-Smtp-Source: AGHT+IEcncqvevbDmCCrd/JhLPLX+no2+vZx3eS5Nrp4fNGD5yeQ8uqH17YQ21ouuFMhomI/PXf+Cw==
X-Received: by 2002:a05:6902:248c:b0:e5d:fecf:9acb with SMTP id 3f1490d57ef6-e63f64f854dmr9881904276.12.1742105891172;
        Sat, 15 Mar 2025 23:18:11 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e63e53fd277sm1618673276.11.2025.03.15.23.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 23:18:10 -0700 (PDT)
From: Antonio Hickey <contact@byte-forge.io>
X-Google-Original-From: Antonio Hickey <contact@antoniohickey.com>
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
Subject: [PATCH v4 01/16] rust: enable `raw_ref_op` feature
Date: Sun, 16 Mar 2025 02:14:10 -0400
Message-ID: <20250316061429.817126-2-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316061429.817126-1-contact@antoniohickey.com>
References: <20250316061429.817126-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Rust 1.82.0 the `raw_ref_op` feature is stable.

By enabling this feature we can use `&raw place` and `&raw mut place`
instead of using `addr_of!(place)` and `addr_of_mut!(place)` macros.

Allowing us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/lib.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 398242f92a96..1d078f69bb19 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -19,6 +19,8 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
 #![feature(inline_const)]
 #![feature(lint_reasons)]
+// Stable in Rust 1.82
+#![feature(raw_ref_op)]
 // Stable in Rust 1.83
 #![feature(const_maybe_uninit_as_mut_ptr)]
 #![feature(const_mut_refs)]
-- 
2.48.1

