Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF3848C3FF
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808387; cv=pass; b=lxlF8fDxiLZK6G1rYcz4iA/kjujFSYr3h6770EnwmFsCyBFIMK8wP4Aptu91PciVGtv8AJqGGY2vOYR7iDKTZ4hytyXwc1c2WY1KujQRnDnNqb9E4MRcnsHHSaVL9tutScbdMNnLlPViXhSz/do6eE3UeanXTYcejw5JUdbUDyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808387; c=relaxed/simple;
	bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyQYhdajBBscxUlYFnJe9Z+A9LiK3iYoTcnfh/deGhgR7ugDo4sMiR5eh497csC9bC2Z5OnnQRHev4W1PzN+Jyr3jeGBZDWtEd+pyGRLPuQPenHoj3U43W5QkwAsG0oejoqzD4glEIaiUiULw5kDpUG7X4usppk10A6Uyot1Xhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmsDj+Wm; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmsDj+Wm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf110997efso1711435ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Jul 2026 05:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808385; cv=none;
        d=google.com; s=arc-20260327;
        b=R7Rth8hZycncxI1D2ew9iJdQLkMdReE051BZCh3EFe9W43V2epd958NRxY5vkjUfeE
         nA/LsudbM1GRVEsStXnTjfWDZxXulYzNM62iA9wx4wo9Sz2NyfvH3VJ2fLygzL+bL3cm
         /8eLjQFEn+z1lIUYx+CFVGrwudoOWOsIeVtoNHANN6do/2IdzLPX3+3/YMVmqN/Mo+AJ
         xOG1GgdaJ1hNtgyWm+bjcuVC+ZJKV6f31I6Hx+ohn1wEwl4YTCuIKJ6UZwwqERyEDGTj
         8UEpw9cnHDnX8KvRDzQj6Q1hVfK0m8RQ+lh6AijC492xvSE0TVpK6lZr/GmuvBQZoM/i
         7T4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
        fh=masXv1ppMpH25oirK/fQsp+6JnsEcYIEDiGIg/N2baI=;
        b=eDxSeLNaUqauRFYEi6k1foDUk3tf9Xrb3fS5Mm9kgc3/odmfV5yFRRGjWTVWwnzLXZ
         BR8gcVL6PO1BQzPtylVf0RVkeD0cRy12RlzU5VNkIaYLg5O4d3o42hoYnh/2Q2qAK91V
         VaZqGxCbF55uD71YeBYqU5PxCi7PbbD71hASMHZWCKFIOrSYy7deTXwrNSBlMMfAyFGw
         k2ib5nEekpplhL5vr8ubP/li7DNNNroQWjdPxgLhQnxmtpoLXR266oEsIje+Yzc6KF95
         h3INBbpwSsSJr/Ij4J5WxaikD0beT0ajFWVtuT4ex3tBJsTCckCjPgY20uySTRlkWvYb
         INmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784808385; x=1785413185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
        b=MmsDj+WmZJ3amnl9ppOKjrpkUBqFCzk40LcVmzfyH83ZlgPaULSqdIK15a5qHha0vv
         Y0cJ7hIVWICgxK3zyU/UavxLEd3WruPxfo+krEryrN5F8OEq1NcDc7js1SHPJvMoGUcS
         c1UA5pZqZZM6CshwOsShnIKJDtAgoGxzz1r5LYuYJjaD4f1hOt+fnII46X0SBjVvYcYg
         g6RuTvW8pwiz2xlugEMlznC+u+VtDkBsqyjgc+ovKHrTMqhHqd2rVMiVTW3hE86QU3U/
         20cEZZ+ekMHHe77vqhSUT9aSarrpKJyUYgXxTQVlO13gYyw5I2zRTmWOYmjGLISWkqbn
         V0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808385; x=1785413185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
        b=q/uPQ7O9C+NIcdVoKCBmMoYlnWHF6hasyCvpZI7Y6kC7VbN6MqCswQs/UfK79Crhuy
         RuTIycwvekADPeHZSBU6yk1B9bzLssHKdSiLIPDHEH94xuPq5xhvl+UWddK8jwmPpv3t
         Bi/v0wiMYD8I8lXKA+EqeWK4jWTd3zzCBP2ce8gE1pJD7G7XXLA+wTpuZwLNbDIguZrH
         Xn7hkgUSPl7NRZoz/AISeFhSUM8126ygINx2/e1yPbyZKvP2RakI30GyvwBTCM+nP2On
         ghoXIxkSE/SDp0RtvF6gjgVORW2DAo8yLXDtUPJabqU4LF8ttnbnm5Ie7trx5cSLS+zI
         enRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3X8Ewd2cim91sXX0cigBFuS/8L4O54FbX0NNKwsZ6Hm3ErsdHhigiJPcA5cilA+36wNsyYYlHQuoyKueEBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZl4jDog/WmnddA883nz9s6V71B+cccSn1NYyDoVAmIKvgtrJ3
	PnR4e1Sj9VT8CaKi5X0DZzaEmLN29QpqhqKEOUEtYxUBTe7RZEw0vXMGECgObHq+xRyx8BFFiwd
	2a1KyHH3v8Jyt2B6EJo4KfKHQxuFRfKc=
X-Gm-Gg: AR+sD12eaj1USfP5WnCnIgZP/CKDcByIYapYrTbwwkX47leN2FC4/7L0xJIco1tbpl3
	fRdv2Qvh1J19OIWbXP79F9UL5wOw7Mdmi5Xw8dQGOReON7cFB0HdnnSbbYrqEoNdoPHJxJA7zyg
	/fvm710qE/HKwdyPQRubcd04JCn5R7tw4oPWiKVyZRqmOPzbk49VpQ1otis5kpP4gxyRs6e5boz
	hjnLp+HLgAG6KfscsWm8jUfivLgJFElsvt4+PdBRe85Q0EQJgQANHAnLACrz6cdfH9rRQpy603C
	zwQlXMU8Nmz0OIjsEWc/2k/pKhCXbT1js50mexOIs7XmSYagIB0k/1dVYmCxxsIzvjDiDuKCem3
	lN6s25EMAcH4Z
X-Received: by 2002:a17:903:4b2d:b0:2cc:e3b6:f305 with SMTP id
 d9443c01a7336-2cfa6c59d68mr27112065ad.4.1784808385545; Thu, 23 Jul 2026
 05:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722144931.1070312-2-phasta@kernel.org> <20260722144931.1070312-4-phasta@kernel.org>
 <fdcff2949180fa40d0605866fcb306781ddae4cf.camel@nvidia.com> <73981717a8a609013eaca197a41a741c52bff44d.camel@mailbox.org>
In-Reply-To: <73981717a8a609013eaca197a41a741c52bff44d.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jul 2026 14:06:12 +0200
X-Gm-Features: AUfX_mxFlBb9IDtLvxq2VlENXeNPc_YmNc4BAainSjkN3awVvg2ldaZORrjacic
Message-ID: <CANiq72=zQkkQWedVZ-rtCeJBbRxhwNJTLxCBD-6um4OMuFJGGQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] rust: error: Add ECANCELED error code
To: phasta@kernel.org
Cc: Timur Tabi <ttabi@nvidia.com>, "qiang.zhang@linux.dev" <qiang.zhang@linux.dev>, 
	"josh@joshtriplett.org" <josh@joshtriplett.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"delcastillodelarosadaniel@gmail.com" <delcastillodelarosadaniel@gmail.com>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, "adzicmirko97@gmail.com" <adzicmirko97@gmail.com>, 
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "yury.norov@gmail.com" <yury.norov@gmail.com>, 
	"tmgross@umich.edu" <tmgross@umich.edu>, "frederic@kernel.org" <frederic@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, 
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, "boqun@kernel.org" <boqun@kernel.org>, 
	"lossin@kernel.org" <lossin@kernel.org>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	"neeraj.upadhyay@kernel.org" <neeraj.upadhyay@kernel.org>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"tamird@kernel.org" <tamird@kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "lyude@redhat.com" <lyude@redhat.com>, 
	"lina+kernel@asahilina.net" <lina+kernel@asahilina.net>, "ljs@kernel.org" <ljs@kernel.org>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "work@onurozkan.dev" <work@onurozkan.dev>, 
	"urezki@gmail.com" <urezki@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>, 
	"fujita.tomonori@gmail.com" <fujita.tomonori@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 1:56=E2=80=AFPM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> Ok, pulled it in my local branch for now, thx for the heads-up.
>
> I see that your patch is from June. If it lands in drm-rust-next
> soonish I'd simply rebase.

I will take Timur's this cycle, so it should be fine either way.

Cheers,
Miguel
