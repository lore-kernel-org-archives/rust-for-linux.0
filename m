Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D72D9EC4;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766651875; cv=none; b=q0t7GWkat/5cV7DUUvPoDREzj/7l+V6/pE92EHTCZbwAkgvJKPQZIQ19HNfan1RZ2DFub2wW7y9GFGyT4+QP3s8kuvSUat4J3XtlZfJlmLuGGHEZS9OeE7O3hEwzrAES+MoVIVhmuEHjSbfMx+mwa5bpV54dewgRbuf8wgiD5mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766651875; c=relaxed/simple;
	bh=gtGFPnrT1tGUALhUzT4VmeMkygUixFFu28cqcGEINdg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RTUnpAMiYL2B3baIbPluVYwuWWs4RxCefaHl3W6Z4Rr5HD8aLSXNX22g4jORB9gnh/INv/3GKc3XgY31jAr8T7Uq2bHppVWxmgOlt72zFsoeqdeRLk7uHpkehq2lbWbxfg3AtU/QlrAOCGF9ehpG59d45GVmi4UHPcVuNLP1c48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1VSkYPm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1VSkYPm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CDDBC4CEF1;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766651875;
	bh=gtGFPnrT1tGUALhUzT4VmeMkygUixFFu28cqcGEINdg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=t1VSkYPmAnxYAk7Z3lA/s1fNjrVbJjgtLfkTYZ5WA0s1CjWzPeFlLUiszFVNsv/nx
	 2TsaFcKirzK0x+4aEXwmxwtBs3wk2xCE8rbjbxiNnzB/HI0i54W1mXTcsy9niGdm3A
	 Edlw5KFhj4Tnaz3RMdDoXYcNHrSZvlRSWY/BkKq+KKgX3viHJqYSiYcZMwqzsCCL6C
	 lm3P8abdwZNP8HZgV3QAMaEHi6QNJgRChAUc2fJIY0hViE57mx067NES4V5ohNNQ/q
	 0/aOaRp/xOhn2x0n1YHFpjRIQut+Ntd+N/2FaStvxYWkfIh208qgiDsO2a8xh/eZjI
	 hZ++a4qmOD6mQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C54FE776C0;
	Thu, 25 Dec 2025 08:37:55 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Subject: [PATCH v4 0/4] rust: add `TryFrom` and `Into` derive macros
Date: Thu, 25 Dec 2025 08:37:46 +0000
Message-Id: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANr3TGkC/x3MQQqAIBBA0avIrBsoyYiuEi3ExppFGqNEId09a
 fkW/xdIJEwJJlVA6OLEMVT0jQK327AR8loNutWm09pglge9xAM55IiHdRKxGwazttY770ao5Sn
 k+f6v8/K+H1wD4FVlAAAA
X-Change-ID: 20251225-try-from-into-macro-1665d0afcfc8
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766651873; l=2575;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=gtGFPnrT1tGUALhUzT4VmeMkygUixFFu28cqcGEINdg=;
 b=oigpxcVK0qRw2hfEHNznCMSACcO+TLwNfRoj4zhgyPnUAXGPdYnQkaUM5e5vnt+cUVr6z3VEu
 VFUC8d3eOCQBpAxbPgueUtNdXE75ng8xK66QUGb1+caZvSXQNDDO6JB
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

I am resending the full series (with minor typo fixes) as Gmail
consistently dropped several patches in v3.

This patch series introduces derive macros for the `TryFrom` and `Into`
traits.

Primary updates in v3:
- Adopt `syn` for improved macro parsing.
- Allow `kernel::num::Bounded` to be specified in helper attributes,
  enabling the generation of `TryFrom` and `Into` implementations for
  types with restricted bit ranges as required by the nova-core [1].
- Add compile-time overflow assertion to ensure that enum discriminants
  fit within the types being converted to or from, preventing silent
  overflows.

Note: 1015+ insertions are purely from doctests. Most of them are kept
private to keep the public API documentation clean and simple for
users. This might not be the usual way of doing things, but for now I
don't think I have a better option. Feedback and suggestions are always
appreciated.

[1] https://lore.kernel.org/rust-for-linux/DDHU4LL4GGIY.16OJMIL7ZK58P@nvidia.com/

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
Changes in v4:
- Fix typos.
- Link to (broken) v3: https://lore.kernel.org/rust-for-linux/cover.1766544407.git.y.j3ms.n@gmail.com/

Changes in v3:
- Use the vendored `syn` and `quote` crates.
- Support `kernel::num::Bounded`.
- Add compile-time overflow assertion.
- Add a comment about `#[repr(C)]` enums.
- Drop Tested-by and Reviewed-by tags, as the code structure has
  changed substantially. (Thanks for the previous reviews and testing!)
- Link to v2: https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/

Changes in v2 (no functional changes):
- Split the patch "rust: macros: extend custom `quote!()` macro"
  into two separate patches.
- Remove unnecessary spaces between tags.
- Use a consistent commit subject prefix: "rust: macros:".
- Add Tested-by tags.
- Link to v1: https://lore.kernel.org/rust-for-linux/cover.1754228164.git.y.j3ms.n@gmail.com/

---
Jesung Yang (4):
      rust: macros: add derive macro for `Into`
      rust: macros: add derive macro for `TryFrom`
      rust: macros: add private doctests for `Into` derive macro
      rust: macros: add private doctests for `TryFrom` derive macro

 rust/macros/convert.rs | 1546 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  319 ++++++++++
 2 files changed, 1865 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251225-try-from-into-macro-1665d0afcfc8

Best regards,
-- 
Jesung Yang <y.j3ms.n@gmail.com>


