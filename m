Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463142;
	b=CF6wCpL5lS4W/6/sgWtVxnyZ2p+aT1lvmSOrU61AzMDY5mwohGYEaXSWhjnmHo83ouQh
	 GNcRheBg4Qn7xYITr5PQtOOMW8PsOhQZQ/wFoeTV9+WHJ0gxwmbq5yhZVZYnrtnSsA2wC
	 xPvboWs7QPeWERFmXpgZ5Vf4d7TNFsyq6lTGTgyT/rjfxGMgo2h0htgx3MSbp+xyBHEpV
	 QzYEC/DGq2Skp7O9raczc/SVxvFJdM5PNlVBXQFINpZaUGeOJ2t8HJlOuojXD5bGVhL6P
	 jAg+rdItuEiXvbLa4cUtubdA5xF4NSjFns+okPa+A51Y84nZyjxhhBT0vDmEuziNTtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463142;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2ER0jg24um4qxbiP1E5w4UI3nBPuzedl7nOqBNaBhXc=;
	b=TLlIZnw7mxEhflkg71ZiO8CDNTFQlFkC0udOZNevuqsRezsb4QSreSH30ga9RzVrR8fL
	 XK+8PoWh7kqnxDlrlMhbOpasAhr8TJcKWQUqL1sdh9pgSChnxtJbd2QLuEj+YQRoKvY3y
	 +Nsrigh+T2t9NDSB8jDJANP5+3ZCER/SbItnW6roFkjbWfZQkhG/YPYHMSrlR0iDm7i8s
	 J/buCNC55SNlugEsPjbV6Sov1jwYs0oQTpI9pmyM8O6byitCe7+2317iCErBmwFQNmUbq
	 hSPqW24g8uKj0Pku4H8LF4iMffcXPe0BYys8sS+Vw9VvTCkth0APaDNEvc3+4FbdN7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGsQBphD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3E606A321;
	Thu, 12 Nov 2026 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGsQBphD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2161F00A08;
	Thu, 12 Nov 2026 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794463142;
	bh=2ER0jg24um4qxbiP1E5w4UI3nBPuzedl7nOqBNaBhXc=;
	h=From:To:Cc:Subject:Date;
	b=AGsQBphDht4tCPbCp2tN7/iHl3/wB/NpF1SwNDZVSwGwUyj6ljjDzAeluv8HVshRm
	 UuFEL4voraHtXXqptFKlrTe1ZSDhrLO2vNAB99vuB5wYuWkyAi0n/zyoIbbD4ksI46
	 BmETC2KbOytSGIOyc8oz+C8NR/nR8WRgjA96YPkFo890qxFJMNCVzBASWRhGV++wlq
	 wlUD63PVjxc+QFnOtsKK5YNgRPcUl1RPtl4C1SpnOp8wP6JaxKyvHoP/EGsZAa+ou1
	 nHMYBTf9/NVPDJUyRcoOgzjSWaZDGpnDEkz3cNVbMLM2BRAzGmN05XT0sK8ORGnNJC
	 z6FOpQ2H35+vw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 7.4 (3rd)
Date: Thu, 12 Nov 2026 06:58:36 +0100
Message-ID: <20261112055836.340104-1-ojeda@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull this fix for Rust.

It has been in linux-next for three rounds.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 57d916a3eb765ee0577d269bb2ac1bdf3a7a7f40:

  rust: bindings: derive Zeroable for bindgen's opaque array wrappers (2026-11-02 03:06:57 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-3

for you to fetch changes up to 1178120c3bed1733aea1c465200a6b42f8a7105d:

  kbuild: rust: support stabilized flag `-Cprofile-sample-use` for Rust >= 1.100 (2026-11-08 04:40:23 +0100)

----------------------------------------------------------------
Rust fixes for v7.4 (3rd)

Toolchain and infrastructure:

 - Fix build error in the upcoming Rust 1.100 when using an AutoFDO
   profile by supporting the stabilized name for 'profile-sample-use'.

----------------------------------------------------------------
Miguel Ojeda (1):
      kbuild: rust: support stabilized flag `-Cprofile-sample-use` for Rust >= 1.100

 scripts/Makefile.autofdo | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
