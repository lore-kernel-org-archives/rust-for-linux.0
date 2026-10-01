Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B63ECBF5
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Oct 2026 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851634; cv=pass; b=h9JKJU0KWhbL6rA7Pv1MDKa5MlC7j4w8k+KV6p2Tgb3y0g+4nFaGR3+8g7bgAAige+M24Fe2oD3JjfGEJ5EX2LaiLntVvsWe0pmRxsNNd+RwJr2mCowy8OpGzp7tO6UD13SXRPkcFI7kDBPO4T8Qvtg8igMAYoc2fPzUkjqMNmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851634; c=relaxed/simple;
	bh=Sk7RTOQcN4cidxedcRYIVkGub/oGpNeLEskr9NMZ1eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPMLRhInMGdCq/S6W8WVySYvi8G6nsj81Nf5ykuSIbtXz8cjrbxL9/ztzU9t87PENYx+QzvO+kD/L3OqssraHTA5OeUpOjY5FXh+Ha1gJB2Q+dLdmN+sBUtGJDb9sEFVD+6NxRx8j9eDDvAYjQV2xKFnR5mWzuZADoQZhtTtZUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVLuSdq/; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVLuSdq/"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so306668eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Oct 2026 03:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790851632; cv=none;
        d=google.com; s=arc-20260327;
        b=TD26xzsbXKCZjTXkkak/JibHnTKgA+BPzin+YFYto7814OnOx/L+qJGPRw5KTX6y8K
         EGwuh6zKe+Jmtglp1qw2oUAPjVlGCeIfUg/0j/IJMpQbJ8XYltkeLFKxhuHMbwNu+knG
         U4nAedftzTE5OPw6tCGq3XcKmnFuVUjh7PphYj4GtJmpCX7BWRt90DEoP6meMfp8mlkA
         ANzpdzFYiEd6n590KuYUUkPZCDPgeaZbmrRRczT2V0Jb8Nrh7sSttwTSy2nn6Yti6j5Z
         Ye2fSy7UNTWtaQ3S27r1WC6+Ux84dhOZyw+/klnKKcil2mPpXlupBw1XyQ3NXT8wZaJ9
         2piQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xZGQWu5F+L+LnhlrlKnJBt7Q9Qa/GJcvQeTn5kUBy+o=;
        fh=aau669W/r1YbBOATay63OLpjG6QTCQ6QO9w099tGBig=;
        b=AyxWjg5OyPHwrwgGY/uCR3NYeaN49q0Wfp8Q/DEnsANel44gH2BGmMaRnikBeH8U+0
         8RQ6LRTNTiral6/htt6Tncu/f6Zb7h5ExBw7R8sJurh4C252bIatTqwGHcQ9yYkuulKy
         uC90nlsMt6AI0oQO1WFTNCkbwzM2Z0ZL3+zRb8kr59KqvlReoXlejRIDdaocXFSnOTEp
         tCWG4QHUV8Oh8PY+fx/keIV8qvNA/qbwAl5n1H8Mo1jJGAlmIeJSWTfPbEuocGfBXEwa
         Ksg3zU9y+J5pBZ60B19/saMv8SSHQeZlU+2h3HyIWEszEVHwyTdj8zBy5XpoL+z/fdCA
         REyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790851632; x=1791456432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZGQWu5F+L+LnhlrlKnJBt7Q9Qa/GJcvQeTn5kUBy+o=;
        b=SVLuSdq/5miDqsF3OehTAiZGkWSLw1jUF43HwR6I34Lu9xE1axu6bwF9gwcJNTA5kF
         U8vPKBE1vUqFRqsFA7AE+q1OMVuz02OkhFEFW5+uHjRa4ok/8IohGfkZfLXNBqhQlxh+
         3TZnW+atvLc7QhFxOLfUzwM/dAeAyXSLnLn0eabti8ybR2VijI9vivWhlSGusAQe4RI8
         Ak9CLyn6BjL7OOer0dA4AJepj8TIJ205/WBR6upqEiX4LzP0QiGiPrbn9fK06Luua7BH
         uHvzvoDfbEXHs2glbii7vHe7tSKb+hHy9LdvyUdBEcnYecBbZ2gk1gXQcfXpRgYt3sKe
         bk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851632; x=1791456432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZGQWu5F+L+LnhlrlKnJBt7Q9Qa/GJcvQeTn5kUBy+o=;
        b=FoNA+TiiXAA+Ra55nz3utGsZ8elTD1s5dB0VaDxqjcu/WCjzLECBHmSAhvNS3f+PUT
         c7p81vaGVI4Q9kyNGk3+F0vPjKSF/tOeGo4Ps1Y3YGLFRAg4cGV0tds0XycfxRFPMdLZ
         qdHQCVUCiIrNbTOah4mu0YnTEbo4KjWNjzHqv4DGryAx8ZfVattssRqkSKCt4rAD/WbW
         pjLQFa/F6PPf7u73aLzffB172T2+enNx5y1YKuMlK3vSZxRozra2xhoCFzGXpuhld2Ys
         tj52JbqOIP7viSwhNm1r970QP5tztU7ac3PYSj3HWYzm5t9rp9ldgALKxwnE3vS5yhi7
         Qcfg==
X-Gm-Message-State: AFuF++mPuMxQuBCi5N9qLBhsGvY8jfcQofmdUJvfYLTGMiEt9ruDuBMV
	/RLqDX3+kvMkBGMVUdk+cxETwPGrxLNGrYk5AALfKWVORzrOwjJE/tTB+x7RZ7uRklPd0ofvwnw
	L7gmdglsDKWWMxxZkWRg1Q2o7QOYGDeY=
X-Gm-Gg: AYBFou3boQLq735X0T0+AgjBusl3KqWrqmeklI9rhmK3fZm7haft2I4e/2gBRJZTt1T
	X+GE6Ckbqfg5qf0Q+e4JCVJdGCrW59fKGH+veERl/1UZMvJI5pssIgBzzEZtps9Qs4vTmKTA2/v
	27z742SdP7lMvUSbSaOqFKI0BcLofjYFpzCK6yQtCP1sNXyP+LQwM8Ft90QsIdW612y489O/i4q
	0MN6h1wviRcTBmt4LdBhAv0IfANx9+z/jHYw/691CuVtDBevwP+qNzZazMd/vNsHQ1SetEItjQq
	w5T456QUu2h4YjFdDRuOLagIgf19MilliVkzR0c8WBEERSWOQjuQa5Cgoh0+wpJXjTmNzKjV9pq
	H5YaYTajzu0w0bQPdJ3QuQda1qaMcOojdA37KUno3M/NGza/077IM5ambiX6ptIMCtXJv5Reiom
	arZAgw+WXI6wtWzn3Ssbe0MfQaT4M7W31gAqV94VO7XhK7Qqz01JNKQRPK5AUdyw==
X-Received: by 2002:a05:693c:8085:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34cf1818b1fmr7262875eec.1.1790851632033; Thu, 01 Oct 2026
 03:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001042942.109012-1-chenhan0017.work@gmail.com>
In-Reply-To: <20261001042942.109012-1-chenhan0017.work@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Oct 2026 12:46:59 +0200
X-Gm-Features: AclHuK-fHM8iJEVkEzuvz_ovqF_dLYt_Qxw_QJ6A0Z4myKEgiMjsoUcH2rpEiKc
Message-ID: <CANiq72kjGWVk_9hR-gn4vJT-pgBsGWEvThMd9dF6-+GfBZseOA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: make Delta division and remainder fail consistently
To: chenhan <chenhan0017.work@gmail.com>
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com, 
	tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com, 
	sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, tomo@flapping.org, 
	georgeandrout13@gmail.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:29=E2=80=AFAM chenhan <chenhan0017.work@gmail.com>=
 wrote:
>
> commit. Correct the rem_nanos() parameter name to divisor as well.

This seems like it should be a first patch.

> Link: https://github.com/Rust-for-Linux/linux/issues/1254#issuecomment-58=
69573842
> Link: https://github.com/Rust-for-Linux/linux/issues/1254#issuecomment-58=
69925737

The discussion is small enough, so I am not sure why we need the two
Link:s. They can be useful if you want to reference something in
particular, using e.g. the square brackets notation [1] to point to
them.

> On the MIN / -1 safety question: div_s64_rem() computes a quotient even
> though the caller discards it. V1 already checked this input before the C
> call; v2 keeps the guard and makes the representable-quotient condition
> explicit in the SAFETY comment.

Yes, that is fine -- what I meant is that even if we had the check,
the `// SAFETY` comment should still justify why it is not UB (please
see below).

> -            // SAFETY: This function is always safe to call regardless o=
f the input values
> +            // SAFETY: The divisor is non-zero and the quotient is repre=
sentable.

"representable" is a fine way to succinctly put it, but I wonder if it
would be better to just spell the condition.

In any case, safety comment need to explain *why* those conditions are
true, not just re-state them (otherwise, safety comments would be a
repetition of the `# Safety` documentation of the function called, and
thus not useful). In other words, the point is that they explain why
something is supposed to hold.

> -    /// Return `self % dividend` where `dividend` is in nanoseconds.
> +    /// Return `self % divisor`, where `divisor` is a number of nanoseco=
nds.

"a number of" seems to be added spuriously -- please try not to do
unrelated changes, or you do them, please add as new commits (e.g.
this one wouldn't be a fix to backport).

> +    /// The divisor is an [`i32`] because `div_s64_rem()`, used on 32-bi=
t
> +    /// platforms, takes a signed 32-bit divisor. The dividend remains a=
n [`i64`].

Do we need this in the public documentation?

> +    /// Panics if `divisor` is zero, or if `self` represents [`i64::MIN`=
]
> +    /// nanoseconds and `divisor` is `-1`, matching Rust's signed remain=
der
> +    /// operator even though the remainder would be zero.

Not sure if we need the "even though ..." bit.

Thanks!

Cheers,
Miguel
