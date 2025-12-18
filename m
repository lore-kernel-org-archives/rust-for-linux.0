Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C121773D;
	Thu, 18 Dec 2025 09:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766050440; cv=none; b=lp53pIVFM2NpVxdwJ/twxISu/B4bztjTq7w6YQVbnezYAmbBQGQLAIQu8bScp0pmoOaEl+W3ZkOK13wBxZkfuykDpOEJYTJoxUV1KY/1EkB3Y/NJ5mL9sfgvHDbhydYOhii6OUxvvxs4EaY7XCQnNou/hs2I4ABIs42QEmuiFwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766050440; c=relaxed/simple;
	bh=+C1Bdl/WXBZJL9d8n+I9VSoMdLX32zzL5FOnc3cxGlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uc37st2NQFkW/SmtCS/R/UB5iyLI1MJApmXiA+FN6kPm9q3KslhaGQYnvG2zw/y9grWJVeL3f6w8QwJ3rzUS1aK7JrH8dzW6DsPZepCRuDCj49FM74jefd7XDwGI4RTCLFV8RiyuZ1KLlfm5TK3384A3QdHAmuluy1uueF/4jfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6aZxZiJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6aZxZiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96089C4CEFB;
	Thu, 18 Dec 2025 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766050439;
	bh=+C1Bdl/WXBZJL9d8n+I9VSoMdLX32zzL5FOnc3cxGlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p6aZxZiJ/HN6o7yiwTXrBDFPBosk3uBs5CFdJ00KlXgbRg7EI4d/AzZKT9k5MjWGe
	 Zrfem64CyCYfmij/qnhTCElDPQoiYRJ+aER9lQ8WKy5DR6tCq/o+IySSWlVhAaABjA
	 qp2Qh6WFpdefjxjLt/49C0GqHHE6okSRHEU+Nkf7JyHuohm+SP0mGakn2BwD17Mtgm
	 qq6fD/zy7IkHru7ytL73z1yAS+LP5AxAIYVFHzaAg9NNlndJ1t3bnTDtdmdafeGRhe
	 x0iA6rMFwH4skhLrUDuXm8+yvm2F6DXHdD4UzII9IHvx0p2rfNoXTRofEmnnvKSdRm
	 5baUNmlkE/g6g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hrtimer: add usage examples to documentation
In-Reply-To: <B10A2EE1-C5A7-490F-B85F-82D5C905DE7A@collabora.com>
References: <20251217-hrtimer-examples-v6-19-rc1-v1-1-4ad0e7e4c4e0@kernel.org>
 <ppzmlAVupzBwfQchQvMLdXNjAU_JEy5uR-s2OhGLegkP3b32qNl67HZIMbZJ1Yk5Yj1MGBTG0TLFQ4vAbW8rcg==@protonmail.internalid>
 <C1C6DB90-202A-45FF-9D01-D7304A8DC8B0@collabora.com>
 <87ms3guqxo.fsf@t14s.mail-host-address-is-not-set>
 <v0gPKXGHYQbFY0p9j5K4pR-jTk2bPWACZCUPBCJuzxR8VCWtS7WgZdakJZm27y_TrcOQgBNY0YZE86-tdZD_2g==@protonmail.internalid>
 <B10A2EE1-C5A7-490F-B85F-82D5C905DE7A@collabora.com>
Date: Thu, 18 Dec 2025 10:33:49 +0100
Message-ID: <87ike4uoaq.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

>> On 18 Dec 2025, at 05:36, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>> "Daniel Almeida" <daniel.almeida@collabora.com> writes:
>>
>> <cut>
>>
>>>>
>>>>
>>>
>>> FWIW:
>>>
>>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_0
>>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_1
>>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_2
>>> [10:52:46] [PASSED] rust_doctest_kernel_time_hrtimer_rs_3
>>>
>>> This looks good to me. The rendering looks ok as well.
>>>
>>> With the nits addressed:
>>>
>>> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>>
>> Thanks for calling out the sloppy error handling, will fix.
>>
>> I don't understand what you mean about blanks?
>
>
> e.g.:
>
>
>> +//!
>> +//!     fn run(
>> +//!         this: ArcBorrow<'_, Self>,
>> +//!         _ctx: HrTimerCallbackContext<'_, Self>,
>> +//!     ) -> HrTimerRestart {
>> +//!         pr_info!("Timer called\n");
>> +//!         let flag =3D this.flag.fetch_add(1, ordering::Full);
>> +//!         this.cond.complete_all();
>> +//!         if flag =3D=3D 4 {
>> +//!             HrTimerRestart::NoRestart
>> +//!         } else {
>> +//!             HrTimerRestart::Restart
>> +//!         }
>> +//!     }
>
> There are zero blank lines here and elsewhere. Makes the code harder
> to read. I am simply suggesting:
>
>
>> +//!
>> +//!     fn run(
>> +//!         this: ArcBorrow<'_, Self>,
>> +//!         _ctx: HrTimerCallbackContext<'_, Self>,
>> +//!     ) -> HrTimerRestart {
>> +//!         pr_info!("Timer called\n");
>
> <blank line>
>
>> +//!         let flag =3D this.flag.fetch_add(1, ordering::Full);
>> +//!         this.cond.complete_all();
>
> <blank line>
>
>> +//!         if flag =3D=3D 4 {
>> +//!             HrTimerRestart::NoRestart
>> +//!         } else {
>> +//!             HrTimerRestart::Restart
>> +//!         }
>> +//!     }

Ah, thanks for explaining. I was looking around for blank lines that was
maybe not supposed to be there.

I can sprinkle blank lines around, no problem =F0=9F=91=8D


Best regards,
Andreas Hindborg



