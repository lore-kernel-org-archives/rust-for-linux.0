Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281A532B98F;
	Mon,  5 Jan 2026 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603788; cv=none; b=CJKMTLupkJF1q0F+AWTYlTu12prvrsse/5F4KHls0BuzzXHkbr9g6F3nfq9kHVfu8ZBxyDRpCzElJop9kVTPkYOdb+EIuWb4SiQ2hvddOKuXBp9J1YcmxCOPY3Y8nCEO6BWjK/yfgLJwRK6w43Jfp2ShU9ivTi/YO5rh+tuOirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603788; c=relaxed/simple;
	bh=nDxFzRZrQadgSgMbm93SXcyEn3h84RlGVDadBNlZ1hE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fJdn8OeChYM4JusjsfUl28mCnUxaW87A3hRLPx4550Kd/Tlsic0nOEorzbbtA5jSzIeeY/jcJpMNZS3s6IIMkh/NRu6xHQgVoCIHha+Y1Aj7lMNm9i8kiJ3Muxbh36ZjmOd8jvLchas7kRLS0qjwiPW018lBNfzR9z3ZH+g8AcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUlXDEQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUlXDEQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC8BC19424;
	Mon,  5 Jan 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767603785;
	bh=nDxFzRZrQadgSgMbm93SXcyEn3h84RlGVDadBNlZ1hE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UUlXDEQL2A9Ic+Wn0J0ClTK0vl/i2UeWaoUZgiNowFJeCtsUiUcpK5ybYc76HgqZD
	 um31MMazdkRewo2Q2lssZ1qdlVi0+QlQwlkaeUZtf4/u3YKu5QpRI1iUmA0xy1nu7B
	 o2Oy4tym1Xy33GAOPlKZiyUvmU6KxlSCUU6YcMKBc9qnqXRaSFHaJcoBCJB66FwUDz
	 hb1N378SCb1fGVBbFDxg5+VPL/I278T7iAxe4nmWNfEP3ZVDZ0w4/ylcuCrzxdP12t
	 XS7xzDh+xrU4B71cvl9asrb5dVbOXY1aPSAuRZ3zXWs/IwYt55evX2aGaGCH5WCZg+
	 oI7Sap9ccR7vA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 10:02:59 +0100
Message-Id: <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
Cc: <aliceryhl@google.com>, <acourbot@nvidia.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
To: "Maurice Hieronymus" <mhi@mailbox.org>, <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
In-Reply-To: <20260104200733.190494-2-mhi@mailbox.org>

On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
> Add a derive macro that implements kernel::fmt::Display for enums.
> The macro outputs the exact variant name as written, preserving case.
>
> This supports all enum variant types: unit, tuple, and struct variants.
> For variants with data, only the variant name is displayed.

I don't think we should be adding this. Display is designed for
user-facing output and so it should always be carefully designed and no
automation should exist for it.

The use-case in the second patch is also much better served by either a
manual match on the enum:

    impl fmt::Display for Chipset {
        fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
            match self {
                Chipset::Variant =3D> write!(f, "Variant"),
                // ...
            }
        }
    }

Or by adding the respective code in the declarative macro already used
to define it.

Cheers,
Benno

> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
>  rust/macros/display.rs | 52 ++++++++++++++++++++++++++++++++++++++++++
>  rust/macros/lib.rs     | 42 ++++++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 rust/macros/display.rs
