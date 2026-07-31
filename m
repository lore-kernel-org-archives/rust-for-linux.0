Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064E329E55
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785500412; cv=pass; b=RJyxXV09bFMcI2zdxznMT5LAAJPt4jiSFgKzooHxf/pr6AYfcsZXBt6EwPuSuUZ1kFte2NLVR3No4n0d9lY9gPZix0sFxtQkcCAIncsFpHVyf2svac19w5WcWej3Q+zjzOxaqfuUKfD1Z2yKjpUskucW5Xvwda085gaZ2N3yUS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785500412; c=relaxed/simple;
	bh=uwjXzGdh19k7FG6OdABi6XdHIDBsohWwS6Mao+vvpCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEDgq61WHEHMLFpHmZuB7gPbudgvUo/NNIDYF7xvm7mBDR1RpLPOYMnhfdHSezWHGZkL5Vev8vkrd4QO31OBalp4+bjWPxaFjmMhzybbTIvVH7JaM51ANqyfUUOSjEzIxYZI4IKdvD5rC+Qh++5SGPshXjcho2dEj3uw/RhehL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJ/Ry1WV; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJ/Ry1WV"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1600d040e4so120387166b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 05:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785500409; cv=none;
        d=google.com; s=arc-20260327;
        b=bHY0ZyL4KXmCM/3CSKY4A4oQBLN+vrgSk31qaiyawVI7oCHk07sdqT9eCyVouitwqL
         570nYrrR4cHZtwtpOS3XMejqCKWsuWQlD4mTTCU+59/1vnMQANJ/GqKBqsz7oPt3zTl/
         Eypj1t3yiG8pxb6WtBWajV3pXHDaCefCjEHchG73Gjyy3ga38NIBmkHibqel71z6lDqp
         ugzRZLNbPsMqryDWK/JWqlikTSg+23fXJa3vDv2mh8eTnXgqZy/k9CIVfniqoCIb3qyq
         qiZz5sW68c78DMdh0TaOACUNAwzjatqboE2d0RNoEgwtlGkBAPOvlu1ubcAq8tpg5656
         U8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uwjXzGdh19k7FG6OdABi6XdHIDBsohWwS6Mao+vvpCk=;
        fh=Xw27GgEfBfnTRO1wWP+u6A9PvlXPAyb3e26nyEOEMcc=;
        b=Mw4RRymUqUSgYxrMEAtj499qMhjHDHAVl6Q1v+TrRVTSclMEHnovXMEFMsoaTP+Mgj
         G5/9gp7w/dKZzhiJkglDNUG1MKQ750EPD442IdKUH09juJrztMQEsogAXzWVh6N1ih2n
         UAhkA1eKH+ViJ6kkq1f76aH+g2q9J/BuCqWjizVdNO3v+qoe3z/rUJHkb+Gpv9a09vlk
         J5opgCq9dhaf6rzbz4FgEqLwKUVeVU6drEtX4aZyPW3PP4c0RK964vAJFSt1QWBPrxWb
         ix4PlAehmAB07x6SDEeNNx5GiqZ3mjzTqkR69eppO1Xio96M2wCK6Of5Sz+bfTvvNlGj
         89UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785500409; x=1786105209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uwjXzGdh19k7FG6OdABi6XdHIDBsohWwS6Mao+vvpCk=;
        b=oJ/Ry1WVyVO7hd2Tf5c6jkuB4vbTrcsMaFsQB0QzHrRFw1np5W9LmOSnBmcCemuUYD
         xJ6upvvevHbyALKZCmtuZ9so9BBGanerwR0lcI5ZN3rvDORG3B6caG242A3Lr57epce1
         mIT2+sBxCqCztDWBNGDt853oCIWNLJVYOJhMJcBRgelhQtcqpZYyyXcd1NVkNwkh62YC
         vpsF1vgP072V1T5chSqwbwk33bvhWHSgnda+pC51cXZgTvNgf5Nb4zY+yyV+QTPTGxkL
         SX9I6mjbUfdmD5Ss3SHy9SoLUTQXKgC3ljdq72SR5e6mHSov7BqjfhWT4VctTjD2yAN6
         /zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785500409; x=1786105209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwjXzGdh19k7FG6OdABi6XdHIDBsohWwS6Mao+vvpCk=;
        b=Ya3Kv1VvmPmHMrzhX8fwMwHMiTRCQsfmh2kLiddFXw0BgdgNXEVAGgQrqrUdRB5Yq7
         +YiPO8kuQBb1A1Vq+tBCxpSybpzU0Zfa/G4nqnXq4Sx7AxrD4pRS5BXkWzZ4tTIj/PVe
         tnzs6uACf28RMKo2D5V/1ipHWlmsuF8WyhVvZGdUCFxRplavQgJSJ31L8ag72OmGdRIA
         yEOCiLBD53pAybax9wUEDasA2TEq197w68F+KjX+b3f5Ojdpmbn/qYhwejKIH3zB3MeM
         hO/xSNPvM7X6TdaNSJU3ncPpVHBZGLZt4q6ODp1cC3xrpugFh3a8QqqqNLkE5E4pbh9M
         NmBA==
X-Forwarded-Encrypted: i=1; AHgh+RrndjtLDAovEDNCYikHFgpHWaWJwH5uIcrwPSenYomyy/hUDelxwtVE1XZuDhOvqPMTANSrUoH626C9xV+mjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlXqo99l2gurT9NSMa/OMvsL+lTMUeYv9HLRBjPI/LwPqNwfr9
	Z6zDEGuD8XI9BQAocD6NiBNWf097dbHsQUUWQQLfSEspTFM4n6VdQ8G8I6a927UZlCTPPC9Ix8W
	Kr/2nR6IWPMYogmRDJxhfwXte/ye/aTowb2r/eNT3
X-Gm-Gg: AR+sD13z0+WVywDW8PCeJsYB33HTn1WquQQYf7w7ztBIl+cjaCz76kfNOXn46lX33T6
	LS5Y3dG+DkMVLWicGlZj31fmGV3HpEgUyZZMxRYo1j8VNedCsulPOruOW3Ug87T4slAQKhJFVDF
	L1zvbSPS0gVhHLpW1f2kkGvkowXrYMrNr7/xo3xqIfFWiO23uyJYawk6Nzz2e1CEBkI+gVs2oGU
	tG//6t0fSgQ09+6kUsTAW5IBSP4D5snuh3sCtIOSdBYuRe64oypK2FspYZe7cIVxJ03O4MkDToD
	ON22MgMy0wfN3GYTB+Cc/HYGEw2faP6JgaM6/0i+6LQkdWAxLO5zpLnDsg4+wh4Hp2shMCaVGJL
	+sYEMj2Z3cDZ1FcO8KNZw0y5DoipjrKqpF9TAcqeP6kl9FlqqWYrtqw==
X-Received: by 2002:a17:907:c715:b0:c16:688c:8781 with SMTP id
 a640c23a62f3a-c1fd36880b1mr103229166b.26.1785500408419; Fri, 31 Jul 2026
 05:20:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
 <2026073148-cushy-mocha-2ecf@gregkh> <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
In-Reply-To: <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 31 Jul 2026 14:19:55 +0200
X-Gm-Features: AUfX_mzK_T73p_AD8nbIwGEBQpbhKorx9lMa-iE_fIgBh-iIEfTa4UMnRuH9z2w
Message-ID: <CAH5fLgjZuKGBX7R4O1fat1s__mR2LHhQWD7tWdz6F_FxECFOGw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Rate limited printing for Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 1:35=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Jul 31, 2026 at 11:06=E2=80=AFAM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > Doesn't apply on my branch anymore, perhaps due to the other binder
> > patches I just accepted?
> >
> > Ideally the rate-limit stuff could go through the rust tree, but that
> > would delay this a release cycle, so I don't mind taking this through
> > char-misc, if someone wants to rebase it yet-again :)
>
> I asked Boqun about it yesterday -- I think he wanted to perhaps take
> the first two patches.
>
> But if we can take all, even better. I was going to pick the first
> three at least this cycle, if no one else was picking anything... :)

It's not too long until the next cycle so going via Rust tree is ok with me=
.

I'd appreciate if at least the first three could go together so we
don't have split it over three release cycles, though.

Alice
