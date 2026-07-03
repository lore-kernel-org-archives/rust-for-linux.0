Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6332C375A
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 03:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047664; cv=none; b=VtSnC5RLMU6wpMUtDK8Pj9q/PR53IvwPrbgtOE+uCcPCaPd/aGkRO7B4+qrYhOg57LzJdHxX1XygWXLKXaYQquBmBlAUhovOR/VkHEXw2lOQvoiVZeJfj27RrXo7QZ7+TTlPRzTJ8NgnTDP1nQTlQQ2+Job+XehF456feX3SmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047664; c=relaxed/simple;
	bh=6NjfDtvfguHyET98XVCFvMjKd8ovYZdUgW7vZatG5EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i3Y3kttcRCBK0Z3jzhLgP0gGnjlMJaHWugLXpx3jcSYAgkCerS0Rj6euK90j9AU/ACRypVq00bqM0dCSHnisLs3H0+finYPrxysyfVyZAN40hNBbHkPwMCblEfEOqoxi4rCLayVItSgRQ+QOBloXcx+g8hWdA8eT215/kxSajjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=YWMb62w4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="YWMb62w4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c54e205aso464035e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 20:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1783047661; x=1783652461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yTs/XtijO8c54KRJepqsfIing448R27R7obvVm8uj2U=;
        b=YWMb62w4LgZS/WeqADa/plP29wbXVWRvJUCIeWTp8eTl8SRn3iohCU58xHX812eB/H
         PuU6NllLTxpo5fBCBJZ9n7O4scCY/nYPiH0KQtyfxRB0aLaErR3wa4teTCa5OzQIF5Sp
         hLdji4C2E/zC2l/e1mXyehuqEbcWeIsrxYAKj9Ezr3B/pd3ba3aydYxu0+eGt6VHoEl9
         F7OY500wgs3Jc6LINYK9oFmuraeNH9vFNSmBoY7qB2EPTMhQIQNCM7WV1ATGLFBCJgcq
         anokeRj62+e31rOFKJ7kMHvrt8kbw/A/5fgXaNekYl7SoCM4BC35Qn/Mfq0jeGZrPMb3
         9mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047661; x=1783652461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yTs/XtijO8c54KRJepqsfIing448R27R7obvVm8uj2U=;
        b=ZssRG6HZx920wSFD47ctY7LIaxdgb0+yqrNSfID5FWeRdWY7V2cRX4Aq8n86T3zhwV
         hwUpyRceice3/myN0/XD3Cw9K5sujC1R6HmnqNpkOvy8Wh9nDw4xCsC+1/GD4Spc3S2H
         0vIcIBgXqxB1P49dz1xD2YenKy0igLVJidSuRK1coabJbqu/Tiq0tLXscVv5KljfOB/g
         qytAY8sZPSBL47IcfKnT1w5TxJc8liWhMFBprE0FcAWoZDJbmAUrHpZAGAJ/bd9DaA28
         3ZPj3iO/6osNOjLTlI/xf5QbZ8LFEARKisptI+wATg1/H1YKbur8DNj015mVJMxeUHmD
         Fchw==
X-Gm-Message-State: AOJu0YxJ0s9oQoH6shZDWxzU/4B093tYUx+zN+fZ/Vovk2dwJHJpbwk3
	JoIQpUtzNFjsYgy+MiRrpgwZBQo7LGtLEXO69qOauugFeapSzn27pFR7uVOr3UdXX8k6HfM7NM+
	z7sixh8Yn
X-Gm-Gg: AfdE7ckuU8jLa/Hh88Ibq4f/1ES1aHPHFk3XwDN6s/7cPLzAmnX4zayslrZGsn7pOI4
	kGEItijVcRgHNujSYd90c/lyTWIDdmtE3pAsJGTuldGLQrPNR/JK6zbQfHwkYOq6FHSj5mORaB9
	Q7EXAzEbSEabkWYQIjYmebRkhfD0JHGzgDafODYkMA6J9tI3cNhnrXd2jR1lsJa7jA+hi4woyam
	j9BjdKiRH+95C5lWPpGSPHRPAZJPu3ATqjGFuFl2mXyyV3BRMSwgbxPKUmlHOAt+7ZrX1tUUc6Z
	lnECHy2sYMTXNE1338rLFiFjkcRQkFQfpaypBNpM4i0jm7DnHcf6xxGEPwVFbxT3P14Jv9W1OK3
	LAYunL9QGHuRRxCeFR0+MOTrBBBKgy1osur+y5zarCeuV6viHf38MHSvqTkMDnGhhebQv9ta6Cz
	hcnEd4rOgeoY1eiCw1/DhzMCYFnqHoRCjTjmXGZ4D8pfR2j3h/HxHLn8W0
X-Received: by 2002:a05:600c:2e43:b0:493:c14a:a1ca with SMTP id 5b1f17b1804b1-493c3cd4aeemr75130465e9.3.1783047660863;
        Thu, 02 Jul 2026 20:01:00 -0700 (PDT)
Received: from axion.fireburn.co.uk ([137.220.119.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm199495015e9.2.2026.07.02.20.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 20:00:59 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mike Lothian <mike@fireburn.co.uk>
Subject: [RFC PATCH v2 0/3] rust: crypto: library AES-128 / SHA-256 / HMAC + RSA
Date: Fri,  3 Jul 2026 04:00:50 +0100
Message-ID: <20260703030056.2763-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260617150143.2152-1-mike@fireburn.co.uk>
References: <20260617150143.2152-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the crypto bindings, rebased onto current drm-next --
no functional change from the version prepared but never sent after
v1's review (see "Changes since v1" below for what that review fixed).
It adds a small, reusable kernel::crypto module so in-kernel Rust code
can hash, MAC, encrypt a single AES block, and do RSA public-key
encryption:

  1/3  sha256(), hmac_sha256(), Aes128 (key-prepared-once block cipher)
  2/3  aes_cmac() over the in-tree AES-CMAC library
  3/3  rsa_pubkey_encrypt() over a new lib/crypto RSA primitive

Patch 1 binds the library crypto (lib/crypto) functions directly
(SHA-256 / HMAC-SHA256) and uses one rust_helper_ shim for aes_encrypt()
(its transparent union is unbindable). It runs synchronously in the
calling context with no allocation and is the independently-mergeable,
self-contained contribution.

Patch 2 adds crypto::aes_cmac() over the in-tree AES-CMAC library
(<crypto/aes-cbc-macs.h>) -- the one mode of operation the consumer needs
that lib/crypto already ships -- rather than building CMAC out of bare
AES. The 128-bit key is prepared once and wiped after use.

Patch 3 adds an RSA public-key primitive. Rather than bind crypto_akcipher
(which Eric flagged as a very bad API not to grow), it adds a small
lib/crypto entry point -- lib/crypto/rsa.c, rsa_pubkey_encrypt(), the bare
RSAEP primitive c = m^e mod n [RFC8017 sec 5.1.1] over the MPI library --
and binds that directly: no akcipher tfm, DER key encoding, scatterlists or
async completion. The caller applies its own padding (RSAES-OAEP, ...). It
is gated by a new bool CONFIG_CRYPTO_LIB_RSA (selects MPILIB); because the
Rust wrapper is exported from the built-in kernel crate the symbol must be
in vmlinux, so the option is a bool and the wrapper is
#[cfg(CONFIG_CRYPTO_LIB_RSA)]-gated -- a kernel that does not configure it
gains no dependency. A from-scratch constant-time/allocation-free lib/crypto
RSA (Eric's longer-term direction) is left as future work.

All three were factored out of an in-kernel Rust DisplayLink DL3 dock
driver (which needs SHA/HMAC/AES-CMAC for HDCP 2.2 and RSA for the AKE),
posted alongside as drm/vino ("[RFC PATCH v2 00/6] drm/vino: DisplayLink
DL3 dock driver"); the intent is to land both upstream. The module is
generic. Compile-tested in-tree against current drm-next. Source:
  https://github.com/FireBurn/vino-scripts
  https://github.com/FireBurn/linux/tree/vino
  https://gitlab.freedesktop.org/FireBurn/linux/-/tree/vino

Changes since v1 (Eric Biggers):
 - Drop the bare single-block ECB helper that re-expanded the key per block;
   Aes128 now prepares the key schedule once and reuses it for a keystream.
 - Add aes_cmac() over the in-tree AES-CMAC library (<crypto/aes-cbc-macs.h>)
   instead of building CMAC out of bare AES (now patch 2/3); the vino driver
   drops its hand-rolled CMAC for it.
 - RSA no longer binds crypto_akcipher. v1 exposed an Akcipher transform;
   following Eric's guidance to drop that API, v2 adds a small lib/crypto RSA
   primitive instead (lib/crypto/rsa.c, now patch 3/3) and binds it directly.
   A full constant-time lib/crypto RSA is left as future work.
 - Rebased onto current drm-next; no other functional change.

Mike Lothian (3):
  rust: crypto: add library AES-128 / SHA-256 / HMAC-SHA256 bindings
  rust: crypto: use the in-tree AES-CMAC library
  rust: crypto: add an RSA public-key primitive in lib/crypto

 include/crypto/rsa.h            |  15 +++
 lib/crypto/Kconfig              |   9 ++
 lib/crypto/Makefile             |   3 +
 lib/crypto/rsa.c                | 102 +++++++++++++++++++
 rust/bindings/bindings_helper.h |   4 +
 rust/helpers/crypto.c           |  37 +++++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/crypto.rs           | 169 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 9 files changed, 341 insertions(+)
 create mode 100644 include/crypto/rsa.h
 create mode 100644 lib/crypto/rsa.c
 create mode 100644 rust/helpers/crypto.c
 create mode 100644 rust/kernel/crypto.rs

--
2.55.0
