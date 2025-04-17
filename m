Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89DF35948
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921581; cv=none; b=Gg83VmcOmS+QxGjEHIR9i2eVbd31E/qojRHbclDvCK22saTXx/pD81WFSlEYrRTjYMG2yMREk6PFuYaJV6qEjeTX3vS79QeY6TVQgAFJJ+2DUW/MWUybqyTLaogXB7hgsIHptUAnDBgFDVthpvy1ph7IqU6ti6c8JY+jWJGVF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921581; c=relaxed/simple;
	bh=J9BR1fk4Lu9EfXNC1K+ho4OcbepgW+mVZht6+kGIrq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy64RBSZ/dchR8pjlmQQ5drXYy4XPuTlq4GtAPhoeUMtGkUgVW2PJ0pKoryu28XZUFqEERr1CBb/Vzz/Mkorbq5TEgyZhhc6AV6wftXOvjuXARp/BZHDQ+ttxHjrWwzwu1yA7pyUYCecAci1eEp9UGlogU7KrZoyqeCWjM4Faek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXHIUhir; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXHIUhir"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so912013f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744921578; x=1745526378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9BR1fk4Lu9EfXNC1K+ho4OcbepgW+mVZht6+kGIrq4=;
        b=uXHIUhirlKnW9uPK2FfcmgbbHVXo03E7nYXrhuEiQq7Kz8mcvZ1QqIjqAvUOH++bji
         cQs/2afYDNg0uNU0xkt0HtZ9oyNeMhqA98kQmTuTVLbLUMk7sx8tM9NeJeVgzMaHgOk3
         b2oXHgboYklLZVYY1vppAtNrUm0+QJP0c6lyjUCMbe5iXbxRbqSw0yIKwBpZyWEEB67c
         jeZMIw+ubjUTv+kYWwIdPz7AHkzUCw61+i8cingsI+RHa7/5PoCLyGefJwrlfy5+vUkT
         hohuheKga0Lr93e9ibyPavLL/2pZ9EBTFFDhREAG4mBnUc8v84W6L/oTswY6AMKBCYQY
         FFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744921578; x=1745526378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9BR1fk4Lu9EfXNC1K+ho4OcbepgW+mVZht6+kGIrq4=;
        b=N0t0gkac1idEH8IPm2LKXIakEC2C8X6Q4VycPm0Mjr/OzlQuHX05U7CsczuV9FQAFe
         kk48iZudaduF4NFrP+0mSW308jZh0kaUF8NY7nrPp7cd2zpkqNATDIUf142CnzxyTSZk
         lTuc0yU9bkHf7LghE2TSIB06Qe88pmYV7aHFFU/EXD0nmZ7l5i8Di+XbccqV22vWGwJE
         hDhkwoyFFL65tkSxhIxXkPF1nNtlNpHxmvAXT+NbW08jwXjMHk11XXg/zl7jdtnGkDUj
         fZ3rEQ/aWdgLOBZBnE3si5h8F51t6OYXgp6jWTGK9yHEKjyqroJGk8lDb2cYtyCZt4G5
         s/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXIlaiaeF0ZWc/RvjOjgvTHXs45Lrumzs7fOA7lfhybp0LBXdZ8nYMAE4XO0GUujwekUI08jZhW/2JykeLr1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZGe12AC7Q23azMDp3ej4oa4mrAnRtZSWtfqTYVBzyQlNY5U6r
	oSsIJ5ZgQwnB73Og7daaI8A2sC7qXKD4QyJR58KUejVAt/N5LQJI4xf0mtyopCF5SQ0FS9fgXEo
	iqc5Ox/ah0cj4uyF8pnmt8yJ1pANtFXtSFH/9
X-Gm-Gg: ASbGncsUiSa3DuEGXYguAx5Z7LMvlOZWhjaW855BkJzn+72VKJKAI493BB+tphreW1w
	ofPIKFiy4fLlJlL5RxPAkftZq7+ESIeW3wdBTpfzDELL7Cojl/ZN78M8Cl7+Qr/PxJ/rhmTXiph
	yyrcTRFKugplv/tFxHoi09XjJoTNl34d0EPA==
X-Google-Smtp-Source: AGHT+IEgbVUFGlu0tTYWSq2oOplLEYj/UF+LzYxMvihYNkYK3OXsIfhVMkkX8xl+OBW1JVcPLtcbLOqeqQ7WLI7Wqcs=
X-Received: by 2002:a5d:648d:0:b0:39c:141b:904a with SMTP id
 ffacd0b85a97d-39efba2ca27mr255141f8f.11.1744921577906; Thu, 17 Apr 2025
 13:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com>
 <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
 <aAALmSjLyWqrcQ45@slm.duckdns.org> <59c1e09a5c47a60e26c5fb10c3305356328a98a6.camel@mailbox.org>
 <aACtqnC7okO7eZEg@slm.duckdns.org>
In-Reply-To: <aACtqnC7okO7eZEg@slm.duckdns.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Apr 2025 22:26:04 +0200
X-Gm-Features: ATxdqUHB_J0T6QISOWtmxns5Ap3H-yx5PgjJvKRY1cMssCc41H0DFFgA7pnX8Rg
Message-ID: <CAH5fLgg3RrsWy-ArWb9502st3O=DsmPsBsXoZ5M_nS7oWggJuA@mail.gmail.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
To: Tejun Heo <tj@kernel.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 9:28=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 09:22:40AM +0200, Philipp Stanner wrote:
> > I assume you, ultimately, mean that the list of delayed_work's would be
> > accessible through workqueue_struct, correct?
> >
> > And then destroy_workqueue() could loop over all of them with
> > cancel_delayed_work_sync()?
>
> Yeap, I was thinking flush_delayed_work() but maybe
> cancel_delayed_work_sync() is better.

But doesn't that have a cleanup problem? If the work item owns an
allocation or a refcount that's cleared by the work item's run
function, then using cancel_delayed_work_sync() will fail to clean
that up. Whereas flush_delayed_work() avoids this problem.

Alice
