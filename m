Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351B3D9680
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 17:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606419; cv=none; b=mNkiJxlXHxzTpuTxbsLXo3XSf12s+tszIT5SJEQdD9upxNQFSiS+DqIR++kdY1dCODsjEyMn2Xs0zGtfzz7Xc6pMI/JG6HjSdcp+Wt3N1S8j7KWgZqKZgPzPZkx9rNXYeuZz1juDP5QK+PZ05q1C7wL/kDAy1IfGDBvNu9TS/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606419; c=relaxed/simple;
	bh=BNvwm0eujy4lp1zy9dn69UwMYGuxO6ROhNxGVk4cdVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hZJdsH5+37CWk5cbrSgwBYztBC7xNKfyx/t9GyoYyyfm35352VC0fQ4rwy3v+eK2C6l8s08CzAbCupIBDUMUvKuTa0wspiHC8bjqIBRd2h7o+brRDfX6ASsieyWkl2sWhFTlzD9KlJGCnoRpnGgxrScffZu0Ndh1xMvQGMhh8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McXyiUVh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McXyiUVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148ADC2BCB0;
	Tue, 12 May 2026 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778606418;
	bh=BNvwm0eujy4lp1zy9dn69UwMYGuxO6ROhNxGVk4cdVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=McXyiUVhc8+F+lYEIIRQTXGdUzeXKzbmJ7hJ1g5uTrIvWi92tJRwYnDIvHJw+rx1Q
	 JcHArJx0w3P/nmxikYoRe8/9kM4GXITD3qu2PzNqy7hR22/5W5Qc+VuUbmzW2BlRqQ
	 uIJnsYGehei+Pb7X1RyfCxCx9WiIl+BSFq1b7SaquHjB1kjG82P15T2ggU9i1RgCsr
	 +KNl+U/RqJIM9rO5DXd1s08NTTZtao1CAtp1MqVwB+kDBqqAzV0ER6OkDpZKnIKXaL
	 iXMPT4ryiHv34GgnqC7N+NXuOViw+esUjpP7nNdcqQpQFN6HJ1BskoIPAilhq06QZ+
	 3tXtp/cB60MQA==
From: Danilo Krummrich <dakr@kernel.org>
To: Hsiu Che Yu <yu.whisper.personal@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 0/2] rust: alloc: fix and test `Vec::extend_with`
Date: Tue, 12 May 2026 19:20:13 +0200
Message-ID: <20260512172013.4020929-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777111268.git.yu.whisper.personal@gmail.com>
References: <cover.1777111268.git.yu.whisper.personal@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 25 Apr 2026 18:16:17 +0800, Hsiu Che Yu wrote:
> [PATCH v2 0/2] rust: alloc: fix and test `Vec::extend_with`

Applied, thanks!

  Branch: alloc-next
  Tree:   git@github.com:Rust-for-Linux/linux.git

[1/2] rust: alloc: add doc test for `Vec::extend_with`
      commit: 802ca0008bba
[2/2] rust: alloc: fix `Vec::extend_with` SAFETY comment
      commit: f497aae6ded4

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
