Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6BC14B96E;
	Mon,  5 Jan 2026 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625246; cv=none; b=FTkgshMqiyJIUNl1oSbanRo3Ge/WJnL1qxCv7XvKDFV6RJuaAwPOOqcpx+BetoiZf4xtYVBicIFMhKoxl42WvfQX/uW9v0LSOUcHZ49ifcru8wYGJM8MXQhnBvQ49Ohvd1NsicwcczzLYgwux1SjEfAdNNOyfNm8BLQlEGrJ80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625246; c=relaxed/simple;
	bh=7gg5z6C6yw3HptKGw75TFDN4ZG/aBRLGLWwhqPAD4qw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EjNsFwUDHwRgg5F2ztip7Af0d9Lfu2ghkqeEpaSyb8fMxLQRvHc15VLvgkUEKWvN0Tzpm9hTjrW07BHXBxJ+Em7hCi+jIrLCQa5OL7d8b1VvMUxgay9ilMKXX7gKBHIOm65Dp4L4xKVqeHSiFRSdndzWmHQGaLdaK8MovD+6OtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceyc/DIZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceyc/DIZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B3FC116D0;
	Mon,  5 Jan 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767625245;
	bh=7gg5z6C6yw3HptKGw75TFDN4ZG/aBRLGLWwhqPAD4qw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ceyc/DIZR5YXAjppuoL6w7w7HZopdRIgz+s2KWeiw3t7KHB9OFNAVY4pZ4dxaSoo1
	 kUsakpsv5hoTZ3+Ie91bdF3XP2T8Vo/flO6OrNdaKiVErMuZ87PO7BTpZI0KBLLPMH
	 r9C5NlQ07vUxlDFsnnqt4sPO6MI3vUzvKjXuN/lDRlq3VpdGb7ykydjji/fSNZmsZF
	 68jWpqQgPEkLF5X+zTwxfKnaMjS2xPAK94YBG1Mhm9OB8oL2I26UlAgTBQjO4Vu6D+
	 TywOtM9aHaAfGHmHAFi1/79K2ZEGQxj9xSzRd1/gauR/C2eACXh+sEOgWfgfscm1Vh
	 T6BvRfh9vMEUQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 16:00:41 +0100
Message-Id: <DFGQUPHJVF5M.3EZ2KL4XIMDJH@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
Cc: "Maurice Hieronymus" <mhi@mailbox.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
 <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
 <DFGL2QTNH7FE.93EN71L7BXFM@kernel.org>
 <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>
In-Reply-To: <DFGQH1FOS007.3IG8XIBOBWTZI@kernel.org>

On Mon Jan 5, 2026 at 3:42 PM CET, Benno Lossin wrote:
> I'm still skeptical about having a derive macro for `Display`. What
> about adding & deriving the following trait instead:
>
>     pub trait EnumVariantName {
>         fn variant_name(&self) -> &'static str;
>     }

With a derive macro for this trait, that sounds absolutely reasonable -- a
corresponding Display implementation becomes trivial with this.
