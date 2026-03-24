Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0640A317170;
	Tue, 24 Mar 2026 19:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774381480; cv=none; b=jC5vFhAW2pBNassj04FwP8qLzokjR4zIYsyT+AirKdaDXnilOktniHXwaaZ4rufjPAxhx8GjadQ+vEqefOnrI8V3p/Dl8hfMElXxeNjGCixYexMKLHN8IaU5zRYeIIdRuiG7Gf+ZA8E1NCqiHa+4MvKgqn3zlBm8ywOFEe/Imdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774381480; c=relaxed/simple;
	bh=zS5mxrG4Kpy5YhnC7UwMXTgr8SGetwpIDZ0IHDzJA88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OWEq9Mka36EJDzOp4xI+HKD14B3EcqBnsjQgLTzHN18HIpc62OK8ug2bqEI4Riz6hYN/BvcsHu8kVG6CtuyguNX+Eel4yXZKkqQWBbna7GC9khVe3h/MFUTvka2OYZy4UcVtlauljYlLIsLwbHkhJjLKb+Fj0Tv9TwqC4bocJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5hyuGcS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5hyuGcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1B8C19424;
	Tue, 24 Mar 2026 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774381479;
	bh=zS5mxrG4Kpy5YhnC7UwMXTgr8SGetwpIDZ0IHDzJA88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y5hyuGcScH7EvxbHsHkQBZvO7SoC3woE6TJXBz5s0BGVPkd6TfaULwLu1sC9ffTGA
	 kYu+W0vhh6IHqUL69FZI+Z8qxood2/zoshCtQ8fJykQvsyeuU8ccAJ4vErkhhBfI5P
	 K+qX6Q0gfmYOYwYs0fZ556FtgovXnV56NVYuHwq5E/TMOYWjbAsbdF34b14y8af3gL
	 lHL7K4QdlyIsZv2t2zbajseaII5FQdvnscP0wTQgBUuGp0acP2KvE3EipB6GOR5HlZ
	 hRoBG4qljq1Air9jKfaXLNlpqJbSrvE6brVmbyF15b/WGUL0WJWGvcXO5SvSfUBkDd
	 dx9NX7DtNyqxQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jean Delvare <khali@linux-fr.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
In-Reply-To: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com>
References: <20260324-regulator-fix-v1-1-a5244afa3c15@google.com>
Subject: Re: [PATCH] rust: regulator: do not assume that regulator_get()
 returns non-null
Message-Id: <177435771478.81121.14256327316446596627.b4-ty@b4>
Date: Tue, 24 Mar 2026 13:08:34 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zS5mxrG4Kpy5YhnC7UwMXTgr8SGetwpIDZ0IHDzJA88=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwumkNJN7iL0SuDhsYBaacClr52nzOV5wE0C75
 6R5YASbEhCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacLppAAKCRAk1otyXVSH
 0Kq/B/9Bs1hohFLiAnXDDFPfdQtccux80PgdL6s1zXvqNuI6V7C+YRMsmfw9hAzbHQJU8aneeJY
 VRitAJ829Qj+SKa3y9r/f/Her/BM6fHUtu6FrFzE5KUq8FiM0V/hRLsoO5eXmWD1lSEbhkYTJLo
 v9AZaZ6+YpafJrXEj6OWYNxBHRUbC9smqtQfk/3iEBIvDKmzyG/kvKoYLg161UJ0WgSV0Gs3q1n
 LA9xNTaE+adkAoY7jXm30vv7cfmUNRishlf0MWDEhEuSlBbq8lTAIxrrLeKQiF3Mx6JUlLKFOY/
 Bt3+BusdJ/vlfceMsTK+FeKpOSby1hiKKFrtDqpn3IbII7IF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 24 Mar 2026 10:49:59 +0000, Alice Ryhl wrote:
> rust: regulator: do not assume that regulator_get() returns non-null

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.0

Thanks!

[1/1] rust: regulator: do not assume that regulator_get() returns non-null
      https://git.kernel.org/broonie/regulator/c/8121353a4bf8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

