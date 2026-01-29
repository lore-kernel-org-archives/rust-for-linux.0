Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CA7274FEB
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700022; cv=pass; b=SmR94CJ0Cc/pIgGl5msK/LXmBetqZnCwvU+zu5hKh3SUZU9ple0zTx7oaqoCdQ2YPPCh1MOlbLzHrJ74YJAxxB4j0FTZn74JBK5B/DHYofFnZQ5BNWiuUCpYkHq3azn6UtztNTczAmcmH4Kztv5LjwfF5QiZygVA6xiQRp1EoeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700022; c=relaxed/simple;
	bh=IZLvhCZKZC06QId3xKvjBRdE6SfdKAgiRYfaFalRpW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYn6WSQEfCQTiKZ0rCH4W0GgsRgwSqnkY7j+KedH/CenEGAqo49u+e28qyGy+1Mrogd/MMwuJQ4H96Fq/b4AjZQW8HzuG4bRqsD7bpNzgpI1KtQAIrwHj5MEuIPZdmF6IrycrayqPXvpimxKiZ7ErwVJjv8qAiPUvQ8P0bLYs+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdDfV2Zb; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdDfV2Zb"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dd6ecef5dso177410e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 07:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769700019; cv=none;
        d=google.com; s=arc-20240605;
        b=TJ9KH6UPh/iiVon/NZnYvtUUgjReYMqmV2QxXq5wxYxxk4ZHUps4Z5aprmr9p8pqX3
         yd1tz7iG74yqt0Tchn2hpZMPK7/PISokfUOJsXscqh/G3+vwKISuPtm+zL0hl2wfToG2
         /C532qSH15QjvZnzTPbsFUJfqANBDm7FvedtXF3tk1vXlenwxQX5NC+yOhxiyeBIbVVr
         itl3hZ1TLxgcxVZpw7eyEL7x65lvN39BQ7+eA+yasbG7IfLxb3dzsA74oP712zczqgUJ
         wkYgVW/omUmpSYW66Q9AI9j7CwYxM86ROH3jWRAl9xPtAmi2USrV3DE8hDPSw3iZPk+W
         c3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IZLvhCZKZC06QId3xKvjBRdE6SfdKAgiRYfaFalRpW4=;
        fh=EVDJb0FHtVZOkrzRjwHcmvSV/5+UNEvI23EpyeRVDuY=;
        b=Znt+3Zga+jhDmcsq4FgwS8xCUrbN6xdhBiHeTSDOKXMvzKUhHg0QU03SJ898dqwB4N
         jjYOhGZQ+K0oQ/ym+U65N8fOviMldeH9A+ufThHEXAEsGUh7rcdmYCCQGP10SlFRj34o
         PU8vJGh2U89uyYt/sxqXx8Gmpulq8r4nRLYmuR728Hd6mEHwrg3AK7SSt4MCERHDsIgR
         osevwlGiVhSfVIablQAO5mjD0lt0V/Ma8+xd0aQmV43OEnxM/fCWSUQrdjlUo4ZRGVjR
         ZqR+eEroBBKG/uIMjzBDRdj4pRzrr+ofCxWuhOH2b50WZlhkNilcQOBoTJkKZ0KPh930
         1b8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769700019; x=1770304819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZLvhCZKZC06QId3xKvjBRdE6SfdKAgiRYfaFalRpW4=;
        b=NdDfV2Zbf8ADOpN5uuj9LZACM+m+5sS1+RBw0hVsTOWJU1pTOBgfgZWdPaHg/dLAd8
         HP15O5GSWyu0NBNNmh8puiztzmWc1Dfp9CgI3iRHQ1xocBKl5iCMu4DItZyzvymUVUu7
         Z4elb55RqLYXSZzQJYH1DlTpU7KTyr6RDpPAUNN1bOTYizxSCvRjIOJDulpfYe25dmZa
         g3wRpBCYAciVdtlT8aZqXVUy350fkraR9BEhHPlw+2vUpKUedjbjoL7YyX1vn7SlXgk+
         fDRMrFOZJNeT1MjYHe2D51VC2hNB8J6TDDRKzg+cRCMdybEt3yZGFPlyyTRiJWcJ+L7d
         dVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769700019; x=1770304819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZLvhCZKZC06QId3xKvjBRdE6SfdKAgiRYfaFalRpW4=;
        b=K/59Ph1JlLQRlfa/11HDm1np5HS0EnJH8qnYu1af3orc6KlpEDfTrPD5oYBgnT7Vo6
         acKDwAeEhdUi8ESDxKcCI43jMvU+YclTXPY/MMA1e5hLLVYm1u/b6NvTP/zLTX4H6uXx
         bwOzju3za7hFuFo98bM1pds6Fgq6IxSePRFhJlvxSwjDgVRTxxc0/BxlHBSG/XzlSA1y
         zfL7dcQheZtZpvt02pXn/Vs6xQ8DEE6AHZ0wWEgiQ15Ecr6HqyDuWdlZ46mZOgbiHsdv
         PQHy+TasIxll9P86LR+kJwzMORlVFvD/IrVdld4mq4JX16PoXXddm3NvyxUgobX0qZkJ
         2gzw==
X-Forwarded-Encrypted: i=1; AJvYcCU1fS7Rlibue3wOZ7TGYNdeqSx9r2SPhrrxVtPKks8GvxOmmWOE8ltjVDD1FOC+GGMZUtfmB173Zdn0wC9ljQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK8ASZezxYYEvDP+UTDmhjdWeOdO8+Q+s6xqyrtZ+GWqkEOdAj
	EJVAY0flMuighfPkZcKHqsy8J0NCSAOWJ06CiYD2ii7QJtaXhpKOBxCD7wIRdcVIXYEqhzViAz4
	SqkQp53E2pjsgKLItpxskni6f8l+DoG0=
X-Gm-Gg: AZuq6aLQmWYadbAdM4HcFwHBhRTbJ3JP9NKiCnYtOVw6xzX/PLMb7L0HP3lfTLZK5+r
	d9FKxy9ieIB+zYdD4oiBWCzkCy8jiYrFAKbFlkRnvTUyXCb0zbZwxh6OdJqnaespIMqn2eq2RBA
	ff4VyB62k0r323QPTTMgDC2aJuOgk+1bYO5zohZ9wteeqxy+H8jOLMENrgvrKkp4D6JQLcj4Zp2
	WB+R6nDvPXzwm0B6ZON4w4gpN0Bpz24K04jf4nDNHPHEOFD0W5yhev96NwQH4v/Fp+4zrjFjJ2k
	EjHKN63KHT/QX2fcKJBMeGKRGdpV2IjHk9Tv4U71uaOHet56uvUo1T985d7M8t7pzw/yH5wbhn1
	D/QDIHJwkBRWP
X-Received: by 2002:a05:6512:140f:b0:59e:13e6:6f1f with SMTP id
 2adb3069b0e04-59e13e66fb5mr141459e87.0.1769700018658; Thu, 29 Jan 2026
 07:20:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-vfs-v1-1-18e3d327cbd7@gmail.com>
 <20260129-erwogen-vorfeld-85a7dd7df060@brauner> <CAJ-ks9=+30hkc7+AJF4Sd7T0+odPtiK4p+XrNyDJUU2rrqOP7g@mail.gmail.com>
In-Reply-To: <CAJ-ks9=+30hkc7+AJF4Sd7T0+odPtiK4p+XrNyDJUU2rrqOP7g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Jan 2026 16:20:01 +0100
X-Gm-Features: AZwV_QhtI1nai9iulKRzjbiJ2v8mEzklhRbqribtH8ZTSgpSql_yloY735wsZpc
Message-ID: <CANiq72m9sG8K6zJWCpG_yMih8KmX-V998e3C0LviWoo5p5ZA1w@mail.gmail.com>
Subject: Re: [PATCH] rust: seq_file: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 4:14=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Thanks Cristian. The commit doesn't seem to exist (with this hash or
> any other, see https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.gi=
t/log/?h=3Dvfs-7.0.misc).
> Is this expected?

Christian may not have pushed the batch yet, given the dates in the reposit=
ory.

Cheers,
Miguel
