Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E618871F;
	Tue, 28 Apr 2026 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373109; cv=none; b=YwHXuD6qjhJWd3YO1QGnwtGllcLXxb0F5ozlcLcKywrGNhp0t8t4Cl+jApH9MJ0/Tj8ioYRsXdXVuO5ZN6AuFoerpUHGKUUZie053B6DhftIqmTFNTOYM0rgThd8zJzVrtLs9ti/LmvoEsM2AcgPEGwGzu/zDvoutdfl1Cv0Boo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373109; c=relaxed/simple;
	bh=ZZfIYyRN15qXCU4Jsp8BN3SBZ+EWG39R8l2dA99UXL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2jjl9y3qyq9OUcAW/hq63MjU5ODJ+tlGlnhAJL48o5Zmb1nMO3NXSnVRvCpcof0H8kghOMHTF5o0LZ812oxi+KhY0GcpmO2H5ZlpTNMIuFnuHSKEp0sbaAPCEL9ZYcqq140WhZ68G2TB07cHM49Q26wcX8ridFw34cnGuFiTYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=hlmGXPXP; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="hlmGXPXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777373105; x=1777632305;
	bh=/k3WJnrCc/1SKUdtNZFx29KsR7+GA2dSMSk546NupsU=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hlmGXPXPUGxl23J/zVhsoFcT5RlhVj/6IMTsX5Katj1M6fPJTwP+m8P3zfetSnLHl
	 ME/KSrZcczHt6NFvZ4Ih5E3Vji47vkI6W1+mQGlSynJZVpXPiwHa9XjPszBd44QqYB
	 rATrFd77qQ7EWKN+ODfzpt0V2AysEuW9VBJWRQrKUlVp2SVxuGuL9CgNTB/Ce0+H5Y
	 ly8sEyZ9mE8yG0+HrJWoCosXEPWsQH81kz4v+lXj3Rk0ImNwpxcyAozO5gh4FVE0X3
	 I2QL8KtY0I7emM5tveWgpuAQ5dwZFfHw3+3xGTlBbB0HLe7Kq5AzQulbFf96fOFTIY
	 WgFAHucjPWB7w==
X-Pm-Submission-Id: 4g4cWx6Zknz1DDXX
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 0/1] rust: add Work::disable_sync
Date: Tue, 28 Apr 2026 13:44:58 +0300
Message-ID: <20260428104459.174602-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The immediate motivation is the Tyr reset infrastructure [1] which needs
to stop queued or running reset work during teardown before dropping the
resources used by that work. The reset series started to require too many
independent dependencies, so this is split out as a standalone change to
keep the reset series focused on the reset logic and easier to review,
rebase and land.

[1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan.dev/

Onur Özkan (1):
  rust: add Work::disable_sync

 rust/kernel/workqueue.rs | 102 +++++++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 26 deletions(-)

-- 
2.51.2

