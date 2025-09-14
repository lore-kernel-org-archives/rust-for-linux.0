Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3991224169A
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 03:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757819925; cv=none; b=HjC6Dul7CgrVJPO0mRuPVcfn6rCnQqTyNeWQ89uqAEbZECrZMmzJHExCHwd5npX2u99BbFvThiER/GPEW/Imw+yrph4MO4NqttrKKOV7FMHh78rzpSe7QZoKeqvkqBw24Rn/oBTy0+l8HLFkk2dLJv9+HDaWWzjFwACLcBsSAn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757819925; c=relaxed/simple;
	bh=8HO2CnGxw8Rdk4WqdBVxErp0DIVbRBXyJCZ0iU5iBmM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Bz6tJgVzw9K7HtA/zgdLJD38stvdNNL34D+MNLzFuVYZ2jO/FSMTVcs6c4N03JDAe1YQKoIjPTcu2NsU7LPUq6ESR0ZrDxx8btyLiWM6kE22V/Im/pV9vQ/aMMoDOCMMYvFaC8wptrWfNWuDoFMVGd8MLe1QgcCoHNUPU8NDNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=GytkyEDg; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="GytkyEDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1757819920; x=1758079120;
	bh=MRymjWNgeQmfyE+Ew0Sso7XVl0th26D1I2xxPRRCtl8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GytkyEDgoAg8CsVF75MsS7+9fxk5YLZFnHPxSA9OIkGcHPnscGcAMkcPrshtNeYsL
	 pVr6KzemNeCSJm9wFvPn6QxwSKVdfgwQAxbUQX5I7y7wabHFmEgjXJHtG6JIs+9shL
	 GYcJNoUZpYZAGM6FY01YHNDwog/5frwfJ0T1iWsoJP9d2OMVTBemRcXGjr3Y3QDHLR
	 56raGfapGYlcGxyUdl0ZKrPUy3G4M3Sjd9S3GW7vrX3o6HITb6Mri3yEuTk1jPotnT
	 Bw/WDxkPQdr8WQ4PRn5coUJe36GwMsCJyyK7QsdTvYTFXcdOa7g8f9unFGKoyRK50Q
	 fCaqf4uHwEm5A==
Date: Sun, 14 Sep 2025 03:18:34 +0000
To: rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, =?utf-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Rahul Rameshbabu <sergeantsagara@protonmail.com>, stable@kernel.org
Subject: [PATCH] rust: pci: fix incorrect platform reference in PCI driver probe doc comment
Message-ID: <20250914031759.9122-1-sergeantsagara@protonmail.com>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: c356bd28e0d6c3f604f7b64224305d417f54c575
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Substitute 'platform' with 'pci'.

Link: https://lore.kernel.org/rust-for-linux/CANiq72msM5PT2mYKrX_RPXYtA4vap=
MRO=3DiSex1gQZqiXdpvvDA@mail.gmail.com/
Fixes: 1bd8b6b2c5d3 ("rust: pci: add basic PCI device / driver abstractions=
")
Cc: stable@kernel.org
Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
---
 rust/kernel/pci.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 887ee611b553..c21cadfc879a 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -240,8 +240,8 @@ pub trait Driver: Send {
=20
     /// PCI driver probe.
     ///
-    /// Called when a new platform device is added or discovered.
-    /// Implementers should attempt to initialize the device here.
+    /// Called when a new pci device is added or discovered. Implementers =
should
+    /// attempt to initialize the device here.
     fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> Result=
<Pin<KBox<Self>>>;
=20
     /// Platform driver unbind.

base-commit: 099381a08db3539c6aab6616c94d7950d74fcd2d
--=20
2.47.2


