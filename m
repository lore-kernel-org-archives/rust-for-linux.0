Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6DA395252;
	Thu, 15 Jan 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768479294; cv=none; b=NAhMRzRCKVSag4rAzRawsmaN8USv4Zmh2HZxBK/PspGfD4Rnm4VzNH58VPVKwA2aV2eXp58GtJgYISBRHfbqUTmIpWoZYZVR2iSsR9swdT1V6Z3kNrSWUnWK5Z9d5fIYFEwEHA2bVtC4cOwTaU/3JzIhZLK+6XicoS/Qfit4/s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768479294; c=relaxed/simple;
	bh=6r1pN8+xh4lYEpstvL6NhBJB8lFtNgCrlfkxGRstXHI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cUkWk9r0ofPJVmmaVoI/hImPw1xbh4wYHlgCzy5Yoy0xhFQs6rkXtgagdb6/csK31r9F1j0KypVdN4ABGHn2vsswHWyaVlG1q+rddB5KAamou3gI/bGxH00IGirfqDAsZ47x/sYgju69erEpQnzdOX6uCrlQ7j9ABq6yaQ9m00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rrgfFhNm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rrgfFhNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A4CC116D0;
	Thu, 15 Jan 2026 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768479293;
	bh=6r1pN8+xh4lYEpstvL6NhBJB8lFtNgCrlfkxGRstXHI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rrgfFhNmR6D+IOW5ETDhA/ytK3bofdmuWWc7mPlpEFJp6n8jxxJfIQaqIVmaDOlWC
	 AcAKeqbxqG8rCJwIynT4iXAhq8vDdhNh2erC7tJkbVPbyhuA1uBtgUaZ0KgOhmG3bT
	 /UwRoUosGQwZ8wb7xmZFTdMfTfXAFsyUxoyuHdYee0hGoqxIKuzqOPZ7LqpHZPj2AJ
	 uHFBLcXWHrxbUdaqn9LCHSEr2T3LQflcf9rVlvCVODzB0oUhSfk8FZjXkpw+/G6AnG
	 OqOta5fgGYNky6PLBMPPqyjTpAEAOZyYdYiNNqTfSl0lsnMbF+zb4k8I4/yzmdeuxH
	 97+2Oa4we16Mw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Filipe Xavier <felipeaggger@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>, Filipe Xavier <felipeaggger@gmail.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
In-Reply-To: <87jyxjf56j.fsf@kernel.org>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org>
Date: Thu, 15 Jan 2026 13:14:36 +0100
Message-ID: <87h5snf4yb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Filipe Xavier" <felipeaggger@gmail.com> writes:
>
>> We have seen a proliferation of mod_whatever::foo::Flags
>> being defined with essentially the same implementation
>> for BitAnd, BitOr, contains and etc.
>>
>> This macro aims to bring a solution for this,
>> allowing to generate these methods for user-defined structs.
>> With some use cases in KMS and upcoming GPU drivers.
>>
>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Suggested-by: Lyude Paul <lyude@redhat.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
>
> I think it would be useful to add:
>
> impl Flags {
>      unsafe from_raw(value: Repr) -> {
>      ...
>      }
> }
>
> impl TryFrom<Repr> for Flag {
>      // Succeed if `value` is a valid `Flag` enum bit pattern.
> }
>
> impl TryFrom<Repr> for Flags {
>      // Succeed if `value` is the logical OR of valid enum bit patterns.
> }

Also bitwise operations on the underlying type such as

  impl BitOrAssign<Flag> for u32 {
  ...
  }

Not sure if that is possible with the orphan rule, but it would be nice.
I was trying to

  lim.features |= request::Feature::Rotational;

where `lim: bindings::queue_limits`.


Best regards,
Andreas Hindborg


