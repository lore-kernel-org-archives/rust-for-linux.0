Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651F30214B
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775254102; cv=none; b=efH+3SPNR6zv9nl/tyqWLNLe8plBboHfp/mHRKV3+NfDUfwZMMM5H+lyZR1g8KDXkfqFP+oibEweFxTaeLrkMWhZpC+gaa5SUTCr8qY/VWsWA5q+IYIPFyQcg8Yw2wdoLvkxwAI3HaFaMcq7ztDt/LCmiWif4+32JcPOK4CyIEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775254102; c=relaxed/simple;
	bh=6R9Ft6NEkbDdOi6cosIIlAZjJPdSK7jOfPvD1VBPDPA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cyx7zPx2OOo7aNRHzomeBkysS1eF3tPTo1TfnbSdkiGspbE1LKDcncmwybGjQn0OGc9OjO//vLvl1/61d+ehfD9HafE7ZH3i+Cun5yBtTX3ytnGwpvJttDE/Gc6X8peOTpKtl8QRiEV2xBNxOc3pNCctARkNFAdl13oLibOTX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=aKgtHW17; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="aKgtHW17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1775254094; x=1775513294;
	bh=QLxx6IT9Se/bEnQZLI3gYSB8ehtvjEn7eab1RR/S7bU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=aKgtHW17/9arIgc9wjaODKxz12HNYhpg12WmyHaf/zacZEHUkpZhEbY2XctOOpyTM
	 3FzlvFrClmWT/2Xi6Sbz5zabOK85QjhTIE5Puhsi8slXob3gsjU+S5e/S6QjI4cTIG
	 qG+VNNhTCuXVG2331GMhjO6gCkT9Ec8qferRvaEzttKVU+AxHsflJ6vXdSJ8lCwqrK
	 wj5a/+NhycIlQuPzLqtipI0M7cGJiewf0FtMdOMSLC7pUEQ7nOSkD/SbKbopKu62ia
	 kK+Cqn19wnNJntnMtN7E0ZLrUJt3WzXGgEU3GP2FpWqlpj253eUzf/BHl3p6EHDeZo
	 wuv2y9lUzm0EQ==
Date: Fri, 03 Apr 2026 22:08:08 +0000
To: ojeda@kernel.org
From: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, aliceryhl@google.com, lossin@kernel.org, Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Subject: [PATCH 0/2] rust: list: fix incomplete SAFETY comments in list implementation
Message-ID: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
Feedback-ID: 190658113:user:proton
X-Pm-Message-ID: 94aacd51608a2a4479232ad59eff0a4e40acdd9e
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Four SAFETY comments in the linked list implementation were left as
TODO. This series fills them in with proper safety proofs explaining
why each unsafe operation is sound.

Christian Benton (2):
  rust: list: fix SAFETY comment in List::remove
  rust: list: fix SAFETY comments in impl_list_item_mod

 rust/kernel/list.rs                    |  4 +++-
 rust/kernel/list/impl_list_item_mod.rs | 17 ++++++++++++++---
 2 files changed, 17 insertions(+), 4 deletions(-)

--=20
2.53.0


