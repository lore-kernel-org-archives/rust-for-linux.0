Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94E52F547F
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411784; cv=pass; b=V++hd+4dZG8UGOJedau4XZgSMJ9WhjioBjgAMkzef2uJ57BASiFX6GP2ox0MfGgEiz9WN6nBOuHEhp0aiExtZ0/Z/yNNhWhp8il8xZQIx5ZYEHZEkSZMy+KdOzOTVVudnconER11rA0rJ1MZLmhGKkR/GRCGApPz3+9BPS/XUtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411784; c=relaxed/simple;
	bh=2ctWV9NarxDvkaGjJQhmWsfCo6xaRK6JyjI++wvHG5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpspFEa9Y3V7Vm1yRu3phHG/kln8DF3pIrkPIAITa7ZGTckDfmeqSbfwEQOQRreKE49885k9O2sGXMsyJWz88HNE5FE2eEx1O++Mj/OD1g53CARKi7WZ7wTSb3g5lPC4PANPfnwQYL9HJajA2kByDNN1fMOpGp/FxWx9lU+cNPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkCTV21T; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkCTV21T"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba76e80509so469058eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 02:49:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771411782; cv=none;
        d=google.com; s=arc-20240605;
        b=Agjrw8mk8Jp3/Kvba7P7waPa3pMQqZXEqjtGcMGbr8eZ7U/kX1tBK5MG2/O5XgNpD7
         CAc4GTKn+ywBjXWs2o06NZ8SR4SwA7RpFM3+V/UvDWsCo+n4RGfDoe6cQkOiI8YeriA0
         k1797NvqL5gM4Ga/UtzIUdhXI11OBGiukjXm+pdGO+8Nr3q1Ms7BXOGIApAB6Mv/6AT2
         s2wdHVW22dawua/EKYmqrauOfYqmyCuMcQXF+MUGnxrkxd+gAdKj6Pwd8WtrsU7L9tVc
         zStJaaaNv9zbhTS02k7P4MUTSlTmUBrQ2czEWKXVt8TwJABp5CKisfl6NG3FNRF8GiB3
         cfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H+380fVhYA3uqh6qYQq187ErqzMIgsLBu5rdttXqiHo=;
        fh=gOyhT2/36kzKmyQOfwl/KVIO9crg5f83w0/qzsREiag=;
        b=dr4Kh6ktflr1RmUeNtUU6sqrNLdQ9LhFeVyDnPmTQ9Wp/gehJGLCy2HzqrFq96nMy9
         iNt84qCzIJLYMPbdCPx4yFC8h9/XbsisFlZ7q+MSbh642IQv+2jNsO4fyt+efabm/K/n
         FWQH1BYPtR2TiOKUITfdjgoFuIXbzKnNIPiFlfEuuhnpPXIgrVU5Z7PNmyswoijZW2cB
         L2scLacbppjS7ZJG/1pUYmwH/X8owdcZ5GabrXjDKlIehCvj8kqHX2HDUeU251n6oRPY
         i6xLKAUvxES9Yp4142/wXE8aCBMEnh8l3x0qxpF8GO6RMhtiblOLRneljuEZ3vt9OvLQ
         fSTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771411782; x=1772016582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+380fVhYA3uqh6qYQq187ErqzMIgsLBu5rdttXqiHo=;
        b=UkCTV21T687KwNDVWldBZXQKlBLUZVM+9dJNGgngyze1+3o6he3aW1hcbNAj2atuyF
         hxUk7ziV0XPvtFrvwlB2fn/ZQWDdomsjP5R+RcRXIdwM5llSBP0PLV+hEVWrkPt2FBPd
         H0h8q3w7zBy1JocpjAMQ9zEWAZ4b/3TSOsX3KWeMzshAl6cDJutFQdZGgC5KqKla2Ndo
         e4yEhzanmCviAFWdsotY21hwDfwgIb70qQK3ULb+QDaNUKfC2hmfV3v8CICEsOcIzC5K
         G3+03SAdifeC9VBFHXJxxIuZyVGV0dZcbynnXu0vxFI1KGdJ9qkIFoINQ7RhL+3o2/Ii
         d8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411782; x=1772016582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H+380fVhYA3uqh6qYQq187ErqzMIgsLBu5rdttXqiHo=;
        b=XNpdLFAuBopiO5WqMpJhQv31kyNX98cuBJNlUoPJvBypaOfe7X8vgjtQuWDqa6qCTJ
         vv/nzrLoQ782akJm6XxauKifR6xYUt2oR8v9Ch2sCvEefXSKkHHXDgeBIV+YyLWCnrLb
         Cb9WShSkvE1DMa5WYBGt0MDLDOzMkwjcspx0o6oiZ6Z14j6YL/Cs9d91G5ARmowik9yj
         EAHZbZ6EIwzLaieggJCUqy+up69ENy5JYCaDEipPlMKc3biFMvlf0aVKzhCtRNcbW2Ej
         4PUa7tVY63LB9z0A7/fS3zbM8rEDm3FLAxhQm3GGFk4r8A+2AeCuARXU6MeEPlLE7JCJ
         tMwA==
X-Forwarded-Encrypted: i=1; AJvYcCWvWVA7P985j0FQU7HL6mL0L6sVMeOG8FJ37vn0ZrW81/IM8e/PFF3Lu7Q3VnYd3ScPGmR7hFm/U80bGtmtkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbdu8HgnSzTFKhxbCXeKjlCWsMSQK8sxhE/K/wSxtTxnb44Daf
	dTzzl6H9PtFx+AGN5poFcxuQnQhJlPnfsxLVzZpTp5iocymNQUH6rFwtmwl8dQc9XkKXXp/VTN7
	xDF77OW/tZZ2Az5ML2SH1L5cYsLFDBaM=
X-Gm-Gg: AZuq6aJqnBMC5LztiV1LhTU+jdZOhPu6ncPRIyZ4qM3sINBIYdzAxut5XFkeJGWI023
	QdmmTlm4OAX3TwOLN5NYaeF8DqIUqC5ROqPw6rfWrTud98OlOY8MdUKl4ptJ7FvIjOyWvHxGYzx
	jUKsU/IwFrCXE1qiZUCFlXkjZEhLtKg9ixt6ikylVpWLskO4iYVZeB7MNcZA55i4hN/v/CNEAz4
	Z6jGC9Sfjx4TczUeHRkHlbR+9ZNqY3QdMGkfh5ywP5KICclZUcz8Owv3pgcIn8dxkx78sTzJaF7
	IOqfsjRguVAjh9kuqixu/eKOsxUH7w+Ioent1LLR3dZxhnWX9gaEtZi3UgMPQmea/hA9NCyaLxa
	Ii0zo7+k1MYn6BHg6oQ9qmaDQ
X-Received: by 2002:a05:693c:3747:b0:2b7:f145:a98 with SMTP id
 5a478bee46e88-2baba010c63mr3657711eec.2.1771411781780; Wed, 18 Feb 2026
 02:49:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214053344.1994776-1-gary@garyguo.net> <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
 <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org> <CANiq72=+orB+-sTAJHiPQmz431+pCg2S5E9NFSbuh4NNhppfLg@mail.gmail.com>
 <DGFJVWDJUOXK.27766P8H081G2@kernel.org> <CANiq72ktXTSsxKHcX5eNGf-6NR-ySXf9CX0M+gPumzZxVVufow@mail.gmail.com>
 <DGFP45YZA0MG.VUXK28J7P7B9@kernel.org>
In-Reply-To: <DGFP45YZA0MG.VUXK28J7P7B9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Feb 2026 11:49:28 +0100
X-Gm-Features: AaiRm52KfP2KwDhI9bxU3HYECw1O2IwWUZqamNmNnAClivVE4LlSsOKx4JNA9LI
Message-ID: <CANiq72k3C8Vs69xSRk7aNkzBsjnhyy6C9XFS9j5FNHJbYDUKmQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 6:02=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The fact that you keep repeating this and that you said in your fist repl=
y "I
> would prefer we at least have a reasonable review time for this." confuse=
s me a
> bit, since repeating it and saying "at least" reads to me as if I would h=
ave
> ever said something different, when I noted:
>
>         If you don't mind I would like to take this one through the drive=
r-core
>         tree as well, as it is not only the base for this fix, but also t=
he base
>         for the upcoming I/O infrastructure work.
>
> I did not mean to create any impression of urgency, but only wanted to kn=
ow
> whether that's fine with you in general, e.g. "Yep, will ACK it once I fe=
el it's
> ready.".

I was thinking about how to best handle the patch. Fixes are more
urgent than features, some fixes are more urgent than others,
sometimes maintainers have other constraints, and so on. When you said
in a message:

    I'd take them through -fixes (as the soundness hole is technically a bu=
g)

I didn't know how quickly that was meant to be or when you needed to
send a PR etc., and the parentheses part in your message made me think
about the "soundness issues are bugs" policy we have, and that I don't
want that the policy I introduced creates undue pressure on
maintainers to land things more quickly than otherwise they would
have.

I didn't mean that you were going to do anything wrong or X or Y in
particular -- I didn't know what your plan was -- or that the patch
wouldn't be reviewed properly.

> I'm a bit confused by this paragraph. In your last message you raised the
> following concern.
>
>         "But it is all a balance, i.e. in the C side, it wouldn't be even
>         considered a bug to begin with, unless there was an "actual issue=
", and
>         thus unlikely to be justified for a fixes PR. So I want to make s=
ure we
>         don't overdo it on the Rust side."
>
> But now, additional to my usual handling I described, you seem to ask for=
 a
> backport in such cases, as your link mentions "In general, fixes for Rust
> soundness issues should be marked for backport, unless there is a reason =
not
> to.".
>
> Can you please clarify?

Not sure what you mean, but that paragraph was about being flexible
with soundness issues -- it relates to what I said above about the
policy not creating undue pressure, i.e. that the intention is not to
add pressure even if they are considered bugs. It wasn't saying we
don't backport them (or that we don't take them as fixes etc.).

Let me try to clarify by summarizing in other words:

  - We consider soundness issues bugs, so we try to fix them, add
Fixes: tags for them, etc.

  - However, even if they are considered bugs, we should remain
flexible about them. For instance, here, we have a patch that requires
a new feature, and there doesn't seem to be UB, so we can take our
time with it.

  - We backport them when possible/reasonable, even if one could
consider it out of the scope of the usual stable rules. The stable
kernel was OK with us sending those when we discussed it years ago. Of
course, some things may not be worth backporting, and some patches may
be rejected, but we generally try.

(And this is not meant to say you said something different, or that
you didn't know about it etc.)

I hope that helps...

Cheers,
Miguel
