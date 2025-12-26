Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745651D5CC9
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766783317; cv=none; b=hweXDa6fAL2EOriJZqa1DqxqCDtKJtp6wb2s+0relq7SIinWyD/YFoxSGoIkHBIZd2H+gfzUf7ZdnVGHfzgElgQGoYcJ6hv5/lcZ2ZWKVDIxLHUITt93TNgws5MPs8ixTs+NnMBhpnZIHZOj0JD1S7090XM90UtYirZJTGbS5SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766783317; c=relaxed/simple;
	bh=JwfCj3crLdEKz5+uIOveDNi4/GKdcOrNFPZMrumwgCs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=UrM9BbEW3QKLws3Tw8iwzUSGPPyqa/WzEI/v1cia+QvFWDh5y8qDweWcpjJCkJ4dHi41B8cGs16o7WEkevejOYudGLMj39NWKKO4xO58VjccxGoHbT0TS0FUBqpot4BvdRJoCxR8vLegmZd0Wj3fAqxBaBdcQalQUmXQCgpXFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LfuEanAQ; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LfuEanAQ"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b630753cc38so12930948a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 13:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766783316; x=1767388116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Rd9jhnHe4VmFBHBzs/1AstORtibAqAkd58ga0ArJC8=;
        b=LfuEanAQmrJBQJIjKqwF614OZYA6cfZTx17g1Sc6cv6AnC9N3MhMSK4+I0FNZZZcIp
         BlOFFLWxJm1kMbE7kNdOt/S8Ec9ykmz4JtAXLXEwU0Mtki/emJEGws/tyQfOWKlt2ryZ
         JLKqEiPdFJW3t5Dr2o/YabZUQ0yjslglXitHAuieMpls/bA1cbziRaczD8CQEVHs8eS3
         21vouAKHEfc1Q+GHx+CpkKId+r/Fu6U6Nw/sf3IkcfDwiu8TWgU5TKCEpThDcfNlNFIB
         WnM2zqVJbK3U+XIaiAfKHsIERE6NXF8IOQsQzg4VH3rmZ7WXdK2ehBVNrpFX0CR8Fldn
         /vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766783316; x=1767388116;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Rd9jhnHe4VmFBHBzs/1AstORtibAqAkd58ga0ArJC8=;
        b=MmRObzLNLq5y0QQ4GipX8HonccZtMtX8S4dVTCif1t1iSxU/flFwNGjnFszyfE6yt/
         9uU0eAeIoj/Z8z3OxXuF8S4P1MpXPAnUT4Y/QAjkzvz+6QgyS1HIyuQsGkNy7DS5UDxB
         UzZsrtijpQRszejWL2NfE96Iz5GASnwqA6Qd61DSQaW04zI16ybhVua1Ek2zt6yXR4D0
         zfwP7N1lbPM5743/qZEfoVhCISxaLO4AJhWEpPx11IIW0cOgYGzjsdhQF/5e2de12c9d
         zuuNgxNKJ/jP3LYkU0I7HO82hQf5JOty5iBRHokkM3Y2TSztPbrsAO9JmLP38+mXl3By
         5ezw==
X-Gm-Message-State: AOJu0YyLDXVq4Ah8qE3q/d1XFAubxHrYnmQ4SKYn+5sDupRRvx8bVmjV
	Ue0ubqkQnGS0aoUlz7RMqzvZh30R0rqKE8TYmxVu9biij3zUjWh8ptx514UfW510Ai03bivN7LK
	mB0fNR+s/NA==
X-Google-Smtp-Source: AGHT+IHNNTj/SF+ZnqUt6ZRYOpOtGRGL8zbARkNKXRHrGf4yGX/7ZaZwyPlqGL7ufSOnyWLFRBWdOxQMDTzv
X-Received: from dlbca5.prod.google.com ([2002:a05:7022:4405:b0:11b:d4a7:e833])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:62a9:b0:11b:78e6:8323
 with SMTP id a92af1059eb24-121722fd212mr24063227c88.37.1766783315677; Fri, 26
 Dec 2025 13:08:35 -0800 (PST)
Date: Fri, 26 Dec 2025 21:08:19 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEP5TmkC/22MQQ6CMBBFr0Jmbc10CG115T2MiwIjNBFqWmw0h
 LtbWGHi8v3892aIHBxHOBczBE4uOj9mKA8FNL0dOxauzQyEVEmSJKZgxzi8JhbG1gq10ojWQP4
 /A9/de2tdb5l7FycfPls6yXX9V0lSoDjVZBhVoyo0l8777sHHxg+wZhLtVbVXKas1lVyR1rZF+ lGXZfkCNfYA0t4AAAA=
X-Change-Id: 20251212-transmute-8ab6076700a8
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766783314; l=2768;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=JwfCj3crLdEKz5+uIOveDNi4/GKdcOrNFPZMrumwgCs=; b=AnjaxwvQOqXrGTHkGhwv3ciX2PyGUTrqxuVSR93m559p7qzDcARp2rEN6EJb8n0pwbnGTkUQB
 3zv2YhLQJ7cBy/c49KoYvY/MCa30vaUNEYJA7U8SQxPQ7lDrgY9ASoK
X-Mailer: b4 0.14.2
Message-ID: <20251226-transmute-v3-0-c69a81bf8621@google.com>
Subject: [PATCH v3 0/4] Support more safe `AsBytes`/`FromBytes` usage
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

Currently:
* Slices of `AsBytes`/`FromBytes` types cannot be synthesized from
  bytes slices (without unsafe).
* Users must use `unsafe impl` to assert that structs are `AsBytes` or
  `FromBytes` and write appropriate justifications.
* Bindgen-generated types cannot implement `AsBytes` or `FromBytes`,
  meaning that casting them to or from bytes involves assumptions in the
  `unsafe impl` that could easily go out of sync if the underlying
  header is edited or an assumption is invalid on a platform the author
  did not consider.

This series seeks to address all there of these by:
1. Adding slice cast functions to `FromBytes`
2. Adding a derive for `AsBytes` and `FromBytes`, for now restricted to
   the simple case of structs.
3. Refactoring the crate structure to move `AsBytes` and `FromBytes` to
   `ffi` to allow `bindings` and `uapi` to reference them.
4. Enabling bindgen derivation in `bindings`/`uapi` through `AsBytesFfi`
   and `FromBytesFfi`.

1+2 can be landed separately if needed, 3 has no purpose without 4, and
3+4 need 1+2.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v3:
- Explained the `for<'a>` usage in the where clauses generated by macro.
- Split bindgen support into two commits, one which does the crate
  migration and one which enables it.
- Link to v2: https://lore.kernel.org/r/20251216-transmute-v2-0-b23e5277ad02@google.com

Changes in v2:
- Reworked to put `transmute` in `ffi` rather than creating a new crate,
  per Alice's comment on Zulip.
- Switched to new kernel import style.
- Link to v1: https://lore.kernel.org/r/20251212-transmute-v1-0-9b28e06c6508@google.com

---
Matthew Maurer (4):
      rust: transmute: Support transmuting slices of AsBytes/FromBytes types
      rust: transmute: Add support for deriving `AsBytes` and `FromBytes`
      rust: transmute: Migrate AsBytes/FromBytes to ffi crate for bindgen
      rust: transmute: Support deriving AsBytes/FromBytes on bindgen types

 rust/Makefile                     | 14 ++++---
 rust/bindgen_parameters           |  8 ++++
 rust/bindings/lib.rs              |  4 ++
 rust/{ffi.rs => ffi/lib.rs}       |  5 +++
 rust/{kernel => ffi}/transmute.rs | 72 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                |  2 +-
 rust/macros/lib.rs                | 83 +++++++++++++++++++++++++++++++++++++++
 rust/macros/transmute.rs          | 67 +++++++++++++++++++++++++++++++
 rust/uapi/lib.rs                  |  4 ++
 scripts/generate_rust_analyzer.py |  2 +-
 10 files changed, 254 insertions(+), 7 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251212-transmute-8ab6076700a8

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

