Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7241F92A;
	Tue,  8 Jul 2025 14:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986080; cv=none; b=XEExTuJoJZK0575PFtKhPY8us0HTkoK24XL/GYIfN4EoQDT1qH9QAiKn+HwPtU5oESZ2+vQJTM5SoJAkDMAECkAqBr6JJxgD4j/gVF5a5NuZ0E4kn5paD216gTBu+m61c8t/G7JXHjvtY87rxJ5Cvg0SkabXFqD/E0VHYFaWGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986080; c=relaxed/simple;
	bh=T6VmvvO9uFBClL8HdGKSaxVqmPmXpFF9bfQy6YorpP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JdsYITIlgewaIs6uQHPnKoZEaVt8hOK/jwMUVXXmerdOZW72og9BvR7kiPtnv9c6dxAnJEBiY9MN+ELEL2YLuW46OeamCovjs6iijXY3N9wb001N3aYlo78R7R80bfQEX20/3+hmMIjTHnrEBLYwWdo4hR/u9rNdydWebVUFP1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxaIU4tH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxaIU4tH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAE0C4CEED;
	Tue,  8 Jul 2025 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751986079;
	bh=T6VmvvO9uFBClL8HdGKSaxVqmPmXpFF9bfQy6YorpP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KxaIU4tH7PaM9FiQRSMz2qq45QfZpQak5HRDUM/L3o+QXQTFkRANKCvPX0Fc8mkCv
	 peCwHHp65swdRdJC1VF6oUINSkQSEyvimjmLWvEKNMp3v4wKvRfa7KNfRukg/gn+fQ
	 gmdOq/fvT9p+LCmxhktGwcrKqmd6oR07vFQCqXPTUBDjuC44zwYU/UyUkwQm0N9ERu
	 nA8S4E9qJXCZYMyAwUcnN7fv/32HgtXH3BSgFtzA7IPOA3t+U5QqLLFiM6VP+wEagG
	 ORFgx098hqDjg57XN4ikS8XfT1pa9/mLnG6fhk7Oh0Vi5ejNh4HTtWHk+9q9by+F8B
	 dLlGP3MdFEAiw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Alexander Viro"
 <viro@zeniv.linux.org.uk>,  "Arnd Bergmann" <arnd@arndb.de>,  "Miguel
 Ojeda" <ojeda@kernel.org>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary
 Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Danilo Krummrich"
 <dakr@kernel.org>,  "Matthew Maurer" <mmaurer@google.com>,  "Lee Jones"
 <lee@kernel.org>,  <linux-kernel@vger.kernel.org>,
  <rust-for-linux@vger.kernel.org>,  "Benno Lossin" <lossin@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: iov: add iov_iter abstractions for ITER_DEST
In-Reply-To: <20250704-iov-iter-v2-2-e69aa7c1f40e@google.com> (Alice Ryhl's
	message of "Fri, 04 Jul 2025 09:26:01 +0000")
References: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
	<bzRIJnmP3zwPCPlJ4GG9diQ2CKzp-7bKbOIEHrtXVfmQ5ImkOBNAxI8wlg0jdrT4nzELpnE3rVzr6T7cJ3xVFg==@protonmail.internalid>
	<20250704-iov-iter-v2-2-e69aa7c1f40e@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 08 Jul 2025 16:47:51 +0200
Message-ID: <8734b6oi20.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> This adds abstractions for the iov_iter type in the case where
> data_source is ITER_DEST. This will make Rust implementations of
> fops->read_iter possible.
>
> This series only has support for using existing IO vectors created by C
> code. Additional abstractions will be needed to support the creation of
> IO vectors in Rust code.
>
> These abstractions make the assumption that `struct iov_iter` does not
> have internal self-references, which implies that it is valid to move it
> between different local variables.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Please see the comments on v1 [1].

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/all/439baec2-dba8-4dab-abb5-faa14fbda943@gmail.com

