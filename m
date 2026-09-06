Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3E7377ABC
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Sep 2026 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788679019; cv=none; b=nsrAFzfO/GLCkw5VrPgS3JgwzDTBwwJs48UwMlG+PCjCz+UsQrSjTHGNQbzyEwsIX6HQX2N6n+ldkGk2Gm5caibVzE18QP6XGnoZdEch230OvhCh28MK6kllFaKbeQuAdkQBR25pc1tJz0hjL5pIpHKIURgzU9Xv4nxz93lQva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788679019; c=relaxed/simple;
	bh=tL8sIC6QLDl8w6EVxitJamuoUEdvD5R0cq6sKy5DHhU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MqQhSDSV9LZmxISmSDsfVQMPR458U5JW1G7HV9cWubJia3MpoB0vZzqPY0DjIcocay2bGSqATTnLkSt/AnqdXyuRUxohAUT5b74Dbzkk0Dv5dd5UZmGOsRjtiUkWBtmeXENZLtrieOj4N4QdnVWUXwQ7SwIUH3fkru7y7woPZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=laaFAk65; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="laaFAk65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788679011; x=1788938211;
	bh=N/40xsEU7tolwSN75TzYB4doWa4y8gDvG2iAcA2tqvI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=laaFAk65rQaFSSvJDqLvNKrzsIn/V77cVLAeD79/rfmS3kgBg7O6gYA40n5Xs5kjc
	 pHBimaI84uXoj+XT9Dh21TcUmqovUi0dfTHM50dYa70rzVuHE30U1K9ZxvcV6bgE1Z
	 BSz/i4KgHX/AEo9Kr9dNMEE2Brau+Cuxibmn3bmFz0XUQb4qInS5MBG7qHXBrE2YPZ
	 jQvlxpwVBVg34L1qw6XKBpoOb81BXk+A5MyZzJeMy/ccOCEdR4/CsrqhpPu/FlcYeh
	 lvX40Kr1fLbrbUqpUWjQ2lqBbkKRhOM6+CLnhGkdSEneG0dxlMzFjONPuFjBTGaynz
	 NiYb2v/NJgeqQ==
Date: Sun, 06 Sep 2026 07:16:43 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 0/3] rust: migrate users to zerocopy traits
Message-ID: <20260906071635.160615-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: e09f9c8cb5f415fc477fa53424cf3e1c6e30ba64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series migrates `dma.rs`, `uaccess.rs` and `net/netlink.rs`
from the kernel's `transmute::{FromBytes, AsBytes}` traits to the
equivalent zerocopy traits.=20

Sagar Taunk (3):
  rust: net: netlink: Migrate to zerocopy's `IntoBytes`
  rust: uaccess: migrate to zerocopy's `Frombytes/IntoBytes`
  rust: dma.rs: Migrate to zerocopy's `Frombytes/IntoBytes`

 rust/kernel/dma.rs         | 22 +++++++++-------------
 rust/kernel/net/netlink.rs |  3 +--
 rust/kernel/uaccess.rs     |  5 ++---
 3 files changed, 12 insertions(+), 18 deletions(-)

--=20
2.55.0


