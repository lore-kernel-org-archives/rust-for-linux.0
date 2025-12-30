Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5972EA154
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116556; cv=pass; b=GdYnv5MNl12fZX377fPTgG+TuiW/6ccY3P7gWbz+J8sAopAsw0Bxz/uvUzLC3JibvE3NEjnZKExbXMwk5RScnLlHruf0o0ljUvrYMWyqUKeelMlQx5Axccr3tvstQLoSuPvZDPCu54E8VzkjI4/Ojr9ecKVDwJIErcZWh05/Qh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116556; c=relaxed/simple;
	bh=4upVaM7P7dvn4QKNRNF9ptF4uY8c7g1vuaxUpgt9HXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcZFtZ6/dgxrUp5oCEFv2R8wgOq55FCklZq2GK45U6bi8VQxkQvGl9Kk3I3QcnL42/Api/2WDDVELz4CV7Y50er4sP4NETBm3iV/cbHcnBmCk+WQo3h0G8NUv6TNtyToYERtYTPXZPlBdiNMPU+blvLr7AfcWlgseK2B05wU5l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WL6vsr8F; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WL6vsr8F"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b72793544so7344a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 09:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767116553; cv=none;
        d=google.com; s=arc-20240605;
        b=lQTdwc2oYJBDluimC6oZT9xd/8wtGX4b/ASB9QR6t/Na/dWtkcc7IH3bJEfplIDzod
         puYRjnCycVV/SFyFhWj6NvXk4PGLuZVHOhvJ6jFAq6EqCG8EaynR8WkS6ax9/Doo7fnc
         7yUJtX6m7r+IR+G4DDtusKdlscq2JrB3vmqKOgT0l9e/rudZMy3tCJwFcr+/X8gM1UCw
         6EHBzCNAZSooK6cVdD2uU56aHgGGKz4G9E3CaOrwnZb5li2BbkfwI3aE7NB4+gMeHQPY
         Us6PP75W4ZekZ6OekObQXdB2KXleTosGCwvAWO8lbF+yjsES5yoLFwN1XW9tn2eKpfGQ
         gyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EniJ2CrepgfRki6uJETfE/hYE8aMVr1p46VamvpHCyo=;
        fh=8n3xMpASf6EZvOOJOUjW6APWMysEzCdoPiAeodk+ojE=;
        b=X6ANkjcTl9i6ID+/4aaOytUVZJCwyTZNPbjVX4/JdbDnc9zAcxylnRpZb/Kp0DAWPH
         Cwwp8Y/CISHt6aikbu0PG8ReYsJV61Nt6GOffChakugxHNfg87kDSflT0YVFAxJak2Lj
         ICxV7TbIgfYb4+N4b9u5xUo9CAxQmzCZw3sdGjcSqhx2y1If6H9jKhIUXLP8nTc5NLck
         ozOi5qi3vEHbHaZG7J2nJceA7ae+qYtYZTV3/3QeoUR9Wf6XQO0s8ikX0nVOeA00rO1p
         1he54B2Fr4TLusP3yt6sBFjI5mCTCdxqtCFbp+RDwv/Oce/qVMwU9qn1k8dr9SclwB8U
         YuAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767116553; x=1767721353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EniJ2CrepgfRki6uJETfE/hYE8aMVr1p46VamvpHCyo=;
        b=WL6vsr8FBT0f9CWraORmRRsVuMX74OAjXyDLaE1MV6PzeMgIpmloSELpoN4C9nsDha
         ogAaxYl0MGdtHvwVwsVfh7qoyTfoCa5a2f72WSGBIFZ+Ek3ktPod0qXQbn1CHQQzDSgf
         I5pruoFGx8Z9ayfRzYFrcHE9mRg+ySo8Whiop4+Mq2oPL5xUBzIEFqidXcY5zI2SBkU/
         WPXZ2ZVAXMFAk5FX+weuVkciLyVcil9kAdM5u5Sc7Hk6tLrqrrYBxm6827GFm2nSHtUG
         7PRG5e6tEDxhmm3bi4awLxP5upWni5RsxnGhA1ijybhu5U+I+DZpbFEdCn4a7NB6ut8a
         TOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767116553; x=1767721353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EniJ2CrepgfRki6uJETfE/hYE8aMVr1p46VamvpHCyo=;
        b=WavYlW5H1RXqutydj3ableHVBFGw7hAceE98vQ1c0nNYT+fLiZbKIca4yI9SP0zvum
         M2fkNgU1xX/Xss2VQsohWR99HIzUyjexbhXGpf5gQOr7qAqgKk0DXnw1NwBd37O12aH2
         0MJIOC6ydLcs9ds7qs59zSOtWYn5LQbXz+SFCvaSZJVIYKPRd7oXIMb9BawI/S1Gwpmy
         v+aU5Awzm6RQ+w2BKWrm3K+XPRmVaJKP+xZ07Pxw9QVVHzcxcONCyRSReJ3Kj939Xoux
         vWynHXJQ0MJn+TQscA8/PvvWJRIUGmfdWivnU4BtwT6/2PoQb4qoBPsEWygxZnb3fNJF
         dN3w==
X-Forwarded-Encrypted: i=1; AJvYcCVqUheNio55wpxV1Gyb3YuCO094aV7zrhKCln0IWrXh1d8/HvBjmgz5qL/tE3wtINPZZ4D00jtRm7EoOMLoZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiNEo8iSQx9ufwcqtkN+B56MDle3mZ+/JKNbINIG8H10ywp6Ap
	yQnIvIMirdevBxqgETr9CxlXQC+decO4wgVVbkCuMPnhod7AFl+yRn5JKW/KjevvUGR8UcIuFEq
	MpU75BfiEGlBJihUw0gAqikbyVfv8HUvb8xo15gtJ
X-Gm-Gg: AY/fxX5wnyV0OVLVHNRjqzA5/JzhkOqOsX3R4qG8km56zaHJgPA6ShyhpG0oFHmWzVC
	lto2BsYiQv52N8HGY8Cg48RMFfqCljG5dAS54ZyP1xG0peZOqKp8NBN6EYCx0zJjECY3MsD4yCD
	hddUacGvQ91XUOrjx7CC5gdnTbSCV8S6Md/e5v6zOd5B7mbp7MtIDB7Gz/pxyOzrVHYVf5+U/9X
	qu1XK9tB9IJWRlxj8zNvlPX7KeP6Kj9NrsvDiwZPb6GN7J6xaHggpeQv2/SbvhxRPMMOTalOF0n
	1xtUv/Ae13A8UHA1GtQb+0k8BA==
X-Google-Smtp-Source: AGHT+IHVRjKHQdtsJIOfsLZL50ZYuzNu3fPIz81cdCexWDDy99mvyXICqoxhMWDiixF78mu5cbgbyLlYl3NgPaHEfuQ=
X-Received: by 2002:aa7:d494:0:b0:64b:560e:41f0 with SMTP id
 4fb4d7f45d1cf-64f414ecb82mr2138a12.0.1767116553278; Tue, 30 Dec 2025 09:42:33
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-add-entropy-v3-1-a3440823a07d@google.com> <CAKBF=psstiTNLFOLzfGzkTSCZHoFuBGu9LuP5oB-tOKK+=+kvw@mail.gmail.com>
In-Reply-To: <CAKBF=psstiTNLFOLzfGzkTSCZHoFuBGu9LuP5oB-tOKK+=+kvw@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 30 Dec 2025 09:42:20 -0800
X-Gm-Features: AQt7F2q4XGcIJ3Mw6jH9VyipkhSsBnJH0pg7iHiniDe0EbJpC2xKtfL532BD2k4
Message-ID: <CAGSQo02e2-E4TNEwit+jca6jZszRxbvAiSut49ugy7TDSaagyw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Add support for feeding entropy to randomness pool
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:54=E2=80=AFAM Kari Argillander
<kari.argillander@gmail.com> wrote:
>
> On Fri, 26 Dec 2025 at 21:15, Matthew Maurer <mmaurer@google.com> wrote:
> > diff --git a/rust/kernel/rand.rs b/rust/kernel/rand.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3e0aef2f53af122f510b34c=
4743a20452aaad9ad
> > --- /dev/null
> > +++ b/rust/kernel/rand.rs
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Randomness.
> > +//!
> > +//! C header: [`include/linux/random.h`](srctree/include/linux/random.=
h)
>
> So why rand and not random? If there is good reason to not use random.rs =
then
> can you add that reason to commit message.

I have no reason for rand over random and no strong preference. I'll
switch it to `random` in the next rev unless someone else chimes in.

>
>     Argillander
