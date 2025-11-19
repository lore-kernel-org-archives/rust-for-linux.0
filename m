Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05F13081A5
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 18:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576898; cv=none; b=d6MlO+SwKM/GF9GS6LwKBKjL0JfgTo4H3Bra+KtH+3BWWxwUVi5CTKMANEElCM4gyhh0P/KSarzEE4oplP6YfcixIgZyqd2K+ZVH9d/DypmMUaE+YT952DowUzZlfbkGQ+Kn+CpUzH19qLQXvfKCD5G8qEL+SlGOYa1xYsu4pJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576898; c=relaxed/simple;
	bh=MvQPrEyJ3qXRfCwc6wEWhO0gFObKvMRfXnO09S2uFaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsqsSbD+5kGWWdFJOBvsN1mcjGEhoq4cx117iCTmDeUAZwRNywJWNpdu/9UB8XXm17tzAdg8GstAy+Nl2PM97LwdZBW3FEfknDN4S3m2IIgL2+jlgmYrd6i8LUwwtRgA1Ecz34BTn1Fz2+o9fWFgw9WYYz/y1RHlfEb9RbcIVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwNmaYtF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwNmaYtF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b983fbc731bso548408a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 10:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763576891; x=1764181691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guiCToc2Mdmy4slA6PNRcP+Fbf3dyrJprlw/CrLye5Y=;
        b=WwNmaYtFa9swG4E79d9Z/B+7MPWkm8mK6VoatBrbPvwPdfH9Y6vhBLxFi2HRCgs3RQ
         YPZXIRh+kip3x2yW8sA5eimqabnPRcOIsP5Rdgv+hGE84O0l5tt0k5Vn0bW20MF/UYzL
         /JLyN+0paszNbXyhP5B3LdVb9X0CKNolejnlh+sOHWxV+GQ3e8TNJq9kAB47WaMhBoor
         k0R5jDVa5ZO80DtfNUv+Hns8OkfoBDF394B8KWb7KLHK7DwuXzfeATobXT0SDlWKXz/4
         zOgy5rtZdtuMo+gNgFXcV1NIvVchiuAw4Fl8y0zXpzGmTXNSHAO8Bru+sOiW3hWx84sR
         MCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576891; x=1764181691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=guiCToc2Mdmy4slA6PNRcP+Fbf3dyrJprlw/CrLye5Y=;
        b=eoGmeGWYk3jtS3aT4JzE5YRiaHWz0uJg14Lf0eW2vh4LzZ6eHOTywRO2SI9f5YuBgy
         r9t7gdKvb7Ix/EHJJotWNh31cS3F0qlg2N5rJEduFEOD8Ee4MAhMRvfDHWjZUjCh9EQ6
         b5DkTfHD9dMTJaoKmp0vFwAfHhevgEwzglkOs9bB0FG6fGw+Zt+ZQ0RKVYefoldnpkBi
         BDPEdUYg2CkZFdCiEKR4UORLxPhAbKZSG90b+x2mWbjfQDz6ExixemJSIX24y4RXbGDE
         T1OmNtRxtTX6BAROTG79tHPATpN5hqBWfrHPI/8Z+W9VDtBf6EsYNgLieXavUJgbAWFx
         Q7ag==
X-Forwarded-Encrypted: i=1; AJvYcCWSGk73uXdqYpgXul5xVnYds/PQwBliBOgmQSb3oIwgtiljpp/eTQUc0oI6xm5s/eXMHfMcmd1O+2AlTGgB5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0kY630eIyRVlO3A/WCMdUhk/jAX1hE1jqBG35yGtvxSMVaBFF
	/P7jUhjcxi33XnUaCcA+xfRZLxhYjta5traKdQGvWEGHqKObJ81Uat3X3F/UXy5By6KJ5LLgZcQ
	/h5u97zln56zmujPZ4xuZDWKXXybTHl8=
X-Gm-Gg: ASbGncuGlgfs+nhKhabKDsVM+DGJGGSMgWZ7sVbyIrG/4qhGjGK+sBgtAXzpSHS1BU/
	F00ZLdJeL85Q+E2WwcN+mxZLfntRcVH4vsMp+AXF7fY7Rx3Z9EAZBH6wrbBBkAY1XVEAI54uBmn
	In/+zrG4K+X+5lF8OSi8FZYBxEOwSUHbavWVbrWC+dEIU1aEwkLaqX2CaF2lWHxax6H/YNmgG/C
	+L2Tu5xrpn00E43meM7mtgz45d8n/UnlLkk/83jaouzEILFu0cb/yYoOoEMjmgf7GTHPA/UzDou
	6c8710j+ozeSk8/dLG/YtmMv04dWZrKlsk/w6NL13deyABarfu/TEIh5ML8TEjz8SN63IXjR+m5
	7tvU0rJB7zYMSOw==
X-Google-Smtp-Source: AGHT+IG/g/PtcjPAaCB+BxsM44L560tJNpWKJhjZlCHgKu5WMWHCLfZrAkld5bGhVwmNTQ4+v4jcWuwVGA9SspLinog=
X-Received: by 2002:a05:7301:678b:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2a6fd10000bmr44328eec.2.1763576890619; Wed, 19 Nov 2025
 10:28:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016211740.653599-1-lossin@kernel.org> <CANiq72k8KmpFyKAFZ293GDUWx5=HJtksR02hTU8-H9PX7xsT+g@mail.gmail.com>
 <DDK2SA1D77HM.38KOTOTF8FJXI@kernel.org> <CANiq72=Qh9sJLKwACr_McnbGdu8JfzqDuv1AgCjSdwKtt-9Gdw@mail.gmail.com>
 <CAAOQCfQzhxDzaJOb3GyVPgcVD0npso4bJ8zuy_63ZSr-rnQ0nA@mail.gmail.com>
In-Reply-To: <CAAOQCfQzhxDzaJOb3GyVPgcVD0npso4bJ8zuy_63ZSr-rnQ0nA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Nov 2025 19:27:58 +0100
X-Gm-Features: AWmQ_blRNYNDhx1KCwccjdGoGZY3bgKMXm2AuPvUP943EzFraspVHmq1NIezFyE
Message-ID: <CANiq72mzOn7sHTMMODF4echBj0rGS=fsUesfeFDzLyXjj2xw=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: fix broken rust doc link
To: Guillaume Gomez <guillaume1.gomez@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 3:06=E2=80=AFPM Guillaume Gomez
<guillaume1.gomez@gmail.com> wrote:
>
> Indeed, although, please open an issue on rust repository so the team
> can discuss how this feature would look like.

Done -- for both the features (checking & runtime toggle):

    https://github.com/rust-lang/rust/issues/149105
    https://github.com/rust-lang/rust/issues/149106

Of course, if we have the latter, then we may not need the former etc.
I tried to add a good chunk of context in the issues, especially the
first one.

I hope that helps, and thanks Guillaume!

Cheers,
Miguel
