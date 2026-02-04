Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378962F0C79;
	Wed,  4 Feb 2026 04:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177914; cv=none; b=UTa7vQ96HOrmsJOFZBXVqLNznNXn0lslyajPjIhcgwvCM+P4ZXzDprBwkrsuycvXXmGN+G1SQze9J1IVvQyE2N8uDr1TJaBVdjl61tVU5Np7LwatEpKvPmgJf54gdu5Dtn4csZH0e9cY+CevlZ6l05lbebd3lAsU+5R12pa+4gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177914; c=relaxed/simple;
	bh=i6B46l/QNgnb/riKaNTbsLdUqBhxpAy8DRQFk+QCLqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QBJTOIj6CTU+0ZFZLic1RMCzyK02jx7FYfYzxxDhVu9qLhWMHDx5uGXRiPmeCre/VeTi4VYGYkRrkCMvm/9AtvcW1PL11usmecqHtwAORPI1B0G8ivrjO9S9wM+MKq0e/Hm1Y0InLMoFtC4283st3TNqhe/Mqif4bNJkPoB5ihA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 9C58BF43B4C; Wed, 04 Feb 2026 05:05:10 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com,
	Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 4/4] powerpc: wii_defconfig: Enable Rust
Date: Wed,  4 Feb 2026 05:05:01 +0100
Message-ID: <20260204040505.8447-5-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204040505.8447-1-linkmauve@linkmauve.fr>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The nintendo-otp driver now depends on Rust, so let’s enable it on this
platform.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 arch/powerpc/configs/wii_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/wii_defconfig b/arch/powerpc/configs/wii_defconfig
index 7c714a19221e..b1172249e783 100644
--- a/arch/powerpc/configs/wii_defconfig
+++ b/arch/powerpc/configs/wii_defconfig
@@ -18,6 +18,7 @@ CONFIG_WII=y
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
 CONFIG_PREEMPT=y
 CONFIG_BINFMT_MISC=m
+CONFIG_RUST=y
 CONFIG_KEXEC=y
 # CONFIG_SECCOMP is not set
 CONFIG_ADVANCED_OPTIONS=y
-- 
2.52.0

