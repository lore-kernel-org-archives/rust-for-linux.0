Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77018343D75;
	Tue,  6 Jan 2026 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767729683; cv=none; b=Lex7kJmmxk+i/D4yfuksXy+lYLbjDeLt8Vg/ksfI2ECkXPpSrVMrw9ZXx4LA7QNns4E5v/hz+Sh7K8k5ES4qS4T3Qzd8GxNHz86gtK5JheawNf5V444Alq9AQzGGSFD9iboEfuM0hpYJ6HYdFAs9E+T1IM+upi8CWqPckGg9zyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767729683; c=relaxed/simple;
	bh=b/DJPXa3eTqVp5uOO1G1u+2bNqTWBPlFD+WYPOPvD2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVM3e+yT/nwiWut2E27xgZZ87h6Vbs25+m6utZCJ2UNTsVSqifJ18rPL9s/tzvyu4GG0Su0bNiNMZmTyvYAYUF4rLZm9UwEId2aypHQb3B+VYOZNWCkEB4OES4/R1dufZbzrrnpHLZggT6xinVtqgHVX39SnRd/xwlTc5jGu270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5rBtX9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5rBtX9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C860C116C6;
	Tue,  6 Jan 2026 20:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767729682;
	bh=b/DJPXa3eTqVp5uOO1G1u+2bNqTWBPlFD+WYPOPvD2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5rBtX9fjzuGeN+wPL67qubDhCvK0UWSpKZm3u/vc7nKcPNAt4IoryKm1oICiJ4mE
	 glzYLEdT2nCnslu5Nc+LEWFreNiATtHoiWpBClMHPsbNOY9yEPJ34eVXbBpcpZHnNJ
	 jtudwKO/OqV1e5M6cpVdGb0W69AZyNmWYq0SZQObCm25cMSTJxcSPYkwvbI4ShVL4G
	 dhu3YDnU7sXeRYb/siFES2AB7zHNfKJ+GjkX9rbhBWgNyYOqsTrjhh1YYMXzNosm3/
	 gC7+ZeBhep+eRMIwQRnRwkNKP+ebyBdxsMicQVCJhAzDlzGY8wHgLD9+ceYdhZOdps
	 5Z/f6Uc33FsUg==
Date: Tue, 6 Jan 2026 12:01:22 -0800
From: Kees Cook <kees@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Ramon de C Valle <rcvalle@google.com>,
	Matthew Maurer <mmaurer@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: declare cfi_encoding for lru_status
Message-ID: <202601061201.2CFE0303CB@keescook>
References: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com>

On Mon, Jan 05, 2026 at 04:12:47PM +0000, Alice Ryhl wrote:
> By default bindgen will convert 'enum lru_status' into a typedef for an
> integer, but this leads to the wrong cfi type. It's supposed to be a
> type called "lru_status" rather than the underlying native integer type.

Is this a bug in bindgen?

-- 
Kees Cook
