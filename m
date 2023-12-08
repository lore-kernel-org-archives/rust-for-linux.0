Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="iA4nOysU"
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F1F1720
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Dec 2023 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702027653; x=1702286853;
	bh=sZOGxSeIUlOG94JiECOFJZ+akk/jCr3gHN1IbwtDqZI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iA4nOysUaOSrQBaWuz61c3ZXhXJtrJzVdEU5cjljbME3p9/TwuQDXt9N1pXNKXl94
	 zJZ+1X5MgjkaJPdfeej/L1aB99amRnujw9EtevTewoDfCw1bs7o3mcl7l/7Gg1qvgp
	 4MQM/0LDrAWHnW7pJmbhIOqJuf3IF0ZYOpmHURvJ+7OxxsB6/g+SbaFW5e4FIXxKXI
	 TgJIu2s+BSObgb36Y5D+VL+I0IzWY5s4NE4kvrctXp/Lcg5kpAH75roj4agsTCP5FM
	 zL61ggsFNbWwCfEkCnIukZFNiUh7CTAiXWqV1pS1Rrp8PFmlqP26sYLk3B2EQpLp08
	 ddtfml9uzK4pA==
Date: Fri, 08 Dec 2023 09:27:26 +0000
To: Alice Ryhl <aliceryhl@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Tiago Lam <tiagolam@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: sync: add `CondVar::wait_timeout`
Message-ID: <F8K3EZWwaRdB3qwYwk7P9GGQUc83MNW4XLeqRHj6QsA6WtCtpweykXLuM5sj2RbpRu3y3OoFy6gmCtaV2tBA1sxGFeieUnTdaY2yGVSCXQ4=@proton.me>
In-Reply-To: <CAH5fLgijsRK3funsGuG6nbK26C+s6m0nO0i83RYD2cO3z7L22Q@mail.gmail.com>
References: <20231206-rb-new-condvar-methods-v1-0-33a4cab7fdaa@google.com> <20231206-rb-new-condvar-methods-v1-2-33a4cab7fdaa@google.com> <1dd1a3e8-ef9a-4e89-891f-b49d82acc5f8@gmail.com> <CAH5fLgijsRK3funsGuG6nbK26C+s6m0nO0i83RYD2cO3z7L22Q@mail.gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/8/23 08:37, Alice Ryhl wrote:
> On Wed, Dec 6, 2023 at 6:05=E2=80=AFPM Tiago Lam <tiagolam@gmail.com> wro=
te:
>> On 06/12/2023 10:09, Alice Ryhl wrote:
>>> +/// The return type of `wait_timeout`.
>>> +pub enum CondVarTimeoutResult {
>>> +    /// The timeout was reached.
>>> +    Timeout,
>>> +    /// Somebody woke us up.
>>> +    Woken {
>>> +        /// Remaining sleep duration.
>>> +        jiffies: u64,
>>> +    },
>>> +    /// A signal occurred.
>>> +    Signal {
>>> +        /// Remaining sleep duration.
>>> +        jiffies: u64,
>>> +    },
>>> +}
>>
>> Is `Signal` and `Woken` only going to hold a single value? Would it be
>> best represented as a tuple struct instead, like so?
>>
>>      pub enum CondVarTimeoutResult {
>>          /// The timeout was reached.
>>          Timeout,
>>          /// Somebody woke us up.
>>          Woken (u64),
>>          /// A signal occurred.
>>          Signal (u64),
>>      }
>=20
> I could do that, but I like the explicitly named version as it makes
> it clear that the unit is jiffies.

Why not use `type Jiffies =3D u64;` until we have proper bindings for
them? That way we can have both.

--=20
Cheers,
Benno
