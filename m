Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A7399343;
	Mon, 23 Mar 2026 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264146; cv=none; b=NymT/BtIllpg8C+TWIPzSYPE4l+G3xZTY5+jNnkx6oetLUBzO+q/5AhNaBpteVf5D+lXU/KmdKOst3OY3ZWnhTosiLEr19FClHwFClv4w42m0Ol3aGh0Fu9g6LNNU3O7dvrCxcQJLdt73rIWO3Ab8m+6eWI3do5FhTRzzbGQMOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264146; c=relaxed/simple;
	bh=c02vHjSv/KnwnBl31b3200KO8Ov4nCYqFR61/Xbb+/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N5wGIF54tAAtWxbxfZQJTj6LChBEXzCwr0zarp8XTj06DjEuMAE/t4W4JCU0fR0ViE4DpUTHWugBYRHoGw8ngKEUpQpeOw1FDYgPRCvu+JphEOoK2riNY65bScRmoLYQIWbDnFC6QQ4XpKYDC4goTtO7BfVbcr7nitJuvTZKQ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLdrc2K7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLdrc2K7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE29C4CEF7;
	Mon, 23 Mar 2026 11:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774264145;
	bh=c02vHjSv/KnwnBl31b3200KO8Ov4nCYqFR61/Xbb+/E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hLdrc2K7sLRT1iBD3oX5hNcVTu1Sj3e58odZ+Gfhg02EHDb/nbjxaNxAKLOliTwp/
	 CbrLw+ocPhAn/7Z5oV/XMEtXKhB7DYiO9UnjPli+aD1UU/RVBhohjLKXZ9SpMCLZ/C
	 q9dyF/HRDiuf4he+z6GSb33zaMD3WeJpAZ1FGoO6VGG6jJwxhqztc34JAp+BwSd4K3
	 cnUoDKyurSpH0s7+YDIx2X3OdwvVafkEWKO1MFr2rrNYT2BUH2VM+78z7NNU0fN8i3
	 RLP5XN/jAPoM+B/xA5c4/qgtQsSKWD/3MUvTssNG8U/wCK2IuD9DNEAUl5VxE/Fbl6
	 u0W4gQVHcXqRQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lyude Paul <lyude@redhat.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20251114184207.459335-1-lyude@redhat.com>
References: <20251114184207.459335-1-lyude@redhat.com>
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
Message-Id: <177426402884.828014.8580741730594495695.b4-ty@kernel.org>
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


On Fri, 14 Nov 2025 13:42:06 -0500, Lyude Paul wrote:
> Since rvkms is going to need to create its own Delta instances, and we
> already have functions for creating Delta with every other unit of time.
> 
> 

Applied, thanks!

[1/1] rust/time: Add Delta::from_nanos()
      commit: c51866f65b8ac37b8883a2e80ada13c8cd4d2f7b

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


