Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61B837F73B;
	Wed,  4 Mar 2026 07:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772607601; cv=none; b=pmw04Kcj5KITZVIx3vVCYLBDcnQulDJzICIEcmD4vHKsrDAiCz6ybTPqFuIMtmiMo+bBorPDebLycrkKRyJyVNBr1rvg5/PwPMxXyhYefc9HtJAyfVFVcKtANVS89lqJ2tUF9OuFL5gQxUD0Aeow/l1NEvIcUWSNtVRV+1BCrGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772607601; c=relaxed/simple;
	bh=APA1iQR3V4o7MG01EVNiO3zsr+CJrrDJQCLGhny3eZA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o83zYiNB5LeR/okt0IxzxGkuqVwHbAZEOtyYxJPKkODyjPQLemJaHsv5DXqpGBM0uJIYRGEVpAwUXzTSm9xYQUOraDBStfB8oVRHwDzVchmQS0jXO9wDDSmWE0JVsLpXEPOZXrmr7uV7+sipGK7AGEGZRyrHWdyur0r8LkIuY1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEVVJKnM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEVVJKnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2178CC19423;
	Wed,  4 Mar 2026 06:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772607600;
	bh=APA1iQR3V4o7MG01EVNiO3zsr+CJrrDJQCLGhny3eZA=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=eEVVJKnMW4B2taP/TEhbfjbvn3cpyI+SmQLgO04BXp1/Px15cv7Buh5yIo+VazEvG
	 70iVjpjmeSp6ZpWu7PqVoim57FqZseAVQgak6RL7fbcODy2ha/NOutvLOv4AgPRUA9
	 LFLFB142V5LRWHZLXBXOi5BuZBJi2motiJLz2OnHgWvhjF3nLJuz8fRoqbn8W2iobG
	 um2lt+9CVe2w/XsD0pl2eokA6TviO5hNEM5SHsU1z9A+LXWc1SjsQPZNueUkte7sV5
	 SudzBXxo/j+xr3ev/LoFK29OettPTjf4JlnPwF5lefbVFkTXftYv+2x1K1lpY19dej
	 RUgXu78+B4P5g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 07:59:55 +0100
Message-Id: <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Janne Grunau" <j@jannau.net>, <asahi@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove
 `#[disable_initialized_field_access]`
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.21.0
References: <20260302140424.4097655-1-lossin@kernel.org>
 <aabGlKYNd0CrO7_f@google.com>
In-Reply-To: <aabGlKYNd0CrO7_f@google.com>

On Tue Mar 3, 2026 at 12:31 PM CET, Alice Ryhl wrote:
> On Mon, Mar 02, 2026 at 03:04:14PM +0100, Benno Lossin wrote:
>> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
>> traits cannot support unaligned fields, since they use operations that
>> require aligned pointers. This means that any code using structs with
>> unaligned fields in pin-init is unsound.
>>=20
>> By default, the `init!` macro generates references to initialized
>> fields, which makes the compiler check that those fields are aligned.
>> However, we added the `#[disable_initialized_field_access]` attribute to
>> avoid this behavior in ceca298c53f9 ("rust: pin-init: internal: init:
>
> checkpatch here: missing 'commit' before ceca298c53f9

I'll let Miguel adjust that when picking the patch :)

>> add escape hatch for referencing initialized fields"). Thus remove the
>> `#[disable_initialized_field_access]` attribute from `init!`, which is
>> the only safe way to create an initializer handling unaligned fields.
>>=20
>> If support for in-place initializing structs with unaligned fields is
>> required in the future, we could figure out a solution. This is tracked
>> in [2].
>>=20
>> Reported-by: Gary Guo <gary@garyguo.net>
>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-in=
it/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
>
> Should probably be Closes: rather than Link:.

I figured that we can't really "close" a Zulip topic (we can mark it as
completed, but that topic was originally about the field accessors, so
not sure if this makes much sense.

Cheers,
Benno
