Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55AF329380
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019572; cv=none; b=uXj0iqtbIsd95AwmxsMJB35duADIPWd+r+L8eWRE8U8vXbWqIQlHQanWcEr2yjq+pfu2SI8f30wW1KhOBDFuB+xtuXolEzXMiCr7v+QEyioUpbaKyitEUf5v1A+5F3+cDfnPNEh4oalCNDE9Ycr4ukf8ZbAopMzVoI68QU3TB+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019572; c=relaxed/simple;
	bh=9m1UhrotQdz3yScrh/F7ueoVFITbt+9CqIw/vbvmQ7g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HQt7OcZON2g/iK34lazX7Ng7eHzVxXnG8396mej4IQXQ+Ab9cryMHYY8V8yHeb8yG4Te26vy/rp4E3GFezHhrb5M6YCFppgvVbPh7MrgDXgQgCngTqDeZkySl0wJCkuCUVyE3S/Qi7E3kn6gi9AtxLoKb10SymGc0i59PY1rHhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N4v72Ehd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4v72Ehd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C868C116C6;
	Mon, 29 Dec 2025 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767019572;
	bh=9m1UhrotQdz3yScrh/F7ueoVFITbt+9CqIw/vbvmQ7g=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=N4v72EhdSVA8x1/HqC9H8BijaFqYeNGYQJexncmeFfldxoFMtC1yeQqorRawtesQ9
	 YXoGwfxbz5eLOjOEt785Q8Ly2gUfRqhE6eqOdS0BnJ/xDgGH6GLz6/2MAC1cFUIB83
	 5/0tb74BLjQC77Fszk1GCbWJq0EsL1La+1oQrFqQ2MYyEf2HrY0S8XQ5Et+J5no7x0
	 BV22jzaBxTygnRDJRtxBhFClUVI4yBBiN4v0xQmNibH+qRwYO8cjh2+SC/uc8vMswE
	 6CeOE5zHYv6ROu6i59XXswOx+17XsKDMdGTEMgSMreaMdZ4aAN1m6jqe39Z8ZNLcNt
	 GoEfa4HAJEWxw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 15:46:09 +0100
Message-Id: <DFAS5RWFNUCZ.3L6IQ6BB4NEQY@kernel.org>
Subject: Re: [PATCH v8] rust: Return Option from page_align and ensure no
 usize overflow
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <miguel.ojeda.sandonis@gmail.com>, <daniel.almeida@collabora.com>,
 <rust-for-linux@vger.kernel.org>
To: "Brendan Shephard" <bshephar@bne-home.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251223055647.9761-1-bshephar@bne-home.net>
In-Reply-To: <20251223055647.9761-1-bshephar@bne-home.net>

On Tue Dec 23, 2025 at 6:56 AM CET, Brendan Shephard wrote:
> Change `page_align()` to return `Option<usize>` to allow validation
> of the provided `addr` value. This ensures that any value that is
> within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> returns `None` to indicate overflow.
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Applied to drm-rust-next, thanks!

    [ Use kernel vertical style for imports; use markdown in comments.
      - Danilo ]

Brendan, can you please send a follow-up patch addressing [1] and [2]?

[1] https://lore.kernel.org/all/CANiq72kcMLXz=3DxyZeKC0=3Dj_e0BzJEY3wGpBTTx=
fJsc6EZhCnXA@mail.gmail.com/
[2] https://lore.kernel.org/rust-for-linux/CANiq72mLPvB_6Ow3bW5-V4-km=3DRyA=
59chQ1g1x9qUt2P-zZweg@mail.gmail.com/
