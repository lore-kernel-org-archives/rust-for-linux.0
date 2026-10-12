Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA283ACF1D
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805591; cv=none; b=rYDiLNI4fbpSsfCI5a72hYSOkMSz7NW02nbzdMsFuGN+iYw2jytSpojZnDoqw1E6szEHwYc6grjOJ/A4si6QHJOWqcih4n7PUQbvfBfbziIConEitnwEe4fK6U6/FXdYN3Xrw/CnH/t2fqosTOBmCOFcpyOpVolu/FpRVLHTD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805591; c=relaxed/simple;
	bh=X0ePI32qL/GQUdiC0e62EoMks2cf7eHsTOs9T6f49ME=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t132ypUCxVC3yrXs1AKM4VLIi0WfXr3OC9MDtUbLT1CFl8QuCgWFpKotURQRHHVcl4cKT14FbdGPp9NIxZC47qUioTwLvsI0lqti6XqNqavi7qxDNQHMHNYpXCumGJKxnDBToRetChJSvPMdN82bSCQcqTI9y81iDVH6YZ6W9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=uP6fuDSt; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="uP6fuDSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791805584; x=1792064784;
	bh=+1duduwAsdAgbn1vhkGBkkYyb+Q7YBrqNpv4O8QYepA=;
	h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=uP6fuDStAmCluKwOhuqlH1/9brqiMX+PL0CMkusy/hHoQ6+Kn0pwO4qsVCiPOWh8A
	 Kb2ORtQ1/dOfjbE+/zQAjtspC3hfzRWcxUjQ3qmm91SMLe6qwFMLpjpTPCdUyQHTkW
	 BZTWZt1JM/uoqA0YJi/y3WSoGzp0+dtXbWGZoP/cqiqSe82O+E+Uz8v4qouHxMniJl
	 atjGSBLxg5H009fYQvCj08Qj4HjWXA4CJ9Z2tzmZYQzpc+hW+7WwrNRYfI3126vEwg
	 PiIRp/o62U5n7369tLIJ0Z5q+3dOKJDYoToPNyb5CfXBJxBYUOJl+QFgIwERSrovTk
	 VZwzj9EAQLZYw==
Date: Mon, 12 Oct 2026 11:46:20 +0000
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>, Lorenzo Delgado <lnsdev@proton.me>
Subject: [PATCH 0/2] rust: add NonEmpty
Message-ID: <20261012-nonempty-slice-v1-0-4a15dee398dd@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 9c1d6b4389b65e2ef659996062736884da264c97
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some functions check that a container is not empty and later rely on it
through `unwrap_unchecked()`, `unwrap()` or an error path that can't be
taken. Gary suggested a non-empty type for this while reviewing Thorsten
Blum's uaccess patch [1], and Miguel filed it as #1262 [2].

Patch 1 adds `NonEmpty<C>` in `kernel::non_empty`, with only what the
first user needs: slices, `try_from_mut()` and `last_mut()`. Patch 2
uses it in `strcpy_into_buf()`, which drops an `unsafe` block.

Some notes:

- `IsEmpty` is a safe trait. Unsafe code only relies on the
  implementations in `kernel::non_empty`, and the docs require the
  result not to change while the container is only reachable through a
  shared reference. If a generic accessor ever needs to rely on it, it
  can become an `unsafe trait` then.

- Since APIs aren't added without users, other accessors (`first()`,
  `try_from_ref()`, ...) and containers are left for later. I plan to
  send follow-ups for `net/phy.rs` and `scatterlist.rs`, which both
  reject an empty slice and then rely on it.

- I put it in its own `kernel::non_empty` module. Would a broader home
  like `kernel::collections` be better?

Francis Laniel posted a slice-only RFC [3]. Following Gary's suggestion
on the issue, this version is generic over the container.

[1] https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@garyg=
uo.net/
[2] https://github.com/Rust-for-Linux/linux/issues/1262
[3] https://lore.kernel.org/rust-for-linux/20261011191540.56199-1-laniel_fr=
ancis@npnm.eu/

Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
Lorenzo Delgado (2):
      rust: non_empty: add NonEmpty
      rust: uaccess: use NonEmpty in strcpy_into_buf()

 rust/kernel/lib.rs       |   1 +
 rust/kernel/non_empty.rs | 100 +++++++++++++++++++++++++++++++++++++++++++=
++++
 rust/kernel/uaccess.rs   |  11 ++----
 3 files changed, 105 insertions(+), 7 deletions(-)
---
base-commit: 2dee3d3adcadcc57d62ba6608cd02f50b0c10264
change-id: 20261011-nonempty-slice-022084ba9a5a

Best regards,
-- =20
Lorenzo Delgado <lnsdev@proton.me>


