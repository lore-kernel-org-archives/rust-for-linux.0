Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD6054F86
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706519603; cv=none; b=C5/7HXuIX412b+zV9Y3VLI6Ky1DQ32V3raoCotL0/mmH5t326VvtrV0glCyJsNyMnckX05tqB9p2QQSphdFjYMrx1fFIjbcVikH4Ub3hDPRGnzv+Ltg6Ci8Npo2Vk68KNng9RgbdwV/+2m+61NDR3SjkfWxHgj3gNUMPExb5g0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706519603; c=relaxed/simple;
	bh=bF2t00xOJXl9AvwcB0rZA/dsnVo97qcDg+JBwusX7LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oh4vgHWzQl1UuC+GZJsTaB6JMqhwNI/eH5cRDrvlUGPiNyx+Ce3vS3JkquKgyOKEjZl8riqfNeggMa9ZmJatgfvPsWBltj8gWL0hHaxslZIJ6Z69se415aMK3noIScXT3x69KzNXc84vp2wWRlZe+Ey7esWmnYF0qtNH5h2joXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j1Sz9FRr; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j1Sz9FRr"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-46b165745deso475646137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 01:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706519601; x=1707124401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bF2t00xOJXl9AvwcB0rZA/dsnVo97qcDg+JBwusX7LA=;
        b=j1Sz9FRrHBk4JQXNLRsQNpTY51zSdDDvzlQvo2J67BpW7EkbBzhwLhAtf74TW5qRkk
         hfon5kEZHR8fZoINJjpE9RzNcCajg0+raU32MjTyH2hjUpsmEtDYmgzc8uJEP9D3zXfK
         Mocns+af1gp38a6x8DbgIcRr7gbY4mafdkeVeLNFYGS2ZSTDLF2PGNzjhSjpBOFRtAAH
         yRJ38WaNfZ/v/6Cxzz+Sx+jZgJl8arfvFakIO7kwmhFwxZW/7hmsEjmf/50MCJ4kYZ7R
         eOdYcH0DQuRcS1VqYAhUueOmB+5CtwgA6kAzzwckQ07e2jF6++ASZMEpe2jLjijg19M+
         Cg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706519601; x=1707124401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bF2t00xOJXl9AvwcB0rZA/dsnVo97qcDg+JBwusX7LA=;
        b=J1emN40Fy9fmF+nAUVrWm8X/xI4w5g8szVrMQsna3dwAHn4aOzdMoqwhZ190QLwiZT
         Oq3X/VUwkQCBg1/a2jI2K+dW2W3BbhWTHv+QWXL+8tfuzSNxkUjTCH0WM4BetEimsy+I
         PJjFmxksqvw7kH+KU5EqqvMEeY06j/g+wnXSeanpz7Ak+9hVC0Msqxd9BSSfQ/6gTlkY
         AzFLhV8MnulbBDVQn0VIWjsxoMO7JZAaeL7CWRS9K0bkdcZ3v3UHGosnwdkcsWN3os3H
         Fz55pnNjIwMnm+cFHs8xTyk+gOrLNQcTqv0C4PQzqkLRo9q/qyHhIV7UVwjr9nRAQbUk
         yt7g==
X-Gm-Message-State: AOJu0YzFIMMw1AJ6VBh78AabNLHNwQMdvfwOG/GFnfRmID5G4zFsawyu
	p+zWdOVl2/W7YUhl6jCR/EYMYstXaJVDLwK5uyfPQALR9luDOaJT8vB48/UGCMDtyQKDs0l/Wg9
	2Y0cHeBLFFuJB/53JL8rAjxW4w2iL5oNJnpov
X-Google-Smtp-Source: AGHT+IGgAGwvVfvdtbbTkD9ZuBzd0jtAAwxq50MLBKg6EZW86P4Umb8kCDg7pbtXkf13tfB5hqULi0rOXznuOjmIJ2w=
X-Received: by 2002:a67:fe0c:0:b0:46b:28b7:26ef with SMTP id
 l12-20020a67fe0c000000b0046b28b726efmr1443056vsr.16.1706519599234; Mon, 29
 Jan 2024 01:13:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108-rb-new-condvar-methods-v4-0-88e0c871cc05@google.com> <CANiq72kx8oBO_oFZqfKdC2U9R+je1UiA+nVAAwZAEivqvfiZQA@mail.gmail.com>
In-Reply-To: <CANiq72kx8oBO_oFZqfKdC2U9R+je1UiA+nVAAwZAEivqvfiZQA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 29 Jan 2024 10:13:07 +0100
Message-ID: <CAH5fLghZad5M3sAFEiaTePyMxbR_=fhMieg0m413rs8fHc2KFw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Additional CondVar methods needed by Rust Binder
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 28, 2024 at 9:04=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 8, 2024 at 3:50=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > This patchset contains some CondVar methods that Rust Binder needs.
>
> Applied to `rust-next` with conflicts resolved after the `wait_list`
> rename, added `CondVarTimeoutResult` re-export, fixed typo and added
> note on the `sizeof(int)` being unlikely to change.
>
> Alice: please double-check if I missed something.

Looks good to me.

Alice
