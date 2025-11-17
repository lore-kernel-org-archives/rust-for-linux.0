Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879A231E10C
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369982; cv=none; b=fJ6dLY8lIkvYl2FVbbo3mA+dgFkPehIEclad7Ce8ToXF/pOUBZQiqy79thSRATstBQEC0c4O2hFskUK48bW5Wpltvdvrk0s7QqJFMuJ1MDHbq/G36i09BheWb0ZjzJXqnFp5kAGqeUYLO/4XUIMUftNMTg+DlvSqHqOjdX3xfe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369982; c=relaxed/simple;
	bh=UHklK2sJVzuwpfiV5YJa7thtVFe2W7NhFPv/qp/ax3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A5S4vBh03v9hahXpW2dpBS+Rnn1VgI7BzHOSr9gYLUVzKnjF/cI50kQ0YaRj6mwyC1hPT4PYNvKu7Q390tSN6+WJGdzarRatzVYp0PziUzUn0OZbnIikgpBxwPTtjGGmuxIMzWYTvD86OngivpH6voGBO0g8BCq1oE9xEsQhmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dd9WJmhl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dd9WJmhl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-297ec8a6418so4237315ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 00:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763369981; x=1763974781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NI8G5hRo5Xcy2w1s2FH9RTGJKilvh5ojVxdOkrXr3+M=;
        b=Dd9WJmhlOgVlfb6yWkU8b107SP+BCbZLo0zsQSMeizIbi86bQy4MdPgn0m/dbn4NI3
         zHmN65o7uEl++vsQC57taw/JR7r4xvcFJnnHWTi+jdo3E7vpv3p2CWzlutgODmbL1Cad
         PON+KL/FJRksb/uHe8fVBprBA6mHcTDwYy2/tb044vYqKHraAmhlprwPshgftzJp1ekQ
         GPL26mZqXcEYZxp5vUZMFYQSBP0qwY1SCPkHFLOL8BY18Vvfj/V6WQkxMwjHBOc3AINC
         AWFG6Sl+14hvE0QOlaxRqvoS4wMhnllW1iF65GASF5O7nBM1M+NKBEXSGGkQVctPiWTL
         md+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369981; x=1763974781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NI8G5hRo5Xcy2w1s2FH9RTGJKilvh5ojVxdOkrXr3+M=;
        b=SD75EghDFTnaJFYPRgyEmOWaqwSydMVxCO3V1T8M9oaBzBsVS+iPVeoSE7MfmAwWQn
         5lDAsR6/wUyBdtGYxw5H1f8KrdT0qaSasIHAp9vktJGdwoGxJdKN5z4/szinC4M3/xp1
         SgPXWRLPZv70/6VdSl7DjC3sYenyCDi+suZIvDWOJSvGOpkcnh+S9fS9ojInm+DPF9tL
         AndxV8Xv4cSUJ+Mksdf8+dHLKTi5xZCO7UtTg+m87j2vJPN2MoZ66+wCsTS4cOykkfNo
         U13TFq+M+narhhid5m5Xgct5bEYhUmrdEfV7j4ILCVIwp34Wv/PPGUXGBhHVQwyeoYta
         YwDA==
X-Forwarded-Encrypted: i=1; AJvYcCURso6BtlyNNNY6H0w7aCNBmlGTWYJPm0eNb8dTm3GsTT7fsCkatc1yjlzz5iH8RkvwKyRw1c2Wo3oTJ/2/wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIQszI2pEiAP7UmY7ncdrVE526y4jXzRKNCxjcYjcIP3n9siD3
	MTk6hi+8c0uUX5xF4rMKa8b8y0SqcO/IvC9762JSbhdmxRLquLki8VJQb1mf2e1RzEZ9hpjl359
	OBjvj2K7URWbDux/LFfMnLXAhOceY9oQ=
X-Gm-Gg: ASbGncv6UGzzzt9KroWo0tvbuJKzDhWXWYBBpXW8lXmZ7REsnzU7QDwT4jV5mgvzrRV
	n8hgD4/8qtAR6sf5NSOo0fzR8bHqzKPKImz8OnAxcwePG6lyktj5H7H/ckqW5a2b9TbtVG9tr/0
	Az669rPB7qiQB3L5ZLEhf0MUdrLZJAJbXFsZq5ZxeIAyfzSKZWPQ/GNmjN13dtxN+d7jhXwtQPc
	usctQdjXVyCw83HvJ2xaM2rCJBGabB3+L2SisuVYfcvZAv2jPNhR5FmHRvSwZJ/sayXwlKDwza+
	CmgUyYdcWd3RVkjfuY5d0+bhvV/kRUYJWPmdEscsV1pXiEFRpkaA7SopPIGzpYGsSevII85oZp0
	hYQFp9YU2dm/3Duu+hHHnsRvr
X-Google-Smtp-Source: AGHT+IEPFWrKo6uqU7yoap//NUYE+LIF19iTFwlJ1uw2WA+LGKN0FVtTu1nZ5QN80CO86v4R8XCjR4JIpzZpHfuj/uU=
X-Received: by 2002:a05:7022:e0d:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11b493dbc02mr3984278c88.3.1763369980724; Mon, 17 Nov 2025
 00:59:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114140020.327075-2-phasta@kernel.org> <aRc5RVnXe4PGNkt0@google.com>
 <2da1f1588ce8e02831e7bcda569f4e03ce88e4cf.camel@mailbox.org>
In-Reply-To: <2da1f1588ce8e02831e7bcda569f4e03ce88e4cf.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 09:59:27 +0100
X-Gm-Features: AWmQ_bndcpjPPMoSebc_gPqDH79bnKAlPuRhFKoR9eo3nyVDOvYqulWt0gsUw68
Message-ID: <CANiq72kKnYHHi9R62HZcXGhOsWxPEmiVOXTJ9QS=NQMBSQ6KBQ@mail.gmail.com>
Subject: Re: [PATCH] rust: lib: Add necessary unsafes for container_of
To: phasta@kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 9:24=E2=80=AFAM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> OK, so container_of is an unsafe function and all uses of it must be
> guarded by an unsafe block.
>
> If I do this, however
>
> @@ -217,7 +217,7 @@ unsafe fn view_value(me: *mut $crate::list::ListLinks=
<$num>) -> *const Self {
> @@ -242,7 +242,7 @@ unsafe fn post_remove(me: *mut $crate::list::ListLink=
s<$num>) -> *const Self {
>
> then the compiler gets sad again, complaining precisely about the
> internals of container_of:
>
> 269 |               unsafe fn prepare_to_insert(me: *const Self) -> *mut =
$crate::list::ListLinks<$num> {
> 321 |               unsafe fn view_value(links_field: *mut $crate::list::=
ListLinks<$num>) -> *const Self {

Given the signatures above, it seems to me you have done it for 2 out
of 4 of the calls, thus the compiler complains as expected.

Cheers,
Miguel
