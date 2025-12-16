Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F44422D9ED
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845893; cv=none; b=olwh3JmCuVYMKuKp5VWAZzv7MO7B3MUwRln52PHNHC0OmntstTzmu4Uj2BkFj+YVZUDjfZiH3dfYAY3txDzy81rFoaXC37q+SKHNDPHglGv1jys5XYqFKEqjB1xWQx3T+DGfb91TPG2guywWvA1yTw+i/2+BEK92b7c5eO66PZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845893; c=relaxed/simple;
	bh=u8RSWVWJfSFpylsxcOtmBk/3EYxXCtxH6zndESpEHDg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=I3lMhTJOKhaDzqQ6AKhKYQpSC4TRu3JDgk7QrdCAJTbXyZF6sPuJTggh3prg45hqMVFk1huUefzovV6+7MceSPvFfHYjWJ5616JsseYNW+AiZn7wu/gwQLzLnMM9GzW0ih+kax0ZSTH2ITZ8jivV8xcX9SAr4INfPnpcPeXepMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fXKL1vSk; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fXKL1vSk"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so3508999a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845891; x=1766450691; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x227NTMTgKJbYS3V0xkES14MjDpyT3Tq/erUWsGOGe8=;
        b=fXKL1vSkumPGddayUy7pXpSepXNQj7jOZPuLaERMKV6rmz7juQspyJB4KqFInrw5It
         Ma6dnalkpgya++g0UV3b/97rp1OwxW6Nw3+Yd+zqSlZ+EFEwB1nGLssoS6apytcGnDKK
         sXawhpTNkLTrgWEqD6vBiPfEi7TyaYR97YT42Rgm/Ea0zGlankLmK1rSaYmZ3xtkhsTt
         UCpetRh+TgXkvpAFXuSB75RCRV+3o5/TKtlOZcWTC252fToJf2416T7GC9GeYg3BKVqj
         KShOWMiaLnnMDcsNROFph5xAZUCitssyDfy6FASje31oFgX1alz9/cfX/FV3W2WfbEdt
         8AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845891; x=1766450691;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x227NTMTgKJbYS3V0xkES14MjDpyT3Tq/erUWsGOGe8=;
        b=Ig4QCfFw0GrfATtWMuBE/cTqdq1671f7TV3eaV+imQG1SyMGFNMywhz52FdYTyvGe3
         AuyRLlJL3StbWZPX25oHwm4MFYxklpdp79RmwidTmpB4vPpdj2kDJA10CMEG5CwGHS2B
         zHdbiHsX9snKYrhnhql6j6XTEBtAziZwWGG03FrtfZZzVOb57nNH9dBUiF9Rah7Qv38c
         dXSa0W2EgVRQAtgwlK1PjHnm26KZ//KE4qD1B+d/eRHVv3YEBHwNSxMmF9KB/gTyD5IV
         7UJiWtejucbStxUZ+Ltkt4qXlN/mFz2rMq9z4nywwkg/wsSdLiOyeDK7yXIpZ8WeTxbl
         Isxg==
X-Gm-Message-State: AOJu0Yzq/ehc935IQPpuhUZgeZaV8TslIIJKlE5IEag2bMDouxvFN2ti
	+/7XZP1J/W9SMjgXrAAqRovZHe88RnH+VqwFfHyw+qHZ+At2x1JOlwm0KW3Ml6nEHnmyXyEM0zq
	JSojW6rryzg==
X-Google-Smtp-Source: AGHT+IEDVZw4BJFnBww0UMuK/ZGvViay4iQ6B7BI55NWoz0OY42NlZEedXkgG07xo65zgyQlKTRpz9jyp5zk
X-Received: from dyng11.prod.google.com ([2002:a05:7300:7f0b:b0:2a4:59ce:b584])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3212:b0:2a4:3593:ddea
 with SMTP id 5a478bee46e88-2ac30106c0cmr8295542eec.23.1765845891474; Mon, 15
 Dec 2025 16:44:51 -0800 (PST)
Date: Tue, 16 Dec 2025 00:44:40 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHirQGkC/23MQQ7CIBCF4as0sxYzTFKKrryH6YLiSElsMYBE0
 3B3sWuX/8vLt0Hi6DnBudsgcvHJh7UFHTqws1kdC39rDYTUS5IkcjRrWl6ZhTaTwkENiEZD+z8 j3/17t65j69mnHOJnp4v8rf+UIgWK00SaUVnVo764ENyDjzYsMNZav4Gg6LSjAAAA
X-Change-Id: 20251212-transmute-8ab6076700a8
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845890; l=2222;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=u8RSWVWJfSFpylsxcOtmBk/3EYxXCtxH6zndESpEHDg=; b=a5qvR+iIQIk4wAmrqUk17UDCL7E2//luDTsFhG2T85lXHGtc6ToKTQAXU/EeWnIe2Cv28hF/3
 9uLeTj2tHvJDZcUrnnZm8yBJKfZyJ7dWPkeeIbDnBL0myI2+vtkYZdz
X-Mailer: b4 0.14.2
Message-ID: <20251216-transmute-v2-0-b23e5277ad02@google.com>
Subject: [PATCH v2 0/3] Support more safe `AsBytes`/`FromBytes` usage
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
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
3. Refactoring the crate structure to allow the derives added in 2 to be
   used on bindgen definitions.

1 or 2 can be taken independently, 3 requires 2.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v2:
- Reworked to put `transmute` in `ffi` rather than creating a new crate,
  per Alice's comment on Zulip.
- Switched to new kernel import style.
- Link to v1: https://lore.kernel.org/r/20251212-transmute-v1-0-9b28e06c6508@google.com

---
Matthew Maurer (3):
      rust: transmute: Support transmuting slices of AsBytes/FromBytes types
      rust: Add support for deriving `AsBytes` and `FromBytes`
      rust: Support deriving `AsBytes`/`FromBytes` on bindgen types

 rust/Makefile                     | 14 ++++---
 rust/bindgen_parameters           |  8 ++++
 rust/bindings/lib.rs              |  4 ++
 rust/{ffi.rs => ffi/lib.rs}       |  5 +++
 rust/{kernel => ffi}/transmute.rs | 72 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                |  2 +-
 rust/macros/lib.rs                | 83 +++++++++++++++++++++++++++++++++++++++
 rust/macros/transmute.rs          | 60 ++++++++++++++++++++++++++++
 rust/uapi/lib.rs                  |  4 ++
 scripts/generate_rust_analyzer.py |  2 +-
 10 files changed, 247 insertions(+), 7 deletions(-)
---
base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
change-id: 20251212-transmute-8ab6076700a8

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>

