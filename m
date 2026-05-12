Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E372446AF0A;
	Tue, 12 May 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573141; cv=none; b=QtowkMFEfUy3mfQqexfiFs95OHyiU04OFT9wB1qPt2/tdL7bsbm8a1jOCOi3yHQlJzbVB9WUTou8D9HyYkGkdeCwwI7/NqhC8MecstusYhYhed/QTWpHCbHLyV9/BDToytbZ3oBO6hW8eNcMKKQdplPrqwEmVHninhxduGCVzPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573141; c=relaxed/simple;
	bh=ix592PHHYE+FRflUeI8n+WTum/UKnKIW0bY1ZeFoyHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mlhRsN5xHLs4ipgYTaaM2WFgQGkrMDqALRvhASAypffiaV+U93qIrUOJaL6fsUInaF6TYgY3osR5DJDqwDj/WzlGjsXKrX+8TsJ2q8+U3S6gwOE457Sk7zvFR4GXLcXY3RqruhUSH8qxbVhOAp77gWWr90Iy/E8PIRjChJJ+ia0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hb5f4LEE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hb5f4LEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56983C2BCB0;
	Tue, 12 May 2026 08:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778573140;
	bh=ix592PHHYE+FRflUeI8n+WTum/UKnKIW0bY1ZeFoyHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hb5f4LEEoMCjhMwZF5MTBwSJ42SfJUNj0yoVPT4zX2zoULpaX4iMAvnYbdg71Xtor
	 R6J+67/oOLaaa2eaowOZojp7w2xOrssZL+8NXuntSH+L+LD0DtdoxdMYrBlaaxT0EK
	 Xa/tHDCXELike9q/WP9MV3e8UaEc3XLeYamzMBNPB8NeqLgzdbguXd7/c6XUJe7KxD
	 8XxQIZsm2eYB3muO/fgb3oHCU3UPmMjgRJ6gXB44gbNlci3HSaz4WRC7gpNyoqjW/c
	 6HDTE5Hzf0s2rVtAqwoLyayyyvgoAIRZUFl3c7uDFUh1G4m/BBPiBY0mD40yB/pjNy
	 7dXn+mKNnbA0g==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: impl_flags: add conversion functions
In-Reply-To: <CANiq72kLDR5m8iVjDYT7doCw-z7oj2ijVK3QuA9ees7jL7zW0w@mail.gmail.com>
References: <20260215-impl-flags-additions-v1-0-6538c8fb841c@kernel.org>
 <20260215-impl-flags-additions-v1-1-6538c8fb841c@kernel.org>
 <CANiq72kLDR5m8iVjDYT7doCw-z7oj2ijVK3QuA9ees7jL7zW0w@mail.gmail.com>
Date: Tue, 12 May 2026 10:05:30 +0200
Message-ID: <87bjel59yt.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Sun, Feb 15, 2026 at 9:23=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> +        impl ::core::convert::From<$flag> for $ty {
>> +            #[inline]
>> +            fn from(value: $flag) -> Self {
>> +                // SAFETY: All `$flag` values are valid for use as `$ty=
`.
>> +                unsafe { core::mem::transmute::<$flag, $ty>(value) }
>> +            }
>> +        }
>
> Why do we need the transmute instead of a cast? Did you notice a differen=
ce?

No, I did not think of using `as`. I can do that.

> Same in the other one -- why not constructing the object normally?

Will do.

> Also, you can use `Self` for `$ty` and `$flags` to make it easier to read.

Ok.

>
> In addition, I would suggest an early return with a simple `if`.

Ok.

>
> Finally, it wouldn't hurt adding a one-liner example for each at the top.

I'll add an example.


Best regards,
Andreas Hindborg



