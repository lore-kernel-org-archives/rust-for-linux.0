Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710774;
	b=amqCP72UCdpAAjYcdnAsc/NW7PnKER/odq4Pp/TpKc90gW/tlM+4Y4MWX0wQ1Z3XT+T+
	 iNr8qSmFmMwB8JkU1Tb1kfOg2VO3m6XkK5RT2rhyn7x3BdWu3RmHD2BwriDcmdP1wx47v
	 wgvl+v1ECFqjai6QJtZXtiHFEh2PLv02Q3mMdi49JaTlNXrm+PdPEv4L05ILVlUYGsB9i
	 NTlsr3qEgtrWFnjw57mOEfxHGhITtVi1/1fRx2Ad0Gmb7Vf7rkRDZCzdSIadukhYnleXO
	 CiRLFQi4TQWmyyWx2X9mDQq+dZJ5FEB2M5YE4zc4aPuM8+bgRg+SJDMeShtg/ze6EsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0yLyfS9yRL+bXyI3H11u0VIFJtx+041ioKdNuiUeDKA=;
	b=Ka786yKUO6Goa3GLZflbBOEXdG7h3t0W2VO1u2f+CTv/4MuOCw4tVIE5BnC+tCsQA2Wq
	 Vf7QxQ66j2I5c7ero1t/7wSiGJ4v1QLsaWgV4Sisf7Ukw7Dc3dAHd0CkTdgSfn0g6/LtW
	 W2Im3c/AjqM3WF24HuWnlXVMBRawEyeWt1vFkvT4kD0ujbrj5oDuEOhEeZD6HSZHSOxGD
	 eylmA4pRKm3aWR/yHAJF1jf4/p2SWRdA7sLmDaG5k5BNckbKfkvuZbIVObGR/XnnlUP2w
	 Wtpt9me4RR6ii5Gr6NZyXfTZtvstiBZkKz4Al80s2c/Kox03/avdizJ8VyTFTbI6zgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="NMgND+/f";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAAF606A326
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 12:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDAAF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NMgND+/f
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df730c035so2903316f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 04:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793710772; x=1794315572; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yLyfS9yRL+bXyI3H11u0VIFJtx+041ioKdNuiUeDKA=;
        b=NMgND+/fJIWYFiTSWTWqhUoWYOD0pJ7ie4Z1bxIOg4cljZWjU87cB3mqyB9pjUKUTm
         GNp+B2oa1gUDfwXmWaDBxj4w1VCHFwq/3e5f8MofcQuCQfELjKY8ND9AlHDgi3mwK2QQ
         9QOZZn/y7gDTV8woze/w3vhOIZRdw+O3CEcPwqOD09ZLacdas92Kz5TeCyNkGEXoHi3I
         4XuwVv2Bd1PcDesEUWymq62K6fIgKKDKTAPRwKap5bpyao+PskcPWW/eDDCMKGlYz7On
         S4gyd77cYTImXqRzxPxn8+HISERFKqgoZyEMFgXURWYxPS6zsd+XMA1OvFnq4Flv9Y9R
         GXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710772; x=1794315572;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0yLyfS9yRL+bXyI3H11u0VIFJtx+041ioKdNuiUeDKA=;
        b=F/8FeX5kHs8/R9KEt8qRdwbi00KBY95RymbD8miniMgDkdkNkIEkEhm96dz4BaK1aO
         JZEBUPpUBRe/iN5DrCh9xe4dt/9uArLggXMEeL2F1gW7LD54p5Up2wIJNYR5+NAeImdE
         S36YGfalcSa9jNlKuGQyYR7ykp04Raha5/ZihEto3JVu9nLtv6x+zHJOPlnXaRuvL422
         Uht+JNjq2K8flD8zR2Jr5nBnNLMGBtWrKjFtwoRpFGFaxjrYVk2Je4vKqi7yzBfVS4FB
         MOWnSW+se8kIkWXu9pBGhuF4WdlPXnr77U2k+Vl/SHe9PfDkyhcEEr5sFxQQ+l9GyKPX
         aKMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw369ZoEEZrAqhVC8+goeG2dPe62d1aYenqFA8DjxHydH8KK5oHYSoHZ/DG9pQ1Iwbqz5L8ZUZZ/UmcnqQtXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mqx1wD9m25kILDKsOdw9bCWJjqYE7FRtnwgFuNIECJ2JBN1d9
	e424W5/8R7JPGoxfM/osDk54/S3cQtF9BjfaNvPVzu+PGdHLW2IMg8SKXc1iIORd5h1HksWTigK
	1IrHhPf7ZmZ3Ihw==
X-Received: from wrbgl13-n2.prod.google.com ([2002:a05:6000:298d:20b0:48e:1312:61f9])
 (user=gprocida job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2886:b0:48b:1119:5756 with SMTP id ffacd0b85a97d-48e6e2f6739mr29434190f8f.17.1793710771862;
 Tue, 03 Nov 2026 04:59:31 -0800 (PST)
Date: Tue,  3 Nov 2026 12:58:12 +0000
In-Reply-To: <20261022134617.228229-1-gprocida@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022134617.228229-1-gprocida@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103125814.258105-1-gprocida@google.com>
Subject: [PATCH v3 0/2] clean up EXPORT_SYMBOL_RUST_GPL
From: Giuliano Procida <gprocida@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

Move EXPORT_SYMBOL_RUST_GPL definitions into linux/export.h and
prevent the emission of bogus type information for Rust symbols.

Addressing Sashiko review comments, the first commit now ensures the
moves do not trigger warnings from scripts/misc-check about missing
symbol exports.

Giuliano Procida (2):
  rust: move EXPORT_SYMBOL_RUST_GPL to include/linux/export.h
  rust: exports: emit ___EXPORT_SYMBOL without C declarations

 drivers/gpu/Makefile                      |  4 ++--
 drivers/gpu/nova-core/nova_core_exports.c |  5 ++---
 include/linux/export.h                    | 14 ++++++++++++++
 rust/exports.c                            | 12 +-----------
 scripts/misc-check                        |  4 ++--
 5 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.56.0.385.gac671c819a-goog

