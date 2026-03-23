Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198D39EF07;
	Mon, 23 Mar 2026 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264137; cv=none; b=VwtWoQfXIIZZiT877wOwPlO6GK1Vzom+o/Cg9PsktanHTkP5qHXuxg48vTDpm/AOZztQz+svZILmDt4xtJ2WP9G+QN+wX0gDl5VO6Jg4xHSAcBlGWqVWxuFnTIZDgtjKTxfKMUtpc8e1K3479jqVIMD9l8xxk+ejzLOv4G1/Q6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264137; c=relaxed/simple;
	bh=VotDHZPpMF7liJcG9nTp683dXT1hcG/G7zHm5XjpV24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ep31Tg+45tbD82Chq4WfokmKF1MgYY3YlhpN3FE1n2fZIYw1KkWIoM884S+1hhiQ6J+Vhv56ZmzXF+QlCW6ijCNM4gJxvp0cwnf/k2mhDfVcr3qJ0dv7EPJXZHMobb5ZnxC1Q+ya42CRPhkpVQmdODx6TUAHIln9Gshw1GMFmaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXvXe0OZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXvXe0OZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E22BC2BC87;
	Mon, 23 Mar 2026 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774264137;
	bh=VotDHZPpMF7liJcG9nTp683dXT1hcG/G7zHm5XjpV24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bXvXe0OZ3u4xpLPhmnMyF87nU/E7SskqFl1HSG18mVruMsuT0aTcAXYuXlD4ZE/Qj
	 9qURZfYq4JqtSjzPAzCorhy1VXPSUu9KRkyQD+KJn3qyTWhGnD6Rue5CBM5BgolaeY
	 wu/EzSejTa3ZW1UHj9j5LkfgoOVB4d65ezwyigpbQfleskybAkzqkB7Yhn5132/q4h
	 9Tp4p0DYHjGyVOd4tbJ/DW5x0wBNS3D43XfUzjrfyzF5WHuXXFb5D2O48SorsVP7t8
	 ZkC22p+30sxHlSU4jZjhPANN5WOAgJ1lZREQrbOM8IC1SfvtdRP5NTIZ0Y6Tz3BqEN
	 CsxxEJa6LJmjg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: alex.gaynor@gmail.com, ojeda@kernel.org, Boqun Feng <boqun@kernel.org>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org, 
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org, 
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org, 
 sboyd@kernel.org, tmgross@umich.edu, Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20250630131011.405219-1-fujita.tomonori@gmail.com>
References: <20250630131011.405219-1-fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
Message-Id: <177426402884.828014.6767744559708475072.b4-ty@kernel.org>
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


On Mon, 30 Jun 2025 22:10:11 +0900, FUJITA Tomonori wrote:
> Mark the ClockSource trait as unsafe and document its safety
> requirements. Specifically, implementers must guarantee that their
> `ktime_get()` implementation returns a value in the inclusive range
> [0, KTIME_MAX].
> 
> Update all existing implementations to use `unsafe impl` with
> corresponding safety comments.
> 
> [...]

Applied, thanks!

[1/1] rust: time: make ClockSource unsafe trait
      commit: 67b598db7ef107d80091c4c957694b9a2feffa4c

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


