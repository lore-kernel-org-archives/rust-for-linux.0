Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089029422
	for <rust-for-linux@vger.kernel.org>; Fri,  4 Oct 2024 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728046688; cv=none; b=qzoKzD9ycwHZfipP1ZgbpruynKQpuegHxhSNOoo4UH4A98/+397e18ssJucrro1IaUmANIGLQ6374C4BjXgyH9d3jDBMfPO6/UCXe+4PBrLFfGa2vqp0pkJvBv9v/vAf3MkonVT+xu59JeXLzVRzAuNgMMMiAhyXI0Sl3U+rQ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728046688; c=relaxed/simple;
	bh=sxrBN8IzV6EkQI6lJSQc3duGIxEFQ90FH+6vKD6NWrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWq+Ssvj08xZs+CC+G5U5h6qmYN14+FDctZywk+Oxlk1zaCqZicWQhDUZuFgoB0wQlgJU5rkwWpSwlLKwyrb1h8gYm4vQdTq1K+VeZO05E6TWpqDiACQpY3vRn/6Iv6iFPYdgy/dmOgHVLHLABkA0QP0PK6gk3iLJznWYK8tM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWlWOy0e; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWlWOy0e"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7c3d415f85eso144895a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 04 Oct 2024 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728046687; x=1728651487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxrBN8IzV6EkQI6lJSQc3duGIxEFQ90FH+6vKD6NWrM=;
        b=PWlWOy0ewPZg/0h8To9dOX6F3H2o55KBu+AuYTYTzY5lmpWlOPTQkqSywlBAEWW2Bq
         OSnLv+92UAmB8xmZG4my0tSWCiy9YxrtYQ9RiwBl7vwsB+cTG8MkC0NeGKPSxK9b5+Im
         r93U/yzwY6GUlSdBs4EQX4GkNKQ+aQ/dn9cAmHf4k8UCEiZue4VJeGRDasCveOglW27+
         bmn5xqnWScUB5aAviMzFnkxX0hpoHKjM/mi+6omGt2D0TGYKtyXu4Jbh+OcCj9ZXjrV0
         EajSEidp4ZG5p0nbEGDNgW0nqhOK11UjGcVcalwdUtpzEShIJQPttCTsi+CAHNBqiXj5
         1mQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728046687; x=1728651487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxrBN8IzV6EkQI6lJSQc3duGIxEFQ90FH+6vKD6NWrM=;
        b=Bu5TAenW012mcq6cRA279tvmHMd+rhJUKYJ1JDZja7LIxx/hSPhOUDzBqd+RnVfFZe
         J0y7hKJ9R1MXWPmiXZpBOYQ461746am4BnKBI1RvduCvig4zj7/AI2ePLtrHEWeJ7pPx
         SP+qYg4nC5XHui2JOeVzkcSDyb2Rn7eHpDOoTeCPHomF/C3oqjZzPt22kzBiE01nxLHW
         8bsqj/s48v1MK+zJncI9Nss27SfPbnWHq9KFkTWKLBwHNGTGAdqjZsWUDCEuI2MzgjQi
         KmX2bxgQPbvom44ZlLFA+3lih2EM/jusA9NxqdTMMSWHgQ9d0gCDXq4EmdTuqPz96uqv
         ZcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd7fWzsMxN4Hh4ICM1wRQ5rPz2jFaReK+ftA2iKqz4GSarBAfrVjEkOt3uB6ODeaMHU3Icec/YtA/fXB00Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNWF5zhDJQhZksPLi7mLqW84ZQMgGa83m7J5CPEtjGS55hKzqC
	e3JxQEgPzByQbHn1Fia6HahI6y2yc8+E0NH9Wsv4uBf6VLt8foJwTH2DfV4+JmX08EDPe3K02zh
	Fp9f6npWMfEcyfEI24I2uY8wTHoD3dAf0
X-Google-Smtp-Source: AGHT+IHePgK94Dc/U8lIaBZC6VLCgERokZcdFg9aoYPLqtox61pHsTq9vYPYa8+Lhfxx/pH/2cndg0IhJub2islYh8A=
X-Received: by 2002:a05:6a20:914f:b0:1cf:4e49:bc74 with SMTP id
 adf61e73a8af0-1d6dfac48e8mr1914521637.9.1728046686771; Fri, 04 Oct 2024
 05:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <BL0PR02MB491443BD775D5D63635C3F4FE9712@BL0PR02MB4914.namprd02.prod.outlook.com>
 <CANiq72mGJK==2YFnBFG06oPsrf8i3Wenx9zO9_WWWzvhRknh8w@mail.gmail.com> <BL0PR02MB491430823078BAD42FD56D13E9722@BL0PR02MB4914.namprd02.prod.outlook.com>
In-Reply-To: <BL0PR02MB491430823078BAD42FD56D13E9722@BL0PR02MB4914.namprd02.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Oct 2024 14:57:54 +0200
Message-ID: <CANiq72=fsQ+dXEGDvxtKO7jk1dEXD_Rv98du97GNDChYPTZ8yg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 1:50=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> I'm sorry, actually it makes sense, I didn't know about the changelog,
> i'll send it next time.

No worries at all! It is part of learning how things are usually done.

> About build_assert on macro, could assume that the C header file defines
> these constants with non-zero values, but since the from_errno function
> checks this, I thought it would be interesting to validate it too.
> It makes sense?

Sorry, I am not exactly sure what you mean. If you need to trust the C
header file, then the macro would be unsafe and its callers would need
to explain that they indeed have to trust the C headers.

Instead, if it is possible to have a safe `const` constructor, then we
should just do that. Now, can `from_errno` be `const` to do so? If
not, can we refactor things to make it so somehow (perhaps a new
`const` private fallible constructor)?

Answering these questions should guide you a bit on a solution --
and the answers are typically what one would include in the commit
message, i.e. explaining why you picked the solution (i.e. the design
choices) you did.

Thanks!

Cheers,
Miguel
