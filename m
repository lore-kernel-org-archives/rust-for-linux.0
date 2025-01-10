Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5446021B8E1;
	Fri, 10 Jan 2025 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736540278; cv=none; b=e+DkkREluwrfbN9oJyQmuEz+qCSGvzmRiU5gNctYuGUHwyzkCBupAxS7BQBRkOytZIReE6o+mv7nJ4unOofXz3eUvAUxkoPZ9HsDLIFb01JkfRkESOAcJYVkSxEtBqU2MKtoXAAUzlK2jBe6Gy5+uH8U9Y9S8qigjFAyXRR0vXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736540278; c=relaxed/simple;
	bh=gbJnMsHsGxqNRgpKg6CpvUhSKKmts7MnS/ouHzzjaWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvPKno9JDnHKssm7atFZqESDN7e1tVJlnLKP6Kt2bZjyT4eAbRPC1pX2AoAN9EMtWIRwFoxBt87MgqOjHuC0MislASprvUD7D6HGnlTGRkmhmSG9A/m05q+ht4sjIhy2NN4oBbty1ZEx1Za/mGvmX3rfetkexbBYm/aQtSjSCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BBgdf3on; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BBgdf3on"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDC2C4CEDD;
	Fri, 10 Jan 2025 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736540277;
	bh=gbJnMsHsGxqNRgpKg6CpvUhSKKmts7MnS/ouHzzjaWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BBgdf3onJZMwKz4FpYo/kLmSjdJKtbMKfMR6Z7JhJDIKz3eFAxDH4aKvq+HbTmZnB
	 T8ZvMblgo+FZG3gk0ybqby8mx++dB6xSZo4asc6qU+FfG71mOUOD4LyN+CN6DS/rHJ
	 1eZ6NB9HgJ5Euc63ytwpH35ftc/Xiu6EDK+/byaOZII5aQgtewhcqAU7vsJKE5YDmZ
	 /jIJAtUbr7wxne4w9Hqqt96R0GoFSeCV5SNA8HLnSRvccaxfhXXRfsXG2sxNLKksHG
	 gv+tK68p4aCscMayzyWf5YU7+nWKiIE77kd9fPZOY4JIr1Mu/2ljpGcmmC58IlNmV0
	 BO3zFR34urcmQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 10 Jan 2025 21:15:37 +0100
Subject: [PATCH v6 14/14] rust: hrtimer: add maintainer entry
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-hrtimer-v3-v6-12-rc2-v6-14-f71d50f16482@kernel.org>
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=gbJnMsHsGxqNRgpKg6CpvUhSKKmts7MnS/ouHzzjaWY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBngX/simGNi6BoqKzEWCBqjL+1qfRND7OeTOe2i
 hq2kruksY2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ4F/7AAKCRDhuBo+eShj
 d7qhD/4pk/AHetUJGnQydKxgcPcTNHBGPpv7g9QyXh96ZtFbQstifnhfBb/K+mg0Ftb3G7KjHV4
 6fNujFhUXmthMUjIqYzkXOzrZVm7ho0WdJMWLb5A8IVasMa3dLK18zyZIs0T8QazKp5RmJTVVYf
 i1NQAD2IEPBG6glr/lWhwzUV5Iy6+NNBNyQSuJ/GjhUc8lJnd+AVpjwj7wPsCbTWzGsgb5+Twoe
 dPVoejDCzUh2Sh8tdiBj1ThoVDGB6bPpDVwcZFhRhZGLvKhRV60pw+C8d6YTGvMMgIIDeY6DB1F
 7zcv35XCqth5x7HJhXf/WEi3DIXmb0b/Wz1BQ8ZWOWxUe3EVzjewQrqIGa5bEqQpXp36RsY2KN0
 bc+HRZf5ZjDsTlAhwiuu/HKrbkRSdhh95NU/LeBXpwfr5NKuY8kDu73mfkB6n6BbJ2uEOmWupCB
 blRQ3xz4cisTGvqfbqm3ir3GWqvkdokR9WCt89J2n9QQsgnLJz2lU1SnpPoF2S2+Iy9y0b1VpPM
 mqv93iIwyHNGrVwBLYBjeWW0ko/S2nm8bAuD5zPlHU8xBTbOxZU+Kz7cMweO95JuwbPbdsGDi8d
 e8NpOklrYWtYuCaowIhV09YLl5xL3iHx8uCV9xSdaXdvGaQYBsPfNpl2cy++xhqrnWtfA7l0mqh
 IvE+EO0KKwgC2eA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add Andreas Hindborg as maintainer for Rust `hrtimer` abstractions. Also
add Boqun Feng as reviewer.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30cbc3d44cd53e6b1a81d56161004d7ab825d7a9..926e1b4c548494ad84eab218167a3075c125908b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10253,6 +10253,16 @@ F:	kernel/time/timer_list.c
 F:	kernel/time/timer_migration.*
 F:	tools/testing/selftests/timers/
 
+HIGH-RESOLUTION TIMERS [RUST]
+M:	Andreas Hindborg <a.hindborg@kernel.org>
+R:	Boqun Feng <boqun.feng@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Supported
+W:	https://rust-for-linux.com
+B:	https://github.com/Rust-for-Linux/linux/issues
+F:	rust/kernel/time/hrtimer.rs
+F:	rust/kernel/time/hrtimer/
+
 HIGH-SPEED SCC DRIVER FOR AX.25
 L:	linux-hams@vger.kernel.org
 S:	Orphan

-- 
2.47.0


