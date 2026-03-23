Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D339891A;
	Mon, 23 Mar 2026 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264141; cv=none; b=qrvN02LytSJfqKqLX0D/N7sDcLyp8jUdVlpSZ+iWH2dGti7mghizRD7a14c5bK1T4psQRbNb8KIDvtR07ee0bLPHsQgMA5vSLTmWaq45iGeiI1KCfbcAid3CGTE3/Sj60j6qmPhLE9si0XdMe/PrpTwfmt9ESZb9ybzByix1+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264141; c=relaxed/simple;
	bh=tRJhKlF4+MfJuD/jEvofdYiury1NTkmp3IuOnq3n6us=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RRt9vf7m8xYiSJ54bYJIdiOD7rSQNmdqjluFm78ihrfni1BC+ZMlAWmMoWv8b1CxXFnO+QxkHfccmumA9l2EU7tUPIVTn1ZaunFk1GPVlepKu3x3pqEtMrJCvQ/mCp6tTrgevWKYdLIhcHyI4HKKDM4uY9WcHeba1fE08hWvBIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsRJD78X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsRJD78X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E0EC2BC87;
	Mon, 23 Mar 2026 11:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774264141;
	bh=tRJhKlF4+MfJuD/jEvofdYiury1NTkmp3IuOnq3n6us=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CsRJD78Xyip9kU3QCVzAaMDST+ZKprZ/andAPud5UA0Y6HOZuGuRYqWfAc69P33SY
	 o9tfQXEVa5SbOnMdgDmnWbPKdAMjw7+H6j0Cclz9rRQTPSn8PN4nsm4a0Yy/rr/uri
	 YW1ti5R0bU3LQpBEQb8g8Kit9Lw6PDGitlu4SU5UxL/if/x4bLGSI0ulO+xFZm1XOY
	 b4tliCEv67v8QIiw0miem674oXAPSHdPQqr+sBUdVy4lqgBhrWNSUCmAVIktG4fcpx
	 EWcjyAnUuzRyAHnjB7mHuJpADXuZAO0qNQVbWUQe4s/0HKp8EGI4pkcTkeyZfChgZW
	 d5Qg0a0TqJs+w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org>
References: <20260219-hrtimer-examples-v6-19-rc1-v2-1-810cc06ca9f6@kernel.org>
Subject: Re: [PATCH v2] hrtimer: add usage examples to documentation
Message-Id: <177426402883.828014.3879666800755434921.b4-ty@kernel.org>
Date: Mon, 23 Mar 2026 12:07:08 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Thu, 19 Feb 2026 12:57:45 +0100, Andreas Hindborg wrote:
> Add documentation examples showing various ways to use hrtimers:
> 
> - Box-allocated timers with shared state in Arc.
> - Arc-allocated timers.
> - Stack-based timers for scoped usage.
> - Mutable stack-based timers with shared state.
> 
> [...]

Applied, thanks!

[1/1] hrtimer: add usage examples to documentation
      commit: ddb1444d3335129ae87d9796ab1debf41c0ee51b

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


