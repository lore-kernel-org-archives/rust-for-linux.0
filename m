Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644458;
	b=5TJA0raFJmLm5L15BhWnqDWmvNUep8X0ZiAAtXFnq/SJdhg7KoV1C0yMv2clztlXE7p2
	 T2x9IaAI04f3GfFtF7x4OcLFfjf0faVLUYXaT4Tw8yWquWvmnJYR3oefxUgsJew3egan+
	 GGfUZwENwIop3fA00JhROAJKIkMW1hmA2IWMRcxEr45zftRFcYNJemGaRRvE4I8FpHcgi
	 oQiloGUhwv1Tg0sn/d/u/FJxMfzvEEb3Y7dfDozZtmlHTZWCMAexYvEcg0G1E/LLN3LAJ
	 LsS2xTcZ3Q941TL5LyqphweRWRQf/iVz9rYLdjY+J+wOOJoLl9/laz1a+hSp8xz+4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644458;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=U/3/29WSUKxrOY4mnCHMtPID/fYIxnT4GI0/OkWPknI=;
	b=mYuFOXZmzAe6J9zoAMO76gXtgWAVRUPuw75r6lyrYvSw2RR4ULkESdjfDt0pHg05giij
	 G9jrWxhy2iGgg8v2U4w0fd3ua3v0xrjoFKlDtARXHDEPQopzJ7ruMVidUrCEDvctIHyoT
	 ylQI7ZFAgCY9kvfOHnT0maLIaLR/6LaOoDVuovTshm/T1JRmd8haQ29HDf+4lvJPqTuxo
	 ULziEhbjTCZvPXjpr9EWhj62stGvnNHgzeB5ikExM3VKVrcTPusXIEC2pKFRhrLtXiKs1
	 1w61/1n0bkm9fhRXZ8RfkOMgFV6Je/HSkTdl7Zsk0EZDay7PZQ9wD8Cpi/ohpid/VGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/EUpFwD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346F5606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 18:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/EUpFwD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66781F00A16;
	Mon,  2 Nov 2026 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793644458;
	bh=U/3/29WSUKxrOY4mnCHMtPID/fYIxnT4GI0/OkWPknI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=D/EUpFwDdAyfARorxnXdd90a1wHZ2RCN0uO4OV7piNMhg7Tzgp6ftCyJxTfWtddDW
	 gnspk9C2cqQjBSdO/f7DoFslkyOZ1VddRgfKrNiCfbY/HdyaSa5zPStqOPjW0AQEEB
	 +1PSv7Xc+OzWeVN8cuAlCOqdAllXoJ2cwHa0RNNmoRPXn4Ljr7y/vyFpCm+WI1dmrc
	 vz/vIxHqT172iEJ7ZflwhysLwzJadpVQ64fyM45igTQwhElLGbcpRQzOMaBFV5RBxf
	 jEl/N2pUkBEulN6NbCHZsreXIO3ZP4vW4eqjFPxfV6BIy5d25GKa4+swiSyVs68eW1
	 syXaZHBRPFyPQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <tomo@flapping.org>, boqun@kernel.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, mike@fireburn.co.uk,
 sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
In-Reply-To: <CANiq72mjFLQbgfW_f7vAJ+M-95d5s54sBTRfMGYekcRmm7xTAg@mail.gmail.com>
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
 <20261031003334.4161188-1-tomo@flapping.org>
 <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
 <-ovJnxcOvJAiKzPtfo11BN1FAx0pLVrkWbeFGFEQEPR4rxdbT819-RaUD_zMHLXqn-9oyUoPJFT2YexekcZMKw==@protonmail.internalid>
 <CANiq72mjFLQbgfW_f7vAJ+M-95d5s54sBTRfMGYekcRmm7xTAg@mail.gmail.com>
Date: Mon, 02 Nov 2026 19:34:07 +0100
Message-ID: <87ecd3m6ao.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Nov 2, 2026 at 4:08=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Orthogonal, but I dislike the shorthand `Sec` and `Nsec`. I would much
>> prefer `Seconds` and `NanoSeconds`. Opinions?
>
> I guess it matches things like `NSEC_PER_USEC`? i.e. C.
>
> (Personally, I don't mind longer identifiers and I tend to prefer them
> where reasonable, but sometimes there are other factors to take into
> account.)
>
> Another point is whether we should align also our methods too (e.g.
> "nanos", which comes from upstream Rust), i.e. with your suggestion,
> we would have all `NSEC`, `nanos` and `NanoSeconds`.

In general I prefer that we match std on naming in general, which is
also why we have `as_nanos`. However, chrono is using spelled out names,
and I do prefer that to the short hand used in std. Worth a discussion I
think.

Best regards,
Andreas Hindborg



