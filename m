Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3F402446;
	Thu, 30 Apr 2026 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777551351; cv=none; b=AJhawJSnZu9Igf3NUvAgtfmxmrist1fwp5SGg1+Z/eGXTk/vJscx/B4xBuuZPo/5RDQd5ii32ycMqVo8mF6ykHT8ExQMKic/ygJ/ex4SVgFTerQG67DK2UkDPThfBJjzWJO7kCRqcwvLg5B7dxU4WPiPm7PHQxiGoODTf4aTypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777551351; c=relaxed/simple;
	bh=zKw0oaBr+Wg3YuJsjBzOcpYqmgj50s3i0S8gwq9BgQo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E02aHhjtgIkKxfSo2FvYTkoaexioKO2dpLPvcOya50pcQe1z4HcRYU2y8/m8Y87p2LLlmu8SEa6T1Wj09IdhEbdGb73dmstWyaXLoaP/QNEthD1UDc6UhWob5QWLjuLYI6afglsdaOBut/5T+EGEMhm89ZQBZhCgNVUSySzxErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXta+x42; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXta+x42"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B04FAC2BCB4;
	Thu, 30 Apr 2026 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777551350;
	bh=zKw0oaBr+Wg3YuJsjBzOcpYqmgj50s3i0S8gwq9BgQo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nXta+x42Pci0RrliU3R3qK6/hVdVIU/Rw8zH3sOaIeyWIRsW86zN/QGpO8lwPiWtD
	 6FMRdNXYOmrnvRB3xVWc4OB46XozK83pLkuiy+Fg8KFpcz4BOdnqm5FF3fMd5jFA06
	 og2BwybaOLMPkMjRXql8uSyz5esfMmAX81jrTJrGH+YQ/1RLz9PBFWJtKH0C5w8N2q
	 1IX7OAxLYSstnZnXIW5aKAl47rLQ3izOUSC/8YclhMU4rlLSVSBPh9j+fzC8scHWKl
	 P+/aYoeB7GGwFHjtv32jwtaG/de24hboR7CUG0iFskbQdVsOFQolmIb4bX2zXD1ESD
	 Zbx/Lh46DuOGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99922FF8873;
	Thu, 30 Apr 2026 12:15:50 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] rust: take advantage of newer rust-analyzer
 features
Date: Thu, 30 Apr 2026 21:15:47 +0900
Message-Id: <20260430-ra-fix-primitive-v5-0-6364d2258e14@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPNH82kC/33NS47CMAyA4augrAmy8yDJrOYeIxZp6oAlSlGKo
 kGod5/AZipUsfwt+/NDTFSYJvG1eYhClSceLy3sdiPSKV6OJLlvLRSoPSCgLFFm/pXXwgPfuJJ
 0Hq3J5NHpLNrZtVBbeJE/h9Ynnm5jub8+VHxOP2AVJcqesoegresMfR+HyOddGgfxxKpaAmEFU
 BKkMsFbFQ0aG98B/Q9o8CuAboANHtB1iXLv3wGzANCtAKYBXYK9g5C8MnoJzPP8B5VywglzAQA
 A
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777551349; l=5317;
 i=y.j3ms.n@gmail.com; s=kernel; h=from:subject:message-id;
 bh=zKw0oaBr+Wg3YuJsjBzOcpYqmgj50s3i0S8gwq9BgQo=;
 b=gekZ1FEDjjv/n1fbBy0WEurj1jkUrDcWsU4KgZ/Vo+kcqDyfoetbgP7X764e/TRBeuXVMa5jZ
 fbgHB6b1ag3CpGBlbxRxN4v0q1sSul5VjpxnnNxUeIoJ/JyEnQmhFxd
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

 scripts/generate_rust_analyzer.py | 268 +++++++++++++++++++++++++++++++++++---
 1 file changed, 248 insertions(+), 20 deletions(-)
---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260101-ra-fix-primitive-78154fe8173f

Best regards,
--  
Jesung Yang <y.j3ms.n@gmail.com>


