Received: from 5.mo2.mail-out.ovh.net (5.mo2.mail-out.ovh.net [46.105.73.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BA0353A7A
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.73.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791747269; cv=none; b=j1tRTUTbmON9iQPGOh/NHQzEqpDkLp6qWprzSs/1UpN/f8oHSk0jHkHwjwHwpLS8oJU+F/nymzee3ZtsrSzz+DIZOCiX5hkGjw5pQZC4skcsPpMVJ2ObM7IBD7x7lYDsrY6j5/N7zcSbdv3DykaEo8VsjWfZZNRqFvTGzxRMWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791747269; c=relaxed/simple;
	bh=sf36srZI89Yro7C76m0e+8weeEY55oIUcM3m3A6Sb4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fti8/SMhjLyrMG7KnvhV+v/zZWrDX6SOO5Cl2lKq1tuCdmXxZApmb2YFw3DndSdmk7q3M1riffnMDQR/ROCFV5Aq9+tL2FJBCxDLC/zRicBkUDynD59qBZ/pkepttsGf7iBvcI4v9Ahea6MBbPca0e+z+8rbfxCmFlMJvAyKEMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu; spf=pass smtp.mailfrom=npnm.eu; dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b=Hdku6kVG; arc=none smtp.client-ip=46.105.73.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=npnm.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=npnm.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=npnm.eu header.i=@npnm.eu header.b="Hdku6kVG"
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [79.137.60.223])
	by mo2.mail-out.ovh.net (Postfix) with ESMTPS id 4j2r0x5mTKz41DS;
	Sun, 11 Oct 2026 19:16:01 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <daniel.almeida@collabora.com>; Sun, 11 Oct 2026 19:16:01 +0000 (UTC)
Received: from mta2.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.118.85])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4j2r0x3Xg4z1xpH;
	Sun, 11 Oct 2026 19:16:01 +0000 (UTC)
Received: from npnm.eu (unknown [10.1.6.10])
	(Authenticated sender: laniel_francis@npnm.eu)
	by mta2.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 790563E1F84;
	Sun, 11 Oct 2026 19:15:58 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-112S006eb4e8ca6-56cb-455d-9ff9-26f4b718189a,
                    D399504B8DAA22F5A3196F0BFCE745750AD202B1) smtp.auth=laniel_francis@npnm.eu
X-OVh-ClientIp:46.177.232.216
From: Francis Laniel <laniel_francis@npnm.eu>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: Thorsten Blum <blum@kernel.org>,
	Francis Laniel <laniel_francis@npnm.eu>,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v1 0/2] Add NonEmptySlice
Date: Sun, 11 Oct 2026 22:15:10 +0300
Message-ID: <20261011191540.56199-1-laniel_francis@npnm.eu>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 16172707737256863190
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGj6psVwg7sDd32gw5mpvFdORpYUtTJntfFQbrl8kGWNI+AT+eKB/cuYLaDQNIcI5YtoZazhZ1PRH5bQcwIgyexZRp331yvQMIzQ3zjm2lWqTGwKm3X/hFU1qkK900mxSxWAFhn4Too/CbNo+AN+xlfhspo5pWeGNfolnmqwxC8pJ8ENiOx8vnARzWK4iW43zAhiGxMkIahD0vjIInNl7zt4409sSF/9IDJ9ROiJbJfvWZh+IqJlpNgK0FG854nR13tTLJiaq2EFiNcCaYAimlFLe5N29qdu38DoEcXixqNhuuFPlWzN9kq3ZG9hj1pSocnqFl5GLBgCq1DUtG9nvjQY4AiZTxmKnTgUCAWsxq4X8OkDOSa362QHeCE7Js3uvawWRr8HRkjCqa8BqSBgssbc9bd3FWPM/v5z64ksW8lHRbewN8Dw1MPNjImE4TKy+aOIvgy7sJ3790Us7mw1dUV8/NWBBiGACoB0uAumxm1uwv8hiiZUJ+kx34QFoTazvhSRYPRA+G4newG7pgnkKmqxqxjk6wZWyK70UFDlSOJBtjaD3Fi+NPCLfoD9k5tfiVaQDQ7B4KXAj3dGCotqqeoN7XFZMtPgCsnZbjSFXhM+eo+tivBAEBVjt+pI+7I0H5eM+cojb/eZ92QriRNHz0uFXgRM/JaqcLDSBzUoCiB1Q
DKIM-Signature: a=rsa-sha256; bh=ap3jHmJc9QnY2sont3hDdJO8Ag/etXpyEVx2Lv2N8DQ=;
 c=relaxed/relaxed; d=npnm.eu; h=From; s=ovhmo-selector-1; t=1791746162;
 v=1;
 b=Hdku6kVGST1JlYbU4LATcHFoF+4xdfd0Wl4e7CbMrUPgIreaoC5ZBVM3IX09IBmnGKOc5tCN
 JMYMrE7GsY2PKwsdHiqA5b2gvC3EO5UfENTRJEAoc/pM+ShAc7GnjSJLUjeEFMOJTSl0fua1ZIX
 ULGBl4j9/yUB/NEtEAb0Dx5qw6SYXj02ip8/FixVCbtZv/FmAMRXd5xx6FXtEZZsaXaXlx8ARZx
 NUgWSYhIN+V4O9WKY2Fl4xTNbjk6y7dJdW55jgADg77SN0jq3y7BOKsf+VQUxMPKw1jpDqZJii+
 PEuJuOGppgNWxXpRRaiOhVs+Ja81RPVJ+yUokDjHhN5+w==

Hi,

Following the discussion in:
https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@garyguo.net/
I wrote some code to add a new NonEmptySlice type which ensures the underlying
type is no empty. This way, caller can use first()/last() without relying on
unsafe.

For now, only new_mut() and last_mut() are used in uaccess.rs. Please let me
know if I need to remove the other functions from slice.rs to only what is
needed.

Francis Laniel (2):
  rust: add NonEmptySlice
  rust: uaccess: Use slice::NonEmptySlice in strcpy_into_buf()

 rust/kernel/lib.rs     |  1 +
 rust/kernel/slice.rs   | 76 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/uaccess.rs | 11 +++---
 3 files changed, 81 insertions(+), 7 deletions(-)
 create mode 100644 rust/kernel/slice.rs

Best regards,
-- 
2.47.3

