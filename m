Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9E169AD2;
	Mon, 22 Dec 2025 06:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385458; cv=none; b=pS68Cbf/9HNzaY77Bqz/oOp059ueOpm3ejKAJcIYElA74suodNPmB2kN6xfilInEO6YPbDd248v5a8aGdcw3D6aX+S6g+0fHZQb6QmhzhUGt0YvPsZx/DWQ+oTGZrQAOpNSWRJOAJDRwNq+lWenEd7jrbzuAw5JL2/dvG8MqaWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385458; c=relaxed/simple;
	bh=tPrJ2KqYDah60R2n7TvTfKt5gJ8q4MG4CHg1YUHfBFY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Mho+nvg2ZYqvS3KW2i04iT0vEkI2XxspFcz3YrtbupN/cmqvSGt6GH6Od24KW8evL7iOPAJ+SwgFlgrKXc0uyXnz4l61oZo8zpsWM0B0edNtNrPkkbWzn8oW1e9P3GtV9LiqqhECCk2FKJs7Txdn+EXCM/I4qn77Xt1qd9NHBFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/pZ0vCV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/pZ0vCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEAAC4CEF1;
	Mon, 22 Dec 2025 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766385457;
	bh=tPrJ2KqYDah60R2n7TvTfKt5gJ8q4MG4CHg1YUHfBFY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=P/pZ0vCVEvz00HWaDCCIUv2xF+ad9j6T8hiprrtOc0YLYbu75eFDaVWQ0lrsdt+nS
	 Bu3w4qr33bzPHYJYlXE5C2zHIjy3oL4WRLf3HHRBf5cQYInJ4sDw8aFZRwN2uQnrOZ
	 /c4NMTsVDP0p8pIalpKw4nSUIwb5GcWzrDRDtaRgwRa3Gj6Ontkwdg9g6lIXLyEMIK
	 JylpZF40bYVRxJXLdRia1rg6d6NgQ2AjhQDXIQ5Zy68hR5ZGtgr7FwJ3bhL/git4GM
	 NYti6fSQap1yf1CQhab6fGTzSAVtwBBD24Vz2Qaa51ilOqfMBpVlp3Dh1TT1w5NPvT
	 dXu01gZVJ3JmQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:37:33 +0100
Message-Id: <DF4JDV1G7ZY8.Y239XU0J6VP2@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/11] rust: macros: rearrange `#[doc(hidden)]` in
 `module!` macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Guilherme Giacomo Simoes"
 <trintaeoitogc@gmail.com>, "Tamir Duberstein" <tamird@gmail.com>
X-Mailer: aerc 0.21.0
References: <20251211185805.2835633-1-gary@kernel.org>
 <20251211185805.2835633-11-gary@kernel.org>
In-Reply-To: <20251211185805.2835633-11-gary@kernel.org>

On Thu Dec 11, 2025 at 7:56 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> This `#[doc(hidden)]` can just be applied on a module to hide anything
> within.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/macros/module.rs | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
