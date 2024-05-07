Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3133441D
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 03:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715051469; cv=none; b=OWtOMTKkgFPIh4W9SlZtNMepWq2Xc4qvJM+OIiWqqrHbh4HZI4zaULJNSa7Nc6LwQeQDFWTnecD4GnNYeEMa6jnV6C6VCgjjUfUoLS6dR0PO9R9FY3fz3KkbEHLQC8eOakbWT8r7WAxIxMQzf4V/WOqcDM150iIHcOFpmbY4+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715051469; c=relaxed/simple;
	bh=YdVVJobqrElmQOMPMcRZo4thVshbPhTtSYdS3+V+NJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4vmcD8aUeHNZPByTJAB3mRS8PLXgn5BAHsof8+o/UHxM76jDby4YdInGvvEWnf4yAZp/BoUcMpuVQ8ks3pvD8F2TEqpTvVwChThnRGf5nALcGgTFOdCFOUi48eMS8ylDn+MF19tlkX8y0lwU/FiXC3qkpq8I6bM5dHiJd9+bMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0DRsotR; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0DRsotR"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61b2218ab6fso20018717b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 20:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715051465; x=1715656265; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YdVVJobqrElmQOMPMcRZo4thVshbPhTtSYdS3+V+NJg=;
        b=m0DRsotRqETaoXECW8Zm42RHj7ImKJ0nUp48muH4q8ycifqjhsSh+s0x5gbrmkCBd5
         t0pXsysFsJztFLWUEb9LERMkwXjgh5ZHOKw5WVYhZtttW/WBDp5F/L3bSBjpaF2NEyXJ
         ukoAAtHzsvTmQ++8UBMei4AZnNqg4XDqoK+4qHbwUPMQEyqibQe7Vm6UDJATI2JBpXvm
         6UyxJWQ5vl/bf4ISNDIALgdJslSmavBUydIaWoSpaOwg2sERYpH0mJldUiX2+Ue0nRfS
         808Ztb/ITSoKvjsU57FIuKOS6TI71kW/DKd+h4nDAwMNu5ELFlVEwqKd+SZbpqfXEmFr
         Ze4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715051465; x=1715656265;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YdVVJobqrElmQOMPMcRZo4thVshbPhTtSYdS3+V+NJg=;
        b=FpSY5+Dg1MTW2WqtcxwOebHazjAInYuLM7YxFES871fGcQ/0d48n62rfdhu6atWy0x
         UMYnrBe5ZN8tJFJdZXcxONdQqHsDm8DT9OIWhdJmjxgq/L+pI7fUxUZKr00fBCExqshr
         pYpgdWecGTCtGHy+q+DUHZ1o5kZxbNByLmyeIxBEBAe5znE34a49vwspg+3VvUgXw0vY
         3F6oUQ/5jTduP3h+w3/9akmPtMYtbPFFPzRmoBXNa9DT3iP/ulk5KkIaWR3c1Jyf+w5P
         LsnC4F2H83jyjpY7VeR6r4iA20PEwXbL1JWKw5JiF54P6CfsOMC8OBrw+RER/jjw0PbS
         Xtew==
X-Forwarded-Encrypted: i=1; AJvYcCUTyuKLbNzAHSk3mG4irZXwkskFHoYy5uEuhoOWUq+GSnat64WcTpTE4TsJP2jh13hQz/nPYw6F3UW+WsDjZ1/X53ubhdsjasvgcz3MPfg=
X-Gm-Message-State: AOJu0YzTUf2NQrb3QJcqL40PtQYb4Q7rKhE8vZ2AECrGj+69bX61+pO7
	YJe/JjYZzScvXYp/SU8Z696z1/ZqOBQkvN1DXoViwVkjAQ1PpSJ2YAHpLjAi0/Afmd15y5BmONm
	6B/kS9zYqolvWB+5Onu51yDO8ZE8=
X-Google-Smtp-Source: AGHT+IHhyFedVQRSpKK7ZwLBnTYToovWS3JosXV6aYzJkJO8Da7TdB18yvfQ2RFqkHDTp3mH7EGZIRAwfHCyRRuATYU=
X-Received: by 2002:a81:9293:0:b0:61b:d8:c5de with SMTP id j141-20020a819293000000b0061b00d8c5demr11631065ywg.19.1715051465599;
 Mon, 06 May 2024 20:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com> <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com> <CANeycqppeewOc+OH_KPLOdbPLx1BMGMcmuye=uKM2-K80J7Vwg@mail.gmail.com>
 <CAMwc25oNYPkHTm2NoCiP2Yc0K1J_JVPpv3gS5+9O2kwveLYgCw@mail.gmail.com>
 <CANeycqq6KBqBiX-ckm9MEGW+JcynvjAw2TJa0K2-mGgN5snZsA@mail.gmail.com> <CAMwc25q6CE7AyDWJg+qw0=kZYht=0aZ0Rn-Gd5b9MjoLL4uHuQ@mail.gmail.com>
In-Reply-To: <CAMwc25q6CE7AyDWJg+qw0=kZYht=0aZ0Rn-Gd5b9MjoLL4uHuQ@mail.gmail.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 7 May 2024 00:10:55 -0300
Message-ID: <CANeycqo4VDYQFXaxJWrGvsoWvkpt7HNK9MbmAY8PSK4GrgfALQ@mail.gmail.com>
Subject: Re: some aside maintainer advice (was Re: [PATCH v3] rust: alloc: fix
 dangling pointer in VecExt<T>::reserve())
To: David Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 May 2024 at 23:47, David Airlie <airlied@redhat.com> wrote:
>
> I think sending a v4 would not be a problem in the same timeframe
> though, even for a one line change like that.
>
> You used nit: prefix and asked a question, answering that question was
> the objective of the question? if changing the patch was the objective
> "nit: please change this match to an if" would prove a better idea,
> asking a submitter a question and them replying while sending a v3
> doesn't mean they ignored your questions, it just means they are
> wanting more information before sending v4. Review questions on an
> older version of the patch can still remain open while a new version
> exists.
>
> There is nothing against sending updated patches as quickly as
> possible, and adding feedback from open questions in another round,
> otherwise patch series could be stalled on "nit" for a long time.

I'm not sure I agree with this. Once a new version is out, we migrate
to that new version.

> > The latest exchange didn't lead me to believe this contributor "would
> > just make changes and move on" (as you suggest above), so I had two
> > options: reject the patch or accept it and change the style later.
>
> You can just ask for a v4, turnaround time for patch generation
> shouldn't be taking a long time here, if v3 was 16 hours why do you
> think a v4 would have stalled out the process for long?

I can't demand, expect, nor be certain that contributors will turn
around quickly.

But let's try it on both counts. I'll respond to v2 and request a new patch.

> > Since I obviously want the fix and for him to be properly credited (as
> > he deserves and insisted that it be by means of his own commit -- see
> > the discussion in v1, of which I wasn't part), I chose the second
> > option because Miguel and I want to finalize the changes for 6.10 now.
> >
> > > I'd suggest if we wanted to establish conventions and rules around if
> > > vs match we should hash it out on zulip and update some docs
> > > somewhere, or we can just leave it as is and have maintainers state
> > > their requirements to avoid ambiguity.
> >
> > Zulip? :)
>
> or in the RFL call, but somewhere outside the flow of a patch merge
> that we've admitted has some time critical pieces to it.
>
> Dave.
>
