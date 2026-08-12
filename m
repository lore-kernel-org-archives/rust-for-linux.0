Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303E43EC836
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530577; cv=none; b=TJIjkjyvBiuSiABDxVg1z1GSJsk1oo+uEqZb1BeK/aq+6FopJCmip5rNAx65x6/nT9UNDK5HrWssDa1vDdTa2PpVgeo18w3f0DXslzUQKyfLAl9ny97oJ+sSN9Nc1htwyMnuWT117ik9/QGnF2XmBQFr7HSzSihqI8BWa8L7NrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530577; c=relaxed/simple;
	bh=a1C9FCqOdGXHPI1pw9sL5XaH2UCtI2TJGA5gRLhASYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SvQPj5JQNh5Ft4WE2uBq4How6JB0kOZ+qdBQwxRBQGQtuTLbzUD3NmYs+gxkAjNcvUNgxLRgsrXoShSZV8Sh0MBTWB0mZQxXK/pNcuTIswso1BfeE2z3sjQhacTnRXbzywYFuKD8CVZM5DqkiSqeAEDumxYwMHxTNLKaQ6cVKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G30Je1t5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G30Je1t5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C6F1F000E9;
	Wed, 12 Aug 2026 10:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786530575;
	bh=on74tyoDz0IaR8dMBPV1K4bXpm8rVthaQM3io/5Pq64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G30Je1t5UxVMkVGBLuEvsWmn2jjznyc53dPcaGiq8+Up8fyorurhwl+/ywEAFNX8s
	 TlEjuzP0KCyevh8ofoS0A1vUQ3pmLAl3yGF10Wpm4vO2r5y2Wkaikd8XhnF/YQWFSC
	 AKEDrHH+bmLguiJEIrC/HdIyMMDsEzLjPNic2FtOel5LoPaQVmRHUCosfWZpGzxB7R
	 CUSTGRr/nPR0GFb3c4NooiQKT8Ycljd8ww67EV0hEp5EjxJ1hSbqcdXW2dJugbjId/
	 6X5aZxzoMype9HVH0BenCyvFaV6ez4hVvowG+Mn3MxQU5tKjz/SN6BOjG241Zv+yzS
	 fhs99vVvSFUEQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alvin Sun
 <sk.alvin.x@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, Alvin
 Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v3 0/7] rust: use vertical import style and remove
 redundant imports
In-Reply-To: <CANiq72=v76Tp5jvydeHdYcbpAcG+=a305ZV1GCvAhEU-kWxijQ@mail.gmail.com>
References: <20260521-miscdev-use-format-v3-0-56240ca70d0c@linux.dev>
 <20260810093438.208557-1-alvin.sun@linux.dev>
 <6uo3rXpS-AS4GliK4pPUk8jARt4AUOT-vPMhKjVnSQDT2ta-5pjTZCKk0c2gXk4UOkqe4mNSzAsOUBpr02wlDQ==@protonmail.internalid>
 <CANiq72=v76Tp5jvydeHdYcbpAcG+=a305ZV1GCvAhEU-kWxijQ@mail.gmail.com>
Date: Wed, 12 Aug 2026 12:29:28 +0200
Message-ID: <87mrur1vjr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Aug 10, 2026 at 11:34=E2=80=AFAM Alvin Sun <sk.alvin.x@gmail.com>=
 wrote:
>>
>>   rust: block: mq: use vertical import style
>>   rust: block: mq: remove redundant imports and format
>>   rust: block: rnull: use vertical import style
>>   rust: doctest: use vertical import style
>
> For the block ones, Jens may be picking them; but if
> block/Jens/Andreas prefer, I am happy to do so too of course.

I believe Jens will take these.


Best regards,
Andreas Hindborg



