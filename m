Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C02376E4
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752566283; cv=none; b=VFMZQyfbmjavTiOz7I+D9Jg7PqNa5yThGJLsoeaGnPUR2lAW0SeFAG1stQk/gxt2wNvaYDg6sq/NrGqyF5r0ZPBJR1Q5b0FV96LJe0AUBTEyeZMuTNhePWjZPTZNwbUQzvVPfoalwQ2yLK0xahOUhoLzorWtN0vFIvwZ/OjXWgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752566283; c=relaxed/simple;
	bh=v+R9onskoOwsKY+WjK+kL5uHF3IZisC/6ZHcdjXZ6gA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cwn84B3XOP+60x6OuA1xD92IMC5dur96/mT1PW3GMpo+8VB7TQSt7op05mnZj1LktxplPVuUEhfrQt47V7cH82ZhAAKH6VEivPQT+T08eyAniO4c1BGiHztAl0/XbwQjLe0kBAlLwIrECa8rYzZJauNNe8b+fGZvTiQY6JSJXVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi3e5bHZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi3e5bHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33463C4CEE3;
	Tue, 15 Jul 2025 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752566282;
	bh=v+R9onskoOwsKY+WjK+kL5uHF3IZisC/6ZHcdjXZ6gA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Wi3e5bHZeU462dicqEto8lJEQvQC/0Hui7ejw98a5NSogwLmZnsjk/QU/FY4PSrT5
	 dVPzpxdVDr+lGMSXaS1RhsUCD+sRT6Z8bKQdWf7aNXcdmlUGtEdKFwsrDOXvbFEOIe
	 xzvwfqsCrQg3f8VQQo4xMh6tLGc9Xy4Zh+cglnJlPhtRty0OzgBoarGAjakuKyCKBo
	 3dnTUdJP+pSwK4SE192gYTK+smq/+8kHkA0g7eVQ+wzgP8bIZFv0RO7UrfMje/36Ch
	 795TJNEbq89RiNTUHute5MgCd0WkSIESV5lA3OCQdKxpC7wS8n88hVEDWXV28dtHVo
	 X1xYe6xCTb22g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "FUJITA Tomonori" <fujita.tomonori@gmail.com>,  "Frederic Weisbecker"
 <frederic@kernel.org>,  "Lyude Paul" <lyude@redhat.com>,  "Thomas
 Gleixner" <tglx@linutronix.de>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "John Stultz" <jstultz@google.com>,  "Stephen
 Boyd" <sboyd@kernel.org>,  "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [GIT PULL] Rust timekeeping for v6.17
In-Reply-To: <CANiq72mP7QAjnYuM44tu0ZaviWO4PNWV6Oba=LMwh8=FxJJU1w@mail.gmail.com>
 (Miguel
	Ojeda's message of "Mon, 14 Jul 2025 00:04:20 +0200")
References: <87qzysqw99.fsf@kernel.org>
	<dMzjRfDkgj90HLRKVyXBm_Nlx98TlkiwW_FmbpiETAFOoQjihnqJRX2oNXYOlbr2DSVEM_uXHAHHysSOggqU8Q==@protonmail.internalid>
	<CANiq72mP7QAjnYuM44tu0ZaviWO4PNWV6Oba=LMwh8=FxJJU1w@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Jul 2025 09:57:53 +0200
Message-ID: <87wm89hon2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Jul 7, 2025 at 9:47=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> ----------------------------------------------------------------
>> rust-timekeeping for v6.17
>>
>> ----------------------------------------------------------------
>
> The description is empty -- could you please provide a bit of text?
>
> No need to send a new PR, since I know you may be away from your usual
> office these days -- I can copy it from email.
>
> (Worst case, I will write something myself, but there is still time.)
>

Sorry for the missing tag text. Let me know if you can use the following
bullets:

 - Make `Instant` generic over clock source. This allows the compiler to
   assert that arithmetic expressions involving the `Instant` use
   `Instants` based on the same clock source.
 - Make `HrTimer` generic over the timer mode. `HrTimer` timers take a
   `Duration` or an `Instant` when setting the expiry time, depending on the
   timer mode. With this change, the compiler can check the type matches the
   timer mode.
 - Add an abstraction for `fsleep`. `fsleep` is a flexible sleep function t=
hat
   will select an appropriate sleep method depending on the requested sleep
   time.
 - Avoid 64-bit divisions on 32-bit hardware when calculating timestamps.
 - Seal the `HrTimerMode` trait. This prevents users of the
   `HrTimerMode` from implementing the trait on their own types.


Best regards,
Andreas Hindborg


