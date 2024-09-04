Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9CDD529
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Sep 2024 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461519; cv=none; b=EoQwJltYcLJ+qv3GIPBG5BkS3atRT61xAbQptBk8de6MLEPZpH3ZbJFVUPe+b17MN11aSZ2nSV+P++ZQDAOzUMghSMdjg+4adfN/6WeIROIZs+W+EIXbZKThDD2mTfLNEfxP82FBkGP1bU++/8iPSZMvVvf/SdOre5YE4cTTPu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461519; c=relaxed/simple;
	bh=fTcMzEM3kY2M4Wu7inQydguZGW3DdMh82Z4JBMmoWbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oemNxjAJthektz9wZX7H7dmJezkUlAOPh1YePEx2fllOvv7qFDXL2+I1HsHbmkfy2IaWMboONHKSY0fCIFjaTC2kGSpChC7uR7f6c/hzvTfSulNv8opD3mpvzdusTjODZcIX4dJMM1u3vh+m1BeeKkSsd3wzeqy1eTFPz3Hb9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WuimmfVs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WuimmfVs"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374ba78f192so3352594f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Sep 2024 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725461516; x=1726066316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTcMzEM3kY2M4Wu7inQydguZGW3DdMh82Z4JBMmoWbs=;
        b=WuimmfVsFpAlpSKkvdrb8VlvbyZh7ePyK2mQePJLoQcDKSS+MPeOZWYtPLQpnACn0W
         H4mJeuKr3+VuT2npssV5dEO632HqjUKW2YLdpAn6E9V7EQLZPqDrIFnHZMflxXpH9PZv
         cUDfrfXQhq3RMBlATtxN7NWBXR1qsfNzINfE81O3MeYB79+W1UzcDMnsaa3ATx6HgAot
         oRt9/WB7jDf+V3qYBvUoEkGWni3/Rfjc1VuifgeBtPYp/Ps2vAER9nNGwb3lv2xiXXG2
         b4jEJwgiQK69AEBnRsVzIrrjP1qjyJKajTiFaCpW7lvulSuYuZBzFD2f9HgQmV2JToAY
         PFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461516; x=1726066316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTcMzEM3kY2M4Wu7inQydguZGW3DdMh82Z4JBMmoWbs=;
        b=aTPoRoyEKhBe1AnOji+rbKTVhiQOJ9DrASOCY/UIwV/jpOjwSLs2hdZDJSXs5vc4IP
         nknDf9mTw0dLhH5l5m+AK/CUAakW9w7I476kT0Hrll193rVpspHXjihJQj1m2T9RfVtN
         y/pdH+fipi7fCzA8BcMTPM/5kTNOWUgSj3tIc72AXsEsDxWgueYfF0tH4mh2Np6EY9rE
         eOwoJ5Z7TBXLljurf61JDHvKEKxLvdyuNThdE+9IYTdfez1Okuv/aXUR8euPEbAIfZER
         7zWI28s0ttYOgi+Svh2cU6h2XsWjbyJd+3I5oQJTJtu6DAG3JTxP6bL+cWyhSnvTKVz1
         bFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcVYKG23iGIVY4kC7cjsNtrWNL5PWZvhKRDAdlfr0D9sAVcvhvAinD8lX8vaQgSOCDFKo7lxEWvOGdIMj1oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4cXUzX9Y90ngeFem//lHdXwYgwS9oChGMjyL461pM7x/DbCe4
	tV/GGOQLjPyXmJCMQNN72oLlsHB3z4b3Rm7jmnHNKAEpN6LYa2YVZMd2ir4gp03Z2l1hqAh5UL8
	XytHRK3v2t2+qX7IjbLycasJhgqonOC2aqb/f
X-Google-Smtp-Source: AGHT+IFXPAh2KSM2xuEfDScmUTQ5Z1aIkAVoWtDzFq1bPY0Emcyx6SFJqfvHty1VlGwlCi7nvRts08h8nqWzteKFlg4=
X-Received: by 2002:a5d:514c:0:b0:374:bdd7:f848 with SMTP id
 ffacd0b85a97d-376df0055acmr3106240f8f.59.1725461515451; Wed, 04 Sep 2024
 07:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904144229.18592-1-ojeda@kernel.org>
In-Reply-To: <20240904144229.18592-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Sep 2024 16:51:42 +0200
Message-ID: <CAH5fLgizixTZ8nytkSzSLA67+f=zWZZKt8xTJ2BQg5K0ivAAmQ@mail.gmail.com>
Subject: Re: [PATCH] rust: avoid `box_uninit_write` feature
To: Miguel Ojeda <ojeda@kernel.org>, Matt Gilbride <mattgilbride@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:43=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Like commit 0903b9e2a46c ("rust: alloc: eschew
> `Box<MaybeUninit<T>>::write`"), but for the new `rbtree` and `alloc` code=
.
>
> That is, `feature(new_uninit)` [1] got partially stabilized [2]
> for Rust 1.82.0 (expected to be released on 2024-10-17), but it
> did not include `Box<MaybeUninit<T>>::write`, which got split into
> `feature(box_uninit_write)` [3].
>
> To avoid relying on a new unstable feature, rewrite the `write` +
> `assume_init` pair manually.
>
> Link: https://github.com/rust-lang/rust/issues/63291 [1]
> Link: https://github.com/rust-lang/rust/pull/129401 [2]
> Link: https://github.com/rust-lang/rust/issues/129397 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Good catch!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
