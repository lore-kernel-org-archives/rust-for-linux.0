Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EA633A710;
	Thu, 15 Jan 2026 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768466973; cv=none; b=NzF4z9afCxkE78dNZXNGSrY42RLmbqzq60L716qBKCQdM4HUKwWdOoVhjGN+rppCbG706nGb4W1LcPf3CwjnRc7JRo+ycmbbzsmSXYBCk1vp0va+l/zwq8ZkeD1NludfwwV4LLmxfvGuW7OrNjrK6+jSgd/7gOgGlK+/ywA8/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768466973; c=relaxed/simple;
	bh=uTf3pK36JfJCDGheiLu3xtoJTUAqL6+1C2OLNfM2PIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SsNmQumkhoL/dYx7bFgTWm1OeJ3WSHb8tr9PdD7y0UePv4b7bqVRg/Xn21qL1ckc8ahBVocmoiL+IPrmAqnWGCzcqBKz12EpFa9lPGAYwO3F/ARszmG5r25UfuI2b40UMWKDg65JTK0Tmw+q4WD5xNhDBqtFWjXaMKt5H2X4vPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvn8sKmR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvn8sKmR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D36C19421;
	Thu, 15 Jan 2026 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768466973;
	bh=uTf3pK36JfJCDGheiLu3xtoJTUAqL6+1C2OLNfM2PIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cvn8sKmRpuVPD1frlgeFT1p4++BlbRMKQDHG5FbPR5lNCQ9E/jKUfYydPjs4NMkpr
	 je3OPcKQpJO9ocW3BPRkrPMI7N7l92WYIwdCH6rlSuCH3mPGDT/9YBHVEKn+N7X1zh
	 yK3ejuGI3oXEKObL3rg+U5EqJhOWlorba7f56oLKArl3sfUbTnwkP3yXp8jgUpm7Dz
	 AccGGGJMPAmjel1+gk6ZA1fBJtS9nxq34LXple3nuS/Ks42YBBfw6StQZu/KychAzs
	 TC+fPbPVvB2ejpjjoqVyB8Sj8+d8gSixbbT6cwdX1quVe+T221jxq2tQOhZEHLOpdV
	 4kIchOarFeHkA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20251222-cstr-configfs-v1-1-cc1665c51c43@gmail.com>
References: <20251222-cstr-configfs-v1-1-cc1665c51c43@gmail.com>
Subject: Re: [PATCH] rust: configfs: replace `kernel::c_str!` with
 C-Strings
Message-Id: <176846695540.721717.140222019430623094.b4-ty@kernel.org>
Date: Thu, 15 Jan 2026 09:49:15 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Mon, 22 Dec 2025 13:12:20 +0100, Tamir Duberstein wrote:
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> 

Applied, thanks!

[1/1] rust: configfs: replace `kernel::c_str!` with C-Strings
      commit: 1d40cb05e077bb294f128c6a52630b93e452a8ed

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


