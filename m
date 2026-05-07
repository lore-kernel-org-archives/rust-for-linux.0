Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5B372675;
	Thu,  7 May 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778165246; cv=none; b=M1yA0+0iy6S5eHYl0gIwR6AI0lBns7+BtF0q4DuEllt5FbrIAWPKCnykEFUe7x/Pn6MvAHio7qi8PpNczzAJVPftdtjMWSb+YV/XXafbJLbuvGdFtp5JgoZm1i0mhnR3ADqQNakXSXtveknxKtCyUqCJ3jXKoSszO0igHlWHFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778165246; c=relaxed/simple;
	bh=7jGW2PI6/V8bvOxyn3kbpeGPArnpLS1TcRupmJ7nWOg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NkRG8qJ8osqKdsitjqsT55Sw+rhZYywB/IjK3grPuDuTyTmmShaxLMHPM1P+tWB9fc7AgPa2uzF5xjo3W9tW4H11z/FwSZ4W+KD3qxx0myRJXY3RMyaJ4/wEZUktiLxXkAqD6fMrqoYElEwkIq+1UGIIy2FDL6WOluIPWvOKB1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7yJZA67; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7yJZA67"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BFE2C2BCB8;
	Thu,  7 May 2026 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778165246;
	bh=7jGW2PI6/V8bvOxyn3kbpeGPArnpLS1TcRupmJ7nWOg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=b7yJZA67peLixj+E18VgLuIQ3ntkBtcN/W2c9cKa503Pt8ZRYzTXlBE60KPnACums
	 UAmROZcuSNPRjKL0gfaqpD9IIahGzL/i0I+5ZCjUrGL9Yg+F7FLaqilxvU1cgUl/Mj
	 7wQ6GAzhX4tQNivTrhSYPMdN2yUIbhCqVXlBeaLSFEMrtxJOxqwR4zCCN5q3vtEyjQ
	 HYa45fHLfVWRKT98DXhueExYbi8zNKwVrNT9upCFOjd1OS7kpsXaMgDtlrV2nMlDJo
	 F2CsOj0x9HD/qnbo1G7QIlVLZsDPVj50snwzliiTE7HnIexqd7muhuJfePXDT98blZ
	 8YEPfTrl+FE8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC4FCD343F;
	Thu,  7 May 2026 14:47:26 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Subject: [PATCH v7 0/2] rust: take advantage of newer rust-analyzer
 features
Date: Thu, 07 May 2026 23:47:23 +0900
Message-Id: <20260507-ra-fix-primitive-v7-0-cb8e3791f2b5@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPul/GkC/33NzWrDMAzA8VcpPs9DsuWP9LT3GDskttwalqY4J
 bSUvPvcXhJC2PEvpJ+eYuSSeRTHw1MUnvKYh0sN93EQ4dxeTixzrC0UKAsIKEsrU77La8l9vuW
 JpfNoKLFHp5OoZ9fCdeFNfv/UPufxNpTH+8OEr+k/2IQSZeTkodHGdcRfp77Nv59h6MULm9Qaa
 HYAJUEqarxRLSGZdgvoBdDgdwBdAdN4QNcFTtFvAVoB6HYAqkAXwDpoglekt4BZANKwA5gKWG0
 pKmU8I20BuwAGaAewFXAUUkD2VkVYA/M8/wHJ3wNu9QEAAA==
X-Change-ID: 20260101-ra-fix-primitive-78154fe8173f
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778165245; l=5769;
 i=y.j3ms.n@gmail.com; s=kernel; h=from:subject:message-id;
 bh=7jGW2PI6/V8bvOxyn3kbpeGPArnpLS1TcRupmJ7nWOg=;
 b=toxgHgsmOZLtxDKRcq7nu2IVl+rssvOf3VYQRLFo87sSRcr7gcrdRTe2Geup6MpB4GJiZd9M0
 MwYx6XvRy+VABipgz+KMnUl7nR5MH9Lkkmnsj8rMPQyXprUMc0fzC/B
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=4nSlncQuTIIYLyLXkNxS0ssInM3uK0snxLSeQ2tdG/o=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/kernel with
 auth_id=755
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

As discussed in [1], we need to support multiple versions of
rust-analyzer to take advantage of newer features without breaking
compatibility for users on older toolchains.

In this specific patch series addressing IDE support for inherent methods
of primitive types, the main compatibility issue arises from using
`sysroot_src`, which brings `std` as a dependency for crates in
`drivers/` and `samples/` (please see PATCH [2/2] for more details). This
causes rust-analyzer to incorrectly resolve symbols from `std` in those
crates.

Hence, this series revises the approach taken in [2] by first adding
multi-version support for rust-analyzer. Specifically, it enables
support for the v0.3.2727 (2025-12-22) release and newer, which is
required to resolve inherent method resolution issues for primitive
types found in recent versions of rust-analyzer.

As Eliot mentioned in [3], we might also want to do the `include_dirs`
trick on top of this series to support rust-analyzer releases older than
v0.3.2727, but it should be handled in a dedicated patch series.

----- [QUICK TEST INSTRUCTIONS] -----

[Example 1]
1) Apply this patch series.
2) Run `mypy --strict scripts/generate_rust_analyzer.py` against
   different Python versions (e.g., `--python-version 3.9`,
   `--python-version 3.11`)
3) Verify that there is no type errors.

[Example 2]
1) Make rust-analyzer>=v0.3.2727 (2025-12-22) available in `$PATH`.
2) Compile one of the crates under `driver/` or `samples/rust`.
3) Run `make LLVM=1 rust-analyzer`.
4) Check that autocompletion for inherent methods does not work for
   primitive types (e.g., `0i32.rotate_left()`).
5) Apply this patch series.
6) Re-run `make LLVM=1 rust-analyzer`.
7) Verify that autocompletion works properly now.
8) Verify that no autocompletion is provided for `std`.

[Example 3]
1) Make rust-analyzer<v0.3.2727 (2025-12-22) available in `$PATH`.
2) Compile one of the crates under `driver/` or `samples/rust`.
3) Run `make LLVM=1 rust-analyzer`.
4) Run `mv rust-project.json rust-project.json.old`.
5) Apply this patch series.
6) Re-run `make LLVM=1 rust-analyzer`.
7) Run `diff -s rust-project.json rust-project.json.old` to verify that
   they are identical.

[Example 4]
1) Apply this patch series.
2) Ensure `rust-analyzer` is not available in `$PATH`.
3) Run `make V=1 LLVM=1 rust-analyzer`.
4) Verify that the fallback warning message appears.

[1] https://lore.kernel.org/rust-for-linux/20260101-rust-project-reduce-size-v1-1-4cd66e9e02d9@gmail.com/
[2] https://lore.kernel.org/r/20260101-ra-fix-primitive-v1-1-def809357b4e@gmail.com/
[3] https://lore.kernel.org/rust-for-linux/DFVQBFD54CJO.2D3VQ091URH2B@nvidia.com/

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
Changes in v7:
- Streamline the bash script.
- Wrap `reversed(RaVersionInfo)` with `list()`.
- Link to v6: https://patch.msgid.link/20260504-ra-fix-primitive-v6-0-74cfc1e862d0@gmail.com

Changes in v6:
- Make bash script more portable.
- Aggregate fallback logs into one.
- Use `date` instead of `datetime`.
- Limit line length to 80 characters.
- Link to v5: https://patch.msgid.link/20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com

Changes in v5:
- Document how to retrieve rust-analyzer version information.
- Rename `RaVersionInfo.DEFAULT` to `RaVersionInfo.MSRV`.
- Move the introduction of `RaVersionCtx` to the second patch.
- Embed `RaVersionCtx` into `RaVersionInfo`.
- Conditionally add `sysroot_src` field depending on
  `manual_sysroot_crates`.
- Conditionally add `crate_attrs` field depending on `use_crate_attrs`.
- Conditionally define `RustProject` and `Crate` for stricter type
  checking in newer Python versions.
- Move the dependency filtering logic to `build_crate`.
- Move `RustProject` closer to its point of use.
- Fix grammar.
- Link to v4: https://lore.kernel.org/r/20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com

Changes in v4:
- Use `dataclass` for internal data structures.
- Change `RaVersionInfo` to an enum.
- Move `RaVersionInfo` closer to its point of use.
- Statically check if all `RaVersionInfo` variants are properly handled
  (using mypy).
- Relocate `ctx.manual_sysroot_crates` check in `append_sysroot_crate`.
- Move `crate_attrs=["no_std"]` addition to `scripts:
  generate_rust_analyzer.py: fix IDE support for primitive types`.
- Move `typing.NotRequired` closer to the relevant field.
- Link to v3: https://lore.kernel.org/r/20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com

Changes in v3:
- Remove extra `crate_attrs=["no_std"]` for crates that specify
  `#![no_std]` by themselves.
- Fix rust-analyzer version for Rust 1.78.
- Tweak `map_ra_version_baseline` to distinguish between Rust version
  and rust-analyzer version.
- Simplify overall structure.
- Rebase on 6c02871d258 ("scripts: generate_rust_analyzer.py: reduce cfg
  plumbing")
- Link to v2: https://lore.kernel.org/r/20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com

Changes in v2:
- Implement multiple rust-analyzer version support.
- Rebase on 9ace4753a520 (Linux 6.19-rc4).
- Remove an unnecessary new line between tags.
- Link to v1: https://lore.kernel.org/r/20260101-ra-fix-primitive-v1-1-def809357b4e@gmail.com

---
Jesung Yang (2):
      scripts: generate_rust_analyzer.py: add versioning infrastructure
      scripts: generate_rust_analyzer.py: fix IDE support for primitive types

 scripts/generate_rust_analyzer.py | 284 +++++++++++++++++++++++++++++++++++---
 1 file changed, 264 insertions(+), 20 deletions(-)
---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260101-ra-fix-primitive-78154fe8173f

Best regards,
--  
Jesung Yang <y.j3ms.n@gmail.com>


