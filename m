Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4582435BDAB
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143616; cv=none; b=Zz2TFnsIgSjE8aP9t8/WC8P8TlICb47eLpA+4sAS5DYCq9W8RpI+NBo5dMhyIQXdujvS5JFpaVBvqEchwKlvWWvlCzu9i87pketWiBAs7P8q4/LNhbs8Xc05uKGFZdeLYlNgaeupgVTbVptE9qCopZQjrUj2+kVxWPdPIVEhtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143616; c=relaxed/simple;
	bh=vyWbS/ppesBx0rG6nt04vo4pgysQzY0IkznBF+vpUqM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=qpNhwn//iwn3NHNgImoZoJkkGNydKI3PezL68TcTKd/6orcg8WxbfuCyG6iHE5QTzDUNA3wH5WgJGMpsAJynp9mLTN5o1ajLwMkkStkFLwlOzJBfyTmc5XZpEzw4vzoPlrDjw+AhpRTKIj+bPhGEBlW/rQNQ6RaLxXlUBFkqJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aq0B8ty2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aq0B8ty2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE18C4CEE7;
	Wed, 22 Oct 2025 14:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761143615;
	bh=vyWbS/ppesBx0rG6nt04vo4pgysQzY0IkznBF+vpUqM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Aq0B8ty2QQIHwPXeVpwK+phbL3Apg1bkOGylrJvB8F07GDuXfcZfd/K8rYspbVXWC
	 IBrcg2yEeo3n7bymj9q8jDsgGOFJGuDqjyfingHPTR1jUNMZsHk1k7wSlyfU7sY0FQ
	 6p9vBVX0mGT4Jgqf5Hj8/pxUnRS/0+68Kbu8/ABU012agSi5tIuWiJFby+qkF3/3mC
	 ng0LnGfMUGUiiihPAc96IoCPIsBgaMnYzT0Y/SWbivonk4kkx3Q0YHNE7JZHZ/F0SM
	 pRfgz0vr/+8snTeDk7RYBtn5lU1tA8le9uARpUQs0Vci43462UHMvkyh16p4gkKhiA
	 xCFk4Fn3wkg7A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 16:33:31 +0200
Message-Id: <DDOXB23RR815.33KM5MWJ6LN4I@kernel.org>
To: "Junzecao" <caojunze424@openatom.club>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/1] rust: fs: Add FileOffset instead "pub type Offset =
 bindings::loff_t;" and FileOffset test
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
References: <20251022122518.457702-1-caojunze424@openatom.club>
In-Reply-To: <20251022122518.457702-1-caojunze424@openatom.club>

On Wed Oct 22, 2025 at 2:25 PM CEST, Junzecao wrote:
> Reference issue(https://github.com/Rust-for-Linux/linux/issues/1198).
> Only addition and subtraction operations on FileOffset are retained
>
> Signed-off-by: Junzecao <caojunze424@openatom.club>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/r/20251020222722.240473-1-dakr@kernel.org

Thanks for the patch!

As Miguel pointed out as well, I already have a patch [1] that implements t=
he
parts needed by the debugfs series; also sent to the list [2].

Can you please rebase your work on top of this and resend? Thanks!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?=
h=3Ddebugfs_blobs&id=3D91cbaa29cecaa86fe45ee08680cf19f451b77116
[2] https://lore.kernel.org/lkml/20251022143158.64475-2-dakr@kernel.org/
