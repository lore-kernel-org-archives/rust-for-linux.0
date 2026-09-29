Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E673DA7C0;
	Tue, 29 Sep 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677303; cv=none; b=VU+5WZzE+kB5BpofJnvh/4npAYsG2tZ+oNmLFsQQt3tqyjfEy0zEsy4yde/44NqqA6MH5O3optOx3VHdg5H1uEPYuQkHtcM+8NHC+ZyzIeT9G38hl8hCggmJF1297/lw8zimGsGH1g3ErfEhLx5ls8XW+eV9TAqnU0OaQ3eC6Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677303; c=relaxed/simple;
	bh=2LMxh33TC8Qa10If4FXxgNyIucHPBC49yisCKgY4WIk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rghxCWpTP3u4X99+kiy3FOjNArchfyDFYj8+b2vPKJZdD+lkKjemGqyv+WKnWaGN0W4yIHzPHNzG4bfKkS64uemklKTDjkoLqwyozTWsfI/7AkXb/pzHCb3x/QS4BJtZtTN3bWP6DBB2dw8pPQpjt2F7iG5rNE3lAfAEiVR9D2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLW6b1kZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLW6b1kZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1FD1F000FF;
	Tue, 29 Sep 2026 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790677302;
	bh=5sJ18F//jxLGU0z2dZ5mOouoO6B57hSgseasESMU23c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aLW6b1kZvLf0R6Rg6qeiZo8geQCImBMRjIPQzQZpvvlw6SMSRiqTEe5to7obL10b/
	 LrIRcmbT3ZGZkEB3+d8XOFrKUctVRGOceyWaLS6MYftxSgimUGpxeNJ1+KuGxtiFub
	 hxBGQAD/m/C+eoVHqmNlqAF+q28Ms0fUYcUGnPHgCis1XuxVvE7x2V8ZGDe2rV4z/q
	 FOirId/QoJnZV0zlZjO30srSqd69wH+WByDtAfJLbjX3z/e7wc+xgZntD5S6tVqO5D
	 YwOp2CHS64QnOPRpgB38xjGgv2vdMe1MHHMXHLD9K0M34byYMVtt3hHpWIeg2Q3/ot
	 li5DvITGXEiSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: ojeda@kernel.org, Yilin Chen <1479826151@qq.com>
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
 work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com>
References: <tencent_5449081195EDDF5726C709CF648DD4044A08@qq.com>
Subject: Re: [PATCH v2] rust: configfs: require thread-safe callback data
Message-Id: <179067728853.2045768.9501765478671627493.b4-ty@b4>
Date: Tue, 29 Sep 2026 12:21:28 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 14 Sep 2026 14:09:00 +0000, Yilin Chen wrote:
> The Rust configfs abstractions do not fully constrain callback data for
> cross-thread use. Add the missing `Send` and `Sync` requirements.
> 
> Specifically, make the following changes:
> 
> 1. Require `Data: Send` when implementing `Send` for `Subsystem<Data>`,
>    since the subsystem stores its data by value.
> 2. Make `GroupOperations` a `Sync` supertrait because `make_group` and
>    `drop_item` receive `&self` from foreign threads. Require `Child: Send`
>    because configfs may release child groups on an arbitrary thread.
> 3. Require `AttributeOperations::Data: Sync` because its callbacks receive
>    `&Data` from foreign threads.
> 4. Update the safety comments in FFI callbacks that call `get_group_data`
>    to cite these bounds as justification for sharing the returned
>    references with the callback thread.
> 5. Remove redundant `Child: 'static` bounds from `GroupOperationsVTable`
>    and `new_with_child_ctor`.
> 
> [...]

Applied, thanks!

[1/1] rust: configfs: require thread-safe callback data
      commit: ec27f3b700010d2ebae1cde2df0246197689d159

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


