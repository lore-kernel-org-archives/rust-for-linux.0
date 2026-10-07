Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0338B133;
	Wed,  7 Oct 2026 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368465; cv=none; b=SqnIDqgeedQe3qRikgOIvPDZf7Bt6iRZvggSNrPt22kRXecRI2ldPUbt1s/OZv9cMnR0iH1+BIgiO/IUnPNF5wpF4yIOxC0+taMHavWrK8RI8ayW4UkMSfPLrC104aSRwFcsNJzoowRu7Ld0cvY9VN0jUo+IvWiP5NqL4Uw1fDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368465; c=relaxed/simple;
	bh=OLTIFOSl4TcsWgIwGxCVN+jvWpMS94mQcT6sgB/lEq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0lhSVwZvOhJT3MdXQlOzi9l8E3WSQc1p/U8iRwV/x57Dnufmc0cMqNj8gJZxJP5aSVrdp5xKUdcefG6Rm1p2Fbho6UtvDfLIbvg9SDKs4ORlM8FDQAq1m1hFxAKGHfRCq1dFmH/LuQm7fTVblfGaO1pq9lMGN7kJqJGJyqOkCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8QbqgeQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8QbqgeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE3D1F0089C;
	Wed,  7 Oct 2026 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791368456;
	bh=WIig5f17Gy+zAs2F0dljZJvZmy8K/2rmRRrQ7RDhc9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e8QbqgeQWb4uQkZvfTRSDgllCviuhpqS1La2E8mKmjvJzDXJH62D7kbLBl4RB0Clr
	 VFPdHvFiMkQ0f9XFD2cqXIMMvLg9/0494pcoNmyBHxhu8i2bEmnUU+pyxufP86jFBA
	 G9Hf6idbHnbMCF/ZD7qJZNEqXFUDC4ImFSX+TZurG4sfNU+QGHedk7xTFrAitsIcKM
	 9O0JiUsNw2Nr4TVUhsGxX/pwshx9JyFXKh4GUFUOdOOfOBPeDtvVjOawdye3tB3+OB
	 J2XgBP7VuQrPhPsFNz7k66a2lxI+pvNAsBWu5ZsxRosR3/PLHhl5oyEBMYKfYtCF5Z
	 8oWDx5MdMO4ow==
From: Benno Lossin <lossin@kernel.org>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH 0/8] rust: pin-init: various cleanups to prepare for self-reference
Date: Wed,  7 Oct 2026 11:20:45 +0100
Message-ID: <20261007102045.1593329-1-lossin@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
References: <20261006-dev-selfref-dep-v1-0-da716f740d6d@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06 Oct 2026 17:29:30 +0200, Gary Guo <gary@garyguo.net> wrote:=0D
> Pin-init self reference is going to be a big feature, touching various=0D
> places in pin_data and init macros. Do some various cleanups to tidy up t=
he=0D
> macro codebase, so the feature can land without much refactoring.=0D
> =0D
> Details in commits.=0D
> =0D
> Signed-off-by: Gary Guo <gary@garyguo.net>=0D
> ---=0D
> Gary Guo (8):=0D
>       rust: pin-init: internal: init: forget guards in reverse order=0D
>       rust: pin-init: internal: init: set span location of guards=0D
>       rust: pin-init: internal: add utility to handle generics merging=0D
>       rust: pin-init: internal: add utility for extract a single attribut=
e=0D
>       rust: pin-init: internal: pin_data: move projection struct into `co=
nst _: ()` block=0D
>       rust: pin-init: internal: pin_data: extract `#[cfg]` processing to =
its own function=0D
>       rust: pin-init: internal: pin_data: rename `'__pin` lifetime to `'_=
_this`=0D
>       rust: pin-init: internal: pin_data: parse into `StructInfo` before =
generating=0D
> =0D
>  rust/pin-init/internal/src/init.rs     |  19 +--=0D
>  rust/pin-init/internal/src/lib.rs      |   3 +-=0D
>  rust/pin-init/internal/src/pin_data.rs | 217 +++++++++++++++++++++------=
------=0D
>  rust/pin-init/internal/src/util.rs     | 189 +++++++++++++++++++++++++++=
-=0D
>  4 files changed, 341 insertions(+), 87 deletions(-)=0D
=0D
these are good improvements. looking forward to seeing the self-ref here!=0D
=0D
Acked-by: Benno Lossin <lossin@kernel.org>=0D
=0D
best,=0D
Benno=0D
=0D
> ---=0D
> base-commit: 499b8f8a5d0401a6ab83b346a307f923640a024a=0D
> change-id: 20261006-dev-selfref-dep-df01df1d05bf=0D
> =0D
> Best regards,=0D
> --  =0D
> Gary Guo <gary@garyguo.net>=0D
