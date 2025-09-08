Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340030F948
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 18:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757356232; cv=none; b=ItAgyCrwwKD1Zol3yjKDDGqYm4o3Qj/OI/MnR9izT68keRFgPbceVa6eLUWm+oCez3gxid4FnIE+tJeofBzpnYJOLQPyUKV3+Os3/+JY9m4Uezh60YtQ1VBxdBUrDOg7JxxJz0ggJP31zPzKCysnILrraQe/DVP/+K5Y9RhDYjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757356232; c=relaxed/simple;
	bh=jUG/qTOwcqt3yC9mUtQIEdDFh7q46RZ3EeLs17fAC5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqKtx+DhWkjsNoAWsxrk49ATxUFQsfdE5rUbudir+f6bDuniZTudRKA0im3DdiEp9j/uP9TS6iXV3LfSdhn0Jxt/nvFRc/EaA81mri0MrdyIfwhzO6pekreYNQHwNp2l47S0uGwu7tPyGl4Sx28os3WAMe3QdQspIylSsNNbMW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtBtKmaC; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtBtKmaC"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-32b7e7e81f6so354071a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757356230; x=1757961030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUG/qTOwcqt3yC9mUtQIEdDFh7q46RZ3EeLs17fAC5k=;
        b=OtBtKmaCqeWVEvVpgPYnI9n83LiOriysMJ8+FGacHt9BTPkbeWCqtPOGl86Ei24t1U
         LL2evB8CUeU+FKFssj2dHT7f39eEwkVoIyEtXTsTgnxLGCYpeZBww6k2UTNmKqdq8TGZ
         obOYiq3BAeJTT+W6OLCf9Vw2ZgdnXw7jpQG/MGDvkzInwv8mMOX9u5ly1FD/u73oKECj
         3wCpsbxzHndAuq4RIKluL+4I3HQUTvAusHqk1NuN+c4HShxvki3tjDpKioGATkwbRjpE
         gy73lI+7+yFABXXA7p8A679KZJFuPUHP6WX24HGSybIgIRF8LVKgoa74yP4c+uQd0Ayt
         sOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757356230; x=1757961030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUG/qTOwcqt3yC9mUtQIEdDFh7q46RZ3EeLs17fAC5k=;
        b=JnK9bCKz86p7zNY1QxmCAwDzjg6Y3knATUWzpD1MIa6iocvmfaeBWwNz7ouV4D2sL/
         sBb0irKc3J/8yNwgbnH7yWC9fXTCC5dY+CSuyQJg4BQwm5hEX7+CckOJW4cAOHC0JevH
         ojMc5WHniTheg6FiH98XoeNTeBAk8PlrltA0qleotb4el3VMGYiiY4uUBUu7SAOW+vDO
         BdBmhEdbslqiiHoRauquWodr9bzZQBGrxyeXDfpGqS2cwGrq0HijijwxAgzBOoG5o6fJ
         PzMjvtopHy8IwA4dE9g51gEwu57tp/HMDiQRiXe0JMvcmkynlw2oh3txNDEzSgBKHqWE
         sK6w==
X-Gm-Message-State: AOJu0YxNFmnlufa3gfXmWrJG2n7o38H5roAsbzuXMZKitawu/uqru7tQ
	uJgy2IV5g/RP1YKrpnv3NRWX6cAta+lPtA5deszE0bdzX9hl5XSQfeChMAdPLYLDIf0kGEoH+Vh
	t41ujtGwXM01qwUC1d656fgsxJDbQ/Hc=
X-Gm-Gg: ASbGnctdBQuyGzuP4T2hA8+cIkJGSAR7gfrbCZD6cBRhSMBTb94Awi1fH4bFX7pHTwv
	9JRXNxwJpTyzhI+1eGvfBZIeOWax7YVyRWDG6Fexa5teZmbg5SufnVZIogaSOAAr2Oxri5SRZeu
	ZxNI6DJyADA5JsVQv/j+Op3Iuw2Duj/COulrFPOTAWtNdcQHbov+TM2JlV4LFV4KvhzSYqkYhD3
	f71FZpocVBrV6rkxbWAG7SkB4f8LF159cyHW30Sm4rXQyCsToOaT97YIgnZLQ68rn/gTQqyLAT4
	dsp7nIoJUeI0clCN0LdvK0sURQ==
X-Google-Smtp-Source: AGHT+IFYFAtkKVHfkI4g4kFkE1d40Em0cg1+x+GlQODl/28udoQL+FMvsGsvmxW5ZnvLdbzyKFAliPqQrsvAqRpvrZQ=
X-Received: by 2002:a17:90b:38cb:b0:32c:e048:35a6 with SMTP id
 98e67ed59e1d1-32d43f126f8mr6361297a91.1.1757356230052; Mon, 08 Sep 2025
 11:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908125339.3313777-1-vitaly.wool@konsulko.se>
 <CANiq72mekzqaNak+KYxqzxOeKpmNDYPO2bvATw6FkOjHWO1w0w@mail.gmail.com> <99eff662-417c-4adb-b7dc-7f3053a4d616@konsulko.se>
In-Reply-To: <99eff662-417c-4adb-b7dc-7f3053a4d616@konsulko.se>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Sep 2025 20:30:17 +0200
X-Gm-Features: AS18NWBUf3xKIGqgJxhuSkY88RUo_0-BQw4wkowd6tsSsYMjrpMlu-w9nDmqDfc
Message-ID: <CANiq72m480giNVxfsvjGRt1y8RLuPpO-52Z-6xEHrrF-9amGiA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: rbtree: add immutable cursor
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Bjorn Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 6:41=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.se=
> wrote:
>
> Absolutely, I wonder though if I'm supposed to do that only for the code
> I'm adding, or for the whole file, and if the latter is the preferred
> way, if that should be arranged as a 1st patch in a 2 patch series. What
> would you recommend?

Only for the added ones is fine, so no worries. For the older ones,
please feel free to leave a review in the old patch (and/or check if
it needs a rebase or similar).

Thanks a lot!

Cheers,
Miguel
