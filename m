Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EA221507F
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941310; cv=none; b=LHR0vieonQLLU0aoFTW38KLzLkamq7sd7C5YlERULSPPca+ebgipyPjBpMg0BnVPr23vcQko8yyynKK75h9aFKH18JU6/Vl4Q8A3ukYf92I5vjkuiOy+eXgFl3nmD/VXSzdU5LZQY8ZoCLY6g8z6gT/zQFC4y7xNjUxb9ZUPycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941310; c=relaxed/simple;
	bh=IbjrFZZRj8tiQxzn9Tw7s3jFUO207TYdzCaeEvnG2RM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDB87FWS7DEKrJ7YaEfSpF0jEkUjmiy0U3lavMyo8XBkziavIGKyM64toDwJHObvDNVwyFl1SxpZRl0749n1/lC1Hil39ejzUXG21RbjqWUTa34lxe91m6fEaTv45OXb80M5zG3EVXgbboxTGfTXn70AUSYR7dmm+tPgZW38Lh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tG8CyvmU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tG8CyvmU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so98335f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759941306; x=1760546106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG17mnyEmeBo+WTlpwapGwV5hivono+ardKEAadCAIE=;
        b=tG8CyvmU/Z/THyDIMVuVDprPipRDI2nSnORBmfd6J7rV+TEKePqk0XH4YpWiLjrT/s
         F0iyROzXzUb/am2YVSPzo/e8eeBFf7bpB+Ik4vhiq/conOzsgBpMgqw52pIdltyPSZez
         tOBQRiCP/HDjGMneAV5Ea4v88KuQrkWbUVqj94ZllvesCne8TFW35efPZg2sSQ8EuuL/
         1hI7Y0m3aFmDpgX52xa7q7FFaP9Y0m2Pz2VT42Qq+16iRqqitgj/ZDf2C0NHQ6cNJiME
         I3sAKqVN9knNsVGWIQ8OhtMSEvNtlKbcOI+s92cJoWbmtkXmh2nrs6ygy3yJ8XSL9k5S
         /oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941306; x=1760546106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG17mnyEmeBo+WTlpwapGwV5hivono+ardKEAadCAIE=;
        b=FPEoXe+gh3vsB7H+n8g9gYBP1z3zlHkb3fQlGdcm8tN3MAm7Hfy2XeJvV3CEFW+Q9z
         21mMhU1z/frrboUWyDOwmrj0thgUpRk5Kzt0KZu4OPAUF2pK8S3pIe4C4xfx2u9XvQYU
         8wz4Dhj4+FeyC3UV62VXvPJZfrwdz/C/3kbxoDgoWYwllruL0ss8k3BxOzocXmHCD7u0
         TM0s5ypRugKNCpykpX4PiukaB0iwtuEa9GkOPgj6E9WslWnQ+AWidLC9eO/HOHEVPqZT
         18HE0KZBIAFotCVoK0IDJfOULZxHioGjeuwqkWFg5p7l/6kO448PBRsFPvuS2FX2mg7k
         oGLg==
X-Forwarded-Encrypted: i=1; AJvYcCURBtUyzrEvzjHdWuP/YaRQRZiVO+q28OsprYUtVbaFUT6LOGvrOGh5E25UmhnlLyON0ynXOZaT6NXcikWqFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDlr9x1XOXhwqC08xTtMtY7anZmPf4LoIZi519MBv9LH+X9zpF
	vskM89f34od3HQFdESn5msRNp/+bfLUpIK++o7/1tqUtkV2nxQ4txDlW3GVs1Rg213/Ob+LwqbP
	1Zi9DL6z0OF4INeYZT4MM77EdLTp8KIPPrNKWFBns
X-Gm-Gg: ASbGnct2GDbaiAzJVnLCkk9/SZKUML4zsC47LX80cMDQ+u8uBs4UZ/bAVNopG8Y1wV/
	lLK0wBBDih4Mmj8iCOeI7fHl5ilXcGGb99vPLLV462pbHhgW5Cc72JAj104u6uPQmBrkiBnBuwM
	EF2EyEoWi1jLBtTnDnfjzrZVvqwTR3J9AJM224/FQAQCA2PZNiWRsvnZIpa2I+gliB4nZ6TOtKn
	SRLLoSyU2kzrKmG6cdVUHmXYTN+7IjcfdJgTBM=
X-Google-Smtp-Source: AGHT+IGOP2oC9TW27xuQkxQNpBJDuMKavhOqjyc8WPJQN6SajGsuHVU6YhsxH4O1jzOYq+/hWyBubJUFBHsPUi+NeGk=
X-Received: by 2002:a5d:5f94:0:b0:40d:86d8:a180 with SMTP id
 ffacd0b85a97d-4266e7bf005mr3031145f8f.20.1759941306365; Wed, 08 Oct 2025
 09:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
 <20251007-binder-freeze-v2-1-5376bd64fb59@google.com> <aOaSA0dPnY2I4a_D@google.com>
In-Reply-To: <aOaSA0dPnY2I4a_D@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Oct 2025 18:34:54 +0200
X-Gm-Features: AS18NWASkyAzuiNEsEfeFUJmpejwxlM_VmjQJonfv_8L-HMyxpBNUlWWQ6OKXvA
Message-ID: <CAH5fLgiChj29SbwN-5vHhCNzaUa7wewOXe1D8mN3XFfyZr33gw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust_binder: freeze_notif_done should resend if
 wrong state
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 6:32=E2=80=AFPM Carlos Llamas <cmllamas@google.com> =
wrote:
>
> On Tue, Oct 07, 2025 at 09:39:51AM +0000, Alice Ryhl wrote:
> > Consider the following scenario:
> > 1. A freeze notification is delivered to thread 1.
> > 2. The process becomes frozen or unfrozen.
> > 3. The message for step 2 is delivered to thread 2 and ignored because
> >    there is already a pending notification from step 1.
> > 4. Thread 1 acknowledges the notification from step 1.
> > In this case, step 4 should ensure that the message ignored in step 3 i=
s
> > resent as it can now be delivered.
>
> hmmm, I wonder what happens with 3 threads involved where the state goes
> back to the (unconsumed) initial freeze notification. Userspace will
> probably see two separate notifications of the same state?

The way I implemented it, the work items report the current state when
the work item is *executed*, and they do nothing if there's no change
since last notification.

Alice
