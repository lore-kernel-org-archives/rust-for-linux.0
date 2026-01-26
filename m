Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAE15CD7E
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 02:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393074; cv=pass; b=VM3ybB3/D5ilGXQJK5boNwfpY/ELNeSwBplZNjMUDG3qa0ZVbODZ+pQ8uCl5Eny5D7XtwJF81rFq2wMmJJVeTMBXRFOwuOGLIHigDPw4lMMkghWFzXlI9YrsQzwWPFzSz2vqjjM7ov+olMCEddUFywlV+gnDugMg8hQg04xZsJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393074; c=relaxed/simple;
	bh=KAAoQ7ZtRLci1dCtVUBuIoHbyptdcw75U2/OpBonN/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnZ7XpZUuueJ8Ds6/owk6JBQDmmDDE7YtnE+XaVVkFpEx8aVF5nEWHQJisH+k+xZ/KKtm0xaxFveZMyPqd/YxG52K1sSHHRv4ScjG45WqSYDnj2SH1APqislWQavYAUAchiiAXgBhaCCFF2jfVI8i1eiXz7CnxQszrUjUTulOJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs7WsApC; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs7WsApC"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b703e04984so238747eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Jan 2026 18:04:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769393072; cv=none;
        d=google.com; s=arc-20240605;
        b=V7bZJ5vIkLwQHDpWFC1pWb+4uuEkIrdqrsHucmAoO9xt4PcXoI6dFU72wXCqE+RV2F
         pBCs465kt5DFyvE35CkwwjFCs+XCiiqlGB1LWfyXbiYdzXHafwBwB9KlBNintYxdlj+o
         r6gdfXsS91P2hiN8HWdvxQcrmQlbQmKXTAkEleBqFKNKZQiIuonopt7ThBeFCYUXdM2u
         iDmh68URmIZoXIiO5evfih9HRxS1rD1xvKbyUjsjYErc7RKSsYAZKrGaB+VLVaQqObE5
         9WFkfyHhiW766qfU2HRqCfZVFcW88SoxZSo6sKh9oDxrGCa05x6JXpXmPBY4mXpfvfcD
         YVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KAAoQ7ZtRLci1dCtVUBuIoHbyptdcw75U2/OpBonN/4=;
        fh=pNIV2uPdWhYuK/k5Yp9+QempEOgKi68J47A6Dfbk0Bw=;
        b=chfL5eojJ7CIAiQPL1tcGpYwjkd760iTntuez451UhyaymtB6vefNnQ6WZPVUR2hqH
         Xzag0eGDppw0esRgax3fQvq2V732bzynuN0+eu3g3wf0pxpLSvnKtj55T/4ObM7AB7Pl
         LXGV63bbESFBbtCCqI+6zH9tSAWP8psjOsXO5L2n/CokVDbvw6LQp69wpnd4hKgg8UqG
         kyM4+vi3dyVkErq9LiJinGnBGicEMlTLBeeAgrnldbl1JLXZzSWzKnOmUTJ6yDcm/34p
         mV44AfXs0pCTmpFehSwhHU0if4nnMxx7ZkL9qmdkL5/TvURfTeDKCExCh95XzR2c3uUi
         ieTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769393072; x=1769997872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KAAoQ7ZtRLci1dCtVUBuIoHbyptdcw75U2/OpBonN/4=;
        b=Zs7WsApCS0R6mY0udhgJHxVfp7JvayAUVc7rGBeZPxdnHuB3GU9TTpj3hxC3QsstDc
         akNXTocBZ4EXoBOKkz/hhuGLa1LShKy9c3pBCA/jGfXcDPMAYVENldLlUOAbGM4Nu/uP
         QiB0RC8O9yGinFo4BEyee30O0tbRNEuAdecNRL3RaK2vQOzurh2EjkOvBq79Lub7sTNJ
         aYMWSECd8opV4KDSBp7CdTIS9P86SPxDrZMBe1s2HNO3zHUYDtrM91JXvr/QA7NdfKP3
         jaHGMmGxMAa5xs/J5Pfsf7fOgI+D0o+yO5+SZuBs2SUlh0U4fLLEivROFpvA9IZytFmC
         H8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393072; x=1769997872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KAAoQ7ZtRLci1dCtVUBuIoHbyptdcw75U2/OpBonN/4=;
        b=rS11YSuXsacS3Bbr8xI2UdkwQhmMaYEP47sX8mAjPMl0BxZ9P9CWu37vDobZA4rGch
         T5PcJ0H1QvGY09ZU/9GAeKihW+NJZ1yeP+wrzgepcb28l+UC+yoNkn9q9az+HM27o24X
         FwJZshcdeR0BdadfsdAq8zsRtIvZlFy7OfW12pxVTkCPnHMK2sAnWZRI1IaxO1IhmKAs
         +pjkR2mSPH/Sxkzpa3etvOzaBQX6rZdHAsjYQolQGOG/3tvgfUvn1j8EBM+U6nWrJz33
         O87idXHUaXfgo2Qm+7gDpXlSJis6loJtsPSaTf517zGGxLqdRC+gl74X2pFPxh1hvQYD
         kE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhfv+4Beg3LVMWi2yekff5nU/3pinfIG/ERnhz6vzXURBjsPQct0YrKdVOQCcXaCCzGv/LjQLJmLiSSuG4rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiaqcABlHEd0kRx9Y6lN6juk42QeHDvSoO8TLkj4HGMIICHviU
	6BstaVLKJpX8liAjVUtmt1nwcVx7knU9C79HM15FOueVHzJCpB3kQp29iGZisqzdXeCuv8YQ57e
	dGaSAufla9w0mY9uTDJjs+RZfEhPh4xU=
X-Gm-Gg: AZuq6aLyk0Da44BsRWPwhLCw/lN3lmE7K4FIF1hZXa2RKfuQtXLCo3iYTbaHFGXsm9g
	T57Lx5jID3o+uc+DYB1qcL8l9q7hLVlpMmMMgxLrZ5IVxCX52l7ooTrBZhMpgGJWy1nQseDKWZa
	/FONoD8wucxl2oJygZJo3BOWBRqN4wScsaeER3J/V3/KqTGoZopMaOLeAJ6nnxXVmnj1WoO8dyi
	Zx/3Nhq7PdBKdWKu9Nf6bTX+e1U65fjFIWVgA3ncd62AEmPV1v0SOa9wE02R124O4MksvcTCAgV
	Q4s3LhwOvRfZZT0zngZT3y0ChwkwFRu4AFIvsD4KGV6T4KAIkSbcjtY+ycvH/Q2A4OaGWDNoGUr
	8BRXU/tGMBTex
X-Received: by 2002:a05:7300:caa:b0:2b7:2bf3:ce06 with SMTP id
 5a478bee46e88-2b764327d2emr803835eec.3.1769393071916; Sun, 25 Jan 2026
 18:04:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115214545.63262-1-ojeda@kernel.org> <CANiq72nYvttE6odYpaQZ466Rv97jgK7T0vybTcMNftk69iu0tA@mail.gmail.com>
 <CAJ-ks9mTr0oO-iCc5sC3PPWfcBc118-_K=kenEvz9sO5hzyyWA@mail.gmail.com>
In-Reply-To: <CAJ-ks9mTr0oO-iCc5sC3PPWfcBc118-_K=kenEvz9sO5hzyyWA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 Jan 2026 03:04:19 +0100
X-Gm-Features: AZwV_QgVwG5j9CbaAWAbE1cqX6fUI-1GvgruG3krR-IaXUk2tSsJZThV0qM2rzA
Message-ID: <CANiq72=QBZ8iHNp-HpuWEet-pZefnUpZ4-a_K5a5D+G-Sq0DBA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 10:50=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
>
> Thanks Miguel! I was just replying to say that this should probably be
> my @kernel.org address. I'll start using it more consistently now, I
> guess :)

You're welcome! :)

Done -- I changed it to your kernel.org (both in the tag and in the
`MAINTAINERS` file for that entry -- you may want to separately update
the other one you have in XArray and/or consider sending a patch to
`.mailmap`).

I also took your reply as an (implicit) Acked-by.

Cheers,
Miguel
