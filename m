Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025DF367B8C
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jun 2026 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863011; cv=none; b=BoDeX6FforI5unXOdB8RGLPus2z0pWWosyDC/jfF0gmiFh2a6qRpnXz7QkMaAyFwqGDOFq9pVZzTM6fyrS/oylwVStzqraU1ik+ZIi0MKs2OgxAe00BL95MrYprD5qj7BYl6o7Y9eJnVs97uYFrgfOxoEsDuFAx4aqG9icvl81c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863011; c=relaxed/simple;
	bh=IaykBczQx53h+S1+4uXs/J58sgL7lQV25AsWFcNdvqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K8k7j89m9kp9f2Xe8/MjG8OivLTrA/D0ntvXJp9TrBwbmQ/wnKRjXzy5/2yrAE0sO/Hm7gPzwS8Tnoy2ZhPoB47ZL6NsYGdUthX4KjVR7Hi4kjaITEMonjeQjqRt74t0MxrDVK0r7cJ0pTmQnsiA5Cbx7Gso3xkFRiCbZExhNDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdhkD8ag; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdhkD8ag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F8C1F000E9;
	Fri, 19 Jun 2026 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781863005;
	bh=IaykBczQx53h+S1+4uXs/J58sgL7lQV25AsWFcNdvqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mdhkD8agVZLNUkfiZACmt0kJvIoB0pVdESXvtGgGsBEkgPoK05X56JcgUDA5KH/2H
	 z8MQt1dXEh9XvSTfRodk4HNw0xLmiGBcE45Mkh8LSKppCQnbupK8pRgUD3y2cUX6uD
	 qztHfwc3WKAYNaX1Fg2xoKwYDcimHGfb8Sps+7E+DSldjnogcl1gr8J77NryJX9+zh
	 uSexAAR2HYiXzBS40vHUAODaWSymHP5d+lyVyP/8MSNPo+MWtJBUlmGbmRVJhEEEc5
	 hvyVW/zEFskGLr0lmfJ+TmiTlp4aPwMSaQvt3Oqf4ab2L36EBlYRgslnpRiG2iX77m
	 R1RJqduj3nSTw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org, gary@garyguo.net,
 dirk.behme@de.bosch.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <CANiq72nLyCwq81H-iiDvmfe3SUfPcC+9TCdnnFeKGK+qgHFOnw@mail.gmail.com>
References: <hGNrgHLZgzaLAav_TQCJaAHYX3aWSPyoHeXEf7u3ioJunfoFTIPF9Q8PnCvfRKXq2SS-fNdOn35uMiTaF90nKA==@protonmail.internalid>
 <20260303061000.73970-1-tomo@aliasing.net>
 <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72nLyCwq81H-iiDvmfe3SUfPcC+9TCdnnFeKGK+qgHFOnw@mail.gmail.com>
Date: Fri, 19 Jun 2026 11:56:35 +0200
Message-ID: <877bnug8fg.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Jun 18, 2026 at 11:57=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Does this mean you will pick it up via timekeeping-next or should this
> go through rust-fixes? (asking since sometimes you give a review tag
> but then pick it up yourself)

I was planning to take it for the next one. I don't think it is urgent.


Best regards,
Andreas Hindborg


