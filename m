Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA03438BD
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 06:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781071692; cv=pass; b=DWv+uQmIiWv1bpMq926XWUG8XBkitLZ7ZngJAbDxYizi3HFpI6qQPfQfQEnBsRFbO8MXQuLmkNQsp0vRqwkYWFhnUZTRGMO34w9ciWhiD2z3H8QBK+1GbwlSfzTSgEcjhV42WmKmhE6Nl8fVZgM1rFqxurQuvXEFnaZNnVqCatU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781071692; c=relaxed/simple;
	bh=Nph6yCs8a8h8hqSmLg1BRTrpdIlAAjy94jgoxYg+Sd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpSyl6xTOlD9rStx7uuwRpnZnHGjSuurC5tIPO9twie5rsv+1Zx3rXRm8CTQCh1bqhhpD5jQcxkK+aAwtDMpzNaoIUm+sKcSXHnrRgfrrD26h8vDb+G5j00106Lg6iS2Lg0J4QyugtIBFlxGeEKV/0MQ7523mXcw7NoONe6vxWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T04yvRbe; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T04yvRbe"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304e86ecebfso395895eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jun 2026 23:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781071691; cv=none;
        d=google.com; s=arc-20240605;
        b=htDtqywr7MSsCK1Xlh1NZwU65+lo7DlQhRn59umuXY/O6lu0s9TN/7k1iWPq1xDbiI
         2zPrCBOpP2d2p7Ia8+YU4Wo2nnUkZg5UqCOrgJyMcS/WW9x1rmpQ6D6Sc9M4VgHoAh3n
         y8rdb0gGjItf+xYACSzofMwtqcK6gwg98D6Pz2GLh1PWi6z6oGB+W52FSpAglmN9hDlW
         jn4JP1NOrBMf1cIw6+ba1OINU60BKXgBlT0Dbin1HCMRF36C54Bd+XnAgH3U5Y0iwIz/
         TZwYM2FFsjqtctRRXZxSgjdEUNUsew9DEPnOo2CeHbmwiS+Bh5wNCUttDgW/c6QsFcXd
         wv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nph6yCs8a8h8hqSmLg1BRTrpdIlAAjy94jgoxYg+Sd8=;
        fh=7uUkmSTkd6dyWQNMxtrFEVtnjCRx2ZMdqvvJ2rqhgIM=;
        b=EuB2Otgvbdc4PT62bxOZWhOsKSNwkeocJLcLvJmib8wVj/nb1SSvEp0qQn9RJd/yjw
         PBYz94ZdnvE7sjgSoE2Vaw5iFIbhTv5ue2nlqiakNlWhgzZIaKKNRJ8LgmrPI3SEUXLV
         AiImIi1v4zKy3fUQ6khSV5WsXOYX4EtAAnlK66reHYKAAC6P7zdqq/Ywk+aohcwJaZT2
         8tOre4xZqZOXliNc6gPLDTsUbrNbty8wP628SgG/hOuBXKT10c0W/diLH69Qji2YO1CV
         oJV+aynprDQ25kcGk7eu7iAG8nIhg+z0/y//24s+Pyh+Xw4vkbOfzoUZ2uWYLBtUbrRB
         D0Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781071691; x=1781676491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nph6yCs8a8h8hqSmLg1BRTrpdIlAAjy94jgoxYg+Sd8=;
        b=T04yvRbeNVVn1gAtpTbsFbS9i0h1bCj6KJJzhT3/2gLykG1kw6WQPbO9Tl9XEMOKAg
         /V+QrGQWfshq5LiEg3SmFUA7B4SxIxAQe19WIMMdLMuNbk/7RmhUwyPB8U04jchY+XWX
         q9biN4dcbVtqb2fatgk0Z1xCBDu3uc8xblmcABethtQUZlODRE1tZ05e70OgEzHagrPx
         nQ5SfP3GUY1m4xWRSS9WFb38eHqIEB0wgL+UzE1w5qeMrzPP5BpBOV0AGyeaG6egdaLv
         HOK/Nc2KbllSIm1RcRequ8po7algFv3lPFzvti+E23UJKpM3ca6F66e7/F2mwbqyB9+7
         h4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781071691; x=1781676491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nph6yCs8a8h8hqSmLg1BRTrpdIlAAjy94jgoxYg+Sd8=;
        b=pCCKA+mtxuJ065Hk32gj/mZXPSrC7VRWU2Z+ho92axCVWDhNFFfq12STus8QWlMBL3
         cnV/9F78OfxN5FDYpu5THx3LvrCiqWHxADaYB60xj651XUpS/WZ/0ns1OAtOLlhrxxjn
         3bW9QPy2Fu40BrA9HIDoOgo2WA0M+xRNcHNYasYNDh+LXbnGhuTuj7fQU6F4SVeiPFK2
         1+Tdzfa0LtoQUiw32AUt1xE+S4rGZVnYzOV+f9UUGrp+sIz6zk/bWCVJcN46+1QrA0w6
         nILEMvjayTTc3AKubLBX2viEeO4RcMDEDqf+4KkioNA0suLVx+54sU0AOkjD7XmnorjO
         znng==
X-Forwarded-Encrypted: i=1; AFNElJ+SQfKp0PeZgHlmyL72F5tVN9MbvShGzl1WNnXeNpo7gUiOe87HPZOz9gmpQffU0w5sjt5m8/ZBnBkpvRLxQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZYMTIc0m/dYcAX+RGIUCnYLKfaSM+G2hR7a4pysITsHwR16n8
	B+OX7Yh08HxP1bqjOGj2Dm7nxfCTLLD12XZdXzcn69k1sw+haCqnnmUoWW/UtRPO3LVV2+c7L3/
	FWq7FExH+EJN6MMBLzXUmOXrOk4dbqxE=
X-Gm-Gg: Acq92OHyzuISE2zAcl5zkDY0Q4tu0D9uulmCcKf5ZbOx82QBRHFW0edDN8P6la+bK5q
	erIKgImrcADS+1gly8CRFIEAxp8Lq5RfBy6FKqb+wUwqQkuZARJi81eAN57yzzo3LDMtmbDZduE
	o9YmncBrgoD6QQOOaAVPIW5pv7j1j19a1Ujn5VrerGEnYi6eiEm3JAzHGjB8VS+6PxvxTPatMKl
	b0FuEmlu4C3QZBoGrybdLB/gY501pi2jn7hibpAC0TRT1Xjwu2JdwFe8jVCjVVhYLwd9lPlGg7U
	S8jboxosDhFw0Ekk6UqBJ0GEGJogBsmTqIpOX7VlGTmaABdivSAGYtIOxvzC5YiiWXYbfrq2aIK
	1BkQk09xlvyQD/LcZJCWmI+9Q3cH3aKIqgQ==
X-Received: by 2002:a05:7300:3b07:b0:304:9b4b:3b9 with SMTP id
 5a478bee46e88-307d602d73bmr1918732eec.6.1781071690626; Tue, 09 Jun 2026
 23:08:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610035544.3333022-1-georgeandrout13@gmail.com> <20260610054503.27046-1-work@onurozkan.dev>
In-Reply-To: <20260610054503.27046-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 08:07:57 +0200
X-Gm-Features: AVVi8CfKNi6HAFnWE6OY6Sbf_jAhaYM29qAK270UZ8TOOAWOPRWPX8w6iBnSeqs
Message-ID: <CANiq72mVH4NNfyQOESf8uPxZhvbDv0MoQY48Ad6K-yfmXFcY+Q@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: add ownership assertion to Node::add_death
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Georgios Androutsopoulos <georgeandrout13@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 7:45=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> I think having a `debug_assert!` should be fine. That's also your suggest=
ion in
> the GH issue link above.

Yeah, there seems to be confusion about the asserts.

If there were a soundness issue, then an `assert!` may "fix" it, but
it would usually the wrong way to do so, and a `debug_assert!`
wouldn't be a fix it at all.

And for other cases, `assert!` is typically too strong for Linux
(outside const context, tests, special `cfg`s, etc.).

In addition, please consider whether a `pr_warn(_once)!` or similar
may be a good idea to pair with the `debug_assert!`.

Cheers,
Miguel
