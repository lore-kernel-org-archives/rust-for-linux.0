Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756E35F8A6
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 13:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990182; cv=pass; b=ilcXVUS7cGet/uwtAIKJG1H5PPuONLjrJbFcKAhlD6BwfGaU+NAZazPhegG876ZFa+RxgTSLVZLjlNgyP/rQ7k4pFnr+HHauJjjutt9OBsOv1raVC4AYJLXdjhUei2svjb1ttPObW2OyvecbvVKHB9t4ZSPj37+OBdRcpp3QFJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990182; c=relaxed/simple;
	bh=2sxKaA4avYVv2vtja7UxLug/pBSEgURRuBZVUhX4c/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlK2co08ORyKCbPBnnThJK0PETX2bYw3/l3tX9chxqbkv5zD4q9V1VJYwjRLdcBKOmbIQQebSxwW1ziN17lx4risPLkCu/nc6j2r0ielMxTkiqfncqydrw0p5QpjmfrrkJ+xeoZKK2GJKo3xnWYMVjZdUgKvpxs/K23Dn2QqKPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Isi722jW; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Isi722jW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f454be5bso29721655e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 05:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770990179; cv=none;
        d=google.com; s=arc-20240605;
        b=ZH9Zb2R1gQWBe3/VwWSxtK4z7gHITL/MwSiiFspP5eK+bM3/qV1jdDT+pWsG8rFpxi
         lh85yaBgIdb57B5UFFCWER3QvovHpLKwAWiC/TwOO7NBPclS9SjX9A3JnuWvZSdJNNhQ
         ZX0QFiwz77FgFvOSP+XV3HpuRnZVK5dZk+BgGv8pFLu5aj+VjFZO2YUKateqGbLHjcG3
         30lwTy35nlfZ89zZL50C39NNvngXMo6MgZPLbDaR9noilbUswsoxhaFzM99XL3J8f6pA
         jwJzfiYwMwH8yxLRS6Z6Z3DbZ5x1dXPqnqMORzLHpz0gCGWYZJG6SWKY3lZG+Kse1o8f
         lmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2sxKaA4avYVv2vtja7UxLug/pBSEgURRuBZVUhX4c/I=;
        fh=pqRME5p3BD2GpJHT6tQGcK5nY2OFM/+2K84PAu6g1bM=;
        b=bXTgdy6/3WfPU3cJhTPBq/GtykWt1b+XbCyJrGyz++mXgFzjJOXt4ZjaRGhA5nDssA
         T9wdMrLBmQN0Rglv5KEvHhvhxyG1iCUA01kWW/bRHKW1zTwjQxTsjMRNA2NMedIGAOzx
         L7BDnms2ETqJ4W2tnlCOgUzeR9nlcw5UhjJTN7LY6He8PiaDdhCb21bMLdw1iPHfzK5Q
         nqprmd5tefw5KZUns2TtgSg7PM8rjoXsovtHTh4ePVAM2cl3D2pfAAOSmbe+Tjqe3lGi
         h1xbo0zmbCcxWt0GqBqHBbPUtTCQfitehU2yLw6jnKpj2i3hFKXJ70TneaWrJ2woLgJs
         j7Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770990179; x=1771594979; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sxKaA4avYVv2vtja7UxLug/pBSEgURRuBZVUhX4c/I=;
        b=Isi722jWCKwZgwh0RyjMmKfZ/I5jMsMNLAbEBIBPB/VjWEcmBYM2RShlZfhRXpytP9
         J6LrEg1HKNJiv0lEcG2Qo0iLVdkBzp19VSphBtUZiTF1/hJVqgw5IQ6MmzfTAo0COsBX
         Y8LHNgGAc5fGNbXTszFmmwUMpSI2T6RmazlPhgMs+J5wpCEN9ZTNzHw7kLsNd2lC4vJf
         5qP8EmknRqkUXHO2C5pLEm213Mw9/FdYyBpSAt61VN2CoQbbtczOfdP5VcuBzC2eLvA3
         7qQI/I/rFFUIAVW0R7b3YGVv/RWXHXlzkb6bsmnhNXTir/nhCS5EEx0GrNHMnrltpw6M
         dFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770990179; x=1771594979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2sxKaA4avYVv2vtja7UxLug/pBSEgURRuBZVUhX4c/I=;
        b=Z3h6yWfFl8z8/3WX11rs1Ms2zgm0ytNDF/4buH+FrwsItaelZ9IqiUghmP+GXPe7IO
         89u2NfPUm4Vd4lLuGqb86rzWwRzcGAi4n2b5OL/LeIkvHkGGuYucJbVXRd3Gs8WGQVY3
         u+owJpIz+ybS+Y7R4mVQLym/fqpBJxscaC07Au7kXJiBkY+IHaNEL2PjWMZoCtc+2rNC
         Acw9O2IaNBZyBSS96VRXzACHdXnhdV5qpWaZhqxCo0q9aMdsjlhm/5+DUQuNiu3uaKV/
         iNCQuJMKsWExvI/GuHdjmfnjmA2fkaaeT0vU8p5UbEH2EqwG9lKdK3s3BLkYXyn6sstK
         BpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ggNqnGEaIY3s9ST1jl10wL5smOC8UDDxD7YEG5OkfQaUFnGOrDJbqACx09/5+5y04FcxsDKIWYiuyT60CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xrZEN6kpmVEJWQvy0RKIgyiWq9uO7Y7Os9TPOfeVdlJlbeyq
	bA2pruuk5UgO/6CWSxONZPclENGeudl5VnGoZhbS1793JmZKYMAaQ2P8HyVZdS6WVgD+agXxyXR
	6QHtCovw9SGyhxceuj5VaRkQBBuaKr06UKQhhTBOw
X-Gm-Gg: AZuq6aJiueNswlgG8kuj8GSHijaHTN0RwWXfv/11xSOemwcYxhM6AEvv+ovWqoY0gUH
	LGXxHZUHldyzkDHl5DY1OVOkQF/dZD6VrieAKtuDFhj6CPJvMdYQViO/aYLNMvkw9x0zGHZbh9x
	QjXPu8dgFQUYFfXZ+z22oNdDsLbrkDunI4sVVVBSOH4uDzu3+tWvXhlmzi3olcl5hdFImNLAPL8
	6DO3y4Y5esVNGyRit7dWNq4E72/DONj2uMQe7JTaR31RWqV90LHDO7G7c4JWaMKl4yKpx9cPoKw
	3Iy0C0heC0hmv2Yuf1Yi8QZLGlsVryVBhTpzww==
X-Received: by 2002:a05:600c:40c4:b0:47d:403a:277 with SMTP id
 5b1f17b1804b1-48378f062b0mr357925e9.4.1770990178366; Fri, 13 Feb 2026
 05:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-rust-de_thread-v2-0-7d274c4fd02e@google.com>
 <20260212-rust-de_thread-v2-1-7d274c4fd02e@google.com> <CAH5fLgigf7unkEhYtCY6ZjQ1rPAgRM84f3C5qn6yh+sn_Eb-7w@mail.gmail.com>
 <CAG48ez1w4cubhtw=djNQvMWxdKo_d45Rfk8sW0fFHBi5bvLuKQ@mail.gmail.com>
In-Reply-To: <CAG48ez1w4cubhtw=djNQvMWxdKo_d45Rfk8sW0fFHBi5bvLuKQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Feb 2026 14:42:47 +0100
X-Gm-Features: AZwV_Qj8KvAxdMLdaoHr1EnAELkVEYpBqgbRvh2gyl6oLsDTA9gS3exjMXThFi4
Message-ID: <CAH5fLggqtywzuqYyVi=BKUQtJQmBNe-vfFLKEh7ikqAQyXW+nQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: task: limit group_leader() to current
To: Jann Horn <jannh@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <walmeida@microsoft.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 2:38=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Fri, Feb 13, 2026 at 8:52=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> > On Thu, Feb 12, 2026 at 11:12=E2=80=AFPM Jann Horn <jannh@google.com> w=
rote:
> > >
> > > (Note: This is not a bugfix, it just cleans up an incorrect assumptio=
n.)
> > >
> > > Task::group_leader() assumes that task::group_leader remains constant=
 until
> > > the task refcount drops to zero.
> > >
> > > However, Linux has a special quirk where, when execve() is called by =
a
> > > thread other than the thread group leader (the main thread), de_threa=
d()
> > > swaps the current thread's identity with the thread group leader's,
> > > making the current thread the new thread group leader.
> > > This means task::group_leader can't be assumed to be immutable for
> > > non-current tasks.
> > >
> > > For reference, you can see that accessing the ->group_leader of some =
random
> > > task requires extra caution in the prlimit64() syscall, which grabs t=
he
> > > tasklist_lock and has a comment explaining that this is done to preve=
nt
> > > races with de_thread().
> > >
> > > Signed-off-by: Jann Horn <jannh@google.com>
> >
> > This has already been fixed:
> > https://lore.kernel.org/all/20260107-task-group-leader-v2-1-8fbf816f2a2=
f@google.com/
>
> Ah, and I didn't notice it because it was in the mm tree while I was
> looking at the rust tree. Sorry for the duplicate patch.

No worries! I did not get around to fixing the pid() issue, which was
also pointed out previously, so thanks for the patch on that one!

Alice
