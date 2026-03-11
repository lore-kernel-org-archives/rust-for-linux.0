Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688B3318BA8;
	Wed, 11 Mar 2026 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773252878; cv=none; b=AiKrNzGmzH2Lh/tJLVRTb1m9Kv25q1TwjTjIVD2deP5NY+jx8vGt/WMoku9d8jzpwuUiAAjZYFK56wpwY6mf9NoPGzbNRzuN3qZ/Xv83rIOlMosD6ppv3WQDVj8wYTLWVS/PIiiAyjO2jHL9Iewv5M55UI3JZfcb2kr9fbwGSwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773252878; c=relaxed/simple;
	bh=QazkRwUy3McErmvBQbClt/+sIlmmR2iEEOsG1w/764U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=uVPNyXv8FvQI8+bQi/UNqj2gDBFmgIx5bU7q8jF4Lw6ellfDtcVbn4s8Ryj073tZdKNEFPd3XW02FRbToPMKzDqNsTqaDwDFvrWU/8TkF/h+s7L++6qjZHVJGD5WWy5+7XAt/kKD31pean5Ug01nM5drDHzEU+hchCm0iPViqe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dT8GM4+4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dT8GM4+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA9C19421;
	Wed, 11 Mar 2026 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773252878;
	bh=QazkRwUy3McErmvBQbClt/+sIlmmR2iEEOsG1w/764U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=dT8GM4+4s/eMO8EVG29pvt9CfjFNVbSrKob4NHDWn1MgR1/bnl9Buv6yJEKiG1XZB
	 RzK5pNBXuwblgONHXT39MdiMJYWALLOmOUpI85ZEVmlfVzlwKGRInA1Sso30dI6YQY
	 oskCbNi0hcsGLROStU/DunNRmSdyv3OIbV6tOu6mMDIzjBKVWhjhH1PttwpBFUW5tz
	 CQxi2TFQ2etqfz7bQ7IlPflH3EAAEkDdb3Q1CqYSsAdIrwsYKpGkmYYIOca6MGhqxv
	 he8i6qym5F89noH4xW/KptDTvpUMpKXv41t2KTv+VryE7KEmpKNa6g7bFq/rQrINx8
	 vo/6mFaNLNCKg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 19:14:33 +0100
Message-Id: <DH05OK4Z9XN8.2FT8K8GBNA6C8@kernel.org>
Subject: Re: [PATCH] rust: pin-init: replace shadowed return token by
 `unsafe`-to-create token
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Fiona Behrens" <me@kloenk.dev>, "Tim Chirananthavat"
 <theemathas@gmail.com>, <stable@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260311105056.1425041-1-lossin@kernel.org>
 <DGZZ0XF0YYGN.1W5UIBXK16HL3@kernel.org>
In-Reply-To: <DGZZ0XF0YYGN.1W5UIBXK16HL3@kernel.org>

On Wed Mar 11, 2026 at 2:01 PM CET, Danilo Krummrich wrote:
> On Wed Mar 11, 2026 at 11:50 AM CET, Benno Lossin wrote:
>> In the face of Type Alias Impl Trait (TAIT) and the next trait solver,
>> this solution no longer works [1]. The shadowed struct can be named
>> through type inference. In addition, there is an RFC proposing to add
>> the feature of path inference to Rust, which would similarly allow [2]
>
> NIT: I'm not sure if the sentence is supposed to end here, at least it mi=
sses a
> period.

Oh yeah, missed the period.

Cheers,
Benno
