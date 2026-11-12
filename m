Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487723;
	b=1Hty2yJ7BUZcWnqtZ2yNXNEkoc0HIoxxiO6p+VYY+A6gYQiAWJXh7uVA7FKm3tzrXifq
	 NgF5Qh7keBWNdapmHX8xPAnVrCc+8TqL/T+TKCgDMTZSrIfKGNTEoaq/N3mARbxAxSbEb
	 e4wTKhOygOQzBXAI3gl6ZH7pbwP7XuXRUdFmZAG6Vzgg6vV4EbMRRMjjZC7blvZCpMGjd
	 /1B7Ui0AkmbceYb16hXZe7pQjOWbNqW/Z7rarH796U6ucEHD5BcfYIfq3tQ7G1uTkx01r
	 oOuAjoj8YSDBN+I0Y/jsRwKRzrlDI5lOBh0s1JtQ6/UJaEPMRdIfqw7rCvM/Ck7EM/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487723;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=iD2v8LFpijzdR6UQCJt3wzQ3jGAzsvzALIpq+aTHu5M=;
	b=GlQL3QJelEF3kJ6dehyQceJA3uFLhJkjr4nuO+uySqwMIJgFlLKLVWlj6XfmqSBrYcQ+
	 +9+XFNl2sPuwypERsUFzbtDhgL861mQoQ+8VkQD9NYbQCRsDmWFQqQwj48umzSwM7avKx
	 a7It2vBlOTL8bZWySSwlohp6h9V4LTBVVodKsn8jlNAQ8LlMC2bP/SRUNvqHOURjZ7PjU
	 m8Yy8B/kP1kuP49+72xwxVXxJi3a9+tUeamEPzftXEZHOoIWCHp2zp/sfGgEikngz6DD6
	 7xASwUA0H88sIf4xeQw1Tro2ey53XfcO1nMa5GhBrTVeYz7xHBl3aoC8TJ9pzijwfrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGhRnxNw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DE9606A31C;
	Thu, 12 Nov 2026 12:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGhRnxNw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B31D1F00A05;
	Thu, 12 Nov 2026 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487723;
	bh=iD2v8LFpijzdR6UQCJt3wzQ3jGAzsvzALIpq+aTHu5M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MGhRnxNwRb0jD61vrB02phe4zRP2HYnICokBHiDVki8T9kI2gn2kSBC74mGemF+wE
	 TwOCjgOfQ1DV66eZGiFOwlEc6hJvTxFReMtaPkHBXQ0r//8rRoVbj00yOyTO+DkcGv
	 lTca/+2t34loqt+KulTKWAgKLK4JDWoc4dyj5PIbFJgPgOGn74+1pQvFzL/TgTFne0
	 LsQqe/ONnEnV4fT7H7sk4ukToC/4anO4HZr5273g7Yv6SWKqvW7TJ3LrfoDRYcfIkl
	 tuvbPGkITxl5b01o+thP2U5kJZ8EU/te6cboWNVUP3rhY1XNF0ttClfw7XF+MC7dYh
	 YiAUF6nrJG9HQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: anna-maria@linutronix.de, frederic@kernel.org, gary@garyguo.net, 
 ojeda@kernel.org, tglx@kernel.org, FUJITA Tomonori <tomo@flapping.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20261101232829.593680-1-tomo@flapping.org>
References: <20261101232829.593680-1-tomo@flapping.org>
Subject: Re: [PATCH v1 0/2] hrtimer: Add
 hrtimer_forward_safe_from_callback()
Message-Id: <179448764514.621816.7867597254215777373.b4-ty@b4>
Date: Thu, 12 Nov 2026 13:47:25 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Mon, 02 Nov 2026 08:28:27 +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Safe Rust code can arm a timer while its callback is running, so the
> Rust abstraction cannot offer hrtimer_forward() from the callback as a
> safe API.
> 
> Thomas suggested a helper that does the check and the update with the
> base lock held [1]. Patch 1 adds it. Patch 2 makes the Rust callback
> context use it.
> 
> [...]

Applied, thanks!

[1/2] hrtimer: Add hrtimer_forward_safe_from_callback()
      commit: 66efde7e1d5dfd16516715ddad21422df91d001b
[2/2] rust: hrtimer: Use hrtimer_forward_safe_from_callback()
      commit: 52d29a55b2c7400445a37dfe444ec89841089df8

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


