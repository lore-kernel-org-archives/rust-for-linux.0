Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4650B33C532;
	Mon, 22 Dec 2025 20:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766433864; cv=none; b=kPENXjhDrLfA3deEYdeGQVaW3Mu7jG7JuYJJjs1EEk34yQGFGS0WeYK9ynYVQ2zeuVzWeY2Cc8kkzmaYdmQyBe/Z+ellrgrgp3hms9Xh27R9X7WeWArABNujz/W7REoxGu40O4BhorIQI1vD6F9VPCDlbKzTJXLLdqW9vkCR6CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766433864; c=relaxed/simple;
	bh=qWPw+rFfeLoArjEtq9uB0kAqLbKM36QdCZevVLAlXI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SE8xus0BbUC80mXGAhoINrhwfj4yPPFM5jedUKEaNxJzKsd0Xgo2J29YGDLAdJ6hubd0rVUhSeZGscBSfMh6BqKaG3ENNalasnYYZpuSMM4tUJepudbvgGtDbjSNWMiANd4JWZrORTWXZJxwZ+vzkGdAUZIfXyKjQGnNUCKAD8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFzoGFZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFzoGFZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75099C116D0;
	Mon, 22 Dec 2025 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766433863;
	bh=qWPw+rFfeLoArjEtq9uB0kAqLbKM36QdCZevVLAlXI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UFzoGFZU3lAsBuIdNfp9TRrUOGTL2q12jCOigl3xofhrdeNLoyTX0oiOFRXnuS7ke
	 Ap8xjJxtiKRciPn1Il/0kzMVJJrhIXZbnSdXGOLEIrKtmq9WuB8McMvAnb3OAjb0ng
	 apXgbx3qt2fjlTyDf8jlUnhpcKjLFXil9ePr7o0uu0Y1pioog8ZiaQWDyTZlqdy4b1
	 1uWZWJfdjs/IyfWaomF7s1TIWYJX20tDdh3onp5NlDs6TkG4CZApZ/mv3/nHZAadIx
	 xw7FLWGFarOZhqW4IzC/rI43j7uW8/4vjOr/e+bIxQFt1VkbJZnx1ZZun7Q1LaxjwU
	 IcRaE4nwhLjbg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
In-Reply-To: <20251222-cstr-regulator-v1-1-430e3d517025@gmail.com>
References: <20251222-cstr-regulator-v1-1-430e3d517025@gmail.com>
Subject: Re: [PATCH] rust: regulator: replace `kernel::c_str!` with
 C-Strings
Message-Id: <176643386123.959021.17088173264199656168.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 20:04:21 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 22 Dec 2025 13:15:58 +0100, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] rust: regulator: replace `kernel::c_str!` with C-Strings
      commit: b0655377aa5a410df02d89170c20141a1a5bbc28

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

