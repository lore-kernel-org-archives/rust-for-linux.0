Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B86482FE
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 22:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705960878; cv=none; b=OuDxsfTRLi1yUI4A23vuiWZPSlsLFwn2By1etjSwaiUYU28QnusUDh/3wz2MkNNwzbuuJ0uyzNqCMkijJNb4Dfg99AbmuDgALg1oO6L/Mw1vpoDJDkQ/i//O6vhW/bX0OuncyQ4zMPWIJTaMYGP3SAsg976RhQCfgyIHneeBx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705960878; c=relaxed/simple;
	bh=HV6OiBsciC++Jo+8h0pXrpvakdOyF7V8kpBvkj3Ls4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ovi3jSl+mtXjVmCOdeyF/OEppTWJf65Wwk+7Y7IxM+rUzlhYwvZPoXCgE6pdWujT7B4NHv6Oydmsx24nz1rUl2TUOp2X9gNsvIgI19yUYb3S600JGozjfltcxZPsFIIeaDxBNsr+cZ+ft2em48LN9M9DH7fdknDrelyOAOZbKY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=ADKj9UmR; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ADKj9UmR"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5f254d1a6daso36494567b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 14:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705960875; x=1706565675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HV6OiBsciC++Jo+8h0pXrpvakdOyF7V8kpBvkj3Ls4A=;
        b=ADKj9UmRoNHdtVF/wVHBaQI8ZK0eX6FqGjhTTwrPOHoEyJ3TLYksPnb5t0WJXEFUtG
         PulzD+BIzaTLXnmfOv5YpB4CpPXDEbBf9qwx50A8r2GQjJFv0l1+MMtJkKwAIjdXaccS
         W0OaQNG+PQoG3A2rDoTYawroZOmb4obTMjOM+ZusFbqOYo35oLU1RRB6ZXcmLhHR2ZRx
         aONYpY60tCpbpRsEF0Ek8bmdXUPlnvUcyStTDNVLeVJ8m7FKBSeIDVC9vC3YDD3x71to
         QFioLS4ygrULt8ELDUiV2lfXM653IJm4KQcaZTcjUzj9HcpffjZISK9/aFaFypTbWk0+
         xhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705960875; x=1706565675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HV6OiBsciC++Jo+8h0pXrpvakdOyF7V8kpBvkj3Ls4A=;
        b=hBOUYRrP07NDitYze+n9Y/xg5qyShMRaoFiXZ6nXd9XSuRV39pXUzhotJlvNLi0xVg
         Ip6/nBIEc8aSA07Nr78zury2kgbzwjOMgjqMSVYNp/0Ed+LPAb4kzp+psOGzi6r9qVUT
         bdDtJlYpaayaBjkqtH9K/gjG2FdZqkuLblgss3ahlzjT4zOUpCmrCsWibk6HbzcgZXA3
         cEkynZ6pwO5FxkdSU3dutL53KG4f5m7RLAlX/iRHaDlE3E4PwmumD8elYxNa1cvTe7PF
         eFM+6DAaBOuZshQYnLKPRlmnVlgXuyZvWq4xSZyhSKeN/R0vseNl6FvVVgCnuat0HOok
         7JqA==
X-Gm-Message-State: AOJu0YzhvxboG++iCUXuTTgDCX/aYSGw3s8/gTXF62Mrg2X3gXGTeukz
	yfZrjrHP5chulkVGLrBh2B/Ybwlu9FD41+TqNabV1GzPfE099+DQlD0uGQ8F5vPEC0dTBlmSGp6
	R4O1zZ2cwqwL4dzp6eWyLUcGPZOYJCCWEUaaTWA==
X-Google-Smtp-Source: AGHT+IEErfDr9LG9li8VVZoLmYdWhmU0WlTMThVtzufqily2nzlldnoeSYme3HuHo3p0LnXa8gShXUF83UxcO7r56uo=
X-Received: by 2002:a81:7cc4:0:b0:5d7:1941:2c18 with SMTP id
 x187-20020a817cc4000000b005d719412c18mr3674878ywc.69.1705960875371; Mon, 22
 Jan 2024 14:01:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122162553.64610-1-linux@obei.io> <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
 <CALNs47v_2LxKnpWRYnM0Jcj+wdzPFQcfuaHyh_GnbLgNDXHLZw@mail.gmail.com>
In-Reply-To: <CALNs47v_2LxKnpWRYnM0Jcj+wdzPFQcfuaHyh_GnbLgNDXHLZw@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 22 Jan 2024 17:01:04 -0500
Message-ID: <CALNs47vzsq40HnAn_1XiALVD-eooYB=UN_cf--=k8f9_KPaYEA@mail.gmail.com>
Subject: Re: [PATCH] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Matt Gilbride <mattgilbride@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 3:33=E2=80=AFPM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Mon, Jan 22, 2024 at 2:11=E2=80=AFPM Obei Sideg <linux@obei.io> wrote:
> >
> > [...]
> >
> > Cc: Alice Ryhl <aliceryhl@google.com>
> > Cc: Matt Gilbride <mattgilbride@google.com>
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Obei Sideg <linux@obei.io>
>
> Optional docs update below, in either case you may add:
>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>

The others have a good point, please resend with a default
implementation on ForeignOwnable and I will re-review.
