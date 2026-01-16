Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D98B26CE33;
	Fri, 16 Jan 2026 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554400; cv=none; b=kTXPdOW8DZXl9pWxvqs2z7WhVBR6NjsfBj3zkuTrApRUoTz9L17z60yYnEpUEnjzmBU8L5W4BIQSwMosHD2aa2ul+JYhmKgWHxDSqHiseFwxVRpqi2ARkiv3YEBH2gQvDseLROmtKpzDwUg8bL4KxzusKTdLeyzqqJm+pH2iyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554400; c=relaxed/simple;
	bh=lyV0r4dmzvc7rd3Md/e2g1I0c1+RKceJzOhR24jb9Ks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dE7V8Fb/b/DuDzqAelfRF0KZ54I9vUKGpouP7Fi7u0xO5QVhtQvqBT9niSWZCP8AiKIXgoE8d5sCbHjPn8TpE5sNaBMrDj88NnTt0BkFkY8KjyYJujxXsQgdMPZNVMUiSOuW6q77PhUVKKSJF4BcQzDPAVz/lbtYJdrCMrQU7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HD/GJmVK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HD/GJmVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5CCC116C6;
	Fri, 16 Jan 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554400;
	bh=lyV0r4dmzvc7rd3Md/e2g1I0c1+RKceJzOhR24jb9Ks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HD/GJmVKYpT8ijeKLqQgX6hMDg4nf7SetQVlkC/swDrJKLL2w+iRxPOX9U10qFh0T
	 ASbrYHYw6NU+WVASiftBO938rTe8KhNDsCTS/818ZF1pTkmTpOIP0JJkVplQFzZS2G
	 XcC1YVXLNMLx5b/KI09O2BmHtlsQCJXST0QIx7yMYg6V24Pj1SHEvS/yBbWlwKb3+Z
	 rix1t8QSKOeH8fvIWEsABfbVFHoynqwUPZXT6pOfO2DiedH4qc07E6eEUazMS+Fh0M
	 A+bxSZ12i/QmFqm6AHSc52TJmb5+ohPbDEA0wqxtecgUoXGwDEJyh+ukhMNwSLEMNx
	 e8MpttAub443A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Filipe Xavier <felipeaggger@gmail.com>,
 Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
In-Reply-To: <8B248539-70F3-4442-A8EB-33F10FDDE137@collabora.com>
References: <2JpjX5S1c2QLiHUftMzVViS7xatVGkJperCPqxJU8ZQ_Opyo4KPge5jcRCPb0Gcgyxb4yeFhm6Y-1X8q3pbNaw==@protonmail.internalid>
 <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <87jyxjf56j.fsf@kernel.org> <87h5snf4yb.fsf@kernel.org>
 <DFP6YJB8C5IG.3G4CMUM6YN45S@garyguo.net>
 <FD404241-143B-4B24-B8BF-3D121073F4A9@collabora.com>
 <CANiq72kaTyiGhp6wP5eecYSSkLGjaOtGmf3gY9hjpz4DOBzdfw@mail.gmail.com>
 <evkQbbieMspKunOXhSr6SNyoOmeZ3YLct3qY9YkpZaVzJ_KNjnb_NVvTeButYgjxNm3Yj9ESNFb05F1iEpK-Yw==@protonmail.internalid>
 <8B248539-70F3-4442-A8EB-33F10FDDE137@collabora.com>
Date: Fri, 16 Jan 2026 09:38:44 +0100
Message-ID: <878qdyeyuj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

>> On 15 Jan 2026, at 16:03, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>=
 wrote:
>>
>> On Thu, Jan 15, 2026 at 2:45=E2=80=AFPM Daniel Almeida
>> <daniel.almeida@collabora.com> wrote:
>>>
>>> The flags may be in your uapi or they may otherwise come from C. In tha=
t case
>>> you=E2=80=99re stuck with a TryFrom or a manual conversion.
>>>
>>> I think a generated TryFrom shouldn't hurt. Just my 0.02c.
>>
>> I would say let's land this patch as-is (with the doc bit I mentioned)
>> and then we can discuss additions on top independently.
>
> Sure, that is also fine.
>
> Thanks for all the work, Filipe :)

Absolutely, I did not intend to stall this series. Just suggestions for
future work.


Best regards,
Andreas Hindborg



